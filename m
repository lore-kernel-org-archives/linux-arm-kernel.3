Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB67BF36C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=; b=hrvArEwk9zapItVWLwtG0B3+3O
	lQpPjU4B+rvwRKNhL7O5wGgKf9civWyUY0vOi4avSjXGe3nYxOxErCdmvb8p9qfcpp7Wbm+A99CXT
	+mvdtYnQWSlMHBgOXTcqTIVyey8GWK02jt+Omp3GpAYwydU/z6+9dqePjFta29vy+WWTIGQLVKiKl
	uz9vRD5p7JW2Xn0/TpGQlCtC3mLORKR2NYJZeBysqtUngehljK1PuRGCnDVpnk+kidd3lYyw68nIp
	19ErtTuaGSr/A4J+6tmG7X5kt+OajxDhg2woIydiNIayUsBRBBR70Q5e666vQwrkTSyzbWn/eHyNc
	iHpvV8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEiOM-00000006VRZ-35av;
	Mon, 20 Apr 2026 06:45:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEiOJ-00000006VQV-0ZtF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 06:45:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1005813b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 23:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776667554; x=1777272354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=;
        b=g/AeL2PE/j0r4YUFwu+27WjSqfcGXhiilx1MeF1O8X9GgqfZ6bPYjlKeEjhH+NHVoa
         qdgM2hUHzU9G9YwqbPrsrK6OaoEPptakwm19YWUE4n/pe/K/RLfkRTR7qLyqFWAMW0gG
         a0xaZyquesOzfPeCa4F1HiqOaj7ZAGyqe+vlODgp+R4Umb6t7n95Ha1VNKkkr9x50t1O
         dh3P0SWZ5GcIhRnDjj9XGxYblV8TEzMsQZe2LKRoKo2N3OwJOy26AOuJ9v0PNAAYS5tv
         fwcVPTcF6guzWwUxGwlm2Oknlji8e8SGJoSEttXQ0nPzPvSS5nyAMD16venFH5hExBjS
         iZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776667554; x=1777272354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=;
        b=A6O++237vYN+niK+knqd8IVOJu1npqxnIlxhMIHpbxYgdB+sP9DMuypuHQJDMZIgsT
         I9AZ5V/U2t6Rjbc3cLxJF9dVBcLPaVAn74pt96AVmJHTsPwaAdomwkgHHFUnYzqSOG63
         cAo0iApCEQY0RNO+UKKtu+F5dw2hC/W9jcm4BFXNJGz94Rb/Bv0iC2c+nLu/gz8jRGFt
         MkQu+ufRE7jV3qTsMGtBTXe/I7HLbFSygY/i6SKY21w+Hvakpf5Xka1NV2PscQt7YdXM
         Zu7w1ejNaUndTjanELFYJN5c5rlzKMg7e3SHT9Pld+IYsItLLU2spWpTveGQO0zgSYuH
         keBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DzMEmcUs0MAwS71Z6k6Bjl9T4w4X8OZPaEq6wphDin93y3XyrJQx0zQh52xtN78YFxxWjnr7amv/5Van/1oZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YxASD/JRCBuyJRfa7bJDn0IAWShPJrH1BZCRGoqAXlCiNClgU1u
	T6va0luT6ygUPwMcOTqgU89+ghkYPeqNEU8IN1zlqoivdRfmzCmztA79
X-Gm-Gg: AeBDiesHgM1mEUXGU+UZR07s4wey2J67K1PF+k8GJK7Ko+H71TY/wgCOBw7fO3ZtcyG
	3nwUZi2hgXfAd1WH+m5LXoWXDPXXwpd+YhumHgh6eoBvpQxxlwu6p3MzL6yExtxpisu9Upxfj2G
	0j1RS5Ur3viyeZ/Ub+jormrFulblUIILtbSpd5/iZW5TaJI+75FFEjoBv2q1NHR+HKxXLXF19Fl
	IGJQ1sLvZl0RYBLXOWTVW0xXLNuPlr2uxTpoI7dWPs4vT7OBNu8cfa3pZ99MXBgaQ9yBWaSNLjs
	nYuYUSHOORLt61SFalE8OuVzf9khWWGNGJ8RtcTSPeBKbb/Mx9sSZn46jn3KxaO79SUX452axsh
	0qtLsZyJTK2L+U3J2+dzA2uPq55QAFob8CO/oRmuOC11lvQBbHDl12XUXVPiP8awSPJbyGIas/r
	mVFMMnTG9OewuXxriy5xwemcos/41jhfA5VGw71n08N95M/JDiV8fLMQ==
X-Received: by 2002:a05:6a00:1891:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-82f8c97a4admr12481591b3a.32.1776667553827;
        Sun, 19 Apr 2026 23:45:53 -0700 (PDT)
Received: from dbc5pt3-os.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm10509177b3a.47.2026.04.19.23.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:45:53 -0700 (PDT)
From: sai madhu <suryasaimadhu369@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sai madhu <suryasaimadhu369@gmail.com>
Subject: [PATCH v2] drm/mediatek: hdmi: Convert DRM_ERROR() to drm_err()
Date: Mon, 20 Apr 2026 06:45:44 +0000
Message-Id: <20260420064544.266478-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_234555_169438_7DBF97D0 
X-CRM114-Status: GOOD (  10.74  )
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

The DRM_ERROR() macro is deprecated in favor of drm_err() which
provides device-specific logging.

Replace DRM_ERROR() with drm_err() in the Mediatek HDMI bridge
driver and pass the drm_device pointer via bridge->dev.

No functional change intended.

Signed-off-by: sai madhu <suryasaimadhu369@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 1ea259854780..4ddcdbf7bc8c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -981,8 +981,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		DRM_ERROR("%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
-			  __func__);
+		drm_err(bridge->dev,
+			"DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n");
 		return -EINVAL;
 	}
 
-- 
2.34.1


