Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA311CA0FEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yb2SBUjk2cUBYlIMJ026/BKU22gh35Mp+MWKmgCVX6Y=; b=tHBLfyHvosWw3dnEO4f3yF7bFn
	YabXHMFV2229r8jdBfKbctPXbaA8vi7jOWvoCi4xGmT6Q1AO/UY4ynXAHW+TCRtQT6rlFST351aRZ
	9/iH4wH34xyaynjkN5d5/OhIt2jS0QzYjcATFGGEUT98W+h+TRFkcihFzK3La6P6qb/PHH5bDVmbO
	c+Pf/HH9trU9hdKAlO9XLjengs8UBpeGX12COXjsKCdabA30p/kaxE0L3cU41PAMkgyJXF5PG81py
	doKU8oq8Bmy/IEWui4epXhYc0Va2cpgchH9+YK91iDIcQTszui2Ad9tIJh+aS+Qi3RStp+R4z4TEp
	6tDorxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZXk-00000008ZtE-0uG9;
	Mon, 25 Aug 2025 15:55:36 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYpL-00000008Snh-1AI0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 15:09:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-32519b32b6cso2295685a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756134582; x=1756739382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yb2SBUjk2cUBYlIMJ026/BKU22gh35Mp+MWKmgCVX6Y=;
        b=CuILnwSYc5JGmk51Yb1xmr/PiDDiMqO1Af3tsbeYlujVtk+lgtLDJVzdqdFSKu/prD
         EjRH9Qi/6sS+nOOU/fgu1OU+HJn96O9ibWjSaOnPWt1Jb4JvVR+B9eOeWbVD2Cb4TgmH
         Ar4OviR4qGMtfIJIpFp3QKls4RT3/h3p0aHs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134582; x=1756739382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yb2SBUjk2cUBYlIMJ026/BKU22gh35Mp+MWKmgCVX6Y=;
        b=R7o3eKWOkO7VgESAwnZCOIOVt//OZOobv8htYkul2aZg1507d+lDptBvZNNklAlTWi
         tutFqZj4gjznCVPuPv/ENSVgKVEVhzjlIlkMan7vLPftmQIhnseYRmSADc2yD7Fpqxan
         gm5Avcsg+Eg94bFSNrMI5kPJDto9l4NwUSIxZkgrZzRQynqhLObgk6k7tKcd1Az8mKRY
         PH1MPpXIA98mcZCH7JUeMqzg/FG3rlcPG3Brp0E4vVvRyZyJJTn+E58PyC84/2BqmiTx
         WML7rjeCtguRoa4Nx4llFf0oanEFAw/dHMgppr6QomxdIjQ5KRspuX3obY6gkkBL2RcR
         FEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA2B5vVJv9mmi93i8OWxQvLa6TvJW3Xveth9fARRfkZomxNIL/8h2ObUHebkiECJOjx/9MMfYT/aeSuBm7rK/2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxei1QFtlIBamtxoUSUj1jsKHT2JM9qPDQe5O6A++acz0iLov2F
	i/E5mVq/gc6Cd7xBTj+MLhJNbFEF5uM8Gd/IhlhxRkDnV3+e5+hiks0d4DtsrW2EmeakmCA/xSa
	BAS90pdkB
X-Gm-Gg: ASbGncs3bGyhoELTkBKLBwy0z8fX1CUuxou1XRUrfWtFcYXfyFxMaQEb7ulUf8jNdzQ
	qWb1u34Ia//9FhWN+HnMVzJ+Dx6C/WrMqE2JkU4djIoN/KceRcok3yWetk/kLtGyf6fd3ZjaCAM
	7nXvsxD6duLT4lUD8SJxuXBYpixatXkIEHEWInb+NFG6/f9x1sDZvz3E4IoD3I21anADVbIMtx1
	iJLBm6DDPIQceYpyvZO4lCwKZ03kQRzuJzTZW0BOFVafd/akHYXq9rsInsN6aM9LZoQ+CupMFhh
	5ZElw09uvVSdtoK59Qj2qub2xoqZFkJHrUtQOtOFQCP88eLG3tOKJxGIXxIywNfeeixykTXKIfQ
	4lei28B4rjWIiqbmlhM7KF1kkQ1HjFG5u6Bm4aAe6
X-Google-Smtp-Source: AGHT+IHPJV4TXa61Ud+4jPZUdeIqShsQV2PbYlibNvBybfblxKwhUtY23QymfLSEF6L//QSRFz+xzQ==
X-Received: by 2002:a17:90b:3e44:b0:313:f9fc:7213 with SMTP id 98e67ed59e1d1-3251744bd41mr15706597a91.21.1756134582435;
        Mon, 25 Aug 2025 08:09:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d5a9:711e:13f5:e60f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254a1e4067sm7481215a91.10.2025.08.25.08.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 08:09:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
Date: Mon, 25 Aug 2025 23:09:31 +0800
Message-ID: <20250825150932.3695931-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_080943_359937_691A0AD8 
X-CRM114-Status: GOOD (  12.16  )
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

The `flags` in |struct mtk_mux| are core clk flags, not mux clk flags.
Passing one to the other is wrong.

Since there aren't any actual users adding CLK_MUX_* flags, just drop it
for now.

Fixes: b05ea3314390 ("clk: mediatek: clk-mux: Add .determine_rate() callback")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Dropped unused variable
---
 drivers/clk/mediatek/clk-mux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 60990296450b..9a12e58230be 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -146,9 +146,7 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 static int mtk_clk_mux_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
-	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
-
-	return clk_mux_determine_rate_flags(hw, req, mux->data->flags);
+	return clk_mux_determine_rate_flags(hw, req, 0);
 }
 
 const struct clk_ops mtk_mux_clr_set_upd_ops = {
-- 
2.51.0.261.g7ce5a0a67e-goog


