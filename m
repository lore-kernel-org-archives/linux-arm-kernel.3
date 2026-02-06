Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1076EA795E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpEDLnYj95OpOlLlWla7+a1PBaolL4JOvRD2mY4U/kc=; b=rlWX3dZCDHog+ptYNKYts6NX5e
	s4gXN4RXMdp6ZRr7836xxxTOxK/rmGZeXGkPBSnVUgrTSQxaHvGOYHYjU7qbYyGymYEZiKmBPuWrm
	96P2/WS6upXFfZP+7VeuF6PwNGY8kJT/3StmjDIorPikKy3pXZerh8cw5AJC6/P0TUAi+RBgOHJXP
	2Cw9WUCwgt6wVp3/rNYf9N4dJdbGcIrqjGAJK3Wziz3ykVMD4hWph+HpMEiEGAhFR93Y+4ofxf6sQ
	Q9nxEYKoPl3eJz2HLVc4Akt7nRl3yCghvMyeZTPd8hw7FrGlfpT/FJXsdkccFtIlupz8cYCHEJ9rz
	gonEHpAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIXA-0000000B81T-3JMh;
	Fri, 06 Feb 2026 09:53:52 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIX7-0000000B817-3Z5b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 09:53:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so20517465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 01:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770371629; x=1770976429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpEDLnYj95OpOlLlWla7+a1PBaolL4JOvRD2mY4U/kc=;
        b=YCfiuGa47S5c29F2QoTZFDshL5EygxMpDsAPh+zuNLZvAHSLHYo7CNgqVWpsGf1L0w
         MAggEOtOpqTh9KBW9b7OWU0NE71XcALZzFiRikpBDy1GclmD//UrLCdrJVc4oyu/fPYh
         m3v8yJCNob9bXuo8Lwc9UtbIDJMlXZ836HKmjYRGLg3nswAs4/2butq0cFjCbJofmUtZ
         1LG3p971DXHioD6pDURMVOjnkCtZ1sbx4kQ5yD6rm7F1jE0FHrarBrVO2fWLRhrTbe4E
         1qjlQ/dVilhesOUjSc3lbCkVO2xtm1ywSkpupOkqKGdkMbgSky3qVZy0F2pqE8U1RXqL
         yTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770371629; x=1770976429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpEDLnYj95OpOlLlWla7+a1PBaolL4JOvRD2mY4U/kc=;
        b=IRBeyA2KhpP2lbzbBwM6IiIvV9YhNKBzGUyE69CPyZeccLns6q+wtuDH/+UKH6dsQB
         me43iF7CUeaYYHPtyMNGKNjbSMCgkegXuPIKMuA0kQPMMO1kXUQqC24VexAcSR8AJ8RW
         o8bPc7Gs8CVYcKSWaNNXUlDDDCqFeopepkYj5GEc7RpZAV9oI0cUFejJydkExl9eD3k0
         TrDLxisKX6bxse07MJEJ/YzaKnjse0QEg7cn5Inj7z5282rpEz1h3ymCfADjAEvxNZ90
         JB0oqsj9ZE8ivqbqF/cgWDBB9bYvHhYc5c56rmZykfpaxp+dm1VcqqpjgICm8JqumFHe
         iA9g==
X-Forwarded-Encrypted: i=1; AJvYcCXJTRviTWvuMaKBhMKvO688jQpnRobihWqgZZzLMLq0mpAMKc0QHxGlppYY13nIocdXqzD7zxQP0Ndl7nzX+Abe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8IhY3LC6PGKCC6BOBD6pvPUsnn70EQuG21uU5KjPXUcPaWbYS
	XdYUj0aqxSVrC764NivYaQL21uDhjULaQCasBfMG5KMgiflFtL5QJRyM
X-Gm-Gg: AZuq6aJ1cDtzhjx7jybM4Lf6l9sP/DScMryCnijw637SFRb0HhLicNdzLfBoc2RrRRx
	/RfGsz2lA3MtX+6CcPVvplKKH6gfH1GdDuHWnKtFuzTyYNJXmCrOjiLxdqUonnzNHsTsm9pN/QB
	agqvC3wDEPhYm7qWtEQB8AbBiGC2cOyZs6MZXOmdz5NpH+BpiMkHv1oIcyDxvVR5NTO+NHRMAfa
	FfAmoO/vNBYjJaUUjw7UkHJi3YxEoq+F9RgyyjfjWKo7AQTjgJG1sz3sOb7S62f0jVUECS/WPlg
	v0eqUnJojIVG9K26KqMktfxvoQvTGf1HyyFfS5UYTMq/h8h/kKqzS3USfNaxg2FEuluECz+5LFA
	m+vqKKWSAui9KxiLtq3+UOhBrBTRl0aTl/SiE+IFWI2cUnrjhM2j18Z1iXL/LMUe9295T5T0CqM
	/2UDXRSkl9rn0lVtSMXrToBZot1jGutOKBWw0Cuc8Mn9yiGdEevU5WpEG4borX53rA
X-Received: by 2002:a17:902:cf4c:b0:295:592f:94a3 with SMTP id d9443c01a7336-2a9519a19e0mr23066635ad.48.1770371628931;
        Fri, 06 Feb 2026 01:53:48 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9761sm19141145ad.48.2026.02.06.01.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:53:48 -0800 (PST)
Message-ID: <4281a709-04a4-4b9f-b511-bff0a332f9bd@gmail.com>
Date: Fri, 6 Feb 2026 17:53:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew@lunn.ch>
References: <20260205014006.735408-1-a0987203069@gmail.com>
 <20260205014006.735408-4-a0987203069@gmail.com>
 <aYRlKk-cCIhqGWX7@shell.armlinux.org.uk>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aYRlKk-cCIhqGWX7@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_015349_896942_0137A021 
X-CRM114-Status: GOOD (  30.27  )
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


On 2/5/2026 5:38 PM, Russell King (Oracle) wrote:
> Hi,
>
> On Thu, Feb 05, 2026 at 09:40:05AM +0800, Joey Lu wrote:
>> +
>> +struct nvt_priv_data {
>> +	struct platform_device *pdev;
> This looks to me like it's write-only, does it serve a useful purpose?
>
>> +	struct regmap *regmap;
> This doesn't seem to be used outside of nvt_gmac_setup().
>
>> +};
> Given the above two comments, do you actually need struct nvt_priv_data ?
You are right. I'll drop it in the next revision.
>
>> +
>> +static struct nvt_priv_data *
>> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *bsp_priv;
>> +	phy_interface_t phy_mode;
>> +	u32 macid, arg, reg;
>> +	u32 tx_delay_step;
>> +	u32 rx_delay_step;
>> +	u32 miscr;
>> +
>> +	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
>> +	if (!bsp_priv)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	bsp_priv->regmap =
>> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
>> +	if (IS_ERR(bsp_priv->regmap))
>> +		return ERR_PTR(dev_err_probe(dev, PTR_ERR(bsp_priv->regmap),
>> +				     "Failed to get sys register\n"));
>> +	if (macid > 1) {
>> +		dev_err(dev, "Invalid sys arguments\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
>> +		tx_delay_step = 0;
>> +	} else {
>> +		if (arg <= 2000) {
>> +			tx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
>> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay_step);
>> +		} else {
>> +			dev_err(dev, "Invalid Tx path delay argument.\n");
>> +			return ERR_PTR(-EINVAL);
>> +		}
>> +	}
>> +	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
>> +		rx_delay_step = 0;
>> +	} else {
>> +		if (arg <= 2000) {
>> +			rx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
>> +			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay_step);
>> +		} else {
>> +			dev_err(dev, "Invalid Rx path delay argument.\n");
>> +			return ERR_PTR(-EINVAL);
>> +		}
>> +	}
> Each of these could be moved into a separate function:
>
> static int nvt_gmac_get_delay(struct device *dev, const char *property)
> {
> 	u32 arg;
>
> 	if (of_property_read_u32(dev->of_node, property, &arg))
> 		return 0;
>
> 	if (arg > 2000) {
> 		dev_err(dev, "Invalid %s argument.\n", property);
> 		return -EINVAL;
> 	}
>
> 	if (arg == 2000)
> 		return 15;
>
> 	return arg / NVT_PATH_DELAY_STEP;
> }
>
> then:
> 	int ret;
>
> 	ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
> 	if (ret < 0)
> 		return ERR_PTR(ret);
>
> 	tx_delay = ret;
>
> 	ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
> 	if (ret < 0)
> 		return ERR_PTR(ret);
>
> 	rx_delay = ret;
I'll update the code according to your suggestions.
>> +
>> +	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
>> +	regmap_read(bsp_priv->regmap, miscr, &reg);
>> +	reg &= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
>> +
>> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
>> +		dev_err(dev, "missing phy mode property\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	switch (phy_mode) {
>> +	case PHY_INTERFACE_MODE_RGMII:
>> +	case PHY_INTERFACE_MODE_RGMII_ID:
>> +	case PHY_INTERFACE_MODE_RGMII_RXID:
>> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>> +		reg &= ~NVT_MISCR_RMII;
>> +		break;
>> +	case PHY_INTERFACE_MODE_RMII:
>> +		reg |= NVT_MISCR_RMII;
>> +		break;
>> +	default:
>> +		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	if (!(reg & NVT_MISCR_RMII)) {
>> +		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay_step);
>> +		reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay_step);
> You can move this inside the switch above under the RGMII case. Theses
> delays are, after all, only for RGMII.
Got it. I'll move them into the RGMII case.
>> +	}
>> +
>> +	regmap_write(bsp_priv->regmap, miscr, reg);
> Consider:
>
> 	regmap_update_bits(bsp_priv->regmap, miscr,
> 			   NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK |
> 			   NVT_MISCR_RMII, reg);
>
>> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>> +	if (IS_ERR(plat_dat))
>> +		return PTR_ERR(plat_dat);
>> +
>> +	/* Nuvoton DWMAC configs */
>> +	plat_dat->core_type = DWMAC_CORE_GMAC;
> Is the hardware not compatible with any of the compatible types that
> devm_stmmac_probe_config_dt() will automatically set this for you?
> Which version of the core do you have?
>
>> +	plat_dat->tx_fifo_size = 2048;
>> +	plat_dat->rx_fifo_size = 4096;
> There are tx-fifo-depth / rx-fifo-depth properties that can be used to
> describe these in DT.
>
>> +	plat_dat->multicast_filter_bins = 0;
>> +	plat_dat->unicast_filter_entries = 8;
> If this core is v3.50, v3.70 or v3.72, then there are
> snps,multicast-filter-bins and snps,perfect-filter-entries which
> can be used to describe both of these.
>
> Thanks.

Thanks for the feedback.

This GMAC is based on v3.73a. While this specific revision isn’t 
explicitly documented in the current DT binding YAML, the relevant FIFO 
sizing and filter capabilities match the behavior introduced in earlier 
v3.70+ cores.

Given that, I agree it makes sense to describe these parameters using 
the existing DT properties.

I will update the DT and driver accordingly in the next revision.

Joey

>

