Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68A3C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA940mkLL9KHlcuBfwiSIb3vbphWe9IhllR+VjD8CvI=; b=arrYcV3FhmDtVT2K40D1uXo5uV
	93Vrk8xsw3w7c63HsDqZ1NTCLdacgR0OM22m5YbpsSMTpF4m4s6Jy9arZl5mvNRn1en5tVfdBl3DP
	+y/XjgJ2S3USpSlYQgOm7p/NQ0Tgwmb1n/6Jll7czBX3SBhVQxs0hLYB8kHkqGPqXwzNGPbteSsWB
	3Ppoq0o5C7OUpxGsKl0Uc4K6jyflfiwNcOdAwpg22lJMdMKhRLkd0punC4QRmj1rR3+GXIpGeTZCQ
	uRUAwvVxfYFy4k2e2HGXFSfVcuQh84ejlQ2F3KW8hL4xEdBVl3MPKOEnzPqNPhrZZgqnHJRdL1LPI
	u39Ode3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taDt2-00000007vQu-1sXQ;
	Tue, 21 Jan 2025 13:01:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taDpg-00000007uu5-3SfU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 12:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uA940mkLL9KHlcuBfwiSIb3vbphWe9IhllR+VjD8CvI=; b=mdoYhlVkty1GpM8FmQVp5QiD8B
	Ey/KgEeTwABBdYcLZ8oufPHyJNj06JsuXdwDZ2At1jFQYoY8NSrNxToQMKjJJgXDVmAte4E5SWw4j
	/PwfJf345eUnb/jLHwSizUujKKl1TbDiLYZ6wB2+ZT7TPBSNq3R/ozp9G9Wa7k7zovVTx6XoIFOFA
	a6P2hkmZ+NpyKk1TU2ThKzoUm4aDcZzWLwM/L92ii27ehWKOJlgO+d9B64cqK0IP+3Gq7cfxMCcon
	urxGSXPMgPVEoj5FX0zOmw9JlirdcMaDtjWzgNZAujqR3hMI7qoY8WW3vlSBsPqlLbRuvgalgAsJn
	OGHodGUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60812)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1taDpM-0007FN-2u;
	Tue, 21 Jan 2025 12:57:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1taDpI-0003uT-0r;
	Tue, 21 Jan 2025 12:57:52 +0000
Date: Tue, 21 Jan 2025 12:57:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yijie Yang <quic_yijiyang@quicinc.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
Message-ID: <Z4-Z0CKtiHWCC3TM@shell.armlinux.org.uk>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_045816_863472_16E77A41 
X-CRM114-Status: GOOD (  19.14  )
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

On Tue, Jan 21, 2025 at 01:47:55PM +0100, Krzysztof Kozlowski wrote:
> On 21/01/2025 08:54, Yijie Yang wrote:
> > The Qualcomm board always chooses the MAC to provide the delay instead of
> > the PHY, which is completely opposite to the suggestion of the Linux
> > kernel.

You still need to explain why it's preferable to match this in the mainline
kernel. Does it not work when you use the phylib maintainers suggestion
(if that is so, you need to state as much.)

> How does the Linux kernel suggest it?

It's what phylib maintainers prefer, as documented in many emails from
Andrew Lunn and in Documentation/networking/phy.rst:

"Whenever possible, use the PHY side RGMII delay for these reasons:

* PHY devices may offer sub-nanosecond granularity in how they allow a
  receiver/transmitter side delay (e.g: 0.5, 1.0, 1.5ns) to be specified. Such
  precision may be required to account for differences in PCB trace lengths

* PHY devices are typically qualified for a large range of applications
  (industrial, medical, automotive...), and they provide a constant and
  reliable delay across temperature/pressure/voltage ranges

* PHY device drivers in PHYLIB being reusable by nature, being able to
  configure correctly a specified delay enables more designs with similar delay
  requirements to be operated correctly
"

> > The usage of phy-mode in legacy DTS was also incorrect. Change the
> > phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
> > to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
> > the definition.

If the delays dependent on the phy-mode are going to be implemented at
the MAC end, then changing the PHY mode indicated to phylink and phylib
to PHY_INTERFACE_MODE_RGMII is the right thing to be doing. However,
as mentioned in the documentation and by Andrew, this is discouraged.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

