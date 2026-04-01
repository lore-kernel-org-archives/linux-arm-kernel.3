Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86478D3517C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcxQWoLJn9G0dptO93Z+OY78wD/jANP0+W3nIgxkSVw=; b=wvOwNqEDnS/rqrHNcHcId1UQIJ
	HAKye4oizfK7cljGr4nr6zf4op6JCzKufHfVwU9/In9oR2UAOvZY5uSSM/k3++Zf8U+0PJRdRHIz0
	I8JJndD5L+qrZrbqjekSLuYFWxFUOLujNvQJA0e3ap5XNSjmuVtC8tFpZXksXSVfyQsPDmjb9lnaq
	bX4uhxTETnaXrEcY4HYE9yNYUUEf5S09UT11GRenlXoN/NEGQ66LJhYohOvo/uKpFXDphQ2i8+qGP
	T2NSDgguC9MwEZ+UKZPyLwV5eaBXseubVe55OJfL9uEmm5jakN+N9yeY9Zzh9JwwiB3c81+slyLWJ
	WRIKFO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uoU-0000000FBfu-01fW;
	Wed, 01 Apr 2026 12:36:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uXp-0000000EyrY-185V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pcxQWoLJn9G0dptO93Z+OY78wD/jANP0+W3nIgxkSVw=; b=qNEW2nQKRTDZc2S5ljnvrwFD2S
	ynwfBvwdcAUg9wB9O2BQNo3gsYQBmZWC8+uiTL/bKTKBxga2nWKqXPIxb022Mtqb1OBj0ktBqfItp
	9zPLZJy1ZZlSRAZ2HEbzBs6x5maVTqWMfCM3b+e0uhiaUzx8BfBnLQxfqUtlE2lYy8eY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w7uXf-00ELhN-8m; Wed, 01 Apr 2026 14:19:27 +0200
Date: Wed, 1 Apr 2026 14:19:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: TSO fixes/cleanups
Message-ID: <420f910f-523d-4a74-a255-2fe48909283a@lunn.ch>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_051937_339954_AB7D109B 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

> I'm moving the setup of the GSO features, cleaning those up, and
> adding a warning if platform glue requests this to be enabled but the
> hardware has no support. Hopefully this will never trigger if everyone
> got the STMMAC_FLAG_TSO_EN flag correct.

Is this:

  snps,tso:
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      Enables the TSO feature otherwise it will be managed by MAC HW capability
      register.

I would not be too surprised if there is cargo cult copy/paste going
on and some do get it wrong.

arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:			snps,tso;
arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:			snps,tso;
arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:			snps,tso;
arch/arm64/boot/dts/toshiba/tmpv7708.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi:		snps,tso;
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:		snps,tso;
arch/arm64/boot/dts/rockchip/rk3576.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk3576.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk3568.dtsi:		snps,tso;
arch/arm64/boot/dts/rockchip/rk3528.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk3528.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:		snps,tso;
arch/arm64/boot/dts/qcom/qcs404.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/lemans.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/lemans.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/sm8150.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/sc8280xp.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/sc8280xp.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/monaco.dtsi:			snps,tso;
arch/arm64/boot/dts/st/stm32mp253.dtsi:		snps,tso;
arch/arm64/boot/dts/st/stm32mp233.dtsi:		snps,tso;
arch/arm64/boot/dts/st/stm32mp231.dtsi:				snps,tso;
arch/arm64/boot/dts/st/stm32mp251.dtsi:				snps,tso;
arch/riscv/boot/dts/sophgo/sg2042.dtsi:			snps,tso;
arch/riscv/boot/dts/sophgo/sg2044.dtsi:			snps,tso;
arch/riscv/boot/dts/starfive/jh7110.dtsi:			snps,tso;
arch/riscv/boot/dts/starfive/jh7110.dtsi:			snps,tso;
arch/arm/boot/dts/axis/artpec6.dtsi:			snps,tso;
arch/arm/boot/dts/rockchip/rv1126.dtsi:		snps,tso;
arch/arm/boot/dts/st/stm32mp131.dtsi:				snps,tso;
arch/arm/boot/dts/st/stm32mp133.dtsi:		snps,tso;
arch/arm/boot/dts/st/stm32mp151.dtsi:				snps,tso;

   Andrew

