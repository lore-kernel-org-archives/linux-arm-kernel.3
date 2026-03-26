Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5548710A88FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7UKezHTYAPqledPGUEh2DO5MGs9hcwA+U9WoF1npkM=; b=cml5XoM1LWSceCzQherlnCfJAt
	BbIo6b1kVCT3IW+jbc1a7qt6IIvfQ1yUGynVD+P36Qd8jNp5/n5kzO2+txV9sAOYmTWEX6QAILFQd
	mAQ9sVXx2A7/G5yyMsoiHnLkVSXa4l2820JFqevmDLPJ2Uo1GV6IwuHcdq+lo8LvnLKZtNWoiGZWF
	bCixfxkvSpbzBlSZq+pEnAm37lrj3L7WmVk7MuKbtHkA/Z6NLcNemLqjLnYKSMA0/D7RyHLl8wYE7
	s2aJ8o4ICGoDADF5eDkJP1w7SA3v3qWSV//dgyPZiNT/D36Y7aHO9FIbcwdK6JzYOXfuMVkwoHtPW
	Qdqr8eBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5p9x-000000060PL-3X7M;
	Thu, 26 Mar 2026 18:10:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5p9v-000000060Oe-2SJ4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D7UKezHTYAPqledPGUEh2DO5MGs9hcwA+U9WoF1npkM=; b=qgJYzpCR7jCviujwEpZ0vv2vUF
	oxcFOACz5qSYZY/QQRwAwide7RZINgtbvEdKCebe7OUAUAo+e2poBx9eYb19KuV8uLhnUiVaLVELH
	QUAjK+E21l9asVws7NVaNBm75aKcthHu99WY9el+y++etD0SHfhZm3HN0+vQnPPTd8uB0LO9LZAUH
	giNrseuQbFoDjabUnZAiZNcYsep3qxXzKekLjeMLao49bqNPY7EDx65pAdw3u4Mv4SyHimrz4nbRa
	4bT1eDcMFca1gLonlXQEhCKThWwxDzGzxX5U8ptEQWHvMqDQh2/lZW/6cLK8VAevQJhXaXWjVPXDX
	7XvO9bhg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56258)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5p9h-0000000058m-3Fmw;
	Thu, 26 Mar 2026 18:10:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5p9d-000000007Fh-3HE2;
	Thu, 26 Mar 2026 18:10:01 +0000
Date: Thu, 26 Mar 2026 18:10:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
	Joy Zou <joy.zou@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: provide flag to disable EEE
Message-ID: <acV2edMExFP0i8TK@shell.armlinux.org.uk>
References: <20260325210003.2752013-1-laurent.pinchart@ideasonboard.com>
 <20260325210003.2752013-2-laurent.pinchart@ideasonboard.com>
 <177454628933.1078312.13488207016388509694@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177454628933.1078312.13488207016388509694@ping.linuxembedded.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_111019_622705_F1A0BA67 
X-CRM114-Status: GOOD (  16.22  )
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

On Thu, Mar 26, 2026 at 05:31:29PM +0000, Kieran Bingham wrote:
> This one has been a roller coaster, but I'm glad we got to the bottom of
> it.
> 
> I hope someone from synopsis takes note and and documents this for
> future silicon integrations.

I would say that it _is_ clearly documented in the databook. v3.74a
4.3.4. LPI Interrupt already states that this signal is generated in
the receive clock domain, and is not cleared immediately after the LPI
control and status register is read.

It goes on to state that this is because the signal to clear it has to
cross from the CSR clock domain to the receive clock domain to clear
the signal - and states that it is at least _four_ receive clock
cycles.


So, if the dwmac core is operating at 10Mbps, that means its receive
clock is running at 2.5MHz which has a period of 400ns. In this case,
the four receive clock cycles to clear this interrupt is 1.6us,
assuming that the receive clock is running.

However, if EEE is enabled, the receive clock comes from the PHY,
which may gate off when the link re-enters LPI - and this event is
under the control of the remote end, not the local end. So, what this
means is that even though it states four receive clocks to clear the
lpi_intr_o signal, that doesn't necessarily mean it will clear in
1.6us as the receive clock may be stopped.

So, I think it is clearly stated in the databook already, but as it's
just two paragraphs buried in around 1500 pages, that may explain why
it has been missed on iMX.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

