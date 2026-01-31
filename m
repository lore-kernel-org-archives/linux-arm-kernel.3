Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7304CD73EB5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGPmhqBLmrhjnKRU3GP4xDYGE4lQQrm3+UpM5b+lZCM=; b=T+juoDn2oyVt5hTlInCuv6Gsch
	oOMRNH3p9HjgwQmyVF5OxPVYsv6O49JeszytBksvS58HoTB3FL+MQ9imcZABYoa1nYlCNXTHzxyOl
	UdfHbXpHC2Mla52fl/c4ZLhcFYHsoRXviwH2xRMsoVfeLIm42cq2jhJua8CcksTWSvEooMts8Eo6H
	2RKqF7zOwpIAria2tZ3FP1GjLIQv5feSKVWZQKDiqOd1cGnv/tf9XtG2w2QK9GtvcPyMPqUP5/Ifd
	RXruEaT6LUOZDqmivrlL8FSw96bdwx9HNZlXW/fCXJtRbWusZseQW483TzIUcAlVU8nIQdLS2WnTG
	fGYQgqPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmFia-00000002tUU-0APj;
	Sat, 31 Jan 2026 18:29:12 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmFiV-00000002tU3-1eTj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 18:29:10 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-81df6a302b1so2970368b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 10:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769884146; x=1770488946; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGPmhqBLmrhjnKRU3GP4xDYGE4lQQrm3+UpM5b+lZCM=;
        b=ZysJkyqyEyBaNjF5YAQYu4u4dzMEPHqn92Id/MaqJi4ZA0rmkONGV+QOcgZK+NH0Kd
         P63qKxpvPplJIMNIUUYFt7/UsOR2xf+9lzxSFRLgb4kriLqIElzpz+gZxeNXeQzU7Ms0
         gFt2TlZ8cZV1MbDBNW68PGhr2I/fApPPIxfaySMkB2qBYK+S3JAjRr/6nINEg2u81lxQ
         HxI/1kGTfW7Riw6OOURVCmpkNParqh/d2Yzw3JBTg7KfiF0LTMWIwYI/H12O4vxApwSQ
         k8Z7pztJNfnDf3zFYgw2Ir6a5Pt6qjzHCwqlfpm4LCpiGd1syM6nrB+KsfAyKZ0b7hoC
         0Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769884146; x=1770488946;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGPmhqBLmrhjnKRU3GP4xDYGE4lQQrm3+UpM5b+lZCM=;
        b=aLMjzg4owE22B+4gtlhO0RV8eUH084YSI+Mp5NykmVS24/7UnkpcFubUDAXYbVfVkO
         U2KruWzr2NFfzK3BQH2N62JjnCxXz3zU3h7rf3apzk7ts/DCBNryHP+EA0n6SOWgXT/0
         7mYzL70UroF2xWgJ1eVwGd0f+VuqEdpmxrfQC+R8b3yKf2xKXLtBILLSSU8GtSGz+vEY
         hHw9lhWc60Ri7KgaZuAKHMavdSwZFD8CE4WgQ1EZ3CHrS03WvYKDklVjfYcsSxDHncBV
         AsnN1VifE+s+YZ/Bd1OWQmywsYM3aNLdbfC1LO6vXkSbkj6pfT98yZldgrmjGWtC40nS
         eJAw==
X-Forwarded-Encrypted: i=1; AJvYcCXyW2icSRQ0jHYgZgSEmjVQ7vxs8N866eTrUEmrCHT4mSKxXg6EeODYgOM+0Vn0VlhjyDQI0VTYpMgXSCYbKlhR@lists.infradead.org
X-Gm-Message-State: AOJu0YzqdoAefSPL0AYM5TnEbY17zFZRZBucaOc507nUMmBzoV/vtUxv
	M384KDirP87QQez30dhEGTaO827EqHkrotYCU2XX3npCVm9yhCEfCzQQluH0ZO8V
X-Gm-Gg: AZuq6aLNZJvTbDkLNjF2CDvS+Q7X7p7eMECSUZNGj3To635N0x+OzTDh6tKk375dKbk
	5hVFFzKhjSVVW+TO+zpVBDQqEvUeAsGiD8ABhHroFMbw43bs10SllIl2E5cj/mHnSTRPvj3wz/C
	5WdQCf7Hiwy/NoJXKFVzhPJYTnMMe4wIyGrY3vbM+XPKyh0XKnYdL/p9Vm0w3RAz6JIhr0pHF86
	johrsE+Nr7irp8PuIqTi8H9YRp7EHDpV5Rue5DnM2DWxC4/S7uWnv32ZVChMOdzb4uUzDS8zX68
	87T27pbAOUC6yfK/YtGsiOsaIE0+lSIwOCTpEBCdVDElyw5jJcbWV5ry2RECkKJ6EYUSwbcjgpU
	wuXBOYuZprTTwuC7tgaCOt42CaObJlxybA8+gBgXdePq7VZvH+fWhgmbaqXScn7Wh7eiiUOJlDp
	Tow8ZoXnE=
X-Received: by 2002:a05:6a00:139d:b0:81f:3b74:5812 with SMTP id d2e1a72fcca58-823ab6770fcmr6413801b3a.31.1769884146110;
        Sat, 31 Jan 2026 10:29:06 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c24083sm11433930b3a.55.2026.01.31.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 10:29:05 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 01 Feb 2026 02:29:00 +0800
Subject: [PATCH] i2c: sun6i-p2wi: Fix device node reference leak in
 p2wi_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOtJfmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwND3QKj8kzdRENLy+SUtFQzy1QDJaDSgqLUtMwKsDHRsbW1AJIZ6Cx
 WAAAA
X-Change-ID: 20260201-p2wi-a199cdfe69e0
To: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Wolfram Sang <wsa@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769884141; l=1471;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=2cNAKnSczqFDvan9SEiFwFwLVMyWwTUFffTK66ZOIns=;
 b=yXCZwSuCzXzxPIwefJT/i/DC8MOkG6SO8j6MIGT4Msk92UzkC5uL4vvVgUv/M5Lw9apjSMJvh
 Q4ldLZdPsbsCiD3ZYP0udu9iKzAZUEIv/SV70Nhl5JD+qqF3qZdZuTA
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_102907_437932_45923738 
X-CRM114-Status: GOOD (  14.27  )
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

Use the __free(device_node) scoped variable to automatically release
the device node reference, preventing a device node reference leak.

Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..652b37b57159 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -184,7 +184,6 @@ static int p2wi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
@@ -223,7 +222,8 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
-	childnp = of_get_next_available_child(np, NULL);
+	struct device_node *childnp __free(device_node) =
+		of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
 		if (ret) {

---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260201-p2wi-a199cdfe69e0

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


