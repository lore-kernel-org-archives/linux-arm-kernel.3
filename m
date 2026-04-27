Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC73FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIIdNRJ9w0CAu5OepNld+STP1bHH56eIhQu2O8kdVlY=; b=GbwQZQFe9owKh1ZGg7xbelNx64
	d/FsfjR2XQ07RMDq/XO9gwOuCmTFtsOcOWkJENWWwjANTJ+IWQGrgiIs5FPkdkkqtyXKDqNBUu9l0
	gOzK7vUPaFfx5z5jV9arij3VWqAxfd30ZSbSfYlP1xOniFyVNYhV/WKVgnqd1gWbjeRW/T20g1NZh
	o/xg9vbfKxu6M7hSs7he09mDTlZIyTyBiLZKUspuT59/XUk9NXqYsoqT78vAjvwvYs8i5gBoifZkE
	srNxLQpoZcyOPPKZsOu+WhzVDlmJ3+adnzDr/QaSROJrAwZxFezV7k/c28IU2fSYF9oWH6Wljuxj8
	czR7CUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFHh-0000000GFUC-26g0;
	Mon, 27 Apr 2026 06:17:33 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFHe-0000000GFSi-1MgD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:17:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82faf871346so6118677b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777270649; x=1777875449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIIdNRJ9w0CAu5OepNld+STP1bHH56eIhQu2O8kdVlY=;
        b=RP561/yG/6CSPDRu0FJt46WplLRvwITHqYx3RABtmMh587bTBIQoKsJccRtDgj/1Jp
         q9sinLSwltTu0D3TIJlorNAEwmu/N10HMe0SdIapdHS0L9mKE/jC666DZmWNsIOHHLnH
         wXIRr74qbnzCnU/hA8FTTy8kpKJAloWnbCI7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777270649; x=1777875449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIIdNRJ9w0CAu5OepNld+STP1bHH56eIhQu2O8kdVlY=;
        b=HV1SIUmM+QC4utWkCopjyYjU5WeyQmaTTEuWLqeEdA8K7D0o3F9P10MDTPrgGz6uOD
         Rw5WY4k5GMM963WhewaDblc00dBO0QLyS4tbhBFVeAD2XHi3pitdfFqPiv6oCSy72JWh
         7CBhOd+D1uu7fDa9w+3fA7JzNfd7Ev8kxvqMU9IAt5b7tdghxkWzkbkbnwvdaw2gJuSc
         XCVqwm5wTtqISEmowKofDq3VvUcQzWF9N9YN3ra5eZYDJyP0IZ8w6mOlbODUSPeMHjIe
         wR2quOSbVFuwZnaQ51Nw8Edik1lo7FMJGzvYfZPnzJROYskBuw3S80BCcz+miBu5k/oM
         N1xA==
X-Forwarded-Encrypted: i=1; AFNElJ9VGDofITZsYFGQt+PdCL2mzw6KkRwOqPSqAkPgq5BFPtG9IjnywaUIcp2TLuuD0wKF9CTH5DD1SKBSBtK3Ltcf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/EuzqOpx2kZuCBKVUSQSxZDcy9FCm371Zg+DvFyiYFw71P9/0
	ud1N8vMZPq5Chn+2PtHHur4z42MCQGeOucgnsmz5WLFNzlMkknNSlg2iIql6iybuMQ==
X-Gm-Gg: AeBDievgaenQH2JoUjYrz/jpOLfH9YY8fQE3ydhnF6YLDwuFW1WeoSQ63jcljdpK0F2
	CAHBVbJsV5X8/Bbd2cOj9hxTef8azBQ6oDNyzNGxtWrhCklGdzW7K8LXCxeiZohclwLmxXlnEQ9
	mh2m3TDI8CbYkFXkEO63CItgRLEEXF5yc59unpDZVjPByA+j7gLgBi9/kAyza4ACntxZQyRSBPU
	ho8fYOnRq8myLjMO+yYI3IUbT/KRoHL0679Wir05RE93AJIWM1Xw0OcquLfLW0l3x9x/XDXJ2eT
	UiRzbgzGQEhR4jW8lRZHoj8K8LA4bKcXL+aF1FS8YhJQybLX7Ymohdat5dV3LX4cT/iGxrHZ21+
	m+xro24iAVoBuU1BNYELrKHvOzuI04LUKZ/Q6xo7QksWDIEk3m12SBOsnuTi1qqEAENBMstZaZ+
	wPiFW6puvF3oq03R87YHiODTOWjWM+qMuBP/xwqza6wDIkx7Z9oFKUfNahDtQAent3Y0adh6pQh
	VLTtzu87bXqwK1a7NCnwAW4+uIKFw==
X-Received: by 2002:a05:6a00:4b4d:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-82f8c93a983mr44134092b3a.48.1777270649269;
        Sun, 26 Apr 2026 23:17:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea02ef7sm28824635b3a.25.2026.04.26.23.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:17:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: common-v1: Directly modify registers to set GPIO direction
Date: Mon, 27 Apr 2026 14:17:17 +0800
Message-ID: <20260427061720.2393355-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_231730_503424_371CE9CE 
X-CRM114-Status: GOOD (  14.83  )
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

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

Since the Mediatek hardware has separate clear/set registers, there is
no risk of clobbering other bits like with a read-modify-write pattern.
Switch to directly setting the GPIO direction register bits to avoid
the mutex.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Only compile tested. Accidentally fixed the wrong file when my target
actually used pinctrl-paris.c
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 3f518dce6d23..9c258e205e39 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -806,16 +806,24 @@ static const struct pinmux_ops mtk_pmx_ops = {
 	.gpio_request_enable	= mtk_pmx_gpio_request_enable,
 };
 
+static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
+
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
+}
+
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 	int ret;
 
 	ret = mtk_gpio_set(chip, offset, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, offset);
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
 }
 
 static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -895,7 +903,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get_direction		= mtk_gpio_get_direction,
-	.direction_input	= pinctrl_gpio_direction_input,
+	.direction_input	= mtk_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
 	.set			= mtk_gpio_set,
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


