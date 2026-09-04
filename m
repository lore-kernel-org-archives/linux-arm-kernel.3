Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B469C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 05:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s9VeM2Hj9d1CYutblv9K9gniHtTbYGqC7kevoULcpcA=; b=1VQZ1OdTgDYhWkh+05E9KqxXcS
	hTZc3HrPQVXrABTDnMrX3TzOMtJDnjl0XCstXeHcO8Y3WnOHsFPkdZeyaYVSk6UWYKzcSiWBjMqnm
	E6LFlfae9YYZgdV3uvkS/cdkmhWmzsauTx+qORA009zet5Lo+utyFow8fNnz7MaSBiKt5xg/rkI/Q
	9al0ovWdTb0RbkMBesvQRy2mnquHvhJhGucZSSH15El3OXHh/AFzVEvMCy/wBUWQfma6CZeBdVnkq
	muPzT8UwsgbP4ossaDTuX7AmjxIu43IughtU+D02UvQwCFd3WdxMyf9BT4tG75EM4Esies6uSqZNr
	Ao4y6EKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2MVJ-000000014RI-0VUR;
	Fri, 04 Sep 2026 05:30:21 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2MVF-000000014QI-3vrj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 05:30:20 +0000
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BB7D942944
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 05:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788499812;
	bh=s9VeM2Hj9d1CYutblv9K9gniHtTbYGqC7kevoULcpcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=kPoyCHgruozjzrQzIrWZpv6LdfuNlNZSU0XUzk4pBYZgBcPqw8UC+CBAe4PLY9qMD
	 EkTMyLWpXDsYCZhTzISiV6e8GzXoows5Zm87tKGAAxAH1WaYPmTRjr/KMe7aU6XRmj
	 6qhdj1lB2CQ8yTy26DoAL7i+M0o2Y8r3Tt5qJLZ/qsWW88MGs6UwznWNkZqHGUP5ma
	 Asezl2BmluU2GoOIP4EDliBZfB0b3Gn/hz2ulqHEB5+YQJr73u4HTHUIwQrEJBxuFm
	 ONF58gjhY+mX8TSjDZDOkcf2CZCYdB0w6x3dSe765AarVG3WcD9TZKu2/QLO34r/ZK
	 bJBDUKxxKxm8hFq8JErjemUKSFj6bV9T9+BaFKwvgLQ+K91agXVAnSsIE2xC7e6jHJ
	 FEIHT1AwaP9CyO8j0psaaUeSrgkshdzBx2Dh+FEejpB+jHrjL025/0ukVFujva9H2b
	 ByH76eXIVZNJovbt3HXTKEdwrDCyfGelItY9MQELhu84N2MpvEa4ZhOeZk6QZyWa2C
	 b6FV+oB2LRMI+/2gI2dJ5GAhBk126zOErPy/xBR5faSGJIVFoF6MffUubsMtP8yMJ0
	 Clovb7GzJPdurot6TYn4ap60DprVjFKeGXytNmNuMm6HoVHKy/JWpMA4P5TSkWYzGW
	 a9J6jo+sYSlcSfNQwNz2so+g=
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-85599cf98e5so1122640b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 22:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788499811; x=1789104611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9VeM2Hj9d1CYutblv9K9gniHtTbYGqC7kevoULcpcA=;
        b=po0Swq66QYLiw0JMeQZp8nDmb4BOiNkcV7B1q76fMqLtYLfUqi0Mkm9pKT1ZvZ9zlq
         33epWMISYXbt0/wSzuEmfylw8Z34tCst9xhQWquDIzPGmn9p3P0cmkHM6cMmzFVWgUr2
         i3zFpwjUrmAy5ICue0YnuIYSMJKkF67gg1ndt2vH4+36mN2FaOVJaT66tm6BsfS2mFP3
         4iptMQtMCYCSze1OdnWpLRj8bpQjbc8ioEOGKpLmiHYOrrODUCdN0UsH/0P+bRIC9VlF
         cQYrIIAKBjzbJdFYCgikqKs09XtDGGk1cazDf35WquUszphHdZslhY+TRvfgy3iYTbWN
         11kg==
X-Forwarded-Encrypted: i=1; AKwUvBy8vmRlsNTYXtfHevC+mZ8uirorA9oRgV2Nal8gsIdOybSxUJW58hQ7YrApHpdmlWgPp+S6XySLxdlHqO/mLJ5L@lists.infradead.org
X-Gm-Message-State: AFuF++knbQrPGKbBX4oYa03QNXEt5zNUAd+HcUnyh6611p3VhIvu/PYI
	C1u3T8+S4cnjC6imMwbnxidcjDTCjpj1/F3w4jjUho5RD7U3orC78q2udNiNb0yNmn8iNm/GXh0
	e4ymrC2g07RHQgdu88t/I5ccMMM4RN9aH9IYeajefXu4tPOpcDeexFEdWLpXWQBG3a9hffdFL0D
	8Mt8kvohk4EbOeXTKA
X-Gm-Gg: AYBFou1RbHr5ZXE3KLeXdLN8GQoLa9QDknraXTtJ/lY8b1ENkinZopNJk59Xuz7zTzd
	MZQY9H5Xw3ThEQ0RdoCthE0G5wMxGvoUJ0lfE5LJ/uOXA+kK/lQX6fkXzA9Xy7JbuqhEkQ9x3CH
	iuCt862MryHxa8YPYaslRGIt+2N1R/x0yPggs5YZkw3kju34FxJsw6Ryk+JZkdRv2uPs9DepoIz
	1CZUQJZ3po+/iGbGpVrjJ4ERZSy2ylWY7blsX9PZm+FrVMY4lm5Bwl3bUC2371smO8FCYian11u
	08NX6Y6wYEb6lX3sA0cuLjG8ejH3+M0pDR4hGVBW4a9Y52bZ3/o/2y50LLmvL5c3UtZH/MjQjwJ
	1BpbyqPjTenoMS4/ePQnp71qTF+wk+OEIo+6reZMZ
X-Received: by 2002:a05:6a00:8d8d:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-861662d4c0fmr5800152b3a.4.1788499811058;
        Thu, 03 Sep 2026 22:30:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d8d:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-861662d4c0fmr5800075b3a.4.1788499810579;
        Thu, 03 Sep 2026 22:30:10 -0700 (PDT)
Received: from canonical.com (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152d29654sm711385b3a.33.2026.09.03.22.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:30:10 -0700 (PDT)
From: Ivan Hu <ivan.hu@canonical.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	peter.tsao@mediatek.com
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth firmware
Date: Fri,  4 Sep 2026 13:30:07 +0800
Message-ID: <20260904053007.667472-1-ivan.hu@canonical.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_223018_366050_E1EA881E 
X-CRM114-Status: GOOD (  11.90  )
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

btmtk_fw_get_filename() constructs the firmware name at runtime, so for
the MT7920 variant (dev_id 0x7961 with fw_flavor set) it requests
"mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin" without ever declaring it via
MODULE_FIRMWARE(). Tools that select firmware from module metadata (e.g.
"modinfo -F firmware") therefore omit this blob, so request_firmware()
fails and Bluetooth does not initialise on MT7920, even though the file
is present in linux-firmware.

Declare it with MODULE_FIRMWARE(), as the mt76 driver already does for
the corresponding MT7920 wifi firmware.

Fixes: 1cb63d80fff6 ("Bluetooth: btusb: Add support Mediatek MT7920")
Signed-off-by: Ivan Hu <ivan.hu@canonical.com>
---
 drivers/bluetooth/btmtk.c | 1 +
 drivers/bluetooth/btmtk.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index ea0c320f9827..911aba5c134e 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1581,5 +1581,6 @@ MODULE_FIRMWARE(FIRMWARE_MT7663);
 MODULE_FIRMWARE(FIRMWARE_MT7668);
 MODULE_FIRMWARE(FIRMWARE_MT7922);
 MODULE_FIRMWARE(FIRMWARE_MT7961);
+MODULE_FIRMWARE(FIRMWARE_MT7920);
 MODULE_FIRMWARE(FIRMWARE_MT7925);
 MODULE_FIRMWARE(FIRMWARE_MT7927);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index c83c24897c95..bc26148ec544 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -7,6 +7,7 @@
 #define FIRMWARE_MT7922		"mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin"
 #define FIRMWARE_MT7902		"mediatek/BT_RAM_CODE_MT7902_1_1_hdr.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
+#define FIRMWARE_MT7920		"mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin"
 #define FIRMWARE_MT7925		"mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin"
 #define FIRMWARE_MT7927		"mediatek/mt7927/BT_RAM_CODE_MT6639_2_1_hdr.bin"
 
-- 
2.53.0


