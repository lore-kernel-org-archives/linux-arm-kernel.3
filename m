Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59137FB5173
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 02:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUgnd2KjiHWGVeOjjlcPI2eVkKZ0hfPwCNodGGDv/1c=; b=VwWjAZgJiZM+ejS1GSKwUJ2UmW
	Pc5b8VvhaBiryA9cw+Zsn/bIuQaq7Fp83tZnWJWDTO9hBq4L34IA9H9CvZQIAOJ7hLI3PGJXze1Ho
	NrUrmWjIrtbT+Tu0eiZCZa1IUpVsBWMw0jMUHtVUmkpEVgCldGc5cwHP5Lv1Ve4MWBApNNo0GvJ4z
	pnqt2CBJX80P12LgI8IWaxZ4VQLA2iE6cD9duoVbXPR7A44YQtWdeOhPRLfH6GrfD54qoTN1d99bc
	8wxMLCFF1aSpDyMxRIMxGDjtg3a46p9NpK4Ohp+44Kw6Eb9NW5NvWy17ysAdvQ1yqwjaVg2p4+4mx
	Uuob5AMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vtD-00000005k3W-3zjk;
	Tue, 07 Apr 2026 02:10:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vtB-00000005k2Y-41bH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 02:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 886C94033D;
	Tue,  7 Apr 2026 02:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965B2C2BC9E;
	Tue,  7 Apr 2026 02:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775527801;
	bh=l09qNxpZb2Z1OjdsheCfqqB6WqqZEIYEjhtnuPN66eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K/XT+t2dUq4UZUpycoC/TjCJryznGtdzS7KsFBX/zOgT6p/Dyu+gZjCGebF8q1Fsu
	 tRc3uUvMRPSl8hAEGe+1yUuM2rM4yAPo1wvlPy6dRkrt7xS5EAVniNWzawuJT5q57v
	 j2ElEqf7orzMg09jO30j1Bh10HhlVMiHh/oQcS1V/zAw59MJ2LDfLXsJ5wNK2bc88T
	 O6e8KRDP2qyeDnLJW0qagfnBY7YC/XJHzWTKYNUp947c+jndZsiz6lax+fu8i0dZwg
	 nfE9ST9hBXBB1/oEuTje5L2oNyFWaw96a5IRopzwr6d3RMT6tulObgZ5Bne0+G7g0z
	 hYJkTyeJLAh9g==
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
Subject: Re: [PATCH net-next v9 2/4] net: stmmac: Integrate dw25gmac into hwif handling
Date: Mon,  6 Apr 2026 19:09:58 -0700
Message-ID: <20260407020958.3674568-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402213629.1996133-3-jitendra.vegiraju@broadcom.com>
References: <20260402213629.1996133-3-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_191002_047973_7C4C6154 
X-CRM114-Status: GOOD (  15.28  )
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
net: stmmac: Integrate dw25gmac into hwif handling

Integrate dw25gmac support into stmmac hardware interface handling.
Added a new entry to the stmmac_hw table in hwif.c.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 511b0fd5e8343..a69f558c0db06 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -287,6 +287,26 @@ static const struct stmmac_hwif_entry {
>  		.mmc = &dwxgmac_mmc_ops,
>  		.est = &dwmac510_est_ops,
>  		.setup = dwxlgmac2_setup,
> +	}, {
> +		.core_type = DWMAC_CORE_25GMAC,
> +		.min_id = DW25GMAC_CORE_3_20,

Are there other areas where the core capabilities will be misidentified?

Throughout stmmac_main.c and stmmac_ethtool.c, hardware features branch
explicitly on core_type == DWMAC_CORE_XGMAC instead of including
DWMAC_CORE_25GMAC.

This seems to cause a few side effects:
- stmmac_ethtool_get_drvinfo() misreports the driver as MAC100_ETHTOOL_NAME
  (st_mac100).
- stmmac_main.c enforces legacy MTU limits rather than XGMAC_JUMBO_LEN.
- stmmac_dma_cap_show() debugfs output treats the 25GMAC count of multiple
  MAC address registers as a simple boolean and omits Timestamp System Time
  Source details.

Does this also break MDIO communication for the PHY?

In stmmac_mdio_register(), XGMAC MDIO accessors are assigned strictly if
priv->plat->core_type == DWMAC_CORE_XGMAC. Because 25GMAC is omitted, it
falls into the else block and assigns legacy GMAC callbacks like
stmmac_mdio_read_c22().

The GMAC accessors format the control word using GMAC bitfields (checking
MII_ADDR_GBUSY at bit 0), while the XGMAC register layout expects
MII_XGMAC_BUSY at bit 22.

Could this misconfiguration write invalid bit patterns to the register and
wait on the wrong bit?

> +		.regs = {
> +			.ptp_off = PTP_XGMAC_OFFSET,
> +			.mmc_off = MMC_XGMAC_OFFSET,
> +			.est_off = EST_XGMAC_OFFSET,

Will this misconfigure the Time-to-Output Value for EST (802.3 Qbv)?

In stmmac_est.c, est_configure() and est_irq_status() use
if (priv->plat->core_type == DWMAC_CORE_XGMAC) to differentiate XGMAC from
GMAC5.

Without 25GMAC in that check, it falls through to the GMAC5 logic, applying
the EST_GMAC5_PTOV mask (bits 31:24) instead of the EST_XGMAC_PTOV mask
(bits 31:23) to the EST control register at EST_XGMAC_OFFSET.

> +		},
> +		.desc = &dwxgmac210_desc_ops,
> +		.dma = &dw25gmac400_dma_ops,
> +		.mac = &dwxgmac210_ops,

Does adding these ops introduce a buffer overflow during ethtool register
dumps?

Since stmmac_ethtool_get_regs_len() does not match DWMAC_CORE_25GMAC, it
falls back to returning REG_SPACE_SIZE (4192 bytes, or 1048 u32 elements).

However, these ops use the dwxgmac2_dump_regs() and dwxgmac2_dma_dump_regs()
callbacks, which write far beyond the 1048-element buffer:

- dwxgmac2_dump_regs() writes up to index XGMAC_MAC_REGSIZE (1309 elements).
- dwxgmac2_dma_dump_regs() writes from XGMAC_DMA_MODE / 4 (3072) to
  XGMAC_REGSIZE (3647 elements).

Will this corrupt kernel memory when a privileged user runs ethtool -d?

> +		.vlan = &dwxgmac210_vlan_ops,
> +		.hwtimestamp = &stmmac_ptp,
> +		.ptp = &stmmac_ptp_clock_ops,
> +		.mode = NULL,
> +		.tc = &dwmac510_tc_ops,
> +		.mmc = &dwxgmac_mmc_ops,
> +		.est = &dwmac510_est_ops,
> +		.setup = dw25gmac_setup,
> +		.quirks = NULL,
>  	},
>  };

