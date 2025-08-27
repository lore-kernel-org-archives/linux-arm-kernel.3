Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDA4CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Odejtf3qV7d3eSRM0OugXjxzXpcceUxQVCBw56WAwCI=; b=Y3hxUIKOpcCXL3j3woB1EQwltT
	h2sctRA5tdqLMCgt2e0DceRA10dF4tRHz6rcM5XMYH0IMUI4NXHLTyyxiGWw6EPtcNw56nGV2QFiz
	ZmLND9KQ6Sx18vM75PfCbDf/3mVU/G3x2VeTa+G9zQl3Cq4zEN5XXeAw2ZvMvnLOpiiPgp28CXzG3
	lPVjAxLnJWUkqQUKLHNRGpkanZVOZ8M4aDIl+miBZeyPvTTcAng7qr/vUE8cOW7DDcOybnjBxHlgR
	W57ymAVDdZINq8X0IBTctv4iY+U+B1/VM/h1jflhaSX5fSTRP4ONXgZWc4n0WQNEPlwUdElfeia7U
	4JxXqDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIpq-0000000GA5M-2mKe;
	Wed, 27 Aug 2025 16:17:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGmw-0000000Fgbl-2Eku
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:06:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69F6C2720;
	Wed, 27 Aug 2025 07:06:01 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF29D3F738;
	Wed, 27 Aug 2025 07:06:08 -0700 (PDT)
Message-ID: <2c6d68da-fd1a-4b59-8bfc-5e1c66ceaebe@arm.com>
Date: Wed, 27 Aug 2025 15:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: perf: use us_to_ktime() where appropriate
To: Mark Rutland <mark.rutland@arm.com>, Xichao Zhao <zhao.xichao@vivo.com>
Cc: will@kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250813083257.504573-1-zhao.xichao@vivo.com>
 <aK7RkB5p6L17Ffuw@J2N7QTR9R3>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aK7RkB5p6L17Ffuw@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_070610_628249_2DE133E0 
X-CRM114-Status: GOOD (  14.62  )
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

On 27/08/2025 10:36 am, Mark Rutland wrote:
> [adding Robin and LAKML]
> 
> On Wed, Aug 13, 2025 at 04:32:57PM +0800, Xichao Zhao wrote:
>> The arm_ccn_pmu_poll_period_us are more suitable for using
>> the us_to_ktime(). This can make the code more concise and
>> enhance readability.
>>
>> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> 
> Superficially this looks fine to me, so:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> Will, I assume that (if no-one complains) you'll pick this up when
> queueing PMU patches.

Yup, the new helper looks entirely appropriate here. We could perhaps 
take this opportunity to drop the unnecessary cast as well though, since 
automatic promotion from unsigned int to u64 is perfectly well-defined 
and unsurprising.

Thanks,
Robin.

> 
> Mark.
> 
>> ---
>>   drivers/perf/arm-ccn.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
>> index 1a0d0e1a2263..8af3563fdf60 100644
>> --- a/drivers/perf/arm-ccn.c
>> +++ b/drivers/perf/arm-ccn.c
>> @@ -565,7 +565,7 @@ module_param_named(pmu_poll_period_us, arm_ccn_pmu_poll_period_us, uint,
>>   
>>   static ktime_t arm_ccn_pmu_timer_period(void)
>>   {
>> -	return ns_to_ktime((u64)arm_ccn_pmu_poll_period_us * 1000);
>> +	return us_to_ktime((u64)arm_ccn_pmu_poll_period_us);
>>   }
>>   
>>   
>> -- 
>> 2.34.1
>>


