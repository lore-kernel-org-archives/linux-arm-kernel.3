Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA302FB5181
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 02:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHBCikhoLTrJDVcs6gjo3OtSrv29oSWKaVPMZGe6Yhg=; b=rNiVU5StqFlVo2W883sDWCqUnI
	lU+JIseiKln0gSgvGXJyKZ2nRnum5sSebW/uZcuQVBuWh2yDo1RnIBSPi+/tEWWkA1x39gfooTp+2
	MAP7x2wtgmUBCxsMiLTePlAzMMfof+Fv71+Hw6DaOxCprLY7XBYNjy+aczM8Ab0QmXSP7ZVBNSFlW
	4uvb2tkPQO4Q9GUrmxEMSy7vkRHrUOjy2auEoRyQSvvtIRRAncV1wMjF2cRjDY8N21mjkqPTdFz/l
	xpj/i7foLGL/JmBq20/urkR8XDMSztnP5Y6QP9HAzUx2z0p8BcJ2FXSPwhDTqfsmRa7ST77ZxA+tL
	0sjXo8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vtB-00000005k2V-2fWj;
	Tue, 07 Apr 2026 02:10:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vt9-00000005k1d-0ztl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 02:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 177AC4058B;
	Tue,  7 Apr 2026 02:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFE6C4CEF7;
	Tue,  7 Apr 2026 02:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775527798;
	bh=8zm7b1Dp5ZpiFTf/LgmJSJNCehJUDDM+96sCJdAfMgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqEIbu1/BUSfAdrjcjmNOZAJzrixByXza3QuIRv7Ki8WNp20xG6Y5WIYpg3/iC1ho
	 n6oOPnLOdUQGb0gTsdxxDVKiCFGWXmuKf2djzu+uNDe6lxLStdCdcQz2hhIX8B2m5C
	 gvBM6uPvyqvl+UGZg1ZYLRSFKCPjBjjCYhBWVtyxbMj/MFIjOcE4WVYGepsnqgWKU1
	 /JPYIoNWWQLmLbjcIqDBUq59YxwXDWBqXbUGRZ7jrPC9msOBw6R4SRWaDRoC4GdN0T
	 MI7GF+IHUhOTM2noxKAU7HNEVgaRMR0OxgpQM5W6spcoVhPof03yDWIQypOlDfWxmI
	 uQqVRr9fy+tyg==
From: Jakub Kicinski <kuba@kernel.org>
To: jitendra.vegiraju@broadcom.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	richardcochran@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	rmk+kernel@armlinux.org.uk,
	rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sdf@fomichev.me,
	me@ziyao.cc,
	siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	vladimir.oltean@nxp.com,
	lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com,
	maxime.chevallier@bootlin.com,
	chenchuangyu@xiaomi.com,
	yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com,
	chenhuacai@kernel.org,
	florian.fainelli@broadcom.com,
	quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v9 1/4] net: stmmac: Add DW25GMAC support in stmmac core driver
Date: Mon,  6 Apr 2026 19:09:54 -0700
Message-ID: <20260407020954.3674529-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com>
References: <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_190959_318563_CB6C6F89 
X-CRM114-Status: GOOD (  16.72  )
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
---
Subject: net: stmmac: Add DW25GMAC support in stmmac core driver

This commit introduces support for the DW25GMAC hardware in the stmmac
core driver, which uses a new Hyper-DMA (HDMA) architecture. It adds a
new DMA ops instance mapping virtual DMA channels to physical DMA
channels and sets up the basic device configurations.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
> new file mode 100644
> index 0000000000000..82eb22bff73e0
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c

[ ... ]

> +static int rd_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel)
> +{
> +	u32 reg_val = 0;
> +
> +	reg_val |= FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
> +	reg_val |= FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
> +	reg_val |= XXVGMAC_CMD_TYPE | XXVGMAC_OB;
> +	writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
> +	return readl(ioaddr + XXVGMAC_DMA_CH_IND_DATA);
> +}

Does this readl() need to wait for the hardware to clear the XXVGMAC_OB
(Operation Busy) bit? Returning immediately might read uninitialized or
stale data if the hardware hasn't finished the fetch.

> +
> +static void wr_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel, u32 val)
> +{
> +	u32 reg_val = 0;
> +
> +	writel(val, ioaddr + XXVGMAC_DMA_CH_IND_DATA);
> +	reg_val |= FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
> +	reg_val |= FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
> +	reg_val |= XGMAC_OB;

This isn't a bug, but should this use the XXVGMAC_OB macro instead of
XGMAC_OB here for consistency?

> +	writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
> +}

Similarly, does this function need to poll for the busy bit to clear after
the writel()? If back-to-back operations occur, the next indirect write
might overwrite the control and data registers while the hardware is still
processing this request.

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index f02b434bbd505..64c38de294da2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c

[ ... ]

> -int dwxgmac2_setup(struct stmmac_priv *priv)
> +static void dwxgmac2_common_setup(struct stmmac_priv *priv, char *mac_name)
>  {

This isn't a bug, but should mac_name be declared as const char * since it
is passed string literals like "XGMAC2" and "DW25GMAC"? This avoids
discarded-qualifiers compiler warnings.

>  	struct mac_device_info *mac = priv->hw;
>  
> -	dev_info(priv->device, "\tXGMAC2\n");
> +	dev_info(priv->device, "\t%s\n", mac_name);

[ ... ]
-- 
pw-bot: cr

