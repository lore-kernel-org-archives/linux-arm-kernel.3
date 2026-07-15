Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ED5C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 05:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMQq0jJEQshTzjxnb1XfDCm8LASdaJ7clh2uWi+5Tsc=; b=119sTbyT6bR35lT7urHP0oQ+n7
	EDpFYDLfUa0FfuFIk2Zar2X30RpsXCJHIig8OTvT9RAgZyN8Kv7hazdxMX1X7J6nBg3zA3Z7I/Qux
	i3mVFUAODxoIvvbgyOGI7BHPt3EDmjXORs4I0uzxpBDasEODZNZgVFxlRtIxUar30UXd0ktN4Mrza
	e23wHoBGxGXJJFD+hJIChSzD7whWkazAuTKy3KAuvmCMnd153/s+HZo2rZy2Vwv6UdJ7jcRXoGXLQ
	BegGi/oCd8AyQTsrnWQSBBxqDCd5pr2ASfl6jGWn/9SGAqO5YH7Z8VtHRs4uYsktGKy8d1QGjzl6n
	e7T+ebTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsMo-0000000Dp4R-0yaL;
	Wed, 15 Jul 2026 05:41:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsMm-0000000Dp4J-1sBt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:41:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73F17600FF;
	Wed, 15 Jul 2026 05:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26371F000E9;
	Wed, 15 Jul 2026 05:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784094067;
	bh=hMQq0jJEQshTzjxnb1XfDCm8LASdaJ7clh2uWi+5Tsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AH4aTfvDY5e8DVBk0K2mX2cWVmPb+J7VHhpunZwIEDTNnFrO5WVUXGGmcFU/dQ1Ke
	 Yj9YWaZRJsivMAhj0+0a+C/cbDat6h1jV++jjlpXYlSUVn1KB98ZxUyV8IXI9T1GCI
	 2B2lhwXSZ8DCodJEu4Bcn1X7X0Rt2kj7F07FT9hjlOzfQQpkECoKE3iBz1PeWlWPOl
	 kR9tng4/1i/fHV6IcH7KzySOPRYBjnyY4G0LPykQzJJrHpWfFyBuYTlkNIe7V6n/fR
	 ruWs+8DAhXYmuYYfCqAfrk9Dk+0RDmgHSjSFCSrnge7TGpH0pm5L/Ti3t79QK6YIWY
	 nFFuiD6yTZrIw==
Date: Wed, 15 Jul 2026 07:40:59 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Soeren Moch <smoch@web.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, stable@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: imx6: Keep Root Port MSI capability also for i.MX6Q
Message-ID: <6ayf4vt5wiftgz4myxpyze2wmmuxf5miakq6ffz2k3r6beiztu@lh5z5zjnljad>
References: <20260427115804.134231-1-smoch@web.de>
 <2cbqhvfjszzuanp4i3rohntkxpfgftfjvzt66te3wkohsvw26g@yv4txuy74tvu>
 <465b1dcc-8e96-4edb-aebd-52937b8076d0@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <465b1dcc-8e96-4edb-aebd-52937b8076d0@web.de>
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

On Wed, Jul 08, 2026 at 10:52:22AM +0200, Soeren Moch wrote:
> On 06.07.26 12:29, Manivannan Sadhasivam wrote:
> > On Mon, Apr 27, 2026 at 01:58:04PM +0200, Soeren Moch wrote:
> > > Also on the NXP i.MX6Q chipset MSIs from the endpoints won't be received by
> > > the iMSI-RX MSI controller if the Root Port MSI capability is disabled.
> > > 
> > > Even though the Root Port MSIs won't be received by the iMSI-RX controller
> > > due to design, this chipset has some weird hardware bug that prevents
> > > the endpoint MSIs from reaching when the Root Port MSI capability is
> > > disabled.
> > > 
> > > Hence, always keep the Root Port MSI capability for this chipset.
> > > 
> > > Note that by keeping Root Port MSI capability, Root Port MSIs such as AER,
> > > PME and others won't be received by default. So users need to use
> > > workarounds such as passing 'pcie_pme=nomsi' cmdline param.
> > > 
> > > Fixes: 3a4e8302e72f ("PCI: imx6: Keep Root Port MSI capability with iMSI-RX to work around hardware bug")
> > This is not the correct fixes tag. Correct one is:
> > f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root Port if iMSI-RX is used as MSI controller")
> Thanks for the fix of the fixes tag!
> > > Cc: <stable@vger.kernel.org> # 7.0.x
> > > Signed-off-by: Soeren Moch <smoch@web.de>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > @Bjorn: Can you merge this patch for 7.2-rcS with correct fixes tag?
> I can send a v2 of the patch if you prefer.
> 

That'll help.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

