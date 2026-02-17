Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB22FE68167
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMUyK88Ci65xMko7DWzpjT6//mZNMIUsO3M43v8AE0U=; b=Jf+Q/BbS4LET9N1dgLFeDGnNYP
	+LA69eaLgq7ZRphnQRsc1NHQ3EXcZSWBecl8QJ1OgrM+5Ovn+cvSR/2iUWOVzqMg+W+KLtTbd9lMj
	T0s7voPpbVlT6CWxcpAZhAbvupSrCroUMHPuVLeKhAAflVCZ5+zGKg9bKULZeJS5TUk4SBpufkJey
	Hox62yybjoDFinVoAG7keJi70gbzd7e83r8d08MwalJTy/86bOwhThT26QhIIEqYSTZ2JbcqwkFK0
	VN99wgxzGDar3tb9gFIOJel4oVPE2XTNVrCKlIEG3HPCAK5WGHREopU7r6nZRy1G1NIDMaPA9wJr/
	N2UXddGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsICz-000000081CN-12KX;
	Tue, 17 Feb 2026 10:21:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsICm-000000081Bs-28IH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 10:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58F8060126;
	Tue, 17 Feb 2026 10:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901A1C4CEF7;
	Tue, 17 Feb 2026 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771323679;
	bh=nMYlB6mUz5sDcuGpH56QRUMJMtqJhSaGockFEPLWdMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkoE9j9KHbNrGTrndFzyjoJvaPqvLr0OZT62+8iL4EAvfV5M3qkF4fnCubvw9ggpD
	 Cw5m4WeuIiQfAqt8V67QEQl1CzjpDZK5Oo/Af0wbKoe6o4zSzM+0w2RxwOeRw2Jlb8
	 uOgS4NRrqxZQEMuZojmApE+FV3H+FLDjLnzE4jRiIreaqoBahmQvEaU7fSKi1yJEtc
	 lV85cvpvWyIme+Hx6p/jQZaIYH+YOuNJ77Ey1v/bUnNm6X6LSU5zPmwZfpcYOSoGNA
	 YCfrp67I/2i784MMV+kALIVyYx3DpqKUVNINDHgn+zSPE3t10PWv6MvNw+yoO2rZ3c
	 2bhQlM0JNuR5g==
Date: Tue, 17 Feb 2026 15:51:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aZRBG0h0HHSjc7tE@vaman>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <aY95qbcG2BLGVzHy@oss.qualcomm.com>
 <aZM60XiDOrgxHqeA@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZM60XiDOrgxHqeA@shell.armlinux.org.uk>
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

On 16-02-26, 15:42, Russell King (Oracle) wrote:
> Hi,
> 
> On Sat, Feb 14, 2026 at 12:51:13AM +0530, Mohd Ayaan Anwar wrote:
> > Hello Russell,
> > 
> > Things look pretty stable on the QCS9100 Ride R3 board (with the AQR115C
> > PHY). I would like to test a bit more and should be happy to provide a
> > Tested-by once that's complete.
> > 
> > I may also get access to a board with an RGMII PHY on Monday, so I’m
> > hoping to verify the changes to ethqos_rgmii_macro_init as well as your
> > patch from the previous series (“net: stmmac: qcom-ethqos: convert to
> > set_clk_tx_rate() method”) soon.
> 
> Looking forward to hearing the results, thanks!
> 
> As you seem to be fairly active with the qcom-ethqos stuff, please
> consider adding yourself to the "QUALCOMM ETHQOS ETHERNET DRIVER"
> maintainers entry. Thanks.
> 
> Vinod, are you still actively involved with this, and if not,
> should Mohd remove you from the entry for the dwmac-qcom-ethqos
> driver?

Yeah I am not doing anything in this area, pls do drop me from this

Thanks
-- 
~Vinod

