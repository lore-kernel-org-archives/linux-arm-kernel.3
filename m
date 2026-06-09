Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E75CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOGtiZIuG5iqPGEZ8VV9n/wlUz9d1Dmnb+gR7hfISv4=; b=y3Nx+oSuLmgpm73116kdfuRy0Z
	zHM3IrQ+hyVQi/GZZRIC3Ve47BOskuj0t9NtuCjPZYtIbRSt8macqTkqgxpqEATV5o5ouV2VMsvNR
	MnTZkuuEqg+xq9hDZpBMbvVr6xbshNN3zpm6BfvZGMDLQWslZM9tp3RMnKxuWwAAT6NVrGiYqgN0N
	E5BWQxhMG5aMHfV4OnSMDIf31PAL5iaNdWYjiImXi1C/g8T0/w6MA987tkMrcovyrYALdvWqdpdk0
	DPA1GzDWTFD31Dhjl3GRpf5zJ6FXU4RRu6ouoQol46he4Ok5yv7OkWcNUnNSv8LA3aE4j3/mr4lWw
	7VqaBaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsVi-00000005Aen-3dsO;
	Tue, 09 Jun 2026 09:12:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsVf-00000005AdS-3em2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:12:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79A972680;
	Tue,  9 Jun 2026 02:12:27 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEC5E3FE53;
	Tue,  9 Jun 2026 02:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780996352; bh=20l+M9cKIIc+qHq9b/2SZyr08LBnY9oy9uMQ5RLs7b4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CLuh/ci1C2qg51ms5tI5FRn3K+uLDBBe3UFzYnW14aRJkqs7iz8+xgFbNuY1T0++c
	 FT8FlWxcQhn3u69/znJE+U+BCWIA0PIWBX/le21Xd5q3uaOqN4+xM32lnNLGgQ8gxp
	 3xmrZ9/vDRywVCc7WdmFyCRi0/6fNoiRDZXyOoEI=
Message-ID: <85f0def3-6f4d-43cf-9c99-5ca173c998ee@arm.com>
Date: Tue, 9 Jun 2026 10:12:23 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] arm_mpam: Fix MPAMCFG_MBW_PBM register setting
To: Fenghua Yu <fenghuay@nvidia.com>, Gavin Shan <gshan@redhat.com>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>,
 Jesse Chick <jessechick@os.amperecomputing.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matt Ochs <mochs@nvidia.com>
References: <20260607050925.252475-1-fenghuay@nvidia.com>
 <1a9e10ef-266e-43c7-8722-eb61a1af1565@redhat.com>
 <c994c0a5-9610-49a0-8fda-82f088264ef4@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <c994c0a5-9610-49a0-8fda-82f088264ef4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_021236_026455_1184BFFA 
X-CRM114-Status: GOOD (  26.35  )
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

Thanks for the fix!

On 6/9/26 03:06, Fenghua Yu wrote:
> Hi, Gavin,
> 
> On 6/7/26 21:46, Gavin Shan wrote:
>> Hi Fenghua,
>>
>> On 6/7/26 3:09 PM, Fenghua Yu wrote:
>>> MPAMCFG_MBW_PBM is written from cfg if cfg has the MBW partition feature.
>>> It is reset when cfg does not have the MBW partition feature.
>>>
>>> But the register handling is reversed. This may cause an incorrect
>>> register setting. For example, during an MPAM reset, reset_cfg is
>>> empty (no MBW partition feature set), and cfg->mbw_pbm is 0. Instead of
>>> resetting MPAMCFG_MBW_PBM to all 1's, the current logic will set it to
>>> cfg->mbw_pbm, which is 0.
>>>
>>> Fix the issue by swapping the if/else branches.
>>>
>>> Fixes: a1cb6577f575 ("arm_mpam: Reset when feature configuration bit unset")
>>> Reported-by: Matt Ochs <mochs@nvidia.com>
>>> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
>>> ---
>>>   drivers/resctrl/mpam_devices.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>
>> The fix itself looks reasonable to me, but two questions below.
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
> Thank you for reviewing the patch!
> 
>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ mpam_devices.c
>>> index 4b93e89c2678..d8b0383cee92 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -1570,9 +1570,9 @@ static void mpam_reprogram_ris_partid(struct
>>> mpam_msc_ris *ris, u16 partid,
>>>       if (mpam_has_feature(mpam_feat_mbw_part, rprops)) {
>>>           if (mpam_has_feature(mpam_feat_mbw_part, cfg))
>>> -            mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops- >mbw_pbm_bits);
>>> -        else
>>>               mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);
>>> +        else
>>> +            mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops- >mbw_pbm_bits);
>>>       }
>>>       if (mpam_has_feature(mpam_feat_mbw_min, rprops)) {
>>
>> Which machine or system where mpam_feat_mbw_part is set on RIS? As I can
>> remember, this feature isn't available on grace-hopper.
> 
> Neither Grace nor Vera supports this feature.
> 
>>
>> Besides, I don't think this feature is well handled at present because
>> mpam_config::mbw_pbm is only 32-bits in length, which doesn't match with
>> the maximal length of the bit map (4096) as documented in the spec.
> > Right. The current code only can support up to 32 bits of PBM bitmap. If PBM
> bitmp length is bigger than 32 bits, it's broken. I guess we will need to handle
> this feature properly when hardware supports more than 32 bits of PBM bitmap.

mpam_config::mbw_pbm shouldn't have made it into the driver as nothing ever sets
it. Otherwise, there is no attempt to make use of the MBW_PBM other than to
reset it to an appropriate value, which this patch fixes. I guess this is a
lesson for me on the perils of dead code.

> 
> Ditto for CPBM bitmap.

If the CPBM bitmap has more than 32 bits, as checked by
cache_has_usable_cpor(), then we don't attempt to configure it other than to
reset. If there is hardware with more than 32 bits we'd first consider extending
this to 64bits.

> 
> This patch currently only fixes the regression issue introduced in commit
> a1cb6577f575 regardless size of PBM bitmap.

Looks good to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> 
> Thanks.
> 
> -Fenghua


