Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C1CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 06:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WXG+QHaJd3QfoIxDfM6FQ/SUJDO9INHvNZyefkeiHM=; b=fsCqoACCoLBOOAeFzm0ewPg8vz
	TB2/RrqQfBZlNBPIyBFwTaHcIGm2uPhbq5vztHGnC8SU7PMUC2V9VSeXmQX5NEj30uwY53inDR8E1
	C0zu2BaTpRUh0z7Q72H+lwkblXsOwap37hD/TRFJVY5gVFI4xY86pE+LMCvJeCbl144/uCkv1/5gG
	TnGjesSydSiu8Et9BbGAgt3gJFiqyny19dLGqJbaH0dTPjycYp42+getGrrhsJU1QFqhCUuVNngeC
	/CcFA/IbMundebdWEKGgRfUKW3Sm6N89iQTCi7KM1dKt2ye5r+D1A6OiYrxavpYGyXE6mGjXYZzMM
	pGp9ROtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPGO-00000004gVI-1dFR;
	Thu, 14 May 2026 06:09:40 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPGL-00000004gUZ-38u8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 06:09:39 +0000
X-UUID: 788f28784f5b11f1aa26b74ffac11d73-20260514
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:807cdf51-3dde-45ac-966d-4b36f420f80c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:907e599764adffaf773852cd53fe47d9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 788f28784f5b11f1aa26b74ffac11d73-20260514
X-User: tianyaxiong@kylinos.cn
Received: from [10.42.13.21] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tianyaxiong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 652903280; Thu, 14 May 2026 14:09:30 +0800
Message-ID: <418993e5-ae44-48a4-98d7-250d0f359b0a@kylinos.cn>
Date: Thu, 14 May 2026 14:09:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] devfreq: Factor out devfreq_set_governor()
To: Jie Zhan <zhanjie9@hisilicon.com>, cwchoi00@gmail.com,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linuxarm@huawei.com, zhenglifeng1@huawei.com, zhangpengjie2@huawei.com,
 lihuisong@huawei.com, prime.zeng@hisilicon.com
References: <20260513093832.1645890-1-zhanjie9@hisilicon.com>
 <20260513093832.1645890-4-zhanjie9@hisilicon.com>
Content-Language: en-US
From: Yaxiong Tian <tianyaxiong@kylinos.cn>
In-Reply-To: <20260513093832.1645890-4-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_230938_109192_34770B3A 
X-CRM114-Status: GOOD (  25.99  )
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


在 2026/5/13 17:38, Jie Zhan 写道:
> Factor out common governor setting logic into devfreq_set_governor() so as
> to consolidate the code in governor_store() and devfreq_add_device().
>
> The caller is expected to hold 'devfreq_list_lock', enforced via
> lockdep_assert_held().  This is required because devfreq_add_device() must
> hold the lock from setting governor until the device is added to
> 'devfreq_list', so that a concurrent devfreq_remove_governor() cannot free
> the governor in between.
>
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>

I'm a bit unclear about the purpose of this commit, or the problem it 
solves. Can you explain it more clearly?


> ---
>   drivers/devfreq/devfreq.c | 117 ++++++++++++++++++--------------------
>   1 file changed, 56 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index 53c40d795a13..9e3e6a7348f8 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -318,6 +318,59 @@ static struct devfreq_governor *try_then_request_governor(const char *name)
>   	return governor;
>   }
>   
> +static int devfreq_set_governor(struct devfreq *df,
> +				const struct devfreq_governor *new_gov)
> +{
> +	const struct devfreq_governor *old_gov;
> +	struct device *dev;
> +	int ret;
> +
> +	lockdep_assert_held(&devfreq_list_lock);
> +
> +	old_gov = df->governor;
> +	dev = &df->dev;
> +
> +	if (old_gov) {
> +		if (old_gov == new_gov)
> +			return 0;
> +
> +		if (IS_SUPPORTED_FLAG(old_gov->flags, IMMUTABLE) ||
> +		    IS_SUPPORTED_FLAG(new_gov->flags, IMMUTABLE))
> +			return -EINVAL;
> +
> +		/* Stop the current governor */
> +		ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
> +		if (ret) {
> +			dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
> +				 __func__, df->governor->name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* Start the new governor */
> +	df->governor = new_gov;
> +	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
> +	if (ret) {
> +		dev_warn(dev, "%s: Governor %s not started(%d)\n",
> +			 __func__, df->governor->name, ret);
> +
> +		/* Restore previous governor */
> +		df->governor = old_gov;
> +		if (!df->governor)
> +			return ret;
> +
> +		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
> +		if (ret) {
> +			dev_err(dev, "%s: restore Governor %s failed (%d)\n",
> +				__func__, df->governor->name, ret);
> +			df->governor = NULL;
> +			return ret;
> +		}
> +	}
> +
> +	return sysfs_update_group(&df->dev.kobj, &gov_attr_group);
> +}
> +
>   static int devfreq_notify_transition(struct devfreq *devfreq,
>   		struct devfreq_freqs *freqs, unsigned int state)
>   {
> @@ -942,9 +995,7 @@ struct devfreq *devfreq_add_device(struct device *dev,
>   		goto err_init;
>   	}
>   
> -	devfreq->governor = governor;
> -	err = devfreq->governor->event_handler(devfreq, DEVFREQ_GOV_START,
> -						NULL);
> +	err = devfreq_set_governor(devfreq, governor);
>   	if (err) {
>   		dev_err_probe(dev, err,
>   			"%s: Unable to start governor for the device\n",
> @@ -952,10 +1003,6 @@ struct devfreq *devfreq_add_device(struct device *dev,
>   		goto err_init;
>   	}
>   
> -	err = sysfs_update_group(&devfreq->dev.kobj, &gov_attr_group);
> -	if (err)
> -		goto err_init;
> -
>   	list_add(&devfreq->node, &devfreq_list);
>   
>   	mutex_unlock(&devfreq_list_lock);
> @@ -1380,7 +1427,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
>   	struct devfreq *df = to_devfreq(dev);
>   	int ret;
>   	char str_governor[DEVFREQ_NAME_LEN + 1];
> -	const struct devfreq_governor *governor, *prev_governor;
> +	const struct devfreq_governor *governor;
>   
>   	ret = sscanf(buf, "%" __stringify(DEVFREQ_NAME_LEN) "s", str_governor);
>   	if (ret != 1)
> @@ -1391,59 +1438,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
>   	if (IS_ERR(governor))
>   		return PTR_ERR(governor);
>   
> -	if (!df->governor)
> -		goto start_new_governor;
> -
> -	if (df->governor == governor)
> -		return count;
> -
> -	if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE) ||
> -	    IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE))
> -		return -EINVAL;
> -
> -	/*
> -	 * Stop the current governor and remove the specific sysfs files
> -	 * which depend on current governor.
> -	 */
> -	ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
> -	if (ret) {
> -		dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
> -			 __func__, df->governor->name, ret);
> -		return ret;
> -	}
> -
> -start_new_governor:
> -	/*
> -	 * Start the new governor and create the specific sysfs files
> -	 * which depend on the new governor.
> -	 */
> -	prev_governor = df->governor;
> -	df->governor = governor;
> -	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
> -	if (ret) {
> -		dev_warn(dev, "%s: Governor %s not started(%d)\n",
> -			 __func__, df->governor->name, ret);
> -
> -		/* Restore previous governor */
> -		df->governor = prev_governor;
> -		if (!df->governor)
> -			return ret;
> -
> -		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
> -		if (ret) {
> -			dev_err(dev,
> -				"%s: reverting to Governor %s failed (%d)\n",
> -				__func__, prev_governor->name, ret);
> -			df->governor = NULL;
> -			return ret;
> -		}
> -	}
> -
> -	/*
> -	 * Create the sysfs files for the new governor. But if failed to start
> -	 * the new governor, restore the sysfs files of previous governor.
> -	 */
> -	ret = sysfs_update_group(&df->dev.kobj, &gov_attr_group);
> +	ret = devfreq_set_governor(df, governor);
>   	if (ret)
>   		return ret;
>   

