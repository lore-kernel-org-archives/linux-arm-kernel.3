Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694AACCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D510WMtJn6qt45zniahXCzgTs78JgIjBCMNt/1RZUFI=; b=28QvRN3r+FiZVMXJl/cIgsT9FP
	QWcGzUaFaGTKMRp/9xTGS4suSSBdnSw3hQ41d/7H+xqUr0FcDVhAi+zx1IgDTupcRngkusFT8LbwY
	YaYVd76vq+ZUDYldhUJVfv5ItVRwC+4La2p7nNKhCMBVcBArh/CZpBoX5t9OOULg0TuZ/rIAPnp1S
	5mY4oczfr8u+bJ2V3to653sz1MjK/ImlYbOhhnjE9sQGexci3MkPWIOO9Pq0HXS0d03/rKeejSdJ6
	ZMU8v/6gTzsRGb7rVhjVSHYhBs9k43xapHsetT2LyuvR0llfeHKClXznEWwhIL/Mgk0RK2uYBLTtU
	ylXRL/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYh-00000007OoG-2QXH;
	Mon, 19 Oct 2026 12:33:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYd-00000007OlH-00EM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:33:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1191663f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792413217; x=1793018017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D510WMtJn6qt45zniahXCzgTs78JgIjBCMNt/1RZUFI=;
        b=IihDtvGDtih2sFwvIunN3srBnIXXI3H2hR6QAy+zOyiBG7JrMoky+4m3W/c0nd5oqr
         yxLMM4VftjFrk/ZyXDWdBc5kBc0AbTkQqojw26iwadI/jZdMwfIeCYR0kt3I1Wz3wLT+
         Pa6AvdoDXwY+aaZ0lAPEKEsIEfIfcX3IZPiGM3c+hcxJ1PV3LT1Po40n03d1W78Eu8Qz
         fIRWstC+9HskEKNi+ydV3IwyA7hOTtfcoDH9ow0xt91+/6gS1lJ8f82Th87/01Su3O5h
         T47gX7n+WlBadm83eR81mzrhUeB1xTds5NxF7A+konCwl258vhqmOUyowjCmf2BUwxXG
         sREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413217; x=1793018017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D510WMtJn6qt45zniahXCzgTs78JgIjBCMNt/1RZUFI=;
        b=zCM3SyVPA94x7x4uxeveWfupwPiTq5ErRYMvLBczznB5VJbjBM45xQ4DRduvaU7sE+
         kpUHbh98xgEvd2pYHOPhocaivT5jroyEFH7+OumDzIyrQTRsG00ddZcrb/VxDGjsXsIl
         PGnEk1MG0EGLElS7M9LQDhEPo03Q+Cn/nWAj48D9y4+7aKWuBFjFZn66iV2YUVBjI2nV
         phA6MaZk+mlyYHIBwF08uxIGeV8E6eVxUSkQSoiDpp31/lnz8OC5Oq2OBAlUaYbMeLCh
         tJe7xG/+GcFA+D96r8jOBtiLdnKXnMH92Y0y45oUNVJ+DOlrAPETO41g2MY5kay3LVxD
         mAMw==
X-Forwarded-Encrypted: i=1; AKwUvByl84GXMuD5/WGDuGQtw83GqZM/Clj0h54oN/MOEDe119GvbtGfVMncOl+wDPy7VcRuPEydThMRzoBQy1nvkP4D@lists.infradead.org
X-Gm-Message-State: AFq9FYJQPwtD5HQSSFDFDxLH2v+mdJJI0UKDXLB3qOXLIf6Vl9vMiL7H
	QJxi3n63BBR21GrbIve/08A2+hoSw/i8anYPtjmeShtrO5H3nxjOVwQC6wVFZQTaAsc=
X-Gm-Gg: AYBFou0idXNMCQnPb835pG0LSMV9d6L8yyAsoSnt8czDkPhZfNAOpM6MfSgFF/m4rmS
	PwPHvxz+wkHR3Lfzon3k/NxNnSIAZ5o2JRJL9TZZnpeFUXNWcXpaL72yHjIpZJTO9uPROvLXQ5X
	4eum8jZbDxz5xH7JTjtlxjWDJ/O/mzr05HQXfep4WSFuH/6HDpd4iX7eWq6msp0nwLyXW3+9IA9
	T5vCY3kValVZgtda4mBBiva/bywUKgwrQd4bOt9u7pgI8nGzlrXsIVuJK8EjsIxDAAKnY6SJe+h
	qWHYjJ3rFeF5eLH9+KC14t35g7Fq5iR3BAi6Xbp0Ev9WVWY+kB8uk5sI/VOpWuQDfV/cc+Ue1Yf
	dvjCVIr6Gm/X8sGKg1GlN1++FD+1tQwI6Z9/U3jAzJuBdZ7pbshCiJ661Hl7BccvpXO0BmW26l5
	1WhyZWMTvCr/Ob0Zb2+2lapJXUBK6WqqZsdR0EguC/mIEKfs6PnNaY1ca+gmIMcSN80r3Px3Pdw
	FkwvCvTMhETJuswJFn3sBxNk9NBYukLM2GemsjlFfsVLCLtZ0ptCgLygwuXgYKCrkryLLiAlLwZ
	L4g6vDu+B6WbbE92sS+A5ByF/tiU+ndk0xlvz8KJUWgWIc9z217k8uk=
X-Received: by 2002:a05:6000:4b1a:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e07fa2f48mr13222112f8f.51.1792413216789;
        Mon, 19 Oct 2026 05:33:36 -0700 (PDT)
Received: from [192.168.1.100] (2a02-8434-7c41-c701-8278-849f-666b-c282.rev.sfr.net. [2a02:8434:7c41:c701:8278:849f:666b:c282])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm24677930f8f.32.2026.10.19.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:33:36 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 19 Oct 2026 14:33:55 +0200
Subject: [PATCH 1/2] pmdomain: mediatek: mt8365: fix defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-1-dfd445dc3763@baylibre.com>
References: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
In-Reply-To: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_053339_069009_2EF73697 
X-CRM114-Status: GOOD (  13.14  )
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

Fix the names of some defines for MT8365. Looking at the datasheet, some
names were not aligned with the datasheet. While at it, also fix some
indentation issues.

No functional changes expected.yy

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/pmdomain/mediatek/mt8365-pm-domains.h |  8 ++++----
 include/linux/soc/mediatek/infracfg.h         | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mt8365-pm-domains.h b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
index 33265ab8ce76..3775e4dc2c91 100644
--- a/drivers/pmdomain/mediatek/mt8365-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
@@ -52,7 +52,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 				MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_1),
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
 				MT8365_INFRA_TOPAXI_PROTECTEN_MM_M0 |
-				MT8365_INFRA_TOPAXI_PROTECTEN_MDMCU_M1 |
+				MT8365_INFRA_TOPAXI_PROTECTEN_MM_M1 |
 				MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_0 |
 				MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_1),
 			MT8365_BUS_PROT_WAY_EN(
@@ -92,7 +92,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 		.sram_pdn_ack_bits = GENMASK(17, 13),
 		.bp_cfg = {
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
-				MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_MP1_L2C_AFIFO |
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_S |
 				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_M),
 		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
@@ -129,7 +129,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI(BIT(25)),
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
 				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0 |
-				MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG),
+				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1),
 		},
 	},
 	[MT8365_POWER_DOMAIN_CAM] = {
@@ -183,7 +183,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 		.bp_cfg = {
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
-				MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_INFRA_GALS_ADB |
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_DSP_EMI |
 				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_M |
 				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_S),
 		},
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 9956e18c5ffa..d2cfa09f81ba 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -6,29 +6,29 @@
 #define MT8365_INFRA_TOPAXI_PROTECTEN_SET				0x2a0
 #define MT8365_INFRA_TOPAXI_PROTECTEN_CLR				0x2a4
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MM_M0				BIT(1)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_MDMCU_M1				BIT(2)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MM_M1				BIT(2)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MMAPB_S				BIT(6)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_0		BIT(10)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_1		BIT(11)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_AP2CONN_AHB			BIT(13)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_CONN2INFRA_AHB			BIT(14)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0				BIT(21)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG			BIT(22)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1				BIT(22)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_STA1				0x258
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_SET				0x2a8
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_CLR				0x2ac
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_APU2AP				BIT(2)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_0	BIT(16)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_1	BIT(17)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_CONN2INFRA_AXI_GALS_MST	BIT(18)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_0		BIT(16)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_1		BIT(17)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_CONN2INFRA_AXI_GALS_MST		BIT(18)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_CAM2MM_AXI_GALS_MST		BIT(19)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_APU_CBIP_GALS_MST		BIT(20)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_INFRA2CONN_AHB_GALS_SLV	BIT(21)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_INFRA_GALS_ADB	BIT(24)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_MP1_L2C_AFIFO		BIT(27)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_INFRA2CONN_AHB_GALS_SLV		BIT(21)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_DSP_EMI				BIT(24)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_S		BIT(27)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_M		BIT(28)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_M		BIT(30)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_S		BIT(31)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_M			BIT(30)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_S			BIT(31)
 
 #define MT8365_INFRA_NAO_TOPAXI_SI0_STA					0x0
 #define MT8365_INFRA_NAO_TOPAXI_SI0_CTRL_UPDATED			BIT(24)

-- 
2.56.0


