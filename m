Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FBFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 01:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hc+/IIfPHTQ5W3C46gmAKHbZoREmTGGCL3gylifCnJk=; b=kwoknY6q+5EEQ2o35+86QlZieL
	TdcRGMync3LMP2yFzo6uztv9Z6+O83GSG+N8dXxNFwIbIIZqLjnR/OkKo1JJkMY7Mrvt0MFLTDmE2
	ZZEDXl96r05jqcEZ48C6wh+8OaYdeNWiQpYQn0N+4QAK9yacgZzMJQq19xahzoZP4hL+6iJ9t+6ij
	HmMXMvxvNVCuQHsc3ls9RqJJYFGjl6rQJgiYdXZy8OHbhT45EMrtFowt6KIk1T0i1jJLA1lZdkzwS
	7NCjDBZzFmtsUM0QiyiwT86XOGn1ZQi9LwZ+zeihMygCaXxHgJ1ImgCh4FA3kL0GDigj4e0G0yXi9
	emBVUJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYYr-0000000BLzD-3kZX;
	Mon, 06 Jul 2026 01:55:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYYp-0000000BLyQ-2uJg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 01:55:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84592b55832so2274447b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 18:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783302950; x=1783907750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hc+/IIfPHTQ5W3C46gmAKHbZoREmTGGCL3gylifCnJk=;
        b=cbW+CITXozcs5DO6c1DCHd3VEGDFuKJ4JsEgX/H/g4HCjwUhfiLVqhy1J2za6mXdBP
         8Dq3da+/N/ZqA/cuW+Dr/PQOkJrfvVO0yBRsrsJqksYgxiH5pbO+PJ8PPqN9O1hRlJPI
         lq2uim3VcA/muro5hQs9aC7Hml2uRy5Zmo2ZKAjf7iK4k+yjsnA18AkEfjHZ40+XBjct
         8wo7nv7z/HwT8Z0u9H21meXy1UDFrktfs/bhyoukOY9R666QOJFuc/+/beuaH6I+aB3Z
         MpGLcskExfKlwptrR0zJYBgzl/IgkOOeYw3S97WFGe2mG+AMPJ7R6MABfe7Xya4kmdKU
         mL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783302950; x=1783907750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc+/IIfPHTQ5W3C46gmAKHbZoREmTGGCL3gylifCnJk=;
        b=ON58mRuy7j3BBEE/zfmtkFuU6wJBAzyydpIzFTQeThxg0XmKUaPCfsVNH2TWA/A8RC
         ElziSgRW7BT2lKaTZ7brLk+aQYA6/LDU20Kyy63oW614Ru2PhU1qMn3PBgGF1Ueq0jik
         o2CYfcBKwbgKVOa9zJCrLFpfom2klc/B68dBfZRomqic+I5xXy/JD256JOmzYxI65iWh
         Ki2s/vLNmrSXCMTax1yGz++zQ4XXuZibbqtHsmRRqcYXeusVDdWLpo1UW3qA0Zhxvyjp
         xqDiKdMni7PlU+o7fXMrW5NkZFFTlzDp8zrZtvqxQjUDi7lsqltqzBsbGfrXiJMQlm7z
         ewQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWH5yJVEoqyTuiam2lze/hW0ZPWbBrH5defpltvYrabY5BRQekzRvk2uzL+cS3C6JiYbrNoxubSRCllymKpFRb@lists.infradead.org
X-Gm-Message-State: AOJu0YyLOE+MVfTuPs9usX+FTR27w+b5hn/lgzRGZJGEIP33eGTIC7Fb
	gkKolxidVEUCVKdmhR9lRwnSn0RTN5H8EteriZGOl0mMgb8cg5kwOLzQ
X-Gm-Gg: AfdE7cnky57UHmiifG1LOJ2zJrCzHTwkS5rei6FOW1J8Qu39I7vQXym1j3VHCQwm7vd
	WRFXVUddY9H0GcBvgcAKMPwKhL3LLnJT9WQ0EANShlvzlNkEB8cIoiQmRiYweAn5asFc41QbkSO
	h+t9ustttsXaZC0xXvOgw/pj6hsec2UKuIyPDtfOavy6Fr+cbaAONIELSuUHV1HZzgJT4bqyH2R
	ahQa2+TNgaOt1MMdrSXFq2KIdz5CWhdbp6JHlyl9it8EqhlNV+tBJH00v1VojuMLIgQIHDyZnbz
	0feVFNE+LXH7HmCgoirLNgKsv6Kqg8WGbqN7rOwVG+F+9NRp1DwaaMfuvp16QVsbHi8/AqSmGBH
	6DnyESLIw3VwQkA+pJlEPcmYZhJuw2LUeHzIPuOf2LPVsy9icDz7ccTsf9tCfIM+XWVLwjmwajp
	jGllE=
X-Received: by 2002:a05:6a00:2d23:b0:845:bcf0:118 with SMTP id d2e1a72fcca58-847f6f55a19mr7186973b3a.41.1783302950430;
        Sun, 05 Jul 2026 18:55:50 -0700 (PDT)
Received: from lgs.. ([101.36.107.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b96c04sm2832348b3a.22.2026.07.05.18.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:55:49 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/mediatek: mtk_hdmi: Fix DDC adapter double put in v2
Date: Mon,  6 Jul 2026 09:55:07 +0800
Message-ID: <20260706015507.453222-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_185551_728541_B92F73DA 
X-CRM114-Status: GOOD (  14.49  )
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

mtk_hdmi_common_probe() gets the DDC adapter with
of_find_i2c_adapter_by_node() and registers a devm action to release the
adapter device reference with put_device().

The HDMI v2 remove callback also calls i2c_put_adapter() on the same DDC
adapter. This is not paired with of_find_i2c_adapter_by_node(): it drops
the adapter device reference before the devm action drops it again, and
it also puts a module reference that was never taken.

Remove the extra i2c_put_adapter() call and drop the now-empty HDMI v2
remove callback. The common devm action releases the adapter device
reference.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Drop the empty remove callback, as suggested by Johan Hovold.
  - Mention that i2c_put_adapter() also drops a module reference that was
    never taken.
  - Fix the Fixes tag.
  - Add Cc stable.

 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 7bbf463056c9..ffe456238a2b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1499,13 +1499,6 @@ static int mtk_hdmi_v2_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void mtk_hdmi_v2_remove(struct platform_device *pdev)
-{
-	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
-
-	i2c_put_adapter(hdmi->ddc_adpt);
-}
-
 static const struct of_device_id mtk_drm_hdmi_v2_of_ids[] = {
 	{ .compatible = "mediatek,mt8188-hdmi-tx", .data = &mtk_hdmi_conf_mt8188 },
 	{ .compatible = "mediatek,mt8195-hdmi-tx", .data = &mtk_hdmi_conf_mt8195 },
@@ -1515,7 +1508,6 @@ MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_v2_of_ids);
 
 static struct platform_driver mtk_hdmi_v2_driver = {
 	.probe = mtk_hdmi_v2_probe,
-	.remove = mtk_hdmi_v2_remove,
 	.driver = {
 		.name = "mediatek-drm-hdmi-v2",
 		.of_match_table = mtk_drm_hdmi_v2_of_ids,
-- 
2.43.0


