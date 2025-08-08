Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E226DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgY7Wt/iksn6GXhnlRrEOp2iKU+bBP/PM5bEubT4jOk=; b=gskN9PXUaa9+9RVcDCJcOoGepJ
	CtUTry6wRnWMpz/8Sy7Al0ZwkHrhUxPNjt15V4ov7E4tHZlA54LIRe6tCrccrB4N8LE/YnkQnoMrm
	dhKRANE+OO4hDmEJ8MsNTeGlu4dgt1dZHiWWWe7bUKOurvuULn01xesFFFDlX4SL54tHaeFqyBl7/
	d1yUtPZCm9bXeOZEn2hbJoM2Sg+nYBs4m2CoO7udxNex3yIIRWniiyutIjoMizb2PxtVn7bWLzaSX
	lt+BHtK6YpmshYtwp1y1ikHAxYCa3QQLEQbkvLVOxV0o+9NrjZiZiM/sPjA8+D5Db0DWfH9gTCa8Y
	Ex+JU6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHV5-00000002Bhq-2xBc;
	Fri, 08 Aug 2025 07:26:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHII-00000002AEl-2nN9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:13:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 142CE16F8;
	Fri,  8 Aug 2025 00:13:30 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E1C53F673;
	Fri,  8 Aug 2025 00:13:32 -0700 (PDT)
Message-ID: <563d88c1-a598-451d-a3ad-437d91d68f1b@arm.com>
Date: Fri, 8 Aug 2025 08:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 27/36] arm_mpam: Allow configuration to be applied and
 restored during cpu online
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-28-james.morse@arm.com>
 <OSZPR01MB8798812D121619E9BB9BDF2A8B56A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB8798812D121619E9BB9BDF2A8B56A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_001338_807619_379B26FC 
X-CRM114-Status: GOOD (  19.02  )
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

Hi Shaopeng,

On 16/07/2025 07:49, Shaopeng Tan (Fujitsu) wrote:
>> When CPUs come online the original configuration should be restored.
>> Once the maximum partid is known, allocate an configuration array for each
>> component, and reprogram each RIS configuration from this.
>>
>> The MPAM spec describes how multiple controls can interact. To prevent this
>> happening by accident, always reset controls that don't have a valid
>> configuration. This allows the same helper to be used for configuration and
>> reset.
>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c
>> b/drivers/platform/arm64/mpam/mpam_devices.c
>> index bb3695eb84e9..f3ecfda265d2 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c

>> @@ -909,51 +913,90 @@ static void mpam_reset_msc_bitmap(struct
>> mpam_msc *msc, u16 reg, u16 wd)
>>  		__mpam_write_reg(msc, reg, bm);
>>  }
>>
>> -static void mpam_reset_ris_partid(struct mpam_msc_ris *ris, u16 partid)
>> +/* Called via IPI. Call while holding an SRCU reference */ static void
>> +mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>> +				      struct mpam_config *cfg)
>>  {
>>  	u16 bwa_fract = MPAMCFG_MBW_MAX_MAX;
>>  	struct mpam_msc *msc = ris->vmsc->msc;
>>  	struct mpam_props *rprops = &ris->props;
>>
>> -	mpam_assert_srcu_read_lock_held();
>> -
>>  	mutex_lock(&msc->part_sel_lock);
>>  	__mpam_part_sel(ris->ris_idx, partid, msc);
>>
>> -	if (mpam_has_feature(mpam_feat_cpor_part, rprops))
>> -		mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM,
>> rprops->cpbm_wd);
>> +	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
>> +		if (mpam_has_feature(mpam_feat_cpor_part, cfg))
>> +			mpam_write_partsel_reg(msc, CPBM, cfg->cpbm);
>> +		else
>> +			mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM,
>> +					      rprops->cpbm_wd);
>> +	}
>>
>> -	if (mpam_has_feature(mpam_feat_mbw_part, rprops))
>> -		mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM,
>> rprops->mbw_pbm_bits);
>> +	if (mpam_has_feature(mpam_feat_mbw_part, rprops)) {
>> +		if (mpam_has_feature(mpam_feat_mbw_part, cfg))
>> +			mpam_write_partsel_reg(msc, MBW_PBM,
>> cfg->mbw_pbm);
>> +		else
>> +			mpam_reset_msc_bitmap(msc,
>> MPAMCFG_MBW_PBM,
>> +					      rprops->mbw_pbm_bits);
>> +	}
>>
>>  	if (mpam_has_feature(mpam_feat_mbw_min, rprops))
>>  		mpam_write_partsel_reg(msc, MBW_MIN, 0);
>>
>> -	if (mpam_has_feature(mpam_feat_mbw_max, rprops))
>> -		mpam_write_partsel_reg(msc, MBW_MAX, bwa_fract);
>> +	if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
>> +		if (mpam_has_feature(mpam_feat_mbw_max, cfg))
>> +			mpam_write_partsel_reg(msc, MBW_MAX,
>> cfg->mbw_max);
>> +		else
>> +			mpam_write_partsel_reg(msc, MBW_MAX,
>> bwa_fract);
>> +	}

> 0 was written to MPAMCFG_MBW_MAX. [HARDLIM].
> Depending on the chip, if [HARDLIM] is set to 1 by default, it will be overwritten.

Hardlimit was shoe-horned into the architecture as a backward-compatible thing. It's not too
surprising it gets stamped on here - it was previously RES0. Again, the architecture doesn't
say what the reset value of the register is - generally you can't rely on bits being preserved
if the OS doesn't know what they are.

For the full picture - we don't have a way of getting a hard-limit hint from resctrl. Currently
its just ignored as the behaviour will then be 'the same' on platforms that do or don't have
hardlimit. If we add something like that to the user-space interface - then we can plumb it in.
Enabling it on platforms that have it now will make that a murky picture as the 'old' behaviour
would need to be preserved.

Yes, mpam_devices.c should give its callers a way of setting hardlim - but today resctrl can't.



Thanks,

James

