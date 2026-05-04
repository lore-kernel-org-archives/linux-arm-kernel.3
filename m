Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F757FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 03:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ix64vFLTMg1zfqNmmDku6bMK7XtzXkWd5VZgOslz+04=; b=QUHkhRpVaXwoPhI07vYKttM43h
	OxLJuSXpu8CvAJSr0jmsnE1I5f0Hq/iC3r+rTCHTAnioon1AB6Fdz9A2fv1vRlsIllWNj4/+e5tF3
	94Dm16UdsVWNkiZ/Bjr6OUSArpAPe4S1k4kosw7E/dZs4DqzNVDtpJ2foxcuN94+aJqkdq6Ny6lOd
	wkjbfuCZV5h/mdGgLFkIwhXESIgMesG0BnB/Yc/x+n3/MeK40oTpoqnWErZBZnY0ra4GC1QP16iSG
	fI+0HjdRl05a6DuDYcHbE7mjTuCzEIMdEyyk9Bj3xsMvpaxN3TkP9S23npS5mdNe3WBSLzMXSW8y2
	HwfUl7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJjjV-0000000CEOf-1JRD;
	Mon, 04 May 2026 03:12:33 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJjjT-0000000CEO6-0JIM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 03:12:32 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50d7c12e48eso30840101cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 20:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777864350; x=1778469150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix64vFLTMg1zfqNmmDku6bMK7XtzXkWd5VZgOslz+04=;
        b=P1P91eBBBkwAYcGdTpJwmMsdMp3TgnLofFZ0Jh5XLfG5OYtOeCLYXWcSvBVPB1yeFu
         xlzaV+JDIDPtD+AncLchawdehBopTwSWV8aSurgrLTJRlw2VGKsg/GYX7gNNECY9TuMY
         haQWkY9wqHPsibh4PS6Y6m+qtzGq9WCep3n4A84FOnL6iCs/tA394MG3FAeR9YVQd376
         /LaVGqaVXuQNYHzNWRUtz8vDXhCtWjc2kKKHICEvb3k+6ft8RTeL45n6EmsH5CryYhys
         VrrpKbdbSZpIPJVo5IApOzSP/xjpkFeFfM5+I5jlWgfTabicWcUNdeA2RjytSNbCmlfC
         Wp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777864350; x=1778469150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix64vFLTMg1zfqNmmDku6bMK7XtzXkWd5VZgOslz+04=;
        b=dW4Uk7aecSb8uGo1TelXNQjCl1WfJyYZN9BX3B9tDV5itKzPICAwaOWtFr7YU3nouC
         qyYINpw/TFRutdP91NedoOeCr11kGXdSd3YWhAHA1p4UJ3t66oCUl6KjpzAhkQk7CLs/
         HnOV+V6WrQFGSsbc4HBnTEgb8yr0qf342bw7zGaln4xZ3dUpUCCgcHab6Qfe31OwmmTU
         sNz4U+uWi5i7lSjfjI5vlzZa4a6TRTAnipoDaPOmvWp69/U/147xIGILda8dyjPg+S7n
         sbFRNQ5L0Di03gRGjLUp5ZgTV9Uw2QdZmWqkWQgMmsPK+eieydjM8ayqD2WjzRSuQdA1
         bJFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B0kEy1Ds4M1HEjsepXsMMMQlfQgviCEa8unHI6AL4vJ9sJyTp8f9o53oM9NyYfhhhc5RgMbSGQAuJ54XrK4GR@lists.infradead.org
X-Gm-Message-State: AOJu0YzKqHR7A7KnXwPDf/SWA4jynAakhc2J6K+bnQpCsLrZ4spWbSLm
	5JojJ3j2PrSb0d4Ztg87J40nwNoNMwqb4FV0zo+JtD0qr71v4/0wrXCW
X-Gm-Gg: AeBDieu63cea0fPV0i/pgr6PYTHGu6h6J2T6o82lDC93Ivsjvy4/lkFjO/Tj0GmnisS
	dsH2jOtBqJ8ovkboTjOKPREP1cqClGMQD1KVTQcS1NWKzlvogXkAJ4Jx1lIajEcijYfORySk3M3
	7+DqlU2BlL6POTV64DCE0ahumGD75ZMM91EiHzfKwlxAMi8tcc6DzAfIY3UMwA7ZMdt2+UqEXax
	ZwImJD1KtwuILYt1RqAgdxYRmMxNfOn+ZRe8s5IK9Mow4IQWIsvmC6eGfXL11v0pDfENkZetRgy
	vLq+SpEs6/LUrjMaNoblN57DFJ6m7CuctwNL9E3gTFKUQ4ABC0m7rih37HlSGuqlu50C4LNBKsx
	3D8uPgIN9e8M6z2BgDnPA0l2SlKSKAgZio0EFTe5rSdfUVVm/04PsbWfeXkG62/x/WUU/EoqJOF
	aCG+nXGn7qGMFTRFHO1+KeroJn+OcUFPhzikduHoEbNQLIg3WiGqPYcdyEi4K6gNJhK34wO82KL
	hLKPu2oqDv8LN+XvCsOXZB3Kv2SQP2fnzipc4R9gCCTXw==
X-Received: by 2002:a05:622a:15cf:b0:50f:c9a2:1643 with SMTP id d75a77b69052e-5104b484d42mr108220031cf.11.1777864349633;
        Sun, 03 May 2026 20:12:29 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040ba8acdsm86540591cf.31.2026.05.03.20.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 20:12:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TI...),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] firmware: ti_sci: simplify resource allocation
Date: Sun,  3 May 2026 20:12:09 -0700
Message-ID: <20260504031209.618949-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_201231_182668_1ED29475 
X-CRM114-Status: GOOD (  17.08  )
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

Use a flexible array member to combine allocations.

Add __counted_by for extra runtime analysis.

Fixup k3-udma as well since ti_sci_resource is used there as well and
needs fixing up to use kzalloc_flex.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add k3-udma fixes.
 drivers/dma/ti/k3-udma.c               | 180 +++++++++++++------------
 drivers/firmware/ti_sci.c              |   7 +-
 include/linux/soc/ti/ti_sci_protocol.h |   2 +-
 3 files changed, 98 insertions(+), 91 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b6..ad6c50d0b844 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -4584,9 +4584,10 @@ static int udma_setup_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
-	struct ti_sci_resource *rm_res, irq_res;
+	struct ti_sci_resource *rm_res, *irq_res;
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 	u32 cap3;
+	u16 sets;
 
 	/* Set up the throughput level start indexes */
 	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
@@ -4664,64 +4665,67 @@ static int udma_setup_resources(struct udma_dev *ud)
 	rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
 	if (IS_ERR(rm_res)) {
 		bitmap_zero(ud->tchan_map, ud->tchan_cnt);
-		irq_res.sets = 1;
+		sets = 1;
 	} else {
 		bitmap_fill(ud->tchan_map, ud->tchan_cnt);
 		for (i = 0; i < rm_res->sets; i++)
 			udma_mark_resource_ranges(ud, ud->tchan_map,
 						  &rm_res->desc[i], "tchan");
-		irq_res.sets = rm_res->sets;
+		sets = rm_res->sets;
 	}
 
 	/* rchan and matching default flow ranges */
 	rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
 	if (IS_ERR(rm_res)) {
 		bitmap_zero(ud->rchan_map, ud->rchan_cnt);
-		irq_res.sets++;
+		sets++;
 	} else {
 		bitmap_fill(ud->rchan_map, ud->rchan_cnt);
 		for (i = 0; i < rm_res->sets; i++)
 			udma_mark_resource_ranges(ud, ud->rchan_map,
 						  &rm_res->desc[i], "rchan");
-		irq_res.sets += rm_res->sets;
+		sets += rm_res->sets;
 	}
 
-	irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
-	if (!irq_res.desc)
+	irq_res = kzalloc_flex(*irq_res, desc, sets);
+	if (!irq_res)
 		return -ENOMEM;
+
+	irq_res->sets = sets;
+
 	rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
 	if (IS_ERR(rm_res)) {
-		irq_res.desc[0].start = 0;
-		irq_res.desc[0].num = ud->tchan_cnt;
+		irq_res->desc[0].start = 0;
+		irq_res->desc[0].num = ud->tchan_cnt;
 		i = 1;
 	} else {
 		for (i = 0; i < rm_res->sets; i++) {
-			irq_res.desc[i].start = rm_res->desc[i].start;
-			irq_res.desc[i].num = rm_res->desc[i].num;
-			irq_res.desc[i].start_sec = rm_res->desc[i].start_sec;
-			irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
+			irq_res->desc[i].start = rm_res->desc[i].start;
+			irq_res->desc[i].num = rm_res->desc[i].num;
+			irq_res->desc[i].start_sec = rm_res->desc[i].start_sec;
+			irq_res->desc[i].num_sec = rm_res->desc[i].num_sec;
 		}
 	}
 	rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
 	if (IS_ERR(rm_res)) {
-		irq_res.desc[i].start = 0;
-		irq_res.desc[i].num = ud->rchan_cnt;
+		irq_res->desc[i].start = 0;
+		irq_res->desc[i].num = ud->rchan_cnt;
 	} else {
 		for (j = 0; j < rm_res->sets; j++, i++) {
 			if (rm_res->desc[j].num) {
-				irq_res.desc[i].start = rm_res->desc[j].start +
+				irq_res->desc[i].start = rm_res->desc[j].start +
 						ud->soc_data->oes.udma_rchan;
-				irq_res.desc[i].num = rm_res->desc[j].num;
+				irq_res->desc[i].num = rm_res->desc[j].num;
 			}
 			if (rm_res->desc[j].num_sec) {
-				irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
+				irq_res->desc[i].start_sec = rm_res->desc[j].start_sec +
 						ud->soc_data->oes.udma_rchan;
-				irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
+				irq_res->desc[i].num_sec = rm_res->desc[j].num_sec;
 			}
 		}
 	}
-	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, &irq_res);
-	kfree(irq_res.desc);
+	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, irq_res);
+	kfree(irq_res);
 	if (ret) {
 		dev_err(ud->dev, "Failed to allocate MSI interrupts\n");
 		return ret;
@@ -4746,9 +4750,10 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
-	struct ti_sci_resource *rm_res, irq_res;
+	struct ti_sci_resource *rm_res, *irq_res;
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+	u16 sets;
 	u32 cap;
 
 	/* Set up the throughput level start indexes */
@@ -4828,21 +4833,21 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 						    (char *)range_names[i]);
 	}
 
-	irq_res.sets = 0;
+	sets = 0;
 
 	/* bchan ranges */
 	if (ud->bchan_cnt) {
 		rm_res = tisci_rm->rm_ranges[RM_RANGE_BCHAN];
 		if (IS_ERR(rm_res)) {
 			bitmap_zero(ud->bchan_map, ud->bchan_cnt);
-			irq_res.sets++;
+			sets++;
 		} else {
 			bitmap_fill(ud->bchan_map, ud->bchan_cnt);
 			for (i = 0; i < rm_res->sets; i++)
 				udma_mark_resource_ranges(ud, ud->bchan_map,
 							  &rm_res->desc[i],
 							  "bchan");
-			irq_res.sets += rm_res->sets;
+			sets += rm_res->sets;
 		}
 	}
 
@@ -4851,14 +4856,14 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 		rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
 		if (IS_ERR(rm_res)) {
 			bitmap_zero(ud->tchan_map, ud->tchan_cnt);
-			irq_res.sets += 2;
+			sets += 2;
 		} else {
 			bitmap_fill(ud->tchan_map, ud->tchan_cnt);
 			for (i = 0; i < rm_res->sets; i++)
 				udma_mark_resource_ranges(ud, ud->tchan_map,
 							  &rm_res->desc[i],
 							  "tchan");
-			irq_res.sets += rm_res->sets * 2;
+			sets += rm_res->sets * 2;
 		}
 	}
 
@@ -4867,36 +4872,39 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 		rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
 		if (IS_ERR(rm_res)) {
 			bitmap_zero(ud->rchan_map, ud->rchan_cnt);
-			irq_res.sets += 2;
+			sets += 2;
 		} else {
 			bitmap_fill(ud->rchan_map, ud->rchan_cnt);
 			for (i = 0; i < rm_res->sets; i++)
 				udma_mark_resource_ranges(ud, ud->rchan_map,
 							  &rm_res->desc[i],
 							  "rchan");
-			irq_res.sets += rm_res->sets * 2;
+			sets += rm_res->sets * 2;
 		}
 	}
 
-	irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
-	if (!irq_res.desc)
+	irq_res = kzalloc_flex(*irq_res, desc, sets);
+	if (!irq_res)
 		return -ENOMEM;
+
+	irq_res->sets = sets;
+
 	if (ud->bchan_cnt) {
 		rm_res = tisci_rm->rm_ranges[RM_RANGE_BCHAN];
 		if (IS_ERR(rm_res)) {
-			irq_res.desc[0].start = oes->bcdma_bchan_ring;
-			irq_res.desc[0].num = ud->bchan_cnt;
+			irq_res->desc[0].start = oes->bcdma_bchan_ring;
+			irq_res->desc[0].num = ud->bchan_cnt;
 			i = 1;
 		} else {
 			for (i = 0; i < rm_res->sets; i++) {
-				irq_res.desc[i].start = rm_res->desc[i].start +
+				irq_res->desc[i].start = rm_res->desc[i].start +
 							oes->bcdma_bchan_ring;
-				irq_res.desc[i].num = rm_res->desc[i].num;
+				irq_res->desc[i].num = rm_res->desc[i].num;
 
 				if (rm_res->desc[i].num_sec) {
-					irq_res.desc[i].start_sec = rm_res->desc[i].start_sec +
+					irq_res->desc[i].start_sec = rm_res->desc[i].start_sec +
 									oes->bcdma_bchan_ring;
-					irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
+					irq_res->desc[i].num_sec = rm_res->desc[i].num_sec;
 				}
 			}
 		}
@@ -4907,28 +4915,28 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 	if (ud->tchan_cnt) {
 		rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
 		if (IS_ERR(rm_res)) {
-			irq_res.desc[i].start = oes->bcdma_tchan_data;
-			irq_res.desc[i].num = ud->tchan_cnt;
-			irq_res.desc[i + 1].start = oes->bcdma_tchan_ring;
-			irq_res.desc[i + 1].num = ud->tchan_cnt;
+			irq_res->desc[i].start = oes->bcdma_tchan_data;
+			irq_res->desc[i].num = ud->tchan_cnt;
+			irq_res->desc[i + 1].start = oes->bcdma_tchan_ring;
+			irq_res->desc[i + 1].num = ud->tchan_cnt;
 			i += 2;
 		} else {
 			for (j = 0; j < rm_res->sets; j++, i += 2) {
-				irq_res.desc[i].start = rm_res->desc[j].start +
+				irq_res->desc[i].start = rm_res->desc[j].start +
 							oes->bcdma_tchan_data;
-				irq_res.desc[i].num = rm_res->desc[j].num;
+				irq_res->desc[i].num = rm_res->desc[j].num;
 
-				irq_res.desc[i + 1].start = rm_res->desc[j].start +
+				irq_res->desc[i + 1].start = rm_res->desc[j].start +
 							oes->bcdma_tchan_ring;
-				irq_res.desc[i + 1].num = rm_res->desc[j].num;
+				irq_res->desc[i + 1].num = rm_res->desc[j].num;
 
 				if (rm_res->desc[j].num_sec) {
-					irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
+					irq_res->desc[i].start_sec = rm_res->desc[j].start_sec +
 									oes->bcdma_tchan_data;
-					irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
-					irq_res.desc[i + 1].start_sec = rm_res->desc[j].start_sec +
+					irq_res->desc[i].num_sec = rm_res->desc[j].num_sec;
+					irq_res->desc[i + 1].start_sec = rm_res->desc[j].start_sec +
 									oes->bcdma_tchan_ring;
-					irq_res.desc[i + 1].num_sec = rm_res->desc[j].num_sec;
+					irq_res->desc[i + 1].num_sec = rm_res->desc[j].num_sec;
 				}
 			}
 		}
@@ -4936,35 +4944,35 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 	if (ud->rchan_cnt) {
 		rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
 		if (IS_ERR(rm_res)) {
-			irq_res.desc[i].start = oes->bcdma_rchan_data;
-			irq_res.desc[i].num = ud->rchan_cnt;
-			irq_res.desc[i + 1].start = oes->bcdma_rchan_ring;
-			irq_res.desc[i + 1].num = ud->rchan_cnt;
+			irq_res->desc[i].start = oes->bcdma_rchan_data;
+			irq_res->desc[i].num = ud->rchan_cnt;
+			irq_res->desc[i + 1].start = oes->bcdma_rchan_ring;
+			irq_res->desc[i + 1].num = ud->rchan_cnt;
 			i += 2;
 		} else {
 			for (j = 0; j < rm_res->sets; j++, i += 2) {
-				irq_res.desc[i].start = rm_res->desc[j].start +
+				irq_res->desc[i].start = rm_res->desc[j].start +
 							oes->bcdma_rchan_data;
-				irq_res.desc[i].num = rm_res->desc[j].num;
+				irq_res->desc[i].num = rm_res->desc[j].num;
 
-				irq_res.desc[i + 1].start = rm_res->desc[j].start +
+				irq_res->desc[i + 1].start = rm_res->desc[j].start +
 							oes->bcdma_rchan_ring;
-				irq_res.desc[i + 1].num = rm_res->desc[j].num;
+				irq_res->desc[i + 1].num = rm_res->desc[j].num;
 
 				if (rm_res->desc[j].num_sec) {
-					irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
+					irq_res->desc[i].start_sec = rm_res->desc[j].start_sec +
 									oes->bcdma_rchan_data;
-					irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
-					irq_res.desc[i + 1].start_sec = rm_res->desc[j].start_sec +
+					irq_res->desc[i].num_sec = rm_res->desc[j].num_sec;
+					irq_res->desc[i + 1].start_sec = rm_res->desc[j].start_sec +
 									oes->bcdma_rchan_ring;
-					irq_res.desc[i + 1].num_sec = rm_res->desc[j].num_sec;
+					irq_res->desc[i + 1].num_sec = rm_res->desc[j].num_sec;
 				}
 			}
 		}
 	}
 
-	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, &irq_res);
-	kfree(irq_res.desc);
+	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, irq_res);
+	kfree(irq_res);
 	if (ret) {
 		dev_err(ud->dev, "Failed to allocate MSI interrupts\n");
 		return ret;
@@ -4977,10 +4985,11 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
-	struct ti_sci_resource *rm_res, irq_res;
+	struct ti_sci_resource *rm_res, *irq_res;
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
 	u32 cap3;
+	u16 sets;
 
 	/* Set up the throughput level start indexes */
 	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
@@ -5057,13 +5066,13 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 	if (IS_ERR(rm_res)) {
 		/* all rflows are assigned exclusively to Linux */
 		bitmap_zero(ud->rflow_in_use, ud->rflow_cnt);
-		irq_res.sets = 1;
+		sets = 1;
 	} else {
 		bitmap_fill(ud->rflow_in_use, ud->rflow_cnt);
 		for (i = 0; i < rm_res->sets; i++)
 			udma_mark_resource_ranges(ud, ud->rflow_in_use,
 						  &rm_res->desc[i], "rflow");
-		irq_res.sets = rm_res->sets;
+		sets = rm_res->sets;
 	}
 
 	/* tflow ranges */
@@ -5071,55 +5080,58 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 	if (IS_ERR(rm_res)) {
 		/* all tflows are assigned exclusively to Linux */
 		bitmap_zero(ud->tflow_map, ud->tflow_cnt);
-		irq_res.sets++;
+		sets++;
 	} else {
 		bitmap_fill(ud->tflow_map, ud->tflow_cnt);
 		for (i = 0; i < rm_res->sets; i++)
 			udma_mark_resource_ranges(ud, ud->tflow_map,
 						  &rm_res->desc[i], "tflow");
-		irq_res.sets += rm_res->sets;
+		sets += rm_res->sets;
 	}
 
-	irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
-	if (!irq_res.desc)
+	irq_res = kzalloc_flex(*irq_res, desc, sets);
+	if (!irq_res)
 		return -ENOMEM;
+
+	irq_res->sets = sets;
+
 	rm_res = tisci_rm->rm_ranges[RM_RANGE_TFLOW];
 	if (IS_ERR(rm_res)) {
-		irq_res.desc[0].start = oes->pktdma_tchan_flow;
-		irq_res.desc[0].num = ud->tflow_cnt;
+		irq_res->desc[0].start = oes->pktdma_tchan_flow;
+		irq_res->desc[0].num = ud->tflow_cnt;
 		i = 1;
 	} else {
 		for (i = 0; i < rm_res->sets; i++) {
-			irq_res.desc[i].start = rm_res->desc[i].start +
+			irq_res->desc[i].start = rm_res->desc[i].start +
 						oes->pktdma_tchan_flow;
-			irq_res.desc[i].num = rm_res->desc[i].num;
+			irq_res->desc[i].num = rm_res->desc[i].num;
 
 			if (rm_res->desc[i].num_sec) {
-				irq_res.desc[i].start_sec = rm_res->desc[i].start_sec +
+				irq_res->desc[i].start_sec = rm_res->desc[i].start_sec +
 								oes->pktdma_tchan_flow;
-				irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
+				irq_res->desc[i].num_sec = rm_res->desc[i].num_sec;
 			}
 		}
 	}
 	rm_res = tisci_rm->rm_ranges[RM_RANGE_RFLOW];
 	if (IS_ERR(rm_res)) {
-		irq_res.desc[i].start = oes->pktdma_rchan_flow;
-		irq_res.desc[i].num = ud->rflow_cnt;
+		irq_res->desc[i].start = oes->pktdma_rchan_flow;
+		irq_res->desc[i].num = ud->rflow_cnt;
 	} else {
 		for (j = 0; j < rm_res->sets; j++, i++) {
-			irq_res.desc[i].start = rm_res->desc[j].start +
+			irq_res->desc[i].start = rm_res->desc[j].start +
 						oes->pktdma_rchan_flow;
-			irq_res.desc[i].num = rm_res->desc[j].num;
+			irq_res->desc[i].num = rm_res->desc[j].num;
 
 			if (rm_res->desc[j].num_sec) {
-				irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
+				irq_res->desc[i].start_sec = rm_res->desc[j].start_sec +
 								oes->pktdma_rchan_flow;
-				irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
+				irq_res->desc[i].num_sec = rm_res->desc[j].num_sec;
 			}
 		}
 	}
-	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, &irq_res);
-	kfree(irq_res.desc);
+	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, irq_res);
+	kfree(irq_res);
 	if (ret) {
 		dev_err(ud->dev, "Failed to allocate MSI interrupts\n");
 		return ret;
diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index e027a2bd8f26..04d99c1fafa1 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3574,16 +3574,11 @@ devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
 	bool valid_set = false;
 	int i, ret, res_count;
 
-	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
+	res = devm_kzalloc(dev, struct_size(res, desc, sets), GFP_KERNEL);
 	if (!res)
 		return ERR_PTR(-ENOMEM);
 
 	res->sets = sets;
-	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
-				 GFP_KERNEL);
-	if (!res->desc)
-		return ERR_PTR(-ENOMEM);
-
 	for (i = 0; i < res->sets; i++) {
 		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
 							sub_types[i],
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index fd104b666836..7632bb11c862 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -599,7 +599,7 @@ struct ti_sci_handle {
 struct ti_sci_resource {
 	u16 sets;
 	raw_spinlock_t lock;
-	struct ti_sci_resource_desc *desc;
+	struct ti_sci_resource_desc desc[] __counted_by(sets);
 };
 
 #if IS_ENABLED(CONFIG_TI_SCI_PROTOCOL)
-- 
2.54.0


