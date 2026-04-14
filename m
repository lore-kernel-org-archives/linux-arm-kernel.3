Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BCEF9D0F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jF7dBZ/WN9rRtO0aE9An/UmCnaIWqDXi0co5rgeFG+w=; b=5BVkmtU1yMpnkKs52ujb+/FpIX
	bCG8mkDeyBHG/BGgrd7vhuBCHFaMGWtqPwOUAihW4ACZWSEzG6yAJjNeMil2xNVUV3Ir7Bvd6TgcM
	oOIMA4q22fAO2HU8UyLdZWW6mN+V+dAiRz8ztQg5BErgFxQJn9Cm9QG0zVn57d3kNjrSBEihdxadw
	o8DBAyn0NBKmsHnpAoOLn+GysT+l4KBu87nFsCoKrK7Czy5rnU4qxNHuOvvT9B+7wspwMP9jNMyyl
	nlfj5/sC8dmaTne1n7MuljDf9hvD4ALws+YpfC90kOtlVim4PJ4JXSFbch+JmQDlzEChjky6j+kWC
	FeSZT7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjq1-00000000ACs-1UPF;
	Tue, 14 Apr 2026 19:54:21 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjpy-00000000AA9-2mWW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 19:54:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43cf906b007so3499008f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196457; x=1776801257; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF7dBZ/WN9rRtO0aE9An/UmCnaIWqDXi0co5rgeFG+w=;
        b=tMw0nTn3J21EiHy+rNP5J2IaASTAdbVyJCITBXILz6n/CwnXmbwS0hyMH2aoMTo8Cr
         dNrEaUSIUrbNrTb/DXk7HCF3A0gk7M32yFrsS9lBo941/s8gdOXiVBpdDM6HKEz7Bw2c
         KbeY/9Tj/TEMxp7Knt8K2XTSxmSsu/zVUDMDQ8VRnU/hWteGuoLG+ukjdEWXcLcXCTgS
         1+E6J9vbAtjJ9GsiQ4BSgS/ozd5cm59j3JLduZZwogeUY3BPUo0m5rUmF5CcJwAncAJn
         jqCI+g/c314jdLgDxhpqcwVHRLYXO9TUR4eT04yacH23YvXmWRbe4Mctgqih5qcyrpKq
         0Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196457; x=1776801257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jF7dBZ/WN9rRtO0aE9An/UmCnaIWqDXi0co5rgeFG+w=;
        b=EXAf90CAY0IHTRewGd5NY8H8ldhU70vSX1gy82lvT8W0LaV4qIxWYm1mHoGqmW7w7A
         P5QZ2QC9eoojouJnF4Y2JtIYupD+TfuD8y/MyBgeYzB1xe3EhEIu9/JiUWVXEjhBGwIW
         rqoink+seRKdm3JnaFKVjkMzrEBAPe13jfJy+N2SLldJMXuHkj5adwWBgW0jz2ulRpvk
         PDIey/DvdRZ7uuIsOnXJJ4cz8T8uBRqcsOZaMyhmUAD7isaV4QwhwxrUYlDcw66IXi68
         tsoZm3Zy/WyIii6+p/D9gzbQcFxRM67qhswWB5BRwNXEH0cw8aMtaqpFplxDzDanRVlB
         i3BA==
X-Forwarded-Encrypted: i=1; AFNElJ9Sh+yjMwZnd+cyP67WD0RqWa+g3hPfIggYUxgv0zTI46PiVpSpDJkjamkPistL9fBQcLwzTfCfJdX5dZ2O+/S3@lists.infradead.org
X-Gm-Message-State: AOJu0YymkFfQk+gOMe1NC6zmcJq+6rpbvzcSditoL6BXg/qvnnyEKUJh
	l7b92WZe939BC6tNAmo3+k0ovWF3zosqY3wToMSkZzDzh1VXPfeukBMw
X-Gm-Gg: AeBDiet8dVsCDRyzxhpT4NxLQJrk9uI1p6jcajCF/6nxJLq1352yqN4lCL9ViDDjE/k
	zA685jNoFsl1x8VK59t41ZB8KzqHpWVTE2TJHPY97VliDa3NMA/vWAEJrjLhWemamrWSaHM18EA
	GeG4hUhJ0xekbwdiLxlfplIWhuHjsmw9LN6mE3Ipbut7PcrLuUz3vP069tj82frIrqE9qk6aBYW
	rmItkDqw3abi9PliOFYKWvLnP9BCgkxy9/MOHW5YXtwjHPT3oD2GedezmKpdaflAIwL1afJXOJp
	gkRhdTfteTNmo+GiFWkvJlEa9xzXBtZCIqmZiBuR7jO89ef45fOqAH3W5qIBwNqCexLv/TrUfRR
	Qpg9Pz0LnB3HjILf83HyO2tosYK5RCyG4W9H//iZRREjfQaMiAck8X0Bq2matL/vuBXPbDKTg7I
	J0slyzRwx0WXas7mJydB60CQd9rHN6FubB+U+aAslvVhU8GbLsjNK9L/YfLWR0O2LadZk0L3979
	299oknKzsfbYUQzz3JotC8=
X-Received: by 2002:a05:6000:2689:b0:43d:c95c:4259 with SMTP id ffacd0b85a97d-43dc95c427amr7827550f8f.30.1776196456620;
        Tue, 14 Apr 2026 12:54:16 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:16 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:52 +0200
Subject: [PATCH 3/4] clk: mmp: pxa1908-apbcp: Add reset cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-3-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
In-Reply-To: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=Q4T/ABQPm6i5MvVgGhQo6QXav/d3IJrFZbQDihPCsb4=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU68vyn38galmo13tMuVhFiqpQMnXzXuEHfdXjElS
 P0nB29/RykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgIkcecHI8MnrdNWd572+f04t
 Nn95Jikr1JNT4tmEB2uPreebskZo1mOG/75vxbsYZHsXO5ef2WNUMWtDa+3sc56tN5PXTzr4xft
 KES8A
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_125418_729092_37D3107E 
X-CRM114-Status: GOOD (  15.60  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

It has been concluded by comparing the gate clock masks and vendor code
between PXA1908/28 that PXA1908's APBCP, similarly to PXA1928's APBC,
has controllable reset lines. Describe these in the driver for
correctness.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/clk/mmp/clk-pxa1908-apbcp.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbcp.c b/drivers/clk/mmp/clk-pxa1908-apbcp.c
index f638d7e89b47..1aa476103553 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbcp.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbcp.c
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/marvell,pxa1908.h>
 
 #include "clk.h"
+#include "reset.h"
 
 #define APBCP_UART2		0x1c
 #define APBCP_TWSI2		0x28
@@ -24,9 +25,9 @@ static DEFINE_SPINLOCK(uart2_lock);
 static const char * const uart_parent_names[] = {"pll1_117", "uart_pll"};
 
 static struct mmp_param_gate_clk apbcp_gate_clks[] = {
-	{PXA1908_CLK_UART2, "uart2_clk", "uart2_mux", CLK_SET_RATE_PARENT, APBCP_UART2, 0x7, 0x3, 0x0, 0, &uart2_lock},
-	{PXA1908_CLK_TWSI2, "twsi2_clk", "pll1_32", CLK_SET_RATE_PARENT, APBCP_TWSI2, 0x7, 0x3, 0x0, 0, NULL},
-	{PXA1908_CLK_AICER, "ripc_clk", NULL, 0, APBCP_AICER, 0x7, 0x2, 0x0, 0, NULL},
+	{PXA1908_CLK_UART2, "uart2_clk", "uart2_mux", CLK_SET_RATE_PARENT, APBCP_UART2, 0x3, 0x3, 0x0, 0, &uart2_lock},
+	{PXA1908_CLK_TWSI2, "twsi2_clk", "pll1_32", CLK_SET_RATE_PARENT, APBCP_TWSI2, 0x3, 0x3, 0x0, 0, NULL},
+	{PXA1908_CLK_AICER, "ripc_clk", NULL, 0, APBCP_AICER, 0x3, 0x2, 0x0, 0, NULL},
 };
 
 static struct mmp_param_mux_clk apbcp_mux_clks[] = {
@@ -43,6 +44,28 @@ static void pxa1908_apb_p_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
 			ARRAY_SIZE(apbcp_gate_clks));
 }
 
+/* Taken from clk-of-pxa1928.c */
+static void pxa1908_clk_reset_init(struct device_node *np,
+				   struct pxa1908_clk_unit *pxa_unit)
+{
+	struct mmp_clk_reset_cell *cells;
+	int nr_cells = ARRAY_SIZE(apbcp_gate_clks);
+
+	cells = kzalloc_objs(*cells, nr_cells);
+	if (!cells)
+		return;
+
+	for (int i = 0; i < nr_cells; i++) {
+		cells[i].clk_id = apbcp_gate_clks[i].id;
+		cells[i].reg = pxa_unit->base + apbcp_gate_clks[i].offset;
+		cells[i].bits = BIT(2);
+		cells[i].flags = 0;
+		cells[i].lock = apbcp_gate_clks[i].lock;
+	};
+
+	mmp_clk_reset_register(np, cells, nr_cells);
+}
+
 static int pxa1908_apbcp_probe(struct platform_device *pdev)
 {
 	struct pxa1908_clk_unit *pxa_unit;
@@ -59,6 +82,8 @@ static int pxa1908_apbcp_probe(struct platform_device *pdev)
 
 	pxa1908_apb_p_periph_clk_init(pxa_unit);
 
+	pxa1908_clk_reset_init(pdev->dev.of_node, pxa_unit);
+
 	return 0;
 }
 

-- 
2.53.0


