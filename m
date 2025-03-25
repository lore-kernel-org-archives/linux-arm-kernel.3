Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376D0C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC4k3GVKDrLc3pAzgTSQGdLDrYb8A4mFb3Dpb1J5fKk=; b=qN8/EvBZGDpZmIAWS0OwMiU5r4
	Gzc0dluP9P42WF+1sN68keK+fA9++ALL9MMY+yL0QCE5ug435J17LZH6W1LbeUg2Mafe/k8x1RaTk
	y/eGwi7eNMC7sE+KqLFPphDnF75V4JnNwKI4JKg7n6tU09sKpDGCamtZTwMbbe+O0Ie4lerfKjUMZ
	c1kzq7ZugMtjfs3B7qfi0pTpE5pNgzN/0BytlfrOnjOCBIN5g24I4reIeaCUwJ20cDQnq+efaOt7O
	Q6X0yDO0PcOSouPWKW+mcquJ14pc0RDVsvKOYDjNBMWB0DY0nOuSU/mK2UX6wa+p4+KASx6r5Adco
	LNWegwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5tO-00000006HuH-0510;
	Tue, 25 Mar 2025 15:08:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4ch-000000065B6-0K0e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:47:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so45083195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 06:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742910437; x=1743515237; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cC4k3GVKDrLc3pAzgTSQGdLDrYb8A4mFb3Dpb1J5fKk=;
        b=hnRYyxJ1Nek/mqjAw5RFkP4MZTWdqY/A0TPonPxu5EIgXQ7rS2VnDIMNYbzW/w46Lk
         r4ipgkzPglShnzQuRqRmgdJq5/viHIWmdMgmP+Y/QNOYl5LlhyloskXW+o6M2HWrngol
         Db95tCPenOE5HxJKHmkxhfTs4jVPZP4jSd3ultpEU9Dg5v2IIzdvL1KeJgoU0tjrU7he
         13kWQYqmjz/G/SQCkZOsr8CG8jIC+foar03lK5/SBBGlHo55ZcixR3Ccjae5qNzXOf+/
         yByPt/R2m/hspR+rJWmNd9Jd3hagfwkF7uJrEuvs+WD4drBbEeaTXSPn1y/vmh4bPMpU
         1SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910437; x=1743515237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cC4k3GVKDrLc3pAzgTSQGdLDrYb8A4mFb3Dpb1J5fKk=;
        b=mAad2GtN31X+fbNu/kUs51wTrvdg0TIw7m9287HEYwspuFIviQWetBUa/Wp/RGGyyE
         TpemxjOVURv4VY4dHgClbtrqU0uP6w8BdEKEtwlCFuAmb5Ld3ZTeHlteLS7bI/e0aJOa
         BUPhheVdA3eLYuICoxq5YB27ZOC6+mXZqYooCR+wotzYwpVtWQG4+Qpfgw4M7XqsYigM
         rUrGMneFcLT6WmxiB/rwJ2xwbU+hA/6plHZz2Em7aLWXq7eirnAiRnbV17U2+lKKsg6z
         gXeez2rg6mujGlw2g1LvVsj2aqJxHJ//d25XYJqgB8F/s6UplFaUSLYIuVFQj+X6qY4W
         ltJA==
X-Forwarded-Encrypted: i=1; AJvYcCV1zctElg7f3IcXvAtz94SqTxclqt0lQ3x/ktFScf+WfEgxIHHXVlQWcRZvcNc/KIyK0Nnjw1E2f3M90EqVE1sa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp9c54tJnvl0mtIpDyx7soQWAGTCDkTqq6Optnr3pYAI6fAH3J
	BkCH6s1v1ffQdRsXIqOku0y/rnDZNjKtJE61iz2OG7AcuOmDPIHCRYkiMdw8SHE/HEpzyI0IBNk
	7
X-Gm-Gg: ASbGnctrKPJHMLa170dcDE12n1TJhc/yL4mRVwsCN23rlRj4hMRqoDg1laMWIC4awm3
	3Itu0Fc2572oLL6nzVbp+LajxOaVlc1rsDDLR2MQCt8j1K048EsCEFT+FmbDmYQC7kKAJZC6vwR
	OGqlbyeElmoLgLQTAW3/CeknexE+EvGj/of4A9veMJyZgp2BwmZbUvqqxy+Zk4XLwOgNJu3STJ9
	+D5Mrn8TrwWMTKvSFcmPcM4n+3idEgtgqieqmUa7QkoDoHjWKkCVKC/iaMfB/be2EKjeO5a4ur+
	oYbuE2x6U9PBEJqkScO6a2IPWkfcBmVn/TM0K97kd/7miuKHI/qaJRUHPe85A35t
X-Google-Smtp-Source: AGHT+IFpqtRld4kYWIl0Bq8BHWcBrNQo6w9zy4bwED+7n/WR5x5JXePT8jlXXf2j5+6Ao1DnzGIn6g==
X-Received: by 2002:a05:600c:32a7:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-43d51026f53mr116589055e9.14.1742910437457;
        Tue, 25 Mar 2025 06:47:17 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd348sm151629785e9.39.2025.03.25.06.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 06:47:17 -0700 (PDT)
Message-ID: <21217526-892d-4d27-9a09-b8853885493a@linaro.org>
Date: Tue, 25 Mar 2025 13:47:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] coresight: Only check bottom two claim bits
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
 <20250320-james-coresight-claim-tags-v3-2-d3145c153820@linaro.org>
 <40e30ec8-a7ea-46b9-b687-aa7efa8cf0e1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <40e30ec8-a7ea-46b9-b687-aa7efa8cf0e1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_064719_118554_D1AE8984 
X-CRM114-Status: GOOD (  20.82  )
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



On 21/03/2025 12:10 pm, Suzuki K Poulose wrote:
> On 20/03/2025 14:34, James Clark wrote:
>> The use of the whole register and == could break the claim mechanism if
>> any of the other bits are used in the future. The referenced doc "PSCI -
>> ARM DEN 0022D" also says to only read and clear the bottom two bits.
>>
>> Use FIELD_GET() to extract only the relevant part.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 3 ++-
>>   drivers/hwtracing/coresight/coresight-priv.h | 1 +
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 8471aefeac76..26d149a4c579 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -131,7 +131,8 @@ coresight_find_out_connection(struct 
>> coresight_device *csdev,
>>   static inline u32 coresight_read_claim_tags(struct coresight_device 
>> *csdev)
>>   {
>> -    return csdev_access_relaxed_read32(&csdev->access, 
>> CORESIGHT_CLAIMCLR);
>> +    return FIELD_GET(CORESIGHT_CLAIM_MASK,
>> +             csdev_access_relaxed_read32(&csdev->access, 
>> CORESIGHT_CLAIMCLR));
>>   }
>>   static inline bool coresight_is_claimed_self_hosted(struct 
>> coresight_device *csdev)
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/ 
>> hwtracing/coresight/coresight-priv.h
>> index 82644aff8d2b..38bb4e8b50ef 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -35,6 +35,7 @@ extern const struct device_type coresight_dev_type[];
>>    * Coresight device CLAIM protocol.
>>    * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and 
>> restore.
>>    */
>> +#define CORESIGHT_CLAIM_MASK        GENMASK(1, 0)
>>   #define CORESIGHT_CLAIM_SELF_HOSTED    BIT(1)
> 
> I am checking with the Arm CoreSight architects on this. This is
> problematic, if another agent is assigned, say BIT(2) and we wouldn't
> forward compatible.
> 
> Suzuki
> 
> 

For the benefit of the list, I think the conclusion is that in order to 
be forwards compatible with adding new bits, the spec would already have 
to have been released indicating that the extra bits may be used. As it 
specifically only mentions the two bits, any other implementation 
following it would also hit the same problem.

Seems like any further updates would have to be either be breaking or 
done in some other way.

James


