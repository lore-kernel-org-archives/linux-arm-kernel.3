Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C89C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FrEnAM0Ty8b3TT2wk1qUCREpGSXW5825yX1yLHlP7U=; b=WXUTyAZ1ervRWqeC5vpQWmKW75
	+eD4rEoBYQff1oeXNqEQIIA4tbAa0CYXk60JeG4xAIUxMoHGR6Fd7JIzeDfPF/ZJA89qRJIiawIED
	G0r4cz1jf5cqtDH42KJ5tJtAKTx9HkeK2P1c4/O4IRtTW2597CmQlCEQEjVh+B+UaKmsMbs0xcjkv
	nYB9ik7llS78k8pzIvezHir1JMrgBIRFF7byAfQK/j4aeMNeaQrhoMkpyZ/mSYjUUxswMn2g9Tdfj
	4FElQ8983BVXq/GpouDWUDBNXW4AbOZPOFj0qdIbRBEvZl10hr8krQD+cNRzQTQG/kuiQEv5+uNK3
	yU+JHi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjgtj-000000023HP-446v;
	Sun, 16 Feb 2025 15:49:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjgsI-0000000238D-0OoH;
	Sun, 16 Feb 2025 15:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/FrEnAM0Ty8b3TT2wk1qUCREpGSXW5825yX1yLHlP7U=; b=TH/sXzoGZDKFZxyyyYNMJfCCcJ
	haaiHeMXtkJd0EXixYhy5qRVdKxKvo6QU4s+3xu/7RPBJy8inXCaysxqUhpogLaQcnHn5agZHY7vC
	ISA3JdH8ZIaySnObQY2s/fgesQH838h2X0hJ3Ddzde/x05GIMag/3XwrgarNWLs68l5ow65dSA6Ez
	GZTTUyKV3vIU8VQAcZF8t39IRm/HYkxgn7wil+eIRf85b52fO03F2CLRoj36JaFDK0f/aQ/io0ge3
	q8X+LcpW8NGBveQyqdM7nD9heEDOB1Jz6Zd2z8FuDZLqL3ahCTvqdWKkxt/Upnvkzk8EOTmfUfgiT
	8owusuhQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39494)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tjgrh-0003Z0-1w;
	Sun, 16 Feb 2025 15:47:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tjgrW-0005Ji-15;
	Sun, 16 Feb 2025 15:47:18 +0000
Date: Sun, 16 Feb 2025 15:47:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Furong Xu <0x1207@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for Sophgo
 SG2044 SoC
Message-ID: <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216123953.1252523-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_074806_133175_1F7049EB 
X-CRM114-Status: GOOD (  13.69  )
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

On Sun, Feb 16, 2025 at 08:39:51PM +0800, Inochi Amaoto wrote:
> +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct sophgo_dwmac *dwmac = priv;
> +	long rate;
> +	int ret;
> +
> +	rate = rgmii_clock(speed);
> +	if (rate < 0) {
> +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> +		return;
> +	}
> +
> +	ret = clk_set_rate(dwmac->clk_tx, rate);
> +	if (ret)
> +		dev_err(dwmac->dev, "failed to set tx rate %ld: %pe\n",
> +			rate, ERR_PTR(ret));
> +}

There are a bunch of other platform support in stmmac that are doing
the same:

dwmac-s32.c is virtually identical
dwmac-imx.c does the same, although has some pre-conditions
dwmac-dwc-qos-eth.c is virually identical but the two steps are split
  across a bunch of register writes
dwmac-starfive.c looks the same
dwmac-rk.c also
dwmac-intel-plat.c also

So, I wonder whether either this should be a helper, or whether core
code should be doing this. Maybe something to look at as a part of
this patch submission?

We really need to stop writing the same code in different ways and
think more about how to reuse the code that's already present!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

