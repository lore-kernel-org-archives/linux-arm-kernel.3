Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC1BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fhg8pQ8rxXbZHFXoJmw5Fq/KeJI7fIRrrkp2ZTbbIvo=; b=zM7+Ymv8rhgBav6kRdSILtMBQ0
	HD32VucRJyNWGCE6KWLympSBjZaitzPiH2g7SG61imjx/7EYJJTWj/fM7MEteiKfxA2Z2cVzE2q4v
	KnHYQzCVmAJbotiZ2jDXb4yT1eePHVG5X0IJn7bVfHgLfXwhRW6ocBeokxBQ6m2caMHO5MdDXYmmy
	orP/DlV3cSkVrsJjm+FJcNvtgN4nKCtPvUMX2YGGNav0QcDv1G3J4ovnb+Q43fVuTnLeFzE41pgFl
	sv3jOvt+mxxNr4Yoawb91rYJuTa6Il/yBjm+wnvmvE7218BMP9vQz1QsgLUJsP4ivcEfZyB8PSqMn
	DlUa0fiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAfi-00000008JwP-00AL;
	Mon, 13 Jul 2026 07:01:46 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAff-00000008Jw1-0p7d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:01:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Fhg8pQ8rxXbZHFXoJmw5Fq/KeJI7fIRrrkp2ZTbbIvo=;
	b=JVNYHK2jM08UNaWD5mgvFDgWVj0oqRQaqI6AsuUKOAGybL66tYiDz8m/znesRDY4Rx98vheao
	OOpbjPtu6My1ESyoIlMLmgBZiR708ksX7q1z2arPOoFzNVKZqdg0c2zAA4GkiJ/S6N8nI69IIpT
	iuoWLDFfYLn3Pu7t+qCUNVQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gzCmr4fXNzpTHW;
	Mon, 13 Jul 2026 14:52:44 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 8132340561;
	Mon, 13 Jul 2026 15:01:33 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 dggpemf500013.china.huawei.com (7.185.36.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 15:01:32 +0800
Message-ID: <697a78bb-6cbf-4484-adfa-fdffe5bb0180@huawei.com>
Date: Mon, 13 Jul 2026 15:01:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] irqchip/gic-v3-its: enable dynamic MSI-X
 allocation
To: Thomas Gleixner <tglx@kernel.org>, <lpieralisi@kernel.org>,
	<maz@kernel.org>, <alex@shazbot.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<liuyonglong@huawei.com>, <wangzhou1@hisilicon.com>, <linuxarm@huawei.com>
References: <20260711022015.3049867-1-yangjinqian1@huawei.com>
 <877bn1qn3p.ffs@fw13>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <877bn1qn3p.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_000143_613175_AFCFBBA7 
X-CRM114-Status: GOOD (  15.27  )
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

Hi,

On 2026/7/12 4:37, Thomas Gleixner wrote:
> On Sat, Jul 11 2026 at 10:20, Jinqian Yang wrote:
>> On ARM64 platforms with GICv3 ITS, VFIO PCI passthrough currently
>> cannot dynamically allocate MSI-X vectors after MSI-X has been
>> enabled. When QEMU needs to extend the vector range, it must
>> disable MSI-X, free all interrupts, then re-enable with a larger
>> allocation. This creates an interrupt loss window for already-active
>> vectors.
>>
>> Consider HNS3 with RoCE: NIC and RDMA share one PCI device and
>> ITS DeviceID, with MSI-X vectors partitioned as NIC (lower range)
>> then RoCE (starting at base_vector = num_nic_msi). In VFIO
>> passthrough, loading hns_roce after hns3 forces QEMU to tear down
>> all interrupts before re-allocating the larger range. During this
>> process, NIC interrupts may be lost. Testing confirmed that this
>> occasionally occurs, causing the network port reset to fail. This
>> appears to be unavoidable, as it's a standard approach adopted by
>> all network card vendors.
>>
>> On Hisilicon HIP09 (ARM64, GICv3/GICv4.1) with latest upstream kernel
>> and QEMU 8.2. VFIO passthrough of HNS3 NIC to VM: load both hns3 and
>> hns_roce_hw_v2 drivers and trigger FLR, this bug will occur occasionally.
>> After enabling dynamic MSIX allocation, this bug no longer occurs.
>>
>> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
>> ---
>> Changes in v2:
>>    - Updated the commit message to add test information.
> 
> Well, it contains test information, but it does not tell me _WHY_ this
> is safe to do, i.e. what makes gic-v3-its eligible to set this flag?

Yes, the commit message should explain this. The GICv3 ITS is eligible
because:

When set this flag, for the ITT, adding a new vector only inserts a new
entry, existing entries are untouched, so already-active vectors are
unaffected.

The ITT are sized to hwsize at MSI-X domain creation time. so there
is always sufficient space for any vector index that may be dynamiclly 
allocated later. So the ITT never needs to be resized at runtime. The
dynamic allocation path(msi_domain_alloc_irq_at -> populate_alloc_info) 
simply copies the pre-prepared alloc_data without re-invoking
msi_prepare(). Then picking a free EventID from the already-allocated
ITT and a free LPI form the already-reserved bitmap --- no existing
vector is affected.

I'll add this to the commit message in v3.

Thanks,
Jinqian

