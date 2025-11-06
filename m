Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F85CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lrxCokjkJ6fTXIXnxlneNHLsLi1qKTxMMtfg4QSt57I=; b=CwicsNM1fELPQb3uyYBGy8CBcv
	ynZe8+0OsYNwasI1ehJSdCFz1USG7SQG9upseN6enk9lzsLJyyUmL9JyRfVRF9cURmCXqh5zfMqv8
	gRddQE09++TNXneeL5TnPb4wTYQ9mw2czV4QVaEqO7A0ZSJbiwa1pVkDQ6Z+dwC4FwITIYuwsXlfK
	CmRHn0WPrmZ/wQ/6I6i+SSE5kou+wv/SS94G+0iXvFyYYTX9zvIucMjYAliGaFRLfDMtZ8HYyCkRa
	MMLPdMWW5wGvFzgKyncE7NCiKWzAIXRl3I90rCDFKaCunIQgO47hYJI2xFJRsQLWIL8vH1YKY5aC+
	JCmQyFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvn9-0000000F5vf-19Na;
	Thu, 06 Nov 2025 08:56:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvmx-0000000F5tB-3R7D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lrxCokjkJ6fTXIXnxlneNHLsLi1qKTxMMtfg4QSt57I=; b=BLuqw6uV56c8CdShAuoJaVnqWA
	sWXyMjW+IWjZz7DfX5FnUt9EEE5Y7lmq+R34mrMofiqZSem+Kg7UZTn8ZSrZgQK/MWJJXGczHxd2o
	YWZ7bMIwfVy1br90DIegN0EfFcG3vYg1IHA+6iMhFaaTeCgaHMCBFduNQ0XZ8JoJGjobDy2CbQMh9
	2/059E6JZE8aR48vplbta5ZrTn5ob/pMeE4F4NBCXOXwisKRV3mVp5U0zN014h9gStKi8jWRg9tnt
	fbHx7curmhAlWegLCYye0m/gSxeaUUl6nvhJ+ayFU2zYjMdd5OIJONBNNEeHYsTVSSS7BbVFe3xP+
	MJbS/b+A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50478)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vGvmi-000000004We-0pZS;
	Thu, 06 Nov 2025 08:56:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vGvmf-000000006WQ-0BLg;
	Thu, 06 Nov 2025 08:55:57 +0000
Date: Thu, 6 Nov 2025 08:55:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 00/11] net: stmmac: ingenic: convert to
 set_phy_intf_sel()
Message-ID: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_005616_199048_CF21B435 
X-CRM114-Status: UNSURE (   8.52  )
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

On Wed, Nov 05, 2025 at 01:25:54PM +0000, Russell King (Oracle) wrote:
Convert ingenic to use the new ->set_phy_intf_sel() method that was
recently introduced in net-next.

This is the largest of the conversions, as there is scope for cleanups
along with the conversion.

v2: fix build warnings in patch 9 by rearranging the code

 .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 165 ++++++---------------
 1 file changed, 45 insertions(+), 120 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

