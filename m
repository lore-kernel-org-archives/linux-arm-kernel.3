Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FBEEE2091
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=24FWoAmlTh3laz6QYPrpxhNNCwjmzExpnfPP6EfBfic=; b=VP+LhR4CVeERdIjsKeB/9i0VF5
	W9xD2IvMV9M5TZlyS1TuAAIKTcdVukLkjlx41cYKviBEAjCTai9hRLGXFT66CeZpxF26g6Go6+OiT
	D6IvZaHZUFYcM7Ht5KldVX3Y0fd0AFkXYp0/eNbEaHAuQrUU/omMzHmuG3riZN4plR6SxbQ57iDmW
	2cdel+kcnYReZLHn6QfTv9BG90Ab1SAf4nImXcS2snk9uHDPYYPFss7ljvTGBDd2PlCn+Ti8JrOC8
	QRZnmnXkXc1sBQ44SO6htMXO4hxwQayP2Bts74YvFqFAgVP5gOu3T4KDP4uCTPfK+386pKdqP/MtL
	GOEGTpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKvP-0000000BJ6h-2ido;
	Fri, 06 Feb 2026 12:27:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKvK-0000000BJ63-1PA0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 12:27:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-480706554beso6654475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 04:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380813; x=1770985613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24FWoAmlTh3laz6QYPrpxhNNCwjmzExpnfPP6EfBfic=;
        b=mtUcyDe3WhoBYBGECPv7PfoPVhmmqyn3Bl8gcO7RRr+6qzY9k1Kr/7TqxJWdR4aFhh
         EUkpDRxmZXj0kod0dt70YmCA83AmVFvDmOjH/uXbDqsRIMmdAmRtwLF8mI9o7cXBwQAz
         2t9vaYV7f3SP0k2bam6KiUePVdXphG61aWHOldb1/aVI7F5ISgWdIiC9fHHDMsydeejB
         CLINUJEyQyCeAZgrlqj7T7TW3eoG6yGdHZ6/GgWGoxzAXhbuW6EPDw4x/UemN6Hr6M6S
         mc3+aa16glElKqX10SPfiYiIIJ7qa0sUt/Wf6sQ8SIKI0UUMlJbpClxX3+DTNAAoGhqt
         fIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380813; x=1770985613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24FWoAmlTh3laz6QYPrpxhNNCwjmzExpnfPP6EfBfic=;
        b=n//9yjm3qbba1O0v3mBsXXtc8RRzHGLTZV2BdYftFsqfe9VYpRUsxZ/U4SZn9MSEMi
         i+18p7zUNVPgiYMGpIDFgo+v0eOxpuevSCQgR/nNwYrcwYE/Hrj81T1ii2m4X92CkhgN
         ZI4OGWnU5uocTEcE8vPyrXOGGC0fDnwNu3AB4+/XPJmIn/ucvoiPDyULZKbikThKpPPu
         gJhpwkTgQxRTCRNwIgASgMa8N8n3Y8UNPb+boSguQkCCtEFkndDho/rvWn/PSI1k2D90
         ZeiE2SJ++UVSuQL6UKaROYZp3zq4kIp+betKtvg6mbr7diWA4G49TtXLqm6IKaqU5O8c
         zDfg==
X-Forwarded-Encrypted: i=1; AJvYcCXSzc0iQaSCBU219IWYQK1LohziN6RoLiE0TDnPUklVTYbJFmEMz+0K8uCXMu+4Q+BNgy21Yx6JQS2Ok/dGzA37@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpm7FDa9uXt7WChulTg53zhhvdPed8v0TJc3zPLJX5+B8Fscja
	ZjdpIbESJWgDVhqAx7e5Dfw4nb+iumz0xqAVz/FNYjf5QECuRkqzlOsW
X-Gm-Gg: AZuq6aKW5D/LIxzSCkZ55QIgCAss40nN1ZbuP8+SIVhdI/wm4g6heFL29b1HM/G0Sf2
	004tLysw9UhhHzofhXz71Qm1Lirf1XaQUgTi2KqFKJ/BkA1spwk2oxBKMUPw6CdkSA38QzelmMl
	Xeu7oNfCQ4bXP8aBxn3ytTjtuglJRVsLNb0P/Uk0VAndq0Vzlpz5ebqLekr91d0N9pVGzg/3JAr
	NFG+3NUh6rUqU+Q5UUes4u8aq4So/XN/2N6D6RR1i5m3x3kgJfOJcj9l3cPThbYi4X4Xp6u3JVE
	cMOBjVGtOX0VD/6ai+mGHlP1lWbxGIoWOYdIgAF7lKvoopMKEzJb+GTTyDkQbBhG7BKlSPKkIBj
	663cPqbwFBv6bguzMB/IGi4/1RCawQ2DRTMFLGQilPIdQOJWB2ryPSercVw8kOxlIffB00LJjQs
	pShEucbdI=
X-Received: by 2002:a05:600c:c16d:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-48320216097mr35801865e9.22.1770380812676;
        Fri, 06 Feb 2026 04:26:52 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d299bfsm114441375e9.2.2026.02.06.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:26:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge
Date: Fri,  6 Feb 2026 12:26:23 +0000
Message-ID: <20260206122623.670023-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_042658_832010_E68FA7C7 
X-CRM114-Status: GOOD (  10.06  )
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

The original patch at
https://lore.kernel.org/all/20201027160631.608503-2-fparent@baylibre.com/
included the values for the route masks, but they got lost during merge.

Fixes: 060f7875bd23 ("soc: mediatek: mmsys: Add support for MT8167 SoC")

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index c468926561b4..eef14083c47b 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -10,24 +10,29 @@
 #define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
 
 #define MT8167_DITHER_MOUT_EN_RDMA0			0x1
+#define MT8167_DITHER_MOUT_EN_MASK			0x7
+
 #define MT8167_RDMA0_SOUT_DSI0				0x2
+#define MT8167_RDMA0_SOUT_MASK				0x3
+
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
+#define MT8167_DSI0_SEL_IN_MASK				0x3
 
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
 		    OVL0_MOUT_EN_COLOR0),
 	MMSYS_ROUTE(DITHER0, RDMA0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
 		    COLOR0_SEL_IN_OVL0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
 		    MT8167_DSI0_SEL_IN_RDMA0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DSI0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
 		    MT8167_RDMA0_SOUT_DSI0),
 };
 
-- 
2.43.0


