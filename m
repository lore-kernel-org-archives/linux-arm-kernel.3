Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD93BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRB3HZaKvShcimBlG9NGSSnEjh1oc1QiwEtj4KgkabM=; b=SdDCqDM/6xtt72xjvIT5FH1pDR
	NOfYh31Bm6z/XDjp0l7oV4v2diQ4QASu7wyCTRPNJTA2R4hHNgXn3bIUc8wz53ee81WYv+wlv/ZDs
	LLazriUV+nEzQJFwZtTXLHbZoIiXk8GhZ3C9BAQAzA5HSYv6mAK3OZCMRa/rnzxHeVJSD+J30u9v9
	Po2+2imrUV/SL1OcYpkHuR8zf/IOM3zQnCMqFoa4/RK7cGThA7fu6u+lk6/v7ItCx/CPPclMUq/He
	5ZgK7xz0Vi4lkpjsloyEavqAzcA/8w9OKcCc95mTv2See6FWPeRLllGnr5xrsR7nF9Q6t/zKSONME
	2Inb3Vmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisJr-0000000AB6k-2mdD;
	Mon, 04 Aug 2025 10:21:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis2H-0000000A8sn-0GyS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301796; x=1785837796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rExnJEsUclWRnuXGTLi8ZjxHecMNknzyT1tPuf5PI9I=;
  b=13hmU39fUUcafegu2+HzryDlAUwMPFQqyUN+4jJeOye9LGBF1WJA/nUC
   8QUqR9y+02O0bIA5dwosPhJPE9ceaQhiwtEC1J2jFkhRZQg19jIxdnOk0
   q9pzQ8nqDRMyjKS42VEzs12oaSsd2vqe4C/Pf6O7BnuyLhxUVNFdGZ0Tk
   Xj9CotcBDLxhv8CyKsxdNmlmWIfXaZbpbD3KDNJBDpiRlTfdoGHWz0sEk
   dL20GhUiI9X6FNBLUOpyFSNPh1CLNQ+y/6V1AlOIT5cS2eJqfnH88T2Ft
   GiCCVTDAIiuzyBmLerLdPTbOzbYgvmnhtnee12eVx79v0ADyuSN63w9Ko
   A==;
X-CSE-ConnectionGUID: QrHuXWrSRt6GNRSNglLzJg==
X-CSE-MsgGUID: BPr72ON8RL2cJ2k6co4c9Q==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44245504"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:03:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:03:06 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:03:01 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 06/15] dt-bindings: nvmem: microchip-otpc: remove stride details
Date: Mon, 4 Aug 2025 15:32:10 +0530
Message-ID: <20250804100219.63325-7-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030317_162871_EFCC3274 
X-CRM114-Status: UNSURE (   9.81  )
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

Removed stride details from the bindings header as they are not relevant
anymore since the access method of OTP packets is changed to TAG
approach. Update the example binding according to the new changes.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 include/dt-bindings/nvmem/microchip,sama7g5-otpc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/dt-bindings/nvmem/microchip,sama7g5-otpc.h b/include/dt-bindings/nvmem/microchip,sama7g5-otpc.h
index f570b23165a2..682b040675fd 100644
--- a/include/dt-bindings/nvmem/microchip,sama7g5-otpc.h
+++ b/include/dt-bindings/nvmem/microchip,sama7g5-otpc.h
@@ -3,10 +3,4 @@
 #ifndef _DT_BINDINGS_NVMEM_MICROCHIP_OTPC_H
 #define _DT_BINDINGS_NVMEM_MICROCHIP_OTPC_H
 
-/*
- * Need to have it as a multiple of 4 as NVMEM memory is registered with
- * stride = 4.
- */
-#define OTP_PKT(id)			((id) * 4)
-
 #endif
-- 
2.34.1


