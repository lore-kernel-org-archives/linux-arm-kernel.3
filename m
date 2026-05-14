Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1C0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 06:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgRs3lLU4pjlK5GfsGN9tIb9wgMwFLqwmKC0omwO8aY=; b=CcXfqziihxT/gP8+XppPXrCKBb
	pae7JEc/dMqiqLR/bvdKJYH2lpyg8IhClmtW4EHMDSY2Nka0J6c2/fZQ0XMiOdj6/0wcXwJ0X33yg
	iQBjq2WTfv2GY2GlcyQy1P1Z1xdVMXPQR/dqGq0S1Tf8YjYlmF0FJY0+2+ovezoiuocuEuKsUY1bi
	hbo5VF5LpkniKm18Zi9VFY5q5Ucrw7dd0QG0j2ls0sUgsO9KxXgohnhFyu3Lh9F1qQ8YbBJEgYcze
	y/54uNJDINHUNIlBv13w7xUHNCp1/QSDBFjlpdyJ+W8r73GaHLyqpz9MHGfwWiqrj72nX1kS3gt/Q
	M0z27XXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNP9x-00000004frc-2V9T;
	Thu, 14 May 2026 06:03:01 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNP9v-00000004fqv-2SUh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 06:03:00 +0000
X-UUID: 8bc731b64f5a11f1aa26b74ffac11d73-20260514
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:03109eba-89fe-4522-82ae-73a005aa09a2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:232ba708cf382797efbad0345395cd12,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8bc731b64f5a11f1aa26b74ffac11d73-20260514
X-User: tianyaxiong@kylinos.cn
Received: from [10.42.13.21] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tianyaxiong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 189337449; Thu, 14 May 2026 14:02:53 +0800
Message-ID: <55fbdfeb-28c0-458b-a3a5-2603fbbf41ea@kylinos.cn>
Date: Thu, 14 May 2026 14:02:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] devfreq: Use mutex guard in
 devfreq_add/remove_governor()
To: Jie Zhan <zhanjie9@hisilicon.com>, cwchoi00@gmail.com,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linuxarm@huawei.com, zhenglifeng1@huawei.com, zhangpengjie2@huawei.com,
 lihuisong@huawei.com, prime.zeng@hisilicon.com
References: <20260513093832.1645890-1-zhanjie9@hisilicon.com>
 <20260513093832.1645890-3-zhanjie9@hisilicon.com>
Content-Language: en-US
From: Yaxiong Tian <tianyaxiong@kylinos.cn>
In-Reply-To: <20260513093832.1645890-3-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_230259_938934_E6339230 
X-CRM114-Status: GOOD (  12.43  )
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
> Use mutex guard in devfreq_add/remove_governor() so as to simplify the
> locking logic.
>
> No functional impact intended.
>
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> ---
>   drivers/devfreq/devfreq.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index 7a70dd051644..53c40d795a13 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -1261,28 +1261,23 @@ void devfreq_resume(void)
>   int devfreq_add_governor(struct devfreq_governor *governor)
>   {
>   	struct devfreq_governor *g;
> -	int err = 0;
>   
>   	if (!governor) {
>   		pr_err("%s: Invalid parameters.\n", __func__);
>   		return -EINVAL;
>   	}
>   
> -	mutex_lock(&devfreq_list_lock);
> +	guard(mutex)(&devfreq_list_lock);
>   	g = find_devfreq_governor(governor->name);
>   	if (!IS_ERR(g)) {
>   		pr_err("%s: governor %s already registered\n", __func__,
>   		       g->name);
> -		err = -EINVAL;
> -		goto err_out;
> +		return -EINVAL;
>   	}
>   
>   	list_add(&governor->node, &devfreq_governor_list);
>   
> -err_out:
> -	mutex_unlock(&devfreq_list_lock);
> -
> -	return err;
> +	return 0;
>   }
>   EXPORT_SYMBOL(devfreq_add_governor);
>   
> @@ -1320,21 +1315,20 @@ int devfreq_remove_governor(struct devfreq_governor *governor)
>   {
>   	struct devfreq_governor *g;
>   	struct devfreq *devfreq;
> -	int err = 0;
>   
>   	if (!governor) {
>   		pr_err("%s: Invalid parameters.\n", __func__);
>   		return -EINVAL;
>   	}
>   
> -	mutex_lock(&devfreq_list_lock);
> +	guard(mutex)(&devfreq_list_lock);
>   	g = find_devfreq_governor(governor->name);
>   	if (IS_ERR(g)) {
>   		pr_err("%s: governor %s not registered\n", __func__,
>   		       governor->name);
> -		err = PTR_ERR(g);
> -		goto err_out;
> +		return PTR_ERR(g);
>   	}
> +
>   	list_for_each_entry(devfreq, &devfreq_list, node) {
>   		int ret;
>   		struct device *dev = devfreq->dev.parent;
> @@ -1356,10 +1350,8 @@ int devfreq_remove_governor(struct devfreq_governor *governor)
>   	}
>   
>   	list_del(&governor->node);
> -err_out:
> -	mutex_unlock(&devfreq_list_lock);
>   
> -	return err;
> +	return 0;
>   }
>   EXPORT_SYMBOL(devfreq_remove_governor);
>   
Reviewed-by: Yaxiong Tian <tianyaxiong@kylinos.cn>

