Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DA2D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 22:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0KaWitLNH8CPRvB1i62xqggSZjs16OVpLh8GECRSWs=; b=C57RTYwI/TuRtlottTUeZCGI6m
	n+2WPy0ps47x0pkEpx3THiD5c69iuZS26JuUQyToFg8NV4WmXpnbFj5nBNER/YdS/KYzYwANIYfDg
	GKgx+qjtmSg2ZP8Q/1bvAbcy9tLsCveuhXIcV3ZMc73P5Y0kZMhPCsMnq5bkDUZQ2Bwvd1eU7noRQ
	qAvrwStslOCdCLPvaNgaG7nJeHG2q1JOfdzl2xSam47T8Eja9c0ZezIrnah7MX1hzcpOdbSpqsMtw
	BqEiFDj8GzhoY8LwTtwtyS4xKoyHXsQbtnECAMVt2DmWRtIFKz0sr1NfpHbXy4EHOqFoEJeT0XzSI
	b1LCDHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuj7-00000002nqp-1ok5;
	Sun, 14 Dec 2025 22:38:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuj5-00000002nqE-0sut
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 22:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=v0KaWitLNH8CPRvB1i62xqggSZjs16OVpLh8GECRSWs=; b=gMzyM24QaIAKZuw+bqykf8GWpg
	AadUEWdwJr15GepQ0xXgZACD5HYtru9Qvse1fc0LJvfmgvPISIA0x138pJWCGMouNrYSssTfFjgBl
	9u9SmDD3GtQXZKN2PKyZfKzudonanoWHk0/zmESJ0CUJ8Ygh338Am1Vj7aux7x/tBETg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vUuit-00Gwcf-H9; Sun, 14 Dec 2025 23:37:51 +0100
Date: Sun, 14 Dec 2025 23:37:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
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
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 4/4] stmmac: s32: enable multi irqs mode
Message-ID: <d1eba807-c45d-434f-b272-ed0841c728bf@lunn.ch>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
 <20251214-dwmac_multi_irq-v1-4-36562ab0e9f7@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214-dwmac_multi_irq-v1-4-36562ab0e9f7@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_143803_249578_8339984A 
X-CRM114-Status: UNSURE (   8.47  )
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

On Sun, Dec 14, 2025 at 11:15:40PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Signalize support for multi irq mode.
> 
> >From now, if yoused old DT node, without channel IRQs set,
> the driver fails to init with the following error:
> 
> [4.925420] s32-dwmac 4033c000.ethernet eth0: stmmac_request_irq_multi_msi: alloc rx-0  MSI -6 (error: -22)

Sorry, but that is not acceptable. You cannot break old DT blobs.

Please reverse the logic. If you find all the needed properties in DT
enable STMMAC_FLAG_MULTI_MSI_EN. If none of the properties are there,
continue using one interrupt, and if only some of the needed
properties are there but some are missing, then you can error out with
EINVAL, because the DT blob is invalid.

	Andrew

