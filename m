Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD781C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOsTTbEIKnn1lDtoP6teYS5Q0yZvLkrVNJM/olKSH7k=; b=BPGilZbbm+0To8nw63h//2SAs9
	ZKedFJuyiaGrYVsvkchCuefAlAWQzSnAMhatkZubEx9Fj4K/yafdlfBdqdazPs4ZjIM94LeZwpgcV
	GVHCifBSpF+m8Lx00ypzKktvMUAF/0ksUm7Lf4nRqcTwdgryBSOPFHMaj6PWBeO7srPEvefHBTG4V
	E7QFZMqe66we55+6MZvCQq/0/IN1eoqcSuFofVr2p+D7c1fXywbBZrplPxA7xfpOpJ/ZfPGk2ZukW
	57rZIe+bXG18ULMpbfHKxs0DkpOxtz57PM6gy2tsGVA/KsxTTnY8/qhwkpTzp15shcQ6LL2Q1Ye0d
	uEzeGRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffte-00000003Shw-1TD2;
	Wed, 05 Feb 2025 13:56:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffeQ-00000003QDm-0LXs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=KOsTTbEIKnn1lDtoP6teYS5Q0yZvLkrVNJM/olKSH7k=; b=YNoCbh/gQzaJXTVK1nvNKMKdZH
	oXak9XhkOMn0bamyCWNj79BUdlQcHbUOzOHLYZlGHbPFRk06jS5D06HNAQNJQfw1L6EYhHyq3dYfh
	lynLLUSvvpc1Ybp41sPZUZEp1rYJpl5IW4IF4lRz/t48jcmNaMgiHNgGfj0EV1A0BtMuCd3nHL/Qi
	GHHzTUxnoOXXDecUUnomLEqMxqFYrQjHJXfjrBXXN75vkXx9B3Sr0gMuly8URCdEge241WT/gwTyE
	wLK0IrD3MFkagboIw7aZvV16MAi35b7HcLxiNP20pdkgNl5URNo4E9lPk8bhW6fjo+YFuLQqBrswr
	6WuHoAxA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffeN-0000000GeX7-1S4j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KOsTTbEIKnn1lDtoP6teYS5Q0yZvLkrVNJM/olKSH7k=; b=IJ2npVozHdBW7wFfF/cXSeTTlK
	MbS8ruqyb7O65yf/gA6tmVKBBa4Wd9H84YXRY+ngAlhEXyKOAsVuLsPBCopFqnAF/TTnhpQJGU8z7
	AprkCqpBKOT1b2aY2r6m1D6QP/jQJhqrfcbsdyvwkpuV5Ki5HMW4GSjSaIYo8jwlL3eQDyQsAnbHC
	lkX5VDyHOal4b4zezBXGiaKbRWXf1z+UqDujrdGgq7lAMOerFEl+B4VHPIOYmf4VO0XvzPyZOjfrD
	iJGGLiQwidLLLx8LeqCqmpsq8Mr6DRtH082/uVylJ2BfgQxUswi3kijn5jUWqEHtZw3l6KJfXEjld
	2b8oB4Hg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60668 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tffeH-0007Ch-0N;
	Wed, 05 Feb 2025 13:41:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tffdx-003ZIZ-JQ; Wed, 05 Feb 2025 13:40:41 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 12/14] net: stmmac: dwmac4: clear
 LPI_CTRL_STATUS_LPITCSE too
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tffdx-003ZIZ-JQ@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134107_518861_23B46141 
X-CRM114-Status: GOOD (  10.16  )
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

Ensure that LPI_CTRL_STATUS_LPITCSE is also appropriately cleared when
disabling LPI or enabling LPI without TX clock gating.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index dc2d8c096fa3..ed42e1477cf8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -410,7 +410,7 @@ static int dwmac4_set_lpi_mode(struct mac_device_info *hw,
 	}
 
 	mask = LPI_CTRL_STATUS_LPIATE | LPI_CTRL_STATUS_LPIEN |
-	       LPI_CTRL_STATUS_LPITXA;
+	       LPI_CTRL_STATUS_LPITXA | LPI_CTRL_STATUS_LPITCSE;
 
 	value |= readl(ioaddr + GMAC4_LPI_CTRL_STATUS) & ~mask;
 	writel(value, ioaddr + GMAC4_LPI_CTRL_STATUS);
-- 
2.30.2


