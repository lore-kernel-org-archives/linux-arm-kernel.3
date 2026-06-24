Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF632CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=gD81xbw18Sh9jn/7ZkMEu1F+TbHXFsYKEWWUgrlI2Xc=; b=hhdqSjF5BzdxmfaDefUm0b9+ek
	ClN9xL40k3TcGPUM1CO1PEKgg5+123+LjdBenC+M+CqB0afQSVbVXoAT/o91OkREroeYJqMoFMiYP
	8jBU82Zj7Qy+m/FSp+8Pj6KefzD2V8kGSmSFeWikg4o+GVKGSLWkPXoqtqo0gZv3BMsG8mdq65Q+s
	uZtfqhcUwd6z4MhsnTzt79op/HgiOdWW5Mk8IJPeR4i+1BYJRTblungv7W3mlqRMO+zMa5BY9358Q
	IG7jHWi5CoZ4y8OpIQfLwHX2wmfHsav+AGiVkgiYjn3VXZXmYWfFxOi+LdACcqgvU5WeS2A1mvVDx
	gDi991dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJDU-00000007PgT-2J6r;
	Wed, 24 Jun 2026 08:44:16 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJDQ-00000007Peo-492c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:44:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gD81xbw18Sh9jn/7ZkMEu1F+TbHXFsYKEWWUgrlI2Xc=;
	b=u0sf6IG5D/RnwvoqPmgUG3+lv0KH4okdvJJ2aeX9mzlU8TZJwoM6fvjtlygYu25FLNWn0/7zH
	aoA01BqOs7GoNA5SW/4ya5aiNGkkHLuRnAE6RWFyZsYbY6YK4pRUBTvIBrQHrHx8XyEykfMc3lJ
	z21dNanHQ5Ah4mHYehD+UCU=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4glZxS5SG1zmV7b;
	Wed, 24 Jun 2026 16:34:52 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 4480D40571;
	Wed, 24 Jun 2026 16:43:58 +0800 (CST)
Received: from kwepemq200014.china.huawei.com (7.202.195.213) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 24 Jun 2026 16:43:58 +0800
Received: from dggpemf100008.china.huawei.com (7.185.36.138) by
 kwepemq200014.china.huawei.com (7.202.195.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 24 Jun 2026 16:43:57 +0800
Received: from dggpemf100008.china.huawei.com ([7.185.36.138]) by
 dggpemf100008.china.huawei.com ([7.185.36.138]) with mapi id 15.02.1544.011;
 Wed, 24 Jun 2026 16:43:57 +0800
From: "chenjun (AM)" <chenjun102@huawei.com>
To: Robin Murphy <robin.murphy@arm.com>, "will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: "zhangyuwei (G)" <zhangyuwei20@huawei.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add tracepoint for EVTQ events
Thread-Topic: [PATCH] iommu/arm-smmu-v3: Add tracepoint for EVTQ events
Thread-Index: AQHc+zWJu1K6BmDmK0WFfh1OITwYNg==
Date: Wed, 24 Jun 2026 08:43:57 +0000
Message-ID: <94eee9fa08a8461893b4e076919e9e55@huawei.com>
References: <20260613130007.18563-1-chenjun102@huawei.com>
 <59c283b1-0436-4ea1-8feb-996dba617b6d@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.142]
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_014413_670684_27860B5F 
X-CRM114-Status: GOOD (  14.71  )
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

=1B$B:_=1B(B 2026/6/23 23:31, Robin Murphy =1B$B<LF;=1B(B:=0A=
> On 13/06/2026 2:00 pm, Chen Jun wrote:=0A=
>> Events reported by the SMMU can severely impact accelerator=0A=
>> performance. Currently, only events that the SMMU fails to handle are=0A=
>> printed to the kernel log, leaving most events invisible to users.=0A=
>> To analyze and optimize accelerator performance, complete visibility=0A=
>> into all SMMU-reported events is required.=0A=
> =0A=
> What events, exactly? AFAICS the only events we should expect to handle=
=0A=
> "invisibly", without being some unexpected error condition worth=0A=
> screaming about, would be stalls for SVA page faults, and if SVA isn't=0A=
> generically accounting page faults itself then I would imagine it=0A=
> probably should.=0A=
> =0A=
> Thanks,=0A=
> Robin.=0A=
> =0A=
=0A=
AF and WP faults are common occurrences. and they can significantly =0A=
impact SMMU performance. If we can determine exactly at which address =0A=
and what type of page fault occurred, it would help us avoid SVA page =0A=
fault events through other means. Also, I don't see any separate =0A=
accounting for page fault events in the SVA flow.=0A=
=0A=
Thanks=0A=
Chen Jun=0A=
=0A=
>> Add a tracepoint in the EVTQ interrupt handler to capture every=0A=
>> event record reported by the SMMU. This allows users to collect all=0A=
>> event information via ftrace/perf for further analysis, complementing=0A=
>> the existing event decoder and error dump which only cover a subset=0A=
>> of events.=0A=
>>=0A=
>> Signed-off-by: Chen Jun <chenjun102@huawei.com>=0A=
>> ---=0A=
>>    drivers/iommu/arm/arm-smmu-v3/Makefile      |  2 +-=0A=
>>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  3 ++=0A=
>>    drivers/iommu/arm/arm-smmu-v3/trace.c       |  9 ++++=0A=
>>    drivers/iommu/arm/arm-smmu-v3/trace.h       | 53 ++++++++++++++++++++=
+=0A=
>>    4 files changed, 66 insertions(+), 1 deletion(-)=0A=
>>    create mode 100644 drivers/iommu/arm/arm-smmu-v3/trace.c=0A=
>>    create mode 100644 drivers/iommu/arm/arm-smmu-v3/trace.h=0A=
>>=0A=
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/=
arm-smmu-v3/Makefile=0A=
>> index 493a659cc66b..63a8d71bfc93 100644=0A=
>> --- a/drivers/iommu/arm/arm-smmu-v3/Makefile=0A=
>> +++ b/drivers/iommu/arm/arm-smmu-v3/Makefile=0A=
>> @@ -1,6 +1,6 @@=0A=
>>    # SPDX-License-Identifier: GPL-2.0=0A=
>>    obj-$(CONFIG_ARM_SMMU_V3) +=3D arm_smmu_v3.o=0A=
>> -arm_smmu_v3-y :=3D arm-smmu-v3.o=0A=
>> +arm_smmu_v3-y :=3D arm-smmu-v3.o trace.o=0A=
>>    arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) +=3D arm-smmu-v3-iommufd.o=
=0A=
>>    arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) +=3D arm-smmu-v3-sva.o=0A=
>>    arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) +=3D tegra241-cmdqv.o=0A=
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu=
/arm/arm-smmu-v3/arm-smmu-v3.c=0A=
>> index e8d7dbe495f0..85e6c25b73ed 100644=0A=
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c=0A=
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c=0A=
>> @@ -34,6 +34,8 @@=0A=
>>    #include "arm-smmu-v3.h"=0A=
>>    #include "../../dma-iommu.h"=0A=
>>    =0A=
>> +#include "trace.h"=0A=
>> +=0A=
>>    static bool disable_msipolling;=0A=
>>    module_param(disable_msipolling, bool, 0444);=0A=
>>    MODULE_PARM_DESC(disable_msipolling,=0A=
>> @@ -2271,6 +2273,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, v=
oid *dev)=0A=
>>    =0A=
>>    	do {=0A=
>>    		while (!queue_remove_raw(q, evt)) {=0A=
>> +			trace_smmu_evtq_event(smmu, evt);=0A=
>>    			arm_smmu_decode_event(smmu, evt, &event);=0A=
>>    			if (arm_smmu_handle_event(smmu, evt, &event))=0A=
>>    				arm_smmu_dump_event(smmu, evt, &event, &rs);=0A=
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/trace.c b/drivers/iommu/arm/a=
rm-smmu-v3/trace.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..77378698b1a3=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/iommu/arm/arm-smmu-v3/trace.c=0A=
>> @@ -0,0 +1,9 @@=0A=
>> +// SPDX-License-Identifier: GPL-2.0=0A=
>> +/*=0A=
>> + * ARM SMMUv3 trace support=0A=
>> + *=0A=
>> + * Copyright (c) 2026 OpenCloudOS / openEuler=0A=
>> + */=0A=
>> +=0A=
>> +#define CREATE_TRACE_POINTS=0A=
>> +#include "trace.h"=0A=
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/trace.h b/drivers/iommu/arm/a=
rm-smmu-v3/trace.h=0A=
>> new file mode 100644=0A=
>> index 000000000000..7cec8d41745e=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/iommu/arm/arm-smmu-v3/trace.h=0A=
>> @@ -0,0 +1,53 @@=0A=
>> +/* SPDX-License-Identifier: GPL-2.0 */=0A=
>> +/*=0A=
>> + * ARM SMMUv3 trace support=0A=
>> + *=0A=
>> + * Copyright (c) 2026 OpenCloudOS / openEuler=0A=
>> + */=0A=
>> +=0A=
>> +#undef TRACE_SYSTEM=0A=
>> +#define TRACE_SYSTEM arm_smmu_v3=0A=
>> +=0A=
>> +#if !defined(_TRACE_ARM_SMMU_V3_H) || defined(TRACE_HEADER_MULTI_READ)=
=0A=
>> +#define _TRACE_ARM_SMMU_V3_H=0A=
>> +=0A=
>> +#include <linux/tracepoint.h>=0A=
>> +=0A=
>> +#include "arm-smmu-v3.h"=0A=
>> +=0A=
>> +TRACE_EVENT(smmu_evtq_event,=0A=
>> +=0A=
>> +	TP_PROTO(struct arm_smmu_device *smmu, u64 *evt),=0A=
>> +=0A=
>> +	TP_ARGS(smmu, evt),=0A=
>> +=0A=
>> +	TP_STRUCT__entry(=0A=
>> +		__string(iommu, dev_name(smmu->dev))=0A=
>> +		__field(u64, evt0)=0A=
>> +		__field(u64, evt1)=0A=
>> +		__field(u64, evt2)=0A=
>> +		__field(u64, evt3)=0A=
>> +	),=0A=
>> +=0A=
>> +	TP_fast_assign(=0A=
>> +		__assign_str(iommu);=0A=
>> +		__entry->evt0 =3D evt[0];=0A=
>> +		__entry->evt1 =3D evt[1];=0A=
>> +		__entry->evt2 =3D evt[2];=0A=
>> +		__entry->evt3 =3D evt[3];=0A=
>> +	),=0A=
>> +=0A=
>> +	TP_printk("%s evt: 0x%016llx 0x%016llx 0x%016llx 0x%016llx",=0A=
>> +		__get_str(iommu),=0A=
>> +		__entry->evt0, __entry->evt1,=0A=
>> +		__entry->evt2, __entry->evt3)=0A=
>> +);=0A=
>> +=0A=
>> +#endif /* _TRACE_ARM_SMMU_V3_H */=0A=
>> +=0A=
>> +/* This part must be outside protection */=0A=
>> +#undef TRACE_INCLUDE_PATH=0A=
>> +#undef TRACE_INCLUDE_FILE=0A=
>> +#define TRACE_INCLUDE_PATH ../../drivers/iommu/arm/arm-smmu-v3/=0A=
>> +#define TRACE_INCLUDE_FILE trace=0A=
>> +#include <trace/define_trace.h>=0A=
> =0A=
> =0A=
> =0A=
=0A=

