Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A4BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+R7WMFr8J5p1lUpd7cHc5bxsSxLWD66PUoHsVuNxldQ=; b=5BIOayS/sbpkiYHGwT/pffCOT/
	r3e589cEtY1qwOeZTA4mHOjMl50XwXjnWdrfj9tGSX34qomaxutbVkuYiOf1x9rWQCQnUrDAvTnHm
	ZuZ+3Lozl4qTKvNqDyNJX1IzsL6ynvXgMYGlzagj90PjsOLodpuAa+bK3Ag/yYoaot0eo86Zj0QOV
	ILrqvUrmB2ZxdkiftVuLCsm7Ui/M8ua54fZXVDxIhhFYIJCMOqJ6QO4eTgAkkepvmtpR+IJ1H5i1k
	bNmAwJTKYelOcJbNmsCeQbmOcGwb8fuCVuxm3S+rjQwrDhKjSso1/kb/Aes0jp1OrQm1dIL6gr3MX
	KHcDCYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVQO-0000000GO2s-1v9r;
	Wed, 11 Dec 2024 22:43:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGW-0000000GKyZ-2Cub;
	Wed, 11 Dec 2024 22:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+R7WMFr8J5p1lUpd7cHc5bxsSxLWD66PUoHsVuNxldQ=; b=belfRK6u2P3t3ZGjFmMKk46h4S
	w/6rN5DTrezogT+yqChmeqUlJE1ojSODVpuhivpJ+p2ZmULb6tAzJ09oD1zqOiVf5lZga5Fzark8q
	WUcK4bZFGgA2ZT1YGkdc+5vMaqOvKlRle7r5/1IoEGyBrwE27C5DsVRVth39Cs6k20kf4KefXmnmZ
	DLW/KcOi4BO0rWK6jVJRQLi3AHnYqimjVm7TCvdNmQkzdFKnAo6pl03PM1iqq+aQ37/2kI/k2plO3
	BI25Jh+Q7cOYmGZeosZJBelz9qAsHb4Gsk0p9hxFgdglOaeoVveg/w3G6fS184A+hF/sIYfLBniTu
	J7g7ivdQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGQ-00000003t24-3dda;
	Wed, 11 Dec 2024 22:33:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 249745C67E5;
	Wed, 11 Dec 2024 22:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A09FC4CED3;
	Wed, 11 Dec 2024 22:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956376;
	bh=1MJ06IwhKiUOka6t13pDPzzxerzMi81atHP/6c9+22c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hia/ijUEuZBroxj7nHTcTLUeY0lUzwbIDShfmCnvrhgwkWkpcTiJx7pJ1rDHrcbYd
	 v9xc5XYWsKCanEQ84GJFDJY00b2HgNbwArL4F0yC9b3PGcwDDt8RjKLjKLEhKLhhcd
	 fmxIfg3UO49ThB7NCaSOMylOZeYdgxA9dXMqt5Zh24qGuiC5PnXYEzmSSsUEGzlsGM
	 QIuCwUtbYZSKHZWQsPR/5JQlLYffzh4qHAuBe3D1CDOd8aIWP34Q5xS6MsQDi3t00y
	 2Sa/0R/Urbix0SVQmgQhhgfeqd/s3orjw+NRpayKDn0m9Fbd2FqUvFGpLePlE4DJR6
	 KkGTKHdygfE8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710A8380A965;
	Wed, 11 Dec 2024 22:33:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395639200.1729195.15576952837564128066.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:12 +0000
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, guoren@kernel.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux@armlinux.org.uk, chenhuacai@kernel.org, kernel@xen0n.name,
 tytso@mit.edu, Jason@zx2c4.com, tsbogend@alpha.franken.de,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 vincenzo.frascino@arm.com, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 namcao@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_223304_128528_9A87B621 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Thu, 10 Oct 2024 09:01:02 +0200 you wrote:
> Historically each architecture defined their own datapage to store the
> VDSO data. This stands in contrast to the generic nature of the VDSO
> code itself.
> We plan to introduce a generic framework for the management of the VDSO
> data storage that can be used by all architectures and which works
> together with the existing generic VDSO code.
> 
> [...]

Here is the summary with links:
  - [01/28] csky/vdso: Remove gettimeofday() and friends from VDSO
    (no matching commit)
  - [02/28] csky/vdso: Remove arch_vma_name()
    (no matching commit)
  - [03/28] s390/vdso: Drop LBASE_VDSO
    (no matching commit)
  - [04/28] arm64: vdso: Drop LBASE_VDSO
    (no matching commit)
  - [05/28] arm64: vdso: Use only one single vvar mapping
    (no matching commit)
  - [06/28] riscv: vdso: Use only one single vvar mapping
    https://git.kernel.org/riscv/c/d34b60752fcb
  - [07/28] arm: vdso: Remove assembly for datapage access
    (no matching commit)
  - [08/28] LoongArch: vDSO: Use vdso/datapage.h to access vDSO data
    (no matching commit)
  - [09/28] MIPS: vdso: Avoid name conflict around "vdso_data"
    (no matching commit)
  - [10/28] x86/mm/mmap: Remove arch_vma_name()
    (no matching commit)
  - [11/28] x86: vdso: Use __arch_get_vdso_data() to access vdso data
    (no matching commit)
  - [12/28] x86: vdso: Place vdso_data at beginning of vvar page
    (no matching commit)
  - [13/28] x86: vdso: Access rng data from kernel without vvar
    (no matching commit)
  - [14/28] x86: vdso: Allocate vvar page from C code
    (no matching commit)
  - [15/28] x86: vdso: Access timens vdso data without vvar.h
    (no matching commit)
  - [16/28] x86: vdso: Access rng vdso data without vvar.h
    (no matching commit)
  - [17/28] x86: vdso: Move the rng offset to vsyscall.h
    (no matching commit)
  - [18/28] x86: vdso: Access vdso data without vvar.h
    (no matching commit)
  - [19/28] x86: vdso: Delete vvar.h
    (no matching commit)
  - [20/28] x86: vdso: Split virtual clock pages into dedicated mapping
    (no matching commit)
  - [21/28] powerpc: vdso: Remove offset comment from 32bit vdso_arch_data
    (no matching commit)
  - [22/28] powerpc: procfs: Propagate error of remap_pfn_range()
    (no matching commit)
  - [23/28] powerpc/pseries/lparcfg: Fix printing of system_active_processors
    (no matching commit)
  - [24/28] powerpc/pseries/lparcfg: Use num_possible_cpus() for potential processors
    (no matching commit)
  - [25/28] powerpc: Add kconfig option for the systemcfg page
    (no matching commit)
  - [26/28] powerpc: Split systemcfg data out of vdso data page
    (no matching commit)
  - [27/28] powerpc: Split systemcfg struct definitions out from vdso
    (no matching commit)
  - [28/28] vdso: Rename struct arch_vdso_data to arch_vdso_time_data
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



