Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A23DFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gi/V/YVcp0OVSXhbXGMBsMUecyAjStOar9OIdn+PoBc=; b=WKb2YAVnOZTNnKlgiVj9CA8DLm
	0Yj91VNDGQG/giMIqDx/WdaHNDxp7xiK41lGjqfM6cm8IHfug4rkg0GBRls8/g/KBT3z0v3rUSOfx
	Qg3ZVD2QQbfKERbVUs1ocBgpTeAwZbcF04Fjphz++apO2CFth/m4delslpu/cvodiht9RCt5A1o9y
	KSQTpe1nZgnlltGMBnIOCMWb1VOg3qkur8aQz25VjCXZJbGmFa9rmfXzcjDXcIHiI0gk3+ZuN5kOU
	RoiPg7hWX7nhtxtz+nOzkXi8+Vw/lXOZ46EOaAJ5iPQVrSnuEoJmAucml8gXqGZy9adQp4pY5Y1ic
	nUsIkBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO6b-000000058tt-3aKe;
	Thu, 30 Apr 2026 09:54:49 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO6Y-000000058t0-0dsz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 09:54:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Gi/V/YVcp0OVSXhbXGMBsMUecyAjStOar9OIdn+PoBc=;
	b=FZudsSXC8mYNl/iM3TDH1pbKRxfWY2BWMS834YcDKyNBmIQI4A7CX3mq6e9+tueT88WAgIvJu
	xqK1mQ90qh3DnyzqMnr3uGcWjzyp+2ZDZCRf0lwn1fFFuDgc2C6iPXqC1/XecgiS7rZnHkM6qD9
	5zL8lDoEMwLWrFtw/c07IzQ=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4g5q9L0ZMPz1prPr;
	Thu, 30 Apr 2026 17:48:06 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 56D3C40538;
	Thu, 30 Apr 2026 17:54:36 +0800 (CST)
Received: from [10.67.121.62] (10.67.121.62) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 30 Apr
 2026 17:54:35 +0800
Message-ID: <1b1b1319-2f98-4b5d-85ec-6fc4150b6f85@huawei.com>
Date: Thu, 30 Apr 2026 17:54:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: smp: Do not mark secondary CPUs possible under
 nosmp
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>, <linuxarm@huawei.com>,
	<wangzhi12@huawei.com>
References: <20260423134654.4178271-1-zhangpengjie2@huawei.com>
 <ae9iqdt_qdJRjVZs@arm.com> <49f96032-6027-4c79-8d08-9545261e553f@huawei.com>
From: "zhangpengjie (A)" <zhangpengjie2@huawei.com>
In-Reply-To: <49f96032-6027-4c79-8d08-9545261e553f@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.62]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_025446_836834_1070FC0A 
X-CRM114-Status: GOOD (  16.61  )
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


On 4/30/2026 5:34 PM, zhangpengjie (A) wrote:
>
> On 4/27/2026 9:20 PM, Catalin Marinas wrote:
>> On Thu, Apr 23, 2026 at 09:46:54PM +0800, Pengjie Zhang wrote:
>>> Under nosmp (maxcpus=0), arm64 never brings up secondary CPUs.
>>>
>>> However, arm64 still enumerates firmware-described CPUs during SMP
>>> initialization, which can leave secondary CPUs visible to
>>> for_each_possible_cpu() users even though they never reach the
>>> bringup path in this configuration.
>>>
>>> This is not just a cosmetic mask mismatch: code iterating over
>>> possible CPUs may observe secondary CPU per-CPU state that is never
>>> fully initialized under nosmp.
>> I'm fine with the patch in principle but I fail to see why it is not
>> mostly cosmetic. If we have possible & !present CPUs (there's another
>> thread around cpuhp_smt_enable() to allow this combination on arm64),
>> get_cpu_device() would return NULL and the core code is supposed to
>> handle this. What other per-CPU state should be initialised for a
>> possible CPU but it is not without this patch?
> Yes, possible-but-not-present CPUs are valid in the general hotplug 
> model. The nosmp/maxcpus=0 case is different though: on arm64, 
> smp_prepare_cpus() treats this as a UP-mandated boot and returns 
> before marking secondary CPUs present, so these CPUs are deliberately 
> kept out of the bringup path for this boot. The kind of issue I had in 
> mind was subsystem-owned per-CPU state where iteration follows 
> cpu_possible_mask but the state is populated only from CPU 
> online/probe paths. The CPPC nosmp issue fixed by commit 15eece6c5b05 
> ("ACPI: CPPC: Fix NULL pointer dereference when nosmp is used") was 
> the kind of mismatch I was thinking of, although CPPC itself has 
> already been fixed to use online CPUs where appropriate. I agree the 
> changelog overstates this. I can respin with a toned-down changelog if 
> you prefer.

I'm very sorry, there was an issue with the format above.
I'm reattaching the response below.

Yes, possible-but-not-present CPUs are valid in the general hotplug
model. The nosmp/maxcpus=0 case is different though: on arm64,
smp_prepare_cpus() treats this as a UP-mandated boot and returns before
marking secondary CPUs present, so these CPUs are deliberately kept out of
the bringup path for this boot.

The kind of issue I had in mind was subsystem-owned per-CPU state where
iteration follows cpu_possible_mask but the state is populated only from
CPU online/probe paths. The CPPC nosmp issue fixed by commit 15eece6c5b05
("ACPI: CPPC: Fix NULL pointer dereference when nosmp is used") was the
kind of mismatch I was thinking of, although CPPC itself has already been
fixed to use online CPUs where appropriate.

I agree the changelog overstates this. I can respin with a toned-down
changelog if you prefer.



