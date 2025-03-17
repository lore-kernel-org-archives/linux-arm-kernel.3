Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D91C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvSmeQlqS0PVSiztlrJp1EnapLR9YnzwoX8WjGMczkU=; b=miH6USYzdlUZi31Jm1gYAIAVgr
	0/FXoUpTgs1wePxfPxpmEnUDkrnkmE8Kt8htQRjIVZ+BLbuEUDn050RRdPrkneetA0lyDPHmKPv+M
	m2sj6dNey92xfhwkv4XB4QgxT6ADV1tiQGo3+ybdHYK5lVKqmJQ9hGG49xncUzL+CwIL86kD9JQKg
	7O/Xe/YEfSjPzikM+w5Kej+NG085FnuurBrqjzhyCE1bi73eDMbLcDV8LXEGAD8AyMW0XDwSK+9Ef
	dS7Axdu5Yfokp2u8dFhvKl7WhzIei+Gxcg8Iz5AtTWPdKWwy9yST388wA8vz7tR02OBP4jS7cc66h
	wJvDk1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu97K-00000002Td5-2Fv5;
	Mon, 17 Mar 2025 11:58:50 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu94v-00000002TAb-1DGf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 11:56:22 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaecf50578eso791762466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742212579; x=1742817379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nvSmeQlqS0PVSiztlrJp1EnapLR9YnzwoX8WjGMczkU=;
        b=pDbQP89EnJcaGiUUG6bw1p+6mSVHk6I9yCk6BxHhN3A1LcOAyvQFCeI8k2VDZnQSyD
         yoo8jL9BJhxxUpzsGNue/QtREphQ8FoBH+1y9/JEWY7U1l1elr2ehqObO4Ug1qpOFmdB
         ShHHG9KtIn6q8Y5efUJrOSB0GEf/WMYBZopWd+8aOFFFHGqfVVnq8RoCU3zJWJdk0xQx
         uBbzWyuXIlU1zwjCjCxQXxmpveDyDhkdCqDybCM6UVss7R4HNrVVzCDQQnoBmRyEp8Jc
         fywel7LGtiReqjQMEuY3tqH4uDbbMUQ9TVN0+WeAncy/AwMzmf4Vl4GZR7drMVTagv9j
         VZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742212579; x=1742817379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvSmeQlqS0PVSiztlrJp1EnapLR9YnzwoX8WjGMczkU=;
        b=CfbWTyuklM1XhKM1pLypP5bd42F90RpxoCld8LYct1wx/4d9XmvTcUH6Ir9FcO1WTn
         QmwhgTNA7oseVwELJL4IRd10ZtV3+x/LwLEMTsVumAugKHyf0TsfJMyIqBgkEKrpkX4Z
         HJ16VLIF3mo4+4KsVLUZfyG4Czr5QenwDR3CFOXuPpW9keRL5gSDadSBmLKXg2Zg2WtW
         8MDPVdRaX5WDqMgvqHGoy0mRDydGvESaQ1z0Mo+952BNysXwt770sAyqeZab+pMwdgM3
         21zvRGBW2cg6HvtoDTs65kuLFqFn4gHP2lfx9vwU8OO9HdKB18JLu4IgkanYMnVOOTqR
         b4wg==
X-Forwarded-Encrypted: i=1; AJvYcCU8HExDnuxDEGajtfQ1noych1JEoz/nrHn/7z2Y5RRqXRkMbgmksMCG2+zPz7I0m9YUthAb70uCWpZwF0aZ/lsC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ufx3SqdK1QIQLY5YEnE2TKscEBN4NxAUWdjkZnGmr7XjuisG
	D/VDsiVQeHa7BFVDQs5rGismS0XsM6wIswxExd4dNGFwzOs+Ue8B4Y4FOJTwVyc=
X-Gm-Gg: ASbGncsSDp8Xvb7oocylzXmYkKWOSh5YtruisgMhxrMjA3/jcRjGZtEnNxyyb8/2dKM
	/4taoqX1T0Xq8+xVvgH8e6zylMakxsDVvuHr6CbafLS8DNtbfu37vjzhl7DLNJnCl9FhXWBNHOE
	qgm4/JDFnPkK7vbw/FFNAWoPCmu8kLs6/stY++2JfqqbaBX/WkN0WxPT3f6ifSF2CrsMKpAWotk
	D4KmBq/Dv/P99DAWWapI3p9obPqiOuEu/48yiWUh2/jWduFn7m+8Ul5y2TV4bvYOeorjeSDQ0TH
	LPiYSLbO5KDvgxIzMuDJNip7Lsv17fGOFIuAzs20yxUH2m4o6QfeIg==
X-Google-Smtp-Source: AGHT+IElqC4N7WBdN/UwREha3sJL0AOI9i9gOEBfGevhPlzqhMr3fPOn8XBHjesPAtYa3nhFewNk9Q==
X-Received: by 2002:a17:907:a089:b0:ac1:ea39:9b9f with SMTP id a640c23a62f3a-ac330461ce4mr1164128466b.54.1742212579456;
        Mon, 17 Mar 2025 04:56:19 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3e0e4sm657815566b.136.2025.03.17.04.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 04:56:19 -0700 (PDT)
Message-ID: <a4bce4f5-88c3-4755-9ac5-3ce6fb78dfbf@linaro.org>
Date: Mon, 17 Mar 2025 11:56:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] coresight: Add claim tag warnings and debug messages
To: Leo Yan <leo.yan@arm.com>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-5-james.clark@linaro.org>
 <20250313144005.GQ9682@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250313144005.GQ9682@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_045621_347395_7122D96B 
X-CRM114-Status: GOOD (  18.49  )
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



On 13/03/2025 2:40 pm, Leo Yan wrote:
> On Tue, Feb 11, 2025 at 10:39:40AM +0000, James Clark wrote:
>>
>> Add a dev_dbg() message so that external debugger conflicts are more
>> visible. There are multiple reasons for -EBUSY so a message for this
>> particular one could be helpful. Add errors for and enumerate all the
>> other cases that are impossible.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 48 ++++++++++++--------
>>   drivers/hwtracing/coresight/coresight-priv.h |  5 +-
>>   2 files changed, 34 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index 7b53165c93af..7fe5d5d432c4 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -133,16 +133,6 @@ static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
>>                           csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
>>   }
>>
>> -static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
>> -{
>> -       return coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED;
>> -}
>> -
>> -static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>> -{
>> -       return coresight_read_claim_tags(&csdev->access) != 0;
>> -}
>> -
>>   static inline void coresight_set_self_claim_tag(struct csdev_access *csa)
>>   {
>>          csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
>> @@ -169,18 +159,40 @@ static inline void coresight_clear_self_claim_tag(struct csdev_access *csa)
>>    */
>>   int coresight_claim_device_unlocked(struct coresight_device *csdev)
>>   {
>> +       int tag;
>> +       struct csdev_access *csa;
>> +
>>          if (WARN_ON(!csdev))
>>                  return -EINVAL;
>>
>> -       if (coresight_is_claimed_any(csdev))
>> +       csa = &csdev->access;
>> +       tag = coresight_read_claim_tags(csa);
>> +
>> +       switch (tag) {
>> +       case CORESIGHT_CLAIM_FREE:
>> +               coresight_set_self_claim_tag(csa);
>> +               if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
>> +                       return 0;
>> +
> 
> It would be a rare case if a failure happens here.  Seems to me, it
> would be valuable to print a log for this edge case.
> 
> Otherwise, looks good to me.
> 

Yeah I can add dev_dbg("Busy: Couldn't set self claim tag"). Just to 
distinguish this race case from the other busy case.



