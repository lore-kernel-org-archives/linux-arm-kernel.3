Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892EDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOb/dTldwv6tPq64op0KZoctOHrwNAzf2iqB8SOD9Ag=; b=J/BaHBP+lwHSgLM92e0nb35hdR
	i4d1zX9ZLM2+/VOmbiHBxy59e4a311vZ9S19uwl22F+FIIjpE4LDewmJj0wXGITynkyPXdrdTD6d9
	UA2aUrwKumTuEbbwQMg3Jlh8y2IH6+i8YToGTQLaehEgFO3TpgFqSlpUGxS8u+98PolbS31KH2dlP
	b4+hOFG7HdRxZ+8L8mPBx3BmWNY4e/dtihLu3/ojGwH78955nHZE5Wn+3wLBrzlydTAi7xbchameG
	aIPYRVSO8fF1Io5utGkRvl8SWJo6zhNzwFqGCyjI+ecxPaEN8cYlUP8UPVmOhUxKkJA3Dux7q6z1T
	3RkrJJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpoC-000000086Wi-20ik;
	Sat, 22 Feb 2025 13:44:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpiP-000000085z9-0WKD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 13:38:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE81E5C57DB;
	Sat, 22 Feb 2025 13:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52C26C4CEE6;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=yyBin1h0CvRmrVfUw16qTKb6+CAFkoi2GN8BdSp/Ys8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VjRifRoVnEdkqsIkzS09ngJyZvwcXIhzH8fD8rpVNqvwfgo+/OAFnvqAIobNA7Lzc
	 dOjmyZYGlVO6Ose1Q/bpG7kM0bSZwWuY7WKdKCEUVutmqzbxmsiaRxzs0q7wnN6iRw
	 yLnbdQ4QSOqmf0TkuLPcDbx8LJWhkNux6am4+UggTR4VOK67gyBGTKc7MRwP1zElgT
	 gohHB+4lSJHlDabiStl/6aSAm/bdEcwYnSwtseqKloM5FfYW+CVUmPXwaqA06s3Ktr
	 pDKuL+jdnErsTjrfnwOa++w77PJw7j1VlLt524UGxtgO1nM9dUXUE9d9EE2y2eWkAf
	 JxWVvmBlLy86A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41204C021B8;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:33 +0000
Subject: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=iPv0XjpNaU2PSc1JHoHKcgCr0CRP3yf1b4EAPEcXwng=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy9ESFaHHtpUbMr91cTRekSrY3mPm4vwl4djZsz+Kw
 0rCA+o7SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABPpSWZk+Okau99t7x9PDrd7
 Bewzl0+r1NyzLGjKtR6F2u6Y5ZpbHzIyzBb9undnbnzudPf6usJzQa0X5xRkCsf4CkWc3b3xodM
 7JgA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_053845_263139_DAFF448D 
X-CRM114-Status: UNSURE (   9.10  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sven Peter <sven@svenpeter.dev>

Add the missing register bits to the defines and also switch
those to use the BIT macro which is much more readable than
using hardcoded masks

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 40 ++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index dac694a9d781..bd128ab2e2eb 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -5,6 +5,7 @@
  * SMBus host driver for PA Semi PWRficient
  */
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/kernel.h>
@@ -26,21 +27,30 @@
 #define REG_REV		0x28
 
 /* Register defs */
-#define MTXFIFO_READ	0x00000400
-#define MTXFIFO_STOP	0x00000200
-#define MTXFIFO_START	0x00000100
-#define MTXFIFO_DATA_M	0x000000ff
-
-#define MRXFIFO_EMPTY	0x00000100
-#define MRXFIFO_DATA_M	0x000000ff
-
-#define SMSTA_XEN	0x08000000
-#define SMSTA_MTN	0x00200000
-
-#define CTL_MRR		0x00000400
-#define CTL_MTR		0x00000200
-#define CTL_EN		0x00000800
-#define CTL_CLK_M	0x000000ff
+#define MTXFIFO_READ	BIT(10)
+#define MTXFIFO_STOP	BIT(9)
+#define MTXFIFO_START	BIT(8)
+#define MTXFIFO_DATA_M	GENMASK(7, 0)
+
+#define MRXFIFO_EMPTY	BIT(8)
+#define MRXFIFO_DATA_M	GENMASK(7, 0)
+
+#define SMSTA_XIP	BIT(28)
+#define SMSTA_XEN	BIT(27)
+#define SMSTA_JMD	BIT(25)
+#define SMSTA_JAM	BIT(24)
+#define SMSTA_MTO	BIT(23)
+#define SMSTA_MTA	BIT(22)
+#define SMSTA_MTN	BIT(21)
+#define SMSTA_MRNE	BIT(19)
+#define SMSTA_MTE	BIT(16)
+#define SMSTA_TOM	BIT(6)
+
+#define CTL_EN		BIT(11)
+#define CTL_MRR		BIT(10)
+#define CTL_MTR		BIT(9)
+#define CTL_UJM		BIT(8)
+#define CTL_CLK_M	GENMASK(7, 0)
 
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {

-- 
2.34.1



