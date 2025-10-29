Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F36CCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w7WzjBbcIkMp9vE4EpjCxo/Q8IBE8WxTrpS4XkHUl5o=; b=JWdNAtA66elJinrgJCJlB1PPOt
	65jXFFIima44gVj9xGsOXXHSWSvQHLYxb5kExz85G/fQc3SeJeWn/oRMa8RaXL0IFCUNyz1qXFScR
	FNIJZNGH6TVPHhEHfSnEkip2bVpz8Wg4z+w2eWs8OmRldSmC9zosL69xmU8JaO+2VLV3o3rsnO8K3
	0bFITSbKeHfK5o46n1PxIl7nPA5TXQM6qEWnTtlY4h6a2/gD+hYN45O9TrFOP7mdMY2HWCUAvpqVA
	EtdYMbPoUVIBWXIf6DE5eBPvGw+iZnweX/CGRmdcFhoH6DAIt+tkdX99fxXUB6JM0mdhPqi8JFdBL
	ft5ca7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Wm-00000000524-0dXK;
	Wed, 29 Oct 2025 07:23:28 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Wj-0000000050g-0HDG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 07:23:26 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7811a02316bso5095672b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761722604; x=1762327404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7WzjBbcIkMp9vE4EpjCxo/Q8IBE8WxTrpS4XkHUl5o=;
        b=D9JwBumHmP+uXHswieDa6HDMsC6YKmkBH13GDgXwdQG/pc9vJx3eY3DPAnXVNLX3KL
         z0h66BdnpqI/VSf3iOwQ0HMaRTkwV3frvm/6GpOefNHO016YW5RAnTOADLjmIItHJrgL
         ydQ5I9w/N6fqy7MdEVy0TDyAMfbTQuqn5cm/YLH1fVfQdYX/3sswCfybPdEfI689sEKE
         846fOBYByNxKyp7Y24guWVQ3F5u8LDQDR3tnAvx97H5QQWWpqodA+5+iD6C4wXV53Q8R
         yKaYHwaX4RPGPR9DztmxebymYc8RO+ARI2pDb+1Ck+2ARqKUlu80o/p9luA6nqHCHO/+
         O0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761722604; x=1762327404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7WzjBbcIkMp9vE4EpjCxo/Q8IBE8WxTrpS4XkHUl5o=;
        b=eqbh6F5O+ufw+y6ljw62+l8ltyXIWlfaGZG647gwNOeJN5eS+AxFlnI4HzT6CYTjZz
         XRqhuj71o2ynfWP6K9McfaYfvyxS4jApKoqA3UEA03BSooEvF1vTgvmwXwPAQu1KHb/W
         nBKfiCFNIRknQQRaJBkZvIBYfWqv2Ca8xQSCsu73bBgFNY4iXyzOkYU7hqRaw+Qod5Ot
         h7Ar5nMlEZEI3BaUqTXjoDasPL4U+8+rF0xb2juiJGdXDmJj5TbnisatY8HAJK2j86Re
         ZzYepK6/b6Oq3uGKrWM1h6qjIGTJUiZzbfYH5qlAxc1fDBikIqDZ9jvlawLGu/Gqe3gO
         NeFg==
X-Forwarded-Encrypted: i=1; AJvYcCUQbSfx6quhoTADnJAta1eUTUtqU8ENJ+wJw6/C8hNDE9Xe8KxFUtUfdoD1xQqZwnqBoMiThe2sZVOM2zsKgrGh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd/220E4d8lE4q2vUhJYgvSKQj/JAl3D9pJf8U4wfQSKWXNIjp
	swTpuNFaOo6k32oVP8neZtKiz5e1mLlcaD7WL8OEz3vS58Iny3g0P5OD
X-Gm-Gg: ASbGnctBVA9H8SauKT+za4ThbCzoaXACxmEMeB2msnaRHvuv6DSDoyLELyiBGMT7hIt
	m/NeJ0jheDjvDa3hrDUHpBJd/p0w9CFfjwlOiSAm2llrQI4HtO0oaDXtEWj01KyZTd85vGEdzx6
	80xB4d8DS1KmIc06ukYDTZYob59UkpoyoVNh6LmYKtrnH0NoEaGdl66pNp8yAcE/pfUutj4oVTJ
	QlfhWLjF/NbQcdWc1VIou8GwvB08ZmkH+1RyYyQ5IMa/jcpKEU625w3u1atVsYsZsfKGjAEnejy
	z6LpotKtd/3ptT/Wkqd3yYjBKT+fBaDm7/HF1r4bGts5QRftqAcEbTNH7IBi69mnXS9E1UhwVk8
	K+g9g3P/oMLPX6t4yhMQO8uML1oK8Ohrh0nIvGu4bs4Tw8af3XLa9NB3MA5DtjKlkQvhGrq3dfZ
	YcAIOrLhkP5suBm/skXhylUw==
X-Google-Smtp-Source: AGHT+IFyoTqxEaHdHcYwG2j5PoXFVoRtIyJkYmXJKSPfYslsy5ZMiSdta/UGyBhYN4fJfCWD+fCbVA==
X-Received: by 2002:a05:6300:218c:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-34655401460mr2197446637.56.1761722603774;
        Wed, 29 Oct 2025 00:23:23 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b71268bdb2dsm13021005a12.5.2025.10.29.00.23.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Oct 2025 00:23:23 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Guillaume Ranquet <granquet@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse()
Date: Wed, 29 Oct 2025 15:23:06 +0800
Message-Id: <20251029072307.10955-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_002325_107608_C69A4268 
X-CRM114-Status: GOOD (  11.61  )
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

The function mtk_dp_dt_parse() calls of_graph_get_endpoint_by_regs()
to get the endpoint device node, but fails to call of_node_put() to release
the reference when the function returns. This results in a device node
reference leak.

Fix this by adding the missing of_node_put() call before returning from
the function.

Found via static analysis and code review.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index bef6eeb30d3e..b0b1e158600f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2087,6 +2087,7 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	endpoint = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 1, -1);
 	len = of_property_count_elems_of_size(endpoint,
 					      "data-lanes", sizeof(u32));
+	of_node_put(endpoint);
 	if (len < 0 || len > 4 || len == 3) {
 		dev_err(dev, "invalid data lane size: %d\n", len);
 		return -EINVAL;
-- 
2.39.5 (Apple Git-154)


