Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C7FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 06:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWBt9fZvpMcFSkWUdSIztus0wxKX7qIhFzmK1qouEDE=; b=q9Nmj4vA2MMmSOj8enUFynJdNY
	Pr/dC5OXidFv4Q7hOAdLdotHn7HimrXgzmRqxKtVJU7g9iD9NDhzUh07SN0JJf1xHQTqvF3yFfZF1
	Evql9NhlvoHtySPSH0IkhrCLhCUfqL+OKVAxgNOaSrIaXrzABpgMkn0T0/tE6oV5ETCUQzArx5Ijp
	8aNiwmgMzWi0M7lcEg3OJov2V95pUwp/j8EYw+bWzyMyXHezmfw5oKWSptlf7vw03tYrb7z7OQy6v
	ZP8zyk8OvubphBnh9f2gqeMbKEfx4EaAZNYGCA//Ov0jNIzmrKQaLC12MblpFSYoxbjaw6RJCtvFr
	hdZbQZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXqu-0000000EK7w-37uw;
	Wed, 07 May 2025 06:01:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXor-0000000EJsv-3cft
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 May 2025 05:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VWBt9fZvpMcFSkWUdSIztus0wxKX7qIhFzmK1qouEDE=; b=HYKkLwI1Dgzr3xujD9W8czvRxS
	f8F+m3UY/b5YQ27yTtepZ+XSKOodzz8ZOBjHld+PtXLBzquascBaxCzp/f6ISa2vKRR6+DtPund6A
	6kWeXl4uwSXwiZRY9QkztLC1s5MlD0rqOHdq0TzVUt79iZb2EXmAnN/G8O+9btuflBgaeGakx47pN
	znfZohCGm35g5GxVV/iIVWlJVF+oMBgSuKJ8AyrCOAQVQNGvuSfLmkohL1OhAMWirHr6jHo9DFehj
	V+x7+t34JKSh93iP6LSA1xvStyujduamlRSeZP7kIymAfB/4MLPQcVqBisXbk3bYqvqWlvHFOasxq
	qCN5qhGQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCXoo-0000000Fmkx-0G5z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 05:59:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E7D32F;
	Tue,  6 May 2025 22:59:33 -0700 (PDT)
Received: from [192.168.0.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F6C93F5A1;
	Tue,  6 May 2025 22:59:38 -0700 (PDT)
Message-ID: <5db14757-fd7b-441e-99b3-786f11df372b@arm.com>
Date: Wed, 7 May 2025 11:29:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] coresight: Disable programming clock properly
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-5-leo.yan@arm.com>
 <f56a73a4-ae63-4a46-a493-322c4806b3a2@arm.com>
 <20250506095428.GB177796@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506095428.GB177796@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_065946_577592_1E1B0DE1 
X-CRM114-Status: GOOD (  19.97  )
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



On 5/6/25 15:24, Leo Yan wrote:
> On Fri, May 02, 2025 at 11:40:31AM +0530, Anshuman Khandual wrote:
>> Even though this might seem to be being bike shedding, the subject
>> line above could be re-organized something like the following for
>> better clarity.
>>
>>  coresight: Properly/Appropriately disable programming clocks
> 
> Sure.  I will change the subject to this.
> 
> [...]
> 
>>> @@ -725,8 +723,6 @@ static void debug_platform_remove(struct platform_device *pdev)
>>>  
>>>  	__debug_remove(&pdev->dev);
>>>  	pm_runtime_disable(&pdev->dev);
>>> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
>>> -		clk_put(drvdata->pclk);
>>>  }
>> Should not these IS_ERR_OR_NULL() here be changed to IS_ERR() ?
> 
> For the case above, after changed to devm_clk_get_enabled() for the
> enabling programming clocks, we don't need any special handling and
> leave the clock disabling and releasing to the device model layer.

So it can be left unchanged for now and cleaned up later ?

> 
>> Because now there could not be a NULL return value.
>>
>> drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev)
>>
>> #ifdef CONFIG_PM
>> static int debug_runtime_suspend(struct device *dev)
>> {
>>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
>>
>>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>>                 clk_disable_unprepare(drvdata->pclk);
>>         return 0;
>> }
>>
>> static int debug_runtime_resume(struct device *dev)
>> {
>>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
>>
>>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>>                 clk_prepare_enable(drvdata->pclk);
>>         return 0;
>> }
>> #endif
> 
>> There might more instances like these as well.
>> 	
>> git grep IS_ERR_OR_NULL drivers/hwtracing/coresight/ | grep "drvdata->pclk"
>> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> 
> I would like the current patch to focus on the issue of disabling /
> releasing the programming clocks.
> 
> Though the IS_ERR_OR_NULL() check is redundant, it does not cause
> issue or regression.  The refactoring is left in patch 09 for removing
> IS_ERR_OR_NULL() checks.
> 
> Does this make sense?

Yes, it does now.

