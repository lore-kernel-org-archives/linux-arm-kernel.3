Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56617CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=; b=4d6yqz2f8RyF+BbpbCa96YIryp
	An059KSU7Kf95ciqiovh10K6fEyUCBPeYu9ubcYWn8F1UbGB9DxjV0tEpRYR1xGNm83EQmNxMcgR3
	kwtSj4wH7S99LatlYI4J4zv9/4lwGFMKAMk1HS80Tr6sgXN8l7AtjeDRnCLv7clN7lP6ZlLivdgUu
	uiXbuDqPaEhg6Fd+VD0tmS6IPzNzGm/YS+gd8mb54pCo/BHqzelFJKhOydwDM/x+pxIN0ilzVdx35
	6RB9dTGzGTN5Dow1Ln+ViYwc1/LV6hAmahPDXUs9p4JmQ77YfzewS65yGpVO2j7s04zRvg6pHF0+L
	pzs4G9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVhE-00000007yev-3jWW;
	Sat, 10 Oct 2026 11:57:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgV-00000007xzL-0Eqy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:56:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so4390875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633373; x=1792238173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=;
        b=h1kUsPx0fCCTBqqyWiIft3tP5QnEX3Eqq06ZGUShIbJAj9PWHPsOI5+M0rI7gH3bwT
         OPA4P6VKob30Vo3usm1Nj0s9TPqhgwclz365W9FPw0MGvWEgmkC0YwOUg6o0LKr+C2yF
         UuN0ATb0ES6n+b1kgYjwS4dLYSgJZZmKYz1DyGvn4gn+QgD4GokHz585KM/4pKBiLdXh
         1gDZWLFba41bL1tNFRUBYEZbV2iJudATN552eXvLqm8+zTAnM7yIFEFUSRDUTcnkHIHl
         DHd1Yo6LxctI7lflvnahwGDM1539EeJpY2AzTqhn1vgGR8LQb9wUkQyXdzW+Q8FuNHaC
         jtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633373; x=1792238173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=;
        b=TxTd4AxAX58gdddMupzl7D61Ag+QTiVRfZy//TncFhMv1C1c+QOXDvElfL9fhQC007
         r3VhTxzF8v6UUIhJP2NEY8gs9nPMuJC4N88g4eGbuLwgeemRjV9LT2v53Tut4tG4dn5h
         1XDwfHvCwELx6IlM+/bNzh4bsBAlm74gr2Nzck4MZUVoTWbhzvzUkMnywSUPEBNSJFuR
         8cub8gCtcZ0vo7kI4GF+GuE9hkwVb0d1gfIK+z/YEGxNnfVYNcGnM5ETgu194b2Ua9dZ
         5aIw0WSQAkNSxywexbsX2BJhMUJWfISm7glK7pn8TxmWJ0huTf8XdeeNXTyo0rQ1twXy
         rRtw==
X-Forwarded-Encrypted: i=1; AKwUvBycSk0vkRSSFbANBWUso4xa4OF+d3zVlIn7PpJszwMDKGeG8CjCyrD4Qi82iSUTv79RvvWqqvNrMwLU+75gIqkh@lists.infradead.org
X-Gm-Message-State: AFq9FYJC1f4JBt0rHfzLvIY8RtnceU45VQdfLGnASu8ioCviXUzyvxpo
	1/auBnmVDntwr+J6rGwcDI6YCbvqERobDjR4+BsT2IdX3WH+Cb59b1O6
X-Gm-Gg: AYBFou1oNign119IA5+AJuFh4ayjMW90IntBIF99Ou6gwzuECsSW9LB4mQBaqtLLkdq
	IfGSICwJharoNmhuZbwJa9yP0BKI564SEHBGhhdOxMT7ppo5uoTGcp3Ex3wcAMPdzUOMmO/LpvG
	hFbuKXUFS2NAGuMETB6zZIZJ7oeCXJDZGG4Q69Z8yEom07hDB0y8k4qJzUr8rzFgxn0vpwa0QC9
	cQchOI0454K3oo2rgZeOE4I08xiopbmGM1Y0dfJ6kLHXlnoASW7v0VIMNjnAWBe4oGbhFQdWbST
	K17QUhMxH9p4+HfaHgrWtkc81pRq2v7aLAdINI/nE/tvKWhsNVNM5EPJvKxrE1SIAb7eIM1DHBe
	T+pAZ8xMPkxoj8Iszy8zGWMmMEUcysq+5Vvgd41iLfvv20fTaL/uy+scvGu7ccdGhJ2Bf9ooIQo
	13aVNAa3H6Z/Rn5LsL4WOKsOn4jZ6J8OGVoPdlgRtFxt9vTMvpgVtccgRgKEgNB5CIHQ==
X-Received: by 2002:a05:600c:6749:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a18e49d633mr79294265e9.7.1791633373147;
        Sat, 10 Oct 2026 04:56:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
Date: Sat, 10 Oct 2026 13:54:06 +0200
Message-ID: <20261010115539.9237-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_045615_174519_0E0EED49 
X-CRM114-Status: GOOD (  14.05  )
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

The secure output control bit toggle for mt2701/mt8167 currently sets
bit 0 (DEEP_COLOR_EN), 1-2 (DEEP_COLOR_MODE), 15 (HDMI_PSECUR_EN) and 31
(HDMI_PCLK_FREE_RUN_EN) in the same operation, but only bit 15 is actually
controlling the HDMI_PSECUR_EN bit, the rest of them are already being set
in separate operations later. Add a define for bit 15 and clean up the bit
update operation.

Fixes: 0fc721b2968e ("drm/mediatek: add hdmi driver for MT2701 and MT7623")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 9896eaf81e7e..781177a1f190 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -63,7 +63,7 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
 	if (hdmi->conf && hdmi->conf->tz_disabled)
 		regmap_update_bits(hdmi->sys_regmap,
 				   hdmi->sys_offset + HDMI_SYS_CFG20,
-				   0x80008005, enable ? 0x80000005 : 0x8000);
+				   HDMI_PSECUR_EN, enable ? 0 : HDMI_PSECUR_EN);
 	else
 		arm_smccc_smc(MTK_SIP_SET_AUTHORIZED_SECURE_REG, 0x14000904,
 			      0x80000000, 0, 0, 0, 0, 0, &res);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
index 2050ba45b23a..e0c35277c553 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
@@ -219,6 +219,7 @@
 #define DEEP_COLOR_EN			BIT(0)
 #define HDMI_AUDIO_TEST_SEL		BIT(8)
 #define HDMI2P0_EN			BIT(11)
+#define HDMI_PSECUR_EN			BIT(15)
 #define HDMI_OUT_FIFO_EN		BIT(16)
 #define HDMI_OUT_FIFO_CLK_INV		BIT(17)
 #define MHL_MODE_ON			BIT(28)
-- 
2.43.0


