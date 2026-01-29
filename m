Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE890D6B072
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gKd8Np1bgwQjF+tTswaMDbCFJPzQr6tLa50I3rPQL8=; b=I9KpIjOAEK/U4sqfmpbBZECrlI
	YCREWLWQ+k6UAbDnjroj915/oNnYISusZSUFCDm9Gk9id+uDExZvR9cPXO/RNiywwJMCqSTattJNG
	cUCPgZEnB8QXwumV49haQR6y3EHvgg5ccKzu6dDULWqO2QApb3ivSJ2n+qEWjClrdEL66LXe0pqKy
	6BwrGbYsCSPI/TnjbMu2ewXafVNJitI/nlCSCUMetWfBZ4wTD4wAoi2WAVRmDbKZ6uiehUhyw0Rgg
	5fbCxrSt/WA8dF80/K1HmykJX4Ixi1KTREHIs/KtvVqjX1VKYPePLGe2sCYm+6EnbQDSge9v4u6JS
	E8Foy/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTvm-00000000HRp-0vry;
	Thu, 29 Jan 2026 15:27:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTvh-00000000HRT-2zjZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:27:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 366DD1576;
	Thu, 29 Jan 2026 07:27:24 -0800 (PST)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA1593F73F;
	Thu, 29 Jan 2026 07:27:29 -0800 (PST)
Message-ID: <299083f7-07e4-436e-ba56-36901aba2855@arm.com>
Date: Thu, 29 Jan 2026 15:27:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Reject unsupported hardware configurations
To: Mark Rutland <mark.rutland@arm.com>
Cc: will@kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <bb47722fc593baf1e1cc0f944089592a4ec708da.1769695523.git.robin.murphy@arm.com>
 <aXttVVoVUQoIjWG6@J2N7QTR9R3>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aXttVVoVUQoIjWG6@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_072733_892587_343ED9FA 
X-CRM114-Status: GOOD (  24.08  )
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

On 29/01/2026 2:23 pm, Mark Rutland wrote:
> On Thu, Jan 29, 2026 at 02:11:22PM +0000, Robin Murphy wrote:
>> So far we've been fairly lax about accepting both unknown CMN models
>> (at least with a warning), and unknown revisions of those which we
>> do know, as although things do frequently change between releases,
>> typically enough remains the same to be somewhat useful for at least
>> some basic bringup checks. However, we also make assumptions of the
>> maximum supported sizes and numbers of things in various places, and
>> there's no guarantee that something new might not be bigger and lead
>> to nasty array overflows. Make sure we only try to run on things that
>> actually match our assumptions and so will not risk memory corruption.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 7819e05a0dce ("perf/arm-cmn: Revamp model detection")
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/perf/arm-cmn.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
>> index 2903e01f951f..24fec53ceccc 100644
>> --- a/drivers/perf/arm-cmn.c
>> +++ b/drivers/perf/arm-cmn.c
>> @@ -2422,6 +2422,15 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>>   			arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, dn);
>>   			dn->portid_bits = xp->portid_bits;
>>   			dn->deviceid_bits = xp->deviceid_bits;
>> +			/*
>> +			 * Logical IDs are assigned from 0 per node type, so as
>> +			 * soon as we one bigger than expected, we can assume
>> +			 * there are more than we can cope with.
>> +			 */
>> +			if (dn->logid > CMN_MAX_NODES_PER_EVENT) {
>> +				dev_err(cmn->dev, "Invalid node number: %d\n", dn->logid);
>> +				return -ENODEV;
> 
> I think "Invalid" is ambiguous (it can read like we're saying the HW is
> wrong), and it would be better to say "Unsupported", or something to
> that effect, e.g.

Yeah, it's a bit fiddly, because "unsupported" doesn't just mean "the 
number in the driver could be bigger" either, these driver limits are 
based on the documented maximum sizes for any currently known product, i.e.:

https://developer.arm.com/documentation/107858/0203/About-CMN-S3-AE-/Configurable-options/Mesh-sizing-and-top-level-configuration

So while larger values might be "valid" for future products we don't 
know about, hardware claiming to be, say, a 16x16 CMN-650 would indeed 
arguably be "wrong".

> 	dev_err(cmn->dev, "Node number (%d) larger than supported (%d)\n",
> 		dn->logid, CMN_MAX_NODES_PER_EVENT)
> 
>> +			}
>>   
>>   			switch (dn->type) {
>>   			case CMN_TYPE_DTC:
>> @@ -2499,6 +2508,10 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>>   		cmn->mesh_x = cmn->num_xps;
>>   	cmn->mesh_y = cmn->num_xps / cmn->mesh_x;
>>   
>> +	if (max(cmn->mesh_x, cmn->mesh_y) > CMN_MAX_DIMENSION) {
>> +		dev_err(cmn->dev, "Invalid mesh size: %dx%d\n", cmn->mesh_x, cmn->mesh_y);
> 
> Likewise:
> 
> 	dev_err(cmn->dev, "Mesh size (%%dx%d) larger than supported
> 		(%d)\n", cmn->mesh_x, cmn->mesh_y, CMN_MAX_DIMENSION);
> 
>> +		return -ENODEV;
>> +	}
>>   	/* 1x1 config plays havoc with XP event encodings */
>>   	if (cmn->num_xps == 1)
>>   		dev_warn(cmn->dev, "1x1 config not fully supported, translate XP events manually\n");
> 
> ... or you could align with the wording here.

That one is different because it *is* purely a driver limitation - the 
different event encoding is known, it's just that having to have dynamic 
format attributes for the relevant event aliases would be a massive pain 
to implement, and so far nobody's asked for it. So this is just a 
reminder to the user that in this situation the "p0" aliases will 
actually encode events for port 4, "n" means port 0, etc., per the TRM:

https://developer.arm.com/documentation/101569/0300/Programmers-model/Register-descriptions/XP-register-descriptions/por-mxp-pmu-event-sel?lang=en

This is aligned with the "invalid device node type" message (other than 
capitalisation, bah!) that's been there from day 1 to fail probing on 
anything so new and unknown that it has components we can't even comprehend.

> Aside from the specific wording for the messages, this looks god to me.

Hallelujah!

Thanks,
Robin.

