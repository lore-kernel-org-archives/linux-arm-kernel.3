Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A85C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 01:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGEOJU/uiNboJwAtLEE6S07BEXT+vA5BV+sOD/aPObo=; b=Z03IJXDsCQlsOrwHjGqYy2uzKZ
	PVO2DH6POZqm+I/ywIaPeQWRS5YI8LrMu+N/k6PIPVnLFTMR73Y7uLjSjRE9AwE5YlATOxLnMmDA/
	uuscfdWol/TqWIumi8hwlJPNbp9OC+csPIHz6RM/xqI8DtgDPFR8s/WMPamAi735WIJiBnfQs9Am3
	joLSre+yNX5ZnWeeVkwiq7fAsNUd2Q4eFG7AVlqvqQCge5BZo6oRqe6M9tDVjuaNnc1F4Bmgc2lyS
	Z2sMG40VIN8hGlp1yIBnojPn4PrGJuyD4mp6YrQppFK/gvlLOmHIW8NcNnQHpfOMaZgoKuGHVaoxn
	mVcYAF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijTn-00000006GhL-2zYR;
	Thu, 22 Jan 2026 01:27:23 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijTl-00000006Gh1-0Zxl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 01:27:22 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6610e72112bso196611eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 17:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769045240; x=1769650040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGEOJU/uiNboJwAtLEE6S07BEXT+vA5BV+sOD/aPObo=;
        b=VUfEhoQIJ/EkBJ0IHldvlFsmlIV4NCkYhNZCDfC1Zu4nbZjsmKnwP/XfcjaED2HPuV
         OKhIoqwCAw24q9uko40IkLu6gz7g7mNbZ2JM1FpuGZUOYPTql7Vl4OSyx9NYCIaEKvbk
         WZ3sufnzmwuHLcTxmk6aJkZFkZkEAsDjPDcc0I343NwGVU+2rVoR5t7yj9ZkrWbLUnWm
         Buosi9aL/Bb/PYC8f+7h68+d+9SO1iwcF82Ww0LM08KXLYxGMAj9H3gWxgE1pWF7YrG6
         HU1uhA1iTzLV0Sami4rxwyk4DwJ/y4BtQ/yB5qlowv97A8CqKEqVVbDYL0JSq0a0KTNZ
         lF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769045240; x=1769650040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGEOJU/uiNboJwAtLEE6S07BEXT+vA5BV+sOD/aPObo=;
        b=LFCQRRkebkpgWRDySc/Sagbiqp6yGcxiZT5dqueR6mJCDU2RHdEw+MKh1PnfavDqL4
         cgeMHoBbbjLTsvdAay3av3oPnEZ2ONy58zjpvQEYLOrlvezJSc60QN7uTfHcEHIrSK8A
         2dzbdnBziOTG5Iqa4iujJTc7xxct4kbaEnsYOVnYz/rH81TEOOBbKljHFr6dL2rR6h1C
         +L0ApRa2TkJvLyFSVoImCHSvqxwfRal9uWp8r9GZQYo9qrr89hyix3sXcbW8MBBxAhUx
         gfpt4Pl9zaRulVahVIQKumzg94P7+EdEx1Eskd+jtCmwRe7auq7tl4BqXzwzULITx/OK
         4JPA==
X-Forwarded-Encrypted: i=1; AJvYcCWt6GNalEiHA8l0fEG/eh6LANfffZu3Z1msEQh6icKWq1wE+ezw7gS+eOLcAOe/nJg56Bpj8eSi7/+bhCYaeEvu@lists.infradead.org
X-Gm-Message-State: AOJu0YwzpzTiJbIRpz8nnwCZlH4FGIR2u25yNMi7ho4+JNh1/YmiSn+9
	Zw4taESwqCjdzOeZl0EHyH6E2iV2qIXnj5Jz1iZySaMD3HHDgJMBxu/uSTGcSwTp
X-Gm-Gg: AZuq6aL0pI/B0I047KmHDOnrWLJl4k54Iqgme96tSagvlWXYeT+zas9ra4TmzlVwprR
	Bx1YO3btYovhsDETn2ymxFJhK5Kb1qpZ1f5GvSkLscZNzC32ErfVNz2NuoLNByimbaFFUvfqFby
	w8NRYikSnrzyN336JfmJXaLrf99H/fCiVqswYm5tms23jjEu/Ek98tagOvfHjcBUOxRQGp/Y4DQ
	RE08Z2CVLJ/Rx2c1fjWTZ9c4+W7jQdBG8SfIfQTRkX+UOcvkb4NND2wfxB/NJWhXirfLlFLwGxu
	dOs5VFhzO3bflCYP76+Vk1SkSks9UZgH7laVQ3d/Y6BZalAksFT7uCjjRMIVX5hoX1NTrFspiy/
	Cwr1F+GSdUsx4NsXJXQxorvDAi1bQ3KOA0zrwyXwr8yJPbRbjqxnvP/8BxJzLs52kuSRyJN9K+x
	bOru9e0vbuhQ==
X-Received: by 2002:a05:7301:408c:b0:2b7:143a:9a8f with SMTP id 5a478bee46e88-2b7143a9e6bmr2183820eec.7.1769039928585;
        Wed, 21 Jan 2026 15:58:48 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b361f5d4sm23459514eec.17.2026.01.21.15.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 15:58:48 -0800 (PST)
Date: Thu, 22 Jan 2026 07:58:37 +0800
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
Message-ID: <aXFVIK57ZNMD_Sbg@inochi.infowork>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
 <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_172721_229270_F21610D6 
X-CRM114-Status: GOOD (  21.55  )
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

Sorry, I have found there is a mistake for replying you.
Now I give a detailed description about this registers.
You can check it at 
https://lore.kernel.org/netdev/aXFnmXIwSdKCS9Uc@inochi.infowork/

Regards,
Inochi

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
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

