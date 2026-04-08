Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60C7105D98D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnhKaayKX2ym3axLouWbyDpq6J08FaMtPXyF8+AIVRQ=; b=OH9x0aBK/LTkh3/sFspFcziISb
	8bfrtJpLhH/YCfRZAgl0QBAMfsNfi6q8YdqvS2uP3/mC/IOBKmvd3SLUoTi5UvRkOaUM4GLm8J6I1
	cHQZZNkFvUYku/QCwJUjsT7NIFGB1f97xQI2hZj+u/Axg//KmwNIUbg9EN/38gTMft1CZegHx3SSe
	fwOk3rd8ba6PmNqX43BAWWBPUXUPhjhgAET9OPoRSfA0qyN19IazkUG6yRfeI4mz34JEyIMSxHqbu
	s6SWMZpLH41vLbYYg+QucZriIzCuWav01/0K7ZHTPENprdZhYDw/PcTilb5XIl+eqkDhrEBXEdDWZ
	fLLrZnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPC9-00000008bg4-2RgW;
	Wed, 08 Apr 2026 09:27:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPC7-00000008bck-0zQK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NnhKaayKX2ym3axLouWbyDpq6J08FaMtPXyF8+AIVRQ=; b=C8O2NmSYhN3gcqt/4N8/XEsW4/
	6LCi4AVhCwL+VBVW4gwYUj7fvUauUkWoYfqxGDbxBLMDaF57h4rqm+1+CN+5OPVdYa0LrLiaXYg/a
	Zh/Rzp2NsVCy/qCU0GbjKtTumihSgCbkR2FA2DVXU7izrvjcbzAHc4yVqNTDAbsBU+wx8abvr1g9c
	svIr2MjF+6UpTwuFCZkeUUj1wpxhNJ26N0HoCtRU1DLE0huxLLgpHYeVIu4f7s8JLhxvf2lkJ3jzX
	+NVhjrfz1Sz9EQAPqrE8c9Bp4+zxHF8ndkUpEKQ56tlcNxVq/m/BE2ypKPrX5OvGhVfruBO+RQYVI
	yz2fA7Ag==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35142 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPBd-0000000023B-0iEH;
	Wed, 08 Apr 2026 10:27:01 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPBW-0000000F7k0-2Dr7;
	Wed, 08 Apr 2026 10:26:54 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH RFC net-next 03/10] net: stmmac: always fill in ver->userver
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPBW-0000000F7k0-2Dr7@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:26:54 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_022731_281091_87ECF87E 
X-CRM114-Status: UNSURE (   9.94  )
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

Always fill in ver->userver irrespective of the core type. This has no
functional impact but tidies up the code by removing an unnecessary
conditional.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 830ff816ab4f..aacf78d4a2ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -47,8 +47,7 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 		 FIELD_GET(DWMAC_SNPSVER, version));
 
 	ver->snpsver = FIELD_GET(DWMAC_SNPSVER, version);
-	if (core_type == DWMAC_CORE_XGMAC)
-		ver->userver = FIELD_GET(DWMAC_USERVER, version);
+	ver->userver = FIELD_GET(DWMAC_USERVER, version);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3


