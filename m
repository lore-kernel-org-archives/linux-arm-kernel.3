Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09014105F784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6oGlsV387MSkeGlfgdCPnuYQ1UUU9UaeP1u0pOYQpk=; b=Y5YQQTrdUbW/CUeSDY7+4e5lRt
	VlbLr4R7L9Xwn4jwiWL+WRzt5tBkfGTUaXVoqRqsyK0rVuAzpj5JPVY/+4W0UtoZhN7F6Iita2UPM
	c5lJkWeq+EFlKn0HgZi5hdkN6LrnT427pzXIUAsxBoEXTRkTdaxlh0r+/Bx0x3A5CJRX0SubrTHf0
	NteDJMKaJw2t4PBL519DumIsp/24wwmnxwxOY0uKJfmmgYa1YIkixubJE25P48tP8L0AcOIu/cnCS
	LkFpHemOnsoGK6UpJf+1Mbz9GTLqLSXjZm6oh/RyqVNHjBdw+gdn96m7bofEAgO5J4cHOXPekjiqk
	vM5JqGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yt1-0000000HOgj-08hk;
	Fri, 13 Mar 2026 09:32:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ysz-0000000HOgA-1vh5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A6oGlsV387MSkeGlfgdCPnuYQ1UUU9UaeP1u0pOYQpk=; b=N4dpvghOoD7lsNNjAitvRoB2VT
	KDOZfxflxPR7RlSM7Bxbc4BhFrTdX0eBtXi4PwkxlUg1JB5V691o4lGAOHd6gO558NHmHygOLiQPU
	3FaJNki/os1e3P+wuwI+3n1ugn0absEymOO3PNFpW6RT3D1lAQ7uypbdVb99Pvi2dcJ4LKrUk5dc/
	+2xlJDh7saBa+z/6TqIyLIrydtV6nxDY9lNAC+vYDEGuUM1UjwDVy9YvEgsRTT5+k73uoZD1ECK/Q
	VcYda5X1jFhvPr5jpp1x0hzbwnx/r52GvT5Sq4rCvgHX7cZDB7Du3B45ie3nU4St41euY3EOS8gAL
	w5rFL81g==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ysr-00000002yba-49ae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A6oGlsV387MSkeGlfgdCPnuYQ1UUU9UaeP1u0pOYQpk=; b=KXkh2Yw3uuUce4xfJqcyDT6oXr
	NRROy1CK1FouZHjjYNBKR2TFjMoRAZ2pWKnrY+1cq9s/8a+FY9Nft+WGiMUC8FWoaHV/2x5ubEhYH
	XaU/j2ue9XT2gar4kfcuZzK397RG7LTkvzV+2bkjezPlGbaFkd3pRlXRthrAg2M+A6mi7PAlniBiv
	vVVabrRHlZRVtvPeJY5k7iYghXxYTi0jmWjOEGsP0rW3hbOLvqNmcX+0rnaJ8YdjfBcYIIYGKXGVH
	WB3ZOeLd4KmXSxr7a+/NyvLj12mwLVSr+P4XCVeMiTYKvAYg3/+BwoMe2FI3QdJyQGGBmYt/S/b0o
	I2ghAwcg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54034)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w0ysa-000000000Zx-4BKS;
	Fri, 13 Mar 2026 09:32:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w0ysY-0000000086W-3QeX;
	Fri, 13 Mar 2026 09:32:22 +0000
Date: Fri, 13 Mar 2026 09:32:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	vladimir.oltean@nxp.com, boon.khai.ng@altera.com
Subject: Re: [PATCH net-next v12 4/4] stmmac: s32: enable support for
 Multi-IRQ mode
Message-ID: <abPZpiCsirNzvqJt@shell.armlinux.org.uk>
References: <20260313-dwmac_multi_irq-v12-0-b5c9d0aa13d6@oss.nxp.com>
 <20260313-dwmac_multi_irq-v12-4-b5c9d0aa13d6@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-dwmac_multi_irq-v12-4-b5c9d0aa13d6@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_093246_145968_6FE48CAE 
X-CRM114-Status: GOOD (  14.95  )
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

On Fri, Mar 13, 2026 at 08:13:35AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Based on previous changes in platform driver, the vendor
> glue driver can enable Multi-IRQ mode, if needed.
> 
> To get enabled Multi-IRQ mode for dwmac-s32, the driver checks:
> 
>   1) property of 'snps,mtl-xx-config' subnode
>      defines 'snps,xx-queues-to-use' bigger then one, ie:
> 
>      ethernet@4033c000 {
>          compatible = "nxp,s32g2-dwmac";
>          ...
>          snps,mtl-rx-config = <&mtl_rx_setup>;
>          ...
> 
>          mtl_rx_setup: rx-queues-config {
>              snps,rx-queues-to-use = <2>;
>          };
> 
>   2) queue based IRQs are set, ie:
> 
>      ethernet@4033c000 {
>          compatible = "nxp,s32g2-dwmac";
>          ...
>          interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
>                       /* CHN 0: tx, rx */
>                       <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
>                       /* CHN 1: tx, rx */
>                       <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
>          interrupt-names = "macirq",
>                            "tx-queue-0", "rx-queue-0",
>                            "tx-queue-1", "rx-queue-1";
> 
> If those prerequisites are met, the driver switches to Multi-IRQ mode,
> using per-queue IRQs for rx/tx data pathr:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected
> 
> Now the driver owns all queues IRQs:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>  29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
>  30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
>  31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
>  32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
>  33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
>  34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
>  35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
>  36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
>  37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
>  38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
>  39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4
> 
> Otherwise, if one of the prerequisite don't met, the driver
> continue with MAC IRQ mode:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: MAC IRQ mode selected
> 
> And only MAC IRQ will be attached:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>  29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
> 
> What represents the original MAC IRQ mode and is fully backward
> compatible.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

