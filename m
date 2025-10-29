Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E00CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScvcTy8ozlqmT8s8gsLtsWpW/tRbjYKzmG+MWRwqsow=; b=yMmXiA7oJyRhhsqIoShMo/x65w
	v6QAfUDYNVQRlmZpMCXRkVRWkALSO9ZiC3U4edM0NLsSHB6aKeol4CEvevZ9aKI1R9XxYTYtWqDnU
	jYTHKEA7MnZs5Ww2SG2/Wajc2gg+fnChe67H3cj06HD1U/W32hXyeMlk6sHYkUK3dBUEUHzuD1ujg
	+3M1gRjeT7lFyD9UcimEmRIl8lXcmU39K/MHFVaUKOVuLqVH+smTTkbIAxHaZ8fVL/xTamlX7XxwF
	4AzTGnsEOfjBDSdDvFzAPUrfhb1tU/34RmKy6SszLbT/kZt+Fs5BVEIUiG9y2QBDwg4LxgjhiRUJH
	kCAD1NQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBr6-00000002bQl-3nU8;
	Wed, 29 Oct 2025 19:29:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBr3-00000002bOO-17FT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:29:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D118F4E413D7;
	Wed, 29 Oct 2025 19:29:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89565606E8;
	Wed, 29 Oct 2025 19:29:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7CC4117FD242;
	Wed, 29 Oct 2025 20:28:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761766144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ScvcTy8ozlqmT8s8gsLtsWpW/tRbjYKzmG+MWRwqsow=;
	b=er6dy6F0AkewbZOEtLIUH1uP7pet6Cc/msERkGQj89coxq5gPxp79ydF7hrtmMaQwPae2e
	uKdCy801xdNppwVzk/dnqIlmlEooSk/olx+i977JcRUAOAZsVebEvZLagVUJ0GR5gFCoYj
	1wG5ZcCJvB5MbkqzdG+DEVfkE9enbz3rcHSu3T8DRrGQ5IEFBbaXpBi2/WIWrY/8uFjC58
	uDQ6O6z2aTI7krrSv6/9WHoGrx8Gg1HrDd7uxWjdQuLgdxX5Gm0kERnj+x6t7h14gCgG5w
	xU5A0dKajRosGpPsX+Autsu+EYwon2yf2lb9QOA6VLsOi9U/q565lvcFW9s9fQ==
Message-ID: <45ebd2eb-9b09-43fa-a451-29299b33f06a@bootlin.com>
Date: Wed, 29 Oct 2025 20:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] net: phy: Add helper for fixing RGMII PHY mode
 based on internal mac delay
To: Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-3-inochiama@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251028003858.267040-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_122909_443491_34FB93FD 
X-CRM114-Status: GOOD (  20.64  )
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

Hi,

On 28/10/2025 01:38, Inochi Amaoto wrote:
> The "phy-mode" property of devicetree indicates whether the PCB has
> delay now, which means the mac needs to modify the PHY mode based
> on whether there is an internal delay in the mac.
> 
> This modification is similar for many ethernet drivers. To simplify
> code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
> mac_rxid) to fix PHY mode based on whether mac adds internal delay.
> 
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Name may be a bit long, but I'm not the best at naming stuff :)

I agree with the logic of that helper,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/phy/phy-core.c | 43 ++++++++++++++++++++++++++++++++++++++
>  include/linux/phy.h        |  3 +++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
> index 605ca20ae192..4f258fb409da 100644
> --- a/drivers/net/phy/phy-core.c
> +++ b/drivers/net/phy/phy-core.c
> @@ -101,6 +101,49 @@ const char *phy_rate_matching_to_str(int rate_matching)
>  }
>  EXPORT_SYMBOL_GPL(phy_rate_matching_to_str);
>  
> +/**
> + * phy_fix_phy_mode_for_mac_delays - Convenience function for fixing PHY
> + * mode based on whether mac adds internal delay
> + *
> + * @interface: The current interface mode of the port
> + * @mac_txid: True if the mac adds internal tx delay
> + * @mac_rxid: True if the mac adds internal rx delay
> + *
> + * Return fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
> + * not apply the internal delay
> + */
> +phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
> +						bool mac_txid, bool mac_rxid)
> +{
> +	if (!phy_interface_mode_is_rgmii(interface))
> +		return interface;
> +
> +	if (mac_txid && mac_rxid) {
> +		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
> +			return PHY_INTERFACE_MODE_RGMII;
> +		return PHY_INTERFACE_MODE_NA;
> +	}
> +
> +	if (mac_txid) {
> +		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
> +			return PHY_INTERFACE_MODE_RGMII_RXID;
> +		if (interface == PHY_INTERFACE_MODE_RGMII_TXID)
> +			return PHY_INTERFACE_MODE_RGMII;
> +		return PHY_INTERFACE_MODE_NA;
> +	}
> +
> +	if (mac_rxid) {
> +		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
> +			return PHY_INTERFACE_MODE_RGMII_TXID;
> +		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
> +			return PHY_INTERFACE_MODE_RGMII;
> +		return PHY_INTERFACE_MODE_NA;
> +	}
> +
> +	return interface;
> +}
> +EXPORT_SYMBOL_GPL(phy_fix_phy_mode_for_mac_delays);
> +
>  /**
>   * phy_interface_num_ports - Return the number of links that can be carried by
>   *			     a given MAC-PHY physical link. Returns 0 if this is
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 3c7634482356..0bc00a4cceb2 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1813,6 +1813,9 @@ static inline bool phy_is_pseudo_fixed_link(struct phy_device *phydev)
>  	return phydev->is_pseudo_fixed_link;
>  }
>  
> +phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
> +						bool mac_txid, bool mac_rxid);
> +
>  int phy_save_page(struct phy_device *phydev);
>  int phy_select_page(struct phy_device *phydev, int page);
>  int phy_restore_page(struct phy_device *phydev, int oldpage, int ret);


