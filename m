Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23839D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtTjB6Sx5erYKk3Ax2gxl821BwwmVPc6hYwHiojJ3es=; b=msrcj+jaD6N7iTslQiGsb4mLFc
	1j5baGjFMCjMYIQ0UGCVppu2Ii9I3pjiEAd8KN0VuWz7KoMo0ddWQTavpicfYulCseFNiwWwUzNak
	e+pqewDJJ63FsvYqCfrdtzz1zMKdvW28wgm3KJwpxRGRepnxXKiB1OJPcjhryo2NAYMfgw2ppdmX+
	hD74+GbOEA/dDRWjzC1U1NWb6inBqckOMeT4/j/5RTTpYmgfBhNuBn016C76HFakOBl7yodTmDOAF
	MMx84KssIh/O9s1uJOzDDsXweWdy9K8Z/mRFZb6i8UVki1aVw01u0H3AXtxNVXQwEl8dGy/UG/Cf6
	s0xdDP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYKh-0000000GJ6V-1Ox3;
	Thu, 27 Nov 2025 09:30:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYKe-0000000GJ5l-3W8f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:30:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477aa218f20so3421925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764235831; x=1764840631; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtTjB6Sx5erYKk3Ax2gxl821BwwmVPc6hYwHiojJ3es=;
        b=LglozVBgH+fvqUTAIr52N5+Sn+aai5j7YTUZ7EQGiwMr2IbsiE7ar3w/r1GdtfCdki
         qXBGMrUBdJTgGl5YY30reRRxnVHuu0fNuk3rzSo5USPxPVU2vLbM7MNxznKXuGViMnyC
         KEK7rGSYboOwk2Pj4eQ2fwbnmBTO+RxlsYlsAxy+DwFltVDEiQbVUW502Q4iLrt4/6Z7
         uaKgcsqWbP2Gu2qlcGD7onLUXbS3MbtU50Er3kux8oqQarMH+/jTDOBpEMViDaQ0Okq+
         jFKEu34qATWCrTeTBNU89Ts2HL+G6NRgS27rrGe5cxupxbdcUCliUqUm4Y26tiVePXCO
         2grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235831; x=1764840631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtTjB6Sx5erYKk3Ax2gxl821BwwmVPc6hYwHiojJ3es=;
        b=HrhcylPWu/FbEUZRt3supV48XWkO33vEfw/YNxyZ3Ofsgg6DJxu1Svaw60uMYVeBQX
         VJdoxyfnt9tMvTeDvl0i/3iRJ2MKF6uMJXh0EWaNM6FIAAG7Uapbd/Piu7GbPo7C8SfL
         CSytdSbZrC7NX2MhFEvYq2YAt6Bsabsv0HR6SneGeM175aEUQN2vweBRneXeVhpZ2Tdr
         6INlTvd/VenOKyG5nWlmTF6hRw1/3BSYejWTUyODRKeae5a1Hd5B9gKJ5WRGy9RFmbaK
         xbqY9kX2Hm2nS4YXaT4CyIb+A0AlsfSxZCI/B2C1m0qSB9KuXVVjOqRqglrFFfg6cmp/
         a2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA/TohKvKLw4YnoYYNf22pr/L8W5t/NcIDAq9ByE7EkH7ZwF0eLxSyQPLuDlXeehBNuBJJCzrvDcTvoP3spJPI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2onGjiN3mlubs5Ho7DxC7fIkKcl71Qpfsn4U7sYh0WvsD4v3z
	SNriXj4p6OC6sEUzFsdGwzAMkyXllNhQpoTPUofeSgpRkvBSvJEXgn4GUt7M5TbChRI=
X-Gm-Gg: ASbGncs+NKSBQHA3I61nikSX35GG7KNXW9kq41n8ucEaPUhnQEU43FIfCmGfPFTmIIO
	Nt0nQzjQ7mfWFvzYPERwnqL0Xwe7Y14c9wETlrU1p3++rq0yjTM9VOsTaqhFpiz4nax0A7KomES
	WfNdm9pEeUZ8QS6lUARP47fzPAKRq6A49pP6Bt7RflpgG64NJaEflR3cNxC+G3svZPISN2aFvyD
	ObJOueY5clTNBN7V2SYbY8yNgNonxN1r8yV/7z25VWGoR8EwZXI3xaeVPvFB4wAAVeMskWSL00F
	jV/LD1s6alSr6HSEeSExwF+pz6WfiNNub/FPNkJ/lAkBfr5o9oqYpUlbFzQa6gbZt1RBIwLIkG/
	OqJ9RKcuGGzRY78xsJPM7CiLStWkVw2zxoEbGbc9JlvPaqmyyzDGQ8EJviJ8aMUYqQ3QoYXkhC+
	5KqFr9jMBclpOLBVRJ8GmYEaiO5pM=
X-Google-Smtp-Source: AGHT+IFcl0miy3Ysfcfm+o+Ga8ivsKmS01lnAk51q/lkIWAfpN1T1O+2M+fFwyIHwSA/yfDLAw2R6g==
X-Received: by 2002:a05:600c:1994:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-477c01740e1mr217044285e9.11.1764235830914;
        Thu, 27 Nov 2025 01:30:30 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc186sm82555375e9.13.2025.11.27.01.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:30:30 -0800 (PST)
Message-ID: <bed84247-c3c0-47b8-a491-9af9e51ca5a7@linaro.org>
Date: Thu, 27 Nov 2025 09:30:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: Leo Yan <leo.yan@arm.com>, Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Mike Leach <mike.leach@linaro.org>, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
 jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
 milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
 <aSCbJR9aT1vOpz0a@google.com>
 <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org>
 <CAJ9a7VipxW5-2roAQA3y212sQWr1kq2HNbLK1jmLNP1jFseYiQ@mail.gmail.com>
 <68efd5a2-3b65-4f37-9bf0-40c4e5ade480@linaro.org>
 <aSgPhd4u3Oqi3Ymy@google.com> <20251127092231.GN724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251127092231.GN724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_013032_905360_CDA8671A 
X-CRM114-Status: GOOD (  26.59  )
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



On 27/11/2025 9:22 am, Leo Yan wrote:
> On Thu, Nov 27, 2025 at 04:44:53PM +0800, Kuan-Wei Chiu wrote:
> 
> [...]
> 
>> I don't feel it is my place to say whether the etm3x driver should be
>> removed entirely.
> 
> Sorry for confusion.  Your fix patch is welcome, this is useful no
> matter if remove the ETMv3 driver or not.
> 
>> However, if we decide to keep it, I agree that aligning cntr_val_show
>> with the cntr_val_store behavior (using cntr_idx) makes more sense.
>>
>> Here is my plan for v2:
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>> index 762109307b86..77578885e8f3 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>> @@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
>>   static ssize_t cntr_val_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>> -	int i, ret = 0;
>>   	u32 val;
>>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>   	struct etm_config *config = &drvdata->config;
>>   
>>   	if (!coresight_get_mode(drvdata->csdev)) {
>>   		spin_lock(&drvdata->spinlock);
>> -		for (i = 0; i < drvdata->nr_cntr; i++)
>> -			ret += sprintf(buf, "counter %d: %x\n",
>> -				       i, config->cntr_val[i]);
>> +		val = config->cntr_val[config->cntr_idx];
>>   		spin_unlock(&drvdata->spinlock);
>> -		return ret;
>> -	}
>> -
>> -	for (i = 0; i < drvdata->nr_cntr; i++) {
>> -		val = etm_readl(drvdata, ETMCNTVRn(i));
>> -		ret += sprintf(buf, "counter %d: %x\n", i, val);
>> +		return sprintf(buf, "%x\n", val);
>>   	}
>>   
>> -	return ret;
>> +	val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
> 
> It is not right to read register at here (it cannot promise to read the
> CPU (cp14) register on the target CPU).
> 
> Please refer to the same function in coresight-etm4x-sysfs.c. I think
> we can do the same thing at here.
> 

That's a different fix than the display bug though. This change doesn't 
change that if it's already wrong. The display fix should go in alone 
and then if there is an issue with not running things on the right CPU 
that should go in separately.

>> +	return sprintf(buf, "%x\n", val);
>>   }
>>   
>>   static ssize_t cntr_val_store(struct device *dev,
>>
>>
>> Given the upcoming merge window, I plan to submit this v2 after -rc1
>> is released.
>>
>> Alternatively, if the consensus is to drop the driver, I am happy to
>> submit a patch for that instead.
> 
> Please continue this patch.  Thanks a lot!
> 
> Leo


