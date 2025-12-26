Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B063DE8FDA5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88k627egx0eAHfgEEW0/upasFqEqFwJf9dD4TOMvlnM=; b=TQEv67dvW11O4WwYnNeWk/9FR5
	DxuZTblV3gRzhpRBUn34djgSc5vQUzpy+hbxExRLcEKw/x+QnO5zp6fKHpnerWdxM3970jwFPT1yj
	+HuLG3Rmy4zWqsVGcTHftAuDO8oEscweNxxplzlbORK0z6lVTNy60w8ybjhY9wuiO+lSdU6Q4Lvwq
	yklJmtHctZmdyu7N2ga3C8sizUpkIfNIQ0bCdKlbsF28hFVOm2IOCp1MUwpUcWMWdLVo1Y3kGDjRn
	11hHf7qrNWxzyonMH+GdUX5neC41MknAuV3pt596627Cch/Gy8rs6EAOF+XCH07aH+vWmZj+rFZbl
	FMaiC4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ4m1-000000015m2-2gUY;
	Fri, 26 Dec 2025 10:10:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ4lz-000000015lu-1ZMJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 10:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E656B60122
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 10:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9105DC19421
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766743813;
	bh=UwdDg/vJDXLfJsPqMBXTVvRQ7kiG/4QVTGKgd2G1aQM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UN367BKzngjMxzbnSsud+cdFVYG+xbgUlR717dQL8IGgJ6XpVU8hRSPPYIV43ktYs
	 n9OxcOKpmbRxLs23H5fmt6cTa0L24YDXiYmhoaU5tBBKaS1X3VZAqTSCHBsYPuQmzj
	 VIGkcnai1FaOdOd11OnDPm8ppOk8nAp1/LbQ3ARvK3owogswwPdaNr2udpHgB8oeSD
	 piI8thPEJoCS/cjOnPhyp0b92hJl2WVYCF0bGBhe73t8OlyTpjmm0iBaHLjg17O1mb
	 qZZ5MhzjqCHFUsQhshavikauNk+TZDS1u9RAbD0Ap7G67ABoIesTpOfMYxkaE+iHJ+
	 XQWJYdpfgSwHw==
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so7705246a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 02:10:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMGsXf0JxBQwTjLEsA5w9QcmCPQY82WIpH6jbPQ7OFw4hUBmTtSwVE4LJvfkPpMYJUEF/ukb3ZZoH7YFDU2d34@lists.infradead.org
X-Gm-Message-State: AOJu0YyWR4KRynlbDD1FmL2MEn0b0Ttu6XVBF4QV/cSK3SI2iAlNMeHe
	CPG82iDx4AtvYJhK0pLx9NXbVS/Ta5fG8OXg0TPds5Bb9cidAUdMSLYIF6R5PauSiIghqOZQwA8
	ATOIByDtGacQbnJ/FZLEphabvUPcFDKI=
X-Google-Smtp-Source: AGHT+IFMPUHGcCWsXnH6hVjDphxdKvFV61uRZ7+ZSF8P9bM2PyRMJ+EqfmP3JBcmRs/5dnp6pRsP7bOptzbrNoOr6jY=
X-Received: by 2002:a17:90b:4f91:b0:349:5b1b:78be with SMTP id
 98e67ed59e1d1-34e921b0557mr23396254a91.17.1766743813102; Fri, 26 Dec 2025
 02:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20251223-efi_fix_619-v1-0-e0146b8b9d73@debian.org>
In-Reply-To: <20251223-efi_fix_619-v1-0-e0146b8b9d73@debian.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 26 Dec 2025 11:10:02 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE2rN-erQNnSZ5-CGKWw6fCQ6Hvz-2BU1pn-Vy7ftneQA@mail.gmail.com>
X-Gm-Features: AQt7F2pi64AhAkoQfxWEexPYGpeqDBFCLyEwaxZhaOVOJRaCzCp2dk7zUJsXPCA
Message-ID: <CAMj1kXE2rN-erQNnSZ5-CGKWw6fCQ6Hvz-2BU1pn-Vy7ftneQA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: efi: Fix NULL pointer crash in 6.19-rc2
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	riel@surriel.com, puranjay@kernel.org, usamaarif642@gmail.com, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 23 Dec 2025 at 11:56, Breno Leitao <leitao@debian.org> wrote:
>
> I am seeing the following crash on arm64 with 6.19-rc2 (commit 9448598b22c5
> ("Linux 6.19-rc2"))
>
>         Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8
>
>         Call trace:
>         cap_capable (security/commoncap.c:82 security/commoncap.c:128) (P)
>         security_capable (security/security.c:?)
>         ns_capable_noaudit (kernel/capability.c:342 kernel/capability.c:381)
>         __ptrace_may_access (./include/linux/rcupdate.h:895 kernel/ptrace.c:326)
>         ptrace_may_access (kernel/ptrace.c:353)
>         do_task_stat (fs/proc/array.c:467)
>         proc_tgid_stat (fs/proc/array.c:673)
>         proc_single_show (fs/proc/base.c:803)
>         seq_read_iter (fs/seq_file.c:209)
>         seq_read (./include/linux/ioprio.h:59 ./include/linux/ioprio.h:84 ./include/linux/fs.h:2177 fs/seq_file.c:158)
>         vfs_read (./arch/arm64/include/asm/uaccess.h:46 fs/read_write.c:560)
>         ksys_read (fs/read_write.c:705)
>         __arm64_sys_read (fs/read_write.c:722)
>         invoke_syscall (arch/arm64/kernel/syscall.c:46)
>         el0_svc_common+0x90/0xe0
>         do_el0_svc (arch/arm64/kernel/syscall.c:150)
>         el0_svc (arch/arm64/kernel/entry-common.c:724)
>         el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:743)
>         el0t_64_sync (arch/arm64/kernel/entry.S:596)
>
> This was bissected to commit a5baf582f4 ("arm64/efi: Call EFI runtime services without
> disabling preemption").
>
> After the commit above, it crashes arm64 with a NULL pointer dereference in
> cap_capable() when running below (ocassionally). Unfortunately I still don't
> have a simple reproducer, and it takes about 10 minutes to crash on my systems.
> it always crash with below[1] application.
>
> From my investigation, the root cause is that efi_mm lacks user_ns
> initialization. When kthread_use_mm(&efi_mm) temporarily adopts efi_mm
> for EFI calls, LSM hooks expect mm->user_ns to be valid for credential
> checks. With it being NULL, capability checks crash.
>
> This series contains two patches:
>
> 1. efi: Initialize efi_mm.user_ns to &init_user_ns (the actual fix)
> 2. kthread: Add WARN_ON_ONCE() to catch similar bugs early (RFC)
>
> The second patch is mostly an RFC that adds a warning in
> kthread_use_mm() to detect any mm_struct missing user_ns initialization,
> helping prevent similar NULL pointer crashes in the future.
>
> Link: https://github.com/facebookincubator/below [1]
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Breno Leitao (2):
>       arm64: efi: Fix NULL pointer dereference by initializing user_ns
>       kthread: Warn if mm_struct lacks user_ns in kthread_use_mm()
>

Thanks for the report - I've queued these up in the EFI fixes tree.


>  drivers/firmware/efi/efi.c | 1 +
>  kernel/kthread.c           | 1 +
>  2 files changed, 2 insertions(+)
> ---
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> change-id: 20251223-efi_fix_619-3891ca7d2914
>
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
>
>

