Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA68BEB3621
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aG8P8OXYzBDIUqPExNb4ahPcQ5pLVM9i5Q2ciPCuYEY=; b=fORRYw60cdZO/rU55GbORuyZr9
	Tvh6G7KLYJwkDmfY3NYdNxhQ2e9+WM+fX3FCQmOKPMQZE+KVlcbr5ujG6oi336jveo3mgvflTsWkK
	flWESFeD7+YH1vzI/nczupxX6QVX9Uz6If5yuRTDsEjuB06mBOs2eg55FudD3K3F0xYY6mRrhV/i3
	z6zSJ0LaGb5M9eLs82bZB3PNeKsXciHToxPwnIqrXQ5WxO2my6piN7YaMTTdNw0eiaWp6pVD+vqEW
	pklamzOMHElEok59r01A4F3wrVW4cKWJwiVIi5OrH8o77PHjI/IbbrnyIDXNtw5NJK0w1bpmSPitD
	XfJHeoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6nb-0000000DYyY-2sOk;
	Mon, 02 Mar 2026 17:11:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6nZ-0000000DYyB-0xmr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 17:11:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD58014BF;
	Mon,  2 Mar 2026 09:11:04 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7859C3F73B;
	Mon,  2 Mar 2026 09:11:06 -0800 (PST)
Message-ID: <3e26371d-21b5-435e-9f31-7187466c57a2@arm.com>
Date: Mon, 2 Mar 2026 17:11:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 38/41] arm_mpam: Add workaround for T241-MPAM-4
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <20260224175720.2663924-39-ben.horgan@arm.com>
 <7e496cb6-ab31-4a89-9630-0fa2e6b3607b@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <7e496cb6-ab31-4a89-9630-0fa2e6b3607b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_091113_361669_F70B8AD7 
X-CRM114-Status: GOOD (  36.78  )
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

Hi Fenghua,

On 3/1/26 17:28, Fenghua Yu wrote:
> Hi, Ben,
> 
> On 2/24/26 09:57, Ben Horgan wrote:
>> From: Shanker Donthineni <sdonthineni@nvidia.com>
>>
>> In the T241 implementation of memory-bandwidth partitioning, in the
>> absence
>> of contention for bandwidth, the minimum bandwidth setting can affect the
>> amount of achieved bandwidth. Specifically, the achieved bandwidth in the
>> absence of contention can settle to any value between the values of
>> MPAMCFG_MBW_MIN and MPAMCFG_MBW_MAX.  Also, if MPAMCFG_MBW_MIN is set
>> zero (below 0.78125%), once a core enters a throttled state, it will
>> never
>> leave that state.
>>
>> The first issue is not a concern if the MPAM software allows to program
>> MPAMCFG_MBW_MIN through the sysfs interface. This patch ensures program
>> MBW_MIN=1 (0.78125%) whenever MPAMCFG_MBW_MIN=0 is programmed.
>>
>> In the scenario where the resctrl doesn't support the MBW_MIN
>> interface via
>> sysfs, to achieve bandwidth closer to MBW_MAX in the absence of
>> contention,
>> software should configure a relatively narrow gap between MBW_MIN and
>> MBW_MAX. The recommendation is to use a 5% gap to mitigate the problem.
>>
>> Clear the feature MBW_MIN feature from the class to ensure we don't
>> accidentally change behaviour when resctrl adds support for a MBW_MIN
>> interface.
>>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> 
> This patch itself is good.
> 
> Please check the following comments.
> 
>> ---
>> [ morse: Added as second quirk, adapted to use the new intermediate
>> values
>> in mpam_extend_config() ]
>>
>> Changes since rfc:
>> MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
>> Handling when reset_mbw_min is set
>>
>> Changes since v3:
>> Move the 5% gap policy back here
>> Clear mbw_min feature in class
>> ---
>>   Documentation/arch/arm64/silicon-errata.rst |  2 +
>>   drivers/resctrl/mpam_devices.c              | 50 +++++++++++++++++++--
>>   drivers/resctrl/mpam_internal.h             |  1 +
>>   3 files changed, 50 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/
>> Documentation/arch/arm64/silicon-errata.rst
>> index a65620f98e3a..a4b246655e37 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -249,6 +249,8 @@ stable kernels.
>>   +----------------+-----------------+-----------------
>> +-----------------------------+
>>   | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/
>> A                         |
>>   +----------------+-----------------+-----------------
>> +-----------------------------+
>> +| NVIDIA         | T241 MPAM       | T241-MPAM-4     | N/
>> A                         |
>> ++----------------+-----------------+-----------------
>> +-----------------------------+
>>   +----------------+-----------------+-----------------
>> +-----------------------------+
>>   | Freescale/NXP  | LS2080A/LS1043A | A-008585        |
>> FSL_ERRATUM_A008585         |
>>   +----------------+-----------------+-----------------
>> +-----------------------------+
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/
>> mpam_devices.c
>> index 08cb080592d9..8f44e9dee207 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -679,6 +679,12 @@ static const struct mpam_quirk mpam_quirks[] = {
>>       .iidr_mask  = MPAM_IIDR_MATCH_ONE,
>>       .workaround = T241_SCRUB_SHADOW_REGS,
>>       },
>> +    {
>> +    /* NVIDIA t241 erratum T241-MPAM-4 */
>> +    .iidr       = MPAM_IIDR_NVIDIA_T241,
>> +    .iidr_mask  = MPAM_IIDR_MATCH_ONE,
>> +    .workaround = T241_FORCE_MBW_MIN_TO_ONE,
>> +    },
>>       { NULL } /* Sentinel */
>>   };
>>   @@ -1464,6 +1470,31 @@ static void
>> mpam_quirk_post_config_change(struct mpam_msc_ris *ris, u16 partid,
>>           mpam_apply_t241_erratum(ris, partid);
>>   }
>>   +static u16 mpam_wa_t241_force_mbw_min_to_one(struct mpam_props *props)
>> +{
>> +    u16 max_hw_value, min_hw_granule, res0_bits;
>> +
>> +    res0_bits = 16 - props->bwa_wd;
>> +    max_hw_value = ((1 << props->bwa_wd) - 1) << res0_bits;
>> +    min_hw_granule = ~max_hw_value;
>> +
>> +    return min_hw_granule + 1;
>> +}
>> +
>> +static u16 mpam_wa_t241_calc_min_from_max(struct mpam_config *cfg)
>> +{
>> +    u16 val = 0;
>> +
>> +    if (mpam_has_feature(mpam_feat_mbw_max, cfg)) {
> 
> But the problem is mpam_feat_mbw_max feature is NOT set in cfg.
> 
>> +        u16 delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
>> +
>> +        if (cfg->mbw_max > delta)
>> +            val = cfg->mbw_max - delta;
>> +    }
>> +
>> +    return val;
> 
> So 0 is always returned.
> 
> The workaround will set mbw_min as 1% which is too small and will cause
> performance degradation, e.g. about 20% degradation on some benchmarks.
> 
> This patch itself doesn't have any issue.
> 
> The issue is the mbw_max feature bit in cfg is not set.

This is intended behaviour as the reset is done independently
from the value set in the config. The value is there so that 
resctrl can display the expected values.

> This is a legacy issue, not introduced by this patch set.
> > Here is a fix patch for the issue:
> https://lore.kernel.org/lkml/20260301171829.1357886-1-
> fenghuay@nvidia.com/T/#u

I've commented on that patch. I think it's best to fix it in the context
of the erratum.

Does the below solve your performance problems?

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 236f78ab9163..60d3d3e2193f 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1515,16 +1515,20 @@ static u16 mpam_wa_t241_force_mbw_min_to_one(struct mpam_props *props)
        return min_hw_granule + 1;
 }
 
-static u16 mpam_wa_t241_calc_min_from_max(struct mpam_config *cfg)
+static u16 mpam_wa_t241_calc_min_from_max(struct mpam_props *props,
+                                         struct mpam_config *cfg)
 {
        u16 val = 0;
+       u16 max;
+       u16 delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
 
-       if (mpam_has_feature(mpam_feat_mbw_max, cfg)) {
-               u16 delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
+       if (mpam_has_feature(mpam_feat_mbw_max, cfg))
+               max = cfg->mbw_max;
+       else
+               max = GENMASK(15, 16 - cprops->bwa_wd);
 
-               if (cfg->mbw_max > delta)
-                       val = cfg->mbw_max - delta;
-       }
+       if (max > delta)
+               val = max - delta;
 
        return val;
 }
@@ -1577,9 +1581,8 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
                if (mpam_has_quirk(T241_FORCE_MBW_MIN_TO_ONE, msc)) {
                        u16 min = mpam_wa_t241_force_mbw_min_to_one(rprops);
 
-                       val = mpam_wa_t241_calc_min_from_max(cfg);
-                       if (val < min)
-                               val = min;
+                       val = mpam_wa_t241_calc_min_from_max(rprops, cfg);
+                       val = max(val, min);
                }
 
                mpam_write_partsel_reg(msc, MBW_MIN, val);

> 
> If the fix patch is good, could you please add it into the next version
> of this series?
> 
> Thanks.
> 
> -Fenghua

Thanks,

Ben


