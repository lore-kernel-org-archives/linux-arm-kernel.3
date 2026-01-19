Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653CACCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOsjEhreO0APPeruvSXc7Jn/YuDsCPYoUcURxTGok2g=; b=3KtHHvDDfvf0XZfde0nV8NPhnJ
	s+OfD3kdI1DpzqHp50s9Kv1WJ9pxHtCXJLY9rOArWmNMdnk7qrsq+AzB4d8LJbN8NIFPNP2lkSbPY
	CfcYfxUBBuuRGIgBQm9Rp9tjMF37JapvSlBgVtovypVOmepWDKGYPtoeJDetzhnJ+fpJ5YrHi8ft/
	7IqYEUXRnE2vn0A5yrNdMvXcLKdbNoITFPELct7AzoLXFXFMynjuFsigxEPdIrSnS/vujFPtqaNly
	0ITsYLkyqlKUsjKOkzFrj8JOZV875HBttrKlinY1c3D+rSLc+7Z8t5GSvBOITngVcndpInripE/Pq
	2MnOhUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuq1-00000002lnj-0uK3;
	Mon, 19 Jan 2026 19:22:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhupy-00000002lnV-3N1X;
	Mon, 19 Jan 2026 19:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3B856014A;
	Mon, 19 Jan 2026 19:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5C3C116C6;
	Mon, 19 Jan 2026 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768850573;
	bh=2LdEtzd4yY/cOLWnRNwnA2H0y8xNK5Tws6k5kwhhDHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I7N09X08cA5BT8y2j+GVNAp0K6LCAHFqyyYBiJdDWO/rzKGZlm1JfL6QYjE+TK9m0
	 y60IDssQIheI3yyf+58W8t8wtwGr8N1xJmWq9HjoijJpJmm6uk2Fo+nAjYfgsJTeyI
	 G1C7UTub7M3prpafX8BysuxFLyfE4tOpWGbyQiWRP47OWEsBKmnFCPPfIYPRmcuOUK
	 XcL5zXHSAPMCVdW+WSmTP1kQAzCe1dyjqJlnp+Z0EH1bOxmCRj+H4nJn6Pk9MK4DPS
	 S7ZaOxegEty1GYlo6RSKlcrJtOaOdMxE9u6tBPDI55j8JkUuldjCyaMmbSK6K/RqEq
	 NEJb1Ik5WTe5Q==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-phy@lists.infradead.org,
	davem@davemloft.net,
	maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com,
	mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	edumazet@google.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vkoul@kernel.org,
	andrew@lunn.ch,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,12/14] net: stmmac: add support for reading inband SGMII status
Date: Mon, 19 Jan 2026 11:21:35 -0800
Message-ID: <20260119192135.1245138-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vhoSr-00000005H2N-2H2L@rmk-PC.armlinux.org.uk>
References: <E1vhoSr-00000005H2N-2H2L@rmk-PC.armlinux.org.uk>
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
net: stmmac: add support for reading inband SGMII status

This patch adds support for reading link status, speed, and duplex for
SGMII links from the RGSMII status register. New fields are added to
stmmac_pcs_info and stmmac_pcs structures for the register offset and mask.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 73fc56ce5e55..9dd7e78cfbc4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

[ ... ]

> @@ -111,7 +121,37 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>
>  		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
>  	} else {
> -		state->link = false;
> +		rgsmii = field_get(spcs->rgsmii_status_mask,
> +				   readl(spcs->rgsmii));
                                   ^^^^

When dwmac1000_pcs_init() or dwmac4_pcs_init() is used, the pcs_info
structures do not initialize the new rgsmii_offset and rgsmii_status_mask
fields. For example, dwmac4_pcs_info in dwmac4_core.c only sets:

    static const struct stmmac_pcs_info dwmac4_pcs_info = {
        .pcs_offset = GMAC_PCS_BASE,
        .int_mask = GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
    };

This leaves rgsmii_status_mask implicitly zero. Calling field_get() with a
mask of zero violates its API contract (mask must be non-zero) and results
in undefined behavior from __ffs(0).

Should the existing dwmac1000_pcs_info and dwmac4_pcs_info structures be
updated to provide proper values for the new fields? Or should there be a
guard check before calling field_get() when rgsmii_status_mask is zero?

> +
> +		state->link = status & BMSR_LSTATUS &&
> +			      rgsmii & GMAC_RGSMIII_LNKSTS;

[ ... ]

> @@ -205,6 +245,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
>
>  	spcs->priv = priv;
>  	spcs->base = priv->ioaddr + pcs_info->pcs_offset;
> +	spcs->rgsmii = priv->ioaddr + pcs_info->rgsmii_offset;
> +	spcs->rgsmii_status_mask = pcs_info->rgsmii_status_mask;

The values are copied from pcs_info here, but dwmac1000_pcs_info and
dwmac4_pcs_info do not initialize these fields.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index a7c71f40f952..f9e7a7ed840b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -29,12 +29,16 @@ struct stmmac_priv;
>
>  struct stmmac_pcs_info {
>  	unsigned int pcs_offset;
> +	unsigned int rgsmii_offset;
> +	u32 rgsmii_status_mask;
>  	u32 int_mask;
>  };

These new fields need to be initialized by all users of stmmac_pcs_info.

