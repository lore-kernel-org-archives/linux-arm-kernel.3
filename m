Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C8FC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 22:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y5sTKYEXLQagcrQ08sowh0qtFj8xpcMz2E6G6v/6/w=; b=rZ+T98MvKJyq3WT7CYzmc9D47z
	I9qxawMx9ACB8/6Emwxa87UD4cJmflKYM5n5mmV5BtVGSUtk0xm08TIyCKb6bKFbwrH+33WFXW1Ol
	IhA+YEwvWeH9ZO9xlPCih1YO/ojmlV2AikcmY3s4OTStIdo+imaty/mwuRZIhXFkRee0CTg8kYu9S
	qCCqOMaX32ckG5xk8O5m10MAHj2esydwiu0RXxdPAPuekM5TrUVnaKFKZBV/75jmUY01gu7790479
	vtX37LbeFyAffPoFHVqRI7AtNoDsFhYv+PjbkNWObLWC7if3hS0qELcGZbIvq4++3C8T0NboHju8T
	aUh69voQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn37C-00000001e8A-0FP8;
	Tue, 25 Feb 2025 22:09:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn35f-00000001dwO-0bh7;
	Tue, 25 Feb 2025 22:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9y5sTKYEXLQagcrQ08sowh0qtFj8xpcMz2E6G6v/6/w=; b=mYYa5x6nqhBuI09Hs4BwIXoyme
	BEl+PH9xRCyB3e6jQJu2QydrZ6WGmEeLV29u7ZUKGy9aErUM8gIQTLHJZl2JzfPCMatot48tIF9MZ
	TqGoegyZqDL6BgKJekpCqJyCq+AItqpL1WUrBYyMaXhqhA1vxJvR2bkONd5LzuML6iJj2LplatPok
	XYfWpaewm0Ovlg6pXQvkTNsjuKvSYg9VXKxfyg6hgRuiZkUDQ/PfHGuhxBkFnBeNGs313a/p7EZW2
	CyELE4ZinuHnn2toOFlBM8b7i30e2U/n6DfMvlDztb1JF4Wi4w9YKlJXqd49kkjnMjEUqGAGIiZci
	G6B68apQ==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tn35c-0008Bd-Ut; Tue, 25 Feb 2025 23:07:44 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, sebastian.reichel@collabora.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/2] phy: rockchip: usbdp: re-init the phy on orientation-change
Date: Tue, 25 Feb 2025 23:07:44 +0100
Message-ID: <10951990.zapYfy813O@diego>
In-Reply-To: <20250225184519.3586926-3-heiko@sntech.de>
References: <20250225184519.3586926-1-heiko@sntech.de>
 <20250225184519.3586926-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_140747_204502_25EFD280 
X-CRM114-Status: GOOD (  15.36  )
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

Am Dienstag, 25. Februar 2025, 19:45:19 MEZ schrieb Heiko Stuebner:
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 7b17c82ebcfc..b63259a90d85 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1277,6 +1277,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
>  				 enum typec_orientation orien)
>  {
>  	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
> +	int ret = 0;
>  
>  	mutex_lock(&udphy->mutex);
>  
> @@ -1292,6 +1293,12 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
>  	rk_udphy_set_typec_default_mapping(udphy);
>  	rk_udphy_usb_bvalid_enable(udphy, true);
>  
> +	/* re-init the phy if already on */
> +	if (udphy->status != UDPHY_MODE_NONE) {
> +		rk_udphy_disable(udphy);
> +		ret = rk_udphy_setup(udphy);
> +	}
> +

just realized that 

	if (udphy->status != UDPHY_MODE_NONE)
		ret = rk_udphy_init(udphy);

does the same, and we really don't need to disable and re-enable the
phy's clocks that are the added via rk_udphy_disable and _setup.

So will give it a day and send a v2 then.


Heiko



