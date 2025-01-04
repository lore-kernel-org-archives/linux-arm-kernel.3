Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2EAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 14:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vYfoIccjBDkjw6cbBAv2evM0j3S7+LR3G5bMrrAjuw=; b=TWyyDEoPVLoA0Mf+30xCRGA5dO
	a3zz1pOfLJ4MphTen6lNaOYJHooCdpuUYfsgOCWZdyNKQSlgUu0qjEn1mX07pkJO87gnqfF4HQPJC
	X+OHXNnQK+DHPtWNS09/NOBVC9+s4wcNWg/GhMVYUyMzMb8BLMg429rm4PezNaCfB2WFc3yLZieQN
	kMJ4biHplUzlpyyM/+jBcx9fl2ppAfLuJYl1FV4URGI1p1uFEzNBzKyel2LRRDwUiunltAVA40mQT
	AnEgmHCZacY6J2BPRxGUmZbhJns4qiP5EtzyO5iNhQOFKLvILFRYczE+Spm8kbtS7GoLUx5Uo6ONq
	UGvDdCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU51w-0000000F6BP-1t3W;
	Sat, 04 Jan 2025 14:21:32 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU50l-0000000F5sQ-1hkQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 14:20:21 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3be7f663cso2673636a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 06:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736000417; x=1736605217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vYfoIccjBDkjw6cbBAv2evM0j3S7+LR3G5bMrrAjuw=;
        b=C2esGhh7PYxLxqHsMdv4IB1omYFNn6FjRDKYAU+hoL8VzHPUIKPigQZkN34+rxl9y4
         5pU661Grd9dp4eLIDHCDKcyf/EL12Pd87sfyNgHtBB86FAbEHNdeYZchp5dXpTpZpKUa
         WzW1dULGKf3/4BxxtbVOC0TXsw6/PlYklgdZShxzE1gO6OddP8jezPNqTphL9g1a7X0G
         2CVJBL3XB/Tv0Guiv262y5LSqpLD6pRWzlPbWMquqzStDbAqFBny91TINXJSe8chN4sy
         +wrcd1jYHRoo0caXR3DUTTa44bY1K6Jv5D+1yLAyXlA3abf4EjwMLt0Cyq8riNGxPyMw
         wdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736000417; x=1736605217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vYfoIccjBDkjw6cbBAv2evM0j3S7+LR3G5bMrrAjuw=;
        b=NpkSaQEqz/30gXQO+4W2gbSJ0Lwu7f6rcg0NB6OPqsPjICiepVJN4vSZgaKSRpBj5p
         DnJQqrliczeJsK0IPu/jupS88PKcyWdSspX8csXpe2ZolClzqsCVWrkQzAR6XuDTr1xI
         mWEg3dvcVffFaXCqZ3pcL+PzUMiHzUc8WWRQBWRpeTbHnRynsdJrHzVPRBaXZfipGc4U
         4QQEb4tELsdpFub6XOk9DwMvmtIxvAu4k7ouTFEpNuwu6ZHse/+eMpUqbUb2YVxwETeQ
         iMargbV0JJICzU2PbOEncaO0b1bfpuZ5GDEZKhwGy+gYTy5IiQ3w2waUdGhiys0W30jq
         fgrA==
X-Forwarded-Encrypted: i=1; AJvYcCXSDstWu5KDj1I2FGNDad8xzYh0/J7nvXS6xCs+jQLE9r8cPpTJ6ko+idtZopJwdnCgoHvRtyUmCEL8771S3DvJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyvbxA2q0p0S/hbTSfOOk/uKaQgbV/eNF7B2DDLrjECL9mQe93b
	to55cdd7n0iHd3HfIptIwynwrSv3NbaHW+uVzL0MQ8KoE5skAt+8ZZB5c5Ax5aDturExuwQcDtT
	Q
X-Gm-Gg: ASbGncuIdnN97fZyZZJDbbMX2XnKPhLhv1b5412krqISMXvNgYYn+a6uo3CBkLP9HZ8
	KPdpTdHEy9zYuQUVsUrlv8sOY6UpI0OR0+LfzdLs3mE/zeebITj8S2kw05wuKeRnA0cH8KvqgqQ
	0nlFnGTtgVAot09+XP804wITtBHHlrDa89C7R4WRM+uYdXZO/WmGlIFhOH1k1HwywIp+hzgwZ3u
	Om8EHfh95qjUgeMYAdfIkBob7mO3sk3tzOZgAjhgrUiZfXc+nwr9mCpldfHiePAP+V0ImU=
X-Google-Smtp-Source: AGHT+IGha3K/A9wzcwndXIIgjH9svK3Rsjac/aT49HWWAWPNoZX3f2AfqQT6YbI2NKa2kWUjRR+k4w==
X-Received: by 2002:a05:6402:4309:b0:5d0:bcdd:ff9b with SMTP id 4fb4d7f45d1cf-5d81de1c2f0mr18117836a12.9.1736000417341;
        Sat, 04 Jan 2025 06:20:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4e1sm21376270a12.70.2025.01.04.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 06:20:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neal Liu <neal.liu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
Date: Sat,  4 Jan 2025 15:20:11 +0100
Message-ID: <20250104142012.115974-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_062019_441394_6053EE2D 
X-CRM114-Status: GOOD (  12.66  )
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

Error paths of mtk_devapc_probe() should unmap the memory.  Reported by
Smatch:

  drivers/soc/mediatek/mtk-devapc.c:292 mtk_devapc_probe() warn: 'ctx->infra_base' from of_iomap() not released on lines: 277,281,286.

Fixes: 0890beb22618 ("soc: mediatek: add mt6779 devapc driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/mediatek/mtk-devapc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index 2a1adcb87d4e..500847b41b16 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -273,23 +273,31 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	devapc_irq = irq_of_parse_and_map(node, 0);
-	if (!devapc_irq)
-		return -EINVAL;
+	if (!devapc_irq) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	ctx->infra_clk = devm_clk_get_enabled(&pdev->dev, "devapc-infra-clock");
-	if (IS_ERR(ctx->infra_clk))
-		return -EINVAL;
+	if (IS_ERR(ctx->infra_clk)) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	ret = devm_request_irq(&pdev->dev, devapc_irq, devapc_violation_irq,
 			       IRQF_TRIGGER_NONE, "devapc", ctx);
 	if (ret)
-		return ret;
+		goto err;
 
 	platform_set_drvdata(pdev, ctx);
 
 	start_devapc(ctx);
 
 	return 0;
+
+err:
+	iounmap(ctx->infra_base);
+	return ret;
 }
 
 static void mtk_devapc_remove(struct platform_device *pdev)
-- 
2.43.0


