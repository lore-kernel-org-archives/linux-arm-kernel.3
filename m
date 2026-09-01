Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27408C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyeT2gPwgRHGbRT1UC00BJ26hUwN31fmD+oDhUutisA=; b=CUE9WMLS+oyUAimVOSsWb03+1Z
	UTQAal9xU9aocuNhU85Dykt75iJRs7sL63AuBkSpTPU0cGROxn1LBqfSNUfYzLMX0Fi6iQS2EMrjf
	1q5r21C8p2YL/LZtIg7cMg40yjv2o26deWCRplK/2XvJ1uCq8wvPVRFUIIQ9vA/WEKhT7jxBh/cxY
	wbUA0b822nmGyjV5uz0Mhdh9hUWguaWgKzPzN78MRgZUYBVy9SQ94BMfwV5nII+iF5+wgYTyWykhp
	J3p+l/ilhewDWV0Nw5NbDhkIqogDH2oH5tJViuWQZB/GpreHT9GTcZWTPF0mnqM3fHQOFMARmu2lb
	f0ReILOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P1E-0000000CGWb-1zFn;
	Tue, 01 Sep 2026 13:59:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P1B-0000000CGVs-3nQu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788271156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyeT2gPwgRHGbRT1UC00BJ26hUwN31fmD+oDhUutisA=;
	b=KyeCevMprtdCYPT5qP6PaXzXCrjqRl2/bIBUByesZ9ZtgzEu9B1gG0fgXUZxbDE5t+sjPt
	GXCdNU8S6AkXoUWc6+XsiGtfHrYeQLQbed6h3CWPq4eapUWXuB8SA33OpoHN9MZXe92oRU
	nT3ds9RaD+fBV22ZIL8m3UrvwB8u+wY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-zRdF9mFENoulzWVzuCFyGw-1; Tue, 01 Sept 2026 09:59:09 -0400
X-MC-Unique: zRdF9mFENoulzWVzuCFyGw-1
X-Mimecast-MFC-AGG-ID: zRdF9mFENoulzWVzuCFyGw_1788271148
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49ccf17d3b0so18186115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 06:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271148; x=1788875948;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyeT2gPwgRHGbRT1UC00BJ26hUwN31fmD+oDhUutisA=;
        b=Dp7yHc4EsBQIsZfQXlEEjua3lYjIbVWJMGIN0v1E5CX1NnGU+aZVH5Zw002nManUzt
         vjM2OxYIW9Egky2Ws37cIrA3i7JXgO6yP5Yq3rFQwUqVeDQBvYKdfvg54BSlVaC/nJ50
         McO67ydTQ5xKtwlHrnp51qH2NMY4dTGwbQoz7uwg2WknxjaOewIuUok8nSKPgY+T2VHo
         VNP5DXeUvzTencGTjXcXoool4Jg3tVIPFI97TNwT3XjcRdpS5W8d+BcLWMGPc3ZK04fY
         oRAAOhx8s///L08xqpe41ZZRXoXTI+7rNNnVqTPRJFA5xuHGverrHAsG0o1aIOuXyBkv
         2/WQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxCoj3WmheWgW64DHoC1aHwMIZnJ7pJZg6xA8Jh5vjwal0PxdS4SBhoXu7L1LH/JG5sr7+SJB/jtkZFlr48cBu@lists.infradead.org
X-Gm-Message-State: AFuF++kwQRPMq+OCfHRy5r0BXjylhFYJiVOXoFS/zAHKLjpjqKMQx6gj
	BmkQ/NHDlnz1tM5atP5dnnYlxoqVgeH3YKpp7mw6j2T2LpxUvm9oahI7rFxXcwW5l9vZZyXVE2Z
	7/FSeajlEj99bCRwbJtsZtaNcT5dglizgiv4jds3JsO2YiNwjS0REem+F3PXrbRGRd5sUEgvIb3
	Qa
X-Gm-Gg: AR+sD10q0ocIKVIbSiHojrlFQb9bpj1fYibWJlPktF99nw8UHm4bilToisZwPl3ats0
	k7paa7n4vtDOO5YBiXmBXwAcrXcG68YAr+Xo+89UZQGD9YLnQUwtQc0WErBFk9hdzXslUZrXTet
	oWE08Ro7W7leFWlS9URVsUDJ9yXm58OkCgQUB/yibgJIy05tu/ggUVbu/tsffnF0mYyQhbKh72h
	NNe/VkOA4EArBvJNPsX3TluX/bK5A34vCwlHLx21+6jGkQHTJi7NotJ+hni39kqKvockborNSZ8
	7ne4VEeWV2t5LT/tSSPheBJp5POXApY5Jusdjc2/yzGiKrCzZaKjIvSWo4sJ5gebLZRXRIu9DgQ
	pp/FHEXUGIOsdrgfhHd/e88I2HMlSdd/sdocVq+o2Ft1Jmgx4LZha1n8CCW9FNH735Fn65UzWJQ
	==
X-Received: by 2002:a05:600c:3542:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cdc422c19mr158172455e9.3.1788271148254;
        Tue, 01 Sep 2026 06:59:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3542:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cdc422c19mr158171425e9.3.1788271147829;
        Tue, 01 Sep 2026 06:59:07 -0700 (PDT)
Received: from [192.168.188.218] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm76476035e9.4.2026.09.01.06.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:59:07 -0700 (PDT)
Message-ID: <17e50070-46c9-46dd-8109-95007a4f681f@redhat.com>
Date: Tue, 1 Sep 2026 15:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: phy: motorcomm: Enable analog frontend
 on YT8531S
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>, Yao Zi <me@ziyao.cc>,
 Frank <Frank.Sae@motor-comm.com>
Cc: thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260831073747.361482-1-maxime.chevallier@bootlin.com>
 <20260831073747.361482-4-maxime.chevallier@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260831073747.361482-4-maxime.chevallier@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ykThflAUtvJaelosX3Xy4960G4tj6NU23fxtWVBlBY8_1788271148
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_065918_026711_3F7D40E2 
X-CRM114-Status: GOOD (  24.76  )
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

On 8/31/26 9:37 AM, Maxime Chevallier wrote:
> The YT6801 PCIe NIC includes the dwmac-motorcomm IP for the MAC part, as
> well as a YT8531S PHY, configured in GMII mode.
> 
> It seems this PHY requires the Analog Front-end (AFE) DAC clock to be
> enabled for link to reliably establish, otherwise the link just doesn't
> come up.
> 
> Let's enable it at config_init().
> 
> This logic has been extracted from the vendor driver provided by
> Motorcomm.
> 
> It's really unclear if this is specific to the integrated version of
> that PHY, and how this potentially interacts with the fiber mode this
> PHY supports, so this configuration is only enabled when the interface
> is GMII, i.e. the PHY is integrated.
> 
> With this, the PHY reliably establishes link and the YT6801 PCIe card
> becomes fully functional.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/motorcomm.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 36c229460a77..90a4f86f2758 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -144,6 +144,11 @@
>  #define YT8521_CLOCK_GATING_REG			0xC
>  #define YT8521_CGR_RX_CLK_EN			BIT(12)
>  
> +/* Analog front-end control register 3 */
> +#define YT8531S_EXT_AFE_CTRL3			0x12
> +/* Analog front-end DAC clock enable */
> +#define YT8531S_AFE_CTRL3_CLKDAC_AON		BIT(13)
> +
>  #define YT8521_EXTREG_SLEEP_CONTROL1_REG	0x27
>  #define YT8521_ESC1R_SLEEP_SW			BIT(15)
>  #define YT8521_ESC1R_PLLON_SLP			BIT(14)
> @@ -1740,8 +1745,15 @@ static int yt8531s_config_init(struct phy_device *phydev)
>  	if (ret)
>  		goto err_restore_page;
>  
> -	if (phy_interface_is_rgmii(phydev))
> +	if (phy_interface_is_rgmii(phydev)) {
>  		ret = yt8531_set_ds(phydev);
> +		if (ret)
> +			goto err_restore_page;
> +	}
> +
> +	if (phydev->interface == PHY_INTERFACE_MODE_GMII)
> +		ret = ytphy_modify_ext(phydev, YT8531S_EXT_AFE_CTRL3,
> +				       0, YT8531S_AFE_CTRL3_CLKDAC_AON);

Sashiko suspects this will not survive a suspend/resume:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831073747.361482-1-maxime.chevallier%40bootlin.com

/P


