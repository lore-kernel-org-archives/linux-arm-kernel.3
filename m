Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B393C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=; b=f4Gq37EZWaRiMuKD0ATPTEjUmN
	EUzZ3yHUZS2p/ghxemb2u6I8bEI3J1r8Sazl37n4wRQ/Dt6cI8vh8taq9lrHrtbADoGQrpqkinEas
	Ro3XynAkivvqfk+sU9xocoKRSGc1LHo25hu+ltsI6VZ4aHMqyyQqmeX+y4OzCk4DyOUiMxJz0kJ9R
	HCiJB0/ldIbehTLHnLtMNhC6/RjOkwgGEBczA6r8dIcosTaA0raZsnM4rWVS1sY+3GUiGbXtn/GC5
	FdxqWb1EC7M438Gt0l2y4nEo8U1cPydPC5yZgjccZSzcW6+ymga9li0VhVkvlA/xwhSx1ZvsTyuQY
	wvxIqwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JC-00000008i90-446Y;
	Tue, 21 Jul 2026 07:54:34 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ix-00000008hsa-3bKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:21 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3811f512167so10749146a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620459; x=1785225259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=;
        b=V5hwaXfHf9L1EeVYk70KYSG3Xr9NDOw+dXSQNSU4E7GxmUS+6n4XOoHi10BmDlxA4k
         r6X9BBzjM4RqRK4uHPNYcLX/UwXzUB5ohQd+AkOkNtmo8XI46cdicwCtsHsDtoY8W7kF
         OU1QYS4JstHE/EB+EPAww66/rKOA0YAD60TVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620459; x=1785225259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=;
        b=roOVqroCRFT0AfaGWGKntplusO9ZVCsVyk9SDK8UXvD5kSYyZD0KyWh4EGBgYnhqqY
         apQTXfNASod19qZyESi1S64lVvYDLy4+gPRVezr3OeyYm74ailPlIIQTs+yqVNej5don
         5SAqSjT/h7SWB0HvGcHx9fxl0dbbKUmpgix81S9e00LyJQ70rkIsY/rH8mcj9Yg8PI72
         BcO+gCfGjUYvAYpfCNgLtCrN9Y2GKvWPTKxmx45seTlnIlBToDY9MfxAOQxqTlR6j08X
         liGijfbnzduJi9bWSqN9hvqplSgH2kd1mM/3dpXneNnw0Dx/PngFZ9rQOnrpdzPWHU17
         DCDg==
X-Forwarded-Encrypted: i=1; AHgh+RrdxTjURRMI7Bn4YK+xu2Op7Su/GtnTLTiiprDyBDuchOebnUMuFic7FMgXxMZAjj9Guk2gSyNvY9uXit4DF9gi@lists.infradead.org
X-Gm-Message-State: AOJu0YyibVPJ9F91H+hg2JU3IkATvmDrHYhedIvBYQv2pio8gCcSh8CS
	iqA8tHaZ8e+LMec9mLNOyHUp5OZkPSg25ydY2vI1RKDo3VKQ2Alee6q7Nnc/Z/Qe+w==
X-Gm-Gg: AR+sD12r9lNRdLr4VmkTJH0Y3twZ9b5KshqYLrqa6ptw6tD+GkVIRMQUVGzvQ1/VFyr
	nTvWao+ifuUCJt5pBxm94wiRXIGDDPI+UWQR1fGYpeZ6w/VcAvqoedhmgz9Rc6osIJOCWCA8bVH
	XIqCzrvriJjm8kz/ubi3InWvmyoaK1K+ZaUQWsJ7kAPMqJuiQEvMbsemuBj2kWG7SQ83wGDVriI
	0KTwN9bJTSIsaR4v9h8/XAJQP1P15LWW2OO0P2cYrnzhrMBvOurNr4hN1w+yNBO38iqftS4zyxC
	0U9SYh2isqOOse3S22I8mngbG+H8wM7pD9keft4Hdvk9pRfL9i2gNaOIwlUXW4lGgjokp6YcI/A
	uXEVZ5vwCLe4fhFngB882kdYWOy8sEvhICyRttDSHOPfG8gH1v0Q6I60AkXDgnKWLaf6WXOEjZE
	R7h5D/UbCX/DfWXF3ILXXQ4PJeb0Dj1FCOReGbSSWf3HoNo5QY9ByObSaK0Zw=
X-Received: by 2002:a17:903:1ae7:b0:2c0:e5ee:f554 with SMTP id d9443c01a7336-2cf34895672mr185287855ad.8.1784620458954;
        Tue, 21 Jul 2026 00:54:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 21 Jul 2026 15:52:19 +0800
Message-ID: <20260721075226.2347933-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005419_908522_6885D08E 
X-CRM114-Status: GOOD (  18.47  )
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog


