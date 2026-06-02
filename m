Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5DDCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f3zx5C/sVnQ2w/FOxbtuszEnPOgGK2c9YD7zpg3Vck=; b=A8op24zTORyEha6H4h+3fks6fi
	Uv0rAj0scg2XrUq4QTZWk0B3kqvjFPZBIJsQmkFH8ghq8b3m7yfZPxC34lTqURt5MWFmUEYXCwqQ6
	W4Akz/oiIIrCxCa0kAGLKPGinPlqFEHMboWr1Ysq1xzaetfCg9AydjZxSr7cox2WjzBoe2wZvzsIv
	FtFspeJlLXiXx1zvRS8BBS1Vq0X3c2flgWsojf23aDnznMBW0nSuemgOhQ5OFe//PzfkhV2XJSER/
	8S2shEloF0L3IKj4csRwi6VHeKOON6HArPL0A9JEZusYWLL6YY7smA2KCGyaxNjVaj6flWKerhpjH
	Xr8RmXOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMzg-0000000Cr22-1YwQ;
	Tue, 02 Jun 2026 11:09:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMzd-0000000Cr1V-15Ld
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:09:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C50143E45;
	Tue,  2 Jun 2026 11:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6500F1F00893;
	Tue,  2 Jun 2026 11:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780398548;
	bh=0f3zx5C/sVnQ2w/FOxbtuszEnPOgGK2c9YD7zpg3Vck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d93wfmpGFItoK4y4E1K0EN7pxhe9fUIcYCLDyTFrOsva+C9amXA0LqBIzM7olJQDs
	 vAjfLTR0AaQ3sVqls11K6QSoJTRL8Re+QKWvdVQWZtFyvBZ3IMSvZg3QQqc70eb3wt
	 690dzSX5UtUGQZN3gOV8CGs/cDgLWQQh5XO0dz0JmJZxML6juJmO8Xk6srPF/vhSE3
	 SaSRPSXSTKxvTBRqVy+opTc5wCGQj9pfFXlJe903qI6G1sJSce8qSgtTR1hsRsXDPE
	 5yyHOfUGmARNUmj6QsuIpBipluEkdcX+681Ig121xjJHtU4UOdrlmFAd8V0AkfWLvU
	 bi8d0aVdwEEWg==
Date: Tue, 2 Jun 2026 12:09:01 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, corbet@lwn.net, skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com, jic23@kernel.org,
	osama.abdelkader@gmail.com, chenl311@chinatelecom.cn,
	fengchengwen@huawei.com, suzuki.poulose@arm.com, maz@kernel.org,
	lpieralisi@kernel.org, timothy.hayes@arm.com,
	sascha.bischoff@arm.com, arnd@arndb.de, mrigendra.chaubey@gmail.com,
	pierre.gondois@arm.com, dietmar.eggemann@arm.com,
	yangyicong@hisilicon.com, sudeep.holla@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <ah65zXlOH6a9geD9@willie-the-truck>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520022023.126670-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_040909_339016_753A673C 
X-CRM114-Status: GOOD (  17.57  )
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

On Wed, May 20, 2026 at 10:20:23AM +0800, Jinjie Ruan wrote:
> On arm64, when booting with `maxcpus` greater than the number of present
> CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
> but have not yet been registered via register_cpu(). Consequently,
> the per-cpu device objects for these CPUs are not yet initialized.
> 
> In cpuhp_smt_enable(), the code iterates over all present CPUs. Calling
> _cpu_up() for these unregistered CPUs eventually leads to
> sysfs_create_group() being called with a NULL kobject (or a kobject
> without a directory), triggering the following warning in
> fs/sysfs/group.c:
> 
> 	if (WARN_ON(!kobj || (!update && !kobj->sd)))
> 		return -EINVAL;
> 
> When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
> enumerated CPUs as "present" regardless of their status in the MADT. This
> causes issues with SMT hotplug control. For instance, with QEMU's
> "-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
> follows: the first four CPUs are marked Enabled while the remaining four
> are marked Online Capable to support potential hot-plugging.
> 
> Fix this by:
> 
> 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
>    entry before calling set_cpu_present() during SMP initialization.
> 
> 2. Properly managing the present mask in acpi_map_cpu() and
>    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
>    other architectures like x86 and LoongArch.
> 
> 3. Update the arm64 CPU hotplug documentation to no longer state that all
>    online-capable vCPUs are marked as present by the kernel at boot time.
> 
> This ensures that only physically available or explicitly enabled CPUs
> are in the present mask, keeping the SMT control logic consistent with
> the actual hardware state.

Please can you check the Sashiko review comment?

https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com

Cheers,

Will

