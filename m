Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DD9C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6PVliGSFycddGsKkW91KxttLoqW/+RWeZZekuLgL8o=; b=SsgnlHfcOXkBN/6kN6GO5bsLXI
	dsZbLBVOQHbS41w7WVBmAwbCg8HjQstIPK597m4hm3iCTIEcZczvIwUYlgalni4Xa52gHdbmI9C4C
	Df3eBz+WmkUJQ0pYWe6gkAeNdrIBEoT4vS04gd73IFxGnx1tu19ZbHaHBXHbPbSs5j4URHe87MB8q
	zQNvgwpaGBo1lW3WdMrpZDBgg2LF91FtgFnDwy71dCrrfoiQvn8Aq8mOUi5EZ2l1OGqdnRAtvifFn
	GmhFB5Sm0LYshrusxzIH/Rhys5gPtOGvL66CwaX8vrdh7S3/wzZ3sR8resUezEokLiYsyqh2A4g6Y
	wEI1Musw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT5H-0000000BNMg-00rb;
	Wed, 22 Jul 2026 09:17:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT5F-0000000BNMT-22Pp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:17:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8643160A71
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD9C1F01558
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784711864;
	bh=/6PVliGSFycddGsKkW91KxttLoqW/+RWeZZekuLgL8o=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eIYmS0hRD1KL5/PnVlBYaE4b6NAiEwAvR80GpXOK033yOOQ0XxCaSF6JbV1s4B36q
	 sGzkyI/LlznYxtwVcYCcThIYOvstmSCgdDZpMKZ0oW/J6s82zkpwVPz1kptMYkBKZ2
	 l37pwiCsaixEgd1zytkGIKnBQF2f9fnmlRzKkq02m+9Kwj3S+S/1cmv1kdEZSW8SCh
	 S1OJFAfJyLIZX2TkG9CkPc1QRxY7exVk3315v/o48Bg8monAbIj5VjKbPx+XhgqqOQ
	 6XzKUfTQMy0PdrtouMwME+PcIHI0McXoOyWKbQ97M/162XGw9GUZoYOct8HlCA9v8I
	 6fLs6O3QvG6Cg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c95395230so72612191fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:17:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rru9f2qqteRDSLV1NjvGiQKTBGns8xHST40EbCfRxQX5AljXTCOULSLfXUxLdPCdmfgM6NSILQm1VGD7Ow+p246@lists.infradead.org
X-Gm-Message-State: AOJu0YxzDniX7JIoLDeffG/Xas8EQ5bbPBF7dgeecbppX6naWMAy5qmx
	3HQovUTFm50e6Vl/mLYnlDjjQpTon5ifUJQ4PNDsTxt0M2BKchHitVsj1Dadc13dSK9wGeJWNmY
	ulw6XAOHLPpArzOEJqWsMazxLSZaKEew0uLDcX2Xl1A==
X-Received: by 2002:a2e:a9ab:0:b0:399:9436:15c8 with SMTP id
 38308e7fff4ca-39eb270e082mr43628601fa.2.1784711862775; Wed, 22 Jul 2026
 02:17:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 02:17:41 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 02:17:41 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <773715fd-823f-4564-ba42-c60bc8284b45@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com> <773715fd-823f-4564-ba42-c60bc8284b45@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 02:17:41 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdLMQgJsxAMXLBkZNWUiz9fYh0j=C5ErbFoDLV=VfPUzg@mail.gmail.com>
X-Gm-Features: AUfX_mwTbpG9pQdrDFtGkM8Tiwv_fdaEPF_gwsJQGZR809JD0LGXxyeWnhoxkdg
Message-ID: <CAMRc=MdLMQgJsxAMXLBkZNWUiz9fYh0j=C5ErbFoDLV=VfPUzg@mail.gmail.com>
Subject: Re: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Udit Tiwari <quic_utiwari@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 21 Jul 2026 20:20:05 +0200, Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> said:
>
>
> On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> [...]
>
>>   static int qce_crypto_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct qce_device *qce;
>> +	struct resource *res;
>>   	int ret;
>>
>>   	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
>> @@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>   	qce->dev = dev;
>>   	platform_set_drvdata(pdev, qce);
>>
>> -	qce->base = devm_platform_ioremap_resource(pdev, 0);
>> +	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>   	if (IS_ERR(qce->base))
> Would you like to add any debug/error log ?
>>   		return PTR_ERR(qce->base);
>>
>> @@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>   	qce->async_req_enqueue = qce_async_request_enqueue;
>>   	qce->async_req_done = qce_async_request_done;
>>
>> +	qce->dma_size = resource_size(res);
>> +	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
>> +					 DMA_BIDIRECTIONAL, 0);
>> +	qce->base_phys = res->start;
>> +	ret = dma_mapping_error(dev, qce->base_dma);
>> +	if (ret)
> Would you like to add any debug/error log ?

No, I don't think this is needed and at v23 this really is useless bikeshedding
and doesn't add anything to the discussion and only delays getting
this upstream.

Bartosz

>> +		return ret;
>> +
>> +	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
>> +	if (ret)
> same here
>> +		return ret;
>> +
>>   	return devm_qce_register_algs(qce);
>>   }
>>
>
> [...]
>
>

