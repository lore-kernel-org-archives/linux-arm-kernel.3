Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799EACD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqBQI5ZShnSxB5z5FL9+IeZXqZpX+/ABiAi5KCnD1Jo=; b=XNu+mj5PLsBXwp7FgmEPUhNWTY
	g9gz4PFMlRo45SYDJVQQEH8x0rHYNj9jxf+5D5VldNXm7ivPhpK3alXYw/R3yPmwEH2kRylFDnQZG
	iOULh/pUMAU1/3dWHPnxqC+TdQn7FyyCZE441ednjqAbo/IgbAjYpzc04Ag4ETn9qlBXzKO/1mS5V
	egLlqae8tkKDmlJGWZPlqrLcCovhsAO2FXqjyhw2sVobBht1UREkViGAmPCqOdu4LL29s5B1d5L9n
	k889sqKvxQB8zu/okeaZkSbmgksWeJdDU6PG3SkQnqb3G3fFIjUp7iVBPIBrNe5EmHNw23W9WP93Q
	RyH0FgKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYi-0000000DV9k-2qDE;
	Mon, 04 May 2026 14:46:08 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYg-0000000DV80-2E0x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:46:07 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8PbJ5J6fz9tSP;
	Mon,  4 May 2026 16:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqBQI5ZShnSxB5z5FL9+IeZXqZpX+/ABiAi5KCnD1Jo=;
	b=XZMyFd4/PVTBYBe0J464a3FIHqCuVc9yVcl6LvhiRNUQVXRTmZYc6J3m0G+c3sBafo4JqN
	ZJw4nel4bFRPtXQJj2uNKTUqm6vAFq884ERnL9TzGe+cZsEq4DeKfcgV0SDKShwz/RYcuk
	XEKnF5iqTGcEdoDQlIejP3KMo2Z+sNvHPhwFr3M/FNHQBGkX3pcs64vxxpXIP4v/b1UasR
	jjJ3cISDabseYaTf3nKntZPOHpMZBv/56riZ1OpxqbtFNUhzSKU5/aYqfTTp87AdMWUD01
	Oojtgjau7/mPx3HZ45osrJ2CUXyag/gdvcVMtCoyYIFKwWMzS9UWJNAIWUwSyQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=QGwH8TbF;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqBQI5ZShnSxB5z5FL9+IeZXqZpX+/ABiAi5KCnD1Jo=;
	b=QGwH8TbFsOkCQUR/QJkkcJ+uhXLzU5HPtXU4qzg3o+yhy8dptmV6JH5Bptkmc/qtvZPQAr
	/ctB+DMRP/kV/A0y3Vkuk5jgH71kqFCaBvbo/H0d6oH81L6heOPs7xhUNVX09Vl1hzdNMV
	3hauGkZzCt27JcyCZ4yPbPqpRlgdcBvDuTC1KebXM93dX8H1WtM5PmZGJeAWVQ/8OGlWFu
	NfDqc2Gi7jQqQCcEgz6rK0b3Syuzy6P9Wkx//AoVobXDbBA55Em40WmfuAfF7x1JchNNiU
	DKnfE7nJYDasp/OPfHZv3AsEDyPlpaATJO98VPMJ7v1BsvIvasMOnyiWebZmCA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
Date: Mon,  4 May 2026 16:43:25 +0200
Message-ID: <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 94ec97eb4d7439e3b08
X-MBO-RS-META: zwxwmftrmkdmexfdqt1omou8jkk1qacd
X-Rspamd-Queue-Id: 4g8PbJ5J6fz9tSP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074606_720433_82C5527A 
X-CRM114-Status: GOOD (  10.94  )
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

Document backward compatibility support for CS2500 chip, which
is a drop-in replacement for CS2000 chip.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add AB from Conor and Stephen
    - Drop variant suffix
    - Fix CS2500 name typo in description
    - Add link to the CS2500 product page
---
 .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index d416c374e8534..ceeaa8f9fb08f 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -11,14 +11,19 @@ maintainers:
 
 description: |
   The CS2000-CP is an extremely versatile system clocking device that
-  utilizes a programmable phase lock loop.
+  utilizes a programmable phase lock loop. CS2500 is a compatible
+  drop-in replacement for CS2000-CP.
 
   Link: https://www.cirrus.com/products/cs2000/
+  Link: https://www.cirrus.com/products/cs2500/
 
 properties:
   compatible:
-    enum:
-      - cirrus,cs2000-cp
+    oneOf:
+      - items:
+          - const: cirrus,cs2500
+          - const: cirrus,cs2000-cp
+      - const: cirrus,cs2000-cp
 
   clocks:
     description:
-- 
2.53.0


