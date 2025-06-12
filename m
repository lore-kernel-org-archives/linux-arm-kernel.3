Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D866C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 05:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+8oCrgXHXqL4I5+bmc4b/S6pj4SzLAlFLpmFo/by64=; b=iE6TUlgspbhuPbTncKdMHvp/bq
	3qowqrNC6yQJLQ+iPIeFy6UT9pQ12R6c8GL+JeewX/YRRsrG5aRWsSpBQr08E364HD94Q+PxxGzu/
	8zBfaLO618JDXIF1NPWZFiW0J4/efGoEX0S6xXApY/Aeb7H1s+K4nJwKSQ21XgtKw6COd2SYiMwrI
	2PugvrWhAT7PfqYxUbSeV1e8ssOJw67BAgn4OdSAynNwTuvxmKYdbu18m/UjGKOAxWblIJta3goZk
	vAb5VhGfwdkfgSvQGUaWd47Vhg/LILDcDorlfo/KoIJhPSrvRATxm+ccGrRmemk9mIJeQyGaokK/G
	V827HSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPaNL-0000000CDiA-1Jpd;
	Thu, 12 Jun 2025 05:21:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPaLC-0000000CDTi-1oss
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 05:19:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CDF71595;
	Wed, 11 Jun 2025 22:18:45 -0700 (PDT)
Received: from [10.163.33.129] (unknown [10.163.33.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E29553F66E;
	Wed, 11 Jun 2025 22:19:02 -0700 (PDT)
Message-ID: <28ccdeaa-865e-4e81-8a95-eaec9b2754ef@arm.com>
Date: Thu, 12 Jun 2025 10:48:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 1/2] coresight: stm: Remove redundant NULL checks
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
 <20250611-arm_cs_fix_smatch_warning_v1-v1-1-02a66c69b604@arm.com>
Content-Language: en-US
In-Reply-To: <20250611-arm_cs_fix_smatch_warning_v1-v1-1-02a66c69b604@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_221906_519291_57A34998 
X-CRM114-Status: GOOD (  15.18  )
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



On 11/06/25 8:14 PM, Leo Yan wrote:
> container_of() cannot return NULL, so the checks for NULL pointers are
> unnecessary and can be safely removed.
> 
> As a result, this commit silences the following smatch warnings:
> 
>   coresight-stm.c:345 stm_generic_link() warn: can 'drvdata' even be NULL?
>   coresight-stm.c:356 stm_generic_unlink() warn: can 'drvdata' even be NULL?
>   coresight-stm.c:387 stm_generic_set_options() warn: can 'drvdata' even be NULL?
>   coresight-stm.c:422 stm_generic_packet() warn: can 'drvdata' even be NULL?
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-stm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index e45c6c7204b4491e0f879bc7d5d445aa1d3118be..464b0c85c3f7d3519169d62a51e9f8c6281b5358 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -342,7 +342,7 @@ static int stm_generic_link(struct stm_data *stm_data,
>  {
>  	struct stm_drvdata *drvdata = container_of(stm_data,
>  						   struct stm_drvdata, stm);
> -	if (!drvdata || !drvdata->csdev)
> +	if (!drvdata->csdev)
>  		return -EINVAL;
>  
>  	return coresight_enable_sysfs(drvdata->csdev);
> @@ -353,7 +353,7 @@ static void stm_generic_unlink(struct stm_data *stm_data,
>  {
>  	struct stm_drvdata *drvdata = container_of(stm_data,
>  						   struct stm_drvdata, stm);
> -	if (!drvdata || !drvdata->csdev)
> +	if (!drvdata->csdev)
>  		return;
>  
>  	coresight_disable_sysfs(drvdata->csdev);
> @@ -384,7 +384,7 @@ static long stm_generic_set_options(struct stm_data *stm_data,
>  {
>  	struct stm_drvdata *drvdata = container_of(stm_data,
>  						   struct stm_drvdata, stm);
> -	if (!(drvdata && coresight_get_mode(drvdata->csdev)))
> +	if (!coresight_get_mode(drvdata->csdev))
>  		return -EINVAL;
>  
>  	if (channel >= drvdata->numsp)
> @@ -419,7 +419,7 @@ static ssize_t notrace stm_generic_packet(struct stm_data *stm_data,
>  						   struct stm_drvdata, stm);
>  	unsigned int stm_flags;
>  
> -	if (!(drvdata && coresight_get_mode(drvdata->csdev)))
> +	if (!coresight_get_mode(drvdata->csdev))
>  		return -EACCES;
>  
>  	if (channel >= drvdata->numsp)
> 

Seems to be a sensible clean up.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>


