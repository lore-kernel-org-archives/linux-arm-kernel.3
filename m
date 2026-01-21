Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B969DC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp0I2O5rvzmCmzT9e9dhaVxnINQFtm8fPyCPAakfKbA=; b=F7cEPIO9RIba1XrFpQTTS8xbfp
	/tqDrWctW7HxGb/Ecixoz/J+OCIh9pSD0RVyynEu666uyUpXWJhMFBLxBkB1By/rAsViF1USrQR6G
	hyhHxo/wAxWSrJslLZ8mV/SgL7k4OWncbDb50ULdZjpqRy/X/Mg3a+1YGBMukC70yuFn3BKmnMt/S
	AGtODf3vq0nKuLuEmyjZzrBWo7nGx7VgUvfwHOyPKoUaMcrjssGsGTGRAhpHGad09XP6ThRCTyepn
	gsfuJafcdLhbRxSsdXSeoUqqgUBE+0iATy3SS6pcwmuhf8EJyRThfwUQOY1kfficVZkAsR73Gccki
	tVojHeww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vii4K-00000006Bvr-2wdN;
	Wed, 21 Jan 2026 23:57:00 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vii4I-00000006BvB-0C5Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 23:56:59 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12448c4d404so445510c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 15:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769039817; x=1769644617; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jp0I2O5rvzmCmzT9e9dhaVxnINQFtm8fPyCPAakfKbA=;
        b=J2mfia38yElNpM0VXJe4jk89t76FWJpscWyqGC2cOiok+iGs6WK9HpZr9RLYLc4RyX
         F2PBvpn/C/RXfUsQsAHJPBZziWD8Rc2J1StSfgK6RLUuadCAbAWpXnJugO9apg2+ujmp
         W3clcHXnQoNnHLJVZUC9RDIpLwAOqsUqi2xuo7yfConJ8xIITBc1ggO4hiss2hi8VVdV
         mzxhXPgElXynrTxdWMeYE8K/92+DcKDK6PUdSN/nIx1FQg6gCEyU2keZaI7iQ967P26M
         7BQWjkODdweg08Pw/jV12mQn9rtfd3tc8AkGdGriXCTkZexPcYWBiDR/eLaaRqOlyHUh
         QacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769039817; x=1769644617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp0I2O5rvzmCmzT9e9dhaVxnINQFtm8fPyCPAakfKbA=;
        b=kTxQnvuOxNheGOAWYoQn/6er26gU26TxpFMZ9kOHFAvm6fCd9lgmRC5JCBr0QOQ8Tn
         J7y41h0Dh9fR+Lo2iZNKEUzSeK0GoeFtPpzGZPvY/4ld4tEAoDfyPIUQNM4OP20xaQaq
         P221MGmt3SxekatM5uQXoMYuqG8GvRidKLNuvx5XB9XRdbgp6b4mcqeeDBuWapTyWtsw
         8p1aGu0/dR7HnRbeua95NfPiDDWV28J0Oj0fYdB4DaZVBtYl+nX4ELpGmwvi1fPNeFGC
         h1ohPb5i2LqyvNnKaae979DkiPJBQb+0kyMXk/uQLOTjm0y8vgIz7n/meLlzu/D4qVK8
         ZQiA==
X-Forwarded-Encrypted: i=1; AJvYcCW1onrGJ4jmjUzAw7gPfdthAISDrtMaGkOLOAPaVA13Ry9W3iB6lSchI7IZgzXJ54dnp83fjfVrR0lI04LvEv1S@lists.infradead.org
X-Gm-Message-State: AOJu0YyjcRtYTp8L7sydAXO9+lQJ2r75oF90/7Yc/y+Sxm2oeKRLLBHD
	3Kg+8oGX5ThP/RcW5IJDZEBF109eV6+Y2KAFfgRDiCh5Y2jk7zfZXzoW
X-Gm-Gg: AZuq6aIXGkIqlB2Zu87s0lwl+9rkeDdCZnITLeG5AbfxAnymQeUH7fLeA1P8qni7akV
	lEQgrRZrafqzinbXdEn58mXNh5RnRMbHujS9g6e3zoE40Wl24iiWSJTNXDfdDPB2F3SQH6fwENn
	z/3Kl2Yquvx3a4T/hGLICRK2MHJ7p2u3vktFCgcmP5bDqCCX6wNTtYzZGb2vgwHZIii8lgVb8pl
	A1jKswmg4EneblXd6q0xUJkzXZYO2sw8boBb4/u/nS4+gbfwQb0sHJ2ncUpeDkcUiD41uZ8w9fq
	HGrlunU1hXFiopiXWjBJtjYo/OcuIxUB2j4A395pySAhZS0ntudhPmfg58GJ/tAsxb8FjTS1Nzt
	IAntYL4cN+uxjiLejyzUxoFEchv/n+DotA0KnKnKShMLrd+YFqjs+0HQiCLWbVDMRgLA5GP6eCI
	ek0OBy1NuFqg==
X-Received: by 2002:a05:7022:4389:b0:122:33e:6d41 with SMTP id a92af1059eb24-1246aaac67cmr4335389c88.23.1769039816566;
        Wed, 21 Jan 2026 15:56:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac5842csm27914226c88.1.2026.01.21.15.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 15:56:56 -0800 (PST)
Date: Thu, 22 Jan 2026 07:56:45 +0800
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
Message-ID: <aXFnmXIwSdKCS9Uc@inochi.infowork>
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
X-CRM114-CacheID: sfid-20260121_155658_089553_FCAA3568 
X-CRM114-Status: GOOD (  30.25  )
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

OK, I will use a local variable here.

Regards,
Inochi

