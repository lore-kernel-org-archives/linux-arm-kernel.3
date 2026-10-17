Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDAACCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPPCN5mO1w9ljF9Wewa/F05O38JnxffoK9c7OCDPdwI=; b=SaLNudzmTBqAzbD6ePxzgueLgw
	nyD5yDkzG77HH7IVbT3oFcYPL0aYpa2JEBbC2Ds+rr+8XkZbzqQOC4Vw6lk5lS/jdRqWB4G+SXBHV
	y1AHZg0cUsekvv70XfSsEGeMfO9qttjOyP1J/ulOihKWOjz7AQpVSMW+ZMnjR9u6MNphx5IroKQ/5
	6KUZ6aBkx0dU7cIJ/zNsVrGDiV7Ij7EPEJJ1ztM1Axgtv5Fb1o2yOWDyLHcTNN7w/kuqxyxXVrUEI
	DWZxbGkc9KoapPTAnQi7jOYLGczMPIq5S4ZDmVEByGSRlrDkJ17k/THWU5XT42iaCKbVRQTWoEGV1
	js3PvF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI4xr-00000004oC5-3i1K;
	Sat, 17 Oct 2026 14:00:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI4xo-00000004oBI-0dVb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 14:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kPPCN5mO1w9ljF9Wewa/F05O38JnxffoK9c7OCDPdwI=; b=2AJaWJDCmKW2z+q+w+IGEntZex
	rskd9a5dnoDIOdMUm4q+BnYJHTkH3NQDH0+tjjCpPfLe3TkWq9D24bDIN8OIQUsDaNz/ObcdIo3MX
	Ue0lGo9mnDgom207txtLgENg17p9iUjaxC7PjyEwTADUHoHyASdYMF3GSm7Xmef0vpNU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xI4xY-00BKLE-0O; Sat, 17 Oct 2026 16:00:28 +0200
Date: Sat, 17 Oct 2026 16:00:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 4/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Message-ID: <17aea8bf-490f-4006-880f-1999aed1df59@lunn.ch>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
 <20261017-shikra_ethernet-v3-4-26a8beb44b8f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-shikra_ethernet-v3-4-26a8beb44b8f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_070044_299876_5A3E9F77 
X-CRM114-Status: GOOD (  11.97  )
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

On Sat, Oct 17, 2026 at 03:15:15PM +0530, Mohd Ayaan Anwar wrote:
> When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
> the MAC must not add its own. The driver currently falls through to the
> generic DLL initialisation path which programs it to add a delay.
> 
> Power down the DLL and set DDR bypass mode for RGMII_ID, then program
> the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. Also fix
> ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
> 100M/10M, and remove RGMII_ID from the phase-shift suppression in
> ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

How many different boards have you tested this on? How confident are
you there will not be regressions?

Since you are adding a new compatible "qcom,shikra-ethqos", you could
limit the change in behaviour to just this.

	Andrew

