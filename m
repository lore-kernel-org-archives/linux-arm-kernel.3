Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95308C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJqQ5euThjeNLRd71HAiyuq36XmQ/RkpJopprD4o5T4=; b=1hPI0arXKmbAncKoTag1gcPoYg
	taEQ9TVzG7guN2T1wr7ck3x9JbYUVFKOMUSCd7C1MEQg7S3oqbP5iGPuRu/ajEVpKggX12TVwbxQh
	cI2zQ8zfr+EV1biJivaJ8Uhe4Q7suJAyw4Iu0KjsondB6wMpd7w/AVT+cgvKT2CYBA5rcHnV9a90h
	Q9gD7Uxx4cjyLQFP2ydCaoZMrxATXhmeXM4v8b1jyZsBrZrol3P44H3RUVwu0DGyWz90vEVANWlSa
	YzyAhYm3OcSW1vtEHKiltJxMj0OSHjULGlaPvP6aAtlycWFxDCC1mTNFIB9mgoc6buPDZu4Vx9vIf
	9DCqVezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dlJ-0000000BL7A-3IhO;
	Fri, 04 Apr 2025 09:54:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ddS-0000000BJm9-03R2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:46:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9072A1515;
	Fri,  4 Apr 2025 02:46:49 -0700 (PDT)
Received: from [10.1.29.21] (unknown [10.1.29.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06A633F59E;
	Fri,  4 Apr 2025 02:46:45 -0700 (PDT)
Message-ID: <69f3429a-57ba-4c02-b1a7-bbf95b2b19db@arm.com>
Date: Fri, 4 Apr 2025 10:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Yabin Cui <yabinc@google.com>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-2-yabinc@google.com>
 <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com>
 <20250402130145.GI115840@e132581.arm.com>
 <CALJ9ZPMx7vqjgkn8OApLBAPwF35v=enHc07A==LXG0C+922rag@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CALJ9ZPMx7vqjgkn8OApLBAPwF35v=enHc07A==LXG0C+922rag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_024650_099882_1CD2862F 
X-CRM114-Status: GOOD (  16.53  )
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

On 03/04/2025 18:53, Yabin Cui wrote:
> On Wed, Apr 2, 2025 at 6:01 AM Leo Yan <leo.yan@arm.com> wrote:
>>
>> Hi Yabin,
>>
>> On Tue, Apr 01, 2025 at 06:21:59PM -0700, Yabin Cui wrote:
>>
>> [...]
>>
>>>> @@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>>>>
>>>>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>>>>   {
>>>> -       int rc;
>>>> +       int rc = 0;
>>>>          struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>>>> +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>>>>
>>>> -       CS_UNLOCK(catu_drvdata->base);
>>>> -       rc = catu_disable_hw(catu_drvdata);
>>>> -       CS_LOCK(catu_drvdata->base);
>>>> +       if (--csdev->refcnt == 0) {
>>>> +               CS_UNLOCK(catu_drvdata->base);
>>>> +               rc = catu_disable_hw(catu_drvdata);
>>>> +               CS_LOCK(catu_drvdata->base);
>>>> +       } else {
>>>> +               rc = -EBUSY;
>>
>> This is not an error if the decremented reference counter is not zero.
>> It should return 0.  Otherwise, the change looks good to me.
> 
> In coresight_disable_helpers(), the return value of catu_disable()
> isn't checked.
> The -EBUSY return was used for consistency with other refcounted
> disable functions
> like tmc_disable_etf_sink() and tmc_disable_etr_sink(). I'm happy to
> change it back
> to 0 if you believe that would be the more accurate return value here.

Please stick to 0 here. This indicates there was no errors w.r.t the 
current session. This is similar to what we do for TMC ETR for e.g.

Suzuki


> 
>>
>> Thanks,
>> Leo


