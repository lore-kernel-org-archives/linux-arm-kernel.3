Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0950C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xw8UIDvZBCcr83U5CXKVA2bqzTMOFGkmm5WFSkBADIc=; b=VxWUOv6zov9KkKN2vEewJFgoWU
	F1mCp6VD8/9tiE53e6TwZ/ZwjWfYv1c8CtO3vAJEGqRjPByH8wA571QP5d6JpWpqQI5P6P+sCEQ5F
	zyIRRDGACpbakhgdJGwhreCvKo+1jyt/YK2NRoHj6QEnFuC/5Got8Ww1RxpPubeiHboFKz7So7sG0
	iKRVDbTzF25BXXdSOZ3Ru8IG19svrzAI1T82l1i6r1hA5ZXzHRpzHyJl2G331zcAzAhVo5/Ac8CFJ
	MBWOXIqsuY3FBK8jJ0d7PRJGcGvY1WsbUT7vonDnfh3obfVYoGAXChZpK15wtFMvrC0RNq7o15yEe
	oDeZm74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nBx-00000003y1n-1qCm;
	Mon, 21 Apr 2025 09:11:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nA5-00000003xpF-21jW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 09:09:58 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-224019ad9edso54102995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745226596; x=1745831396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xw8UIDvZBCcr83U5CXKVA2bqzTMOFGkmm5WFSkBADIc=;
        b=JcP/wEkBUvTjAAq8x2ykkmhybpqiZcbbSlDco2OIPDF+6Wz5O0JAo+Szm7ot2EdR0Z
         vi5h35loPl4NZyRngg6HrBYcaIfFErYOj7vMhq4/0CYJVZjdouJveinKD/6ASHTEIZDa
         x2Jk715OV4xr/JTjrIj136F5IvvHygbqY0dn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226596; x=1745831396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw8UIDvZBCcr83U5CXKVA2bqzTMOFGkmm5WFSkBADIc=;
        b=g2YOh1xnN2AMmBpRK32RdOwSz1+GFdIqCcSY4SnafCs7HSJ+dqItkHgijK3nFQNObg
         yevaA7kq3V8QIPmM5yux9Pur4S64zCGVzOX6aiTmpSxHbXVDbxNTF4XApsgZhf2nebsx
         8Dnv+c+KIyHc5b6kJP/jmoGZjs5Ap06Xm5xSvlDiRv8IITi+feJVo2Au4p3ZCL0y1CK1
         NNO/CPdO1ytkft397CG8yAXD2zSFCrHZtdBm2jXA/1B8jlDRehxrK2HYQ5rCBox4Dvon
         XUkZ/RQpyGrlN70ToLUwegu3SQZeEGEzEJubocxA8YU8juifzTdcEEPMCBaEu2Ov2UtV
         FgJw==
X-Forwarded-Encrypted: i=1; AJvYcCUaJod+P14JJBJm4M2TPfHsVKlGX0EikrTtBWC+3tJjtmTcGgXb+a2xGgwGQ5Eqvgmh9f0ljgptSw4eq1OiaV1T@lists.infradead.org
X-Gm-Message-State: AOJu0YwGOJ38N50A5roDb8h3XcQQOyaLd/oFf1Av/qdWEZMVxRTbwJ2s
	MO14S13nI34sZuAqYbh6/RWQ72XOhKVh4J0xZpw6KVZK8gNx8Dfea4MiiLo3Dw==
X-Gm-Gg: ASbGncvpcGB0TAMVYBgKTdMFkrcW5vy0s+nFT18EoJpB6FSFBWw3U0jpu7I/N/hK1Br
	XWieA3Y1twOd32qv4dxL4qWZDgzSLqjtXHqAek9xX9buwNFzse4A2T9PRDIYjqNdNZnFqEWwpLe
	OAoK880pK0Hs5Vyf5MZ87a8Vmuiegj+1ukUfpLVRFuHMyWcUnJSEtwr0iO55Lg33YkY0TxqK2S2
	S//IC6fotPUYgBE57X73cXhZRmvdNapwtsGkIbXHUXOoCFGxP3AmFowpgt0NVCG0dwu8hevcYYB
	HjEt8E/uWl2OH61A2CWbf+fpdtr7U4Nvb6k3hCVtTctA9kYgMKMl59zY1vPLNMZkCXHLHQ==
X-Google-Smtp-Source: AGHT+IHDl/Ex7FBzvgMFPAFFoh7YhHYfxUvKL5Gx49McL1TrmyCRhCWjmqZwJhpIy+Bel/jx902Q6g==
X-Received: by 2002:a17:903:2ca:b0:224:1609:a747 with SMTP id d9443c01a7336-22c535cbfb0mr168110325ad.31.1745226596121;
        Mon, 21 Apr 2025 02:09:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e3d4asm6113079b3a.70.2025.04.21.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:09:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pmdomain: mediatek: Add error messages for missing regmaps
Date: Mon, 21 Apr 2025 17:09:50 +0800
Message-ID: <20250421090951.395467-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_020957_542919_B800C5FC 
X-CRM114-Status: GOOD (  12.42  )
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

A recent change to the syscon regmap API caused the MediaTek power
controller drivers to fail, as the required regmap could no longer be
retrieved. The error did not have an accompanying message, making the
failure less obvious. The aforementioned change has since been reverted.

Add error messages to all the regmap retrievals, thereby making all
error paths in scpsys_add_one_domain() have visible error messages.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index b866b006af69..22cdd34ed008 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -397,20 +397,26 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 
 	pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
 	if (IS_ERR(pd->infracfg))
-		return ERR_CAST(pd->infracfg);
+		return dev_err_cast_probe(scpsys->dev, pd->infracfg,
+					  "%pOF: failed to get infracfg regmap\n",
+					  node);
 
 	smi_node = of_parse_phandle(node, "mediatek,smi", 0);
 	if (smi_node) {
 		pd->smi = device_node_to_regmap(smi_node);
 		of_node_put(smi_node);
 		if (IS_ERR(pd->smi))
-			return ERR_CAST(pd->smi);
+			return dev_err_cast_probe(scpsys->dev, pd->smi,
+						  "%pOF: failed to get SMI regmap\n",
+						  node);
 	}
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_HAS_INFRA_NAO)) {
 		pd->infracfg_nao = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
 		if (IS_ERR(pd->infracfg_nao))
-			return ERR_CAST(pd->infracfg_nao);
+			return dev_err_cast_probe(scpsys->dev, pd->infracfg_nao,
+						  "%pOF: failed to get infracfg-nao regmap\n",
+						  node);
 	} else {
 		pd->infracfg_nao = NULL;
 	}
-- 
2.49.0.805.g082f7c87e0-goog


