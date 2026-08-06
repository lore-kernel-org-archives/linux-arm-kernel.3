Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A52C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 19:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZaLoYN/cgNBUOKrY4XPPJtzWf2iV+7yJYT/AIULdiA=; b=KEBn7/tGZuNEJrSQ4URFePMAJK
	IbiJ82zuM1waHNwsnwqKD+6yO1BZX/RDkj5iub1KboT1dFes2SVP6Uxz87yOadWfaOrAKHxp8wNzc
	E8ESviK75418TrnsQilSOwiQpQpEoXZKTlzWIgLT+nN65yoYifLxYcncwVkDPaWiqIg3z6mMv/uwD
	czCcJD9iTALf+TO9WyHxf7DAjAnbsdILFbOT4LKkpZnpSJIuzpOnz9HTkZEYsF+tHCL8X/HsB4puo
	GsiWcSFbRIyK9Lz0Tt/eZh8znn/M5ZSpGDTIeK2sCMvVRzsKsR13y8dr0+W8xEVDB/EaLeMPBKL2r
	7CAgR4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3tY-00000006Zmd-0hPn;
	Thu, 06 Aug 2026 19:36:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3tV-00000006ZmI-3Gjg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 19:36:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6099E153B;
	Thu,  6 Aug 2026 12:36:39 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.68.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 969873F632;
	Thu,  6 Aug 2026 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786045003; bh=B3QYSXdvc0oqTbovybXloJu6jzJklawFLwgQF9VZllw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j74uIjjoAHtxwZflmYnBeXQSz1b5Zd5wQNmJqHWWTCr3HJNi0etJrQ3ZivCvVTiL8
	 yWCNy5rFTf3uyAKc8dOlVb9qALxGHmgljFM5Rbyby6/4HHXdM5gfcWW5yCkWMXegBl
	 LZSGQ/OMNNaRPynPgHQdF1z/4yLZsWFyNYW6o17A=
Message-ID: <0b7702a8-8ffd-468a-b328-755000bd71f2@arm.com>
Date: Thu, 6 Aug 2026 20:36:30 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v1 1/2] arm_mpam: Fix a NULL pointer dereference on
 unbinding after an error interrupt
To: Andre Przywara <andre.przywara@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, will@kernel.org, catalin.marinas@kernel.org
References: <20260806144631.2502918-1-ben.horgan@arm.com>
 <20260806144631.2502918-2-ben.horgan@arm.com>
 <51f5d369-9491-49cb-957a-dd70ad42ecd6@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <51f5d369-9491-49cb-957a-dd70ad42ecd6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_123646_002043_140C1B85 
X-CRM114-Status: GOOD (  20.43  )
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

Hi Andre,

On 8/6/26 16:38, Andre Przywara wrote:
> Hi,
> 
> On 8/6/26 16:46, Ben Horgan wrote:
>> If a user unbinds an MSC after mpam_disable() has been run in response
>> to an error interrupt then a dereference of a NULL pointer occurs as
>> mpam_disable() sets the drvdata to NULL. Add an early return to the
>> driver
>> remove callback to avoid this.
> 
> Yes, I added a very similar patch to my stack yesterday, in response to
> a Sashiko complaint.
> However I was still calling mpam_free_garbage() at the end, to me it
> looks like this is not depending on any MSC?

mpam_free_garbage() doesn't depend on any MSC but it won't have any work
to do unless something in the driver has been destroyed and
mpam_disable() already calls mpam_free_garbage() after it calls the
_destroy() functions. Hence, I think it's ok either way.

Thanks,

Ben

> 
> Cheers,
> Andre
> 
>> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver
>> and kbuild boiler plate")
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/
>> mpam_devices.c
>> index 2f09f4b78bd3..bc6cc0b5c96b 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2025,6 +2025,9 @@ static void mpam_msc_drv_remove(struct
>> platform_device *pdev)
>>   {
>>       struct mpam_msc *msc = platform_get_drvdata(pdev);
>>   +    if (!msc)
>> +        return;
>> +
>>       mutex_lock(&mpam_list_lock);
>>       mpam_msc_destroy(msc);
>>       mutex_unlock(&mpam_list_lock);
> 


