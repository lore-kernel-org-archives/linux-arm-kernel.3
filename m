Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B12CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kJLGfIEfFGrJAC0JRjmZE5WKb6oew5KObKNjR8npN9g=; b=vq0rJzWdlPsnNFJ9SOgcmt39NU
	YiB0NXQ+6MU91YkBwxjCH7sTiln+P1t0dOd/wh/egTuelwkUjdUH38aHq5cxN24GmMOAP8npb7kUn
	9KWtHr+vILypa3likBKeeq0S9sFO5KiOk6895KpP1o0EmNvKGvTnNUxHF+QvUzSrQuIMQGSxYGaIC
	r2swx2GWVKaBiLilA0HS8fQRbJh4pdWFyuzaHTokylmVc29mGu1TQqPSVitEdPI0k4Czllr1Oc51/
	AJh0F6lmwGDAQiHJ+pvadKj5OwV5Y048CDotlyYPc5EC0/RpE6Ptyw4dkWazl0iAOZlwT6kiOD9eA
	61P6rxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26s-000000095dE-16Xe;
	Tue, 09 Sep 2025 17:26:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1V6-00000008dma-2pMK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kJLGfIEfFGrJAC0JRjmZE5WKb6oew5KObKNjR8npN9g=; b=yrOY1zMkYw5fsZgw93IXW9cT+B
	WbH80A00t3FxrJDywWPIWfWuxuCuDa6MgOyYmO/vVIgTizqYC3UzLK4ExtCh9CMm1x2p6hTWEXn7P
	D1ZKUxl9uwdXTyejTCTp/r/Kr5JrZ2rO86w43xCyT5d10x5oDhNCiqHaS1f7Tlnu3ZWc+ifrJQvOP
	WIM3PqqGy3r6U0uIV9coR/O07xgJB0V3UqbP4MPZ0PQiFAM5vgPsC6D5nu9x7u5uRhInOh8OY4Ms0
	yzuNDhMK0GCaIlUF2KLZvcxsWnFDnPqJbq/PxbHI+7jaV+sMtJoyIG/T8mi+9lnPaeKy02NcIBpnI
	9A4RE2eA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37110)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uw1Ut-000000008Uu-21Xe;
	Tue, 09 Sep 2025 17:47:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uw1Uo-000000000aH-1unp;
	Tue, 09 Sep 2025 17:47:06 +0100
Date: Tue, 9 Sep 2025 17:47:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next 00/11] net: stmmac: timestamping/ptp cleanups
Message-ID: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_094724_715028_68E92CF2 
X-CRM114-Status: GOOD (  12.44  )
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

Hi,

This series cleans up the hardware timestamping / PTP initialisation
and cleanup code in the stmmac driver. Several key points in no
particular order:

1. Golden rule: unregister first, then release resources.
   stmmac_release_ptp didn't do this.

2. Avoid leaking resources - __stmmac_open() failure leaves the
   timestamping support initialised, but stops its clock. Also
   violates (1).

3. Avoid double-release of resources - stmmac_open() followed by
   stmmac_xdp_open() failing results in the PTP clock prepare and
   enable counts being released, and if the interface is then
   brought down, they are incorrectly released again. As XDP
   doesn't gain any additional prepare/enables on the PTP clock,
   remove this incorrect cleanup.

4. Changing the MTU of the interface is disruptive to PTP, and
   remains so as long as. This is not fixed by this series (too
   invasive at the moment.)

5. Avoid exporting functions that aren't used...

6. Avoid unnecessary runtime PM state manipulations (no point
   manipulating this when MTU changes).

7. Make the PTP/timestamping initialisation more readable - no
   point calling functions in the same file from one callsite
   that return error codes from one location in the called function,
   to only have the sole callee print messages depending on that
   return code. Also simplifying the mess in stmmac_hw_setup().
   Also placing support checks in a better location. Also getting
   rid of the "ptp_register" boolean through this restructuring.

Not tested beyond compile testing. (I don't have my Jetson Xavier NX
platform.) So anyone testing this and providing feedback would be
most welcome.

On that point... I hardly (never?) seem to get testing feedback from
anyone when touching stmmac. I suspect that's because of the structure
of the driver, where MAINTAINERS only lists people for their appropriate
dwmac-* files. Thus they don't get Cc'd for core stmmac changes. Not
sure what the solution is, but manually picking out all the entries
in MAINTAINERS every time doesn't scale.

Therefore, I suggest merging this into net-next so people get to test
it by way of it being in a tree they might be using.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 113 ++++++++++++----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
 3 files changed, 67 insertions(+), 57 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

