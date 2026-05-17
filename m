Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BEDCD4F4B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfAxUEr/rxn6pVQC4AetRpAM4gvdUnHJSPOgS01+IHE=; b=dLvYxyw9YqMa8L9wWMAsF8jIjt
	8uJ60T8/G5IsOiBU+2hWDbxGiCThaoQrLJ3zdsTZa9d6NwPMXVRRPU+UphVlHGWfPXIW6EyWqcqKA
	om7di11K3N4Cg2p+Oxf3QJW7IFK/Jp55vGokd31jPwTEiNEMBApQk6zeGECtgP29Ag9Oy8TgTbPQv
	crEIO2icSqCJJooEOXguUSZV641iyVXdpvbbp4cmHsXH5x760Z7dk2lGTOssNGws2vkn6IjvKDOhy
	Pi3vPGvEzAOAouUvxHw+Xwq33r+C3Ju7tZvaYyrAGXutpFx3VEaMcIpHNF/LBsnV/RLe5ybBEVoAP
	1oQmmpEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft9-0000000DAR5-1XZm;
	Sun, 17 May 2026 18:06:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft6-0000000DAOA-0UBQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48e72b02bf6so2319115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041210; x=1779646010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfAxUEr/rxn6pVQC4AetRpAM4gvdUnHJSPOgS01+IHE=;
        b=D896SA2wzcwzDYQ3mXYE+mxJcsJOaX/PflWH9qz25TDAUk241lb0lPDVpxhues3960
         6Gm9wgFLNJklvzN9fGJsmBDM0daIkTSABtjUuGUC4jRKRLu6Z7e5UZmPEER5/TbWqwDA
         e2ECOjdKtFCykQ/Yaw/SFKEDwBY7Nfh/d6qJIZZIjZajHc2/z0KsvzH7VDCwYV4nZcNi
         D0DZHfXujoQQSgQdZcC6kZhILlLuFLVA2Tmz2Kx/SUZc4Tqc/VM7Wj1WQmZS+vK8ssIP
         SI6akkw38TqOBD/X6bbPFH+YvQHAvIrumrK43mVZp7/0tz9n9SZYBe5WAlMF7EsLqRWa
         WY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041210; x=1779646010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfAxUEr/rxn6pVQC4AetRpAM4gvdUnHJSPOgS01+IHE=;
        b=HU6IMCUVHZEb4NSV4YhKRkhIoB6xpqjBPQx8x+tKz2pE7JKrJghwRsx6fSH5lJB4cR
         wi6YU/e7EAKPWNFGpXsSNdjXYdfFgaFksfZwOTrLYP1TzoxKhlSzFew//JmXbXUlosuV
         0lDpE+oJ+9AQqMsUMKnKuJjWyZ3yG/IYL9PO8F5yL+V/aNGik9T2ui/77hlHrnole7Pn
         k3rlc5SsKEDh2YY7KC9aZWj8QuUYrAoQZOrNQAHwmHZRHr+2TnksYyk6zmRVNkrVpJ9T
         0CdZwbpuLF0dzQX6GDzRXAi1HrkK3ew+RnWy9d9MvnlJoeYTkOBb63HK0VK00hRIge/+
         fjJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9x+L2lpFv9yrZBZ+ilRuGGbL9Ew0yIp7qBiC8NBBp4/aJqSzINAYu1MvRYCeulYeuuQL0ZY15+0ipJQbZOb+cG@lists.infradead.org
X-Gm-Message-State: AOJu0YwRR1wjF9KaufaI8Wb9QpCAUjFX/ThS4s9cdI9h633K2+woGy8u
	3ApDZrN/yssC3vHEF6P4C0OKPvOWqunSgjh2W6Z3zPEOHA6/4fTP/lmK
X-Gm-Gg: Acq92OGoTvusfdvbrjgDU2N0rKKLk14m8lvR+8WuWYYtpl33w8mgixGz3qGaiPHr605
	wphyBxDdMnxiF/iKYmDBMDwMWNIEQjo0fTqRanTZqJU/+PfV3P+Rx7AbdqKPUy5IniRtYBtxWVG
	UmV7TM5Q8rjyCdYoLYzoD6X5of2YkooZLVghEvDnOy74ofY+NmTPTBHE445uEbXsjJlxf0XYrZg
	HneJK/1leFwMvQXqt5nv8Xk6Mk5QNj3OVrgzNmwPh/1ib1cgqGod4s05tYntk7KWneHNuMAAw0Y
	CVXWm9qC4arhYyN8kEMm6oZQ3HnNr/GkmAG3fa1egdX11qFAYHGinhSSakQNJCkh+wrBl+W3M7D
	gJWAx1GgX8AKmKZtLzwA23HHwoTJ12DXw7rvLMC958OQbziIRxMbxT7grgOgO78k/tx9Z0InVOu
	fi28S0cAegZGTO10dPpim6UfPBM+dMETEvvs4C2f5plrvyMcok333Jwucbe7oz/hjVEKpR+o4fF
	Q==
X-Received: by 2002:a05:600c:3106:b0:48a:58e1:6cf7 with SMTP id 5b1f17b1804b1-48fe61f2bdamr81852815e9.4.1779041210437;
        Sun, 17 May 2026 11:06:50 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:50 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 03/12] crypto: atmel - move i2c client management instance into core driver
Date: Sun, 17 May 2026 18:06:30 +0000
Message-Id: <20260517180639.9657-5-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110652_167174_AEAB0360 
X-CRM114-Status: GOOD (  13.04  )
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

Move the atmel_i2c client management instance from the ECC driver into the
atmel-i2c core driver.

This is a preparatory step for consolidating shared I2C client tracking
infrastructure in the core, allowing ECC and SHA204A drivers to operate on
a common management instance.

The symbol is exported via EXPORT_SYMBOL_GPL() and declared extern in the
shared header.

No functional change intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 2 --
 drivers/crypto/atmel-i2c.c | 6 ++++++
 drivers/crypto/atmel-i2c.h | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 9feae468b7ff..76fb1d0cf075 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -23,8 +23,6 @@
 #include <crypto/kpp.h>
 #include "atmel-i2c.h"
 
-static struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
-
 /**
  * struct atmel_ecdh_ctx - transformation context
  * @client     : pointer to i2c client device
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 0e275dbdc8c5..db24f65ae90e 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -21,6 +21,12 @@
 #include <linux/workqueue.h>
 #include "atmel-i2c.h"
 
+struct atmel_i2c_client_mgmt atmel_i2c_mgmt = {
+	.i2c_list_lock = __SPIN_LOCK_UNLOCKED(atmel_i2c_mgmt.i2c_list_lock),
+	.i2c_client_list = LIST_HEAD_INIT(atmel_i2c_mgmt.i2c_client_list),
+};
+EXPORT_SYMBOL_GPL(atmel_i2c_mgmt);
+
 static const struct {
 	u8 value;
 	const char *error_text;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 98a79dcae2b6..a3385e8f0dc9 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -119,6 +119,7 @@ struct atmel_i2c_client_mgmt {
 	struct list_head i2c_client_list;
 	spinlock_t i2c_list_lock;
 } ____cacheline_aligned;
+extern struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
 
 /**
  * atmel_i2c_client_priv - i2c_client private data
-- 
2.53.0


