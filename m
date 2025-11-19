Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C236CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2Z8/xcjTHwwelfJUI+eSlYaVGFYtTXFWiaz6vN1dqc=; b=SJgTDKuoFVzg27BM0wNwiM35LR
	ydzmjFONjY1FpymNqz2YA5xYvuCqYVEj1i5tXz8wHjPyPVL7sygRybV1c5oOdPJYLaOWKm+CnsdMD
	CErqkGiuXw8pJKdH9IYn1clMqEuCGFKeg2ixIScETCsKqCBt8qIA1CXiOMSzvbPJ3bXigvSPLQPiA
	arRuueJGYB9PaxEfTl2j76zxf4Lqpgjqxcw9PmBSPnHVL57uuhlt0pcZd2Q05a9OzK0C5ky43cHGM
	+QNa8+z0rXkH/J0ZKU35gQv9oCaULoySF9mVUO57khtaIPw/Qvl0KxIJ0Ur7YrQjCank6Gv2hrTKB
	LZwQr0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkoF-00000003eGx-3KIh;
	Wed, 19 Nov 2025 16:13:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkoC-00000003eGF-2CQl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I2Z8/xcjTHwwelfJUI+eSlYaVGFYtTXFWiaz6vN1dqc=; b=BRLKTIepSCsk2GgXJg5XJJxzcW
	Q01F6+TnlEaz2bHGlKhI12kgEN1NM7BDaQppp5zAAEQgLiaRYg1O8m3hrzul7eWn3PeUTAEyNQOpa
	Rgx0+25rJnZ+ulN9XZymfV0agn8derlOjokbo4zNIdphtx5TCR/mRxSrDnlp8i+i0nKmehDwFPUh5
	wCiOZr9B+8svl8RWRnQAv4a7S5L+t4Ywut5foMAGHWsPDrty6gcPagQvHCDtrhcOxfMou91DOitEY
	et5g38666G9rqA8DRHBDFSgfKlGwdg5LklhRdBbShOvASvSTou/TSBZ6hhPE1dz82M9F44q8Kr8CQ
	VvsZowzA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33292)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLko3-0000000058C-3sRn;
	Wed, 19 Nov 2025 16:13:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLko1-000000003Yg-3fGV;
	Wed, 19 Nov 2025 16:13:17 +0000
Date: Wed, 19 Nov 2025 16:13:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend] net: stmmac: add support for dwmac 5.20
Message-ID: <aR3snSb1YUFh9Dwp@shell.armlinux.org.uk>
References: <20251119153526.13780-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119153526.13780-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_081328_567828_610069F7 
X-CRM114-Status: GOOD (  13.51  )
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

On Wed, Nov 19, 2025 at 11:35:26PM +0800, Jisheng Zhang wrote:
> The dwmac 5.20 IP can be found on some synaptics SoCs. 
> 
> The binding doc has been already upstreamed by
> commit 13f9351180aa ("dt-bindings: net: snps,dwmac: Add dwmac-5.20
> version")
> 
> So we just need to add a compatibility flag in dwmac generic driver.

Do we _need_ to add it to the generic driver? Do the platforms that are
using this really not need any additional code to support them?

Looking at all the DT that mention dwmac-5.20 in their compatible
strings, that is always after other compatibles that point to other
platform specific drivers.

So, can you point to a platform that doesn't have its own platform
glue, and would be functional when using the dwmac-generic driver?

For reference, the dts that refer to dwmac-5.20 are:

arch/arm64/boot/dts/renesas/r9a09g047.dtsi
arch/arm64/boot/dts/renesas/r9a09g056.dtsi
arch/arm64/boot/dts/renesas/r9a09g057.dtsi
arch/arm64/boot/dts/st/stm32mp251.dtsi
arch/arm64/boot/dts/st/stm32mp253.dtsi
arch/arm64/boot/dts/st/stm32mp233.dtsi
arch/arm64/boot/dts/st/stm32mp231.dtsi
arch/riscv/boot/dts/starfive/jh7110.dtsi

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

