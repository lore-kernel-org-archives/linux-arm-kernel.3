Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F1BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvMzFvDFPtNYc9beeiDGU1QfzgA0X8H/s3MjLPK83/s=; b=dhq54Xlr4PEg4F3s63be6BQnEX
	Le40QAxGKmL9giPsr3P4MR4geg0AKv+KFh+KMBPlndqjPtQ1y3cbEfqTeeBBlW0iftbKUkf5COoIs
	9Rmk4suYgk6iBbSaRhFJFpxq18DdHAg5vpGWyqHYqIGxKijjGHCOIXUhzUOfOg1tGqMueOq3bvVdi
	5rhG3CLh84PEE2wG4orGJUzlTAYplTJ6Zogcpnf3TD+GC2hGi9PfvAxOGasT9bYRGrPVhPUP13Hbt
	GCGnH2SvpMYPFN7ePwwjUzUvkG7OrYFQVx6z0ftl4a9JX9a1fWnWQsKUpew+tvDRf/NwaQTlnQOyE
	+UiaDuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwZ0-000000059BS-3Zjd;
	Tue, 11 Feb 2025 20:08:58 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwLJ-0000000573m-1qH0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:54:50 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739303687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tvMzFvDFPtNYc9beeiDGU1QfzgA0X8H/s3MjLPK83/s=;
	b=xzz1DCD+FgNmcew4nFWLGjYQFCe6sA/KdgUUqLpzSUt/rVZxxKiUOqy/svVsjOYt+xalNc
	b5YmIlV3Lp3B1CbeAT8KesfeYujrLuPGOQ+iOlUe6oXY5IEFsVGuLCkIr9xCPokU7VYi8D
	RiEYC6twxK57MfnQysTn+iJaQqpGzx/SNkUWguQQ2dNUyVkTMmBSPv91QxaBvKCIxnui6L
	+0wJCWCnyXFKfxDQuVfyvzbh9oEJFSrqUsA4dcrudKgEqApNVwSPfKIqGvzTbl/MS9x71P
	6AG0bxHFkpwFj38uaoOpwTx7wQFHwASWJAdJIblBqa6VMIAOSeZ9lTTFCsxpwA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Tue, 11 Feb 2025 14:54:30 -0500
Subject: [PATCH 5/7] PCI: apple: Drop poll for CORE_RC_PHYIF_STAT_REFCLK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-pcie-t6-v1-5-b60e6d2501bb@rosenzweig.io>
References: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
In-Reply-To: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Marc Zyngier <maz@kernel.org>, Stan Skowronek <stan@corellium.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=PXCtvv5N3o1ijghyFwcjjiYtA4dsCcCo/zzcFKCevKk=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq6r28PCvGN2V+WHKUhGyarStlr41tcudnZ4dQ
 HvrlQVn2XOJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uq9gAKCRD+/lBaCvVY
 Dbj7EACMcBHDuzhazrjCZuOERME9/KkzaAPLCGa0fd3dYJCK+QaS12j3u8D/lYk3EG01TwqvOAN
 BWDWE8iSmcW0ewo61p2NbdmyabmMA2EKewdDsrt/1+SVwd/ntYv4737LIcHp9OkrCKTP2BRCV0x
 UvEPG8ZZXvS3Re4spQB9qn5Ke07KReBKO/iDfzogMEq1LN3z71RI6e1HLcBtWBKF8zQoXhsEE5D
 oq57PxA3WF5OPxQzgZNVVdIjrdHoaZ5o+xbZbCcuZa3tCqHBJ5ArzTSMNNsn9saOeiNCsar6ZYZ
 FW4nllMh9LOamx+DCMTlJHiEn/TOr6/KYRFGCnUInmhNwfbBQaQo/ysulv9XXNL3V7SJEcDdEkz
 IDjYbtRU95ua9kDZJ0FeMwWr7QjMS7D7fWxVRqmnRcHFdcLIT6RRPhvs5w425SpiGCkKqn3jF5N
 CfRI0ApM/sKjFEFgRYJ7d/ToBVIC8JlHD/u+ppPR++qpe5/xuU9I+739xPAqojxE1tZ9Qj2RIcR
 HatGJszXFASmiKwQeRxU2VGp+iWN5pc9I8ebm7wJ5WWOw2peN56Nyq6AR1Dti+k3G3sMpFRGCkk
 eEAmlhwJmyfIvYDUFejCIfkU4tgAvhzp7bm9n7fnAUrTbuzTokwxCgqw5H9ilj9Qj5xSGZXVHZz
 xroFVy45lDiCe5A==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_115449_621518_92801216 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Hector Martin <marcan@marcan.st>

This is checking a core refclk in per-port setup which doesn't make a
lot of sense, and the bootloader needs to have gone through this anyway.

It doesn't work on T602x, so just drop it across the board.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/pci/controller/pcie-apple.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 806eeb911bbd4f1ae5832b34f775fa18c866670b..209535db7855fa1ee0d75290b33525dce18f560d 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -472,12 +472,6 @@ static int apple_pcie_setup_refclk(struct apple_pcie *pcie,
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
2.48.1


