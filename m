Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C2AC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/JzH7+qP6FWxsrqYIA+pSqHC4CBdAElWdojDLseslg=; b=Ed4i3rcJUzb/HE4ytqZF9dJe/G
	eLnoyF262oOuTQze3X49A8urxMSzO9bpYB4NVWjyUZEWjx6UE2faW3+JzsTaDAz3XN/1awUhTzm6x
	xS8+lpn2jE4F5Rdyp/O+EC9q20MaAcYZTTzL9GU5wMFihaKHdHPWlbfUf7o8URjCYavlbqftWKQrs
	dUZKQQWqqa1G/0VMwOrnGAuCWbZX3LP6mQT6DBH4fLE+bx8yysO2XSCt4a2tsVyvRkceAg3IoX/yv
	VYw8gGzdL74f1HmAYuEHKELgomwWisWL9TBAyDwFuYoqdS+LUChtA4NI3M7L/flCIG9FG/8MDKaG2
	OyLOpE5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqkpT-0000000GK8B-1FlQ;
	Mon, 03 Aug 2026 05:03:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqkpQ-0000000GK7n-1IRw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:03:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 468F4143D;
	Sun,  2 Aug 2026 22:03:02 -0700 (PDT)
Received: from [10.163.134.188] (unknown [10.163.134.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A1503F66F;
	Sun,  2 Aug 2026 22:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785733386; bh=EH7byNKzgNBankd/CewcyJGIj4zEnYsFXr8Nka0IbeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=twtQtWHkyIAyjW2PstTWuwZ5OxyKqsu+1MQ0QjDPYrN+xFERrSiwJ2sZFJeJf1qbI
	 eK98edooVdunBSnHByK8KElgW3X7MzSV7Btj9ZiBqPQbGlH+k1a2C5cY79vy6HPODf
	 l1r9mJrJZTKBqgnh0x6jZ1wZge+OvlCFVuZ9ddew=
Message-ID: <43e0e681-dbd6-4f1a-9fe1-520dba58ffd9@arm.com>
Date: Mon, 3 Aug 2026 10:32:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: Check runtime PM resume result
To: Yuho Choi <dbgh9129@gmail.com>, suzuki.poulose@arm.com
Cc: mike.leach@arm.com, james.clark@linaro.org, leo.yan@arm.com,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260802232552.593435-1-dbgh9129@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260802232552.593435-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_220308_494350_E9A66E5E 
X-CRM114-Status: GOOD (  17.58  )
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



On 03/08/26 4:55 AM, Yuho Choi wrote:
> coresight_get_ref() ignores the return value of pm_runtime_get_sync()
> and reports success even when runtime resume fails. A path is then built
> and the CoreSight device may be accessed while it remains powered off.
> 
> Use pm_runtime_resume_and_get() so a failed resume is reported and its
> runtime PM usage reference is rolled back. Drop the module and device
> references acquired before the resume attempt when it fails.
> 
> Fixes: 5da5325fa856 ("coresight: moving PM runtime operations to core framework")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---

Should 'Fixes:' be tagging the following commit - which had introduced
coresight_get_ref() unconditionally calling pm_runtime_get_sync() ?

32b0707a4182 ("coresight: Add try_get_module() in coresight_grab_device()")

>  drivers/hwtracing/coresight/coresight-core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 6d65c43d574f..77d05b360484 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -843,7 +843,11 @@ static bool coresight_get_ref(struct coresight_device *csdev)
>  		goto err_module;
>  
>  	/* Make sure the device is powered on */
> -	pm_runtime_get_sync(parent);
> +	if (pm_runtime_resume_and_get(parent) < 0) {
> +		module_put(drv->owner);
> +		goto err_module;
> +	}
> +
>  	return true;
>  
>  err_module:


