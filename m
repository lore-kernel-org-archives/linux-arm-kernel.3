Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F07EDB7CC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhUhM7TYxFWQJk8xgxU9dZQKtoxIxIBRIBiWXcoPPIQ=; b=TCU9C9AMB3690pdL7CFtLS0jxr
	3PPD2wrk8NA8hM9OmQH6g6nA84CCUdsWIirhHhQBqxAnVwMsxIGHrj/5+0hlaNxiW5j1xXW6NK4PW
	2yDvr491ZvytHkUDxtdg+4154si8kZiF33X905YjRaprPIRwKr2JsNppLqrQ8KmIfIaGN6sw6LY8Z
	AVHUIlJGdqr8YiqvE/BN6oljfy3Y1ZhsGfPWrfiNPebEFxUhLZyx/0Dh/CsPfTS09HP5xTgpV8L/8
	9iySOQmZFeqG48A2cFNwPvozkH5s/wf4zYNB3SWuKvhUyNZDOOIt5Rx+0wHfLwtygeaokF3IbwW9R
	/hOj+FbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1Zu-000000067hh-2HUA;
	Tue, 07 Apr 2026 08:14:30 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1Zq-000000067hH-2rgD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:14:28 +0000
X-UUID: c7cbaed0325911f1aa26b74ffac11d73-20260407
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:83df2d24-2cb7-45b1-b816-c9f0ea4d053f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:bfaf8827c76e159ca0db3e104194e851,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c7cbaed0325911f1aa26b74ffac11d73-20260407
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1327235905; Tue, 07 Apr 2026 16:14:21 +0800
Message-ID: <80a108ac-c100-4077-b51e-8139f9ec277b@kylinos.cn>
Date: Tue, 7 Apr 2026 16:14:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: zynq-qspi: Simplify clock handling with
 devm_clk_get_enabled()
To: Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org
References: <0c851587c90ae51d1498d18955aefc83fa41f17d.1775547057.git.xiaopei01@kylinos.cn>
 <827a6fdf-b119-4aea-9442-7f27f1383c78@amd.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <827a6fdf-b119-4aea-9442-7f27f1383c78@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_011427_120501_D36917F6 
X-CRM114-Status: GOOD (  17.78  )
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



在 2026/4/7 16:01, Michal Simek 写道:
> 
> 
> On 4/7/26 09:32, Pei Xiao wrote:
>> [You don't often get email from xiaopei01@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Replace devm_clk_get() followed by clk_prepare_enable() with
>> devm_clk_get_enabled() for both "pclk" and "ref_clk". This removes
>> the need for explicit clock enable and disable calls, as the managed
>> API automatically disables the clocks on device removal or probe
>> failure.
>>
>> Remove the now-unnecessary clk_disable_unprepare() calls from the
>> probe error paths and the remove callback. Simplify error handling
>> by jumping directly to the remove_ctlr label.
>>
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>   drivers/spi/spi-zynq-qspi.c | 31 ++++++-------------------------
>>   1 file changed, 6 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
>> index 5232483c4a3a..8c3975030d0a 100644
>> --- a/drivers/spi/spi-zynq-qspi.c
>> +++ b/drivers/spi/spi-zynq-qspi.c
>> @@ -661,7 +661,7 @@ static int zynq_qspi_probe(struct platform_device *pdev)
>>                  goto remove_ctlr;
>>          }
>>
>> -       xqspi->pclk = devm_clk_get(&pdev->dev, "pclk");
>> +       xqspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
>>          if (IS_ERR(xqspi->pclk)) {
>>                  dev_err(&pdev->dev, "pclk clock not found.\n");
>>                  ret = PTR_ERR(xqspi->pclk);
>> @@ -670,36 +670,24 @@ static int zynq_qspi_probe(struct platform_device *pdev)
>>
>>          init_completion(&xqspi->data_completion);
>>
>> -       xqspi->refclk = devm_clk_get(&pdev->dev, "ref_clk");
>> +       xqspi->refclk = devm_clk_get_enabled(&pdev->dev, "ref_clk");
>>          if (IS_ERR(xqspi->refclk)) {
>>                  dev_err(&pdev->dev, "ref_clk clock not found.\n");
>>                  ret = PTR_ERR(xqspi->refclk);
>>                  goto remove_ctlr;
>>          }
>>
>> -       ret = clk_prepare_enable(xqspi->pclk);
>> -       if (ret) {
>> -               dev_err(&pdev->dev, "Unable to enable APB clock.\n");
>> -               goto remove_ctlr;
>> -       }
>> -
>> -       ret = clk_prepare_enable(xqspi->refclk);
>> -       if (ret) {
>> -               dev_err(&pdev->dev, "Unable to enable device clock.\n");
>> -               goto clk_dis_pclk;
>> -       }
>> -
>>          xqspi->irq = platform_get_irq(pdev, 0);
>>          if (xqspi->irq < 0) {
>>                  ret = xqspi->irq;
>> -               goto clk_dis_all;
>> +               goto remove_ctlr;
>>          }
>>          ret = devm_request_irq(&pdev->dev, xqspi->irq, zynq_qspi_irq,
>>                                 0, pdev->name, xqspi);
>>          if (ret != 0) {
>>                  ret = -ENXIO;
>>                  dev_err(&pdev->dev, "request_irq failed\n");
>> -               goto clk_dis_all;
>> +               goto remove_ctlr;
>>          }
>>
>>          ret = of_property_read_u32(np, "num-cs",
>> @@ -709,7 +697,7 @@ static int zynq_qspi_probe(struct platform_device *pdev)
>>          } else if (num_cs > ZYNQ_QSPI_MAX_NUM_CS) {
>>                  ret = -EINVAL;
>>                  dev_err(&pdev->dev, "only 2 chip selects are available\n");
>> -               goto clk_dis_all;
>> +               goto remove_ctlr;
>>          } else {
>>                  ctlr->num_chipselect = num_cs;
>>          }
>> @@ -728,15 +716,11 @@ static int zynq_qspi_probe(struct platform_device *pdev)
>>          ret = devm_spi_register_controller(&pdev->dev, ctlr);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "devm_spi_register_controller failed\n");
>> -               goto clk_dis_all;
>> +               goto remove_ctlr;
>>          }
>>
>>          return ret;
>>
>> -clk_dis_all:
>> -       clk_disable_unprepare(xqspi->refclk);
>> -clk_dis_pclk:
>> -       clk_disable_unprepare(xqspi->pclk);
>>   remove_ctlr:
>>          spi_controller_put(ctlr);
>>
>> @@ -758,9 +742,6 @@ static void zynq_qspi_remove(struct platform_device *pdev)
>>          struct zynq_qspi *xqspi = platform_get_drvdata(pdev);
>>
>>          zynq_qspi_write(xqspi, ZYNQ_QSPI_ENABLE_OFFSET, 0);
>> -
>> -       clk_disable_unprepare(xqspi->refclk);
>> -       clk_disable_unprepare(xqspi->pclk);
>>   }
>>
>>   static const struct of_device_id zynq_qspi_of_match[] = {
>> -- 
>> 2.25.1
>>
> 
> There is also clock manipulation in zynq_qspi_setup_op() which needs to be handled.
> 
Can I remove this code? If not, please ignore this patch, and I apologize for the noise.

In zynq_qspi_setup_op: 
         ~~~~remove this clk enable code
	ret = clk_enable(qspi->refclk);
	if (ret)
		return ret;

	ret = clk_enable(qspi->pclk);
	if (ret) {
		clk_disable(qspi->refclk);
		return ret;
	}
	~~~

Thanks!
Pei.

> Thanks,
> Michal


