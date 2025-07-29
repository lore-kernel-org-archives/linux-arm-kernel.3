Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A7FC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 04:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnwACJJOau8zEGOwnOjbwJEg1c7xl7eU8ZYtstWld9w=; b=EgiFDy4RDpNpz9PNBUl+ybt27S
	jU5S9fwq1G2z9CMAz3gmqrdeJeNot/6p+YS80h5+FdnRUlueNMsthZdxuMavvZz8r1zynCcwudiqX
	JRczmqSaZoUD2KRy2V7a32humTsrKt7OoaU6wo+F4GydqViupYE3kYjlH9HynBz3AZZEfJw5GBlFk
	MdcHgVrPtdd31G2ThgxDp3nSH6wwMtAMbvOpVzfnLZGbnZilojraxG9lKArEk3dY8lMCcPyTeWSS+
	gmmetcVZlD3epO6Ea7GbcSfAhCceYzER7eb2U6eW4gt9HD2L5DD1FwuC9I6Wjp/ys0h+qCz4OgaSS
	35tVljnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugbzr-0000000Fu6Z-2P5K;
	Tue, 29 Jul 2025 04:31:27 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugbxM-0000000Ftto-3cqr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 04:28:54 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFhCWZ030143;
	Mon, 28 Jul 2025 21:28:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=BnwACJJOau8zEGOwnOjbwJEg1
	c7xl7eU8ZYtstWld9w=; b=XtvsoC2ePFX+VsJkYyp347dAhcuvsczcvqsrg2EHi
	BH7DtcMJIIsYu0BoSuobJcJJ4LvBFVQwPrfjkA6bT9Iglv0/UYhPi8sKRBvmOxWX
	iQa8qST2Zb0HY4BNc9xxa97MnWJP0dhPEajAWUXcRJb3lsLkMfqVnXXwvye/vr5U
	ADucap42I0Jy2Jhc5O8m7OGXTn0jMrduQZ09Lny35/M0f9AHKaHy5JAZF9kXhOty
	KwUBgSxwKyCpyXTUrxBXWSUzokyRH1Uf/l/kuq/ZssfXFIdwnk6POlE+ARjrabWu
	7wFdhMjSM+RbFN3TkORWc0mAus7NKo6VnqZyrh5lttzHg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 486c3ghc64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 21:28:42 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 28 Jul 2025 21:28:43 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 28 Jul 2025 21:28:43 -0700
Received: from opensource (unknown [10.29.20.14])
	by maili.marvell.com (Postfix) with SMTP id 2E1E73F7059;
	Mon, 28 Jul 2025 21:28:36 -0700 (PDT)
Date: Tue, 29 Jul 2025 04:28:35 +0000
From: Subbaraya Sundeep <sbhatta@marvell.com>
To: Sean Anderson <sean.anderson@linux.dev>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH net-next v3 2/7] net: axienet: Use ioread32/iowrite32
 directly
Message-ID: <aIhN85EwjsUaSHXk@opensource>
References: <20250728221823.11968-1-sean.anderson@linux.dev>
 <20250728221823.11968-3-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250728221823.11968-3-sean.anderson@linux.dev>
X-Authority-Analysis: v=2.4 cv=LeQ86ifi c=1 sm=1 tr=0 ts=68884dfa cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=6D5sPuq1OPGPnUfxrF0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: _lq8buJsV1pfHjq5xISGmqTlGS0i4lCC
X-Proofpoint-GUID: _lq8buJsV1pfHjq5xISGmqTlGS0i4lCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAzMCBTYWx0ZWRfX0D4CaGosaavh uPvtTn7jgKdVxdX1pfmmyiq2ZNzexlI2Fq/8Smb+nUpgIvErqPt8ETLg+4go41cKlovDt2q5PHC D70Ou6Wopbf8lPwXaGc7e+oDAUX5SCaWL9QDvo5mvXKHOIXxRUtc2eIldamW8IYPLNiSpUssikJ
 Q/0juF8rVuY5/kLstK5NryUbaXV1s0YCQ9Pd75VeIgNpNyYWz8k7MpU4FQffUW6a6KBbwI3oMC8 bpfJEQaZFVnW2qw2DQseizaUzcQv+1n14Wj8f12AKYmgqE2pyCfrR70C5UyWJKT/+mvBif1BqtD lblcMkZ7DirTDg7tPSHi5f44ktG5Mv0Ymn78NwCid6x/j9eEVaDTajLUjJxeDIsyf6LoU+qFJsW
 qbLUuX7syEbGUmj+gLHGe5RVAwS8lOv+sNdgnAg5laL+0MCoqncDobihOkqBjBAttc799wjp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_212853_021661_0177A0C3 
X-CRM114-Status: GOOD (  20.21  )
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

On 2025-07-28 at 22:18:18, Sean Anderson (sean.anderson@linux.dev) wrote:
> In preparation for splitting the MDIO bus into a separate driver,
> convert all register reads/writes to use ioread32/iowrite32 directly
> instead of using the axienet_ior/iow helpers. While we're at it, clean
> up the register calculations a bit.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v3:
> - New
> 
>  .../net/ethernet/xilinx/xilinx_axienet_mdio.c | 43 +++++++++----------
>  1 file changed, 20 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
> index 9ca2643c921e..16f3581390dd 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
> @@ -32,7 +32,7 @@ static int axienet_mdio_wait_until_ready(struct axienet_local *lp)
>  {
>  	u32 val;
>  
> -	return readx_poll_timeout(axinet_ior_read_mcr, lp,
> +	return readx_poll_timeout(ioread32, lp->regs + XAE_MDIO_MCR_OFFSET,
>  				  val, val & XAE_MDIO_MCR_READY_MASK,
>  				  1, 20000);
>  }
> @@ -45,8 +45,8 @@ static int axienet_mdio_wait_until_ready(struct axienet_local *lp)
>   */
>  static void axienet_mdio_mdc_enable(struct axienet_local *lp)
>  {
> -	axienet_iow(lp, XAE_MDIO_MC_OFFSET,
> -		    ((u32)lp->mii_clk_div | XAE_MDIO_MC_MDIOEN_MASK));
> +	iowrite32((u32)lp->mii_clk_div | XAE_MDIO_MC_MDIOEN_MASK,
> +		  lp->regs + XAE_MDIO_MC_OFFSET);
>  }
>  
>  /**
> @@ -59,9 +59,9 @@ static void axienet_mdio_mdc_disable(struct axienet_local *lp)
>  {
>  	u32 mc_reg;
>  
> -	mc_reg = axienet_ior(lp, XAE_MDIO_MC_OFFSET);
> -	axienet_iow(lp, XAE_MDIO_MC_OFFSET,
> -		    (mc_reg & ~XAE_MDIO_MC_MDIOEN_MASK));
> +	mc_reg = ioread32(lp->regs + XAE_MDIO_MC_OFFSET);
> +	iowrite32(mc_reg & ~XAE_MDIO_MC_MDIOEN_MASK,
> +		  lp->regs + XAE_MDIO_MC_OFFSET);
>  }
>  
>  /**
> @@ -90,13 +90,11 @@ static int axienet_mdio_read(struct mii_bus *bus, int phy_id, int reg)
>  		return ret;
>  	}
>  
> -	axienet_iow(lp, XAE_MDIO_MCR_OFFSET,
> -		    (((phy_id << XAE_MDIO_MCR_PHYAD_SHIFT) &
> -		      XAE_MDIO_MCR_PHYAD_MASK) |
> -		     ((reg << XAE_MDIO_MCR_REGAD_SHIFT) &
> -		      XAE_MDIO_MCR_REGAD_MASK) |
> -		     XAE_MDIO_MCR_INITIATE_MASK |
> -		     XAE_MDIO_MCR_OP_READ_MASK));
> +	rc = FIELD_PREP(XAE_MDIO_MCR_PHYAD_MASK, phy_id) |
> +	     FIELD_PREP(XAE_MDIO_MCR_REGAD_MASK, reg) |
> +	     XAE_MDIO_MCR_INITIATE_MASK |
> +	     XAE_MDIO_MCR_OP_READ_MASK;
> +	iowrite32(rc, lp->regs + XAE_MDIO_MCR_OFFSET);
nit: remove XAE_MDIO_MCR_REGAD_SHIFT macros in header file too in this patch.

Thanks,
Sundeep
>  
>  	ret = axienet_mdio_wait_until_ready(lp);
>  	if (ret < 0) {
> @@ -104,7 +102,7 @@ static int axienet_mdio_read(struct mii_bus *bus, int phy_id, int reg)
>  		return ret;
>  	}
>  
> -	rc = axienet_ior(lp, XAE_MDIO_MRD_OFFSET) & 0x0000FFFF;
> +	rc = ioread32(lp->regs + XAE_MDIO_MRD_OFFSET) & 0x0000FFFF;
>  
>  	dev_dbg(lp->dev, "axienet_mdio_read(phy_id=%i, reg=%x) == %x\n",
>  		phy_id, reg, rc);
> @@ -129,8 +127,9 @@ static int axienet_mdio_read(struct mii_bus *bus, int phy_id, int reg)
>  static int axienet_mdio_write(struct mii_bus *bus, int phy_id, int reg,
>  			      u16 val)
>  {
> -	int ret;
>  	struct axienet_local *lp = bus->priv;
> +	int ret;
> +	u32 mcr;
>  
>  	dev_dbg(lp->dev, "axienet_mdio_write(phy_id=%i, reg=%x, val=%x)\n",
>  		phy_id, reg, val);
> @@ -143,14 +142,12 @@ static int axienet_mdio_write(struct mii_bus *bus, int phy_id, int reg,
>  		return ret;
>  	}
>  
> -	axienet_iow(lp, XAE_MDIO_MWD_OFFSET, (u32)val);
> -	axienet_iow(lp, XAE_MDIO_MCR_OFFSET,
> -		    (((phy_id << XAE_MDIO_MCR_PHYAD_SHIFT) &
> -		      XAE_MDIO_MCR_PHYAD_MASK) |
> -		     ((reg << XAE_MDIO_MCR_REGAD_SHIFT) &
> -		      XAE_MDIO_MCR_REGAD_MASK) |
> -		     XAE_MDIO_MCR_INITIATE_MASK |
> -		     XAE_MDIO_MCR_OP_WRITE_MASK));
> +	iowrite32(val, lp->regs + XAE_MDIO_MWD_OFFSET);
> +	mcr = FIELD_PREP(XAE_MDIO_MCR_PHYAD_MASK, phy_id) |
> +	      FIELD_PREP(XAE_MDIO_MCR_REGAD_MASK, reg) |
> +	      XAE_MDIO_MCR_INITIATE_MASK |
> +	      XAE_MDIO_MCR_OP_WRITE_MASK;
> +	iowrite32(mcr, lp->regs + XAE_MDIO_MCR_OFFSET);
>  
>  	ret = axienet_mdio_wait_until_ready(lp);
>  	if (ret < 0) {
> -- 
> 2.35.1.1320.gc452695387.dirty
> 

