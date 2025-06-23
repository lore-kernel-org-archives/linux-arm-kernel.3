Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30D1C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGJGLljVH09RHHvcPmR2xlgcJlbWSurnIEnT57zI1pg=; b=SOmyxZ7aKIwkFsyfvJUdR86hK8
	3rv2J/9vuqczdbEsPdkAxbWFtfXUR2BcuX7bzJeg3Bzuezi84Y32ji5/31TspXaP798iNethoZYwN
	Y0XgxRKN3HFIpaO7Q+VSGndoxoiZALs4nWc6SaxYIs7vn6fm3k6QGdMRbem5nUt0tT7QirHC4+fM0
	3O8RV1kyokvIhhd1MFBUVSIjro+bycV/oMcb6bhI4SnpRjSJHm/h172pcy2zfu3poIMMisKWLgosd
	KaktxqiHL58XAhrovPcx7TRZD2yduF5RQOnT8YwrDkNJIbfGVuW+olc3SgTxb5fFEVUVBZRJxDVAu
	5BAyp3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdHH-000000028Ud-1Oag;
	Mon, 23 Jun 2025 09:15:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTd67-000000026Pg-413p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:04:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so40090865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750669454; x=1751274254; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGJGLljVH09RHHvcPmR2xlgcJlbWSurnIEnT57zI1pg=;
        b=AKthwCOn7edhoZs0/8A2GhfmucUuBZs4vnEyGxFwrLp6RIpazHcN855OEi0wK4B7dg
         eKpPDtEqm2WqfO0T/XYjREZv4vj8l3CJHrpwt6ryI2/+DXPMg1xSiQGBvT6TeCusvvkj
         UUqa6MYus8jGG60J511DStJnU8Or+xbxdl+Bbsdz++113U7KCMQkrj+QrrTg5/cT29NB
         58NDewkaMRwK30QZMvGLiRELhFznurI1dlEXTITR/9Tpqc7D1SnlKZTTO/ghG3xdMjAd
         /aGSCXh4CeiB/JLCFZb4xN9PDQLMlc5UeIK1YFb6AJorM6+pIBodNeNx0R4luIP0Tx7D
         6W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669454; x=1751274254;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGJGLljVH09RHHvcPmR2xlgcJlbWSurnIEnT57zI1pg=;
        b=GiV/pJ8aXeuJ5rbugkTgybDUQJcxEMrrmpty+3afNGPmzdbdEEpq2DAsEawNxYxD2y
         xXlOdvY5hNQ2Joy8vI6m2+t333tKtoPcuZygGD1CBO4xiTjgVtPc5a6TpE8RchHtetno
         i1eMJtl5B4jeTpv23uw0b5RB0j16YUC+0Dqbm0lO6uE426csi0UEr611l7wzvxTByq6c
         B7QaRHAbMyEl+GsJBNupaErjV5zAbYg7WsaJXJKe6g+kcG089f4/CTpmMt6OGLMUaCQl
         DsgWG7a7qXMLsxzmyMn8Y4uF6IXplaFUd32yohSuzz0PuyaXFhxDtha8J+iOyPZCVMig
         5eZA==
X-Forwarded-Encrypted: i=1; AJvYcCWPwhcQrNgnT8wWnGr+7yS2CgpsiV5yPLETpvZK7iifXKcFhvZ/kBn0gV+EjP9m0IV8eDZ2gRBfB5u7jrBO+T3u@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8shG71mZki8XBs9buiuLG7h5tDRw7I0qd97LatBadymIUe+cN
	ppzadAAs3KKkTmT2WGozdIoNXGsEWVSAJfANguvD4lyE2I7CszesawgHNl8Ez5U+36Q=
X-Gm-Gg: ASbGncufFPP86HQdQuyBPsOrOUXptT6pQL9vr5uhb9E618T03SLvHCaELvS+nSgC/iv
	ysn37ZEOEBYixE0niQoZasxiAHXaRj2836j3OeupKG9PUEBINijrsVr9sui+lu1P5g+dO4WIAdo
	w8MfvY8GVHc4iAUldIWwsMB4wHA7OIYNApvqfOqoGaj/djuCvqBet7NxH2lLPcy4zw/5ZfbDOVO
	+8gURwfF7Tfrxzo0IqGaZQere8NC1IsIDdV2/EhLs7VowZbnBNqnTjIEU0OxbZ7PVU4UZIzypJG
	hG8LJygLbaQ5bWNv9qKfU5E2XrNA2SMQRvSc5szvxj6oqI5ahpbiPZttqI2M
X-Google-Smtp-Source: AGHT+IHPFVP2GzxWqyLYPOcDDU16rCAlS0TgolK5wkPSR8zZb2Tfrc8wGwUYkTiUhGSu8NLF6anogw==
X-Received: by 2002:a5d:5f4b:0:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a6d12a41a1mr9212783f8f.16.1750669453679;
        Mon, 23 Jun 2025 02:04:13 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd07:164c:d535:3e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6d117c66esm8705949f8f.47.2025.06.23.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:04:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Philipp Zabel <p.zabel@pengutronix.de>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-mips@vger.kernel.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/4] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
In-Reply-To: <aEmzRrhQC+olmywj@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Wed, 11 Jun 2025 12:48:06 -0400")
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
	<20250611-clk-aux-v1-3-fb6575ed86a7@baylibre.com>
	<aEmzRrhQC+olmywj@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 23 Jun 2025 11:04:12 +0200
Message-ID: <1jikkmkewj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_020416_006261_BC0F2DAF 
X-CRM114-Status: GOOD (  21.43  )
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

On Wed 11 Jun 2025 at 12:48, Frank Li <Frank.li@nxp.com> wrote:

> On Wed, Jun 11, 2025 at 02:53:58PM +0200, Jerome Brunet wrote:
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>
> Actaully, you also remove unused struct clk_imx8mp_audiomix_priv *priv
> at clk_imx8mp_audiomix_reset_controller_register().
>
> Please add it into comments.

That's merely a side effect of removing the boilerplate code.
Like for the other changes of the same kind, I don't think listing the
symbols removed would be useful to the change description

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/imx/clk-imx8mp-audiomix.c | 49 ++++++-----------------------------
>>  1 file changed, 8 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> index 775f62dddb11d8cfd17a4ebf7a677ef399c5e617..765fb1f5bd4fa2b039d7414abd89471438ee41dd 100644
>> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
>> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> @@ -230,61 +230,28 @@ struct clk_imx8mp_audiomix_priv {
>>
>>  #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
>>
>> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
>> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>>  {
>> -	struct auxiliary_device *adev = _adev;
>> -
>> -	auxiliary_device_delete(adev);
>> -	auxiliary_device_uninit(adev);
>> -}
>> -
>> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
>> -{
>> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> -
>> -	kfree(adev);
>> -}
>> -
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> -{
>> -	struct auxiliary_device *adev __free(kfree) = NULL;
>> -	int ret;
>> +	struct auxiliary_device *adev;
>>
>>  	if (!of_property_present(dev->of_node, "#reset-cells"))
>>  		return 0;
>>
>> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> +	adev = devm_auxiliary_device_create(dev, "reset", NULL);
>>  	if (!adev)
>> -		return -ENOMEM;
>> -
>> -	adev->name = "reset";
>> -	adev->dev.parent = dev;
>> -	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
>> -
>> -	ret = auxiliary_device_init(adev);
>> -	if (ret)
>> -		return ret;
>> +		return -ENODEV;
>>
>> -	ret = auxiliary_device_add(adev);
>> -	if (ret) {
>> -		auxiliary_device_uninit(adev);
>> -		return ret;
>> -	}
>> -
>> -	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
>> -					no_free_ptr(adev));
>> +	return 0;
>>  }
>>
>>  #else /* !CONFIG_RESET_CONTROLLER */
>>
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>>  {
>>  	return 0;
>>  }
>>
>> -#endif /* !CONFIG_RESET_CONTROLLER */
>> +#endif
>>
>>  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
>>  {
>> @@ -408,7 +375,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		goto err_clk_register;
>>
>> -	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
>> +	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
>>  	if (ret)
>>  		goto err_clk_register;
>>
>>
>> --
>> 2.47.2
>>

-- 
Jerome

