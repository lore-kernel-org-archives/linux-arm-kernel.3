Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66FFD3B986
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+esQCUO6j2qpruT9yPiJYphPbhB6F0qthumYHWPdlIk=; b=Gw1xGj+ljSfs3HbUv7I9GVuk4R
	h66Q1xNUOD5pFUOYtF6feVZiwnfRXCls/8sowM39kTshzC1As5hbE83BKCd+JgQ/gWO+C/yrPSKS3
	NrTzGfVCkaCr5Z/aO4IhENNQ4syl+DxWIP4k8VSNp2TwWIELXYsCFtraS0JmFSvx7gf6PTcQrrsTG
	XQtpYk4Ll4BbkUzoPio5pvD6iml6ovGxHjg3N3qgQmXLRL5M1hiRJJWU+cCwMB7Oi7SBwPAEaaX4S
	uTidfkXHNE4u0nOEhVwLIsoI7p2wwmW+fh80dCuEPCOJyVG6RAXq0YjZLxkgMdzC73LXYLZFqOgTC
	duayJ7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuBj-0000000AUOw-0BwW;
	Tue, 26 Nov 2024 11:57:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFu9R-0000000ATj3-0XwU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 11:54:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D095D12FC;
	Tue, 26 Nov 2024 03:55:07 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2876E3F58B;
	Tue, 26 Nov 2024 03:54:37 -0800 (PST)
Date: Tue, 26 Nov 2024 11:54:30 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: andre.przywara@arm.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [boot-wrapper v4 0/4] Add Armv8-R AArch64 support
Message-ID: <Z0W24N2vQAbIfYa3@J2N7QTR9R3>
References: <20241017095520.939464-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017095520.939464-1-luca.fancellu@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_035441_209115_B94EDF2A 
X-CRM114-Status: GOOD (  19.45  )
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

Hi Luca,

Sorry for the long delay on this; I've picked up patches 1-3 and pushed
those out, but I have some concerns with the Xen support in patch 4
(which I'll comment on there).

Mark.

On Thu, Oct 17, 2024 at 10:55:16AM +0100, Luca Fancellu wrote:
> Currently, we cannot boot Linux with boot-wrapper on Armv8-R AArch64:
> 1. The Armv8-R AArch64 profile does not support the EL3.
> 2. The Armv8-R AArch64 EL2 only supports a PMSA, which Linux does not
> support. So it's necessary to drop into EL1 before entering the kernel.
> 3. There is no EL2 booting code for Armv8-R AArch64 and no
> configuration for dropping to EL1 in boot-wrapper.
> 
> These patches enable boot-wrapper booting Linux with Armv8-R AArch64.
> 
> This work took inspiration from a serie already present upstream [1].
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210525062509.201464-1-jaxson.han@arm.com/
> 
> Changes from v3:
> - rebase on current master
> - detailed changes on each patch
> Changes from v2:
>  - Now this work is based on this serie:
>    https://patchwork.kernel.org/project/linux-arm-kernel/cover/20240729161501.1806271-1-mark.rutland@arm.com/
>    Given the major rework, dropped every R-by.
> Changes from v1:
>  - Dropped patch 4 regarding GIC changes, it's not needed anymore.
> 
> Luca Fancellu (4):
>   Introduce --with-bw-arch for boot-wrapper compile arch
>   aarch64: Enable Armv8-R EL2 boot
>   aarch64: Implement PSCI for Armv8-R
>   aarch64: Start Xen on Armv8-R at EL2
> 
>  Makefile.am                    |  7 ++-
>  arch/aarch64/boot.S            |  5 ++
>  arch/aarch64/include/asm/cpu.h | 24 ++++++++++
>  arch/aarch64/init.c            | 83 ++++++++++++++++++++++++++++++++--
>  configure.ac                   | 20 ++++++--
>  5 files changed, 130 insertions(+), 9 deletions(-)
> 
> -- 
> 2.34.1
> 

