Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FABBD19511
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 00:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtR9vPBxHLk2PRkyJslcvRBqcIUO3hsbi9soHMhmYO8=; b=FGD99mW+x3xCLXAO97FvJZZvow
	dyrd+4xHBUYPuOFUH39eKMu7Vu1bVAdhAcqrXjQ9mjpCluvF0B66kv7k5HOFURofwWteFr5FgkbRH
	MCDVJfZGWhOxZdl+L2npoz+qeQawXYmrz+ztfuAVrPtGmHgfOUGMp9k2y3eqz1uiP9JOH5hop1+lp
	vfEcF3jFPA+270tsU0Dx/ayGnHViU3z8xvcAcHwLN/EvaSLk9z2nZtjNQ3rCKaXjsAzu6BL6xuiWF
	gp1EAgZfYih2WBputHBtRi/fcx00BUEgol7uEOtGC2DPwSEU3m+ZQfiDkKtqN9E+JfP67z2VKbE97
	UGGeVWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkX8d-0000000DO6W-2tDl;
	Tue, 27 Jan 2026 00:40:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkX8c-0000000DO6L-2i4J;
	Tue, 27 Jan 2026 00:40:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96DB660051;
	Tue, 27 Jan 2026 00:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DAAC116C6;
	Tue, 27 Jan 2026 00:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769474457;
	bh=FDSZmApZTKLD7bqxE5fcK4gRn51ugRSvMR/vvQBFnWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0wLd03Mgtol6WxGBhARowmEdA89LnFc0PHMRjf8qlNgKYXb3eMpsPBlZ6e8XwYFO
	 IvqM5UDxe219kUeXSOmepN2HI5MdrL8eCwcI39U5MVHLAkzG/i7anAzgFwa1B700vL
	 3/6zDrsLrTcefDf+bVuFrLUMHiZDSmeJD7f8a7hPMiMiTsPoUqHJ+ObOAFYCJr3pB9
	 vEwEG5akak2+X/ZL91NSPlvDlJ0vWLfNu3EEGO60iu0ML26kuBTQGADJzuanY7iMLK
	 ULRUV/f1CU8SwwzhAI0a24zyuKKJvlFxjx9nFVHQ7HwDvC/ycIyfTqfhvBXgjnz8xT
	 YMfhBE8PvdVHg==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	linux-rockchip@lists.infradead.org,
	heiko@sntech.de,
	alexandre.torgue@foss.st.com,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com
Subject: Re: [net-next,v2,06/22] net: stmmac: rk: add SoC specific ->init() method
Date: Mon, 26 Jan 2026 16:40:20 -0800
Message-ID: <20260127004020.3785641-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
References: <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: add SoC specific ->init() method

This commit adds infrastructure for SoC-specific initialization by adding
an init callback to rk_gmac_ops and calling it from rk_gmac_setup().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 7f8ffd1549bc..4117f6863ff0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1618,6 +1619,14 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
>
>  	bsp_priv->dev = dev;
>
> +	if (ops->init) {
> +		ret = ops->init(bsp_priv);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "failed to init BSP\n");
> +			return ERR_PTR(ret);
                        ^^^^^^^^^^^^^^^

If ops->init() fails here, does bsp_priv->phy_reset need to be released?

Earlier in rk_gmac_setup(), at line 1610, the code calls:

    bsp_priv->phy_reset = of_reset_control_get(plat->phy_node, NULL);

of_reset_control_get() is not a devm-managed function, so the reset control
would need to be explicitly released with reset_control_put() on error paths.

This new error return happens after phy_reset could have been acquired (when
the device has an integrated PHY), but before the function successfully
returns. If this path is taken, it appears the reset control would be leaked.

Currently no SoC sets ops->init so this path cannot trigger, but when a
future SoC implements this callback, the leak would occur on init failure
for devices with integrated PHYs.

> +		}
> +	}
> +
>  	return bsp_priv;
>  }

