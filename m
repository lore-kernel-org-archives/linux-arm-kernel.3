Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44FEE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RBnsV3mFkJmXnRbQqOXQC7xiyTGmF2RqY1RW5wKJo0U=; b=P9S11XRV/b/+TSi9qQ0gBVnEQP
	QaRl2UjD/G21AxTIao/G8scShIBc9nrPU7lR1hqc4MN7I1vqWihb7Oui25w/D9oCI2UgeF27cLfTh
	9/zETONkFWZAF46wZ4ibKu5jsox7tNi3dZsHiKJ/CCQdWvzkL003AjfaUmNuUJ68qNBYtpCu+gVHT
	O6Gbn3NaVh+rW+DisjSGQ1w9r0IHD7r/TRYHUPR6ICiA37MgqMlvtVlPDt49MTXkzB1jqj9/8xuD3
	nC6KlYfa7szhX53BWHYofLeYq9AW3JUZ+7p+wK6aTwDCjD0JwtRb/QfAcROgBBfWQn+tK31hi9utS
	IFCUmdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyKO-00000002oL5-0lvS;
	Sun, 12 Jan 2025 13:48:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyJ7-00000002o5P-3g6k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:47:15 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa6954ec439so45232766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689632; x=1737294432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBnsV3mFkJmXnRbQqOXQC7xiyTGmF2RqY1RW5wKJo0U=;
        b=qhK0/tIJ8b+zFtWV2hW1C0URglvlLhLH7t5WQ9xJipRqKfg12dF7rO7txvwLAnm3/I
         AqlVEpySnk1iBGkbMowKYSrPOQAU8yR6iJ9BOrnbyD5TibOEA9KNU4v1YSpVHTllSWoa
         PttaPuJkREVOH5gW7FHadKmXh25tYmcfaHb5Nd8GxZF6Z7A0/K7LM6G349GUSiVmB8v+
         pODSUqvqxK4QnBKjyIunHsY8b0pL3y8v5ytojoy21ODiRH2jmNyJnsFRNgZ9y6HJPP0q
         SRSCiJ6Ix+xeLxoBXd/dZfuxhgC2VAQwxMXRcNWHH6JpClKidcsUqMuLlqsj+j6ALpUZ
         dS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689632; x=1737294432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBnsV3mFkJmXnRbQqOXQC7xiyTGmF2RqY1RW5wKJo0U=;
        b=I1bAyLgACyZGYaGDW0xF24UAijej365Nh72odHXJlrA06+PLsc7FcP7LG5lJLwSZq1
         0C8uswVxsf0/nRN0opGPrhd8aIEI7gF8BZQW0VPH/UA4wr9TOrOyU2EHbTkEpGalNAMM
         PvrfoERm9UKFkmEl1pX2d99QRu73bITSF8daDtiju0S2uXA1p/T1/Ry9EYurbOuNgkMv
         Apx/ZFOwUxqrQ/+IEilnXmME1SxR6pk8QZ5RyKEcC6I5jMWtrcHduyMmdKuGOqlv9RvX
         TSr/hv+hl97eBDcVuZdOPeZbQ96XGxdAjzJO2uF9d149steBirpcMPjJFJUtVvztSIjh
         bu5A==
X-Forwarded-Encrypted: i=1; AJvYcCVLbg6WFRlVzrtcd3g9I2LeSGCVk+M3QmqLrveCCi36XCZnwma8Uk68NzwQqItT03//b6mWwwGNM19VpWstALEE@lists.infradead.org
X-Gm-Message-State: AOJu0YzdQo+PuBZS9V49iyvAQqUnF50NujSjzFGPzYZTbaHa7XSM+s8I
	Nm9LVFABrG4h9oqCUQnYsWn7z2QDMK+vfTbTMvw2BfjINYmsPVa8VR0fe+Y76vg=
X-Gm-Gg: ASbGncu5sr1K182G952UInRe8Yu7p2vjYVdl8MrxKx3dRz3sPrYHOVmk8iaNCsQgEu7
	MWbDKW5qT17bvUhaAUBkz6GWIvjhgHiItSRHfHq/2dbLVwL0xRUri1pl+qWzjqW3jLy/2OSxKJv
	xa+GXD9yvKbkMuW27oFwVR9X5gvLJD6ZqOw71W/w4BW2ZrbQeuWYg92sc/94+X053NoXRDpvtpM
	ZmMOScZ1bOkpwXf15hZ3JghxhO2mux5hwCsiwRI91OHO9LWte4SRMzOYv7JUs++26luMwo=
X-Google-Smtp-Source: AGHT+IE5jjxbpuHLDjgHBaaKsQqbYx5oIutu5BOQFvdU7mITc2KX+nB9WMaHa1nRj5jMwrSpxOe8VQ==
X-Received: by 2002:a17:906:c10f:b0:aa6:9631:9237 with SMTP id a640c23a62f3a-ab2ab6cd374mr674812366b.10.1736689631988;
        Sun, 12 Jan 2025 05:47:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060c00sm374899866b.41.2025.01.12.05.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:47:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args
Date: Sun, 12 Jan 2025 14:47:07 +0100
Message-ID: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_054713_906821_070D5AA8 
X-CRM114-Status: GOOD (  11.40  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index ca82bc829cb9..4b0eb7dc25d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1458,15 +1458,11 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
 	 * registers it contains.
 	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
-					 &hdmi->sys_offset);
-	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
-	if (ret) {
-		dev_err(dev,
-			"Failed to get system configuration registers: %d\n",
-			ret);
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
+						      1, &hdmi->sys_offset);
+	if (IS_ERR(regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(regmap),
+				    "Failed to get system configuration registers\n");
 		goto put_device;
 	}
 	hdmi->sys_regmap = regmap;
-- 
2.43.0


