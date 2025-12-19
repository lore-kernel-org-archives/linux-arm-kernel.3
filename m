Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDD2D78761
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d/49jiU2VbspwFkhsc7k2+AvqccZjks3RDCcg+G+uY=; b=L3ux+JBDpYYhhbGcx6HQH8cRai
	I8HNNf5hybam435H7olzNg0SeD4jTSrOTaW0vaLSvdXCNY19jBhJx5GW60bl/Xb9W10b0A3foI/vU
	/05bVUR6QmOtWlFjRr4j8KGMfp3wyits2FH9S5SXa7yxIkd5dOVFy/6ZU57PS3Nl6M0t4CMWN9P/+
	UPrgMoqKyOr6w8KyCrcDn1XRpDDvWUWe2inl8pGzXtV0cGztFhWtD7ZHCwhTdmgazDalWulOWprLZ
	MBRVhwyUq4HCjomolR08kcqhRix4c/+evMHgKEfQRhixsmLWcpJDj7c5stH87jcnAnlN07xNHko1V
	55wWtSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZSQ-0000000AHEQ-28o4;
	Fri, 19 Dec 2025 12:19:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZSO-0000000AHDa-1s4L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:19:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92229106F;
	Fri, 19 Dec 2025 04:19:32 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 663093F762;
	Fri, 19 Dec 2025 04:19:36 -0800 (PST)
Message-ID: <36aae6f9-e819-4a12-bad3-d7f6b3c45caf@arm.com>
Date: Fri, 19 Dec 2025 12:19:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 34/38] arm_mpam: Add quirk framework
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Gavin Shan <gshan@redhat.com>,
 rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-35-james.morse@arm.com>
 <20251218140401.000062ce@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251218140401.000062ce@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041940_626695_14769A21 
X-CRM114-Status: GOOD (  23.25  )
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

Hi Jonathan,

Thanks for your review. I haven't replied to every point but unless
commented I have acted on them.

On 12/18/25 14:04, Jonathan Cameron wrote:
> On Fri, 5 Dec 2025 21:58:57 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> From: Shanker Donthineni <sdonthineni@nvidia.com>
>>
>> The MPAM specification includes the MPAMF_IIDR, which serves to
>> uniquely identify the MSC implementation through a combination of
>> implementer details, product ID, variant, and revision. Certain
>> hardware issues/errata can be resolved using software workarounds.
>>
>> Introduce a quirk framework to allow workarounds to be enabled based
>> on the MPAMF_IIDR value.
>>
>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>> [ morse: Stash the IIDR so this doesn't need an IPI, enable quirks only
>>   once, move the description to the callback so it can be pr_once()d, add
>>   an enum of workarounds for popular errata. Add macros for making lists
>>   of product/revision/vendor half readable ]
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>>  drivers/resctrl/mpam_devices.c  | 27 +++++++++++++++++++++++++++
>>  drivers/resctrl/mpam_internal.h | 26 ++++++++++++++++++++++++++
>>  2 files changed, 53 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 741e14e1e6cf..f0f6f9b55ad4 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -630,6 +630,25 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
>>  	return ERR_PTR(-ENOENT);
>>  }
>>  
>> +static const struct mpam_quirk mpam_quirks[] = {
>> +	{ NULL }, /* Sentinel */
> 
> Drop the trailing , given I assume whole point is nothing after this?
> 
>> +};
>> +
>> +static void mpam_enable_quirks(struct mpam_msc *msc)
>> +{
>> +	const struct mpam_quirk *quirk;
>> +
>> +	for (quirk = &mpam_quirks[0]; quirk->iidr_mask; quirk++) {
>> +		if (quirk->iidr != (msc->iidr & quirk->iidr_mask))
>> +			continue;
>> +
>> +		if (quirk->init)
>> +			quirk->init(msc, quirk);
> 
> I'm curious why you don't return a bool from this and call
> mpam_set_quirk() if that's not indicating it should not be set.
> Seems a bit odd to push the tracking that is relevant to the generic
> framework (mpam_set_quirk) down into the particular quirk inits.

Good point. I've changed the init to return 0 or an error.

> 
>> +		else
>> +			mpam_set_quirk(quirk->workaround, msc);
>> +	}
>> +}
> 
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index d381906545ed..de3e5faa12b2 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -88,6 +88,8 @@ struct mpam_msc {
>>  	u8			pmg_max;
>>  	unsigned long		ris_idxs;
>>  	u32			ris_max;
>> +	u32			iidr;
>> +	u16			quirks;
>>  
>>  	/*
>>  	 * error_irq_lock is taken when registering/unregistering the error
>> @@ -215,6 +217,29 @@ struct mpam_props {
>>  #define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
>>  #define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
>>  
>> +/* Workaround bits for msc->quirks */
>> +enum mpam_device_quirks {
>> +	MPAM_QUIRK_LAST,
> 
> Dropping this comma should make it harder for anyone to stick an entry
> after this.

Commas removed.

Thanks,

Ben


