Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A49FC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWf5Vr71FePF2RNlNaysEEmwoRAlNyEkV3VHONBQCKw=; b=SYsOFCyWnk3pU5zpqdqNrfQu/b
	QLehn4hmWGc2srNdyPeC9UZuYLcEjNE6GplxDX1zDAFZSiOopIN+h4UJIPMcZ76tr4rKGCfSkbtn0
	qPXBWXJDJbNWmN6x4XNkbVeF0uNflwMBCe1qrJcSA8rGc5vhr0XPjRn1ZtxNSd267lTuIm2HlkTvQ
	2L7LIUBoolFqArivoKvkL7WxHo4CwWA3z+7tZRxCqY9v9MYEbOKwaFBoqtJ3b+rMisiaT8LH41oxq
	Je3XZtvUd+ZD3HMIrI6mICsEPT2HNxdq9VmXH1yZXuFruFawbo9sQ8xQ1e7sKNkqRcDWAe2jQg5k4
	/30tb5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBrC-00000001TMF-3vV3;
	Tue, 04 Aug 2026 09:54:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBr7-00000001TLH-36RE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 09:54:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D26601476;
	Tue,  4 Aug 2026 02:54:35 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEBF03F66F;
	Tue,  4 Aug 2026 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785837279; bh=XHZ8Hn1v8UipXDtFoVeXGBoWJHqviZySPsof6RP0r40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S1+IOk0W+TSwCHa0LsWc7vuTiAIYvzmGB8EH+zDJ+rwqGOjxDsYXhJFHcsZZbB8xK
	 ZlJpgJLhu2475SS1WnJmA5Om/MTrDqmFoW9TfNbg/4WU1+xpzrNvqNWGIDbRyCxIhV
	 GUDksdC4d0BLkEQAaWEritumj0kjMca+EWf/MBcY=
Message-ID: <2aa75a48-d514-42a2-afda-d7b3357c585a@arm.com>
Date: Tue, 4 Aug 2026 11:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm_mpam: propagate MSC access errors for
 mpam_reprogram_ris_partid()
To: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-8-andre.przywara@arm.com>
 <836c6c2b-6ab0-4dba-9964-aa65ddcb7381@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <836c6c2b-6ab0-4dba-9964-aa65ddcb7381@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_025442_324418_5B2FEE03 
X-CRM114-Status: GOOD (  17.66  )
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

Hi,

On 8/4/26 07:57, Srivathsa L Rao wrote:
> Hi Andre,
> 
> mpam_reprogram_ris_partid() writes hardware registers sequentially.
> If a write fails midway (possible on PCC MSCs via SCMI), the earlier
> writes are already committed and the hardware is left in a partially
> configured state.
> Currently this is safe only because mpam_fb_disable_mpam() tears
> everything down on any firmware error. If that behavior is ever
> relaxed (e.g. for transient BUSY handling), a partial state could
> persist and produce weird behavior?
> 
> I wanted to point this as a design note.

Yes, this might be a potential problem, but as you said at the moment we 
tear down MPAM anyway.
I don't know if we can ever really handle MPAM-Fb errors in a meaningful 
way, but indeed a retry-if-busy seems a worthwhile addition - at a later 
time ;-)

Thanks for all the reviews and comments!

Cheers,
Andre

> On 7/31/2026 10:33 PM, Andre Przywara wrote:
>> Allow the mpam_reprogram_ris_partid() function check for and return
>> errors, and propagate MSC read and write errors from the lower level up.
>> This also covers the callers of this function: mpam_reset_ris() and
>> apply_config().
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 136 ++++++++++++++++++++++-----------
>>   1 file changed, 93 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index 38450c55e45e..32088ad1d67e 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1601,7 +1601,7 @@ void mpam_msmon_reset_mbwu(struct mpam_component 
>> *comp, struct mon_cfg *ctx)
>>       }
>>   }
>>   ...
> 
>> +static int mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 
>> partid,
>> +                     struct mpam_config *cfg)
>>   {
>>       u32 pri_val = 0;
>>       ..
>> -    mutex_unlock(&msc->part_sel_lock);
>> +    return 0;
>>   }
> -- 
> 
> Best Regards,
> Srivathsa


