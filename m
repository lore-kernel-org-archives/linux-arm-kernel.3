Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1E1C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUBFebUvWCybPC7Gr0qjTf4RweTwPSwS4K+KvmFiZN4=; b=E96dheGOdAT49Xh5lIbxs8MMft
	Bqi4+HJ2xLKxwjd/iV3I61sgW7Bs0WrTI7uhY4LM4lgupU8Ec8StCPBzj8A1uvf4iCPY69c2uxKjk
	2rvsvxWZfxfw47taJuCAVcHvVTJqDGJ5iW1Ck15wAl1YSGs3mBgSrxSeFedB7yB2yBGkQiZdfA6Rv
	1T6OwrV8MHHzypGoXa8P+OrohEADlFAOmC2qVCw3/12Klkxx4+DNIgCD+G9WyHUmUvPQcMd7GikLp
	VZNlbAjB/X+EtCi0uTZTGqj+IqiBFK9iIaZwODhItAuioM0qkiNMziNGU1Mg/PCEMS+NpBaOyuBWs
	sT/6fbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uzb-0000000Du9p-4Aw1;
	Thu, 24 Apr 2025 11:43:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tm3-0000000DfW7-2a0V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:44 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-227914acd20so16690295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490342; x=1746095142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUBFebUvWCybPC7Gr0qjTf4RweTwPSwS4K+KvmFiZN4=;
        b=Q2Va4ffTVxHDsLaLMi+uMi2nJBWV3ubZqfh/9Wx0r9BV2dIJrufDSHMEoXtemLiHbB
         8QoziGFZ19IR1rnvog//hTpro/fO0K10YV+ZExOio74I44irI4fphP+f6UXiRbbjEc0a
         MxbKx3UJ5ZOTgFUj1HmH+SyVSKk2pChEbEeu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490342; x=1746095142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUBFebUvWCybPC7Gr0qjTf4RweTwPSwS4K+KvmFiZN4=;
        b=CZVrye8GSKxH6F1lYlRroDCvrrZlwKcLPzOZkhyzF9g1hDeFf/YYuoZZeBthmyZ5CI
         KxdoXDDLSyfYu3A+cx3BYP2pzOElVfNhOZ6qVjE5VEmKz7ufNST9ybwCFrd85FJ5Aaqu
         Ho6lYq4AhHNML/7OTeR91FWuBrMbWar7KY2A7yax1J7z3JYXRJdB57ZZiBn2TvEqben4
         JgEZCRiIi0NnWT28ADPFqaeoUhpNbvZpWxLv35XQwc3ngVzFelbIVfFdORaXQpXqNmya
         AaEstIPexkfPJhg5CFQk2se/UFxxhPtsw77zx9F4tUGdO2CCEpFqolX7KCU9UrGSy4jk
         sjbg==
X-Forwarded-Encrypted: i=1; AJvYcCWIuxwSooWwmsLYdERGNiy3Vc972aeBD042kEXJZLPdn3ERRMwlArKKyE6Jg3XtKIKzaEgryk8IFEjVRugkaFQ4@lists.infradead.org
X-Gm-Message-State: AOJu0YyNqWdecd9CXDubM1bQvIQODYB1orS28p2N0ZgZ5JvrGpRgz7CM
	f5egJd88K+JEGrdJmSpQYAr6TFDTPdVPd4imeWpig6RHjm+G/C2JfZ6VtV5m2g==
X-Gm-Gg: ASbGncuHvnzJ9ijQ2DiGDHakAvDppH1gpakYGaDu6wuYebzSoVw30ESkHznpKpNNNxx
	fvKy72P7yToKlYgKVIeOcDI5XvCoboZR9eMRjgTmfihsImqUuj/LGtr0UtmqnnPmBrBErpOx3v+
	7KUzN0FW6hPh0R8HPonq//k1/pOKyvTKQoKrtZU7zcftZpDzGO6UZtE16cOuMRHlBTW6LTHr4/2
	okJuk8bWST9mJVUUBBKoxa7wgPU5PEHLiPmmx/B3dSODfSy9XvyhtIitKL6a34oAHSk8vh3Qzfo
	Bghf1MQo5RIEH6TeUhRHna1x+2gInJgt61z6cCPcy7hMxwyYAvsr1H6eZQ==
X-Google-Smtp-Source: AGHT+IElSoZ8SalHQQZjQTWtW0X8U3PTH+55sn5jfmyk6HGUSjVHCZyjfyjm0AvfmBvEv7DCr/VZOA==
X-Received: by 2002:a17:902:f544:b0:221:1356:10c5 with SMTP id d9443c01a7336-22db47f4dd0mr24547855ad.9.1745490342486;
        Thu, 24 Apr 2025 03:25:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
Date: Thu, 24 Apr 2025 18:25:01 +0800
Message-ID: <20250424102509.1083185-8-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032543_668760_34AF9F48 
X-CRM114-Status: GOOD (  14.78  )
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

The AFE DMA hardware supports up to 34 bits for DMA addresses. This is
missing from the driver and prevents reserved memory regions from
working properly when the allocated region is above the 4GB line.

Fill in the related register offsets for each DAI, and also set the
DMA mask. Also fill in the LSB end register offsets for completeness.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index e7378bee8e50..a3c8054a434f 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -6,6 +6,7 @@
 // Author: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
 
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
@@ -431,6 +432,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_DL1,
 		.reg_ofs_base = AFE_DL1_BASE,
 		.reg_ofs_cur = AFE_DL1_CUR,
+		.reg_ofs_end = AFE_DL1_END,
+		.reg_ofs_base_msb = AFE_DL1_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL1_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL1_END_MSB,
 		.fs_reg = AFE_DAC_CON1,
 		.fs_shift = DL1_MODE_SFT,
 		.fs_maskbit = DL1_MODE_MASK,
@@ -452,6 +457,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_DL2,
 		.reg_ofs_base = AFE_DL2_BASE,
 		.reg_ofs_cur = AFE_DL2_CUR,
+		.reg_ofs_end = AFE_DL2_END,
+		.reg_ofs_base_msb = AFE_DL2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL2_END_MSB,
 		.fs_reg = AFE_DAC_CON1,
 		.fs_shift = DL2_MODE_SFT,
 		.fs_maskbit = DL2_MODE_MASK,
@@ -473,6 +482,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_DL3,
 		.reg_ofs_base = AFE_DL3_BASE,
 		.reg_ofs_cur = AFE_DL3_CUR,
+		.reg_ofs_end = AFE_DL3_END,
+		.reg_ofs_base_msb = AFE_DL3_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL3_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL3_END_MSB,
 		.fs_reg = AFE_DAC_CON2,
 		.fs_shift = DL3_MODE_SFT,
 		.fs_maskbit = DL3_MODE_MASK,
@@ -494,6 +507,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_VUL2,
 		.reg_ofs_base = AFE_VUL2_BASE,
 		.reg_ofs_cur = AFE_VUL2_CUR,
+		.reg_ofs_end = AFE_VUL2_END,
+		.reg_ofs_base_msb = AFE_VUL2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL2_END_MSB,
 		.fs_reg = AFE_DAC_CON2,
 		.fs_shift = VUL2_MODE_SFT,
 		.fs_maskbit = VUL2_MODE_MASK,
@@ -515,6 +532,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_AWB,
 		.reg_ofs_base = AFE_AWB_BASE,
 		.reg_ofs_cur = AFE_AWB_CUR,
+		.reg_ofs_end = AFE_AWB_END,
+		.reg_ofs_base_msb = AFE_AWB_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_AWB_CUR_MSB,
+		.reg_ofs_end_msb = AFE_AWB_END_MSB,
 		.fs_reg = AFE_DAC_CON1,
 		.fs_shift = AWB_MODE_SFT,
 		.fs_maskbit = AWB_MODE_MASK,
@@ -536,6 +557,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_AWB2,
 		.reg_ofs_base = AFE_AWB2_BASE,
 		.reg_ofs_cur = AFE_AWB2_CUR,
+		.reg_ofs_end = AFE_AWB2_END,
+		.reg_ofs_base_msb = AFE_AWB2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_AWB2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_AWB2_END_MSB,
 		.fs_reg = AFE_DAC_CON2,
 		.fs_shift = AWB2_MODE_SFT,
 		.fs_maskbit = AWB2_MODE_MASK,
@@ -557,6 +582,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_VUL12,
 		.reg_ofs_base = AFE_VUL_D2_BASE,
 		.reg_ofs_cur = AFE_VUL_D2_CUR,
+		.reg_ofs_end = AFE_VUL_D2_END,
+		.reg_ofs_base_msb = AFE_VUL_D2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL_D2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL_D2_END_MSB,
 		.fs_reg = AFE_DAC_CON0,
 		.fs_shift = VUL12_MODE_SFT,
 		.fs_maskbit = VUL12_MODE_MASK,
@@ -578,6 +607,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_MOD_DAI,
 		.reg_ofs_base = AFE_MOD_DAI_BASE,
 		.reg_ofs_cur = AFE_MOD_DAI_CUR,
+		.reg_ofs_end = AFE_MOD_DAI_END,
+		.reg_ofs_base_msb = AFE_MOD_DAI_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_MOD_DAI_CUR_MSB,
+		.reg_ofs_end_msb = AFE_MOD_DAI_END_MSB,
 		.fs_reg = AFE_DAC_CON1,
 		.fs_shift = MOD_DAI_MODE_SFT,
 		.fs_maskbit = MOD_DAI_MODE_MASK,
@@ -599,6 +632,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_HDMI,
 		.reg_ofs_base = AFE_HDMI_OUT_BASE,
 		.reg_ofs_cur = AFE_HDMI_OUT_CUR,
+		.reg_ofs_end = AFE_HDMI_OUT_END,
+		.reg_ofs_base_msb = AFE_HDMI_OUT_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_HDMI_OUT_CUR_MSB,
+		.reg_ofs_end_msb = AFE_HDMI_OUT_END_MSB,
 		.fs_reg = -1,
 		.fs_shift = -1,
 		.fs_maskbit = -1,
@@ -1081,6 +1118,10 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+	if (ret)
+		return ret;
+
 	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
 		return -ENOMEM;
-- 
2.49.0.805.g082f7c87e0-goog


