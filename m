Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDB8CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 12:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z96Le6Wr6hAPTPEul1Uv+AT7vdYuxP94Kb+DjA8ebE=; b=RmBX9Uy/0E7v5nGGPwq53sfEk9
	jVlZAuPNaKWeDAh6GfNP6Lo1yUcmd6HDyNIugzCacGkrlNeU+3ATuMrvlRtv/zCNNmsa11beXofQn
	33k2A9GkQSLStTBuUmqBsOQ2HeF1O0zdJVSsIByPk2z1/ZySHfo3DZTZ6OakcOSIXNSaLIJy5pK7A
	Q3LzqKZtison/L+KtG585XCMjfCcuW3ET6vVE1jCO73ifAP0eEjPIykUTWynZzlNPhH+nLwjPuLAp
	6GJeMmntiXAB1XzrIhdIZ3adguJ3Y+zyZE74gYop6ctyHNmWX9vyRk50aellas8qCVYkB5eRtX/pp
	V2lxTd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMWr-00000007jqP-49pp;
	Wed, 24 Jun 2026 12:16:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMWr-00000007jqF-29GR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 12:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DEA460213;
	Wed, 24 Jun 2026 12:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2461F000E9;
	Wed, 24 Jun 2026 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782303388;
	bh=9z96Le6Wr6hAPTPEul1Uv+AT7vdYuxP94Kb+DjA8ebE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AMxrkXFljXFj71xEXhEKjZUDvN/1XAMtwpN651XSVLB14l2PO3nPqdgfpG6ll4Cw1
	 tee9eGxag7vSF4qpBfzOLw/BWz1LFiSHPMyZ5R4abHDBUEWu6NXt4moX/MVQI0CHqq
	 K4/qOwjyUDmZ8gt9q3G80bP9wz7GChssjWXUVxilKjJM6HqTqIsFsKIv8ijEbLwKdb
	 I6oO3E9C+wqxuAAip686M9CW0Mjd08umuSWVHD37ZZV+i3vDL8zJ1w9fORblxjRGDA
	 lyCAxELWsh89rdQbrmgkskKa1p4/C15RDq4rnUyliEuLMP8bcohIkLGtypLR4AOdNj
	 D7pZ1PIQzigiw==
Date: Wed, 24 Jun 2026 13:16:16 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <ajvKkLw5bL-FT5JC@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
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

On Wed, Jun 24, 2026 at 05:25:25PM +0800, Jinjie Ruan wrote:
> Support for parallel secondary CPU bringup is already utilized by x86,
> MIPS, and RISC-V. This patch brings this capability to the arm64
> architecture.
> 
> Introduce CONFIG_HOTPLUG_PARALLEL_SMT to avoid primary SMT threads
> to boot first constraint.
> 
> And add a 'cpu' parameter to update_cpu_boot_status() to allow updating
> the boot status at a per-CPU granularity during parallel bringup.
> 
> Rework the global `secondary_data` and `__early_cpu_boot_status` accessed
> during early boot into per-CPU arrays to allow secondary CPUs to boot
> in parallel.
> 
> And reuse `__cpu_logical_map` array in the early boot code in head.S
> to resolve each secondary CPU's logical ID concurrently.
> 
> This series includes a subset of the refactoring patches proposed
> by Will Deacon, with further adjustments.

Sheesh, Jinjie, what are you doing?

I said yesterday that I would dust off the old series after the merge
window:

  https://lore.kernel.org/all/ajqYaklhIyvaNLlk@willie-the-truck/

"Please just give me a week or so to rebase my changes and send them out
 for discussion"

but instead, you've posted patches from me that are missing a bunch of
fixes that need to be folded back in:

  https://web.git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=2d5b8df5d4e2bbc142e3b4f21cabbca96e3da79d

so now you're asking people to review incomplete patches from somebody
else.

Please just give me the time I asked for. If you want to help out in the
meantime, there are plenty of patches that need reviewing...

Will

