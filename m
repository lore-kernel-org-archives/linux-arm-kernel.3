Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3712E73153
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkfZ3a+2gNazAEoToAdUbgyIfSqOuaqyN53lIzRaLzo=; b=i+2Mp2hrQ5W7C9i8tamP/ELC2Z
	l9cZIT6ox6RhfQNetUW3im30PL4m5Q3BKrxLi/5kaNKV0DB+hIFYCqOvw50ojoy5wpunFk16eN6R+
	4sIRbBXSvBBWN2kw/z86dpY6wEhoYIrMDOCixFsmh9HfCcdnBb13lfr8wjEQCUEFHSkNEMWxL9lz0
	wKGOCYJFvVyoM1FDRFMRuXbXX55IE3zefuhRDROIr/rrGCgjFi8+XAOqqTCxtQo7oLVu6e4zkaI+u
	88DW5eXvgPjI/u3rAgkg37x5tpkcWdrUMc1WN40icHpg8QLbCiArxup+/pVFURyUVNJO4TEGwv1Pr
	2KtTZP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr3s-00000004oBz-2GYr;
	Mon, 02 Feb 2026 10:21:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr3p-00000004oBS-1h74
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:21:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B9D2339;
	Mon,  2 Feb 2026 02:21:28 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A381C3F740;
	Mon,  2 Feb 2026 02:21:29 -0800 (PST)
Message-ID: <3ae02b5b-22ab-4778-a29d-709ca3163f58@arm.com>
Date: Mon, 2 Feb 2026 10:21:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 41/47] arm_mpam: Generate a configuration for min
 controls
To: Shanker Donthineni <sdonthineni@nvidia.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, tan.shaopeng@fujitsu.com,
 xhao@linux.alibaba.com, catalin.marinas@arm.com, will@kernel.org,
 corbet@lwn.net, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 Zeng Heng <zengheng4@huawei.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-42-ben.horgan@arm.com>
 <20260113153938.00007d6e@huawei.com>
 <80db7035-07d3-4fb4-a228-f9c67d2df1f4@arm.com>
 <9e01328f-7f28-4b43-aaf4-59d3ce80c268@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <9e01328f-7f28-4b43-aaf4-59d3ce80c268@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_022137_578851_1E169F48 
X-CRM114-Status: GOOD (  26.66  )
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

Hi Shanker,

On 1/31/26 02:30, Shanker Donthineni wrote:
> Hi Ben,
> 
> On 1/30/2026 8:17 AM, Ben Horgan wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Fenghua, Jonathan,
>>
>> On 1/13/26 15:39, Jonathan Cameron wrote:
>>> On Mon, 12 Jan 2026 16:59:08 +0000
>>> Ben Horgan <ben.horgan@arm.com> wrote:
>>>
>>>> From: James Morse <james.morse@arm.com>
>>>>
>>>> MPAM supports a minimum and maximum control for memory bandwidth. The
>>>> purpose of the minimum control is to give priority to tasks that are
>>>> below
>>>> their minimum value. Resctrl only provides one value for the bandwidth
>>>> configuration, which is used for the maximum.
>>>>
>>>>
>>>> Hence, I'll drop this patch, and update the mbw_min default to be
>>>> 0xFFFF
>>>> and for the value not to change even if mbw_max changes. I think this
>>>> leaves us in the best position going forward without any heuristics
>>>> that
>>>> may come back to bite us later when proper support for a schema
>>>> supporting mbw_min is added to resctrl.
> 
> Background: I previouslyshared original fix(seecodesnippet below) with
> James Morse
> ~2 years ago to address the errata, which explicitly recommends usinga
> 5% gap for
> mitigation of the Hardware issue (the problem described in commit text
> of T241-MPAM-4)
> 
> For some reason theoriginalimplementationwas splitinto two patches:
>   - Generic change applicable toall chips
>   - Specific fixfor Graceerrata T241-MPAM-4
> >
> Issue: Dropping this patch impacts[PATCH v3 45/47] forthe errata fix. If
> removalis
> necessary, please mergethis changeinto the T241-MPAM-4-specific patch.


What's the behaviour on T241 when MBW_MIN is always 0xFFFF?

I'm worried if we make a policy decision of how to set MBW_MIN based on
MBW_MAX for this platform then we won't be able to support a
configurable MBW_MIN in the future for this platform. As when MBW_MIN
support is added in resctrl the user's configuration for this platform
would change meaning on kernel upgrade.

> 
> --- a/drivers/platform/mpam/mpam_devices.c
> +++ b/drivers/platform/mpam/mpam_devices.c
> @@ -1190,8 +1190,12 @@ static void mpam_reprogram_ris_partid(struct
> mpam_msc_ris *ris, u16 partid, rprops->mbw_pbm_bits);
>          }
> -       if (mpam_has_feature(mpam_feat_mbw_min, rprops))
> -               mpam_write_partsel_reg(msc, MBW_MIN, 0);
> +       if (mpam_has_feature(mpam_feat_mbw_min, rprops)) {
> +               if (mpam_has_feature(mpam_feat_mbw_max, cfg))
> +                       mpam_write_partsel_reg(msc, MBW_MIN, cfg->mbw_min);
> +               else
> +                       mpam_write_partsel_reg(msc, MBW_MIN, 0);
> +       }
>         if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
>                 if (mpam_has_feature(mpam_feat_mbw_max, cfg)) @@
> -2332,6 +2336,31 @@ static int __write_config(void *arg)
>          return 0;
>   }
> +static void mpam_extend_config(struct mpam_class *class, struct
> mpam_config *cfg)
> +{
> +       struct mpam_props *cprops = &class->props;
> +       u32 min, delta;
> +
> +       /*
> +        * MAX and MIN should be set together. If only one is provided,
> +        * generate a configuration for the other. If only one control
> +        * type is supported, the other value will be ignored.
> +        *
> +        * Resctrl can only configure the MAX.
> +        *
> +        * Parts affected by Nvidia's T241-MPAM-4 depend on this occurring,
> +        * and recommend a 5% difference.
> +        */
> +       if (mpam_has_feature(mpam_feat_mbw_max, cfg) &&
> +           !mpam_has_feature(mpam_feat_mbw_min, cfg)){
> +               delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
> +               min = max_t(s32, cfg->mbw_max - delta, BIT(cprops-
>>bwa_wd));
> +
> +               cfg->mbw_min = max_t(s32, cfg->mbw_max - delta, BIT(16 -
> cprops->bwa_wd));
> +               mpam_set_feature(mpam_feat_mbw_min, cfg);
> +       }
> +}
> 
> Shanker
> 

Thanks,

Ben


