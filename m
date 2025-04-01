Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB53AC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4IwXgKnHWG7YNQrSiO+qk2LKJM5fg/EOFJ1xKEmDbs=; b=R3yi2XkwA0/JwjKvmaPMkXFLqc
	H4UOtJXEu+4VPquyxSKvX2WPlcTXn8fD3fr1oOEIf0SycsCNRtExF4S2+pR6dIOYNbLlFI3JMQ8Ed
	M3sYMoamdFfqERDQC8XsaxLXMGy5RAhBUSTZdDlw5UwmHQM0+6t5aZuRs2tnbL/b3OT+PEdUc0Atn
	dCnuUwA/RAyQ1rZrFgivzrIX7Fn1wbMfgRV+gVO8RbGolclSA+D8U55eL4Y9MXt4SDOhzDqMnzq0Z
	gL8+wLmLnsy8nmN6WWzgYJNtIe0TrQqA3/iuGjVgWoJGZYwXTG+rO8bNnqMv9GoQHVD4TYDLpJ4hh
	GRYvOIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYCF-00000002WHj-0faf;
	Tue, 01 Apr 2025 09:46:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXka-00000002RfB-105f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98B1A44DFE;
	Tue,  1 Apr 2025 09:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8028C4AF12;
	Tue,  1 Apr 2025 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743499059;
	bh=U0ysh0TLWp+CLpUidcyzO51hkifl4bGUq07snvSw+w4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cLuIph2jPhPcO3cYdVQtZQtkVXG+tgLp/4t4smob/abxmh2OmnA/+5ZU6hUuX8wxV
	 KBkK5kWx9h9FJIG7bi6lirw5sVbHustH0pvTEVRV9SNFKdn8eNcbJqHblU4E+MRCO/
	 nwnkA0JbxNQOYkQVdfO/q9dIfBEiyvQ8hK3WyrtgriNyefrmbk+clmDjrJHqAb77BK
	 brNHVNMm9wl+hXoiSLJv/gthJUak6a2tLQloDPoz6cN6L90JjSX3EkdR3kVb0S5v1f
	 Uw7iWOekWcOeztD1MfwY7HhE32vtavMCCm4RThkevAiGrtbub7fCxsWY2skM6E6x+r
	 2fkkFisZQ5lWA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tzXkX-001GqU-4E;
	Tue, 01 Apr 2025 10:17:37 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: [PATCH v3 10/13] PCI: apple: Drop poll for CORE_RC_PHYIF_STAT_REFCLK
Date: Tue,  1 Apr 2025 10:17:10 +0100
Message-Id: <20250401091713.2765724-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250401091713.2765724-1-maz@kernel.org>
References: <20250401091713.2765724-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, mark.kettenis@xs4all.nl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021740_310742_A65519A9 
X-CRM114-Status: GOOD (  11.97  )
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

From: Hector Martin <marcan@marcan.st>

This is checking a core refclk in per-port setup which doesn't make a
lot of sense, and the bootloader needs to have gone through this anyway.

It doesn't work on T602x, so just drop it across the board.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 94c49611b74df..c00ec0781fabc 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -475,12 +475,6 @@ static int apple_pcie_setup_refclk(struct apple_pcie *pcie,
 	u32 stat;
 	int res;
 
-	res = readl_relaxed_poll_timeout(pcie->base + CORE_RC_PHYIF_STAT, stat,
-					 stat & CORE_RC_PHYIF_STAT_REFCLK,
-					 100, 50000);
-	if (res < 0)
-		return res;
-
 	rmw_set(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
 	rmw_set(PHY_LANE_CFG_REFCLK0REQ, port->phy + PHY_LANE_CFG);
 
-- 
2.39.2


