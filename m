Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E8CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DoP8JyX0Rn+t869X/69C5AdIYY282FJMkh2+vYUqvg=; b=Ybqgi9sZQYKpGH3uZoK2F5oPsU
	A3PDVvHGmF9kHXcwj6+SEjKwj/zcieA0e6kXK+vhgJyIJLsZkg4VSLrGdnVuQaNpY4Loi8/dOb8bk
	8Pfc0fflWyultFRrx8LIhNDw0dJ4bPCf3AxXw4ROnDYmyzY88uzBt0TODXk2XrEJ/afXoKUoW+ncg
	ym9rl7KEAv7cTGq9QBQmMu4D0u3K9wUi0fJk1W5XDdHG/dgOH94L9gxrb6P+fg3zjm5car+Nw1PO7
	OIO2VkU5rd1h2RjxG8AtgjlKGbEg2LXPCu3xuQdRIbD3FJI7fi+EnLwc7tSwfLOW5V3d2g6e7Vsb7
	H1D1nIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyLb-00000002oU0-2fV6;
	Sun, 12 Jan 2025 13:49:47 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyJ8-00000002o5g-2HGg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:47:16 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa659775dd5so46322366b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689633; x=1737294433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DoP8JyX0Rn+t869X/69C5AdIYY282FJMkh2+vYUqvg=;
        b=HDCABn4muM7+ljhDkdj82gjdePV2ZLfxnUoLaBqMRZmMTv9cGY0u/ZScd61qTTgVZ4
         GSrro7H+l+QKyQrCAhLZAeXrUf2GawUNuGFm7zn5PGoigoxbLzJd/zZ9inwGy2uTmD9e
         VGWpHm5/GHLFBEHdpGuSlRI0bE73hX2YD6l9SaaUaKYJ901hbEFoDj+OkhmS0m5pctVz
         Glm2gbpY0qBUZzL7IzC3vqcRKIcYPU7JwlZIFn/vme/wsZsAwTq3IAJOvMLgEP7FMgE4
         iWpMeLkIGGYHK5jA0G80h8IZvkZtKogUGbs6Ol3PxXRP8sdFl0OoNjShj94cZJJs5o2k
         jbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689633; x=1737294433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DoP8JyX0Rn+t869X/69C5AdIYY282FJMkh2+vYUqvg=;
        b=PrC2TmHa3e8ntsah/2+iQLEQgZobfO9rEzGcYKgS7S2F02fpaEd178RzieeBzQdiyn
         74YTPzRiShbJFfws5gAluaoM1zP27rNSkoLfqpHG8DnYLmTVsTcyW54SBXe6RBG9HNoa
         mnM5DoNUHM1h0UssHaw1pE2b3HDXabOl9VWXsHhMHGRNIx9qHEIONbs3nQJHVqa3MYyI
         ue0im7xRHUMcGErE0OkJacLu3NOHL/DCe0meNAuxeJuA7X9CGc+cvKXoMwc4f/mqcMKb
         QNWWNxhX1bWYzuSgEit9p1bwwbblz7sq1gdmKkrfPhS9y5Xzxqef4MegJjfLxVwp2Blk
         fYSw==
X-Forwarded-Encrypted: i=1; AJvYcCXBpxh/jZKKGrx5GNmkHO5cfg7SGJbemPU/RrKO94zzsXw5+IWX35u4NLPnpjKOk1Kn7vXuHY7Yypzz8lzNez+Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxVp9jd2qMRGdVnCyB2JcniesneLj40Q31gtKWspDJcP9JHcoSv
	mkRCEuIBDmEurHNFCKVh9g5q+Y0fqnuBSVqRF8fSsM+NVQ3YNUADaENTI7S/jNg=
X-Gm-Gg: ASbGncvJaPRh2aK5BqM+183J5v3tPpROBpzouVvWZ6UslWspuJ71IAm9wAmptXkupc6
	U2vJeqXGMDdJ/S2hEfKeR69rwPau1rxXvsZ/5Jq/Vfxc7coPbIK7eTPMeMxnn6zazOvZITAgHBw
	orggQdOiaZ+AVWKVlosQuv8jJWKI8IJTjJLkWWWb278IiDDhCqT9ICTKlfCcCELHVOZU4N0COk9
	pFjR3N/NYLxIl14j0squ8TLkMN6NUsw7Omw8SMk1otb2RYgnPpJXUDKhg5hzxvcKT2CdTs=
X-Google-Smtp-Source: AGHT+IEHAXrRzzhrt3gFm4JeAOOOtrjD1qbFZyqfcMZ+AbnWgJcTH3bD4AwNeCzDVpq7CMRHO0fkfA==
X-Received: by 2002:a17:907:8689:b0:a9a:2afc:e4ef with SMTP id a640c23a62f3a-ab2ab60355cmr584894566b.7.1736689633230;
        Sun, 12 Jan 2025 05:47:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060c00sm374899866b.41.2025.01.12.05.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:47:12 -0800 (PST)
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
Subject: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
Date: Sun, 12 Jan 2025 14:47:08 +0100
Message-ID: <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_054714_579375_BDE9763A 
X-CRM114-Status: GOOD (  12.10  )
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

Use dev_err_probe() to make error code and deferred probe handling
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 4b0eb7dc25d8..22935fdc5afe 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1429,19 +1429,13 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clocks: %d\n", ret);
-
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np) {
-		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
-	}
+	if (!cec_np)
+		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
@@ -1492,10 +1486,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 
 	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
 	if (!i2c_np) {
-		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
-			remote);
+		ret = dev_err_probe(dev, -EINVAL, "Failed to find ddc-i2c-bus node in %pOF\n",
+				    remote);
 		of_node_put(remote);
-		ret = -EINVAL;
 		goto put_device;
 	}
 	of_node_put(remote);
@@ -1503,8 +1496,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
 	of_node_put(i2c_np);
 	if (!hdmi->ddc_adpt) {
-		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
-		ret = -EINVAL;
+		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
 		goto put_device;
 	}
 
-- 
2.43.0


