Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9469C44509
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 21:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbs10KidpIGqlIc5os/QD3BMwoPJkkDhyGReQO8E1Eg=; b=Foj1vQRJwbwdHAlLn4UJFvkZI9
	ZbzTs5Mf8xFhCP2ILKQDMtGJu0PXgj03P4plfWqGm0fvJk97ZfRO0vrDqy78XmNsMYsVESenwd98x
	y0iIiMqk37gkoMPp8GZSROUlrVmX6TvHHJ1L8AbwruHOBUdTwLpPI0VCQYGYRt6nbF4aT61hajvjX
	QJ+smDtrLdf+aISsrRNk0I+3kFYXkFyHqiQn0CC08K5HgvWAj8nGFvOPwzR7Kl1HVNKXrJ+sYGKkK
	CHgJSZq1a+Y9sZs4+nvRys+4UD6vXpJPnrYmQdoCfxiMbPU2l5hMUFNU8OPoSOi45i66fma3ps6dX
	yUuXkzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOFa-0000000ARv8-1pXk;
	Mon, 13 Jul 2026 21:31:42 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOFT-0000000ARrm-2qt0;
	Mon, 13 Jul 2026 21:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978285; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L2PNnfC64tcONPcEAMUL1hbG5aoNfDFiT63Zs26QFcwqLMxMZUFV+HE++G5uRlaVT
	 Oe1S3blsx0UoMGkau0ZL8oX9X610R6U+BhNZE8cF3HNAZfxMXy6MLgMN1twB9gh4T7
	 yxfKA9s6Wu6qi0XvbeP0DG/fF4kbS8jj9P2g16mMSLJw9aE1bFp0tLdtMK5PWSdSn0
	 NAbSdno+5D1P9vFgaD8S8iUR1Hg/VCRPZwda7mQpvGkbib7UhA93YoJkp0ev0SZgEQ
	 W2OvJEsNPIMrSHu2G5tKVzFI3HfUWNWX13zuEj5Y6WoMLxRDdyl7kTWmldYSFWWxWf
	 zAy8aiHRtnFcw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 728A241EF8; Mon, 13 Jul 2026 22:31:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978284; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TwulCmiugN+lltjlfM2DqYPhNlI8LGpTve9ADDH1HsnZk6DXgFJtqy720R/WLdars
	 VXtpl95Oem7oVX2JL/SBdYtJAN5VvfPl/pRwGFR/WLTOr6m+yjmk7lBMIt5TFppa9F
	 jcjjDIEAAo37DPh7bUTQKWN8pSDyw2/VU+OSVhe9fPfQH2f8E8FQ4kLEPD8SusxDTJ
	 poGEom10IdzicSlkAIiHwE8w5QCVc19C1dNb5pQ+z5yaiAtetmKo+OErEhhKoGNcuw
	 gbBFgK95aEfxgFt+v8O3Fafh0IIdNFGXQEIZEfl4YPf9qOkDEpuLzl5YVzMwsIUDIT
	 hLZI/lrhAFfxg==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id AC44540A3B;
	Mon, 13 Jul 2026 22:31:24 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] media: meson-ir-tx: Ensure clock is disabled on unbind
Date: Mon, 13 Jul 2026 22:31:01 +0100
Message-ID: <5f880faac5530202a07dcf92329476608bbabfc1.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_143135_853747_3F17E2C2 
X-CRM114-Status: GOOD (  12.73  )
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


