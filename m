Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8263810F2847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLwZxg+OX1A3lxVf5y7n4bPyXEh1Tpg8FCtox+FDlqs=; b=tQPlyQtjjHpaxAGa7o+nHCCgxl
	gH4sxCmsQqpK6wUtx+soTEOpjtFClPwrGSzEXhelSqSp8VT0baN3pbvhtpDl/QYI9lRN55mlwyO86
	R7zXAppSljtn9hcd6MrxHsnwT9wAV99MyuqlW/pVeTROx7BRi29pr06PzmqaEV1qgL53tndFtWDOy
	7OAL9DRfig19TU4668vsv+B0pPOJkcD2x/qWtg4ofuuvPfW1B9IXtxA6FFLti8JOVMDQMI/oSVT11
	nG3vS4y1bFRL/vsKfIkp+XGOZGB9I/p41lszKZrWf3NL4eaWPY87yypW695hMpDAZtvX7eSS2bZ1Q
	jS5ZjC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69P2-00000007iWI-1Awq;
	Fri, 27 Mar 2026 15:47:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Oz-00000007iVo-3WB1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:47:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6C9D35E4;
	Fri, 27 Mar 2026 08:47:06 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD5713FBF8;
	Fri, 27 Mar 2026 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774626432; bh=FwlH74TR5RapPRWbQ8EZJzyzw7m7rDT/kv8QOqeRWLk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pn20w3r64JfebMfmtSSXpMWLvZj0MW+93FnR/sIQAHXY3Yh+woGkOkAEN7/vouEe8
	 rMQt2APDwyIa+dvsmtRvzT2LBNxcN/Hp+0fUyqh8m4c5rC16B34QqkzETJw1qYEnxz
	 ns9SzT3OlvGzT4iOmXuuQP6ir2beZrTs4/b/DXvQ=
Message-ID: <85c10fab-9b4e-4a57-9b4e-42adcd069a5e@arm.com>
Date: Fri, 27 Mar 2026 15:47:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 22/40] arm_mpam: resctrl: Convert to/from MPAMs
 fixed-point formats
To: Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-23-ben.horgan@arm.com>
 <bd450f1f-05a3-44d6-9bbc-1c48d967baa4@redhat.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <bd450f1f-05a3-44d6-9bbc-1c48d967baa4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084713_912092_4C2A4887 
X-CRM114-Status: GOOD (  13.45  )
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

Hi Gavin,

On 23/03/2026 22:49, Gavin Shan wrote:
> On 3/14/26 12:45 AM, Ben Horgan wrote:
>> From: Dave Martin <Dave.Martin@arm.com>
>>
>> MPAM uses a fixed-point formats for some hardware controls.  Resctrl
>> provides the bandwidth controls as a percentage. Add helpers to convert
>> between these.
>>
>> Ensure bwa_wd is at most 16 to make it clear higher values have no meaning.

> One nitpick below, but this looks good to me in either way.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks!


>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 0e5e24ef60fe..0c97f7708722 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -713,6 +713,13 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>>               mpam_set_feature(mpam_feat_mbw_part, props);
>>             props->bwa_wd = FIELD_GET(MPAMF_MBW_IDR_BWA_WD, mbw_features);
>> +
>> +        /*
>> +         * The BWA_WD field can represent 0-63, but the control fields it
>> +         * describes have a maximum of 16 bits.
>> +         */
>> +        props->bwa_wd = min(props->bwa_wd, 16);
>> +
> 
> 16 may deserve a definition for it since it's a constant value and referred
> for multiple times in this patch, if we need to give this series another
> respin :-)

Hmmm.,. I've left this, I'm not sure what you'd call it. U16_BITS? That sort of thing
might be needed for long/int etc. Here there is either a comment, or its
accepting/returning a u16. I think its fairly obvious where the number 16 is coming from.



Thanks,

James

