Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9780010D14A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 11:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvAh52M6pis730l5q8D5EHWXWp5qXG4bsCWjlx9wIeo=; b=i14RxyYhZ1QM4zJvcrw6WHzbfu
	1oLcCfxiZjOG5wnXCk06dOPQ9Z6zK4JareAMTqc9vtj3ICP6KZw4JyQx0YQ58k5qfimiFVXu6wcUO
	1TTzY79bFtHXRQRdQjJ5tShKRU96vGFszCIP0pWL15gbqWeRY86hXjBO1cXzLtR+JG0MMS1ARpu1Q
	AzKsB7LJzIUDxWkRnWD18goy2qb5+b8njFY/hSe17YfRyIAKwhxOj7lvximV48PTq+eVCS5NAWToN
	6T2I24o+7tQ9JE5vzmgG+6JgX1L5bnRx8S1WtjXv//Voq5Vesg7zr6LxuB4DC9dbAXnavKIUHKTBI
	JDVdzB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7B2r-0000000BBKB-0mky;
	Mon, 30 Mar 2026 11:44:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7B2k-0000000BBIn-2CuR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 11:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42AC64433B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE6AC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774871069;
	bh=f4YOF8vt92eNl1mKdqZyMCWyNb3+OoCLLo4tIp4YmMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uRgEIC0OHFTjGnjqpcUzudj5PK0ySwoo0ihbOdzRQr39HpLRTD/b2F2IvmnAy0QMB
	 rMpU3c4qVSq+9B8Y3duAzRNQuULKIQZbB39tqIkx8h89z4P2sZ9eMWiMJ30V3z502w
	 NIF2J7pbUI3fUK3BirFOwUYBzMAggmASC/7WvxLSBKqvpOvo7SunL3gq+bnDoEJUBY
	 /UdVOODG1a06dfavlzYSUXk3tAmWgl7T6tulCQxgzbVEbmMNzTjDANd7cfZfR1sR8j
	 74NgXYv75Qk/gs3G1Y+cluMsPz+Bgmuy8fyQZZ4dv58tGBG5rim27ZzZxmmF48FCKY
	 N6cZh6RtZJ6jQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66c1d3fecb2so140055a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 04:44:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUN//fCQ4yFl2/e8a+rB7bm3PQMT2eG33bSQ4e0hPvx65djh4JjwkleAf688+6XbcNEZtRv2kEGWx9XumQOp/dP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz30/SJYvMWrH0rHn64khavU/VG4WaMnscvm6MjTddWeXoRmEAc
	8p7KOV0mBtCro69EruODFkDBdwkPBvye8QW4aADyJIZXmG36ROjh1VcobSkAwNS0gV22amGDAAP
	eyVWamcJXzSmspCIPeFKmdc5h2Duidg==
X-Received: by 2002:a05:6402:448d:b0:66b:82e6:5355 with SMTP id
 4fb4d7f45d1cf-66b82e65456mr3962353a12.19.1774871067648; Mon, 30 Mar 2026
 04:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260225060347.718905-1-coxu@redhat.com> <20260225060347.718905-4-coxu@redhat.com>
In-Reply-To: <20260225060347.718905-4-coxu@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Mar 2026 06:44:15 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+0w2hGN=Loy=ucHbZcdnn+ty3x9qS4WVX0Vj+g19tfpg@mail.gmail.com>
X-Gm-Features: AQROBzBPVOVlPWkIprh4svfiWPChabJG3_HPxZ8omC63yiiiHstiwFYKcyHWrdY
Message-ID: <CAL_Jsq+0w2hGN=Loy=ucHbZcdnn+ty3x9qS4WVX0Vj+g19tfpg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, 
	Dave Young <dyoung@redhat.com>, Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_044430_676124_3A55F338 
X-CRM114-Status: GOOD (  21.60  )
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

On Wed, Feb 25, 2026 at 12:04=E2=80=AFAM Coiby Xu <coxu@redhat.com> wrote:
>
> CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
> device dump target by addressing two challenges [1],
>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>    machines, a system administrator may not have a chance to enter the
>    password to decrypt the device in kdump initramfs after the 1st kernel
>    crashes
>
>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>    which is quite memory-consuming compared to the limited memory reserve=
d
>    for kdump.
>
> To also enable this feature for ARM64 and PowerPC, the missing piece is
> to let the kdump kernel know where to find the dm-crypt keys which are
> randomly stored in memory reserved for kdump. Introduce a new device
> tree property dmcryptkeys [2] as similar to elfcorehdr to pass the
> memory address of the stored info of dm-crypt keys to the kdump kernel.
> Since this property is only needed by the kdump kernel, it won't be
> exposed to user space.
>
> [1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
> [2] https://github.com/devicetree-org/dt-schema/pull/181
>
> Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Kairui Song <ryncsn@gmail.com>
> Cc: Pingfan Liu <kernelfans@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thomas Staudt <tstaudt@de.ibm.com>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Signed-off-by: Coiby Xu <coxu@redhat.com>
> ---
>  arch/arm64/kernel/machine_kexec_file.c |  4 ++++
>  arch/powerpc/kexec/elf_64.c            |  4 ++++
>  drivers/of/fdt.c                       | 21 +++++++++++++++++++++
>  drivers/of/kexec.c                     | 19 +++++++++++++++++++
>  4 files changed, 48 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

