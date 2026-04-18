Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29026F99C89
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 15:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DapRuM5udVveUcJxR+UfWp0c+7OhnQEhRpxl6NRxZQA=; b=C6eTNU+8YuKrp9g4OoJeyjkbr8
	266ALFZ3aVSA4z1dZOefVf5GBHapsmYBM2bqtYTvCJG0fpeCcpCYVT2wDcMgu7Ecly66D65G9Q+No
	q06gs24I7/kjVUg/IAo/74hKuJrxBAZs8IYvMj4N3l34z/J/MG9n6y11xrix/Ep+yvv1sFJlZt06p
	ufbGosekzkfwaTJ/EwpIXbGhNVtzCyuY+IieeulQW3r1HdN7qj4+5ZFOqhgxFa4xdZFD8H9ZZTNJx
	GyuiCWV/KxHYcKrEVu3EEpqagjenY6vkiQyGV+3RJhTtYzlMQPNPIoCQ4ke6RsLxcHBJ7+IL+zJF/
	Zls6wgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE7FE-0000000531R-1QEy;
	Sat, 18 Apr 2026 15:06:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE7FB-00000005316-2Xwk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 15:06:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B4EA1A2D;
	Sat, 18 Apr 2026 08:05:52 -0700 (PDT)
Received: from arm.com (unknown [10.57.88.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E46063F7B4;
	Sat, 18 Apr 2026 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776524758; bh=QjkMgdtnnr6QyAbjVKb3oOqBzdDyc0QvQhg3gnVrWj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbNeVP1CiWfhKFVx05XTZeDzgYuoXzfA3WIb3LiMZkWsdFza6zq6qf104MV8waZWn
	 xllyegoeZz1kyGDCRdtJzmW4W7K393qkMYc1MVLWlbVWI9GNn9+adHsAhexdYJHC53
	 5yb+klqyuMlaDz5PlOdJ0eeZtxZALwnX8rzhnTic=
Date: Sat, 18 Apr 2026 16:05:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: tglx@kernel.org, peterz@infradead.org, sudeep.holla@kernel.org,
	yangyicong@hisilicon.com, dietmar.eggemann@arm.com,
	Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <aeOd0Ndec2rQe2J8@arm.com>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
 <aeNxKpHzTQX4_kId@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeNxKpHzTQX4_kId@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_080601_827024_3C35BD2C 
X-CRM114-Status: GOOD (  16.06  )
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

On Sat, Apr 18, 2026 at 12:55:22PM +0100, Catalin Marinas wrote:
> On Fri, Apr 17, 2026 at 03:55:34PM +0800, Jinjie Ruan wrote:
> > When booting with `maxcpus` greater than the number of present CPUs (e.g.,
> > QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present' but have not
> > yet been registered via register_cpu(). Consequently, the per-cpu device
> > objects for these CPUs are not yet initialized.
[...]
> Another option would have been to avoid marking such CPUs present but I
> think this will break other things. Yet another option is to register
> all CPU devices even if they never come up (like maxcpus greater than
> actual CPUs).

Something like below, untested (and I don't claim I properly understand
this code; just lots of tokens used trying to make sense of it ;))

------------------------8<-------------------------
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index a9d884fd1d00..4c0a5ed906ea 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -448,12 +448,14 @@ int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 apci_id,
 		return *pcpu;
 	}
 
+	set_cpu_present(*pcpu, true);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_map_cpu);
 
 int acpi_unmap_cpu(int cpu)
 {
+	set_cpu_present(cpu, false);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_unmap_cpu);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..751a74d997e1 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -510,8 +510,10 @@ int arch_register_cpu(int cpu)
 	struct cpu *c = &per_cpu(cpu_devices, cpu);
 
 	if (!acpi_disabled && !acpi_handle &&
-	    IS_ENABLED(CONFIG_ACPI_HOTPLUG_CPU))
+	    IS_ENABLED(CONFIG_ACPI_HOTPLUG_CPU)) {
+		set_cpu_present(cpu, false);
 		return -EPROBE_DEFER;
+	}
 
 #ifdef CONFIG_ACPI_HOTPLUG_CPU
 	/* For now block anything that looks like physical CPU Hotplug */

