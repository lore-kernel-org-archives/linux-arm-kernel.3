Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22ADCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QMMjNpI69PAa5UDyxQM/MTLmW5DUOCi7kZy5jsq3RQ=; b=MA1NOvE3KNkd0kHwmn78vObtYa
	HG80gpVIPfIDCvyb1xshHQn0WE9eRhnf8N/2it5zrVDbi0/YspAA7H3L6UnwC9eZgyWstz7+U7W/x
	8cEdzsJSr4zHPW5sqxg+lZgMD3O8GLhQg9EW5yBuExlJvM1wVJ0Dr43DGT3jkmvz0yBGQAXye6nLp
	Pabchh5/pKJ3AXFC7k8+u8hf7l0Q35lvgcAVrFtZLf6Gc1cK/dOUXvIqVBl3DGta32kcZacnwKAhc
	UdQOqryOB21dBclzbBBnqnsCFl7ZKizNIiX2ioIsEt0tpVLeWELERv41FltcUyBqb2t/+der7+bh5
	2zohxKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJve-00000007VuT-36Ns;
	Wed, 24 Jun 2026 09:29:54 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJva-00000007VtS-3bKt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:29:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4QMMjNpI69PAa5UDyxQM/MTLmW5DUOCi7kZy5jsq3RQ=;
	b=V9GpuCanuGjCEPD4H56OUkLlvDMt0gkYOCkZR8+B9KreN26eSlKmhlmiunfix2+EXMNigTEL6
	KtBlV2Zhmrqwzl69BOruONcM/y3sMWCcCDQhexKHzCaReAyp/gBa4mtjl9w+tHCJKo5q3uWTnNL
	uWlY4wJcfYVvxF3nf4vyWQk=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4glbyK57lqz1prKy;
	Wed, 24 Jun 2026 17:20:41 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F3D52012A;
	Wed, 24 Jun 2026 17:29:49 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 dggpemf500013.china.huawei.com (7.185.36.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 24 Jun 2026 17:29:48 +0800
Message-ID: <a6e6a636-4e16-465e-8a65-bff671c94ef5@huawei.com>
Date: Wed, 24 Jun 2026 17:29:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] irqchip/gic-v3-its: enable dynamic MSI-X allocation
To: Marc Zyngier <maz@kernel.org>
CC: <lpieralisi@kernel.org>, <tglx@kernel.org>, <alex@shazbot.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<liuyonglong@huawei.com>, <wangzhou1@hisilicon.com>, <linuxarm@huawei.com>
References: <20260624025345.458387-1-yangjinqian1@huawei.com>
 <86o6h0quvj.wl-maz@kernel.org>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <86o6h0quvj.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_022951_371436_7BF5EFAE 
X-CRM114-Status: GOOD (  20.11  )
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



On 2026/6/24 15:07, Marc Zyngier wrote:
> On Wed, 24 Jun 2026 03:53:45 +0100,
> Jinqian Yang <yangjinqian1@huawei.com> wrote:
>>
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
>> occasionally occurs, causing the network port reset to fail.
> 
> Well, that's what you get for not exposing differentiated functions.
> Eventually, you face the reality that this is a poor design.
> 

Fair point, though this is not unique to HNS3.. All major NIC+RDMA
vendors share the same PCI function.

>>
>> ITS_MSI_FLAGS_SUPPORTED lacks MSI_FLAG_PCI_MSIX_ALLOC_DYN, causing
>> pci_msix_can_alloc_dyn() to return false. VFIO then sets
>> has_dyn_msix=false and never clears VFIO_IRQ_INFO_NORESIZE for
>> MSI-X, keeping the old "disable and reallocate" behavior.
>>
>> The essential prerequisite for enabling this flag is the fix to
>> msi_prepare() call timing (commit 1396e89e09f0 ("genirq/msi: Move
>> prepare() call to per-device allocation")): msi_prepare() is
>> now called once at per-device domain creation with hwsize, so ITS
>> creates an ITT with sufficient capacity for all MSI-X vectors.
>> Without this fix, msi_prepare() was called per-allocation with
>> semi-random nvec, maybe resulting in an ITT too small for dynamic
>> vector addition.
> 
> How is this paragraph relevant? The kernel has had this fix for over a
> year, and backporting this series is not something I plan to ever do.
> 

Will remove from commit msg.

>>
>> With this in place, dynamic MSI-X allocation works correctly:
>> msi_domain_alloc_irq_at() uses populate_alloc_info() to copy the
>> pre-prepared alloc_data without re-invoking msi_prepare(), so each
>> new vector simply gets a LPI entry in the already-allocated ITT,
>> without affecting existing vectors.
>>
>> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
>> ---
>>   drivers/irqchip/irq-gic-its-msi-parent.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
>> index b9257103a999..b2b9d2068bb1 100644
>> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
>> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
>> @@ -18,7 +18,8 @@
>>   
>>   #define ITS_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK |	\
>>   				 MSI_FLAG_PCI_MSIX      |	\
>> -				 MSI_FLAG_MULTI_PCI_MSI)
>> +				 MSI_FLAG_MULTI_PCI_MSI |	\
>> +				 MSI_FLAG_PCI_MSIX_ALLOC_DYN)
>>   
>>   static int its_translate_frame_address(struct fwnode_handle *msi_node, phys_addr_t *pa)
>>   {
> 
> What has this been tested with? In which conditions?
> 

Tested on Hisilicon HIP09 (ARM64, GICv3/GICv4.1) with latest
upstream kernel and QEMU 8.2.

VFIO passthrough of HNS3 NIC to VM: load both hns3 and
hns_roce_hw_v2 drivers, then trigger FLR. Without the flag,
QEMU disables/re-enables MSI-X around FLR, causing occasional
link up failure due to interrupt loss.

Thanks,
Jinqian


