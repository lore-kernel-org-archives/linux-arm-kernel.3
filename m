Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC179CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/HaWiow/xB6zTN3hWjD6wjMbbKclNaWvhkPN2MSFVM=; b=W902MNopBeCE0QGi53C8ZzPljy
	Qztym3QX+lwolnT66fy6mdr43VT3k/FFMfGAicdIpFSZE4IbGm7snpf+5P6GOxnszX2Ovo+GGKqLi
	cElSUW8+TUFxwjURKF/VAKx3cVc40XWVQ5nyj+zesgf5Fj5soy3Qw8/Ojbdlgo3GkAlT1wU8D5M6s
	Lr6RIluszZw/wWF8D5lJqMn2gBViMlMxCRpcbTsvZmyxWlLGVBGwGTB7wD/D+FdAak9zmPvOmk05a
	MtZDW9eoJ50nL2yEdHRKs1ALEQj8AQ6yVr5llkbmcyL53gavse1feA01PIXMCAPnH4lY53iHwbbOj
	jEjEpxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQW5-0000000GHnz-2ged;
	Wed, 10 Sep 2025 19:30:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQW3-0000000GHm6-1qcC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:30:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D42016F8;
	Wed, 10 Sep 2025 12:29:54 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7893B3F694;
	Wed, 10 Sep 2025 12:29:56 -0700 (PDT)
Message-ID: <c169aec6-54d1-4ac5-886c-306dad7f6040@arm.com>
Date: Wed, 10 Sep 2025 20:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/33] arm_mpam: Allow configuration to be applied and
 restored during cpu online
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-25-james.morse@arm.com>
 <1996dbf6-df9f-4785-9111-5ba52e789285@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <1996dbf6-df9f-4785-9111-5ba52e789285@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123003_570528_A1C7CFA3 
X-CRM114-Status: GOOD (  30.20  )
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

Hi Ben,

On 28/08/2025 17:13, Ben Horgan wrote:
> On 8/22/25 16:30, James Morse wrote:
>> When CPUs come online the original configuration should be restored.
>> Once the maximum partid is known, allocate an configuration array for
>> each component, and reprogram each RIS configuration from this.
>>
>> The MPAM spec describes how multiple controls can interact. To prevent
>> this happening by accident, always reset controls that don't have a
>> valid configuration. This allows the same helper to be used for
>> configuration and reset.

> What in particular are you worried about here?

'other' controls being left in an unknown state - meaning the one you did set, is useless.

In a sane world, the thing writing the controls would write all the supported registers.
In practice, resctrl only knows about bitmaps. The glue code could provide all the other
values, but I figured it was better for the driver to do it. I'm sure they'll add other
control types, and it would be a nuisance to update multiple callers if there is ever more
than one.

Another angle down here is mismatched components/devices mean a control type could be
hidden if its not available everywhere - so the caller may not be aware of all the
controls it was supposed to provide.


> It does seem a bit
> wasteful that to update a single control in a ris all the controls in
> that ris are updated.

I don't think anyone would ever build something that supports all these. One is most
likely, pushing to three for platforms that support CPOR and CMIN/MAX. By the time you've
taken the IPI to access a cache MSC, the cost of an additional register access is negligible.


> This is needed for reset and restore but do we
> really want if we are just changing one control, e.g. the cache portion
> bitmap.

The original config has been blown away by this point, but we do have the bitmap of what
changed. I guess this is an emergent effect of __write_config() originating from the reset
helper, and the 'empty config' being used to reset devices.

I'd like to keep it as a single function that actually touches these registers.
I'll change to generate a 'maximal' config instead of empty for reset - which pulls the
policy on those values out, and drops the '0 for reset'.

huh ... that is what the ALL_FEATURES macro you pointed out was for ...
I suspect it was the bitmaps that are larger than a u32 that made this hard.



>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index b424af666b1e..8f6df2406c22 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c

>> @@ -1960,6 +2094,79 @@ void mpam_enable(struct work_struct *work)
>>  		mpam_enable_once();
>>  }
>>  
>> +struct mpam_write_config_arg {
>> +	struct mpam_msc_ris *ris;
>> +	struct mpam_component *comp;
>> +	u16 partid;
>> +};
>> +
>> +static int __write_config(void *arg)
>> +{
>> +	struct mpam_write_config_arg *c = arg;
>> +
>> +	mpam_reprogram_ris_partid(c->ris, c->partid, &c->comp->cfg[c->partid]);
>> +
>> +	return 0;
>> +}
>> +
>> +#define maybe_update_config(cfg, feature, newcfg, member, changes) do { \
>> +	if (mpam_has_feature(feature, newcfg) &&			\
>> +	    (newcfg)->member != (cfg)->member) {			\
>> +		(cfg)->member = (newcfg)->member;			\
>> +		cfg->features |= (1 << feature);			\
>> +									\
>> +		(changes) |= (1 << feature);				\
>> +	}								\
>> +} while (0)
>> +
>> +static mpam_features_t mpam_update_config(struct mpam_config *cfg,
>> +					  const struct mpam_config *newcfg)
>> +{
>> +	mpam_features_t changes = 0;
>> +
>> +	maybe_update_config(cfg, mpam_feat_cpor_part, newcfg, cpbm, changes);
>> +	maybe_update_config(cfg, mpam_feat_mbw_part, newcfg, mbw_pbm, changes);
>> +	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, changes);
>> +
>> +	return changes;
>> +}
>> +
>> +/* TODO: split into write_config/sync_config */
>> +/* TODO: add config_dirty bitmap to drive sync_config */

> Any changes to come for these TODO comments?

No time. The dirty bitmap was to help with the problem you highlighted above. Separating
into write/sync was to make it easier to support the firmware-backed thing, which can be
a problem for another day.

I'll drop these.


Thanks,

James

