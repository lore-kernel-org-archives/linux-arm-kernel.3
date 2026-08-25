Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8D5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 04:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=; b=W2UZVGvCitS+pqzPskpn0TH4kr
	3SKXVk1SlCsWw8Qtc6fcvr7AxwVO41vTe/xEh/rEZppSYoAMROkF5LACmJMNo91HjRxw5KZawaP5p
	Z2Tbwo6X8ccTxGKj4NiOZJuO7BAFQRa6lV+zcxYLmQX+BhuVkE51kW7hh8fUzEeri/hlrc7zx7Aew
	t9QDIjHcKAzU/TUqNi0aZBCftQOriWDHU6qy7GOpCrSoiOoA4YdVDvflwkjbwz0UOqlSkYHoX4k8C
	n1TL6CKiB6NxJjiyt2vjkOj0bIozDQ8lrNJ/g+8uzrAtklyEkhSyL2v+FnMRuCxSOYOPsZrziodhs
	TL5CccMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirD-000000008Ld-15bB;
	Tue, 25 Aug 2026 04:33:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyir1-000000008CL-0LEF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so393329a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 21:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632422; x=1788237222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=;
        b=ktm4MsVdGwRXIOwTw0CLzjaheURLGEkqddR8kQ49S4Lj1HKQxd6bS2P4fS1xNq0krv
         UR3hN4rFGVsIM0FUp1GvwhaiyHowz8VZ7BhkhaXjAhzFiD/8KQo/GrYYfdjkkolnxEJ0
         ylBt/XGxiSHz3lkw11Pjx6qkpP4iAoCk4qXu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632422; x=1788237222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=;
        b=O1vzWsN9aHb2hbbU8joX9QmpaGIVa1ErqvnCgyGGRAgZSSYtSNEhPVVyGaVjoN9GCx
         gYBwGOEr84geqZt764bYdA4wfiyP+TlY8MLNeRd5zz4CvE8R1PmKEV+ftPe5jS22CRiN
         3sfX5iu+yfarkZe3qc/XOxGUFY4U/e4bAdwN4SXNA/V1TyREUpSH+gYnLhHJwahBfMee
         gI9l5NWZXEW31TmSrGFFWhv8CMgQgp81KnffipoZutdPUjkwfOIUA9xkb6RCUN6QoFyW
         nECHIFat8xf480juzCrV93FLl1SQR+2IwpzwzYQutw3AtU8jgxMNEqMESJNWlLQqmIfQ
         UVXA==
X-Forwarded-Encrypted: i=1; AHgh+RprR6NxW/mrONckth9FyBEoOm6vaShcVBKV6EELBy66/2HppDfDqBaKdVU3NIgrFrWC/MfB254Unzww8XinT2Ox@lists.infradead.org
X-Gm-Message-State: AFuF++nmTC1mbb2ojr4z+lXaNSe8q7d69ucFZqIiDIj6BMZGhvhnjahX
	I20Sjaw42jwM1eT9bwJXdA1XXKfCgdDBva92oGY3PQm3FSEzVba3HkUAc2A/ZkRwKA==
X-Gm-Gg: AR+sD126zbKTtajmOFNjNWmUwfD/tK75LlTL+yv1EHXop2JXm4OrLsmdI2j+OcYhfCe
	sH9ZQYszIHRpZe3aGI9uyBGnxv0skdGvSYJZFg6aj9Nh9qyZGzYSZEhStt0pCE/dXrk6bikbbmf
	IKnG/trBsiVcqHn9p1yvy9lqI43xjYMOyJHc5hTE5Rw6lD85QcNM2dTvcnj/EBTCjTz9iA3RtRK
	BhEcwObIAGkvyzIeQJkeVgd+KoALQMdg93v/+9pxv6zSUkvFO5Z+wk0jrs74Z5zb8S7kKZAyzgR
	dGPHLV5PPXi2GUENY4CwcF56F2McGvdiKc1j+cf202avnblIWgKgzz0IuVh8mxbHcCCM2zSMLic
	SrTNmSCJQdg6f6hJreCDefk2PEqtqmXF+ogQk30gbtKELXd5ZLLchesk3ddWb9wwIXI4IQnNVah
	ncjRcJTrXHnquSDxHSAvEsn263MHITM7E6Dl9PjG7XaMVMkmKVMdIjt/QD9ucc5i/rHKSH5K63L
	tvoaq7xcJlPuBB6jrOAmt+dT2GmIisz2QD4o3C4L6LgsS4IE+9QpCU0nw==
X-Received: by 2002:a17:90b:164e:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-395c352fa60mr48644179a91.9.1787632422068;
        Mon, 24 Aug 2026 21:33:42 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/7] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 25 Aug 2026 12:16:21 +0800
Message-ID: <20260825041628.988369-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213343_583743_8D941244 
X-CRM114-Status: GOOD (  19.44  )
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
2.55.0.860.g4b6b3295ed-goog


