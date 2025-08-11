Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D94BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A86eQzX7viGNjFU7NpXeyNyVEzQ5puYbkA22fGhwrf8=; b=fhRnkflq8yoNfDQN5ZfqiGdk+W
	zv2DW3LXhortbwwz9KHS9GX7A5Os4WITxRmiPvyYwosPRRJ6uKVckH6tM0QuALsFgpZBjNamd5V/G
	1Ii5Vyid3FvhzFJ3+RLIF1jnVmCM5pbeGYGmi9NIXPrO98QPC7fXJ0sODQaTZ3hDqN8u2i+RYVkGJ
	VSA4NsGCRcgGzn3tQV04bTt45qhyI0003+OeUBQaEsyVn9RIu8ZjTKJNVkDvNBde0zw0EA3m0LjVE
	JHryqpFt7pixRdPBX9B6vvZmvbirdpqRy5TV5pTgkcETY3eC997myg+0MTBDjaYbvONz5tHq44quw
	SRQRL01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uladC-00000009DbD-2NwS;
	Mon, 11 Aug 2025 22:04:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYX2-00000008yOg-44e4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 19:50:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b783d851e6so4035957f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754941807; x=1755546607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A86eQzX7viGNjFU7NpXeyNyVEzQ5puYbkA22fGhwrf8=;
        b=maj7ac1CExAh9Hqm1gp4+zgZdz/gCZKA1JShlYuomL+7G4ra6n+E5XPN6WGQWuhlMH
         Io2xNFwPY6Cu2y6GCaKUO/o14q8QTDBivIopcbrMnjHSJD8jDGiXOVUB0+mRk8UKaXSf
         wjetmCYA9CvXN69T5egNlnTaO6+eobBuCvJEOCFZuteebJVv+p2ZiFNzuDF9yKYoGL5e
         /3RitLjBxOw3EgxxVdUhBF5dVkcnttrY8Jd5rdH2/7TH/CG2O/BzVLf9CfLaLUUYDsXk
         XuQ2O9L427F/pfNx2+HtwglHtTW36036eqGhwTDdTTDnCKCp2+josXExm88buxntX7Ho
         Qx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754941807; x=1755546607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A86eQzX7viGNjFU7NpXeyNyVEzQ5puYbkA22fGhwrf8=;
        b=BSpEOheGt4UZUggScDtcVW7bDq/SgAudfu59zVqIplHBfgWUhI7ZLy0T9yk8yZ96Sb
         id+ULlTI/nNYFnDZqfciV+drSEoRM9GKasBjF0TXFhky19NZo9mJ6yH0F+g76SRdMl6Y
         GTH4wsgrsFbdnEmYmmqmYzHtE2Z1+PiI1mOBN65Zdu1IpGN8WzH7lphZ4lkRd2onK+gT
         9nUvt31XqLeEbvYT2pFIGZm9MZkklvSLXrXAPqEYmC6UhroZT8uQ4805iW/qHW/+KYum
         NgQtbNfZaJFVupGLOLo7ATXuRTyoc9MAROBuDbfLpejdm7pO1Q1Np1Rvz4+5n0/zniXK
         5uYg==
X-Forwarded-Encrypted: i=1; AJvYcCU/7i9tlh3EVR48ZDTS/DVq9HC2Cyrj729OQ0FQ6NyiJV+voUYfPQPrkF1hIgjaO531MZnT69l4O7d+w1ry4vZn@lists.infradead.org
X-Gm-Message-State: AOJu0YxLVrHDJ62JIfDw/t1NRJQotU7qzmSpsc+WGYvta+YKko5CNU3G
	5n7i/YInJ+lG8bpOxq1i5gDpd2kPhoSwXzPZiKTEBVNjbiUAS0D0Af8W
X-Gm-Gg: ASbGncs9c0GpNo4y8AO7p+3D/VPkGkKY4K+XfWcmrUhH9LngLD2B0ueeTyJ/K1R804d
	kT8f1q2v44jUpocMsGhVi2M969YrrcKm0CQ2fmdtq8ZgL8ka/sDpGfCNbFCwciIJPgeSoJ1h7Mb
	1ZPXJZOxfZ8EJ0b5hguyIEhC5p0xmytVdSBX3STvNvw8rHD61qLJHQSdajsBUL78PfjZGTD+vrj
	6lennqGp8yN4cng5i/6LIs9rj/Gy1u08f79Anl7OZIpI3M1kjznD89i2s0WhYyjN/x+KiIcnHdg
	KrhZ0L4VdjAkfWX2OvMYV8NzJ4GAlH2kPpMZsqBD1CguCAWu9hkgd3S71r6OQMGfzZe0zfZbvHH
	vY2uyxKERfQpIweqahMp1EyujDHFC1yhntkYxkjVcnfbFXsc39X0=
X-Google-Smtp-Source: AGHT+IFvzbFGti/zNFzqyikNiwvAvCk3OD9a3dG0vzUTIRLJMIn1arvJwDoou4hVVuywAjgs4uvv6w==
X-Received: by 2002:a05:6000:2287:b0:3b8:f2f1:728c with SMTP id ffacd0b85a97d-3b900b74b3dmr11151929f8f.34.1754941807310;
        Mon, 11 Aug 2025 12:50:07 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm41709246f8f.22.2025.08.11.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:50:06 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 11 Aug 2025 21:49:55 +0200
Subject: [PATCH v2 1/3] i2c: add init_recovery() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Imre Kaloz <kaloz@openwrt.org>, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_125009_013954_E1191EB1 
X-CRM114-Status: GOOD (  22.21  )
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

Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
and modify the i2c_init_recovery() function to call that if specified
instead of the generic i2c_gpio_init_recovery() function.

This allows controller drivers to skip calling the generic code by
implementing a dummy callback function, or alternatively to run a
fine tuned custom implementation.

This is needed for the 'i2c-pxa' driver in order to be able to fix
a long standing bug for which the fix will be implemented in a
followup patch.

Cc: stable@vger.kernel.org # 6.3+
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add 'Reviewed-by' tag from Linus Walleij
  - rebase on tip of i2c/for-current
---
 drivers/i2c/i2c-core-base.c | 8 +++++++-
 include/linux/i2c.h         | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ecca8c006b020379fb53293b20ab09ba25314609..e38be81dbcc17dd15947a189fd3b89def8529d1e 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -427,12 +427,18 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	bool is_error_level = true;
 	char *err_str;
+	int ret;
 
 	if (!bri)
 		return 0;
 
-	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
+	if (bri->init_recovery) {
+		ret = bri->init_recovery(adap);
+		if (ret)
+			return ret;
+	} else if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
+	}
 
 	if (!bri->recover_bus) {
 		err_str = "no suitable method provided";
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..4cefdd4c730fc9dc4655f6581f3dea64435d7124 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -636,6 +636,9 @@ struct i2c_timings {
  *	for generic GPIO recovery.
  * @get_bus_free: Returns the bus free state as seen from the IP core in case it
  *	has a more complex internal logic than just reading SDA. Optional.
+ * @init_recovery: If specified, it will be called instead of the generic GPIO
+ *	recovery initialization code. Platform may use a dummy callback to skip
+ *	calling the generic code, or it may use a custom implementation.
  * @prepare_recovery: This will be called before starting recovery. Platform may
  *	configure padmux here for SDA/SCL line or something else they want.
  * @unprepare_recovery: This will be called after completing recovery. Platform
@@ -660,6 +663,7 @@ struct i2c_bus_recovery_info {
 	void (*set_sda)(struct i2c_adapter *adap, int val);
 	int (*get_bus_free)(struct i2c_adapter *adap);
 
+	int (*init_recovery)(struct i2c_adapter *adap);
 	void (*prepare_recovery)(struct i2c_adapter *adap);
 	void (*unprepare_recovery)(struct i2c_adapter *adap);
 

-- 
2.50.1


