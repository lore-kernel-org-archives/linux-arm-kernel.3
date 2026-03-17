Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E834EFED9F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P08Lme1K7GKyRz34hjPVzJAHPRXZpYuuYbYRAFg9mjE=; b=HsRcZmlBTSIc/EzoHkhAwYrEfo
	QmXefCKQCXUW/KhQ5KdPmg/JGXNz2PZMdeO7wa6bhO4J8Lti+99s42hWQWhpK1I0xMKUVY7Wwq/35
	AfdK4SYlFnRH1577WPoFPmJTpLb24ZeajO7gglZc6qHcDcBgfHnt91fN1kjy31KynyEiyrCpzJaaZ
	em6khFNgy5/hcPIkRAqPtpQoA2bVqayQ7BJDM2vNNculjua1BNMMKS2U4Bf+QvnXonSEA596wSp3Z
	ppmcFQAMg3hIqjXKCxlCodASMJUct+AFSYsVs9KB1LZkFeAP9l7JB8ex807BSdsQTkaXEnl9iN6IV
	pnyWU14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Z3F-000000072ux-2ORd;
	Tue, 17 Mar 2026 18:21:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Z3E-000000072uq-3PNr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA3C360127
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 18:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C69DC2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 18:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773771715;
	bh=sf75n7CEjU21BmUF3XvVzdQKRuDjc/QZKUiZWLivWoM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HKcRrpnFq0OQgkQVHe4gTHn6G+/D4MqldIR9VV6tweATZ+Q92eMc+dGP326WyDhyo
	 32Ubmp06hNjY8SPmHuFWQ2Tu5OKUmVIo7uKy8x961DnXMC54L0swOlUJ/azo0fe8pO
	 TTr+m0FUDtqG1toS3rPVkZ7FwEpj5DCFQmiZ46aZWI+ipAHZgDtPA5Cvp1o0WVANoi
	 /V+Ex4qvmRtcyjRX9GS8HPHWBRuwo1dMuAXkShquJSHX+hNbBLRahqMkZnWdZkttIG
	 KjT0C863L6HeG5Wwz1zzoU7gLAKIs/GLShYu/ekCG8zMdQxUFzvDcoiB7BpowuAToV
	 Am9hm6dBaN5ag==
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89c4468686dso40433766d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:21:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXF7yHxaJuZEsvkWZoyhrvF5Hre6zLdIKevckvKFDgoZQqG7YGEQ2xAy+Cvqkei84Ty69cWOKEotbHD5Gvx7DUk@lists.infradead.org
X-Gm-Message-State: AOJu0YwYAlwlC0wbQNgLMmH9JDPI8whiDdL3MGTEH95gOG6rOxGKDM77
	kJ1/pl1N5i4elBHB+bR2UJmzWqMtnm/ia0sH4ZNAY5DhgwpbgHeXWdcWd5WFehm45cO9l+X32bU
	XjvNd8+XdAeXOETMN2Y+gyXHwPfSez74=
X-Received: by 2002:a05:6214:2a47:b0:89a:502:6055 with SMTP id
 6a1803df08f44-89c6b4f35b5mr8847036d6.24.1773771714566; Tue, 17 Mar 2026
 11:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <697c09ca0a8ffd545aa875e507502f62ad983419.1772681234.git.jpoimboe@kernel.org>
 <CAPhsuW6Cyw_z+9sWt5G1XOp94z8BbwNmsoVE9=iM8WQfkuNDBA@mail.gmail.com>
 <xzezfjfb5uttvmg2divzk3toym3qqvkh5c4w2enamsrku342m3@bogfmdj65wql> <e2yxamlxwif5kxur7thr4x7yp7ppbde6awzm6vomdfkg6auxeq@aaahh3aclf2e>
In-Reply-To: <e2yxamlxwif5kxur7thr4x7yp7ppbde6awzm6vomdfkg6auxeq@aaahh3aclf2e>
From: Song Liu <song@kernel.org>
Date: Tue, 17 Mar 2026 11:21:43 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6SsDTDCJ8-w9OP3FeS2d0Rj6jgP7gYbzD3pZhAmK5nAg@mail.gmail.com>
X-Gm-Features: AaiRm51nRAAg6m2ft7E7fQyeG7Vv3eFOij_rwGjVq5EaQ-JWDRFRn45eJM6ROcw
Message-ID: <CAPhsuW6SsDTDCJ8-w9OP3FeS2d0Rj6jgP7gYbzD3pZhAmK5nAg@mail.gmail.com>
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

On Tue, Mar 17, 2026 at 10:52=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
[...]
> >
> > Yeah, I think that would be a good idea.  Will do that for v2.
>
> So, in general ARCH is complicated.  For example:
>
>  - ARCH=3Darm64 would never match "uname -m" (aarch64)
>  - ARCH=3Di386 would use the same gcc binary (no cross-compiler needed)
>  - I'm sure there are many other edge cases...

Agreed. I haven't worked with i386 for a long time, but I did notice
the arm64 vs. aarch64 difference.

> Instead of a manual error, it may be simpler to just let the build fail
> naturally if the user doesn't set the right ARCH.
>
> Though, I think the check can be improved slightly, as ARCH is a
> reasonably good indicator that cross-compiling is happening.  So I can
> at least add an ARCH check at the beginning like so?
>
> cross_compile_init() {
>         if [[ ! -v ARCH ]]; then
>                 OBJCOPY=3Dobjcopy
>                 return 0
>         fi
>
>         if [[ -v LLVM ]]; then
>                 OBJCOPY=3Dllvm-objcopy
>         else
>                 OBJCOPY=3D"${CROSS_COMPILE:-}objcopy"
>         fi
> }

Do we need ARCH when CROSS_COMPILE is set? I was
under the impression that CROSS_COMPILE doesn't require
ARCH.

Thanks,
Song

