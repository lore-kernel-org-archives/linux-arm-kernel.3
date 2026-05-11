Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC62CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veX7VJ46IgSgUKNX/WHJ2ewSPyOdBWSryG+K6UxBvR4=; b=0hD4fCBJ6VCtAwAbaqbSaTGXpQ
	sYnPs4BisPRfVbGFkHF+7i/LqfLls/p1kr8szLM+RNm8xr7LUOVUFUYpBMik+igJK8VXr9L1XueCk
	XISGmBdgVXOehMJ4DmAKW0y6dyZ9zYBcb3z+RvtqN7gbi+nIfPt/GyTMYcpODTopdi55anheXlrmH
	u5pv/DkGx8ybrrfa3xdqmkQayqT/HKlofuhFusDkBxIrqGFu/k1I4GZ4QRebYA3Px6vLGArwLbDc0
	br7uPz+IGg22aO18UO5tGmrJ0KnxphNmp1FwXUxVKbB8cvVpB4+m+q2lCDYgDVTAj0ulyBD1JbOEM
	1C38tuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUZS-0000000ENnh-2QKj;
	Mon, 11 May 2026 17:37:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUZP-0000000ENmY-10vf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:37:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9A4316A3;
	Mon, 11 May 2026 10:37:21 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 210FE3F85F;
	Mon, 11 May 2026 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778521046; bh=gfaMKAUI2+IeFh0GVFO1ztdIixh18hkmHJSnbfikQG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRvwV0G7NbGQWHllpvk0PTIkmk9O4xsQAKVABIEhTjP/KdrPwIhCw2HAHu192UNzt
	 ztRb7Ins8UmftzIzTXCNq2RwrdwtFhzy0jUxAMzHHJ6fAM5k0HZD52OK1XGZPPJCi3
	 Dp6aNwcAXp6jZIeV5yE6QQNAYPM17oaPZ568I+yc=
Date: Mon, 11 May 2026 18:37:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, punit.agrawal@oss.qualcomm.com,
	rafael.j.wysocki@intel.com, fengchengwen@huawei.com,
	chenl311@chinatelecom.cn, suzuki.poulose@arm.com, maz@kernel.org,
	timothy.hayes@arm.com, lpieralisi@kernel.org,
	mrigendra.chaubey@gmail.com, arnd@arndb.de, sudeep.holla@kernel.org,
	yangyicong@hisilicon.com, jic23@kernel.org, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	james.morse@arm.com
Subject: Re: [PATCH v2] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <agIT0R4KV3YBYjlo@arm.com>
References: <20260427023507.1247418-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427023507.1247418-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_103731_653386_A4634C93 
X-CRM114-Status: GOOD (  13.18  )
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

On Mon, Apr 27, 2026 at 10:35:07AM +0800, Jinjie Ruan wrote:
> On arm64, when booting with `maxcpus` greater than the number of present
> CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
> but have not yet been registered via register_cpu(). Consequently,
> the per-cpu device objects for these CPUs are not yet initialized.
[...]
> Fix this by:
> 
> 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
>    entry before calling set_cpu_present() during SMP initialization.
> 
> 2. Properly managing the present mask in acpi_map_cpu() and
>    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
>    other architectures like x86 and LoongArch.

I had a chat with James earlier and IIUC the decision was to mark all
CPUs present and the GIC must be fully initialised. But digging through
the GICv3 code, I don't see it depending on cpu_present_mask but rather
on the "always on" MADT GICR description. So I think it should be safe
as long as we don't rely on the GICC gicr_base_address. But we should
update Documentation/arch/arm64/cpu-hotplug.rst to no longer state that
all online-capable vCPUs are marked as present by the kernel.

(or maybe I misunderstood all this)

-- 
Catalin

