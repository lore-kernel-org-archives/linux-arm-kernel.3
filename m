Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tr82NSIo;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N5F2WDpm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NXqfJx/4sDzowXeGWOnLU0gI6PbiTuWJ4AyhpQ8TWvw=; b=Tr82NSIosEufXc
	2QYzaaDpBYQwW/A3rlOJyOSrEnadVUzuUd48NNV62OTBFupe7uaeg0ZiZY2hHzjX01LXJUMRdGlxL
	f4jW5uVit4YVDo0xFiuMabvceYNefrcEyAtMYjzNzt1np0q4EygpWBbBpgbZowBunLB1ArQIvVlXq
	oz54XSnwb7FjYPCIv4Wo7FUwJfcwwcDnfc/GbAyjf4nTK3gbdB0xTcMxNavzlt9/ompEqgsp1INir
	d9WiU4bXMFEE9nb1dD10t32fm6XaLaYOJqZNZlGM3upUW1gWRWHzuoCvf17UshuYnkVXzp2UinomD
	xp+m9QUQ5fWstyl38N4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0g5-00000006jrR-2mgb;
	Wed, 28 Oct 2026 10:14:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0fz-00000006jpf-0MBD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 10:14:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE102E9D;
	Wed, 28 Oct 2026 03:14:30 -0700 (PDT)
Received: from [10.57.16.117] (unknown [10.57.16.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD77E3F7B4;
	Wed, 28 Oct 2026 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793182473; bh=uezKJlNlNwhvOmrpbfGGH+riPupzeBfdHtfumoMYw3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N5F2WDpm2rFVKi8/R0XyvsPlnYo2jzO7/gXd7IhSq7i/gpaa/vgYGgzDKyzHNmodj
	 Ut2V8X1tsuDUuD/BeO/Uq2Mebd9ZKW6cwfyeXBoZCLpe08DZhJDMCFkvGnTmf9kCO/
	 bH8fucxMB5hxHEfAui6ZvtMHBkbwH+kpB32QnJw8=
Message-ID: <3eda6e99-291f-40b1-9fd8-13ca193b5fa4@arm.com>
Date: Wed, 28 Oct 2026 10:14:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_031435_207649_164A6392 
X-CRM114-Status: GOOD (  21.44  )
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

On 16/10/2026 11:46, James Clark wrote:
> Perf's etm_setup_aux() calls cscfg_activate_config() and dereferences
> cscfg_mgr, which can be done after coresight_init() has initialized the
> Perf PMU but before cscfg_init() has finished while the driver is still
> loading.
> 
> Fix it by only assuming cscfg is initialized if cscfg_mgr is set.
> 

Is this possible though ? The component drivers are dependent on the
coresight-core being loaded and this is not complete until the coresight
module has been initialised.

Or the other way to fix this is delay the etm_perf init after the cscfg
init, which clearly is the order of dependencies ?

Cheers
Suzuki


> Fixes: a0114b4740dd ("coresight: etm-perf: Update to activate selected configuration")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-syscfg.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49..7e3c9844bc00 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -26,6 +26,11 @@ static DEFINE_MUTEX(cscfg_mutex);
>   /* only one of these */
>   static struct cscfg_manager *cscfg_mgr;
>   
> +static enum cscfg_load_ops cscfg_get_state(void)
> +{
> +	return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
> +}
> +
>   /* load features and configuations into the lists */
>   
>   /* get name feature instance from a coresight device list of features */
> @@ -581,7 +586,7 @@ int cscfg_load_config_sets(struct cscfg_config_desc **config_descs,
>   	int err = 0;
>   
>   	mutex_lock(&cscfg_mutex);
> -	if (cscfg_mgr->load_state != CSCFG_NONE) {
> +	if (cscfg_get_state() != CSCFG_NONE) {
>   		mutex_unlock(&cscfg_mutex);
>   		return -EBUSY;
>   	}
> @@ -662,7 +667,7 @@ int cscfg_unload_config_sets(struct cscfg_load_owner_info *owner_info)
>   	struct cscfg_load_owner_info *load_list_item = NULL;
>   
>   	mutex_lock(&cscfg_mutex);
> -	if (cscfg_mgr->load_state != CSCFG_NONE) {
> +	if (cscfg_get_state() != CSCFG_NONE) {
>   		mutex_unlock(&cscfg_mutex);
>   		return -EBUSY;
>   	}
> @@ -902,7 +907,7 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
>   	struct cscfg_config_desc *config_desc;
>   	int err = -EINVAL;
>   
> -	if (cscfg_mgr->load_state == CSCFG_UNLOAD)
> +	if (cscfg_get_state() == CSCFG_UNLOAD)
>   		return -EBUSY;
>   
>   	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
> 


