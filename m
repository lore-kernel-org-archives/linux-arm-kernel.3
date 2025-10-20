Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41230CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1eXoiKa57M0gaXP2/qboz4vYgfifx7d8J+7aF573gA=; b=mU+d9Hm+q9OafS6IpGJFWkJCZV
	vP4ujonzOTcU4LKdUXwRmIbPTzX6wByUjW3ZNoUbPSOgUx3pja7RaNmrpeh5lD1nauOHKL6RKCPkL
	lez0NTx1KNDNx4WEnFa2DNIB9NLirCLp+N6eO9QCozM4ie+3O7aSszfE1wR/vUeTQr8ivlPoASDKk
	iZWgnoLDANmn50Vv1Ja+7Fad4f3G5MMp0jAJIdD2pXqWmxfH4puZu5p/PePvbgJE30j3lJ/ua6+5a
	DA71vH1rFDy6B30fhl55cpY99Kk9joNawbzQwf3TUeNwu5iNWPl+z2UkqKjkgxzFQO0sQ46tYZUYI
	ZFBGdFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmAU-0000000CZYW-3J82;
	Mon, 20 Oct 2025 09:27:06 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmAS-0000000CZWf-2w8L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:27:06 +0000
X-UUID: ed7ae332ad9611f0a38c85956e01ac42-20251020
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:dce9fd46-61cb-4524-b7d4-39d2bb690b89,IP:0,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-20
X-CID-META: VersionHash:a9d874c,CLOUDID:d9832ce7111d0b5b2c3f35b3ae267732,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|102|850,TC:nil,Content:0|50,EDM
	:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed7ae332ad9611f0a38c85956e01ac42-20251020
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1051764157; Mon, 20 Oct 2025 17:26:58 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: eugen.hristev@linaro.org
Cc: alexandre.belloni@bootlin.com,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nicolas.ferre@microchip.com,
	xiaopei01@kylinos.cn
Subject: [PATCH] iio: adc: ti_am335x_adc: Limit step_avg to valid range for gcc complains
Date: Mon, 20 Oct 2025 17:26:55 +0800
Message-Id: <1208d71f952e3bb85076d229e5fc1b21e2735567.1760166576.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e9d6831a-d0ef-440c-b235-fec18048deed@linaro.org>
References: <e9d6831a-d0ef-440c-b235-fec18048deed@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_022705_119536_2DEADC0F 
X-CRM114-Status: GOOD (  14.28  )
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

On 11/28/24 08:45, Pei Xiao wrote:
>> at91_adc_interrupt can call at91_adc_touch_data_handler function
>> to start the work by schedule_work(&st->touch_st.workq).
>> 
>> If we remove the module which will call at91_adc_remove to
>> make cleanup, it will free indio_dev through iio_device_unregister
>> while the work mentioned above will be used. The sequence of operations
>> that may lead to a UAF bug is as follows:
>> 
>> CPU0                                      CPU1
> 
>                                      | at91_adc_workq_handler
>> at91_adc_remove                      |
>> iio_device_unregister(indio_dev)     |
>> device_release                       |
>> //free indio_dev                     |
>                                      | iio_push_to_buffers(indio_dev)
>                                      | //use indio_dev
> 
> Fix it by ensuring that the work is canceled before proceeding with
> the cleanup in at91_adc_remove.
>> 
>> Fixes: 27e177190891 ("iio:adc:at91_adc8xx: introduce new atmel adc driver")

>I believe that the commit that introduced the workqueue is different
>than the one you tagged here.

>With that changed,

>Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

I am so sorry I have been ignoring this reply for almost a year..

>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>  drivers/iio/adc/at91-sama5d2_adc.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
>> index 8e5aaf15a921..4ba52b500054 100644
>> --- a/drivers/iio/adc/at91-sama5d2_adc.c
>> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
>> @@ -2491,6 +2491,7 @@ static void at91_adc_remove(struct platform_device *pdev)
>>  	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
>>  	struct at91_adc_state *st = iio_priv(indio_dev);
>>  
>> +	cancel_work_sync(&st->touch_st.workq);
>>  	iio_device_unregister(indio_dev);
>>  
>>  	at91_adc_dma_disable(st);

