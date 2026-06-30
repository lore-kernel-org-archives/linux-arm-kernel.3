Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+chNJkaxkb+6yp2ClCCdQny6Z296FnDe7g4ZtG0EO+E=; b=btG3udWbtus/vBMgc64I3ZBl+n
	vNcMMPtpeNIj3fpJ2bPLffJjstO1YRSqwg1i88as1P8Q972ZWUJ8ZVfW8Y2IbQXAdtCeVyx8oGe01
	WUvSNjI3TUjP6khhMgV66f/sqMJHSlWYCMj2EMfEfnAJi+JBBU+qKCV8aGQHGJmeug/mccrtvvzR0
	bWXUMXcNd0ALke2Wwv5zzDP4JfdEMz91LwbPL3K/wyodZj1DmIvpcyUso9vjgtENINQUYXTe46ZTG
	hitdtBOUuduf+bqVPZZRCPAXidriUbcF7/vs4/fL7Bi3inTER+XpBTHXGkpPJn/AZh0PpO3eYV7eQ
	ERbcTlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNRa-0000000FfTh-0Jfh;
	Tue, 30 Jun 2026 01:39:22 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNRY-0000000FfT9-1Nx5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:39:21 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-847a5528b33so38301b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782783559; x=1783388359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+chNJkaxkb+6yp2ClCCdQny6Z296FnDe7g4ZtG0EO+E=;
        b=i7cRW8F3VaSAXuF659NowyVSgO2g+HaTSfJJFDpm9m9gnLz5MCCTEknkgF/9GZUOif
         lp0l6IYXONlJnA3DWTeTGL4ZIzKepvsXjj9tK9D91LsFjC0XzN3mdukRx87ccUvFI7Z0
         kWQf+R+zVb85QQqugF54rxNzOVbgJ78o4NtgbWW2h55HsP6s6L3MsfrIc/tl+TbuhAKe
         tIswRm+4zo6hgbLRTwwqm8PxU6U3eT4MToovOPp7Av7qy7NZEnEShOCphunjH2DsMHEq
         p7+6O01781FkorV0B6FJ9jTpmy4YTju6XqiTaF3uiqvQ/SaXtpOAB22CuFAxm9x2/OgN
         9TLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782783559; x=1783388359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+chNJkaxkb+6yp2ClCCdQny6Z296FnDe7g4ZtG0EO+E=;
        b=pVDkFQNXtlaC3U+9JsgSkDt/cSrBRObgniYDMc6nZiAasObkfuHEDGYr6s0g1FqdJ7
         9I97XO3OKJ9RptA+QfiHJJnLn60gzzikZXQ2dwli9L0uDRmOdtLdAS9VPC9+WPP4P38e
         HAoS5/n9OY7B9z2PnUhKdpI0fIMtdEZC3vgTAD14HLXewUF+yYbTN202dpwlnP1xSXnA
         yPeFEtsraFh2+KS/ZP9ZloA+/KQdDSIWoqy4ZmwVf9TiqFCpG0U0pq/SSI5zit45LrXa
         UuVqEqSSOXQXgikypt5Q48iV8JcuqiRsspnp7W7nUgXgFWahT7dZgpi7W3rlKAiU42qk
         Hcmg==
X-Forwarded-Encrypted: i=1; AHgh+RrPjcEpp3aBRdegFHdSfvWjOIZNPWhzDmY5kKubcTqJ8b5DU4fRkWIUhECLL+z0qjz0me6O56pxla9xXU5NugfQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyB+Au/r9WGA7Yg7BXUx2BsPQKDHKrZAqvQOj3CdsOkD/JMLnYX
	qEcEVZgN/JObmh3sMY2W0OtSdLsOQM6TQR6V5fWcXb2XDKCEW5xai4Iq
X-Gm-Gg: AfdE7ck3Zkv188oCV1aXzOXvzFdZL6z3zekQ6CqWVMWXCD5MljvfbPFB8C4NMtxw8Lz
	/npjnmh28fIzh0qPy4QN65BYlCWB2CajElP0AQcPJjMTHrlaGz0s2GcqKWLLdJv/AMqB9+8eBMu
	gJnqXb9ZHKZVpOrZF4YrsSKzkSgHpJJ2deGaOVdgM0unF6d/xbZrPYwpN67b8e1tz2ZNYf41+2w
	f6exUaglXsyoFRoQLf2upuNgb+d62zDELNGjSp1Sbf5Hpm2KgGDLlsyuxZ/wTYwVsJrSlzSWWq1
	E1ad/IH2vV6+dWkvM7MraAruM034RNh5M6HGKK0zy0nzz2h6G1gmK156i40n/kHQ4pSu8VgwfE5
	J0kvVLo+RqKl+LvjY2l+/acGSQ1sV9qh+2DykZ8y5yIjpmfTDsEqpiaM5R31pqYNlAlQG6a/T2c
	0ziHxqBCpncjvyy/8MGpItVHNPVeAJwh11purB8qvrtSmRSwdpXGS8w0IrauT5Bx+wFm0lV/qCn
	mrgFJTMSg==
X-Received: by 2002:a05:6a00:44ca:b0:847:77ae:8845 with SMTP id d2e1a72fcca58-8479f2701b7mr1301770b3a.44.1782783559292;
        Mon, 29 Jun 2026 18:39:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ff89fe5sm692853b3a.5.2026.06.29.18.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:39:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TI...),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] dmaengine: k3-udma: simplify resource allocation
Date: Mon, 29 Jun 2026 18:39:17 -0700
Message-ID: <20260630013917.1537819-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_183920_411408_8FA89A09 
X-CRM114-Status: GOOD (  16.11  )
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

Fixup ti_sci as that also breaks with the header change.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Nishanth Menon <nm@ti.com>
---
 v2: rename to k3-udma and add reviewed by for the ti_sci portion.
 drivers/dma/ti/k3-udma.c               | 180 +++++++++++++------------
 drivers/firmware/ti_sci.c              |   7 +-
 include/linux/soc/ti/ti_sci_protocol.h |   2 +-
 3 files changed, 98 insertions(+), 91 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb..2480d22466f5 100644
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
index 590a464403c5..ef23d732e083 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3693,16 +3693,11 @@ devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
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


