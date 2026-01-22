Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DA5C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 00:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLRvrHf0GT+SLm7VDguQ+pvYrJH4LqQuaP1lqxnXl2s=; b=v4cB+pXlt6qVweE9KGAPWgaSDJ
	HEJSvoqEBs9JGDIiTEf082alIGwoRy1GxQazV6ymEn7EOZxN7yN8h/XS4KQG7XCg5CFGE28G2IaFA
	nI9jR/o8NsniC+axTiLTsh/dq8Dyt7xMHC5VK3YARtteCSKZXMeFg7UWVNx3TK6mv6Pol1wHS75eM
	US2VMpx1IK8Tprzag0menxiAICB5tYDWzY76IcBfTFqHVC3tB/CIwSnxWP8bMtGkzx+B9QdFAiRE6
	99OSKjpGfhtwrnWcI//+EEcwzscuAzNiVeYYY4fA8waR2uEL9CDJ9pFRl3jGIZAFIsgFX7ANxzSuM
	KDM0iDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiaI-00000006DP6-1rNy;
	Thu, 22 Jan 2026 00:30:02 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiaF-00000006DNm-2KOp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 00:30:01 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b70abe3417so889708eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769041798; x=1769646598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLRvrHf0GT+SLm7VDguQ+pvYrJH4LqQuaP1lqxnXl2s=;
        b=Za4nV9sqxK7BkZWZM44QxbCnZjvpYEpIozMgzn4ZLGXlU43KtRUY1uZlkEEZbDpWD9
         baThjcORvjYmgMp1MuaPhHWDnz237rxVvTuUHCW+0yyJCSbAZ+RuHOqRB2gCfNMTcfF8
         rk+nPvSlW1TYsh7jB9BkBXcx4OTUOkm0y0mHTEcM6tVlG4nMAmuMjZDh10+9p+SY0I0X
         hO3RSr3LsCS8evwYi2g/k1FwRwA8iaRAxq8rlSEtqP7FbMvZGhitLKolDghX8BPh4T+L
         L9Iwd2mhlfiTI7OgBRyLOjomBIfkzs/BRL6W4F4Pc7NXju7sfd2kQ0izh7RbpzZY35WP
         y1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769041798; x=1769646598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLRvrHf0GT+SLm7VDguQ+pvYrJH4LqQuaP1lqxnXl2s=;
        b=QeGtMmoVtu0LvgxwVoFLyF6hQcfRcTJhVuXqUNUc12rXyb5ncl+LguqRRILv8aIQe6
         yTGANtK2ktkMC0dIE73FdKt7iMdv/PcPl1+egx2InRxMkXgPLs+q47zT/Kt4QO4MWbE2
         8PeijSjYMTyrcmgXjvXVbAjtpK6xhpNypmJf7KDXOwvnMOotx+0ILAjj0N7/QMc9B1jf
         c7PfaqJ8SueQbBWlGpQT34hpBgyMsyjp/yOOV4fbPXF8Knjicixeurb3W2WjF6CRSboZ
         UvhTmo97/LznjRgPRZf+AODWZq3VtDPdP3GHWwuIzQlSSi1r61XPyGkc5OnhmwdVJSX5
         d50Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMwRnDAccTAEZ/hwWTmARl4jJjymIfTe81sdvnff4RXTO5xoxGgjv5vryza/044OjOW3gfJqiC8UkVfWn8HaPN@lists.infradead.org
X-Gm-Message-State: AOJu0YzRLifeZ7x0GJDcv4IGvUso2eRZLOTYumfcJ1ZbpsycadFXI4lK
	YlxOqSt39bSv+/byW06+5t8xIJigX32r1o0PKFr0y8Xppeta7+S/7UBK
X-Gm-Gg: AZuq6aJzPTs9aGzyoNyCA5T5lIoDUnBYGkpHLFK2O+LsPkiAuAjMzWoIpREFGtHcLrf
	o5yb6sQlBXRJgGCHfZO/NlxHWL8eV2o0wdakKWLeIw/BLqH7yYL4+g/ftWX97oasMTV84HwPfHy
	n1j+KKz6flsFvRPj82YxkkozAn6JWvPfk40WQMu0cXAM33gwH8+b7IU2V5vkaJ8roJuJaoxQwcv
	EozY7mx8BKBkPbyHDnM5wO+yDrnBEY6ftwavpeEfwC+1lUtu6sn25J+vPesJZmgTI/BywU38Wa2
	iRUtzDVBsL2HOTb+ZZ8uLL8+sZ+YknKfoWm3jHC9aOU8DvlhAjT2ZhtIajhZqukWyQc1Az71uvD
	jL7HHeSZLlxTksfzToBjwGsnN5Bc80rj+cXqKB9xUGMIHHKzMI3mdrZvnvZ9atBb+Fm7Xa5NReR
	EPdmYXJL2y39P7S6eBg5uh
X-Received: by 2002:a05:7300:324b:b0:2b0:580b:856c with SMTP id 5a478bee46e88-2b6b41005a9mr13294371eec.28.1769041796817;
        Wed, 21 Jan 2026 16:29:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac6c2besm29548495c88.5.2026.01.21.16.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 16:29:56 -0800 (PST)
Date: Thu, 22 Jan 2026 08:29:46 +0800
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
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <ziyao@disroot.org>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aXFvWzw1BlooyG7s@inochi.infowork>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
 <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_162959_594042_C96D4F1A 
X-CRM114-Status: GOOD (  20.85  )
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

On Wed, Jan 21, 2026 at 12:05:30PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 21, 2026 at 03:13:11PM +0800, Inochi Amaoto wrote:
> > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> 
> So your reply where you basically stated that all the RGMII.*DLINE.*
> constants here should be the same was nonsense. How can we trust your
> replies?
> 
> > +static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
> > +				    struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_delay, unsigned int rx_delay)
> > +{
> > +	bool mac_rxid = rx_delay != 0;
> > +	bool mac_txid = tx_delay != 0;
> > +	unsigned int rx_config = 0;
> > +	unsigned int tx_config = 0;
> > +	int rx_code;
> > +	int tx_code;
> > +
> > +	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +								  mac_txid,
> > +								  mac_rxid);
> 
> Maybe Andrew can confirm, but this function was to fix up existing
> broken DT, and shouldn't be used by brand new drivers.
> 
> > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > +	if (IS_ERR(plat_dat->clk_tx_i))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > +				     "failed to get tx clock\n");
> 
> As stated on the previous series, please don't abuse clk_tx_i for
> soemthing that isn't the dwmac's clk_tx_i signal.
> 

I have seen this comments, I will switch to a local variable in the
next version

Regards,
Inochi

