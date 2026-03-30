Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30A810D14AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neu4ARCwcfoinhz170R6LNmDJUciz9Vr0r4/+mMh+SI=; b=Adx68S5qDGp0/u4ko63beeH7xW
	udCzxFFlU9qf4cJcJwe/slRp1NyIqYyIu6ek97XYrk69iYsASKMnCYmtO3GafV1SQo+YChNwRXnSg
	ysZ8AcYSlfYk12QLehqEhmCBwjqppiEd2z0ngjy+Mar5WcKxMpleilI0tfQRUhCVH7jyPQS4eJt94
	z//lJ0FvmGNRAt0XPPpoblMAK/ZJXPL7H0IuQbZcBV1WSsYQ00YiXEgb50vKJu8hDrIAe01OYBlLB
	9hX5LrFpE7l2u+QBoWC3GVI2U6GTrFgcQr4fl0yV8RKFaFg9OXLzecFbxXuuOD1Cfr5o6HSbIxVR3
	ASoLVTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CZK-0000000BLV8-2QEN;
	Mon, 30 Mar 2026 13:22:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CZH-0000000BLUB-1GKC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=neu4ARCwcfoinhz170R6LNmDJUciz9Vr0r4/+mMh+SI=; b=0gEg9KebiJm2KpoeNAh/J7egLy
	BASIfKM3/qG1q4MpPqWRIHSzKy9xyMNPDWm78WnSMZQHQ5amOmm4E7FCwK1OH2RhKPSFIGrCJDegJ
	VNQvnlysdvTZ7Zij3PesRxgZ9MNE+EsosQ0lwiSbLPbwzzZVYXsH8+Ld9WIyGpyQkMshGlkwiJDso
	sE/9KiMQ3U7uxLxH9wU/2uVOz3NHe1g/62zeUA+mWGV3o2CrrBV1maSW9o3nhJ+9BnT0K9KkNPcx8
	RyxMeayliIB1F8xfFm8dxKdM+fY0s4ZMADAOoODFmPJjP9o5dwb9D8VSNBT48GQSUdUTEsjNXEQqM
	zNjCqXyQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35698)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w7CZ8-000000000X1-3ZfD;
	Mon, 30 Mar 2026 14:22:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w7CZ5-000000002hc-2jMj;
	Mon, 30 Mar 2026 14:21:59 +0100
Date: Mon, 30 Mar 2026 14:21:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
Message-ID: <acp490PTrVCWjiqT@shell.armlinux.org.uk>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
 <0d650de4-eb45-481b-8c39-1bf455b948c9@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d650de4-eb45-481b-8c39-1bf455b948c9@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_062211_355621_39BFC3E9 
X-CRM114-Status: GOOD (  21.48  )
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

On Mon, Mar 30, 2026 at 02:35:39PM +0200, Andrew Lunn wrote:
> On Mon, Mar 30, 2026 at 01:20:18PM +0100, Russell King (Oracle) wrote:
> > On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> > > On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > > > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > > > their rate. According to hardware documentation, the clock which is
> > > > fed to the slave AHB interface can crange between 50 and 100MHz.
> > > 
> > > FWIW this __may__ possibly differ between platforms, but I'm not sure
> > > to what degree. Will there be visible impact if we e.g. have a 200 or
> > > 300 MHz clock somewhere?
> > 
> > When you add other platforms, you're going to have to deal with their
> > differences.
> > 
> > IEEE 802.3 states that the maximum clock rate for the MDIO bus is
> > 2.5MHz. You need to ensure that is the case.
> > 
> > Current qcom-ethqos code doesn't set clk_csr, and returns zero for
> > clk_get_rate() on the stmmac clocks because they are managed entirely
> > in firmware.
> 
> Could a fixed clock be used in DT to represent clk_csr? Different
> platforms then set it to different frequencies, to represent whatever
> the firmware is doing.

Unfortunately, at hardware level, clk_csr isn't a separate clock input
as such. It can be one of many, depending on the synthesis options
chosen by the designer. It may be hclk (AHB clock), aclk (AXI clock)
clk_app (application clock) or a specific clk_csr input.

Nothing is simple with dwmac. :/

The problem with adding a ficticious clock to solve this is that it
adds to implementers confusion for what is already a very complicated
problem.

We've already seen that the stmmac clocks are a total trainwreck
because no one seems to really understnad what is what, and that goes
back to the days when that "apb" clock was added - and that made the
situation worse not better.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

