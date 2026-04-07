Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AED2FEEF4E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MN6qzqxRs/zqrPwuVs2/6X79CviG+I8DWPs5lk/Ay2c=; b=MTev/D2uJruNapEFKycOrB08ta
	P9BRnHNt5WwucSUaen7l2JGbCticNR2B4MCjyln0oml3oWUXHt/PELw6qPOV7gHWugG9lvG/OOUFk
	j7q1g6dpZ7vKnm2stCQ23c2pKUnOqUsp1uB3yl6xErG09tsneznnw3LlNlAfeqLA6ySmwDU2NTXeX
	a91FX06Gio9ms7WmZRrHSD+VFswHk9L1W5+W3f6xy4jK2ioPb+B7MR6kVmq4vmJATQClz4ycZ6OxL
	XO1GJDqrCUllYBiDiHoNhq81wN+M85DI0OOvF9EuT+fgE9CnvX+diGcSLjTtKUAV1LMyZNvB6Np0u
	hR6l908g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA787-00000006Zfh-18yL;
	Tue, 07 Apr 2026 14:10:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA784-00000006ZfJ-0d7E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MN6qzqxRs/zqrPwuVs2/6X79CviG+I8DWPs5lk/Ay2c=; b=TWW+DFiilpedgYEvtVyq7aTK32
	O3BaEiUrFW1cKLzlvwnM8nb50GigIkogLZuJXkkCF0KkWw6k4YhEkMzSNRfhgRZ8AMZ8Shwam0edR
	pWSEcMgEplZ7851y63OAhIgW3Unkzw0Ou8ZIWTzXZ59MnxmqFXbMt9h+suaD1LRDNLq2/DhwZRRDR
	rWbqm+UTVyVUYtXuyK4cZmHgdSWSXe3Vu3WujAKjftI7mK2VTOHxaYr+Kp75Q9tkNYh1E/mkBi3AD
	Zze+0VwODVD2NvONOkTLv91I3qahyeX7LH9AMPR1vxf5X/ODgy06Xn65DxLY6IqJ89NqCla1w3Hme
	ERjpF/Nw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50812)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wA77h-0000000010S-2pf6;
	Tue, 07 Apr 2026 15:09:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wA77U-000000002KF-1WoV;
	Tue, 07 Apr 2026 15:09:32 +0100
Date: Tue, 7 Apr 2026 15:09:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me,
	me@ziyao.cc, siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com, wens@kernel.org,
	vladimir.oltean@nxp.com, lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com, maxime.chevallier@bootlin.com,
	chenchuangyu@xiaomi.com, yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com, chenhuacai@kernel.org,
	florian.fainelli@broadcom.com, quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v9 1/4] net: stmmac: Add DW25GMAC support in
 stmmac core driver
Message-ID: <adUQHHBD0d3p1OSI@shell.armlinux.org.uk>
References: <20260402213629.1996133-1-jitendra.vegiraju@broadcom.com>
 <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_071008_195910_4B11CADF 
X-CRM114-Status: GOOD (  20.03  )
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

Not withstanding my comment about the other Synopsys xlgmac driver that
we have in the kernel...

On Thu, Apr 02, 2026 at 02:36:26PM -0700, Jitendra Vegiraju wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> The DW25GMAC introduced a new DMA architecture called Hyper-DMA (HDMA) for
> virtualization scalability. This is realized by decoupling physical DMA
> channels(PDMA) from potentially large number of virtual DMA channels(VDMA).
> The VDMAs provide software abstraction to driver that map to PDMAs for
> frame transmission and reception.
> Since 25GMAC is a derivative of XGMAC, majority of IP is common to both.
> 
> To add support for the HDMA in 25GMAC, a new instance of dma_ops,
> dw25gmac400_dma_ops is introduced.
> To support the current needs, a simple one-to-one mapping of dw25gmac's
> logical VDMA (channel) to TC to PDMAs is used. Most of the other dma
> operation functions in existing dwxgamc2_dma.c file are reused whereever

Typo: dwxgmac2_dma.c

> applicable.
> Added setup function for DW25GMAC's stmmac_hwif_entry in stmmac core.

In a previous review, I questioned the use of DWMAC_CORE_25GMAC and
asked about its version numberspace. I believe you indicated that the
version numberspace is the same as the existing XGMAC core.

I'm going to question the value of adding DWMAC_CORE_25GMAC.

1. What is the value of splitting DWMAC_CORE_25GMAC from
   DWMAC_CORE_XGMAC given that it's in the same versioning numberspace
   as XGMAC, and most tests (via dwmac_is_xgmac()) test for XGMAC or
   25GMAC?

2. Have you reviewed all the places that explicitly test for
   DWMAC_CORE_XGMAC, looking at their "false" paths (for non-XGMAC
   cores) to determine whether they are suitable? For example:

        if (priv->plat->core_type == DWMAC_CORE_XGMAC)
                ndev->max_mtu = XGMAC_JUMBO_LEN;
        else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
                ndev->max_mtu = JUMBO_LEN;
        else
                ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);

   XGMAC can handle a max MTU of 16368, but with your code using
   DWMAC_CORE_25GMAC, we fall back to the next test, which tests the
   IP version against 0x40, and uses a max MTU of 9000. Given that
   DWMAC_CORE_4_00 is a different "version number space" this seems
   wrong.

3. Looking at the MDIO code, this looks very wrong if you're
   introducing DWMAC_CORE_25GMAC. Have you tested MDIO accesses?

   dwxgmac2_setup() is called for DWMAC_CORE_XGMAC core-type. In
   stmmac_mdio_register(), DWMAC_CORE_XGMAC uses different functions
   for MDIO bus access for C22 and C45 from other cores - it uses the
   stmmac_xgmac2_mdio_* functions.

   These use stmmac_xgmac2_c45_format() and stmmac_xgmac2_c22_format()
   to format the register values which do not depend on mii.*_mask, but
   do use mii.address and mii.data for the register offsets. Thus, is
   there any point to setting mii.addr_mask and mii.reg_mask ?

   For non-DWMAC_CORE_XGMAC cores, we fall back to the stmmac_mdio_*()
   functions, which for non-DWMAC_CORE_GMAC4 will only support Clause
   22 access, not Clause 45 - which would be very strange for a 25G
   core.

4. What about the feature printing in
   stmmac_main.c::stmmac_dma_cap_show() ?

5. What about similar tests in stmmac_est.c and stmmac_ethtool.c ?



-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

