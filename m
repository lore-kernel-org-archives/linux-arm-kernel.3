Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9D9CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPLuj/xTIdlTADyQSmFwiDNGb2wswqT9CA7Ixd8e3JM=; b=J6iVAjlGytQd3vVV/jyRaX+c36
	XOSInUdpMT6T2DVfEEHHrg1YDq3/0NC12NM8/mzaRvFcuCpRBq/W9E5i8f3DA8oYVisWuGCjkA+E8
	Ftdy7bQFTJbui70dcQ4kguzHCHGSbSFbeooR1KQo/yXtvtG/S79KX4kGVlpOc581iKMCNmRAYnq2c
	sMqJAVNwqVsXR8Pa8FGldEqSupsPdzHfJ0ga60x8hBgMubNVFBlvhnn/5NOV0cqZL69AEwWKN/Zay
	9HFHl1gBL/5R9vRfOMaqWw7nQaxrsjsefn8SDsULjmONq5FVlz13yQ5PN3CLuc7vcNduXei+s8k+W
	CdKzAWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd8U-00000001xdZ-3EjU;
	Thu, 11 Sep 2025 08:58:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd8S-00000001xc5-1z8R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tPLuj/xTIdlTADyQSmFwiDNGb2wswqT9CA7Ixd8e3JM=; b=LWPQrx41+Rmfg6soc8oQ3DEebT
	bVi4OQPrsC+xG5p3CX+gQM//aAIc3Fnm7CMBogIaJolTkGVZpz2Pq+qCDdf6M9oASVduVjkTUMkDE
	tkqEKyQ4V0gmgNaLeX5b14pHDON4ar7eA4rlZSv0JkApnRdB5RIlEZRTj0D0s5cD2x/NFYbAvbAd3
	szZLZ1NVhaUdbLgJFt8OgaW3ECtv6UMA3JqySsjpdMqATN+8kKmDE9peKt/5dsZ6xXNmv93m5GeTg
	Hih91SSLoTQ4FYfTqr7bzcGsNJaSWHwmiZmVpQp+ElZ58lMPYeUOq0qVfZWAd/s5KzzoiEdSdGda8
	T5s8PQkA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55362)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uwd89-000000002hN-1Tq6;
	Thu, 11 Sep 2025 09:58:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uwd84-000000002Db-3VMI;
	Thu, 11 Sep 2025 09:58:08 +0100
Date: Thu, 11 Sep 2025 09:58:08 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
Message-ID: <aMKPIFmOS1riOajH@shell.armlinux.org.uk>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <24cd127d-1be7-42f4-a2ec-697c5e7554db@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24cd127d-1be7-42f4-a2ec-697c5e7554db@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_015832_517428_15EE7C59 
X-CRM114-Status: GOOD (  12.54  )
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

On Wed, Sep 10, 2025 at 06:04:28PM +0200, Andrew Lunn wrote:
> > +    ethernet: ethernet@7a80000 {
> > +        compatible = "qcom,sa8255p-ethqos";
> > +        reg = <0x23040000 0x10000>,
> > +              <0x23056000 0x100>;
> > +        reg-names = "stmmaceth", "rgmii";
> > +
> > +        iommus = <&apps_smmu 0x120 0x7>;
> > +
> > +        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names = "macirq", "sfty";
> > +
> > +        dma-coherent;
> > +
> > +        snps,tso;
> > +        snps,pbl = <32>;
> > +        rx-fifo-depth = <16384>;
> > +        tx-fifo-depth = <16384>;
> > +
> > +        phy-handle = <&sgmii_phy1>;
> > +        phy-mode = "2500base-x";
> 
> Nitpicking: It is clearly not an SGMII PHY if it support
> 2500BaseX. You might want to give the node a better name.
> 
> > +        snps,mtl-rx-config = <&mtl_rx_setup1>;
> > +        snps,mtl-tx-config = <&mtl_tx_setup1>;
> > +        snps,ps-speed = <1000>;
> 
> Since this MAC can do 2.5G, is 1000 correct here?

The driver only accepts 10, 100 and 1000 here. Not sure if that's
documented in the binding.

Also, does snps,ps-speed need to be set if we're not immitating a PHY
with the PCS? My understanding is that snps,ps-speed is only relevant
in that circumstance. (I suspect many DTS get this wrong.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

