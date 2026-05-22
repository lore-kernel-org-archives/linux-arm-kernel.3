Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D50ACD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSCRzF6jccIrpW3KuBs+JWgBL0z6wfFkzmIVCZCEAZo=; b=PJhR/XkZpZf/4iYU5gCDVvD4fc
	s9bdVnhlnVNLlPP7kVRdOLcqFGLWBPovALUoGnI0hwphnoByv1HAmqXAh8HdUB5j5skS/HZkJ3ODX
	WAeHEbB5vtka2eK8/VMOs8buqA96zyFytqU1UJCunsJoSm8oiuPXTSvKly7amD6U0O55aG/6zuNRy
	mK5Rs/eIOWTLRjk+Jq22TARDzrxQ7pv08Kbngql3/ODgMRfqtoISslSzMCOxjYn7JqBMCKQfoM7+0
	Tei/HAHkox22hCCmNxQGG8H2QGY4rzjTVrg3Vzr5UFUXoGPOvKzhTvkjrbXL36ax/B50fA+/tbdfW
	nnlFwARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsT-0000000CARj-2lH9;
	Fri, 22 May 2026 23:02:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsI-0000000CAHq-2Y16
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49048a8ca1bso485775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490909; x=1780095709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSCRzF6jccIrpW3KuBs+JWgBL0z6wfFkzmIVCZCEAZo=;
        b=cFPD4Yh0Diw1U8rJ3wKRATZ5m/fGtpPHXsnMtYxTmyGkK9yL/gHP+BYQZWU8zdJUw6
         00vl3V9XthsDmwJKVM2D3sizSp1l6OZXlGZ4szA01AkTSvJb0PDZwHlDTznhJOqgG2st
         Qa1d2tQJjC4HPgneFGJYNr4s52u0rmf5J2uVz5OgOyrUwDLnUoBrGL69xWEyXYTWEAg0
         S0kJJ1MBMUrXKhlKZl/9jKWyTTJ6lkV3bwyGjBUF2JQanW3SwT95jKAYJzVqe01CldFv
         Z89DYY87Up3ceXL1dnOjJ53aJm9P0N6fR7+6i4AsvAeeOIgo79RBT/o8KrHKNpFrYXMr
         AV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490909; x=1780095709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSCRzF6jccIrpW3KuBs+JWgBL0z6wfFkzmIVCZCEAZo=;
        b=XLyaYTfcQtQ45Q8sAN3Y0rnTJdbcjriTGuZdBDEyPGKq+kG88bdkptZRXBR5CVvGIW
         UV0MTzI5hNDZWzbKfcPx9d7cMflnKd7nM2pW0B0hUDeDd+Pp0lcbsTw/DSxs8i4xacbL
         tVuPP5/6XjNOtzYTFYflk/khByA2yuUAjAwXjKcd6aSAfVJWD25OsWJfrQ/Pqe7xO4T7
         /OuxHwohV/6QL6w0/a1oQKAR3sHxCTJoYpnUun1aCl8/MBVbIiOWidiVw79x6t97fOTE
         ZvWYvRdfNpt+y+soAP9mu2sBDs6C9XJ6HulPqcIv9vxOQe0rEakiPPqj7TRwoop5PprY
         jv1A==
X-Forwarded-Encrypted: i=1; AFNElJ+EjcIW5aDZbqV5vrMdtQV2hTPT5TMd3Mlj+nuD+fyWDs/KctqwGT621hY4aEtOARrBNAYDn6YJi7a9aCysojjr@lists.infradead.org
X-Gm-Message-State: AOJu0YyJOe3zDJHTGbXWr1ouQgqWYs8/0e9IYg+wUycJTCKcmg+4rSZ+
	1QPBkLzwJ8EEp2li50K1o/C0Sb59OgOBn5QEGU+VchY+m6/duyg7oRi6
X-Gm-Gg: Acq92OGOg1mjzdO0g65bHQEKvkK1z7Z2pJX0Css8uO7E5L+8MnDFr1xjYY3UUWBPtdd
	IhEwTWYN5HXKyxSz1rKaV+cnEMiHDy/MQk78PAYsaJbqpwrd27m2/Zg4yRQ14hjF6gg7MGWg7fj
	B3YOhmVbPeyawyQsS0CjP3D800KzxB7MAnN30JZMDwuaQCbB/pYh11B/1XvwoRj73KgXKp+ZUsm
	lvacBAPmid92owKWbAOB3+FswD8/JE/KldtMmVvj3DWupLtL3TJ1gQeDGugw7rgFBrEQfVO8je1
	NfORMpWOrUZ6ctQ8cwxGtBmQk0gw+C03JID6K/cmvE+rcg2QxieOgXqub2BYpBzeUixyIGE/Nvd
	mTQT1iFXDTihA9IREYWgOhSu+VZLOf1O8yisMBDu1caKZOeOgL2VHKnD9t875FfNek9kkpg7eeD
	alN1lg2YjACBi0Rr66cI0bS+42IXB2O0tK71CZCAZO4OuryM6uSDfjHXcADHJ3wYiOrFI12DjvS
	g==
X-Received: by 2002:a05:600c:1f8f:b0:490:3cb8:b853 with SMTP id 5b1f17b1804b1-49042cf87abmr35801335e9.7.1779490908611;
        Fri, 22 May 2026 16:01:48 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:48 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v4 06/12] crypto: atmel-i2c - move client management instance into core
Date: Fri, 22 May 2026 23:01:28 +0000
Message-Id: <20260522230134.32414-7-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160150_689866_F3ACF696 
X-CRM114-Status: GOOD (  16.24  )
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

Move the global 'atmel_i2c_mgmt' tracking instance out of the ECC driver
and into the atmel-i2c core library.

This change consolidates the shared I2C client infrastructure into a
central core driver. This centralization allows both the ECC and
upcoming SHA204A driver modules to access and reference a unified,
common device-management context.

As part of this relocation, replace the explicit runtime initialization
calls inside the module init block with static, compile-time macros
(__SPIN_LOCK_UNLOCKED and LIST_HEAD_INIT). Export the tracking structure
via EXPORT_SYMBOL_GPL() to make it available to dependent sub-modules.

No functional change intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 4 ----
 drivers/crypto/atmel-i2c.c | 6 ++++++
 drivers/crypto/atmel-i2c.h | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index d6ae113c45df..1ae9c52812df 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -28,8 +28,6 @@ static int atmel_ecc_kpp_refcnt;
 DECLARE_COMPLETION(atmel_ecc_unreg_done);
 static bool atmel_ecc_unreg_active;
 
-static struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
-
 /**
  * struct atmel_ecdh_ctx - transformation context
  * @client     : pointer to i2c client device
@@ -458,8 +456,6 @@ static struct i2c_driver atmel_ecc_driver = {
 
 static int __init atmel_ecc_init(void)
 {
-	spin_lock_init(&atmel_i2c_mgmt.i2c_list_lock);
-	INIT_LIST_HEAD(&atmel_i2c_mgmt.i2c_client_list);
 	return i2c_add_driver(&atmel_ecc_driver);
 }
 
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index ff19857894d0..a42b0ea30033 100644
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
index 660ca861b705..82321c35c21f 100644
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
2.39.5


