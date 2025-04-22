Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802D1C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuUZ42TtPnT0cgCcTaOHAnuZ6vnhcbj2FOu4nFKAtQc=; b=HJByQ0KbtHJJ3z1jZ24LiiO1Bm
	OTsgXuO/qImdKDOKnRRPuZ33JjOtc7hxpKCxqzbwquhqmlOGCkFC3ikKvWMa6V+f7RlBlh0xE0GQO
	vUXLgXUSfpccOxSYgbw4ML5ggh2gqb1tb7SPPYB2UyssFQOQQn8Ni3+9tuNQhx24lWT5N7Dps2ZF8
	zOfOtDTwhA6DVOE7lh85EbbgxnKgtWGwuXsqp2PyUEqVNL9Afh4og3nnsQPH0BDYB0NUvjLd5JYrN
	MKK980cLGSc3Y676QXF8GOBRC4gPOI3iOCU5h6niLRM7EOfpbkSi15YTPhmn7e9T/slvuXoM6reRr
	GnbAZmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BLw-00000006rMs-43kA;
	Tue, 22 Apr 2025 10:59:48 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AbM-00000006hTY-38O3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:11:42 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZhdKV1V5Xz1d09W;
	Tue, 22 Apr 2025 18:10:38 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id C027A1400D4;
	Tue, 22 Apr 2025 18:11:35 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Apr 2025 18:11:34 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <wangyushan12@huawei.com>,
	<caijingtao@huawei.com>, <xueshan2@huawei.com>, <prime.zeng@hisilicon.com>,
	<acme@kernel.org>, <namhyung@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<mark.rutland@arm.com>, <jolsa@kernel.org>, <john.g.garry@oracle.com>,
	<leo.yan@linux.dev>, <irogers@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
Subject: Re: [PATCH] perf arm-spe: Add support for SPE Data Source packet on
 HiSilicon HIP12
To: James Clark <james.clark@linaro.org>
References: <20250408122809.37884-1-yangyicong@huawei.com>
 <89741897-6c8f-4b75-8ec3-675111ea60a1@linaro.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <36d03a7e-ffd6-29b8-c34f-fd6780adffe9@huawei.com>
Date: Tue, 22 Apr 2025 18:11:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <89741897-6c8f-4b75-8ec3-675111ea60a1@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_031141_090578_62CDE63A 
X-CRM114-Status: GOOD (  17.05  )
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

On 2025/4/22 17:16, James Clark wrote:
> 
> 
> On 08/04/2025 1:28 pm, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Add data source encoding for HiSilicon HIP12 and coresponding mapping
>> to the perf's memory data source. This will help to synthesize the data
>> and support upper layer tools like perf-mem and perf-c2c.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/include/asm/cputype.h              |   2 +
>>   tools/arch/arm64/include/asm/cputype.h        |   2 +
>>   .../util/arm-spe-decoder/arm-spe-decoder.h    |  17 +++
>>   tools/perf/util/arm-spe.c                     | 101 ++++++++++++++++++
>>   4 files changed, 122 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
>> index d1cc0571798b..36c5bbfbb6e9 100644
>> --- a/arch/arm64/include/asm/cputype.h
>> +++ b/arch/arm64/include/asm/cputype.h
>> @@ -133,6 +133,7 @@
>>     #define HISI_CPU_PART_TSV110        0xD01
>>   #define HISI_CPU_PART_HIP09            0xD02
>> +#define HISI_CPU_PART_HIP12        0xD06
>>     #define APPLE_CPU_PART_M1_ICESTORM    0x022
>>   #define APPLE_CPU_PART_M1_FIRESTORM    0x023
>> @@ -220,6 +221,7 @@
>>   #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
>>   #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
>>   #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
>> +#define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
>>   #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
>>   #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
>>   #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
>> diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
>> index 488f8e751349..9a5d85cfd1fb 100644
>> --- a/tools/arch/arm64/include/asm/cputype.h
>> +++ b/tools/arch/arm64/include/asm/cputype.h
>> @@ -129,6 +129,7 @@
>>   #define FUJITSU_CPU_PART_A64FX        0x001
>>     #define HISI_CPU_PART_TSV110        0xD01
>> +#define HISI_CPU_PART_HIP12        0xD06
>>     #define APPLE_CPU_PART_M1_ICESTORM    0x022
>>   #define APPLE_CPU_PART_M1_FIRESTORM    0x023
>> @@ -202,6 +203,7 @@
>>   #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
>>   #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
>>   #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
>> +#define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
>>   #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
>>   #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
>>   #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
>> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
>> index 5d232188643b..0410abed5009 100644
>> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
>> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
>> @@ -82,6 +82,23 @@ enum arm_spe_ampereone_data_source {
>>       ARM_SPE_AMPEREONE_L2D                           = 0x9,
>>   };
>>   +enum arm_spe_hisi_hip_data_source {
>> +    ARM_SPE_HISI_HIP_PEER_CPU        = 0,
>> +    ARM_SPE_HISI_HIP_PEER_CPU_HITM        = 1,
>> +    ARM_SPE_HISI_HIP_L3            = 2,
>> +    ARM_SPE_HISI_HIP_L3_HITM        = 3,
>> +    ARM_SPE_HISI_HIP_PEER_CLUSTER        = 4,
>> +    ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM    = 5,
>> +    ARM_SPE_HISI_HIP_REMOTE_SOCKET        = 6,
>> +    ARM_SPE_HISI_HIP_REMOTE_SOCKET_HITM    = 7,
>> +    ARM_SPE_HISI_HIP_LOCAL            = 8,
>> +    ARM_SPE_HISI_HIP_REMOTE            = 9,
>> +    ARM_SPE_HISI_HIP_NC_DEV            = 13,
>> +    ARM_SPE_HISI_HIP_L2            = 16,
>> +    ARM_SPE_HISI_HIP_L2_HITM        = 17,
>> +    ARM_SPE_HISI_HIP_L1            = 18,
>> +};
>> +
>>   struct arm_spe_record {
>>       enum arm_spe_sample_type type;
>>       int err;
>> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
>> index 2a9775649cc2..eceae4219601 100644
>> --- a/tools/perf/util/arm-spe.c
>> +++ b/tools/perf/util/arm-spe.c
>> @@ -571,6 +571,11 @@ static const struct midr_range ampereone_ds_encoding_cpus[] = {
>>       {},
>>   };
>>   +static const struct midr_range hisi_hip_ds_encoding_cpus[] = {
>> +    MIDR_ALL_VERSIONS(MIDR_HISI_HIP12),
>> +    {},
>> +};
>> +
>>   static void arm_spe__sample_flags(struct arm_spe_queue *speq)
>>   {
>>       const struct arm_spe_record *record = &speq->decoder->record;
>> @@ -718,9 +723,105 @@ static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *re
>>       arm_spe__synth_data_source_common(&common_record, data_src);
>>   }
>>   +static void arm_spe__synth_data_source_hisi_hip(const struct arm_spe_record *record,
>> +                        union perf_mem_data_src *data_src)
>> +{
>> +    /* Use common synthesis method to handle store operations */
>> +    if (record->op & ARM_SPE_OP_ST) {
>> +        arm_spe__synth_data_source_common(record, data_src);
>> +        return;
>> +    }
>> +
>> +    switch (record->source) {
>> +    case ARM_SPE_HISI_HIP_PEER_CPU:
>> +        data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
>> +        data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
>> +        data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
>> +        data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
>> +        break;
>> +    case ARM_SPE_HISI_HIP_PEER_CPU_HITM:
>> +        data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
>> +        data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
>> +        data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
>> +        data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
>> +        break;
>> +    case ARM_SPE_HISI_HIP_L3:
>> +        data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
>> +        data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
>> +        data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
>> +        break;
>> +    case ARM_SPE_HISI_HIP_L3_HITM:
>> +        data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
>> +        data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
>> +        data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
>> +        data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
>> +        break;
>> +    case ARM_SPE_HISI_HIP_PEER_CLUSTER:
>> +        data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
>> +        data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
>> +        data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
>> +        data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
>> +        break;
>> +    case ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM:
>> +        data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
>> +        data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
>> +        data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
>> +        data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
>> +        break;
>> +    case ARM_SPE_HISI_HIP_REMOTE_SOCKET:
>> +        data_src->mem_lvl = PERF_MEM_LVL_REM_CCE2;
>> +        data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
>> +        data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
>> +        data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> 
> Hi Yicong,
> 
> Is the mem_snoop setting missing from this one?
> 

it should be PERF_MEM_SNOOP_NONE, will fix. Thanks for catching this.

> Other than that, LGTM.
> 

Thanks.


