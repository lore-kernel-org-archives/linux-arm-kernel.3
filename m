Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2910FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSZ+W+gpyvva9DOkNjE72UDAxg//MujBrcnUpMW/QcY=; b=CdPt/JmAx+/MPo3gieZLO6xzft
	UDkmc3tv4tX8VoX8ScSHtPQEt34JdEqvrpJDQa2SU02Gaz3xjZogsM6Md/VawqxogL/5wb09FaS35
	IEu6z2/JH0l7krqiLvJsfXU8AywGcn/dkFtoy75ZJRlDc3njvd8cX3md9i7oCBJ7khM/NCMyV3clR
	SoXSblZ2PyBLXa0ajoV9YZIPbZ4JOlk42ybTfGSneM0bJpi8gq3R0ekz9ibRttFMbetjugTlNdGiE
	Prv2ImzzMVOhW8zNz3SQQIgsbSNtQWctTvqKVKRajuZy1zUoIyAw8O0TJbTw0eTPufFZ4tMSBr+je
	FdilF8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K8N-0000000BKT1-09Yh;
	Tue, 01 Sep 2026 08:46:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K8L-0000000BKSs-01TV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:46:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D012E601DB;
	Tue,  1 Sep 2026 08:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3216B1F000E9;
	Tue,  1 Sep 2026 08:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788252379;
	bh=sSZ+W+gpyvva9DOkNjE72UDAxg//MujBrcnUpMW/QcY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kghze7x3MwDDqCvHjx3ZgTrJRLG41aro+Xm0FE6b6M6N87BFrqfJiFQjdaNbyLjei
	 /a0OGIdZv30zvjAUQNX00VUKHQKXCR2agw7Z3sq1Iz3YSvNGyKEtzmzcCh7n4KUmXG
	 uz1hIO1S1ln18PVcx9PsArwCn61NTGEDT+6ibg3Jp48OI2ZzhY5p17nMoy8ky5yUg0
	 KyGbFbwiDzGSs0LfbmSaPYcAZYNf4/wtrGpomumjEMkz6mpyTmY7z84nicptr3WT/8
	 RxgbatJmc0fP+5PEruglqmQNsVmlcvcYnePVLmcPF5rhWlw9iSwFakTC14vEGovfKN
	 zUZN80YOsQ3XA==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 01/16] iommu/arm-smmu-v3: Discover RME support
 and realm IRQ topology
In-Reply-To: <apMjUSbxcnlAKjks@nvidia.com>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-2-aneesh.kumar@kernel.org>
 <apMjUSbxcnlAKjks@nvidia.com>
Date: Tue, 01 Sep 2026 14:16:10 +0530
Message-ID: <yq5aik4pnyul.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Nicolin Chen <nicolinc@nvidia.com> writes:

> On Mon, Apr 27, 2026 at 02:23:29PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c
>> @@ -0,0 +1,124 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2026 ARM Ltd.
>> + */
>> +
>> +#include <linux/interrupt.h>
>> +#include <asm/rmi_smc.h>
>> +#include <asm/rmi_cmds.h>
>> +
>> +#include "arm-smmu-v3.h"
>> +
>> +#define	RMI_PSMMU_IRQ_GERROR	BIT(0)
>> +#define	RMI_PSMMU_IRQ_EVENTQ	BIT(1)
>> +#define	RMI_PSMMU_IRQ_PRIQ	BIT(2)
>> +#define	RMI_PSMMU_IRQ_CMDQ	BIT(3)
> [...]
>> +	if (irq == smmu->realm_evtq_irq)
>> +		notify_flags =  RMI_PSMMU_IRQ_EVENTQ;
>> +	else if (irq == smmu->realm_gerr_irq)
>> +		notify_flags =  RMI_PSMMU_IRQ_GERROR;
>> +	else if (irq == smmu->realm_pri_irq)
>> +		notify_flags =  RMI_PSMMU_IRQ_PRIQ;
>
> These are defined as BIT(x)...
>
>> +		if (rmi_psmmu_irq_notify(smmu->base_phys,
>> +					 notify_flags, &event)) {
> [...]
>> +			rmi_psmmu_event_consume(smmu->base_phys, notify_flags);
>
> .. and passed to RMI_PSMMU_IRQ_NOTIFY and RMI_PSMMU_EVENT_CONSUME.
>
> RMI_PSMMU_IRQ_NOTIFY takes RmiPsmmuIrqSet type, which is a 4-bit
> field that has a range of [BIT(0), BIT(3)]. So this is correct.
>
> However, RMI_PSMMU_EVENT_CONSUME takes RmiPsmmuIrq type, which is
> a 2-bit field that has a range of [0x0, 0x3]. So this seems wrong.
>

Updated that to

#define	RMI_PSMMU_IRQ_PEND_GERROR	BIT(0)
#define	RMI_PSMMU_IRQ_PEND_EVENTQ	BIT(1)
#define	RMI_PSMMU_IRQ_PEND_PRIQ		BIT(2)
#define	RMI_PSMMU_IRQ_PEND_CMDQ		BIT(3)


#define	RMI_PSMMU_IRQ_GERROR	0
#define	RMI_PSMMU_IRQ_EVENTQ	1
#define	RMI_PSMMU_IRQ_PRIQ	2
#define	RMI_PSMMU_IRQ_CMDQ	3


and 
	if (irq == smmu->realm.evtq_irq) {
		notify_flags =  RMI_PSMMU_IRQ_PEND_EVENTQ;
		psmmu_irq = RMI_PSMMU_IRQ_EVENTQ;
	} else if (irq == smmu->realm.gerr_irq) {

...
	rmi_psmmu_event_consume(smmu->base_phys, psmmu_irq);

>
>> +void arm_smmu_setup_realm_irqs(struct arm_smmu_device *smmu)
>> +{
>> +	int irq, ret;
>> +
>> +	irq = smmu->realm_evtq_irq;
>> +	if (irq) {
>> +		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
>> +						arm_smmu_realm_notify_thread,
>> +						IRQF_ONESHOT,
>> +						"arm-smmu-v3-realm-evtq",
>> +						smmu);
>
> These IRQ numbers are raw numbers forwarded by firmware and then
> returned by RMI_PSMMU_INFO:
>
> +		if ((psmmu_info->flags & RMI_PSMMU_IRQCFG_MASK) ==
> +		    RMI_PSMMU_IRQCFG_IRQ_WIRED) {
> +			smmu->realm_gerr_irq = psmmu_info->gerror_intr_num;
> +			smmu->realm_evtq_irq = psmmu_info->eventq_intr_num;
> +			smmu->realm_pri_irq = psmmu_info->priq_intr_num;
>
> Should they be converted to Linux IRQ numbers before forwarded to
> devm_request_threaded_irq?
>

Yes, that needs conversion. I guess we can use the irq_domain associated
with the non-Realm IRQ number to create the mappings?

Something like:


+static struct irq_domain *arm_smmu_get_wired_irq_domain(struct arm_smmu_device *smmu)
+{
+	int irqs[] = {
+		smmu->combined_irq,
+		smmu->evtq.q.irq,
+		smmu->gerr_irq,
+		smmu->priq.q.irq,
+	};
+	struct irq_domain *domain = NULL;
+	struct irq_data *irq_data;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(irqs); i++) {
+		if (irqs[i] <= 0)
+			continue;
+
+		irq_data = irq_get_irq_data(irqs[i]);
+		if (!irq_data || !irq_data->domain)
+			return ERR_PTR(-EINVAL);
+
+		if (domain && domain != irq_data->domain)
+			return ERR_PTR(-EINVAL);
+
+		domain = irq_data->domain;
+	}
+
+	return domain ?: ERR_PTR(-ENXIO);
+}

>
>> @@ -782,6 +787,9 @@ struct arm_smmu_device {
>>  
>>  	int				gerr_irq;
>>  	int				combined_irq;
>> +	int				realm_gerr_irq;
>> +	int				realm_evtq_irq;
>> +	int				realm_pri_irq;
>
> Nit: this series adds a few realm-specific things in the top SMMU
> structure. Maybe a "struct arm_realm_psmmu" can make them clearer.
>

Added

struct arm_smmu_realm {
	int				gerr_irq;
	int				evtq_irq;
	int				pri_irq;
	struct mutex			mutex;
	refcount_t			users;
};

-aneesh

