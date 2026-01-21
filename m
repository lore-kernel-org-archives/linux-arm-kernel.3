Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C93C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 00:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzXSISnrF9gPuh5VrYor9F9pE35gc9wpvxNp6irLpQw=; b=LtM34Xz+IhmKe4OG9U7dFVy3R0
	MtDY653eoJZvHTUzOGz9t5NBOYSdA/vEAaKR+w6RiutLgwM/cVG45JU6xOOee1rmHcHasPzrAxH8H
	2UVfxiVthV6NT6sACXANXnetAFRZtkbLABVTCae2eXeWsjdoyGw8i5wmwQrbt/K9sbuTe1zgdvF57
	mdG8lswQcNRQyICKGO4V3UNS3a8Iv/L/M1u599dXyd2DGdAJYo3j6ZYAKTZQR86a4VPLHONMj8E6E
	SegaBgRWTwsYlsik4u6DuIO1Z0WrypsSjcDk0ilPbRBmpOlPHgma0msOfaYuhOoTc4PRs4MCZeFgy
	hpBo30JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiej-00000006Dfg-0qIL;
	Thu, 22 Jan 2026 00:34:37 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viieh-00000006DfL-0Bj4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 00:34:36 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-93f56804894so232963241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 16:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769042074; x=1769646874; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzXSISnrF9gPuh5VrYor9F9pE35gc9wpvxNp6irLpQw=;
        b=ZT5l9JyVI564eS0KIJUPhb+40CN+yAHNLxSPwlKR5mGadob4RG2+1QyKBiPBIq1jRj
         nqcWgO9XaHS+TJpel5iM/IZ00Wxq7CMO61O5i79heTcnCdOPOSCJSFdEST510RvK2aip
         9qKjkCId9/bEXEHHvxwlCl+PcGhfp2XcctZYrFfCZ/Awf7GiY0PtWuzh/h5Qj0Ietr+S
         KGmQDaDlq6R0R/q4gTn1t6nhsLH+qnUi+AqusB4Ml3XeiWs+1jqjabKVftbk+cFMiQa+
         jFjS0qgsriD7oqK4+BZIfOFokFq1WJEdKC0fbSPEtqjuV6G/kbrvsDEtUFJPSuUBKdgz
         RNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769042074; x=1769646874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXSISnrF9gPuh5VrYor9F9pE35gc9wpvxNp6irLpQw=;
        b=djZKFf/KZghfl36t3TGryzjvdgrBBLpYQx9tAk4IUxA8ph4+GsJxfoO2nI+OfYKOb9
         DEiIe99vgYvqDYXRSRvdYLxHUBFgdVGmfE8lvSbqq2khcpMFGK8Gr9tof/imSF/oOC3l
         Kva26P57bZmEEDZDOjJs0BK2UoX8neBFmEBEJZjoSZtK+6T0lW40WBgq7bKmcW77+jXe
         ZUZUQ/uxxNLTyaTkCYNrxjgO3r9X8bv22+PyNIqEIPfiHx4EDJp6ITA46qfy7Aiwouj0
         t/i1dewtxN2v53qdttcyWRG2wqmdcyzW1RdRAjT2FMcaRAZreLORtUpF38waJ4joRG1J
         Dn+A==
X-Forwarded-Encrypted: i=1; AJvYcCXSt+tm+yxkn2noxUvxtKeqhm9hLo6IJ4/M5OpbZaxnQA10tOCZXPmeF2c7Qp0nwSYDhKMFKOQLwhB6GeVUpMoe@lists.infradead.org
X-Gm-Message-State: AOJu0YyKpKDk8xrV034wpcX9mo6wY2UcXOu/8jIZl9ASaXmChutwtXy9
	x+AhvuLst9gT3FSzj0o/JjRc4/ZucWHDxXHXAha+bmV6ATR7yqAbnyJvKHoWkZKB
X-Gm-Gg: AZuq6aJtR1gER9PtBIBeGjiQ2pc1MC8ACkH07H2BBuJFh16BEuD7ZqNlCASkNb1Kabq
	PFR5hXdVOb49k56IJ27+E+9HbhnCRxdcPaFu431k+XC13DLsMmrA8O708EUdz3+Ln/ngDuh/e14
	93nX0jmrbZhck5O+KtVBH+WynbWFs3nGMhNPIhGUy0dFrwnaOoypLOZERaXmcXY9uOkhrbb8kZ2
	QLHUC0bzyFobetiHTl8RHc4oBVsbL6OW71MFLshp3qeAbykJbXcCj8+Xojk4/D1R0O8ZloOM/E5
	vKGD/0p1VidZwql77vDyirV5fPMIBhdoXTF0pec6V/ZpGJ3r11tm0TSNnnKU0S5wk+gu0gYFi7Q
	o+HfoylNgHjcxOuDQL5APSx6DKpw0yFhnEQVTFC2jbqVGBhP1lNSOMuWhJ4LTh7/IGDydyCgP17
	9GkNE5NzsDCQ==
X-Received: by 2002:a05:7300:bc08:b0:2ae:5470:2e61 with SMTP id 5a478bee46e88-2b6b46c68e2mr15434088eec.2.1769034989298;
        Wed, 21 Jan 2026 14:36:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3503a30sm25165715eec.13.2026.01.21.14.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:36:28 -0800 (PST)
Date: Thu, 22 Jan 2026 06:36:18 +0800
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
	Yao Zi <ziyao@disroot.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aXFS7fW8kdsi_2ud@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
 <aW8MJpERR3TmsiKg@inochi.infowork>
 <aXDAmDEpUArE1_en@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDAmDEpUArE1_en@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_163435_115198_CDF3B8F6 
X-CRM114-Status: GOOD (  30.21  )
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

On Wed, Jan 21, 2026 at 12:03:36PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 01:05:39PM +0800, Inochi Amaoto wrote:
> > > > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > > > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > > > +	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config) |
> > > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, rx_config) |
> > > > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > > 
> > > These FIELD_PREP() fields look wrong. Did you mean to use DLINE_CODE
> > > both tx_config and tx_code, and did you mean to use TX_DLINE_CODE for
> > > rx_config ?
> > > 
> > 
> > This should be RGMII_TX_DLINE_CODE. This is a copy paste error, I
> > will fix it.
> 
> Are you sure?
> 
> In that case, please change this to:
> 
> 	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config | tx_code |
> 					      rx_config | rx_code) |
> 	      RGMII_TX_DLINE_EN | RGMII_RX_DLINE_EN;
> 
> If that isn't what you meant, then your reply is wrong, and it seems
> you're confused, which makes me then question how reliable your
> replies are.
> 

That's wrong, I think I have reply it in a wrong way, it should be

RGMII_TX_DLINE_STEP -> tx_config
RGMII_TX_DLINE_CODE -> tx_code
RGMII_RX_DLINE_STEP -> rx_config
RGMII_RX_DLINE_CODE -> rx_code

The RGMII_[RX|TX]_DLINE_STEP register selects which step is used for
rx/tx delay. The RGMII_[RX|TX]_DLINE_CODE register provides the factor
used for calculating the delay. These register are computed in the
spacemit_dwmac_detected_delay_value(). And finally we can got a delay
with "code * step / 10 * 0.9" for both rx and tx.

Regards,
Inochi

> > > > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > > > +	if (IS_ERR(plat_dat->clk_tx_i))
> > > > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > > > +				     "failed to get tx clock\n");
> > > 
> > > You set plat_dat->clk_tx_i, but you don't point
> > > plat_dat->set_clk_tx_rate at anything, which means the stmmac core
> > > does nothing with this.
> > > 
> > 
> > Yes, the vendor told me that the internal tx clock rate will be auto
> > changed when the speed rate is changed. So no software interaction
> > is needed.
> 
> Please do not assign a clock to clk_tx_i that is not the dwmac
> clk_tx_i input. clk_tx_i is a name used by the Synopsys DWMAC for a
> specific clock.
> 
> As you don't need to do anything with it other than to get and enable
> it, consider using just a local variable here.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

