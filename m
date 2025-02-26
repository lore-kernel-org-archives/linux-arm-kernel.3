Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A67C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgO9NpdCEGs6Z6jBDJsgB6BtDtxW71jiKGyTEKJKCGA=; b=qjFPJb/2rKEwDUXh6PFRvGlDoS
	T64SmPxh0MwfPwEDd+oKO/pdvDsLveZFEIGXPbDyVjkF3WipG1Y3m6SHiPVLTTxSmofJ+pQC3vYf8
	SEZG5M5DE1QSO79Vu7mj4mf2ssbjpYnMgs9OQnPB82lIrfvVb7iVgbnEowvx865eBBKJ2UGj2pl81
	AvcJFCpk55sXfnKaIwIjaRC5VB5PdDBoX3F4m5+OlyJDp3J68sxKm/4WEBNPSCEWOP+keJzvV6v4r
	o4L+avjCrxva2lSbiN1xGWroKE/THljL85TWufjg28ut4DId6WlnRJ1ZW9G/FP6FnpszBQUuPHXpM
	JD5iX5iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPAQ-00000005VP8-3Pot;
	Wed, 26 Feb 2025 21:42:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnP8Q-00000005UsD-2aiw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:40:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4394944f161so386695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740606005; x=1741210805; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JgO9NpdCEGs6Z6jBDJsgB6BtDtxW71jiKGyTEKJKCGA=;
        b=HIZicoIePJm3aQh+VIVg4LUtplx4VAmPwjcug5VR+XfVUzVETdqQrMm26uzQV0gbHg
         cPRyDFixvoa3uf107Oqd+yFa7gw6E1UbgLmisRtn1ZOq1LGwfO2io79dFf37/ndq+afk
         BNi0adA8KZpPmByo+9m+wpqysDbVryz3JHtzEFVdVoQiCuSOBEodS8P0HyHsDrrNL7IJ
         +3jVoeEEIeyR9o8XyHQHHEOhaQ4689SlQIRSnVpm+M+qWLCJ2Z/VpuLWLufRjKEiOsbw
         ixMNv61psf6eK5nQVAZyuYGYLp/EvFUPUlaFmYL3XzT64hz50aPFWzXBQkj58/6KPHvG
         qzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606005; x=1741210805;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgO9NpdCEGs6Z6jBDJsgB6BtDtxW71jiKGyTEKJKCGA=;
        b=raez/ieiay91FIlOaPoWDcPUEwNB2q+t4HbY2gTNBHzJTZ/0nPYu2U28PGTKpvjhVe
         kucJlFbPaNn29J08aiBm/ZEc62BLLvYi4JJEt+mjgPS1CpA5DzgXM7au2VCWMc1W2cTj
         KGykXuBXuKbbPlZgDmiBCNf5L7OMlrHpyP20+6MH/YR76n9H1f5DZpTUd2pbsNy4XZlP
         P0TAhe7nY6sGUt9Q8TMRjLaYJIOgDBXxKPgW30w/79XYXUwlwVVY5zB1pFH+wHC1RCVr
         hvYbywUFzO1+TMDW0Ff5wytO6eRjvWa8V4airN0oCT7nYlz4SUFX1JFwxo99Y6x+c85s
         ScrA==
X-Forwarded-Encrypted: i=1; AJvYcCWYtszSh6nnIZtfNlEFOm9EFJ8g6jJopIfcCpukyfzCg+0DRwy+Wtm2IsljekVAiz7v6GcydClpR3A9jxbqzxA7@lists.infradead.org
X-Gm-Message-State: AOJu0YwpPXEb5oi8jijuD9IE2RggCmm30rDpnHj7E0ySLnDF6FP4wyz9
	Dt8multqTH0x+ZbO6HOrGEoUtC6DfxCVgbX2KPZ2HmzxFPtU9nd6utU2Qk6dcYA=
X-Gm-Gg: ASbGncuZb24/UZAUYqSIwK2VR83sMm+Of/xXQg20v2kq8LiM/H4F8q23PPSodEuqL2z
	sPjD9+SWgPihUgnkOnhJ8wVI+Jz4CH2McWaDdSnH3lFu+c8G9RnE7QqfWYqgAroon4e5Q+UmiQO
	smZeHW2LXGok+nqHFZ3VA14tUF1hklf/E57mceoYEd1gPc+DD/2T58R4K5jHQs/MqBz7sFKKbd7
	39QS7FWL1WfxQDEV+kzd72Ybt6RajJEOZvi7smcTl9e2Mhxzs9GxdHZuReJU/ilQJN1h3W5twsD
	Ms4sCVy5gocZnlVO8s9mTkU8Zgpg87kW7ovn6GzBm6WgHQ==
X-Google-Smtp-Source: AGHT+IH5K8VXJUv24C/joRhmZsMKIJdarB1HjHPAB90m4NhFdVMZeL3+c4slkqthb1e8MrMy4FkHHw==
X-Received: by 2002:a5d:6d8e:0:b0:390:e150:96b8 with SMTP id ffacd0b85a97d-390e1509a57mr323111f8f.6.1740606004983;
        Wed, 26 Feb 2025 13:40:04 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47960b6sm67703f8f.17.2025.02.26.13.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:40:04 -0800 (PST)
Message-ID: <ac6a461b-44f3-414e-b5a2-2d5a0a87cdf8@linaro.org>
Date: Wed, 26 Feb 2025 22:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-3-slavine@d3embedded.com>
 <416d75fd-40d0-45d7-9590-0322abb480ca@linaro.org>
 <D82NHO05EBSQ.3AZF1VYBU17V5@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <D82NHO05EBSQ.3AZF1VYBU17V5@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_134006_668639_3C0A2229 
X-CRM114-Status: GOOD (  10.17  )
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

On 26/02/2025 21:13, Sebastian LaVine wrote:
>> ...
>>
>>> +
>>> +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
>>> +{
>>> +       struct imx728 *imx728 = to_imx728(sd);
>>> +       int ret;
>>> +
>>> +       mutex_lock(&imx728->lock);
>>
>> Just use guard. That's actually perfect candidate.
>>
> 
> Okay -- I'll include this change in v4. I'm not so familiar with using
> this interface, so please let me know if this is incorrect:
> 


Yes, looks fine.

Best regards,
Krzysztof

