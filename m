Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD84C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 23:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GMW1k5VLYs16N1n588B/jVrc8mrgwqEjDdEdvkJkZY=; b=4IHdMQRoSrI6mnuaWIYKFdqoco
	qDiSCO1iacAtJyw4JQLkNj6arq/bpqFR3jB8OQzCpo+qwFlbf1f2GO4iutiXcxgIrbpZ+obJCJGv5
	OHAK9CBIp61YHCVN+85rWkBnAgj3oaKcxU+oEbMiBP3UBhayfuR9HzpwAgEqxttTpsQAPRqWO0OvV
	kxdVxnM00FKKTjOEEIoSACGX1T+EOZVHvyWnLExdS7A3mxO3EREbzCG1KONi+HLG+VnR41qggz5m9
	+59hyrFhCgZ6+2rkupcLJsCGIusmJrOw6B7Fdp+El0nySj31PLveSPc4yZeZOCvyJrusk4AaJFWm2
	H3Bc6YwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4RJU-0000000D3mM-24jh;
	Wed, 09 Sep 2026 23:02:44 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4RJR-0000000D3lS-3mPb;
	Wed, 09 Sep 2026 23:02:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x4RJB-000000005g9-2wtQ;
	Wed, 09 Sep 2026 23:02:25 +0000
Date: Thu, 10 Sep 2026 00:02:22 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
	andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
Message-ID: <aqHlfmYa249e3HRM@makrotopia.org>
References: <20260909213250.3184238-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909213250.3184238-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_160241_939004_E518002E 
X-CRM114-Status: GOOD (  17.17  )
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

On Wed, Sep 09, 2026 at 09:32:50PM +0000, Caleb James DeLisle wrote:
> The EcoNet EN751221 multi-chip module implementation of the MT7530
> requires some additional configuration of the PHYs on startup.
> The reason for this is not known, but it is possible that it has
> to do with the fact that the EN751221 MCM implementation of the
> MT7530 runs at an abnormal PLL frequency (362.5Mhz).
> 
> Detect whether the MT7530 PHY is attached to the MDIO bus of an
> EcoNet EN751221 switch and if so, apply the necessary register
> updates.
> 
> Co-developed-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
> Signed-off-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/net/phy/mediatek/mtk-ge.c | 61 +++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
> index 73d9b72f9d9e..42b06c40d703 100644
> --- a/drivers/net/phy/mediatek/mtk-ge.c
> +++ b/drivers/net/phy/mediatek/mtk-ge.c
> [...]
>  static int mt7530_phy_config_init(struct phy_device *phydev)
>  {
> +	int ret;
> +
> +	if (mt7530_phy_is_en751221_companion(phydev)) {

Please introduce a `.match_phy_device` operation for both, actual
MT7530 and EN751221, similar eg. to `ksz8051_match_phy_device` in
micrel.c.

