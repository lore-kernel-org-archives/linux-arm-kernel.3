Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69837FF5109
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6eG3w8oiPUCd97QZfkNIfRJmJJfLCqermLxkdTt38E=; b=ym/18X6tIlwD/4iALNlaJCmZa8
	ahrZx2NgcwmAAUXP+we5fRChd8ocmAk8VqJzHngA5FujhlgpHEql+1pD2sO8h/ZY7ELUN4DFRn85L
	RMY46GBHEV9S/8y4k5MIu0kYU+Yw2/+jug/DiH01qy/AyRS4QnQogoa4jUFyDqQuUFOSjBCGCakcL
	W8PvdlJN+BcfQSJzH8T7iIXHJFZDEMgUjHH58z294rjIribrS/mAyLU1MYfKYgURzdQ4Whnku1SZO
	ZMaX5z+GWPYfQ+aI3CtPIs2AwF8Qu0UwtQPjtaKFb57EfGbLZ+dTeq6bE+MLY9ZK2yGDb9wuZhfq9
	omUJQK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8a4-00000006jPF-3QcD;
	Tue, 07 Apr 2026 15:43:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8a2-00000006jOh-0Ekh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K6eG3w8oiPUCd97QZfkNIfRJmJJfLCqermLxkdTt38E=; b=Um8vfHvOGVLnBSi1YYwENGR4vX
	XA9btB41CoP26mDXUqrtPLuhlFVMsmt228uPgpV4TCuJ4Q9lXEKBrCH1g1BirZsPmK6H4ovx1dfrU
	bliXp1c/yaX7FOvcBCsv9pi1DgKRLhYCu+qWx9mXArKxw2FBiaRX4JFBW7QO51ca+1yFZNjqUNIDc
	X0ELogoWHD2b2nUBtmTIyB4N5zHG8VlicmoObcg8z5abng0crlcXhIC8XRx4YhXlMUV4RX1HQnKVn
	oxzkDqMh7nXOSRDwL/xfbmk19ErBXMmJtRmDTIPU3nftLTBKJGERrp8cERvtF/DV+cMrGTxOcJclb
	x3uyXA8w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39138)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wA8Zd-0000000017q-03UP;
	Tue, 07 Apr 2026 16:42:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wA8ZT-000000002NZ-2JxT;
	Tue, 07 Apr 2026 16:42:31 +0100
Date: Tue, 7 Apr 2026 16:42:31 +0100
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
Message-ID: <adUl51QqkeVAd_Pa@shell.armlinux.org.uk>
References: <20260402213629.1996133-1-jitendra.vegiraju@broadcom.com>
 <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com>
 <adUQHHBD0d3p1OSI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adUQHHBD0d3p1OSI@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_084306_269660_7A8B4829 
X-CRM114-Status: GOOD (  37.48  )
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

On Tue, Apr 07, 2026 at 03:09:32PM +0100, Russell King (Oracle) wrote:
> Not withstanding my comment about the other Synopsys xlgmac driver that
> we have in the kernel...
> 
> On Thu, Apr 02, 2026 at 02:36:26PM -0700, Jitendra Vegiraju wrote:
> > From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> > 
> > The DW25GMAC introduced a new DMA architecture called Hyper-DMA (HDMA) for
> > virtualization scalability. This is realized by decoupling physical DMA
> > channels(PDMA) from potentially large number of virtual DMA channels(VDMA).
> > The VDMAs provide software abstraction to driver that map to PDMAs for
> > frame transmission and reception.
> > Since 25GMAC is a derivative of XGMAC, majority of IP is common to both.
> > 
> > To add support for the HDMA in 25GMAC, a new instance of dma_ops,
> > dw25gmac400_dma_ops is introduced.
> > To support the current needs, a simple one-to-one mapping of dw25gmac's
> > logical VDMA (channel) to TC to PDMAs is used. Most of the other dma
> > operation functions in existing dwxgamc2_dma.c file are reused whereever
> 
> Typo: dwxgmac2_dma.c
> 
> > applicable.
> > Added setup function for DW25GMAC's stmmac_hwif_entry in stmmac core.
> 
> In a previous review, I questioned the use of DWMAC_CORE_25GMAC and
> asked about its version numberspace. I believe you indicated that the
> version numberspace is the same as the existing XGMAC core.
> 
> I'm going to question the value of adding DWMAC_CORE_25GMAC.
> 
> 1. What is the value of splitting DWMAC_CORE_25GMAC from
>    DWMAC_CORE_XGMAC given that it's in the same versioning numberspace
>    as XGMAC, and most tests (via dwmac_is_xgmac()) test for XGMAC or
>    25GMAC?
> 
> 2. Have you reviewed all the places that explicitly test for
>    DWMAC_CORE_XGMAC, looking at their "false" paths (for non-XGMAC
>    cores) to determine whether they are suitable? For example:
> 
>         if (priv->plat->core_type == DWMAC_CORE_XGMAC)
>                 ndev->max_mtu = XGMAC_JUMBO_LEN;
>         else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
>                 ndev->max_mtu = JUMBO_LEN;
>         else
>                 ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);
> 
>    XGMAC can handle a max MTU of 16368, but with your code using
>    DWMAC_CORE_25GMAC, we fall back to the next test, which tests the
>    IP version against 0x40, and uses a max MTU of 9000. Given that
>    DWMAC_CORE_4_00 is a different "version number space" this seems
>    wrong.

This is actually wrong - for DWMAC_CORE_25GMAC with a synopsys_id
less than 0x40, this will fall back to SKB_MAX_HEAD(NET_SKB_PAD +
NET_IP_ALIGN) which is as good as "pluck a number out of the air
and watch the driver fall over if you increase the MTU to maximum".
max_mtu ends up being dependent on the system page size, not on any
hardware limitation, which is garbage.

> 3. Looking at the MDIO code, this looks very wrong if you're
>    introducing DWMAC_CORE_25GMAC. Have you tested MDIO accesses?
> 
>    dwxgmac2_setup() is called for DWMAC_CORE_XGMAC core-type. In
>    stmmac_mdio_register(), DWMAC_CORE_XGMAC uses different functions
>    for MDIO bus access for C22 and C45 from other cores - it uses the
>    stmmac_xgmac2_mdio_* functions.
> 
>    These use stmmac_xgmac2_c45_format() and stmmac_xgmac2_c22_format()
>    to format the register values which do not depend on mii.*_mask, but
>    do use mii.address and mii.data for the register offsets. Thus, is
>    there any point to setting mii.addr_mask and mii.reg_mask ?
> 
>    For non-DWMAC_CORE_XGMAC cores, we fall back to the stmmac_mdio_*()
>    functions, which for non-DWMAC_CORE_GMAC4 will only support Clause
>    22 access, not Clause 45 - which would be very strange for a 25G
>    core.
> 
> 4. What about the feature printing in
>    stmmac_main.c::stmmac_dma_cap_show() ?
> 
> 5. What about similar tests in stmmac_est.c and stmmac_ethtool.c ?

Another issue that needs to be looked into is all the tests that
check priv->synopsys_id without checking the core_type. I'm already
concerned that many of these are wrong.

I have some patches now that rename synopsys_id to snpsver (it's really
the Synopsys IP version field which is BCD of the major version and
first digit of the minor version, not some random ID that identifies
the core.)

From what I've ascertained so far:

    GMAC100 cores do not have a readable snpsver number, thus this
    will be zero.

    GMAC cores generally have a snpsver number less than 0x40.

    GMAC4 cores may have a version number that overlaps GMAC cores
    (see first entry for DWMAC_CORE_GMAC4).

    XGMAC and XLGMAC cores each have an entirely separate IP version
    number space from GMAC and GMAC4, which are distinguished by their
    respective userver.

For example:

        /* Only DWMAC core version 5.20 onwards supports HW descriptor prefetch.
         */
        if (priv->snpsver < DWMAC_CORE_5_20)
                priv->plat->dma_cfg->dche = false;

This will match your 25GMAC cores and the XGMAC cores because they have
a Synopsys IP version number less than 0x52. What saves us there is
that dche is only read by dwmac4_dma_init(), used by dwmac4_dma_ops and
dwmac410_dma_ops. These are all used by hwif entries that require
priv->plat->core_type to be DWMAC_CORE_GMAC4. Thus, I'm changing this
one to:

        /* Only DWMAC4 core version 5.20 onwards support HW descriptor prefetch.
         */
        if (priv->plat->core_type != DWMAC_CORE_GMAC4 ||
            priv->snpsver < DWMAC_CORE_5_20)
                priv->plat->dma_cfg->dche = false;

although I'm wondering if that should really be == && to avoid writing
to it for non-GMAC4 cores (it really doesn't matter.)

Then there this:

                case HWTSTAMP_FILTER_PTP_V2_EVENT:
                        /* PTP v2/802.AS1 any layer, any kind of event packet */
                        config->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
                        ptp_v2 = PTP_TCR_TSVER2ENA;
                        snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
                        if (priv->snpsver < DWMAC_CORE_4_10)
                                ts_event_en = PTP_TCR_TSEVNTENA;

Is PTP_TCR_TSEVNTENA needed for this PTP filter type for XGMAC and
25GMAC cores - because they'll get it because they have snpsver
smaller than 0x41.

Similar here:

        if (priv->plat->rx_coe) {
                priv->hw->rx_csum = priv->plat->rx_coe;
                dev_info(priv->device, "RX Checksum Offload Engine supported\n")+;
                if (priv->snpsver < DWMAC_CORE_4_00)
                        dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csu+m);
        }

In stmmac_ethtool.c, stmmac_mac_debug() won't be called for XGMAC or
25GMAC cores, because:

                if (priv->snpsver >= DWMAC_CORE_3_50)
                        stmmac_mac_debug(priv, priv->ioaddr,
                                        (void *)&priv->xstats,
                                        rx_queues_count, tx_queues_count);

snpsver (synopsys_id) will be smaller than 0x35. Is this correct?

The good news is that stmmac_mdio.c at gates all its checks on the
Synopsys IP version against the core type.

I'll post my RFC patches tidying up some of the version mess in the
next day or so.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

