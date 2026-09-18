Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A928C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwRXHz5FiptGYQutzRNzBHkTh1iJbrIvkQlOJLZw8zA=; b=KkxwbzO2bLM667
	0qvY77eCX+yA9f3anP3HVt0mnKU5VS/Fg9jpSFA2IgwsrUXB2c+m31HfZd/N4RmOZGnw+luvzVBlh
	IxJeD7OHIaIlBjnF/g3qCDKkiwufcvNPEIvkZD8Ns5x/7fNeBbP4et4ClolfrcpWZR6jaIVNs/8Vi
	aGE15ISDbFIC6tvIPAmQ5//O8nIxdB3yaQ6y4yxG1bj0+2s9HqM23hopipzKSgfxlBYgE0lZrc3zO
	sUO5Xt6exa23n6+GTL9tz6Ok5BbMETCxF3LxDzGHj2MVJaWMx2CaSWpX4MGQIUNDKAAPcvvqPRmOx
	cSfJLWy6RaZxLFoI0vpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XGW-0000000EJTi-2YU8;
	Fri, 18 Sep 2026 12:00:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XGU-0000000EJT5-1xtE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:00:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C284143D;
	Fri, 18 Sep 2026 05:00:20 -0700 (PDT)
Received: from [10.41.4.144] (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED1AB3F882;
	Fri, 18 Sep 2026 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789732823; bh=bM7kA5yXVpAe2N81reCqQxQTOv0RJe1wxSCWH8EsWr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XkEDabmBheiCe+/LaTlra5Vgi0cko0/XOIWyrmpjZSq+2fx3JjNly9HRswxfFDJ8D
	 QCJkqQ9h5uNJ65tgfG+ovxBfylbiwy/IA/69AlPOrJoa+lPSPvIc5MQDXTTuKK9Mxp
	 fYBqHrIco/556kXQKvnR6cpLIs+1WlhFKgG1/pdo=
Message-ID: <830ad111-e819-43c2-b0a2-248e0542d7f2@arm.com>
Date: Fri, 18 Sep 2026 14:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] firmware: smccc: lfa: Add timeout and trigger
 watchdog
To: Nirmoy Das <nirmoyd@nvidia.com>
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-4-andre.przywara@arm.com>
 <20260710100830.65336-1-nirmoyd@nvidia.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260710100830.65336-1-nirmoyd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_050026_581652_0458CDF5 
X-CRM114-Status: GOOD (  21.03  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 7/10/26 12:08, Nirmoy Das wrote:
> On Mon, 6 Jul 2026 15:44:43 +0200, Andre Przywara wrote:
> 
> Hi Andre,
> 
>> From: Vedashree Vidwans <vvidwans@nvidia.com>
>>
>> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
>> timeout mechanism. This update ensures that any potential hangs are
>> detected promptly and that the LFA process is allocated sufficient
>> execution time before the watchdog timer expires. These changes improve
>> overall system reliability by reducing the risk of undetected process
>> stalls and unexpected watchdog resets.
>>
>> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 43 ++++++++++++++++++++++++++++++---
>>   1 file changed, 39 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index b333b1e28c0d..357e41f95206 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -6,11 +6,14 @@
>>   #include <linux/arm-smccc.h>
>>   #include <linux/arm-smccc-bus.h>
>>   #include <linux/array_size.h>
>> +#include <linux/delay.h>
>>   #include <linux/fs.h>
>>   #include <linux/init.h>
>>   #include <linux/kobject.h>
>> +#include <linux/ktime.h>
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>> +#include <linux/nmi.h>
>>   #include <linux/psci.h>
>>   #include <linux/stop_machine.h>
>>   #include <linux/string.h>
>> @@ -27,6 +30,11 @@
>>   #define LFA_PRIME_CALL_AGAIN		BIT(0)
>>   #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>>   
>> +#define LFA_PRIME_BUDGET_MS		30000		/* 30s cap */
>> +#define LFA_PRIME_DELAY_MS		10		/* 10ms between polls */
>> +#define LFA_ACTIVATE_BUDGET_MS		10000		/* 10s cap */
>> +#define LFA_ACTIVATE_DELAY_MS		10		/* 10ms between polls */
>> +
>>   /* LFA return values */
>>   #define LFA_SUCCESS			0
>>   #define LFA_NOT_SUPPORTED		1
>> @@ -276,6 +284,7 @@ static int call_lfa_activate(void *data)
>>   	struct fw_image *image = data;
>>   	struct arm_smccc_1_2_regs reg = { 0 }, res;
>>   
>> +	touch_nmi_watchdog();
>>   	reg.a0 = ARM_SMCCC_LFA_ACTIVATE;
>>   	reg.a1 = image->fw_seq_id;
>>   	/*
>> @@ -299,6 +308,7 @@ static int call_lfa_activate(void *data)
>>   
>>   static int activate_fw_image(struct fw_image *image)
>>   {
>> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
>>   	int ret;
>>   
>>   retry:
>> @@ -314,8 +324,14 @@ static int activate_fw_image(struct fw_image *image)
>>   	}
>>   
>>   	/* SMC returned with call_again flag set, or with LFA_BUSY */
>> -	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY)
>> -		goto retry;
>> +	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY) {
>> +		if (ktime_before(ktime_get(), end)) {
>> +			msleep_interruptible(LFA_ACTIVATE_DELAY_MS);
>> +			goto retry;
>> +		}
>> +
>> +		ret = -LFA_TIMED_OUT;
>> +	}
> 
> msleep_interruptible()'s return is ignored (here and in the PRIME
> loop), so a pending signal can turn this into premature retries.

Ah, thanks, that's a good point. I fixed that now. I don't think it 
really matters for the 10ms delay here, but it would break the outer 
timeout as well, which is a couple of seconds.

Cheers,
Andre

>>   
>>   	lfa_cancel(image);
>>   
>> @@ -328,6 +344,7 @@ static int activate_fw_image(struct fw_image *image)
>>   static int prime_fw_image(struct fw_image *image)
>>   {
>>   	struct arm_smccc_1_2_regs reg = { 0 }, res;
>> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
>>   
>>   	if (image->may_reset_cpu) {
>>   		pr_err("CPU reset not supported by kernel driver\n");
>> @@ -335,6 +352,8 @@ static int prime_fw_image(struct fw_image *image)
>>   		return -EINVAL;
>>   	}
>>   
>> +	touch_nmi_watchdog();
>> +
>>   	reg.a0 = ARM_SMCCC_LFA_PRIME;
>>   retry:
>>   	/*
>> @@ -353,8 +372,24 @@ static int prime_fw_image(struct fw_image *image)
>>   		return res.a0;
>>   	}
>>   
>> -	if (res.a1 & LFA_PRIME_CALL_AGAIN)
>> -		goto retry;
>> +	if (res.a1 & LFA_PRIME_CALL_AGAIN) {
>> +		int ret;
>> +
>> +		/* SMC returned with call_again flag set */
>> +		if (ktime_before(ktime_get(), end)) {
>> +			msleep_interruptible(LFA_PRIME_DELAY_MS);
>> +			goto retry;
>> +		}
>> +
>> +		pr_err("LFA_PRIME for image %s timed out",
>> +		       get_image_name(image));
>> +
>> +		ret = lfa_cancel(image);
>> +		if (ret != 0)
>> +			return ret;
>> +
>> +		return -ETIMEDOUT;
>> +	}
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.43.0
> 
> Regards,
> Nirmoy


