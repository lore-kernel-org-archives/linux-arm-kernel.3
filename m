Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762C6606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rGRnuSNX;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZPTH2rmt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aMbPFbhM0NGfaTpsyfc09N2QKzH+fJPg2tPLJvKIlQs=; b=rGRnuSNXWks8iM
	ac9e90nrq5aMVhZLRqiVD7mNEzEcpLyUdejPF4FFVi1h/t5qgGJqB15k6xhaV9ZqaWtv37b+8gy5Y
	QIVyEuJ1op5XJsLZ8oz+A4KUbW7siBT7NY2x3lhZ7cEbdmcIxLX0ldeLjPP0jqll7JyKDyevlGV9M
	UxVYFcxjR1Tqg3ZuPFICiC8N/lrV9m5OGr5vQQaoUAK9CTsr1SbZm3JFTJEo1oViQN71cqSnM0JV8
	e5sJ41s+6HUz3iusszlSzkg0FEpo2SE8Qh/uipI694xbbHaot38yB26nLmv4/qqleRj+HIhM2iNwG
	3iWAA31mBKQ6ZJ7/L6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyVl-00000009Hy4-3ik5;
	Thu, 05 Nov 2026 14:32:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyVg-00000009HxB-3Wl6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:32:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB9AC168F;
	Thu,  5 Nov 2026 06:32:08 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95D4C3F673;
	Thu,  5 Nov 2026 06:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793889131; bh=57jqKN7YeDWabQXBzWNtR7fWKF/1HqcWUWZ6tAgNGJ0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ZPTH2rmtS6mwvYND5oNgIMjrGKwroFa6A+v6YjEVh6dYgT3QgjDjgLwb/GuPUp+5b
	 LOn13CSfGE7jXgGZmsAFeqSSeMlcAY9Ksfla1O9LsdUGnQWlvXXbZ1TFpQ3H0fAZl2
	 6P2+yN97IwrXsSv2XlBwlFh5pVFcwbgaccK5ARo8=
Message-ID: <75364e56-62d3-4d3f-bf79-03ddeaee1121@arm.com>
Date: Thu, 5 Nov 2026 14:32:07 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/7] qcom-tgu: Add signal priority support
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
 <9d450f18-2300-4ead-981b-94bd9eea9126@arm.com>
 <f1e4f462-2aba-470d-84e4-87a12c2a13d3@arm.com>
Content-Language: en-US
In-Reply-To: <f1e4f462-2aba-470d-84e4-87a12c2a13d3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_063213_000583_D045488D 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 05/11/2026 14:14, Suzuki K Poulose wrote:
> 
> On 05/11/2026 13:01, Suzuki K Poulose wrote:
>> On 30/07/2026 09:07, Songwei Chai wrote:
>>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>>> configured in each step and the trigger will be created once the
>>> requirements are met. Add priority functionality here to sort the
>>> signals into different priorities. The signal which is wanted could
>>> be configured in each step's priority node, the larger number means
>>> the higher priority and the signal with higher priority will be sensed
>>> more preferentially.
>>>
>>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>> ---
>>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>>   drivers/hwtracing/qcom/tgu.c                  | 189 +++++++++++++++++-
>>>   drivers/hwtracing/qcom/tgu.h                  | 133 ++++++++++++
>>>   3 files changed, 328 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>> index 36ab64f1e301..7dd24314592d 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>> @@ -7,3 +7,10 @@ Description:
>>>           Accepts only one of the 2 values -  0 or 1.
>>>           0 : disable TGU.
>>>           1 : enable TGU.
>>> +
>>> +What:        /sys/bus/amba/devices/<tgu-name>/ 
>>> step[0:7]_priority[0:3]/reg[0:17]
>>> +Date:        August 2026
>>> +KernelVersion:    7.2
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>>> <songwei.chai@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Set/Get the sensed signal with specific step and 
>>> priority for TGU.
>>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>>> index 9c7dd4a09f02..0e88b437f191 100644
>>> --- a/drivers/hwtracing/qcom/tgu.c
>>> +++ b/drivers/hwtracing/qcom/tgu.c
>>> @@ -15,14 +15,144 @@
>>>   #include "tgu.h"
>>> +static int calculate_array_location(struct tgu_drvdata *drvdata,
>>> +                    int step_index, int operation_index,
>>> +                    int reg_index)
>>> +{

>>> +    return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
>>> +        step_index * (drvdata->num_reg) + reg_index;

I am confused by this, probably amplified by the bad naming of num_step,
num_reg ?

I perceive num_step => numbe of steps in the hardware

num_reg => number of registers (or controls) in a given priority field ?

If that is the case, shouldn't the index be :

step_index *  (drvdata->num_step) * (drvdata->num_reg) +
op_index * (drvdata->num_reg) + reg_index ?

...

>>> +
>>> +struct value_table {
>>> +    unsigned int *priority;
>>> +};
>>>   static inline void TGU_LOCK(void __iomem *addr)
>>>   {
>>> @@ -36,6 +163,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>>    * @lock: Mutex serialising enable/disable and the associated PM 
>>> runtime
>>>    *        reference counting against concurrent sysfs access
>>>    * @enabled: Flag indicating whether the TGU device is enabled
>>> + * @value_table: Store given value based on relevant parameters
>>> + * @num_reg: Maximum number of registers

Where ? in a priority ? in a step ? Why is this maximum ? Isn't it the
number of "registers implemented on this hardware"

>>> + * @num_step: Maximum step size

Number of steps ? not step size ?

Suzuki
>>>    *
>>>    * This structure defines the data associated with a TGU device,
>>>    * including its base address, device pointer, the lock serialising
>>> @@ -46,6 +176,9 @@ struct tgu_drvdata {
>>>       struct device *dev;
>>>       struct mutex lock;
>>>       bool enabled;
>>> +    struct value_table *value_table;
>>
>> Why this ? why not
>>
>>      struct value_table value_table ?
>>
>> Surely, we seem to be dynamically allocating the priorities etc from 
>> there. But do we need dynamic allocation for value_table field as
>> such ?
>>
>> Suzuki
>>
>>> +    int num_reg;
>>> +    int num_step;
>>>   };
>>>   #endif
>>
> 


