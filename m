Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1281C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtoKs4muQfIKjK2pfrzqLfYPjRO+KKfEwCIPoXdaWIE=; b=elPVBBeLyD+AKhAcah6MwkDeyN
	bRfEeHNd3LAkp3WrlaY3WUCswRYNBGmPy6HILeiNWIoWRmkkg2jHkcmmtRIxb3AzWK9tieOQn6Uvp
	RwH2y37K7O4gox17V9d1PftVuyO1Nm4tTenJBekVq9nh7cb1EBdzSappsXwqe++7tnxxJPno55TKL
	Fx4igbdXwCkEADODEqMhluhBDli+SboGh+bskYXXWBVheqQvmJNam1n51Mli/QCvrVpZEdcgRgmdJ
	0TShPg407+eAzQm8apEgGssTbATx4O6yY1DW/ahhz3bplau9oCoDV0qSMog2bMsAu5kCoFCtAkFJv
	pPwsxIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCFR-000000037GP-1bv0;
	Mon, 17 Mar 2025 15:19:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuC2D-0000000359N-42Qt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 15:05:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so22860185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742223944; x=1742828744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtoKs4muQfIKjK2pfrzqLfYPjRO+KKfEwCIPoXdaWIE=;
        b=BKfzBJa8797JzvEKHzoEXq2frNIN1h1TKvNtC77EHp2C67aZb65WXv2YIp6KHEs+jG
         dZMc+64emKQNItF6U3U9jNmLq6v7D5Dh8kQ6cOo4XX1XNH5UZCLalAORSrwbhTHoCMLa
         PWxzTS+YQMsozqA2qE9/+xPDUllzqoIFnKqjAh/cwi8KPPvmhlXnT0M+lULde/8uHjCY
         7H/ny3oGPnDTaRhUHOrjuOwz8stxZ5wLFA9Emh558PcZdXibHsJNl68YjOBFY8s5iUqE
         Mk+NFGIBMUkXh2JS4S/s9MEqew042KCv8efvY6VjcL1c+KS8TZwkzE07ck7sEyROVuDT
         /ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223944; x=1742828744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtoKs4muQfIKjK2pfrzqLfYPjRO+KKfEwCIPoXdaWIE=;
        b=IEB1IK7k6fK5SaLB8xEod7pt3yNBxhkYNznDd/8uovW1tLz/Y2/hmw42q949PwMQ2/
         IB/k1vhSeoT22BkrsachGMKe0ivhYgaYSCgJ1wB1P+48I82whHnpSqjmWaOmsUdHu7QX
         uCPpYBEePBAk30CYQSQoe8i6nNfWBO0nt808a0ZK0Blaeg3ikMgq3n2hM+TiPNwUYL0y
         x1fPMLwBCoaKQ/7qWS4O22uWm2/fdfLkTOzVVJKnIDgN59iSJWzqsKL6nkECIR2/V15j
         ij6gQakMZL6J4dpaM6RARniuvgNzGG5XJLJE2e3VJWwZXcrFpvIiYmVSyx8S/Lxlr1u0
         SzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVugPJhPO68e8GkFYnU0Y/4SmyXodorgHegmxXazOypvrfw5xmKwmHQMHg56huvXVsvND6bZPdbhhuKnlKIt15@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/x+E6vHaC9HKZQEUiJdK9vP1mKnSQymeyN0VNpJNTxICDMCje
	bkLQNntsuQE/DWxBkfMUif1vEkkvbpZWgkE0lq/MjpO6kxSvBPc/ifQbeZPBE54=
X-Gm-Gg: ASbGncsnCtJU1jtOj+a3Ix9TCtqGYYqrxEerBrrvMp5f/1Xv9zhnaIZuKLgjLOzmA34
	dZTz6Fm2zwJapIT1ATUHmI4P7ttp7NrYcFfgZwROKUaZtDWsdveesN8EvMzH2vuN8odsPu7Ehek
	8rqczVy/vQKuFo7G19ywDMlyh5mDxTk4dfQG9HN3YOxh7EmAZZT46pdiyCp8TgarMmoRQJAqgff
	1JeguN/Nj4OhpspVV7r5U6x5UdTkxssYVjtrj6HptoILFAfMAztcAqsA3+9JwVv0Cb6pq43ORml
	qYONpByCS+dCTfuHy2ZHNCwKn7WT0jjgLICmO+vHJBf13MTOL57IQg==
X-Google-Smtp-Source: AGHT+IFr4VZWBjzWUJMxKCB2olOOjvXpHwk1/Fc+c0jvMCr6/FceLLDOg2yCTQ+piJ+So3TuCF5r+w==
X-Received: by 2002:a05:600c:1547:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-43d38a0da56mr1480995e9.31.1742223943934;
        Mon, 17 Mar 2025 08:05:43 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb626esm107164485e9.8.2025.03.17.08.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 08:05:43 -0700 (PDT)
Message-ID: <6be400e2-a464-4714-acf4-328dade883a9@linaro.org>
Date: Mon, 17 Mar 2025 15:05:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] coresight: Clear self hosted claim tag on probe
To: Leo Yan <leo.yan@arm.com>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-6-james.clark@linaro.org>
 <20250313160409.GS9682@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250313160409.GS9682@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_080546_056934_79914759 
X-CRM114-Status: GOOD (  32.87  )
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



On 13/03/2025 4:04 pm, Leo Yan wrote:
> On Tue, Feb 11, 2025 at 10:39:41AM +0000, James Clark wrote:
>>
>> This can be left behind from a crashed kernel after a kexec so clear it
>> when probing each device. Similarly to
>> coresight_disclaim_device_unlocked(), only clear it if it's already set
>> to avoid races with an external debugger.
>>
>> We need a csdev_access struct in etm_init_arch_data() so just replace
>> the iomem pointer with a full csdev_access struct. This means all usages
>> need to be updated to go through csa->base.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-catu.c  |  1 +
>>   drivers/hwtracing/coresight/coresight-core.c  | 48 +++++++++++++++----
>>   .../hwtracing/coresight/coresight-cti-core.c  |  2 +
>>   drivers/hwtracing/coresight/coresight-etb10.c |  2 +
>>   drivers/hwtracing/coresight/coresight-etm.h   |  6 +--
>>   .../coresight/coresight-etm3x-core.c          | 28 +++++------
>>   .../coresight/coresight-etm3x-sysfs.c         |  8 ++--
>>   .../coresight/coresight-etm4x-core.c          |  2 +
>>   .../hwtracing/coresight/coresight-funnel.c    |  2 +
>>   .../coresight/coresight-replicator.c          |  1 +
>>   .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
>>   include/linux/coresight.h                     |  3 ++
>>   12 files changed, 73 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
>> index d9259c0b6e64..575c2d247a90 100644
>> --- a/drivers/hwtracing/coresight/coresight-catu.c
>> +++ b/drivers/hwtracing/coresight/coresight-catu.c
>> @@ -558,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>>          catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
>>          catu_desc.ops = &catu_ops;
>>
>> +       coresight_reset_claim(&catu_desc.access);
>>          drvdata->csdev = coresight_register(&catu_desc);
>>          if (IS_ERR(drvdata->csdev))
>>                  ret = PTR_ERR(drvdata->csdev);
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index 7fe5d5d432c4..97f33ffad05e 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -212,20 +212,48 @@ int coresight_claim_device(struct coresight_device *csdev)
>>   EXPORT_SYMBOL_GPL(coresight_claim_device);
>>
>>   /*
>> - * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
>> + * Clear the claim tag for the device.
>> + * Returns an error if the device wasn't already claimed.
>> + */
>> +int coresight_reset_claim(struct csdev_access *csa)
>> +{
>> +       int ret;
>> +
>> +       CS_UNLOCK(csa->base);
>> +       ret = coresight_reset_claim_unlocked(csa);
>> +       CS_LOCK(csa->base);
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_reset_claim);
> 
> Maybe my question is overlapping with Mike's comment.
> 
> Callers never check the return values from coresight_reset_claim(). I am

I can remove the return value if it's confusing. The thought process was 
probably that it could be useful somewhere in the future, and 
coresight_reset_claim_unlocked() returns something anyway so might as 
well pass it up.

> wandering if coresight_reset_claim() can directly call
> coresight_clear_self_claim_tag() for _trying_ to clear self-host tag in
> probe phase. Any self claim tag issues will be deferred to detect until
> enable the component.
> 

Maybe, the spec does a read before setting which I assumed should be 
done for clearing as well. As in to not touch anything if it's in use 
externally. It doesn't specifically describe any clearing sequence, but 
if we assume it's ok to blindly clear self hosted flag even when it's in 
use then yes we can directly call coresight_clear_self_claim_tag().

This doesn't change anything about deferring errors though, 
coresight_reset_claim() doesn't warn early either.

> For consistent, we might rename coresight_reset_claim() to
> coresight_reset_self_claim_tag(), which acquires CS lock and clear
> self claim tag.
> 
>> +/*
>> + * Clear the claim tag for the device. Called with CS_UNLOCKed for the component.
>> + * Returns an error if the device wasn't already claimed.
>> + */
>> +int coresight_reset_claim_unlocked(struct csdev_access *csa)
>> +{
>> +       if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED) {
>> +               coresight_clear_self_claim_tag(csa);
>> +               return 0;
>> +       }
>> +
>> +       return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_reset_claim_unlocked);
>> +
>> +/*
>> + * coresight_disclaim_device_unlocked : Clear the claim tag for the device
>> + * and warn if the device wasn't already claimed.
>>    * Called with CS_UNLOCKed for the component.
>>    */
>>   void coresight_disclaim_device_unlocked(struct csdev_access *csa)
>>   {
>> -       if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
>> -               coresight_clear_self_claim_tag(csa);
>> -       else
>> -               /*
>> -                * The external agent may have not honoured our claim
>> -                * and has manipulated it. Or something else has seriously
>> -                * gone wrong in our driver.
>> -                */
>> -               WARN_ON_ONCE(1);
>> +       /*
>> +        * Warn if the external agent hasn't honoured our claim
>> +        * and has manipulated it. Or something else has seriously
>> +        * gone wrong in our driver.
>> +        */
>> +       WARN_ON_ONCE(coresight_reset_claim_unlocked(csa));
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
>> index 073f67a41af9..389a72362f0c 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
>> @@ -931,6 +931,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>>          cti_desc.ops = &cti_ops;
>>          cti_desc.groups = drvdata->ctidev.con_groups;
>>          cti_desc.dev = dev;
>> +
>> +       coresight_reset_claim(&cti_desc.access);
>>          drvdata->csdev = coresight_register(&cti_desc);
>>          if (IS_ERR(drvdata->csdev)) {
>>                  ret = PTR_ERR(drvdata->csdev);
>> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
>> index d8bc3e776c88..b598b2c0c9bb 100644
>> --- a/drivers/hwtracing/coresight/coresight-etb10.c
>> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
>> @@ -772,6 +772,8 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>>          desc.pdata = pdata;
>>          desc.dev = dev;
>>          desc.groups = coresight_etb_groups;
>> +
>> +       coresight_reset_claim(&desc.access);
>>          drvdata->csdev = coresight_register(&desc);
>>          if (IS_ERR(drvdata->csdev))
>>                  return PTR_ERR(drvdata->csdev);
>> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
>> index e02c3ea972c9..a89736309c27 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm.h
>> @@ -229,7 +229,7 @@ struct etm_config {
>>    * @config:    structure holding configuration parameters.
>>    */
>>   struct etm_drvdata {
>> -       void __iomem                    *base;
>> +       struct csdev_access             csa;
> 
> I would like to extract the change for using `csdev_access` in the
> ETMv3 driver into a new patch, which is irrelevant to reset self claim
> tags and would significantly reduce the complexity in this patch.
> 

Will do, good point.

> Thanks,
> Leo


