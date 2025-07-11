Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7800BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MCZrcij4xagay+EUDhjWN8tHzuSkFv0VFCtASHolgs=; b=U5TrI1cO6rvdyCvfbeH3ERlO70
	PtpWl3mZLS2VGe059fTCis8K3pw9eOxiRl2NeSyYWi833mhxrICdaRPGi2qZHTcjfmuV1Xcsxw5la
	GW+2/YAFYeb3dOWdP6PWqipMK3pGd5AnMZEOEnerdU7rKesh9IRblat3hp348byDqLZR5I0RoK4QI
	L7MhVEVNGRTGwAoyM2eFt3pY+xDpNM6M9VQGLESSvEQMFSDxGZQnVy6yKRHnQGZJSW3j7LACJVa8i
	peHfw7hv27AY7ukVR+nAYFwPXlKZj+gD2J5Bj75jtO4H8tNuKnbWJLnv0a+8PKPK0Uvv/UxeQx+nB
	DOQw9zXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEQP-0000000EzgA-1YYs;
	Fri, 11 Jul 2025 14:08:29 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEJu-0000000Eyft-19Yk;
	Fri, 11 Jul 2025 14:01:48 +0000
X-CSE-ConnectionGUID: u+J0B6+/T5uGFOGm+7BUCQ==
X-CSE-MsgGUID: fr8Dn2H2TS+aGBD12MXJ3g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jul 2025 23:01:40 +0900
Received: from DESKTOP-I3G733R.localdomain (unknown [10.14.100.10])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A31B7424DFE3;
	Fri, 11 Jul 2025 23:01:32 +0900 (JST)
From: Alexander Savchenko <oleksandr.savchenko.dn@bp.renesas.com>
To: rosenp@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	johannes@sipsolutions.net,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	stf_xl@wp.pl,
	tsbogend@alpha.franken.de
Subject: Re: [PATCHv3 wireless-next 5/7] wifi: rt2x00: soc: modernize probe
Date: Fri, 11 Jul 2025 17:01:30 +0300
Message-Id: <20250711140130.378067-1-oleksandr.savchenko.dn@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710200820.262295-6-rosenp@gmail.com>
References: <20250710200820.262295-6-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_070146_420075_0D41D51F 
X-CRM114-Status: UNSURE (   8.05  )
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

Hi Rosen,

looks like here are memory leaks in the patch, PSB.

> +	eeprom = devm_kzalloc(&pdev->dev, ops->eeprom_size, GFP_KERNEL);
> +	if (!eeprom)
> +		return -ENOMEM;
> +
> +	rf = devm_kzalloc(&pdev->dev, ops->rf_size, GFP_KERNEL);
> +	if (!rf)
Here driver must freed eeprom memory resource.
> +		return -ENOMEM;
> +
> +	hw = ieee80211_alloc_hw(sizeof(struct rt2x00_dev), ops->hw);
> +	if (!hw)
Here driver must freed rf and eeprom resources.
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate hardware");
> +
> +	platform_set_drvdata(pdev, hw);
> +
> +	rt2x00dev = hw->priv;
> +	rt2x00dev->dev = &pdev->dev;
> +	rt2x00dev->ops = ops;
> +	rt2x00dev->hw = hw;
> +	rt2x00dev->irq = irq;
> +	rt2x00dev->clk = clk;
> +	rt2x00dev->eeprom = eeprom;
> +	rt2x00dev->rf = rf;
> +	rt2x00dev->name = pdev->dev.driver->name;
> +	rt2x00dev->csr.base = mem;
> +
> +	rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
> +
> +	retval = rt2x00lib_probe_dev(rt2x00dev);
> +	if (retval)
> +		goto exit_free_device;
> +
> +	return 0;
> +
> +exit_free_device:
> +	ieee80211_free_hw(hw);
> +
Here driver must freed rf and eeprom resources.
> +	return retval;
> +}

Also need to check the rest of allocated resources: mem, irq, clk.

BR,
Alexander

