Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCCEECD6E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1UoJesX+GyRcMVK+NyqzvpYJuioaZVcWp3DlX733fk=; b=rH3lnDdTbMJ7/NmzWXtO5/6p1V
	jXZWQsPSLk2MaTvybMWir0tfHXsRqBXgtDqFpEHtATmiEZ4reIilm+/zgCdoEk/dPe5LePMNtwGmf
	nCnjbxKgnRWCRmZqqc2A0KWq54u9RrVDfWiSC4wKOxXnmY+ty+AtZORCOcrcoMa1/7NJgvXfTAZeU
	zDoBE/UqPDra1ky9CtlIFPnhGycrx0XzKN3a6dIBeeI5UHbfjSJtcPoGZFiRHsVbKUOj/YBJKrlkG
	NaPNB7p/EAvvBO4jJsj2eKa/SwiPPUsUgPR7Qr/ILu97pV3H2xJcKQg2hR68wqT/gmhf7MCAuLsEe
	WPv4OQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXd-00000000xQ6-3qZM;
	Wed, 11 Feb 2026 19:06:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXb-00000000xP7-3FMU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-483487335c2so30150135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836782; x=1771441582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1UoJesX+GyRcMVK+NyqzvpYJuioaZVcWp3DlX733fk=;
        b=IXoQ04hzC2DnzkqitvSA9drJCsvCXr7iXO5ZhvlIrJFiuKJYR25VkKc2K9sBdGCSbw
         1SCaQF4mfxlID20RTAGXgiW4wt6tINobBRt62aF5K9PdFfLDwrSjSc0qdnrasF7XaI0A
         l0IZoawpjZU41t8UinQ9u6EKNA95ouWhA795+719+jj+ZL/rPNmAe26mA+vIVnbnIFh/
         Dmn+2WR76chvOuUXBJPexUggDk0+SWrqjia48Q8roX6HqaZ7nQbahLQr0NN8T8k8MHfw
         BvhVTJ7cuZtOurCG6xW6GnbG9YraQMB0Y7UmeQ4RR5+1UQiUq8yT9ddoeL71q3jJRReX
         HkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836782; x=1771441582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v1UoJesX+GyRcMVK+NyqzvpYJuioaZVcWp3DlX733fk=;
        b=kgBWmAQ5dwHnS6As0Br5r7ooNDHfAr2Wjhlt+Ox1cbi6yc6Ja88w7t0mf4PNw1cqmz
         K8AO92lwN92WRnWj974CvQhqPujQ5LB8CrBNOVLN2IPzLMK+htQZucnKgZQNWwnorh+W
         etqyux42c16Pfyg6aCYbpDdzUTzs/I308eTiWvTWsOOw9c8WC5zg2e4zH4U8V1iI3TlT
         Zg/bZZqi2OxSnSSyfrTJEBA+On/pST7l5yGwCS0jFqotggnsx0mlOJowQvFel95hxuV0
         wIAjZ9VSHRtUTKsdIaVyoK1Uvw5UkUGM5rkQ8L7e6O7bZ+hxmc+ags4u/H+CGobVH/Ja
         lHww==
X-Forwarded-Encrypted: i=1; AJvYcCXxFODdlG4DfWJytZr6C5UM/20szupMFv1tHq6mz77u7MWAOpvnZcTXdXxSFScmlcHyBXfa8M9h3sHj7uj5CkF0@lists.infradead.org
X-Gm-Message-State: AOJu0YzjZ6R8v/AZ6w1cIPPPfjtz0Gl6OvdK24Qf0RAuVIi+IYfr9qEI
	7FB2GrK2wmvfWoKyAkbKBFUIIxCiWNDFKfvFnjQazSuBN5xUhvt+MBCt
X-Gm-Gg: AZuq6aIKjk5ZBOItZaEWfDeLPiDaaqz/Nq5PzxnIjWlMqGr8LKVN82GmTqoGMfsiCQk
	aGBKI7MjBSf9WaJpbyUGAmHW2HQ+2xyspozHbnLUGnbY4ritoX95LLhXJEORRxOFoPyLa9Fh+uA
	Z/PW9MEW9CkZ5RgwZEqgF/2R9E7Wb5S5VK8Ddu74Q93664yKlDnmgD653+eXkMGx91hoe9OPUeo
	9NPrMiUl4heZaEIc7ajn5yXpxfnA5dTGx77uy2Wzxx0fsHDGq9apPjsOVuLih+WVdy1KE7HtiU1
	igaO/5pAKviwtWM4tdUF6PXPC1XgijTEeAM2FOsG75xfeHf6lI4ekTjWPxknqg90qxhW0RbJBtM
	eSnYppL1mROhk/xxlNJCbAc6ehWvTgoqr8A7skKOfNiumTT/JaZxSqdzs3IHEoxmdfrBk9drp8W
	m5rFJuG+y1uaqqDxUarJ8=
X-Received: by 2002:a05:600c:138b:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-48365723e48mr2761705e9.36.1770836781584;
        Wed, 11 Feb 2026 11:06:21 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:21 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Wed, 11 Feb 2026 19:03:22 +0000
Message-ID: <0ab331c556d76ddfc7f287d6288c4f60f4ef90c8.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110623_845475_08284B50 
X-CRM114-Status: GOOD (  11.93  )
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

The mt8167 SoC has 64 MMSYS resets, split in two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144), as
also stated in the downstream kernel for the Lenovo Smart Clock
in the ddp_reg.h header.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 3 +++
 drivers/soc/mediatek/mtk-mmsys.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index eef14083c47b..2d20b21fb0ea 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -18,6 +18,9 @@
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
 #define MT8167_DSI0_SEL_IN_MASK				0x3
 
+#define MT8167_MMSYS_SW0_RST_B				0x140
+#define MT8167_MMSYS_SW1_RST_B				0x144
+
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..03cbc393f978 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -57,6 +57,8 @@ static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.clk_driver = "clk-mt8167-mm",
 	.routes = mt8167_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
+	.sw0_rst_offset = MT8167_MMSYS_SW0_RST_B,
+	.num_resets = 64,
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
-- 
2.43.0


