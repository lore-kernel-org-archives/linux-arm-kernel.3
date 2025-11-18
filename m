Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAE2CEE332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=; b=ZFZ3+Z5sA0renb/oDU1taa5L5R
	RrTy/kkIyOQQ/UHeOro5D2nD8umUCfAGTYm1rNeMVSTkHnIG4dhLinyZUeGTePhCuaOdAZjU1tiZ4
	2QxNwj4v5IdoNjO5vGP+4dInbs6KQa8Npnsgwb90ezXVQMHcLNlENJP8o/+2dU3jkm3bwwSU2sv/p
	gnpTvs886TqPtyq5r+hHQYb1BQuxsF9G3Dm/SLOeZ595A7eC9O5d2IDlmkqhSrJzgnisD7pdAyRWe
	fRKJIwJ/Ra/F+dl++4AuAVs/mz9Ezww9npScXyVNyFMoMTdOpG3PYTpNLdTMfp3OUondm0+l792Yh
	xPWJx8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOAX-00000000g7N-0v8D;
	Tue, 18 Nov 2025 16:03:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOAU-00000000g5i-0CyK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:03:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477632d9326so38780245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481776; x=1764086576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=qbd4GazF/2YzTDknnN4ndORQIMZ6YrlY6MdSAaAsvo1fORBLqZpx7QhAA9YmfovL7t
         6PrrSaOVrIeiiKZezsJBAjXDiNCKuiKy6/tu4eDDG+DL3sk9BJ8P6obGZOXLKiQDNb7u
         IHZusa0NihG5PI9iuFYimQ5s3P3qyuRHcP8tjO5XQG4SatiiUeICohgMdOFU88py+yKQ
         BO6o15tIlyyqL7E1RvN5vHKBj1Sd0TqSZ4KxLrxXcnNEjoraw/yWvW6i/o3j34c6m1xE
         iXDeQknD28U7JSR87UmMCblaXZ8GwA/KKj7IZ01j2PwYGYPgeMAmHNI/rq41LreUK6/4
         DK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481776; x=1764086576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=TlwnDAsLBSGWzVDMNAHcFENGaROgVkPbooPEJZDn3hwHUklkcfXmwRzwV5po97VBKV
         Fx9m2Ps0K6JWm9scQBdugkpwPQaoJSGaoo+A9myJxlqrHlJP7ghYPXOHnznnIpdj14xf
         ej8joeSXKi7ztYOKXvv/BjcsyN7odfPnVadlz2fj8sAvlKS4s/5gvmrIVM6oX2V0pIvh
         VS3ZZol7VrNx2L8XFfswbf89ah2NTya8eEG8zcCX6/RPkS6HBgOysl7QnnV9wHAtqtUz
         iinEEjiQ3EN9UZWGBKK+eNCA09D2tIN0uLFTH0QFNfnvW4p1ZI3SFCh9tU7L32c3cz7h
         pfqg==
X-Forwarded-Encrypted: i=1; AJvYcCXfl5sT4mSOdBgtOpFgISbuZ4JM7KuAGR5Iu8HbvEOCIiaGmd5CvxEP1vkCxxZyX9jSIsgxYBxlmNWDpZkn8yep@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjwvy0XGvlGiCQ31U30YkueTyg2DFIHI7Dv30PUeogbFYSdr/A
	aqJsAn28JKkBFj9MTMhC8MmVVrSKtZiGj/Hs2sAMR7OshwU7jVLXeNWpGV8K2ccSqnU=
X-Gm-Gg: ASbGnctoNC44aFTaoaCXv2lonsvcJTIkwtUIj3F0y1/xXe82h4I+VKIVSLNcA5N6eVr
	qMyqz7xWzvXk0ms/VzljvJkS+X9cMjIe6srkiJC5gIsOkR7kq+V2bp8uwkAxFbePaQWKwbWL8UF
	JK0Ss6AHsPi8L6LzJmfzFlfCe/xlBFM+pFSiU7ruon3kwfspRebeZQsP0TOFm7sDFIdlT4PFBDj
	soIZLqP0hYLLKBYQ+BKmoRIGWrk0zED6MMa6o7OJiUll4pQXfJRj8l0YbCynNBW5NtFvYhCPzrH
	UZaZQc8YTo4XRRJ0aIe8h4N8hRcG+eqvwzwXu9UFklTr0HpNUR0nF1EzCnp+id8RwlHgo5x37rP
	kuFaHm9mXBkMUYssnSCISOtOjtr6Ags0qBOxScUzsM5lKTIHkr/R/eTBb/csKW9y3Er5NRoZD86
	xP7wAJFgHjzMuNg2G3R64=
X-Google-Smtp-Source: AGHT+IG+BDNHdoKr+nmoBcJhjAG/ZnTb/B28SkxQADb4sfx6Pq139Gu1ATJ4y3Mlt9Ib3CscQR65Pg==
X-Received: by 2002:a05:600c:1f12:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-4778fe9b44dmr169442525e9.21.1763481776169;
        Tue, 18 Nov 2025 08:02:56 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:76db:cf5c:2806:ec0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm171954575e9.6.2025.11.18.08.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:02:52 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 2/4 v5] PCI: dw: Add more registers and bitfield definition
Date: Tue, 18 Nov 2025 17:02:36 +0100
Message-ID: <20251118160238.26265-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118160238.26265-1-vincent.guittot@linaro.org>
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_080259_438026_EB3211E8 
X-CRM114-Status: UNSURE (   9.09  )
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

Add new registers and bitfield definition:
- GEN3_RELATED_OFF_EQ_PHASE_2_3 field of GEN3_RELATED_OFF
- 3 Coherency control registers

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index e995f692a1ec..e60b77f1b5e6 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -121,6 +121,7 @@
 
 #define GEN3_RELATED_OFF			0x890
 #define GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL	BIT(0)
+#define GEN3_RELATED_OFF_EQ_PHASE_2_3		BIT(9)
 #define GEN3_RELATED_OFF_RXEQ_RGRDLESS_RXTS	BIT(13)
 #define GEN3_RELATED_OFF_GEN3_EQ_DISABLE	BIT(16)
 #define GEN3_RELATED_OFF_RATE_SHADOW_SEL_SHIFT	24
@@ -138,6 +139,13 @@
 #define GEN3_EQ_FMDC_MAX_PRE_CURSOR_DELTA	GENMASK(13, 10)
 #define GEN3_EQ_FMDC_MAX_POST_CURSOR_DELTA	GENMASK(17, 14)
 
+#define COHERENCY_CONTROL_1_OFF			0x8E0
+#define CFG_MEMTYPE_BOUNDARY_LOW_ADDR_MASK	GENMASK(31, 2)
+#define CFG_MEMTYPE_VALUE			BIT(0)
+
+#define COHERENCY_CONTROL_2_OFF			0x8E4
+#define COHERENCY_CONTROL_3_OFF			0x8E8
+
 #define PCIE_PORT_MULTI_LANE_CTRL	0x8C0
 #define PORT_MLTI_UPCFG_SUPPORT		BIT(7)
 
-- 
2.43.0


