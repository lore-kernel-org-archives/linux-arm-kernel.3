Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852DBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=; b=r4Nj1kZIkxtj59sTooU13JBJYW
	iXAyNxT3jR1df/fHjcwkEkljgGMyX0Lzilqmc/lmhSQQsMwmbTNPOqTNdSHITUb5LshKXPaPGWnce
	b0wCB1edgIGa2hvDACdaktLLV1u4oJEPHaMbDr0KQmYe5c+gm4G16cEItHYDiVjzDKGdSenyzTrti
	iihQxcs04vTNfu/fcaSkkDGSzNZj49J2c/2Jv5Ta8hAA7RyqLi1YFypFnLDuhrwhObsKIndh7l1/5
	jUjtvICqCeP7RZ4990Npq41AuGEkVRemkiZ1FytDEAaYIslOG7Fymcu7NnbgERi3EUlnos0XsJmGt
	G63SRhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVI-00000006riS-3wJU;
	Fri, 03 Jul 2026 11:56:20 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVG-00000006rfG-1mVG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:19 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-845f2909cd4so318229b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079777; x=1783684577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=;
        b=WrQHosPwIyfZD4Jv/iDebZM049BGmT/xQUJPEuBh/4PNU4LIx5OEAImX0Ktx56HxUQ
         VDScs0ElKwbewH7OTwoZIJnkFSC9Twi+1z50nEm9GZZy/talfYXdPTeBT3qiKI2ZPkUy
         AL9lnC5IqvR3oxJ1OW4WUvU+v12Wtjn1dmuZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079777; x=1783684577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=;
        b=B4RhWLWUzuNUDPfYKNyNZl1rW97NBVFFe3ckjPpOdP76GjZFiYqxtkhmVst6HsX0rp
         M0wO0qYLTEKeen+6tU7NpEAlbCcnfoAWDZv62GEcVvbqgyi4uP4+/MCBISxwdUXbBuU1
         QbrFWgjPe+As6rbRPwjpNJWyyzDhDS/WTDRQwJPA5nqVaL8TIKZeR4JQKDGyBMZVBgsA
         UtjZIas7/kicREiWz0GyGCCzXfXTW6T1Qttq0Cg0W9C6SgsEVzYMnUgNqY4j1yMu6uWm
         iVMDzHLkmeSHXkkhzJbYtxFwLaI6mBHyBnV2xzeSEXsyzLAjyd4LuA5QFqD4prJkaOPt
         EgLw==
X-Forwarded-Encrypted: i=1; AFNElJ8z0Pbr8QlT+FKG+aemYjwbCWJhLNCDo4GP0k34qFyS7mggedD706Vv9yo/QZOQ0xExmjuo3JcsN4w0A7u5dUmx@lists.infradead.org
X-Gm-Message-State: AOJu0YxSX1hJig0+X3VssovCs4fRyYJ9zJtxDR8s7i4PEnRkFE+tcFvN
	HJ1JnJHzcXCtEZyeuA5JriKuUZRylbxJl4oVQLeALcSr7uWekJJ+w/6GQONgmnUkNg==
X-Gm-Gg: AfdE7cnD8IrhWyWUm0hGMGYHJD4WxoJyKACVrQZHPS+Z58oBb6pJj/yrBggNKhvqHBd
	Ei2uAWgchF6CWXHkghtp4NSH2hLRv1zG4Nd+SgWI3lAM4lmCW/9ZI82uO8OzhT8biLKXyva0WMx
	+cc69IrX4JS5Ui2JlqqFYqz0sxV3YLcPSur8uJm6dJl2+x9Dz0XBW9EzqyFg+ZIXjFj2c7blFfy
	qVf+wrIiqLXfeXWKaK4St4ihZB+eFVdMPU273t/tN4E9+57xZ3AKcQB3lutc43i7PIBhpcS5lHP
	3OjWd8gRxwUcL2AJtqkw/MjrgcJyLd6JTtEBpzjxmmbr6KwpTRinWxbb0guxUUxA3CIkhgXTl3y
	h1buhgTP9L19QwEYhLoEVJHsdxXCH6k8JkTEUunxWwrFIbnIw6I/EA3sz15gWv5AQwUC3M45xoV
	+uLTUwD+JzavKfhF6zCYV6WELs3x8ql7kt6SKNut/FXYSiC+UpI3Ka7lKWOKoqBBn2J0EhmipiG
	LMqsKlM
X-Received: by 2002:a05:6a00:6ca7:b0:845:388b:56f with SMTP id d2e1a72fcca58-847c08956ebmr10321332b3a.40.1783079777502;
        Fri, 03 Jul 2026 04:56:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: [PATCH v2 2/7] HID: i2c-hid-of: skip post-power-on delay if already powered on
Date: Fri,  3 Jul 2026 19:55:55 +0800
Message-ID: <20260703115601.1323491-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045618_496708_729E929F 
X-CRM114-Status: GOOD (  19.40  )
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

Instead, check if the regulator supplies are all enabled, and skip
the post-power-on delay if that is the case.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..70afdfb207ac 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string_choices.h>
 
 #include "i2c-hid.h"
 
@@ -46,8 +47,12 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 {
 	struct i2c_hid_of *ihid_of = container_of(ops, struct i2c_hid_of, ops);
 	struct device *dev = &ihid_of->client->dev;
+	bool supply_was_enabled = true;
 	int ret;
 
+	for (unsigned int i = 0; i < ARRAY_SIZE(ihid_of->supplies); i++)
+		supply_was_enabled &= regulator_is_enabled(ihid_of->supplies[i].consumer);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
 				    ihid_of->supplies);
 	if (ret) {
@@ -55,7 +60,8 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
+	dev_dbg(dev, "supply was %s.\n", str_on_off(supply_was_enabled));
+	if (!supply_was_enabled && ihid_of->post_power_delay_ms)
 		msleep(ihid_of->post_power_delay_ms);
 
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


