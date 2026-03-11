Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A7C103E2F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZdvbo8+aSNmcL2jbVTJVuFRyW8aRNkhQKn5eTVcQf4=; b=0k+IlWJp4FYT+7El1gRhM8lGaP
	8l/WybAwtKcbnWtFIvUUL5DQoUVIp/Ov3QhrGyiPUYOGKgR0fVbNjyoSAYiQ/R+HIJkNVcTUSTc0x
	RmfbSC8Vh4JPb+0tUVXdeBogZPvqO5bAkeSw0mHKrhNvxLq42H68k4s/OWDvDcBgDTUPMHFybJxme
	HOH20I0WQJWNQA1U108FNukAvVvcgzv4eCYLN6duD73pkAI/oc79JBO4NUVElcLV0RkRzuQWcC/5N
	pbKUHO45kyHBxLE/8aAMjrWj5D92HY7JUf6uIZ1mldVawCcohiI2M9bLUhCpSbd5k3JfyIBrPSbTb
	tAlQ5Mjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SpM-0000000CndU-0d3W;
	Wed, 11 Mar 2026 23:18:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SpK-0000000Cncm-1hiP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8130403E7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852E7C19425
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773271133;
	bh=Mr9POiEHF84Nd6nPxAee/tWtwPmFbTtS72+IImYqkEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aHMu2k+9sRBhcfZ8R1Y9pajwrQr6gjytT0lbe91FVWCEAx/6vRuCdX2PAQkpJQI9r
	 uFfAICXk7vPhcq2kwfIGPqlRDSnmmY1sgx8yxn+wx+r6J2w45yvevOG/eGLem7Zkye
	 9tYcmNrefJsba9GPWSqxiC6n1T1nC/GebuCwz6DDzaPGk7KHyqxMa23OLRN1EDZm5I
	 qqRj3aIfnU4IW5mSNN74xDsqwLFxeWmAHmHg2vUIcYvZjnPWHMAmiwKseC1y3ofR+R
	 u92YB2CiwHfmEJpQcUhL9ZOpUzcrHFbVvGy5uFFL07l3qlVw58q9m1mtK1a6jbM3pt
	 XJqdeYna0ku9w==
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899d6b7b073so5208616d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/tEsPwT3IGfdKO93u8YTP4Q4tSV4yRTDqWndW0yiWzLQ36q0j39SOwXc6THHXUGRQqeGzcK3pLKjI/VP9b70T@lists.infradead.org
X-Gm-Message-State: AOJu0Yw05wxaOMGfN3h2pXjCh+Kp97O+EL0muM4I2+Tzca03bd88bURm
	pXC0MJdDyH1D/Ss0XLNEnTyNzFlh6K7osHZBXeopGDgPCL6CxMP811qYCU6QY2p09TosUehnwtO
	1yTj1nLR4UamC7LTX7EmRo0/MrlDHS1w=
X-Received: by 2002:a05:6214:508c:b0:899:f5a9:be38 with SMTP id
 6a1803df08f44-89a66a85e8dmr55318246d6.47.1773271132658; Wed, 11 Mar 2026
 16:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <697c09ca0a8ffd545aa875e507502f62ad983419.1772681234.git.jpoimboe@kernel.org>
In-Reply-To: <697c09ca0a8ffd545aa875e507502f62ad983419.1772681234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 16:18:40 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6Cyw_z+9sWt5G1XOp94z8BbwNmsoVE9=iM8WQfkuNDBA@mail.gmail.com>
X-Gm-Features: AaiRm53FL9d_HvNQD56UsGUH6aLAV9slp2Y2AiaB_VHX1tlUesyfGAJaIb95vrA
Message-ID: <CAPhsuW6Cyw_z+9sWt5G1XOp94z8BbwNmsoVE9=iM8WQfkuNDBA@mail.gmail.com>
Subject: Re: [PATCH 14/14] klp-build: Support cross-compilation
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_161854_460523_7D37E945 
X-CRM114-Status: GOOD (  16.70  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 4, 2026 at 7:32=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> Add support for cross-compilation.  The user must export ARCH, and
> either CROSS_COMPILE or LLVM.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  scripts/livepatch/klp-build | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
> index 809e198a561d..b6c057e2120f 100755
> --- a/scripts/livepatch/klp-build
> +++ b/scripts/livepatch/klp-build
> @@ -404,6 +404,14 @@ validate_patches() {
>         revert_patches
>  }
>
> +cross_compile_init() {
> +       if [[ -v LLVM ]]; then
> +               OBJCOPY=3Dllvm-objcopy
> +       else
> +               OBJCOPY=3D"${CROSS_COMPILE:-}objcopy"
> +       fi
> +}

Shall we show a specific warning if
  - ARCH is set; and
  - ARCH is not the same as (uname -m); and
  - neither LLVM nor CROSS_COMPILE is set.

Thanks,
Song

