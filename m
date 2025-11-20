Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D400CF8844
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UkLGBPuD+ixBnCg1mbudIHuw5SJRJWUumiTRns1X5cM=; b=WlSNg5J9ABQF7zPrYq5tojqHkj
	wBbtYQeSaiV8YnWC3hYyoFnNmCayJvgiUyK7DhbCaB2DsxlY4Cwz/O+7Xv8Xc9YJFj7RN4x5hga/4
	IDHYrY+3/8xzx5ArMQh8+PrLFs9zXmjxOKiTg2RhCXlmmR357statdJTfrJXIoCB1JnnD8gvZfhkE
	RvBtAEVDBZg9EvWgUbuMnmIqg7j3ayiA29vs0YDKJXUUB7mU87jlaEchQKGAtMVrJ7qPzOGvukABq
	dH6p10WOA6utYc6Qw9zj+m5O2Iri7OWOiK3SKxbBRhCZu7ojZcrOMBahVADAxK4jEc1IuEXPSTEi1
	Un0gxkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2mp-00000006ZMi-2Caj;
	Thu, 20 Nov 2025 11:25:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2mm-00000006ZLm-2y4I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UkLGBPuD+ixBnCg1mbudIHuw5SJRJWUumiTRns1X5cM=; b=vp0FG/ZSDnOUiIL9iiqoV5ayuk
	SJQEPugj2vrczSLx79vtXHFfQH1aGPfaIPWQ1wgAHiwqKRAw+wuYHEXtmOx4hbpRZrkGIb4ue43uq
	AcSbL9nNO79PNgBD6VL6ZjmTg1vDdbZ56TixNQehTPGDew1eDz1zDTTbS4UdTjKj8druki9UBzMTk
	UbO+nznjzrCIv+Ac2tO1V+oDPfU11k1iZvdGRG8rAWaaf0RbFA+15B/fv/eAeF+/zw+s9jbQLEzi3
	mdkB4sefXGAj7CAnb7qu6vUOTJRTW3SylPRQ7OUE1rRxr218Et5c+JbCqolBbAA8B5hWBdIjx6l6L
	4H5rnRLg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60982)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vM2md-0000000067m-2B0R;
	Thu, 20 Nov 2025 11:25:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vM2ma-000000004L9-0XuL;
	Thu, 20 Nov 2025 11:25:00 +0000
Date: Thu, 20 Nov 2025 11:24:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 0/3] net: stmmac: qcon-ethqos: "rgmii" accessor
 cleanups
Message-ID: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032513_028688_066577CB 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

This series cleans up the "rgmii" accessors in qcom-ethqos.

readl() and writel() return and take a u32 for the value. Rather than
implicitly casting this to an int, keep it as a u32.

Add set/clear functions to reduce the code and make it easier to read.

Finally, convert the open-coded poll loops to use the iopoll helpers.

Note that patch 1 has a checkpatch warning concerning "volatile" - I'm
changing the type here, and the "volatile" is removed in patch 3. I do
not feel it is appropriate to remove it in patch 1.

v2:
 - remove double-spaces in patch 2.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 245 +++++++++------------
 1 file changed, 110 insertions(+), 135 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

