Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94927C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nse59uKSbhPUMpbFVq/RzvbJFREq8A6NSpxrD2lV2Eo=; b=qejs0UYlbrfgns/YhsrmRRrirh
	qTocnYEpZselinpYzqZQOdCsgymuiaBH4Npk6KsjDjSoPuQI1D71Y89RYZ09UgmhzzrN/+T4EO2Rt
	/UM/ERt+T+VTiDmUjXVYqfo3hlkHWrSQUYV2zmNqWf2AhD4rOLuqU6rp6n/9G+u/DdJI52f4+CujO
	0VeO01fXcbs/YF/wOYhzG47ljkuSb01CFvbIfSTNXMUI/aLatxtyqf20RrFS2jus3b6hqdZiZnAoU
	CPs5XJTOO4JGSqdfgksjQ6BzHsP4HIChVokdvk1KJleTBWmhjPVrpQho1Aj8OsgYQ2Nrvpfi3u1fP
	sAmfeN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYw5-00000000DuY-27CD;
	Sat, 25 Jul 2026 09:44:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYw1-00000000Dtk-46sx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 09:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nse59uKSbhPUMpbFVq/RzvbJFREq8A6NSpxrD2lV2Eo=; b=cSvQdan3pvRVS4EwxQk562Dshw
	JukCR/vsQNXtCHZVrP6c3WX6BreP+S27k+mG2G/aFIplstqFLSUocJAt1UxuDvcBpN7rIRkFJT9iN
	HRf0rOQEA6ONjF9bIGEKTGQpexHi5LkAN2f8I5VUB848skla2PIw/LG4Bz/Ca3rCCEDUcztCtL/RH
	nIclT9+Vt0RnGFSea5LYJfU7EARAVVaPWwU9YFC7UdWqiPa58IOy1B07Co5a6Of16hUWTHOTbJFa2
	S8wOeC+AnF/M52BiKHpmY+ipWCnQcDI68IeTVJNF7yGpEIrZNdqVJq8bwl7ODUa2n/+OUI6U1KgQO
	L6b2iwbw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38466)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wnYvo-000000002ZR-0d1t;
	Sat, 25 Jul 2026 10:44:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wnYvk-000000000Cy-2sNh;
	Sat, 25 Jul 2026 10:44:28 +0100
Date: Sat, 25 Jul 2026 10:44:28 +0100
From: Russell King <linux@armlinux.org.uk>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oleg@redhat.com, wade_farnsworth@mentor.com, will@kernel.org,
	stevenrwalter@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: ptrace: keep ARM_ORIG_r0 consistent with ARM_r0
 after ptrace writes
Message-ID: <amSFfCPV2jWfhGq0@shell.armlinux.org.uk>
References: <20260725091452.1875627-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725091452.1875627-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_024446_309929_525D3D9B 
X-CRM114-Status: GOOD (  16.35  )
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

On Sat, Jul 25, 2026 at 05:14:52PM +0800, Jinjie Ruan wrote:
> When ptrace modifies r0 during a syscall-entry stop via PTRACE_SETREGS or
> PTRACE_POKEUSR, ARM_ORIG_r0 is not updated.  This causes seccomp filters
> and tracepoints to read stale arguments, which disagree with the actual
> value dispatched by the kernel.  This is particularly critical for the
> SECCOMP_RET_TRACE re-evaluation path.
> 
> Fix it by synchronizing ARM_ORIG_r0 after every arch-level ptrace register
> write.  The update safely skips syscall-exit stops (where r0 holds the
> return value) and NO_SYSCALL states to avoid corrupting non-syscall
> contexts. And use ARM_ORIG_r0 in audit_syscall_entry to fix data
> inconsistency with seccomp/tracepoints

ARM_ORIG_r0 is intentionally not always the same as ARM_r0, just as
orig_eax is not always the same as eax in x86. These exist to allow
syscall restart as ARM_r0 / eax will be overwritten when a syscall
returns. I don't see arch/x86/kernel/ptrace.c::putreg32() needing
this kind of fixup, so why does ARM?

ARM_ORIG_r0 is set to the value of ARM_r0 when a syscall is entered,
otherwise it is set to ~0 as for other exception cases, the value is
meaningless (there is no syscall restart in that path.)

If one changes both ARM_ORIG_r0 and ARM_r0 during the syscall exit
path to e.g. -ERESTARTSYS and then raises a signal against the user
program, then is it not possible that do_signal() to then see that
case, and as regs->ARM_ORIG_r0 would now also contain -ERESTARTSYS,
call the syscall with the first argument set to -ERESTARTSYS rather
than the user's actual value?

Userspace has full access to both ARM_r0 and ARM_ORIG_r0, and can
decide what it wants to do in the same way that userspace has
access to eax and orig_eax on x86.

Please check how this is handled on x86.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

