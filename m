Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630CACCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9qU6FzgzJIkijGhPwFvDcu1xBSrqOMq/g46aIW1/Vk=; b=XrMsJOKTDS1aPlwDvV5WynwoYq
	8lMfyX58briqBOgUYq2Q+4BIRamocwiboQko6q3MlQfhaVHKMcgS/WsmBL5+ZrqmW/Pt4tlyP/0w7
	vW+Zsp0S+nGPEu9ZrGtg9Ri0rqcuZ5Ok/46gus9nTi9XcsE/l5qTSMu6eau9hb6dgxvZ3OhLV7VcW
	N4hzkb2NiqWPwnQySD6X/BH/fTftCf8V9UR44YTy1OLx0hpqqZkmsXCH1UwXRtGbriaMLwrpQx/0R
	X1G2FQU5BVRupItFJz8/nEIYrN+ltwgPZdkmG2C3AIW6KlOIDwyPzqM+YatkGZU9SIFp6a8oofbUq
	J78d/B4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAodE-0000000DIZ9-2zLE;
	Mon, 20 Oct 2025 12:04:56 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoYQ-0000000DCkl-2zks
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:00:00 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3d50882cc2so814122766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760961597; x=1761566397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r9qU6FzgzJIkijGhPwFvDcu1xBSrqOMq/g46aIW1/Vk=;
        b=UYHS2xP6QbDAq7Vb2435S9eu+ftHBBbZJ62s58sQloJigVI6piPPKQoTZhoi0n/Igd
         DXO7gw548xkLyfg6JnEfCARJoZ01wCsKZnDraW2EMm7n9G5Y30Qgct6ONS0NGTF95kY9
         XUmsVrW/gNfyAD8AflVoh+Q/BWcz9QfAh0Nx54Qh0gZtrcHM/OslZqJfxxYaPAdkFZT3
         JDLhbEie4aswD7YITe5s8t0Sf9PXidV7RiJKJmdmnCaqCmOQm0LgdXeShkktdr1iNXi+
         HXvmbrMmT/qVfyhY2hthUIgM41FR5xUuxtDiKg2oh041z2Qm2lAw/aW0WMWgS+SJ2E0S
         EKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961597; x=1761566397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9qU6FzgzJIkijGhPwFvDcu1xBSrqOMq/g46aIW1/Vk=;
        b=K+xyy8edmU/FzoOgrlIrTnNbXyhO4jphGVlh7+5iFMoX8xBtRTXaUz2KvIiREGdvp/
         wd5BBn0C85ThrrY6EWJGZKChLMBP/TsnUbCiCGphQ9JEg+ZqkR6tOtxUM29tl8x3X6wN
         uDricV1DIxc/RUsusrqS4kFQyG4EGe65z6t8aC976BIKKGkV9cTaEBfcAgALHCCl/uLJ
         QMMfQ21/VKtDlUJWbnso78clTxYXXtFwXq6C8ebp4sETU4NzP9e+JpPg3ACYLVatlktZ
         qY+ZhbrQHOwt3LkyrJ0vVrINAl5s147kqDSf6YepBiE2G1WQohxJCY8RhGZYegMenTP7
         NeRg==
X-Forwarded-Encrypted: i=1; AJvYcCWgoXNpWaNngpVrOnBtePOA0sgg5Hw4eddggDd0e5bdR5HydMS6tvCw2mpW+8F9Mt/jXQizRfESvMYRLErS3d5X@lists.infradead.org
X-Gm-Message-State: AOJu0YwecaYzHyH+DG2hhN/w/EgnB8BD4msOLXT1BoAfVYyG+iqmLuWB
	9lT4OU4EPTpaCKEWjTybFx3kR74q6mlYc0ipt2TFoMgiK3Pt8FK41p44
X-Gm-Gg: ASbGncvHkojwgSIFMnvI4+W3oRJh+a+Sg4GHJQ6hHtT9iVuoDsK3T8OOp6/b8MH122a
	pFqR1xYpxiF1T7OtO5+XbOJsKyGu80SjWnaHasjZw/23Q8xe7PnNtuzWCIYYFTUjZNIyGIrE4Bx
	KYOpOanZgAtFeI6csiVwTAP6ygt3YrPiK6fjyGc9nqMeOqHd1MVBRcYZng0g8b65N/vBeBDfh0d
	6U7bqrhUGg7LVl8GRucv2KKTNp54Hx3isUGOp780AHpEA7bnUSDT/4bs6rViaa5awuWJ2i2Xv80
	CL8VBhtYPFqu1GSf6/eHDYxExnVKjpQeoQw2kaQRx1LgvFwbUwnsv9Jch5LLqq63sc7VUWi/quf
	jZawVhPaotIb/2IPJZ1AL9qeWbNEJnjYAHEIHyy/Dm2AB2kcxZgLldiai1+/mSUwJJblthPtyUL
	KfODq9inimUv1arjtBGoIYvTOLqyzhdHep
X-Google-Smtp-Source: AGHT+IEBXKsErf4ichcBkQA9FZmSnI5DZeli6KgMkaabKrVEZ2rxSHwXbSqWavZ4Sb3eNG/IyTW7tA==
X-Received: by 2002:a17:907:70d:b0:b42:9840:eac5 with SMTP id a640c23a62f3a-b647482e03cmr1529682266b.61.1760961596496;
        Mon, 20 Oct 2025 04:59:56 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725d80sm777107466b.67.2025.10.20.04.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:59:56 -0700 (PDT)
Message-ID: <7b4936f5-77ea-4077-94bc-38bb5c63f4c3@gmail.com>
Date: Mon, 20 Oct 2025 04:59:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] reset: imx8mp-audiomix: Extend the driver usage
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-7-laurentiumihalcea111@gmail.com>
 <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_045959_310404_8889E83C 
X-CRM114-Status: GOOD (  25.80  )
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


On 10/17/2025 7:56 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:23AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
>> which allow users to control the assertion and de-assertion of the
>> reset lines tied to some peripherals present in said subsystems. Some
>> examples of such SoCs include i.MX8MP with AUDIOMIX block control and
>> i.MX8ULP with SIM LPAV.
>>
>> Some of the aformentioned block control IPs exhibit a common pattern with
>> respect to the assertion and de-assertion of the reset lines. Namely, the
>> user is able to control the state of the reset line by toggling a bit from
>> one of the IP's registers.
>>
>> Linux can take advantage of this pattern and, instead of having one driver
>> for each block control IP, a single, more generic driver could be used.
>>
>> To allow this to happen, the previous approach, in which a single reset
>> map is used, is replaced by a per-driver approach, in which each auxiliary
>> device driver holds a reference to a certain reset map.
> Can you shorter your commit message?, basically, you just add
> imx8mp_reset_info for difference auxiliary_device_id.


yeah, but the commit message is not trying to explain the code, but, rather,

offer a bit more context to understand WHY we're doing this. However, I'm not

fixated on this so if people don't think it's useful then I'll just shorten it.


>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index c74ce6e04177..c370913107f5 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -24,7 +24,12 @@ struct imx8mp_reset_map {
>>  	bool active_low;
>>  };
>>
>> -static const struct imx8mp_reset_map reset_map[] = {
>> +struct imx8mp_reset_info {
>> +	const struct imx8mp_reset_map *map;
>> +	int num_lines;
>> +};
>> +
>> +static const struct imx8mp_reset_map imx8mp_reset_map[] = {
>>  	[IMX8MP_AUDIOMIX_EARC_RESET] = {
>>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>>  		.mask = BIT(0),
>> @@ -45,10 +50,16 @@ static const struct imx8mp_reset_map reset_map[] = {
>>  	},
>>  };
>>
>> +static const struct imx8mp_reset_info imx8mp_reset_info = {
>> +	.map = imx8mp_reset_map,
>> +	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
>> +};
>> +
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>>  	void __iomem *base;
>>  	struct regmap *regmap;
>> +	const struct imx8mp_reset_info *rinfo;
>>  };
>>
>>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
>> @@ -60,6 +71,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>>  				  unsigned long id, bool assert)
>>  {
>>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>> +	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
>>  	unsigned int mask, offset, active_low, shift, val;
>>
>>  	mask = reset_map[id].mask;
>> @@ -144,7 +156,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  		return -ENOMEM;
>>
>>  	priv->rcdev.owner     = THIS_MODULE;
>> -	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
>> +	priv->rinfo           = (const struct imx8mp_reset_info *)id->driver_data;
> needn't force convert from void*
>
> Frank
>
>> +	priv->rcdev.nr_resets = priv->rinfo->num_lines;
>>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>>  	priv->rcdev.of_node   = dev->parent->of_node;
>>  	priv->rcdev.dev	      = dev;
>> @@ -168,6 +181,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>>  	{
>>  		.name = "clk_imx8mp_audiomix.reset",
>> +		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
>>  	},
>>  	{ }
>>  };
>> --
>> 2.43.0
>>

