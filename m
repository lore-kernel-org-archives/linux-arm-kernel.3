Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A6FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GEUWWsZO9Y4aSgqzYoVNTcFQHL3q5FqeUAj/aPUjX2A=; b=CF9+lL4HD/RP27uN894sqriq1F
	7NNYeJvl3YWTDRvLZcyR8lOplTxRALQINO0PH8bTqiZEMMxi7z69nfplPoyq7eAF166M+3ApOELu1
	PSDDjOOnoZoRRLHo2rXTAboRkP1ZFWTc5NCcJmxx0g7ZkCAwXzvO+M35eRSLxuUJNgnNvqQJKcG4z
	NfsUuSGnZnVGQS5LzrIyk9YqEBbnSY8BB5KJgx0PtwriqUB4BmGHqhgkHCEyRFFZioNhjOZhzaRqs
	w+EKs8id9YW75TWIjTAu37m5mjQ+oi1mdz58JkZZHD6eFVeGAzSrfWea1FkrfLpc7hQ/k2q4ZecyO
	j+2GvvJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0ni-00000007k1o-36x4;
	Mon, 18 Aug 2025 14:25:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0gU-00000007ikz-1C25;
	Mon, 18 Aug 2025 14:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755526678;
	bh=6wt+TFbCgRTq3CoWDUzF4dMYm0Zd3ReDlyfg41hupY4=;
	h=From:Date:Subject:To:Cc:From;
	b=npSLXimayB4//c9tMXNr2mK6QsIj6HoqPX/U4mXW6Us64vmnnGNoC9/0LeafiN12T
	 VpYX+NpH9NCr9BuZxF55rKGX+ZPuL/6GX/MhxtViq0SRKfTZfqCgKQzh7ctSAKjS8d
	 PScY3YgtQsTepeFyP6qHWF8SjgU3agxHRsLnrlFgZSQ3x4qDYdIha4YYgw9UoVAHgd
	 YWHVn3MlEDBS1NGbuuYCEMgOSqhte4/bAWcOHEK/wKPK7GZTq3DHYr/A2UiSteaYwy
	 5or++qxd5fJMY5/xx0FO8mQRYi64vUmG4vdtU86FzNU5dfyKkYwJDxGOwuzGgNb+VB
	 BM08j/NgsSaAw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7501617E0100;
	Mon, 18 Aug 2025 16:17:57 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 18 Aug 2025 16:17:52 +0200
Subject: [PATCH] drm/mediatek: mtk_hdmi: fix inverted parameters in some
 regmap_update_bits calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-mt8173-fix-hdmi-issue-v1-1-55aff9b0295d@collabora.com>
X-B4-Tracking: v=1; b=H4sIAA82o2gC/zWNzQqDMBCEX0X23IX8IAm+SvGgca17SGyzUQTx3
 RsqPX7DzDcnCGUmga45IdPOwmuqoB8NhGVIL0KeKoNRplVee4zFa2dx5gOXKTKyyEZovAuzbe2
 onIO6fWeqjZ/32d+c6bNVfblDGAchDGuMXLom0VHwfwH9dX0B3FFenZgAAAA=
X-Change-ID: 20250818-mt8173-fix-hdmi-issue-287cf353b077
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755526677; l=1911;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=6wt+TFbCgRTq3CoWDUzF4dMYm0Zd3ReDlyfg41hupY4=;
 b=4cUsJwhO61paEKP7kGx01MrdfPfAETpCU7wZnArg2FB5y23RYgiOHFovUTjQwRAslChXPhEXA
 PdpVCLQqgVZAZgiUf6SqWiViaGpdXmWuDdGySW/NalO7PB1SX9SNZ85
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_071802_477246_0535CC4A 
X-CRM114-Status: UNSURE (   8.93  )
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

In mtk_hdmi driver, a recent change replaced custom register access
function calls by regmap ones, but two replacements by regmap_update_bits
were done incorrectly, because original offset and mask parameters were
inverted, so fix them.

Fixes: d6e25b3590a0 ("drm/mediatek: hdmi: Use regmap instead of iomem for main registers")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 845fd8aa43c3c91659808d9e6bb78758d1f9b857..b766dd5e6c8de6d16bff50972b45c3c1a083b985 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -182,8 +182,8 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
 
 static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
 {
-	regmap_update_bits(hdmi->regs, VIDEO_SOURCE_SEL,
-			   VIDEO_CFG_4, black ? GEN_RGB : NORMAL_PATH);
+	regmap_update_bits(hdmi->regs, VIDEO_CFG_4,
+			   VIDEO_SOURCE_SEL, black ? GEN_RGB : NORMAL_PATH);
 }
 
 static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
@@ -310,8 +310,8 @@ static void mtk_hdmi_hw_send_info_frame(struct mtk_hdmi *hdmi, u8 *buffer,
 
 static void mtk_hdmi_hw_send_aud_packet(struct mtk_hdmi *hdmi, bool enable)
 {
-	regmap_update_bits(hdmi->regs, AUDIO_PACKET_OFF,
-			   GRL_SHIFT_R2, enable ? 0 : AUDIO_PACKET_OFF);
+	regmap_update_bits(hdmi->regs, GRL_SHIFT_R2,
+			   AUDIO_PACKET_OFF, enable ? 0 : AUDIO_PACKET_OFF);
 }
 
 static void mtk_hdmi_hw_config_sys(struct mtk_hdmi *hdmi)

---
base-commit: afb39542bbf14acf910012eee2d4159add05d384
change-id: 20250818-mt8173-fix-hdmi-issue-287cf353b077

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


