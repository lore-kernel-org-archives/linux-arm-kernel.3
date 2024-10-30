Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4299D74956
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 01:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P/eNINX1+nUXxYVeJ0aIrPC3NHMi0AKWaTPVLn79EA=; b=wYAiDN9W+yS4/EGA8Te27eczz4
	GrrXH8ERSyd6SdBL9mA0lFuweTCgBZlLf+D3VmdKI74qRe2sAlZF07PqjT0+Mqom5UxxsZTLC8KxO
	dMzLBveeNEirbXDT7BQxXGHLUmWTApSsKpb+ByePh/A0KgBTBlfiFrW37L1e5Np+rPOlckAO6ryCS
	O288yjkL6bswkvXkxMN6c1U6/RYijmPFk8DV3/C7vm18ajdwx2Z3orONK9T9vlIr9yUJmBaX+nUIf
	R6RaVISCtCTLPOXU5GwsdB2Re3iXnioTGPeJeGQ2GZ46XpRQZB8zP8l/wWfUVX43y448UCDAYSPMO
	iUALL6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xqW-0000000GTOf-0htz;
	Wed, 30 Oct 2024 01:50:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xo7-0000000GSvX-29TY;
	Wed, 30 Oct 2024 01:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE1015C56BC;
	Wed, 30 Oct 2024 01:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4A2C4CECD;
	Wed, 30 Oct 2024 01:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730252854;
	bh=yY/c+Ers7lzRZ2/3Cil0sCo9++1VJGqVZ3Deuce2yLw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VSKPNlsAp8xtYZqJ+lL3YeYwf9h/KFmuUS0SrU0Kd242zkRGAHj2tZolSWx5TqYYy
	 4nMY2czlPWVQ7utq52nGSF20rvImvjjAqmR+9w2LTQC0Jd/gfxj3NZ9GkeXjHBfZFb
	 493wcFo0ZPkd83UmmFKOxxYlg8TrGNdnH1pelNWwl/0f/1aPmchj9yj4oJh5/10lRP
	 oV7fTfv0EkNj5fjXslkR1HT9ZdVhkfAtoO+CBBc9i2tnpqDenWV0yzF5Ev0csWkAzl
	 2DhqaGvlKXAJGKFu1dSBT59LPjrL7SLpRWY+1G37QnNyRq8Ix79lrwXLYqfkDisGmN
	 WjR19ra5keh9A==
Date: Tue, 29 Oct 2024 18:47:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini
 <drew@pdp7.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v5 2/2] net: stmmac: Add glue layer for T-HEAD
 TH1520 SoC
Message-ID: <20241029184732.2e3ef7b7@kernel.org>
In-Reply-To: <20241025-th1520-gmac-v5-2-38d0a48406ff@tenstorrent.com>
References: <20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com>
	<20241025-th1520-gmac-v5-2-38d0a48406ff@tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_184735_627831_29B9FE98 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

On Fri, 25 Oct 2024 10:39:09 -0700 Drew Fustini wrote:
> +static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 phyif;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		phyif = PHY_INTF_MII_GMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		phyif = PHY_INTF_RGMII;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	};

unnecessary semicolon

> +
> +	writel(phyif, dwmac->apb_base + GMAC_INTF_CTRL);
> +	return 0;
> +}
> +
> +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 txclk_dir;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		txclk_dir = TXCLK_DIR_INPUT;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		txclk_dir = TXCLK_DIR_OUTPUT;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	};

unnecessary semicolon
-- 
pw-bot: cr

