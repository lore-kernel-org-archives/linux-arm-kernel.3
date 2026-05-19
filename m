Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91B6CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1JT7VQxeL29+vLf+spih2BhEkD13clNDfsZcECdHjA=; b=FAumc4WhZ9C8YiPRYfKBGceTlP
	YJkPm5msb9or1uCL/QgTLXT5ftOK4krh+j+dN1qbBz6TEK2PMm2CQ5khjJ8sqHkwi6QhkOANMjp8v
	6oYgfeZ2qL2a6JUafobMFAkLUSZpQ85LsXsn+kV/GeDtw1besM880bP++WKYCtV50JbdI6W5wAMY/
	2Y1fo5WU/bxR8aEWxZVKT4QTg6SVk+Vm6hhz8W6+tBFkb3yc68rfCNvQD0ZREGqf310aNLjLe3jLd
	D7Z+GD8SKNFco1RFWkxJuiIL+bfEYlLdFMs3QPqQNMFoe50Jm3WMjLy/wHnAefIQzBBhSUWrFho9d
	p4ydrF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPK00-00000001Yhi-1QNY;
	Tue, 19 May 2026 12:56:40 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJzq-00000001Yd3-3WSW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:56:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=V1JT7VQxeL29+vLf+spih2BhEkD13clNDfsZcECdHjA=;
	b=fLORaE3ui0SETO+3P7jPPcdwEnnI4636J27EEqplAndJr2kkh+uspS5QFm1zz/eBqpN/c0ci5
	eMcTdD1RsmcD0FUrdpeBfoSEWbmhfZ75wvpwDufMmFE4OjhkIJZ8AzMKC3gFOs+HVT76dUvLlJl
	mBoc1ueH5w7yy9eyWG7AsAQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gKZGr3P5xz1prLY;
	Tue, 19 May 2026 20:48:36 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D20CC4048F;
	Tue, 19 May 2026 20:56:19 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 May 2026 20:56:18 +0800
Message-ID: <0079639f-5ea4-4aea-b002-e13750f87d87@huawei.com>
Date: Tue, 19 May 2026 20:56:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
CC: <punit.agrawal@oss.qualcomm.com>, <rafael.j.wysocki@intel.com>,
	<fengchengwen@huawei.com>, <chenl311@chinatelecom.cn>,
	<suzuki.poulose@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<sudeep.holla@kernel.org>, <yangyicong@hisilicon.com>, <jic23@kernel.org>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>
References: <20260427023507.1247418-1-ruanjinjie@huawei.com>
 <agIT0R4KV3YBYjlo@arm.com> <agxcF1bzmErb_lB9@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <agxcF1bzmErb_lB9@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_055631_357286_ED63DA01 
X-CRM114-Status: GOOD (  15.11  )
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



On 5/19/2026 8:48 PM, Will Deacon wrote:
> On Mon, May 11, 2026 at 06:37:21PM +0100, Catalin Marinas wrote:
>> On Mon, Apr 27, 2026 at 10:35:07AM +0800, Jinjie Ruan wrote:
>>> On arm64, when booting with `maxcpus` greater than the number of present
>>> CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
>>> but have not yet been registered via register_cpu(). Consequently,
>>> the per-cpu device objects for these CPUs are not yet initialized.
>> [...]
>>> Fix this by:
>>>
>>> 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
>>>    entry before calling set_cpu_present() during SMP initialization.
>>>
>>> 2. Properly managing the present mask in acpi_map_cpu() and
>>>    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
>>>    other architectures like x86 and LoongArch.
>>
>> I had a chat with James earlier and IIUC the decision was to mark all
>> CPUs present and the GIC must be fully initialised. But digging through
>> the GICv3 code, I don't see it depending on cpu_present_mask but rather
>> on the "always on" MADT GICR description. So I think it should be safe
>> as long as we don't rely on the GICC gicr_base_address. But we should
>> update Documentation/arch/arm64/cpu-hotplug.rst to no longer state that
>> all online-capable vCPUs are marked as present by the kernel.
>>
>> (or maybe I misunderstood all this)
> 
> Jinjie, do you plan to respin with a documentation update as per
> Catalin's comment above?

Ah, sorry, I will definitely include this change in the next version soon.

Thanks,
Jinjie

> 
> Will
> 


