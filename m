Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ABAE8B397
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 04:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rs6BBarzwmD2Zm1TSaGTp7E5XeDaUo3g+3j+s/whg7M=; b=iu6VIngJHSNFUi3uBXRZglDf4A
	HcM2FU/JeA1JIgv0bexBS+JOM95WZI9bJk2rp+t3w+wTemyV0kKKuKjWduHFkyVRLdQOXBIlTZwI/
	EynQbd5XDEDLvXoSyJ/HuthkpcqdO9HhjAx4LeRr6L1A6TopDw6AHO6AlQdnoQTPtHsOueFtsqOlO
	5VxQElrWiCMNDVDxOhlEfdSjx5APCuPvftX4wXOImfpB7S26SsrzF6G7O+pR2nGxywYuTokMTdcQP
	r1lMe0YLMrxFtM3Gts23c76eRdwHQZVemjBBnjp0QldEq6z2H+/5e7qOK2CiQxXghzREse9jKw545
	PrE0WPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnUDK-00000007sxr-2E84;
	Wed, 04 Feb 2026 04:10:02 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnUDH-00000007sxA-3cXi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 04:10:01 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-89473dca8aaso74131056d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 20:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770178198; x=1770782998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs6BBarzwmD2Zm1TSaGTp7E5XeDaUo3g+3j+s/whg7M=;
        b=On433+PD83VMm2y/AJzgHjk6EyRoPy1F6ii8a7cFEp7qkNUks8gnqRyuKl+Omdq2fl
         L5iS39YMm8BYOaH3BvbOI6Liew7F3WcPjg5MTH5O/Hnc0SxKofNncydBLQ1nfRD+qcCi
         z/keaom2InP2rPkrKtUCfnYGH2SHLbCQPhBOgxwZV4qSvxNZq2tk79dcvy6OPoEWfBV2
         zF0f+DIpEUzsdL+O/m2p/nDEbvthzBgQVAcMWBPB8aGowZRfBtDhfw/PS1wMN8pqxaDX
         DTAK4l6opxU27ZVWLgomRF9Vt5ZOfo8Jc/gtrRNo0JRDWPzl+IRXovZthiaHsX6j2rY9
         d/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770178198; x=1770782998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs6BBarzwmD2Zm1TSaGTp7E5XeDaUo3g+3j+s/whg7M=;
        b=ZBmiqtPUKIORAAAvivmyVnq+Rj75lbK9qstrppE0CZ7zYLbMCctL8HeSPIOKd8LP+O
         MH/ALJIBOtopooTtSLWpoXYJUVHaiMBx/IZCx60LBg9dvy/QfKYE2By5QafaKqWIasiJ
         dUZo3NVUMQBQNR06zrmcg07H8CTw7bZzKrTQhzyJf66sGSPy4BY0xE0hVZF/sxn3s7aa
         60JzwEsRjo8Fhh6lbtwmNTq+7fUrj5ltN7tYJRNQcCoMsZoSONPqdRB1688HrSDNdbaK
         BMNAUhW5kUSJ+RC56tPtdnO03SXBdY+d9ar70R641bKRoCZXh/jkHpueE4tjUzzvuRvC
         XXkg==
X-Forwarded-Encrypted: i=1; AJvYcCXpXfWSBH7RfEIl1TtsJWXSniQP4ycJQJCdqdQYJYs7Gwg2Bs3Kp2DgXUZ8mTdTRvIdWVQruP/5OEb1Qt9Hoh81@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc0113LeTiZQMqsXyZmAgR1XSW/AeCDOKtu82/bAzagJ+i7EED
	W6X2nbAgk49Pwni7JJEyxgRarsf8bFJUsG2vbSv+U2yZCkk7CjoWQXL0wN6/tnMM
X-Gm-Gg: AZuq6aLDVnjSoXH8cz0cwzanwfdvCINyxRqy3B0l3n5V9G0dGUiySqx6DEUWpzbk5V4
	RBHirngwo/L0uSNuwsvcSZiJXS0JduGBfhcn4ae2n0kGp6O3PfpEPRq4w5h3dvmNolRlZ2y1bDD
	B6M4Rw6cNTKqlyQhzpGmZHUh+aCyPoPdOYHZ8Kk0FiGQ1on2d84yY7+S4HsY3bc3sp0LRdQfxPj
	J7QDvpftaVrFaPRlbqZE/aaooROT+NcOIDwhA0jjM58QEmmJk4Vn87bNlIHn+mYqlOogJJgr6bw
	6CrH0uBlycHqJAmzvuk8nVqr+OpyvEljt8spAxZ9hDrLbug+4i5pj4JjRB+jW4iKYftsI2JsP6D
	ZgV+QxSbxXkfZKy93ZrMG7HgUMLTXbD463xSz/JjxRXPcPwXOQYWGrLycGFe2WTFHHtt4WnrCLm
	Cyjt49FgYD/g==
X-Received: by 2002:a05:7022:f103:b0:119:e56b:91f2 with SMTP id a92af1059eb24-126f47daa76mr613066c88.35.1770171313127;
        Tue, 03 Feb 2026 18:15:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832feacc6sm940814eec.35.2026.02.03.18.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:15:12 -0800 (PST)
Date: Wed, 4 Feb 2026 10:14:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Yao Zi <ziyao@disroot.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Zhi Li <lizhi2@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aYKq4qlgCDo42rnw@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <20260130022705.1059214-4-inochiama@gmail.com>
 <aYI00Exytbgbnuzp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYI00Exytbgbnuzp@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_200959_908513_8BB17B2D 
X-CRM114-Status: GOOD (  25.21  )
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

On Tue, Feb 03, 2026 at 05:48:00PM +0000, Russell King (Oracle) wrote:
> On Fri, Jan 30, 2026 at 10:27:04AM +0800, Inochi Amaoto wrote:
> > +/* ctrl register bits */
> > +#define CTRL_PHY_INTF_RGMII		BIT(3)
> > +#define CTRL_PHY_INTF_MII		BIT(4)
> > +#define CTRL_WAKE_IRQ_EN		BIT(9)
> > +#define CTRL_PHY_IRQ_EN			BIT(12)
> 
> Thanks for updating these.
> 
> > +static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
> > +					  struct stmmac_resources *stmmac_res,
> > +					  struct regmap *apmu,
> > +					  unsigned int ctrl_offset)
> > +{
> > +	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII | CTRL_WAKE_IRQ_EN;
> > +	unsigned int val = 0;
> > +
> > +	switch (plat_dat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_MII:
> > +		val = CTRL_PHY_INTF_MII;
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RMII:
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		val = CTRL_PHY_INTF_RGMII;
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (stmmac_res->wol_irq >= 0)
> > +		val |= CTRL_WAKE_IRQ_EN;
> > +
> > +	return regmap_update_bits(apmu, ctrl_offset, mask, val);
> 
> I would suggest that this is split into two parts - first, this is
> renamed and reduced to just controlling CTRL_WAKE_IRQ_EN.
> 
> Next, a function hooked into plat_dat->set_phy_intf_sel which sets
> the CTRL_PHY_INTF_RGMII and CTRL_PHY_INTF_MII bits as appropriate.
> Note that this function is passed the dwmac's own phy_intf_sel
> value from common.h which will be PHY_INTF_SEL_GMII_MII,
> PHY_INTF_SEL_RGMII or PHY_INTF_SEL_RMII for you.
> 
> It would also be good to have plat_dat->get_interfaces populated
> using phy_interface_set_rgmii(), and __set_bit(PHY_INTERFACE_MODE_MII)
> and __set_bit(PHY_INTERFACE_MODE_RMII) to indicate to phylink which
> interface modes are permissable.
> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Thanks for your detailed guide, I will try to switch to these helper
apis in the next version.

Regards,
Inochi

