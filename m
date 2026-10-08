Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384F0CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a14qc72yQKkzCAZ2CAoTwipNnd9qGKItgjyfXX9xZAw=; b=NdtESWZ1T5cruAXqDWp5TRGcNY
	mTF+FwVkNJOslDp4dCqtQaffl2oudCIQve+sovUaaWG6EShKijIT6RdeCfJN1UZgj/O7PGXRzeWyS
	5rJ2+MWofrtWqvwxRMskqiAG11KyNka/GfL3tdzr00YtNraAnVioqVQqrLeigQhso3wOVlWWjhqK4
	GRKgvsEaVA0493NkgkdxOfIVxs7rXbCwo5bdZJlk5ulRpuFItH0HU9liYoGMLA8bG5MzCcuf857HI
	Vgy2L+5r1PouZI5LWxIjQbW80YVhcjkQ+u7NVlNxJngWm4AawVbxRSagSKY0wimLpZLPAWnbVXNwI
	fOdDwI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtdT-00000004upf-0C33;
	Thu, 08 Oct 2026 19:18:35 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtdO-00000004ump-2ZRu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:18:32 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-35154cb9de2so4960138eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791487110; x=1792091910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a14qc72yQKkzCAZ2CAoTwipNnd9qGKItgjyfXX9xZAw=;
        b=XKHqRSIA45QWqnqriSW/FP3QRnQKNbeZTDtWaZIkp6WUzqYRMGfVoMxbRYwsoDmJzl
         OL8c28zZAvdHZSm5ORQZu2GKWbK25W2bnhAd/e8lPTa2LhNbnSHiZMFA3Mfh29uDD6Om
         hQJyj5jznS9VrqtVfRnOIchJVUuLuVH9sNuvDtOpDzaB1lWGWnCUJeGr9qNt/ReL2Xpr
         hGBnTEZD76mb4ajLCmrRgHKKB3E+3QOhEv4LqBkUskpaTzkYFe1QzSrqPpAOOmTXAWbZ
         ttLqz5O1AZu8l15j+ri0HFTc8l0AuXM9JBX6pDBS9r+AtN8aMxRYW1lyP68GQj3C1wKN
         UYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487110; x=1792091910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a14qc72yQKkzCAZ2CAoTwipNnd9qGKItgjyfXX9xZAw=;
        b=HWdtgxUoCT+TwKwlq+CfDCk9SxJ//UNyTOmbbqYsrI0w5O/WDRR+wS8Q1fx3+vA+vk
         apd8fUuHYjbFrbptASsePp6TsYPvniS0P8EEl3ZsrXl+80112qjqKehqVrDo6fGiQI7m
         /528NwrcKSFyUdho33fLQBzLxfqOZDcbXPI56OsSioxDdrYhsMHvcH3WkjZb68yUrolF
         sTCNr2jMzddL5H6lhfFGyEdhce5swkneYdmkgccbtzszJMnqQiq4N10pC/lHL3SleLRk
         9Y/c/z8aeXSzDIHmZSTm9TzD7KpfMghQEqF/7aFuIQYyhsi/oo/Jch9YmJlcaG16b4m1
         kEUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsBfV1J6cI/LdUcB7WG/uHePp39c6HbABXimpg5cmI/giJVPcj/oiMaztP2DodKMTjRr5eeYV9DK6kNsELquLp@lists.infradead.org
X-Gm-Message-State: AFq9FYKs8XUR4bNm21oyXbZzWx8C3jdcrzrn0Y1qScQ7euOtVjAE5B30
	BhM/dPjqrFLc1ooZh+nzMzytFmFjdh8ckLqUCngTAI1mJqatgXln3k1uajFy492IcSU=
X-Gm-Gg: AYBFou3jsLE1OoWROjTswJu7ketuAyuCd4w/AOuSy3iAVhf8OwDI0WjzRKEBPQj1TOw
	vDpdh+nZHmf1EsSGK3QE5yewVJU7dmB1hn1Vt75giwLty8TxzPywxUyLgwBNdT9nhJJX4xmyhOc
	UhKqDrWCQJdF2nu/cpMB/ebqUytDkzD5bvU9Kmk5WzvTky5SNjRhhpyveUlwGzkONnMNBNijgyM
	81tG51o+/aWjAGG/ckJoFbmKLBB5jFr3o/VuNk3o8hxTfL2FWjjlpiZLql49fZJn7Ug4sQHxObd
	aZa+Lxvxs7nR3ehH0iqHBK5tej1zRvsrIqwOy41/hPofdfxzAqN/8lTrfMPyPQT2cAmAU2lCdPX
	iF323Vz0Svm62dC4Q1VTsL/1TKOMLl1muhlk2p9Z1YWgEvyWKofiwvHXM+R0WWId3U3trOCe2Pa
	ZYFD9zI8CZ2uOcbIrFlU09C2DVhvq4oq8c7dH8wRBgO7JuSAXMlSQqrbSYRj9UBhnSitJhSNy6+
	RXc4RHbB4ztFw+uKcxUyZCaxOYa01sbneStxqNJOixENcHTay36n9L4I3NVjhvpDoA1XQY=
X-Received: by 2002:a05:7300:8819:b0:33c:e72:5b3b with SMTP id 5a478bee46e88-3535f3cbcd4mr464739eec.25.1791487109863;
        Thu, 08 Oct 2026 12:18:29 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm117933eec.4.2026.10.08.12.18.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:18:29 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Marco Scardovi <scardracs@disroot.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	jay.xu@rock-chips.com
Subject: [PATCH 6.6.y 1/2] gpio: rockchip: teardown bugs and resource leaks
Date: Thu,  8 Oct 2026 15:18:20 -0400
Message-ID: <20261008191824.98662-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191824.98662-1-artem@trailofbits.com>
References: <20261008191824.98662-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_121830_649615_1185DF2B 
X-CRM114-Status: GOOD (  19.66  )
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

From: Marco Scardovi <scardracs@disroot.org>

[ Upstream commit 9500077678230e36d22bf16d2b9539c13e59a801 ]

Address several teardown issues and resource leaks in the driver's remove
path and error handling:

1. Debounce clock reference leak: The debounce clock (bank->db_clk) is
   obtained using of_clk_get() which increments the clock's reference
   count, but clk_put() is never called. Register a devm action to
   cleanly release it on unbind. Note that of_clk_get(..., 1) remains
   necessary over devm_clk_get() because the DT binding does not define
   clock-names, precluding name-based lookup.

2. Unregistered chained IRQ handler: The chained IRQ handler is not
   disconnected in remove(). If a stray interrupt fires after the driver
   is removed, the kernel attempts to execute a stale handler, leading
   to a panic. Fix this by clearing the handler in remove().

3. IRQ domain leak: The linear IRQ domain and its generic chips are
   allocated manually during probe but never removed. Remove the IRQ
   domain during driver teardown to free the associated generic chips
   and mappings.

[ Backport to 6.6.y: For 6.6.y, send with 1c1e0fc88d6e (CVE-2026-53226)
  so generic chips are explicitly removed before irq_domain_remove().
  6.1.y lacks irq_domain_remove_generic_chips(), so it needs a
  separately reviewed older generic-chip teardown backport. ]

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
Link: https://patch.msgid.link/20260526171050.12785-3-scardracs@disroot.org
[Bartosz: don't emit an error message on devres allocation failure]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 1 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-64241. Releases the debounce-clock
reference, disconnects the chained IRQ handler, and removes the IRQ domain
during driver teardown.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.

 drivers/gpio/gpio-rockchip.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index ff9a4b8611d7..e0e4f3ed5fdd 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -629,10 +629,17 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	return ret;
 }
 
+static void rockchip_clk_put(void *data)
+{
+	struct clk *clk = data;
+
+	clk_put(clk);
+}
+
 static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 {
 	struct resource res;
-	int id = 0;
+	int id = 0, ret;
 
 	if (of_address_to_resource(bank->of_node, 0, &res)) {
 		dev_err(bank->dev, "cannot find IO resource for bank\n");
@@ -662,6 +669,11 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 			dev_err(bank->dev, "cannot find debounce clk\n");
 			return -EINVAL;
 		}
+
+		ret = devm_add_action_or_reset(bank->dev, rockchip_clk_put,
+					       bank->db_clk);
+		if (ret)
+			return ret;
 	} else {
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
@@ -773,6 +785,9 @@ static int rockchip_gpio_remove(struct platform_device *pdev)
 {
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
+	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
+	if (bank->domain)
+		irq_domain_remove(bank->domain);
 	gpiochip_remove(&bank->gpio_chip);
 
 	return 0;
-- 
2.39.5

