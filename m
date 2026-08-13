Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F26C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mR+ypn1dGm0BnehOIl3Z6EwsPWd7IoHNbFBDJMO2TcQ=; b=sntOfZD1d7gIUnscwRrKPIRgPc
	BhiD17JsErjFNKtiAyf0STKDW5FtpGXTjNxbw+0kvzCoxR3IhY913P+i47JfUx51OssyFuzMLBXH2
	741REQA6E5Vnvf08iXxACN6xYWqY1Azl8cfTD6Jb5tBtaU5nD1un4twvOrj5j1AMGMJ0corj9y8V2
	uj7k7W3fWISG18qnPvtgdBbQ9bQUES4Opu/6pMNYQJrZrNwDIBmBj1guTbnhZ37YVmFVJoPItckgb
	gO65Ez7JSnjRP6zeGFUNYhn88WM3SnfjNKAZD/Cc1VAplwk3hKhMu+jTN46EEolwcRcbd9nh8ayLf
	cz/opgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRgM-00000000Hw4-2q3H;
	Thu, 13 Aug 2026 09:25:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRgK-00000000Hut-3l65
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:25:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4954aff6088so13597885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786613099; x=1787217899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mR+ypn1dGm0BnehOIl3Z6EwsPWd7IoHNbFBDJMO2TcQ=;
        b=OoaPz/j4WueAmddAfzTKlznL/BEiPci2Clu39xnE8vHYEgwiVmZRTt6RgGwl9fYkNT
         8YzkSYOcl7q8vHn7sGQk8eeKrdgVjpkdArquuQrlstaEwlRkbPbq9LZZi5BDbAWHVNyC
         DUv5LJls9LUBWzdO4gBTP5LUuTRDy8J5OHw/6jzNctMRKjuwz8BD6PYOxT8dpzfhTTdU
         8xlsF0DQe1meqyS9tsLQhcCAX9ZJ/w2JiXqnLHIfuFB/XipP1DvIS2p4V8W2gqb9AjHM
         QaUZuxrrLxZ7/t9nVHkxVXaGe9VS+hmgcZIr9YWhapzY1fEz1rtwcAVhKU3I/4hyaOhk
         mgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613099; x=1787217899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mR+ypn1dGm0BnehOIl3Z6EwsPWd7IoHNbFBDJMO2TcQ=;
        b=smnQ4Y5YfQ2anWOiet5b9qUDY+eCiRd6l+LY+GsRjDM/fv1nxLX4/9oPMQcLVbxxp3
         LYt6KkoWEmGgnya7JuC6UX5+dxtOz1rIKNyA0wCfYCugwScQ7tgmxYUcEEY+ZR4j3KvH
         LQAU7VTudQHYqhf3E5g9bAbRy80Kmgd3TKGrk8bFTDKanTd1kB4Eck9gHB0elnyJXT3/
         Ie3pT4Iiqui0oopJY1jk3EKvIeji73J9ZvslHoy1OtQjCeruKxxy8llCCXOrnha5mCuf
         QBzlCY0KVOLeo63yeAaarGiHCY7rDjOA87h+dfrCowAI/BVYHRMP7V3hOgMmcS2WFcsM
         byVw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6ZzNPZq4acOstzhRKnq+VzAHSP7oUytlhYuPdG3id4ibgzBfDzcSvh0D7WSOoim/qnRnO/WYqbrlOE2PmCzlB@lists.infradead.org
X-Gm-Message-State: AOJu0YwsuX5Y84J1PmKdsV3ABNZavL7+27mzSkXXgIFrbHU6JI44oD31
	hS4wGLVT5xZfn4+0rYuEpljI1d66OACF7eLFyfVn1+vWDvz/b5PHgUTtvu235msqENo=
X-Gm-Gg: AR+sD13snVFWJaFuPtjLZZORaVn9tdUb9SISInccuIunah1lyjzeLwKs0JmDCcQype2
	7EGETqroLVz9lEgaFtqp2H6iMDmxnGHN4w8dzBLoqcBvDP1lMZQH2Pq7E/6TjM5xBH4B9IRJmDg
	kTCLbmL4nmHhrE9Q3cgguYljLeaETM45/5L4HaxvPu4U3O0WQ/1SMzoDkk3SGSjv82CQgW5i5gX
	QaeJVczFVOvfWoVWbbiPlnxyl4YjT160ml7uwOOvRrlaJRoNKb/QKZx7mcmLthMPKOPzRC6TH3/
	NHVR2a7zGd/C7+98VQexdWEL9LltX7+e7UP7/t6TEQTlN1gSdPlGqIdFNCDSbR4AuFSseC5/t3+
	yMfGnCnKM5DJQc2nnwzsVQg1WfogAb3QIrzQu3qhsTCgrEl+2K2hBxJcYDW9XWVvW4CqPkH8NLQ
	60mM2IN5TSLxVSbPe9W6TJ83QcTrYL474iQaETiSXjvxD2XPzwveltIG2mmQ0QXtfpabCxRaUOZ
	uVAALi2PsL9IiZY
X-Received: by 2002:a05:600c:8b2f:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-4998219cf7cmr56618815e9.1.1786613098945;
        Thu, 13 Aug 2026 02:24:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49982131261sm82274035e9.8.2026.08.13.02.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:24:58 -0700 (PDT)
Message-ID: <9444ef3e-1159-4e23-bd71-716582f377a5@linaro.org>
Date: Thu, 13 Aug 2026 10:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] coresight: configfs: Don't assume active until
 cscfg_mgr is set
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 sashiko-bot <sashiko-bot@kernel.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-2-6aee7579f1dc@linaro.org>
 <20260813090924.GA8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260813090924.GA8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022500_976171_06282FFC 
X-CRM114-Status: GOOD (  31.89  )
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



On 13/08/2026 10:09, Leo Yan wrote:
> On Tue, Jul 28, 2026 at 04:00:14PM +0100, James Clark wrote:
>> Perf's etm_setup_aux() calls cscfg_activate_config() and dereferences
>> cscfg_mgr, which can be done after coresight_init() has initialized the
>> Perf PMU but before cscfg_init() has finished while the driver is still
>> loading.
> 
> For this patch, if Perf PMU is dependent on cscfg, why we cannot
> adjust the init sequence that first call cscfg_init(), then register
> cs_etm PMU event?
> 

cscfg_init() relies on perf making some files in sysfs. I think I tried 
that first but it doesn't work:

  	/* add config to perf fs to allow selection */
	err = etm_perf_add_symlink_cscfg(cscfg_device(), config_desc);

One solution would be to combine the modules into one. Not sure if there 
is any functional requirement for them being separate. They're both 
"software" parts of the set of Coresight modules, rather than being 
associated with any hardware. Having them separate is obviously creating 
some bugs and needless complexity.

> In _cscfg_activate_config(), I can see it dereferences cscfg_mgr:
> 
>    if (cscfg_mgr->load_state == CSCFG_UNLOAD)
> 
> This patch does not check if cscfg_mgr is set. If we try to check
> cscfg_mgr every time before dereferences it, this approach is quite
> fragile.
> 

Maybe we can have a "cscfg_get_state()" function which also checks for 
NULL and returns CSCFG_UNLOAD in that case?

> 
>> Fix it by only assuming cscfg is initialized if cscfg_mgr is set.
>>
>> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
>> Fixes: a0114b4740dd ("coresight: etm-perf: Update to activate selected configuration")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-syscfg.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
>> index 2bfdd7b45e49..475e8fefa100 100644
>> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
>> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
>> @@ -581,7 +581,7 @@ int cscfg_load_config_sets(struct cscfg_config_desc **config_descs,
>>   	int err = 0;
>>   
>>   	mutex_lock(&cscfg_mutex);
>> -	if (cscfg_mgr->load_state != CSCFG_NONE) {
>> +	if (!cscfg_mgr || cscfg_mgr->load_state != CSCFG_NONE) {
>>   		mutex_unlock(&cscfg_mutex);
>>   		return -EBUSY;
> 
> If cscfg_mgr is NULL, would directly bail out? This can avoid adding
> check for every dereference.

Not sure what you mean by this?

> 
> Thanks,
> Leo
> 
> P.S. For me, this kind of rare race condition reported by Sashiko can
> sometimes distract from the main issue. Trying to address it in the
> same series may mix different issues together. I miss the simpler
> approach where issues could be resolved with clear boundary.

It's a bit like the other fix, we're holding new refcounts to the 
task_struct and PID, so we should probably make sure we're going to 
release them. Getting this wrong prevents free_event_data() from being 
called.

Don't worry I didn't fix all of the edge cases either.


