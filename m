Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D820C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s417j/ysygJZ4xE0jMBISIxl2zgVW4JEiLwZ40hycxA=; b=X2w0/6ep6gU9eR0GYA+ZPzasPu
	ghUNgy8bAXPb48VyG2LRM3Tenq3iOIIEfWvUR5Sd7mpMauEYhejva3wjaNJW4iEb7QxF1J8C3LIGP
	hjc8j8lSjHRbsjpE+ZxNNYvoxDnXvyUEuadxNCko/jzliCGlKwvNLtTjWuSRAIgnZzbj2upHQaOj3
	BQkPRX9PpLfam7fBlC3halMLSZj/GYWOu5VKj4cFdC7JLWjXSvpTUqw601gh0/QS+2JVGO3R7tM5L
	NAjFRerCXYY1iD2HsaFfA23lwC4+yHwN6kfC026ApUdejzu0ft5aNOrii9IM7pDIMg4UCxP63R9KW
	ii9t6OEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eUT-0000000ER3d-3hMM;
	Thu, 10 Sep 2026 13:06:57 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eUR-0000000ER2C-0LXP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:06:56 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so1262013f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789045613; x=1789650413; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s417j/ysygJZ4xE0jMBISIxl2zgVW4JEiLwZ40hycxA=;
        b=Q3rj6unL1aAaJtdPbVrsTFj2HwCHcGd3J2twDRU7hAo0RGLjUEINThoCVIMQj59YmB
         Yzw/avpg/dRi0N+4sb2HRrA9K7rbzRyBqEN5yInmfi6zJE5CJ1fRfb1e89GaNx/jE1sA
         mj6Oue14RNC/wk9uCpujG6E6wR/yIziZCcWdokpunRzf3RHWDNa9UN7n8IrTO/rG9GJV
         U61RIiA9BgXw0HTYocOahC76osmpt7qr6h+zi0rzIlpmApTMcqrGXKQy2pHVTUVZgoBq
         DeYfGN/sUL4yo994EieppeH44iUC7yFWE8zhqL7mGdbgFxf+v9+lI7zAMNG97/Ovaqq5
         47VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045613; x=1789650413;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s417j/ysygJZ4xE0jMBISIxl2zgVW4JEiLwZ40hycxA=;
        b=ZBlBOrr76BDOu4+RWANbMRztH0GtIiYu/CedrUkdgBXfpsA4Ib6wb4OVfjNWvk7Ea3
         t5VXOFRLgtweKmX+7zbJqtbyumvZpLdIrTAeW54Uexsoi5jN6Ql4FY3AJ/SKPtlcRJJD
         4slPQ5qgN1v2CoUmvYyrlsFThyAGm2YDuulV4KCdZx2JZM+9tGwYazb0uI2IKSZrJb4N
         J3StNtVXiv6McKr+FnQPheEG3LYUecSJQWUseqyY+zsFx8ohfDGsMLBSnTft3PAopWTw
         KQAEpvIVckow83y752GW+7qPpzgyet9tdTC4B2n50z30AhU3hdUpI0Pi6xTu7SZBF7bC
         HP8g==
X-Forwarded-Encrypted: i=1; AKwUvBxkXa7laxrmjlQlmScBqt8FRlu1hS2hfIhgsUy4aBj6nl4wRLtabh87jcBOUxCsowISkqdnfvNbziIDL2IsQpbI@lists.infradead.org
X-Gm-Message-State: AFuF++mERuKitQPx2AKIzEGotzv8oQcFp41MvgNHPolyg4dF+o84zrS7
	7LehzBvnnr/zqMkixOIoOtIMvJ2neKp216A/pyVX3+aZTrcYms8CPLi+fQoVGw8NQVs=
X-Gm-Gg: AYBFou2/pagPll0hMAXONPMxAmxPFJIe6hSVSrrYVC90sIKD0WlqYlFoqI1cCAjxNI8
	kARS7IDaZ+bGQTUccLX+uZKWjwmHlGg/11fWTtwIlX58EiJ1RiqQNZrhIRRbUsn2eyBZYy7srvS
	m9ZgzRoaaOcaOSPQdv9M4ozRWYLK2X7VonICC5jJ8vZIBrWNdwsyjS4ati79nfm3sAdG7p/kMhS
	8dILOJjW1peOSV6SMs85h43eoS0vSAq0xf2qIdTlmV+JJYcsOdMQSCmEd5Q89rmizwzjTGHZ4zy
	QFZOCLBS8c9eIXMIjO/APLeekY9cR3YGeARg/pNMd7S1xEsNdOD94rAp/9zdU2h2mM9isyM4/LA
	S5dAWLlQxg5gobhvLL+Clkc0SXVs4VpoUI9asDFKFAj9LSjpvGb48OCdzaiR0qD/dJ2Am6aXzXb
	RHr1DGRUxw1dQ5nlAyUY2YGaahMN6Ve/A4kI9rvVNKm9SAdZGs9E5WL52KwYxfsgTMpIuVOUQ3c
	akZXM3Ig4kw0YnehB4TbsXE7SAU
X-Received: by 2002:a05:6000:22c8:b0:484:3310:710d with SMTP id ffacd0b85a97d-485aae0e29amr22786196f8f.25.1789045613146;
        Thu, 10 Sep 2026 06:06:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm44969402f8f.2.2026.09.10.06.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:06:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Richard Cochran
 <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
 <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
 <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
Date: Thu, 10 Sep 2026 15:06:51 +0200
Message-ID: <1jqzj16ys4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_060655_145885_FF3AC402 
X-CRM114-Status: GOOD (  29.76  )
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

On jeu. 10 sept. 2026 at 12:59, Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hi Jerome,
>
> On 9/10/26 12:25, Jerome Brunet wrote:
>> The A733 GMAC210 is a DesignWare MAC 5.20 using an Allwinner glue close to
>> the A523 GMAC200 already supported by this driver, with the following
>> differences to handle:
>> 
>> * The glue configuration registers are a dedicated MMIO region of the
>>   controller instead of a syscon register. This new register region
>>   appears to be in the reset domain of stmmac's main reset. This requires
>>   the glue driver to handle the reset rather than letting stmmac deal with
>>   it.
>> * The TX clock delay value is 5 bits wide, split over 2 register fields,
>>   allowing delays up to 3100ps.
>> * The DMA channels have their own interrupt lines, so the per-DMA-channel
>>   interrupt mode is enabled, as the vendor SDK does.
>> * TX LPI clock gating is supported, as the vendor SDK indicates. Follow
>>   the PHY capability with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP rather than
>>   forcing it on with the deprecated 'snps,en-tx-lpi-clockgating' DT
>>   property.
>> 
>> Unlike the A523, both GMAC instances are supported by the same driver.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> [...]
>
>> +
>> +static struct regmap *sun60i_gmac210_get_regmap(struct platform_device *pdev,
>> +						struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 1);
>> +	if (IS_ERR(base)) {
>> +		dev_err_probe(dev, PTR_ERR(base), "unable to get glue memory region\n");
>> +		return ERR_CAST(base);
>> +	}
>> +
>> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {
>
> Why check stmmac_ahb_rst, but not do anything with it ?

Not strictly required, it was cheap to do and catch mis-configuration
since the stmmac treat them as optional. I'll drop it

>
>> +		dev_err(dev, "missing required reset controls\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	/*
>> +	 * The configuration registers are inside the controller
>> +	 * reset domain, so the reset must happen before any write to them
>> +	 * and should not be done again by stmmac or the configuration will
>> +	 * be lost.
>> +	 */
>> +	ret = reset_control_assert(plat->stmmac_rst);
>> +	if (!ret)
>> +		ret = reset_control_deassert(plat->stmmac_rst);
>> +
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "device reset failed\n");
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, sun60i_gmac210_reset_assert,
>> +				       plat->stmmac_rst);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	plat->stmmac_rst = NULL;
>> +
>> +	return devm_regmap_init_mmio(&pdev->dev, base, &sun60i_a733_regmap_cfg);
>
> I wonder if this is the first glue to face this...
>
> If you need further setup to be done after reset has been deasserted, I suggest
> adding a dedicated callback in plat_stmmacenet_data, instead of doing this behind
> the generic code's back.
>
> maybe something like "post_reset_init()", something like that ?
>

I'll check in this direction.

The idea was to do things behind anything's back, more to handle the
specifities of this SoC without polluting the rest. The timing seemed a
bit sensitve. For example touching the other reset in here broke the
link for some reason (recognize as GMII instead of RGMII)

> the ->mac_setup already runs after reset, but isn't really for this type of usecase.
>
> For readability of the patch, maybe you should split this patch to first do the
> a523 rework, then add a733 support.

ok

>
> Thanks !
>
> Maxime

-- 
Jerome

