Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E57FE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKjEsab/YHJDjvXMzn/f8ORtX5aw6wyOGkDVucrAOfw=; b=gthaLTVxWC0RxbkR1Jt8qN4tl8
	SvSxQQCqomwg5BnQVsu7zq4b92EVewOk/yp6xDwHNqy/MVBV91bUHMR3wvoE5fDHjBHWpAc1KYSuu
	/JIXY9BzQKQ7hxTHf8TGsA6a+Yt4znLBUM7Wv41JNBiUrqI4dWfv3e1+VYGShyUGJC1FeZbeDhBxM
	IYRjocHynXP/jkEicZs0uhQuAzASkQo8wgvFXMtiPEGw4KdnjVxlyz3g/BY+t+OjmX8V/XOcqx90V
	yMmWu7YYPnsCMYmd7hTl8P6UNy+PKlCSD6LQE1SCW66TueD2jbLaW0TjsseOnt92QJUF4zkTPU8gO
	jIjFVVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImXH-0000000CBwU-1EIO;
	Wed, 04 Dec 2024 10:23:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImVQ-0000000CBhz-2fIT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:21:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 523A01063;
	Wed,  4 Dec 2024 02:21:41 -0800 (PST)
Received: from [10.57.68.118] (unknown [10.57.68.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 267EC3F5A1;
	Wed,  4 Dec 2024 02:21:12 -0800 (PST)
Message-ID: <7860c682-f6a8-4b97-86bc-c5e706a7bb34@arm.com>
Date: Wed, 4 Dec 2024 10:21:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-etm4x: add isb() before reading the TRCSTATR
Content-Language: en-GB
To: yuanfang zhang <quic_yuanfang@quicinc.com>, mike.leach@linaro.org,
 james.clark@linaro.org, alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241204101320.3692167-1-quic_yuanfang@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241204101320.3692167-1-quic_yuanfang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_022116_720450_D0C86844 
X-CRM114-Status: GOOD (  14.62  )
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

Hi


On 04/12/2024 10:13, yuanfang zhang wrote:
> From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> As recommended by section 4.3.7 ("Synchronization when using system
> instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> self-hosted trace analyzer must perform a Context synchronization
> event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> 

Thanks for the patch. Please could you add the above in a comment
in the changes below ?

Also, add Fixes tag ? (It may go all the way back to initial support)

Otherwise looks sensible to me.

Suzuki

> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 66d44a404ad0..5da2c523c30a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -906,6 +906,7 @@ static void etm4_disable_hw(void *info)
>   	tsb_csync();
>   	etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
>   
> +	isb();
>   	/* wait for TRCSTATR.PMSTABLE to go to '1' */
>   	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
>   		dev_err(etm_dev,


