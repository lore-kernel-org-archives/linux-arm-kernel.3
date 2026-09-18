Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133C4C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6Kjwu9OSKxioUG7up9HvmTZyOT5q6Qmeq/xm2VHMYM=; b=AqAe7zvQfsvM/biN1ycyQ4Ki8W
	4ihdXUsRew3nEu7Fktwyb6/Wj8+qserz1OSbCI0wOJ8xzhD9+5Y+C27pswCFee1w6aQX6KVM+5wKz
	iH5U2tibcIC9+URVIOjqMOmicrolLorl4uu9NOggKn/mELowHD38SaNTjp029fCJuXEIwPio80U7a
	93mpm8ZHIDpPowFx2OSpedtmm5vMp4Eq22s1itEDuTvJGoOg5F1kCCxK+X+I0RKhmZGUo6DA4nFsb
	5WKF/68+dJmHaHAFjmKMKmMpUizGXATd0nUV6ray2DzCYqE/LhTwXD9m4CTHGDnkObPnETyvr8Exj
	aMe6Hvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W0V-0000000E72T-0ZeJ;
	Fri, 18 Sep 2026 10:39:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W0T-0000000E71v-3FIj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:39:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A36B43E57;
	Fri, 18 Sep 2026 10:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC7F1F0089C;
	Fri, 18 Sep 2026 10:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789727989;
	bh=l6Kjwu9OSKxioUG7up9HvmTZyOT5q6Qmeq/xm2VHMYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hBcdchVYzJfSkDZhhMg2J1WA+1AG5z73Fi/mCSF+R4bC8Q0+wQ6SFnK8li8MQ5Q/w
	 gNODIKxkqE6vg9V+nbab0ZpgdPCSKmiAdiEPIZFHJs8FUf6w+G0E9l2NDWUZXJG3Sv
	 WanFtejBRsZus0xR+KPUrKcV9zMcNJlG03TmUcH5uvbP7FFfwMzcbzh9uKquWSWhyE
	 7Lp1OCdyAEYUHz20gYOkBvITSgGOpPC0lkc5fsCfaDUaT79jSKdanNfBUoU1Bikat+
	 MXTbtjjSR3HHbSG/gSP7S10xTM/AxEtPrr+0W8SOdUKuV6dQGyEExsIZWjeDQ3hYC2
	 WhOQpiXnNZH/A==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 8/9] arm64: realm: Add RHI helper to query IPA state
 change alignment
In-Reply-To: <73c921bb-9897-481d-bcb2-ef9b578a7c9f@arm.com>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <20260904103452.1197239-9-aneesh.kumar@kernel.org>
 <73c921bb-9897-481d-bcb2-ef9b578a7c9f@arm.com>
Date: Fri, 18 Sep 2026 16:09:42 +0530
Message-ID: <yq5awlsizvv5.fsf@kernel.org>
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 04/09/2026 11:34, Aneesh Kumar K.V (Arm) wrote:
>> Arm CCA guests need to know the granularity at which the host expects IPA
>> state changes to be performed. This can be larger than the guest page size
>> and is needed when deciding the alignment for memory shared with the host.
>> 
>> Add the Realm Host Interface host configuration definitions and an
>> get_ipa_state_change_alignment() helper. The helper uses RSI_HOST_CALL to
>> query the supported HostConf version and features, reads the IPA change
>> alignment when available, and falls back to PAGE_SIZE if the interface is
>> unavailable or returns an invalid value.
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>
> It may be worth mentioning the document number and may be the link
> for RHI spec.
>
> e.g., The Realm Host Interface specification Arm DEN00148 defines ...
>
>
>
>> ---
>>   drivers/firmware/arm_rmm/rsi.c | 46 ++++++++++++++++++++++++++++++++++
>>   include/linux/arm-rsi-cmds.h   | 10 ++++++++
>>   include/linux/arm-smccc-rhi.h  | 25 ++++++++++++++++++
>>   include/linux/arm-smccc-rsi.h  |  7 ++++++
>>   4 files changed, 88 insertions(+)
>>   create mode 100644 include/linux/arm-smccc-rhi.h
>> 
>> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
>> index 52f40256bd78..2cd53f82432f 100644
>> --- a/drivers/firmware/arm_rmm/rsi.c
>> +++ b/drivers/firmware/arm_rmm/rsi.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/swiotlb.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/arm-rsi-cmds.h>
>> +#include <linux/arm-smccc-rhi.h>
>>   #include <linux/kobject.h>
>>   #include <linux/sysfs.h>
>>   
>> @@ -164,6 +165,51 @@ static int realm_register_memory_enc_ops(void)
>>   	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
>>   }
>>   
>> +/* we need an aligned struct for rsi_host_call. slab is not yet ready */
>> +static struct rsi_host_call hostconf_call __initdata;
>> +static unsigned long __maybe_unused __init get_ipa_state_change_alignment(void)
>> +{
>> +	long ret;
>> +	unsigned long shared_granule_size;
>> +
>> +	hostconf_call.imm = 0;
>> +	hostconf_call.gprs[0] = RHI_HOSTCONF_VERSION;
>
> Do we need to 0 out the other GPRs for RES0 arguments ?
>
>> +	ret = rsi_host_call(lm_alias(&hostconf_call));
>> +	if (ret != RSI_SUCCESS)
>> +		goto err_out;
>> +
>> +	if (hostconf_call.gprs[0] != RHI_HOSTCONF_VER_1_0)
>> +		goto err_out;
>> +
>> +	hostconf_call.imm = 0;
>> +	hostconf_call.gprs[0] = RHI_HOSTCONF_FEATURES;
>
> Same here, especially gprs[] could be overwritten by the results from
> the Host for the previous call.
>

 [ ... 75 lines skipped ... ] 

>> +
>> +#define RHI_HOSTCONF_VER_1_0		0x10000
>> +#define RHI_HOSTCONF_VERSION		SMC_RHI_CALL(0x004E)
>> +
>> +#define __RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT BIT(0)
>
> minor nit: Could this be:
>
> RHI_HOSTCONF_FEATURE_GET_IPA_CHANGE_ALIGNMENT	BIT(0)
>
> to indicate this applies to the RHI_HOSTCONF_FEATURES output ?
>


Will make this change.

-	hostconf_call.imm = 0;
+	memset(&hostconf_call, 0, sizeof(hostconf_call));
 	hostconf_call.gprs[0] = RHI_HOSTCONF_FEATURES;
 	ret = rsi_host_call(lm_alias(&hostconf_call));
 	if (ret != RSI_SUCCESS)
 		goto err_out;
 
-	if (!(hostconf_call.gprs[0] & __RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT))
+	if (!(hostconf_call.gprs[0] & RHI_HOSTCONF_FEATURE_GET_IPA_CHANGE_ALIGNMENT))
 		goto err_out;

-aneesh

