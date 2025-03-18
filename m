Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F7AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STf3Sf+5a/wmkOpGCjvaj7SwrwAc4/nWRwmk0nhbBxM=; b=0PzzkzVqa/nklACJfUT2E7XdEK
	ZPl3Se9ethCfQWcxeAAMGXh1N+7JmhC+lATigikN81NNGDFvr4r3YzBOnm+AIFnDvS7F+VW0VIy18
	TZLQZEzxJEhDBEh0lJnaEO1mCKmfLLD/RPXep+RGS2VFMjjNZkAKzZ1gu8Gc0Nq3fh04I4aTA8nn4
	CWrFPC+j9Lln3SwPj+tdlvoBOwDOz7e5Kyk3GraCUhJJjdjLBG88lpzQqk2lyQZBrAC9USlwYTRFS
	zS2sF6FHveBMMVX2hR4nPSb0Br3aQiwks5y6zBqKMkxaOpHRyvBpQEQN8cW6idgIa1o65hWSU3gWZ
	nlQX39LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaDb-00000006bIK-0AS4;
	Tue, 18 Mar 2025 16:55:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZzS-00000006ZPd-1yHO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:40:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24B911063;
	Tue, 18 Mar 2025 09:40:37 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 272823F673;
	Tue, 18 Mar 2025 09:40:28 -0700 (PDT)
Message-ID: <e1d7aee0-06e4-4aa3-be37-98b0e9b165fe@arm.com>
Date: Tue, 18 Mar 2025 16:40:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH Resend] perf/arm-cmn: Remove CMN-600 DTC domain special
 case
To: Will Deacon <will@kernel.org>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <67985e39f53b56385d79a4f1264cf7f9cacedb58.1742308248.git.robin.murphy@arm.com>
 <20250318161744.GB13981@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250318161744.GB13981@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_094030_557357_7D6122C8 
X-CRM114-Status: GOOD (  14.86  )
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

On 18/03/2025 4:17 pm, Will Deacon wrote:
> Hi Robin,
> 
> On Tue, Mar 18, 2025 at 02:32:10PM +0000, Robin Murphy wrote:
>> The special case for trying to infer the DTC domain for DTC-adjacent
>> nodes on CMN-600 is fragile and buggy - currently resulting in subtly
>> messed up DTC counter allocation - and the theoretical benefit it
>> offers to a tiny minority of use-cases arguably doesn't outweigh the
>> inconsistency it offers to others anyway. Just get rid of it.
>>
>> Fixes: ab33c66fd8f1 ("perf/arm-cmn: Enable per-DTC counter allocation")
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/perf/arm-cmn.c | 7 -------
>>   1 file changed, 7 deletions(-)
> 
> You've got "Resend" in the subject, but I can't seem to find the original
> posting :/
> 
> Please can you point me at it? I just want to make sure that I'm not
> missing patches, as you're unlikely to be the only person affected if
> that is the case.

Sorry, forgot to explain below the cut - this is a resend from my end 
because I fat-fingered my LAKML alias the first time around, so I wasn't 
entirely sure whether you'd get it twice. I guess the error I got was 
actually from the SMTP server before it delivered anything, phew!

Thanks,
Robin.

