Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A20C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsFbGvUc+lL3nEmcNAop98oZPFXcbP5zb4ZbtxDxx0U=; b=AtmQRVgNkVb4DL3jQiGnwEet50
	U2bWD/zCJ4I9Yc027KSTybYHSKK6NWKPGgRjqVA1w9QWaV2sm6A37nI2tLgeJHFgCv4kfSlz4cmui
	t21j0Kd02YdGf+hIA8vIbOTn1vXcVQ7OnUahTt1AxMmygYe3UhKbaal63yCNcuZY4huUf3/jwLTT3
	Rb/ZYdNoWZ5Xx5wwtR5tUKs7CqdvXn96e7h01flRH6wZi2m7XClLr8QGpBBuyUsNon5cnxkXO72Wn
	tNSQxzXfC/seGL3NqCkukMIt+I4pBgwhoBTWbf8zvBj5MxW5chvZL62yEFd344CwvGKjC7ZDJ3Fk4
	RSdWzEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTV-0000000E0H3-3VqN;
	Tue, 11 Aug 2026 12:20:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTQ-0000000E0AS-0o6t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so732741b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450851; x=1787055651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsFbGvUc+lL3nEmcNAop98oZPFXcbP5zb4ZbtxDxx0U=;
        b=lfNAk4B+ZO32a7CMS34gxxqNOo8nUctxh68NcLHmqs0Jky+ysxtvdRX0E+zuim55ww
         EM0GuU2CdY0t0/6ivabV6znPw0jLZTyhEExyjHCjYFukCHAGbRRiV4FA1qutA0cJzNU4
         5OH856XgIlX/RwTBNm5MBIaQNS34xJDKMimow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450851; x=1787055651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GsFbGvUc+lL3nEmcNAop98oZPFXcbP5zb4ZbtxDxx0U=;
        b=l+EX4JE4OM7HYjleo2SfcUvHwWaBH+OAeqpbouJ81VozKI9/6p31VWPdmIdZ7vd120
         PcMwB48G0zCLAalTW78GWKiqHSWpKHkUbjdxBeseCu+uxxVq1zblZZ3YukJjWr+szHtf
         gPERE4FTugNfj0EUlSu3wfl5IM1Xd73du2A4qo633zGL7vXPh6kE+KoLIJJThtXW/1SR
         LQzjdSXukL5TPeJ5gLm6hspMhs5S9SZWgLN5pHYIBLBkXGJgjHahBXVLNP9u1TPEIDDx
         MYOvSymWD7+nYLLFbMfBbcM1jJhsQfaqOefSrX7NiHlOnIYUUz94s36qOtgMxUogRFdQ
         YxYA==
X-Forwarded-Encrypted: i=1; AHgh+RrHl5vSES4sDELULXVktzDx3a+zNPFz1KeCFewVNDGB+z+nps8Qti0oUOh+oBJwV7DEa/jBDOw0EvSqmN/tlBox@lists.infradead.org
X-Gm-Message-State: AOJu0YyhHNEeEKpKPDsOWhIhonMDPWfUz+vpOLMvjgRuaYKuYN0GqfvQ
	oOfEDt9QlrQdD4dVGDYQxbhT1sskj+vIESBWEy+305GXi9Y8+B4qYw//i9+bebkEFg==
X-Gm-Gg: AR+sD10McYPDxw5fGmS+lEP2wYxwagSOBbftOzKgT+/k7pAvNRDuZ7l2WF5w8/KGJNC
	6yjTKClieHrMm1Sgs9PhgkMEcdXM0Kbk047AIxAhTxZjFIPLjlv10Xrxg2mNOujO0Q5SGFcJEWy
	TRc9AkzzvosuAytgz93vO12PVwMa/zjXD40knyI9KSYkXf0BrrgyH6ZDBrYGGjzjVLE97G59D2C
	/bPr0qDjVDNZN/WHMdTQQ1ZgOqrw+8Lf5vERJDXJ6Qusxu24xQ5ao5V+rCpZKTPt2MtOns7FKZZ
	J+ZD1dtFYQKW/BPqq31FBPT4XNBO58XhZZx3IOdL5SAA72oS0+llml9djfZRPl208OQREqiytfA
	wxQVc0x3ApnnxOqbbCFmHo9dQrIP+Xj4hb9y4VysAtrQJyCZD3Y4GBpcf1tOVDBdG2VvqyqR6kj
	0cJ+nNYFjEm0ZqpG5Z6sHodnig65Ow+M4in5+oWlLv7S1lpIhd2J3Bn9eqw0XKnE2tYev8CeaJd
	zyZaQ8Rh/R/n6AllVJUqTSqCjtYgfjLVTXAmzme7wKaDA==
X-Received: by 2002:a05:6a00:8d1:b0:846:22ea:e171 with SMTP id d2e1a72fcca58-84fa872c289mr2761703b3a.3.1786450851388;
        Tue, 11 Aug 2026 05:20:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/9] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 11 Aug 2026 20:20:04 +0800
Message-ID: <20260811122011.3539250-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052052_242749_CDBD272F 
X-CRM114-Status: GOOD (  19.69  )
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

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.55.0.679.g6767b8d81c-goog


