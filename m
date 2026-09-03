Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C8DC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiL0n2uXooBtcEc368JZodVn4EdHp6AGVsRm0KQPqdM=; b=1eD0hcy3XQR/+c3dofY5vXTSzY
	+hw3oI/47xjz2mOd0xxcI6BhQTQQQwPw8RInSHEekoIfnISlM46BEPNbrhppGLIAvIBO7XZQ/2Wki
	lXdNctV/9dmjKzaBqstptCqof0KBvp+wJo1Y50/5ebiijRljJG7/RSt8ptk1DeZf41FyG2HBd2zv9
	Ng2xUughUuEP7cyV5BXNSbC6aO27RFIhbONF/fMwzU60KWKhqgZVykfW8u9kefBY2KQ2wWKcLMnnJ
	FDvPF3W1mJenoZWr4dhdpYhwCGGB7615LXYMaqFL4VI4D/yOnYpV8TeEAPhtMDo0ecZwJVi84Nd2l
	fzhybIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23IS-0000000Gs0L-2uuQ;
	Thu, 03 Sep 2026 08:59:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23IR-0000000Grzp-2wAK;
	Thu, 03 Sep 2026 08:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PiL0n2uXooBtcEc368JZodVn4EdHp6AGVsRm0KQPqdM=; b=UR6dSeub/T17rVT75t0G/apCDL
	vM8ar16XCtZ5/sHBM7cHKtZEIH6YWPoQv0ktZDMyhzZpT4uukqszXLHJfmw/mGLEW4qNJC1UxaZiw
	kOLFSyc9BMy3X0/e2I/AOiEAT6G4z1ILpUVN4NTDg+h0M0DDbnvN57majnXM2JGVKpZ01k55t8FKs
	iBbxmcEQqJdjGWI+U3ubtU4SHHheJxf6OarEMtwDpwqr4WY3T8hkVnTL0HGDIGvHEOT43WLoEpHyE
	D3lUqLm4haoQ+cUQY5KHD8Ly7OToosdHPtEIMNPTpzKn9QQRKlDlXQn+bk7wbzLlIOZyzN5ko5dHr
	vyWSoIDQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x23IM-0000000CtTC-3odL;
	Thu, 03 Sep 2026 08:59:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E7D5D4E414EA;
	Thu,  3 Sep 2026 08:59:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3073602B8;
	Thu,  3 Sep 2026 08:59:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D55D11C79B6F;
	Thu,  3 Sep 2026 10:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788425975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PiL0n2uXooBtcEc368JZodVn4EdHp6AGVsRm0KQPqdM=;
	b=NSAfZPyFa9kKtVaFiAwBkbsvfBe6WXTmXNm2f7foXwBePTVa3H+um9g9CFDz2W8fd/X5xc
	E8nIZDWfVUXYxXhzu0UxH8/n+TJc2bvmjpDPFp0h2uWAimVXBXZFXIJfDnlpbC/BICsVHO
	7OgGrMYElME/1bbRs1vfRILU5p97XBKrDBpkYQHx0vntvAqBPNmT/95Rfcn6qO2umjS/dz
	6bNKILtLX1sD6vMvjgaFXhbdCNFXR3o05SWWTOZ3FmVvXWWFNSL6JpLYpfHaj/zqjTK7JA
	1+EbewU6Kz/XhoqxrQ9mynIRFw4QwXYbxT9kLtPnVi4X1WF8Vvs2BzeoooPLaQ==
Message-ID: <54544759-8668-41af-ba05-68b8b3f00416@bootlin.com>
Date: Thu, 3 Sep 2026 10:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 08/10] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
To: Coia Prant <coiaprant@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org
References: <20260901150111.141037-1-coiaprant@gmail.com>
 <20260901150111.141037-9-coiaprant@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260901150111.141037-9-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_095943_074062_7357E141 
X-CRM114-Status: GOOD (  18.18  )
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

Hi

On 9/1/26 17:01, Coia Prant wrote:
> The RK3568 SoC integrates a Synopsys DesignWare XPCS that can be
> connected to GMAC0 or GMAC1 in SGMII mode.  Add the necessary glue
> logic to support this configuration.
> 
> The current dwmac-rk driver does not support SGMII mode.  SGMII
> requires a PCS to handle auto-negotiation and link state reporting,
> but the existing driver only supports RGMII and RMII.
> 
> Add a set_to_sgmii() callback to configure the GMAC GRF register for
> SGMII mode (bit 7 set, interface selection bits 4:6 cleared).  Also
> add a supports_sgmii flag to indicate SGMII capability.
> 
> Provide pcs_init/pcs_exit callbacks to create/destroy the XPCS via
> xpcs_rk_create() from the Rockchip XPCS platform driver, and a
> select_pcs callback to return the XPCS to phylink.
> 
> While at it, fix the clock enable ordering in rk_gmac_powerup():
> gmac_clk_enable() is now called before any register access, including
> the SGMII mode setup path.  Previously SGMII mode would bypass the
> clock enable via a goto, which could cause synchronous external abort
> when accessing MAC registers with the clock domain disabled.
> 
> Also clean up the error handling in rk_gmac_powerup() by using a
> unified clk_disable label, and add error handling for the default
> (unhandled interface) case.
> 
> SGMII In-band vs Out-of-band
> ============================
> On RK3568, the MAC clock is fixed at 125 MHz and cannot be dynamically
> changed by the stmmac core's set_clk_tx_rate callback.  In-band mode
> works because the PCS handles rate adaptation internally.  Out-of-band
> mode does not work because the MAC would need to change the clock rate
> to 125/12.5/1.25 MHz for 1000/100/10 Mbps respectively, and the clock
> is fixed.
> 
> Enable default_an_inband for SGMII and disable the generic stmmac
> set_clk_tx_rate callback.  This forces phylink to use in-band mode,
> where the PCS is responsible for speed/duplex negotiation.  Without
> this, the stmmac core would attempt to change the clock rate on speed
> changes, causing TX to work but RX to fail.
> 
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 386)
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime



