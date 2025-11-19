Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13928CF3943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nI5xOD37wo4hnzm916985N7DoSvmEJAwT33Bin9JR10=; b=JzZNvpnH8+UJCp2+Atg7vUrrfl
	O9oMU/QGqmaCTAoG3bFeacH0KLxQKqxEr7cgCmxKL3ukUfOAfqtUlxUr67Xa81aJq9BCaAWXpMlAU
	9CrY29XzxizGmCLpZs7QJvst3s5gd4WH9rYR5sNRLP/ozYEO2FCrt09EEcH4gZuHS9GVhIQaaUiDu
	1EJ9S3NKaEyqDLZW5tpuUOnbKn0hlmF1epDqeI/em6wII5/RqNPkPZ4ojE6Dj/YfZfTstzpCIWAsm
	R484CaME9ammRRrRmNiqHLZ6MkKIEs2Ezr5q7TMfVPJ0g8ZcWuLuu/A0Tm8oylci98l0/ysO+WCqY
	l136ST/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkUi-00000003bMU-0bOr;
	Wed, 19 Nov 2025 15:53:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkUg-00000003bLY-0bQM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83F1B405C9;
	Wed, 19 Nov 2025 15:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6339C4AF14;
	Wed, 19 Nov 2025 15:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763567597;
	bh=ghn1DQMvwDFb2t8E3blcc0GQRRX7k47nsQNotsdpd5k=;
	h=From:To:Cc:Subject:Date:From;
	b=LX+K4FSDDP4e9yAEryXqFyjA/EQPdkOCtujeK1HOh4xZoELGg5FYGLKkmK42o0XBO
	 88LV5Z4Xcp0LVexLHCGjyrmQK4hIPPsEFJi8mwwBRGn0zL3dWUxTVAJxaIWAcLbzrX
	 wkc5Cv+tRibnjmRcjZiO3WsiORlul+yjjCDbVDxHQqk6OXT/hlHSjcNbEkq4D3cV4E
	 FS3c2VIXH4jtiu1fpJLE4svc5x+tS6oF7fo+xBJcjIyehIOX8auitNcy4GKdUMlhkF
	 2EIgcAw7Ped67nJvYNUZSAze5OjzWKlVyrXW2T21L9sFwQ2wnoPLq0V/bNvwm8j7HZ
	 doxPGSbZI9KIA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 resend] net: stmmac: add support for dwmac 5.20
Date: Wed, 19 Nov 2025 23:35:26 +0800
Message-ID: <20251119153526.13780-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_075318_201328_062FB7DE 
X-CRM114-Status: GOOD (  10.98  )
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

The dwmac 5.20 IP can be found on some synaptics SoCs. 

The binding doc has been already upstreamed by
commit 13f9351180aa ("dt-bindings: net: snps,dwmac: Add dwmac-5.20
version")

So we just need to add a compatibility flag in dwmac generic driver.

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
2.51.0


