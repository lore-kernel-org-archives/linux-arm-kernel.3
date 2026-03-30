Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FC010D14AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYBKS7dt5j38ighh50PUCkRqON2g0NPUuA+55y0x1ts=; b=oyu3K5SFbgB4uPQtjcDgbdUVTY
	4U8yIQd1ux1DPf5VjgBJRoyWyRU4wmhB7KskQImD7mFrRgQAgmYM7Rr4o3haWqky+l2V9E1w9hEKF
	scVYiw+eM/FAW8Zcyt9oeQHG4D+Qi8Dijw3NEgFrqZJDVV0BijkSeqvQhNeGhjT0hXmsRgCGkZz0q
	zjQaixwuPaq9Q2j+PO60LACE354/MzU3VtAV8lsUZ1sPVQKNqm6tECjYi8yoSQEZ4/vRx34hBMnSk
	GlREXkgC9mO7xE9JeZaEiKSW0sZX0A52ycEvx2C268L/Rp8IJVrxTBNeQHlVOixLdtpv1N6eYFwYh
	L5xgzVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BqZ-0000000BGh4-0A8F;
	Mon, 30 Mar 2026 12:35:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BqW-0000000BGgU-1BCS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wYBKS7dt5j38ighh50PUCkRqON2g0NPUuA+55y0x1ts=; b=1SkUQbL6OFfy1tSZ9NRgzdUTff
	nx10vqYDxRH/htdOaPiVosjSKdhM+qxPyDPb/ZeO7l4XS0kH0sLr7vfDRKQspBuuHzII56mZcUeVW
	pPYw7YPK1B530+BU4J4hpwSn8/TEQjcj6IM/G7WUTz09DeLGTvMLc3ou/fsCMWQZ6JEE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w7BqF-00E1x8-5E; Mon, 30 Mar 2026 14:35:39 +0200
Date: Mon, 30 Mar 2026 14:35:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <0d650de4-eb45-481b-8c39-1bf455b948c9@lunn.ch>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_053556_439689_ABA8D4F6 
X-CRM114-Status: GOOD (  16.59  )
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

On Mon, Mar 30, 2026 at 01:20:18PM +0100, Russell King (Oracle) wrote:
> On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> > On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > > their rate. According to hardware documentation, the clock which is
> > > fed to the slave AHB interface can crange between 50 and 100MHz.
> > 
> > FWIW this __may__ possibly differ between platforms, but I'm not sure
> > to what degree. Will there be visible impact if we e.g. have a 200 or
> > 300 MHz clock somewhere?
> 
> When you add other platforms, you're going to have to deal with their
> differences.
> 
> IEEE 802.3 states that the maximum clock rate for the MDIO bus is
> 2.5MHz. You need to ensure that is the case.
> 
> Current qcom-ethqos code doesn't set clk_csr, and returns zero for
> clk_get_rate() on the stmmac clocks because they are managed entirely
> in firmware.

Could a fixed clock be used in DT to represent clk_csr? Different
platforms then set it to different frequencies, to represent whatever
the firmware is doing.

    Andrew

