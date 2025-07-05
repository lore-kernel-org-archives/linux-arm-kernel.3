Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1200C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gUxV6pA57+To6oAAbEw3sb2f+yo4OLBd0+58moNIukU=; b=Tf+xMEH873SLRJJ4gNudUjCMA1
	o5ecJ4d+vcsiHb1FuvoCHWwGye+jrKm6SJgv6S/oBDabCPkBmET+IxHD0lrkZLOHSR5KCVFox6z7i
	Q6zc2ytID1u5uCR0Ux0uZV0tPSYPP9tvB9x5gSJlPVeBglydXb0NSPLjG8HAaEJ5r15EDhvJhUnY9
	AqnoKeY8OxkKXaxMBTn626r4rv23XqAwGPleiaB6v50BrTprL56CNT4yiNEtXe6XHv/qjmjYeXV9Q
	Vt6pYeU/+xVrk2S996RFdL+3ZDPGEFZBZf2JpNflGKlQI+tL6GYZatMsM9QTWk7Wm16q+K//PTQkj
	40epViiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXzCX-0000000GLcr-0wZO;
	Sat, 05 Jul 2025 09:28:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXzAC-0000000GLPU-2Lnv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 09:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE12F45951;
	Sat,  5 Jul 2025 09:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71487C4CEE7;
	Sat,  5 Jul 2025 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751707585;
	bh=1jcC9TceXdzZtJGhy6YZenRnqlihRmJcKT3PDwgXNQE=;
	h=From:To:Cc:Subject:Date:From;
	b=VB9qBJAL5wEas7rR1Fgu7qGWHgA33k1e1SYrK+QclWk3lsv76VjcMwC0l6Y4ef2mW
	 Cfmljwn0iIZWkFSxCwtCl12Z6IwLWg6VGDBVMXyHfbEAmsHj+ZgiDKhV+3NsaeMOpO
	 mLexJCm2so/PYFBtfOcnsV79Lay4OZlrkobZcBUILRE+IrwkmSmeYJD0ZlbHxQOD90
	 mEWc4IYNTHELDdjO6LA6R+UG7k8upuNJ/gpdPfTn1Bx3xszgE9eU2KIY0ofjTsQTxP
	 M/7ZYozN+vRnmcXNqP3tlS5xM19QNM8vWuurA4UfHtxMJIQf/jmfDHxkcNydbUvFKG
	 8LqeGmPawkYfw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] net: stmmac: add support for dwmac 5.20
Date: Sat,  5 Jul 2025 17:09:30 +0800
Message-ID: <20250705090931.14358-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_022628_624495_D9F44473 
X-CRM114-Status: UNSURE (   9.38  )
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

The dwmac 5.20 IP can be found on some synaptics SoCs. Add a
compatibility flag for it.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
Since v1:
 - fix the commit msg

 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index b9218c07eb6b..cecce6ed9aa6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -59,6 +59,7 @@ static const struct of_device_id dwmac_generic_match[] = {
 	{ .compatible = "snps,dwmac-3.72a"},
 	{ .compatible = "snps,dwmac-4.00"},
 	{ .compatible = "snps,dwmac-4.10a"},
+	{ .compatible = "snps,dwmac-5.20"},
 	{ .compatible = "snps,dwmac"},
 	{ .compatible = "snps,dwxgmac-2.10"},
 	{ .compatible = "snps,dwxgmac"},
-- 
2.49.0


