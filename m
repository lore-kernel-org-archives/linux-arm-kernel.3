Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F51D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xB0oJAXp3qEO4ENcSX3Z1/nEQf1M14DCflSGjej4+8=; b=PzuYF3H1ujSuQ4N3ERkvLFa/n3
	31X87QFeQFORSK3xtizi1cm0k/+ISHs3bLSKCT0VVStM2V8hfyPB+yjafEoUW7RlLs9xlg2ogAR6T
	5w71HxhScftoL/YcmmFXkMmpqVLYT1YG3TfYemoiGEMx8+JASHZEt2vSdRWpwltYckxLcjJ0J/b7C
	1CZUABiIC0qiLK0VmH67bH6dsutYUQ75mHBqH+qi+IaAFtLFE+PUbrncN82hxlFRhB+E6yPL3IJkN
	IJt6a31Gw3NAQb743v9i0QaQVOU8dObAlGXPA2mYsRSuIWzeQEkrNkkqmKwDuQXZhIOo1y5FjUkVz
	8J8Kuzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuer-00000002nWC-19qo;
	Sun, 14 Dec 2025 22:33:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuep-00000002nVk-2aB3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 22:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=/xB0oJAXp3qEO4ENcSX3Z1/nEQf1M14DCflSGjej4+8=; b=lF
	E+vr2NgmGXKsHZWD2ULhRLIMai7tY+0nGBkao0Z9cHgY5nS8J3NI2buROpSRKb+3xT02Fpv/wcPR/
	0+0SD1OVNmyD9rdt7OUGL5xOyVrp2XfdvTeb249r/jXD6++7KS4A34cB19BWvkHX0B3CX9hxvEIcq
	GPS97jZR+UJsMp4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vUuef-00GwbG-M1; Sun, 14 Dec 2025 23:33:29 +0100
Date: Sun, 14 Dec 2025 23:33:29 +0100
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
Subject: Re: [PATCH RFC 0/4] Support multi-channel IRQs in stmmac platform
 drivers
Message-ID: <39430c2b-9430-46c3-8087-5381782a5b01@lunn.ch>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_143339_652225_E464FD97 
X-CRM114-Status: GOOD (  16.89  )
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

On Sun, Dec 14, 2025 at 11:15:36PM +0100, Jan Petrous via B4 Relay wrote:
> The stmmac core supports two interrupt modes, controlled by the
> flag STMMAC_FLAG_MULTI_MSI_EN.
> - When the flag is set, the driver uses multi-channel IRQ mode (multi-IRQ).
> - Otherwise, a single IRQ line is requested:
> 
> static int stmmac_request_irq(struct net_device *dev)
> {
>         /* Request the IRQ lines */
>         if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN)
>                 ret = stmmac_request_irq_multi_msi(dev);
>         else
>                 ret = stmmac_request_irq_single(dev);
> }
> 
> At present, only PCI drivers (Intel and Loongson) make use of the multi-IRQ
> mode. This concept can be extended to DT-based embedded glue drivers
> (dwmac-xxx.c).
> 
> This series adds support for reading per-channel IRQs from the DT node and
> reuses the existing STMMAC_FLAG_MULTI_MSI_EN flag to enable multi-IRQ
> operation in platform drivers.
> 
> NXP S32G2/S32G3/S32R SoCs integrate the DWMAC IP with multi-channel
> interrupt support. The dwmac-s32.c driver change is provided as an example of
> enabling multi-IRQ mode for non-PCI drivers.
> 
> An open question remains: should platform drivers support both single-IRQ
> and multi-IRQ modes, or should multi-IRQ be required with the DT node
> specifying all channel interrupts? The current RFC implementation follows
> the latter approach — dwmac-s32 requires IRQs to be defined for all
> channels.

You need to consider backwards compatibility. Will an old DT blob
continue to work after this change?

	Andrew

