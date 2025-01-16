Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115C0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 04:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=; b=ZJjcqqh/ZKUNE2GImZ03ctCUmg
	zMhBbaRq012UMvfcRm7cRlsmXasoVQ4mZa+dL6xgbXAFIAEu+dtr7PWkCX67t4W1WgY6jnB9b3yYf
	p+0AumSQNE6ffdxkvdXlDy+YQfSdmBesofK8/NNLIFx2WggPiAbF3Kp5ZCvklMD7AxfphQYeOlmxD
	VlwA/os4ZIe4GswKDDThF8xvkXLgfAvuhSq6ieY60pno1oqHAyc4tV/fH+TqccuZz38TMJeUlMs87
	lgfFESqNGv/Bg410tpnpxxD+u1TMzpOdnM03IJrolZnB1e7ceeynyfWL+chNaVQJGwYkMz2NC90Sf
	+KX/S9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHpx-0000000DpJ8-2d0f;
	Thu, 16 Jan 2025 04:50:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHoh-0000000DpBc-0Odt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 04:49:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2163b0c09afso7408785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 20:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1737002954; x=1737607754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=;
        b=IsqYYMiPqrl2GsPTVgp+GJDrkcrnFskkCT4MzHEiBJpsgTxqleBflUbO2ud6KHn58l
         KJfMH9c8jPtg9BdIHq/n0G4o/iEbRR4gReJJanuIRmob+FCYwfTMBgPULtqUgvz3N4JD
         FdnjX7g2EiF2K32Jjn/pgQHtrqdDgpsI8RlpS8dwhhL3M9m6FneJIcpY4txo7ICjhFHf
         eUPtUsxhRaVXkgopc/4sDzqiZKX1+5/UJHyYPgDARrBHp5Acbc9a0N+m/ueIMCQKtTUG
         8dQ74WDGuljoA4tR93hmDuc93u3Yf1uZBPJIbs4zlSKoe+/9oPb3lIN0vqdYKQ5fjKqV
         Hqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737002954; x=1737607754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=;
        b=fBAV0N7fNP7FmVgnlHO/6b2DDFIEhZoNBskGyHCLGYgHxVmgPQkVd8roE1i4MlF8yv
         10EcnzH6cDeDm+z8eliX0/KMbanPG0P9iOs4WjRuiJarlJGzKgzENDRCRkrvak60c1bs
         qjEEy//Zv2ggn5F3KQEJWyt0E72d8nCepWezF4Wzf9t4wFhxXnC0fOgUhx/q5wxdN7RA
         I7XxV7Nj+D44blI7SGXqNR2P3rm8a8OuJ0+0vSp32PWbpQGtIzdSmh8DXOhrpP8Djd9E
         UTmt46lvm/zVys0m8BlEcJ2z2FV+MvROXnGzhrL4wpJEazxOhm6vkZrodkLG/PB+41pX
         q3wg==
X-Forwarded-Encrypted: i=1; AJvYcCVdZghqYXOOO73Q76fNGTau5AC/KayWHuvQEBh1xeso6Zqq9XCiwrxNJHPBjITsL4rCLFCYSEwBIdsKDTy3zgd+@lists.infradead.org
X-Gm-Message-State: AOJu0YyuLwoki5Y0DsfZwm/WfDGb37PNFep7OoTzF2scX27AByMrtVoo
	GIpOuvtr0m29R7xCdVmbx0DEd38SM37CVz/E3UGLtsUIzXwFHKRBk5FLEAY443E=
X-Gm-Gg: ASbGncset7NiKobBuGi3od50t9TO0dcOBCTvtvTw0GJr36lJsqmvnk7Z3B+U9fHPiTP
	+yPmJwQly0q6XNzaT4s4K0aNrLy7CuNgueDDMNI+X7cylD05UpS/xTH6p+qW8eKjhNxmo9RaIIY
	cgG8vf5Dp44ruxwckYBtwyLwMwAwhizFtUBZGndNToPT+txKAVqj2uZG4Bk3i3TvyDXZ6xeiPDG
	7f8n995c4VvMscVMyiJN6f7tYBM5Xu57lLgHa940jj5whjJHPGzr1VoSwOdBi3FfPwQboBYAkf1
	+Q==
X-Google-Smtp-Source: AGHT+IFf9Yb/lV1fMPHGdH6ntBNzqtAAdZrv1z6KXUln4z+2PgGQ1VQ45kPdIH3rvofp3kGQ/N/b7g==
X-Received: by 2002:a17:902:e552:b0:215:b5c6:9ee8 with SMTP id d9443c01a7336-21a83f33a44mr397009725ad.7.1737002954438;
        Wed, 15 Jan 2025 20:49:14 -0800 (PST)
Received: from localhost.localdomain ([157.82.204.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21ada1sm90516235ad.138.2025.01.15.20.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 20:49:14 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: mchehab+huawei@kernel.org,
	sboyd@kernel.org
Cc: linux-kernel@vger.kernel.org,
	konradybcio@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	marijn.suijten@somainline.org,
	bjorn.andersson@oss.qualcomm.com,
	abel.vesa@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] spmi: hisi-spmi-controller: Drop duplicated OF node assignment in spmi_controller_probe()
Date: Thu, 16 Jan 2025 13:49:07 +0900
Message-Id: <20250116044907.2947218-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_204915_131285_4DFAACEA 
X-CRM114-Status: GOOD (  10.07  )
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

spmi_controller_probe() assigns a parent device and an OF node to an
SPMI controller. However, the operations are not needed as they are
already assigned in spmi_controller_alloc(). Thus, remove the duplicated
assignments. An unnecessary OF node reference acquisition is also
dropped by this patch.

Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Suggested-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/spmi/hisi-spmi-controller.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
index 3cafdf22c909..122140b97579 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
 
 	spin_lock_init(&spmi_controller->lock);
 
-	ctrl->dev.parent = pdev->dev.parent;
-	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
-
 	/* Callbacks */
 	ctrl->read_cmd = spmi_read_cmd;
 	ctrl->write_cmd = spmi_write_cmd;
-- 
2.34.1


