Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC45C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FDrTaCU9jAV/fV+/AQrSwe7XnD7/SMlHXRCxwMBs9I=; b=vO7mkDWINqu72uIrkhiYeRYYhS
	a5BP3ePhHYoO4bOnRfJA+hrbcTUMlFxiLcOGFaaY6uzn/PhqujpCCJeZHVt2V/SuewkuUc8SCIjbb
	Evt2BhoqHVQogtyZrAtctatcmcWeTfn1811ApkRbUkiEH+LKcLsYKyzqhKfSbtr8LNBWJzzLceJ9f
	wKlzjlPZNTdxP7FBma6IluIQ9GZMAFUtZ65W04uMyEVaPAtkbCVJBSh+HEra56myb8GThsXJEH1d5
	lXVD9h/AbfHRFL+jmed8TT0gIWSKntTwmy4iEqXGxNTD1UGzf2kiDyriHZecjJmLj+bVsGYqC56jH
	T3/Mb/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLEw-00000002pPU-3VUJ;
	Mon, 27 Jul 2026 13:19:30 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLEl-00000002pKD-3i8S;
	Mon, 27 Jul 2026 13:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158356; bh=DtSRpaDqclNo6U2QeRpHGIfjJQ060yIsBqj5BnAVUds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fmyG7pFHhNWwUTYe7XPIy9OnZkMCbCq9s7K16WknqRK9Lqk4H/EMtbEtvKQI775gV
	 U63H+zMFC0f0xWe2eQNuugFDeueRJzET9ahS2wXZ9yqmnHmM7FViG3wcZ6HdmzLpCK
	 p2vjkrtGaROYZl4JrFbqLNnFx+2goH5TFrEb9QLQZ5f8dy3x2DDr/kS0tgL18fTbEh
	 B0ID1Sb5Zx3NDDfF9p5hd2Tp4ZHYz70rX2R8D2EuBFsno9/9542YC87dQwRylqQJJp
	 UgEpnj6WYYGENWGOGtIAP3Kg07F/GtcV4IfnG7qdTMfGHJIsFJ0sJI9hOIIKrQd6bd
	 fcN6GMxziPuuA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id B2E1142550; Mon, 27 Jul 2026 14:19:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158355; bh=DtSRpaDqclNo6U2QeRpHGIfjJQ060yIsBqj5BnAVUds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBIHIgae7zOcEVNnXq+W0qj9ogxm0UhiOT/B8rHpD2aWDLrfRdT6XfCR66JQTF3vA
	 RhCJ//EP9h4EwKx+hqBZxznaQ4MpHJhYZdwQJujAalOhWsTuumK6z7PJCsKV2JRZFv
	 8nA3tkJnUxdnS8W7e7M3xKhpaNGADMFrAmy+R+edVy7/ICsHFiHi9+GV4gl1M/8ewq
	 mUBd6cs1OSgxCvO/KWYudA7iJHt7FguPijdBm/zKra8HEKHfhdBAldCoGJKdIW6Akq
	 AbTI9TYp47km2Mjx2O4MbSFUvQE5UFtWe8R/iqMK+2GtwzhPC3fEzMpjctWJuDTbSH
	 6lvA84poWDqow==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 71AED4253E;
	Mon, 27 Jul 2026 14:19:15 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/15] media: meson-ir-tx: Ensure clock is disabled on unbind
Date: Mon, 27 Jul 2026 14:18:50 +0100
Message-ID: <ea91c3a9dcfbc146f676e2cc3b5f769b2ab8c088.1785158244.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785158244.git.sean@mess.org>
References: <cover.1785158244.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_061920_065746_3C54DA16 
X-CRM114-Status: GOOD (  12.75  )
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

clk_prepare_enable() needs a call to clk_disable_unprepare() on
driver unbind. Make it devm managed.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: stable@vger.kernel.org
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index fded2c256f2a..e7bb107e6a84 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -288,8 +288,8 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 	if (!np)
 		return -ENODEV;
 
-	clock = devm_clk_get(ir->dev, "xtal");
-	if (IS_ERR(clock) || clk_prepare_enable(clock))
+	clock = devm_clk_get_enabled(ir->dev, "xtal");
+	if (IS_ERR(clock))
 		return -ENODEV;
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
-- 
2.55.0


