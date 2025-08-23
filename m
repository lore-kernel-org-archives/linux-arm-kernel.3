Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B713BCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYNvLzsjfbloPi88Zn0sDgQb9PTA7ICXbHQLU987Ung=; b=Miqf7EScVIDxhjGA0wNyqazDrY
	NLJAxseWtJslnCbnM6afTrpwOrsgGes0eS1PGuIzHMdltIDSZgJO/jvIHaCwQgLEojYBCbbMpWZng
	t3D4QTjtyFz9dkR8FQiTbN4cymd5j0x+n5Bs/X+j/i7eKj86+iV3Ri4+QXpAap4qsLZTrTiRqxLEL
	I3hyO7S0kn6estCk3tG+W29Tf6yuHX+ld+DGPzcwFDGxPNTZ+nMfPBGLflSkh1YBCjAuPyo3k3/ih
	kSsxpjXzxxzQnP35NBQHhv2+uqnaHkqyHuBqgQ2/bXCrQFfpYDtYBDU7QTjdxFoxIwArf+sT2LPSH
	2kpchmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqhl-00000004xuS-3P7y;
	Sat, 23 Aug 2025 16:02:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqca-00000004wtf-0ayu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0472860007;
	Sat, 23 Aug 2025 15:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32563C4CEF4;
	Sat, 23 Aug 2025 15:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964653;
	bh=E48rlK5pCrVw6V8uNmmSVbPCOsKOLgsmZrs0oelkBrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+Ji7du8ydO9/dwQfjyld222hzFjdhjYrIvtRdRNvFPZFHGdxsk5LcRWCE49ic4Vg
	 ObIuK1wHAB2PClhbQreZrtNPQn8788uz5RmBzfuNfPzDoNvQDhAUS8xu/20ZQqdx6A
	 HyOihXrEniYo1JgARPz0OPRETDZWTWAnMsA1BvnyzpWoJ2PIROsU6YtCuWSxEu5cct
	 NPsp0xgLNluknacqGbr88rDYSE/nnaBHwvAOQw1BmyJvnyei6J0sKr1gbpSkxGgyz0
	 wnvU+2m6s+GOwsU/+KStUvm8RwOTi26kyHuxaBdOtSYjhcmtf7GAPPozK8X/H5qGdO
	 +mdCQiDgDoJyA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] dmaengine: dma350: Fix CH_CTRL_USESRCTRIGIN definition
Date: Sat, 23 Aug 2025 23:39:56 +0800
Message-ID: <20250823154009.25992-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Per the arm-dma350 TRM, The CH_CTRL_USESRCTRIGIN is BIT(25).

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma/arm-dma350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 9efe2ca7d5ec..bf3962f00650 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -58,7 +58,7 @@
 
 #define CH_CTRL			0x0c
 #define CH_CTRL_USEDESTRIGIN	BIT(26)
-#define CH_CTRL_USESRCTRIGIN	BIT(26)
+#define CH_CTRL_USESRCTRIGIN	BIT(25)
 #define CH_CTRL_DONETYPE	GENMASK(23, 21)
 #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
 #define CH_CTRL_XTYPE		GENMASK(11, 9)
-- 
2.50.0


