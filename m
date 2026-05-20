Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01418CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwQ7nKFRuRlu0LJRik1dF7YG3UyIAH7qsByZKNSFesc=; b=UXC/9PNeBkdOgC2uv94Wn1Q8J2
	mSte8hwG43xUzn0PpqmEfyC76U5gocfBCBMjFR5EAAuFTtkhZ68WAY/TJej+mrV8zTE8Ovm19kV6x
	9RYUWtiXP5ndG/w1K//FSSrGvNIB809L5xD79ASfeVsGoYZLdogqnDNZJX79FJQAVkMM/JUsAxQ+Y
	985fKY4uqffkOsgDknzYfH0HFhCgSrSbgfvgnE9Q00kh2RgPKixf6RfQUYDERRdGodTM0/GRUhg+y
	RMMvHs7OaZo+GMw1BVv9JvS8Ke69FHZSOydhvRk5glW23A5NcIz96+PdJ2YIEC8MKO+bcqhmyDYZa
	QFX/uAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIa-000000055Ql-0vDm;
	Wed, 20 May 2026 15:57:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIS-000000055L0-2nf8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 15:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QwQ7nKFRuRlu0LJRik1dF7YG3UyIAH7qsByZKNSFesc=; b=ApLq45iJQE4KUR7twWL0itDPts
	tQujC/+QcSRo84nyWv7B0vTfo/M8J2ubvHdgNFQvM/BYm0oecLbymnvFG1ohlpiW8QpYKgSY7+6er
	4Q9jtCiTn+Rnfi3Ku67ohRAUXhCUHcuTbMGlb+0T9q0w/7GuxYm4DT1fa3bq7lWsTRrJtD87k3zSN
	WZ9CQMlRTq4Zk+nxNoXUAYRQmAslB4FzMD4jev8nluXZ6ixS5h2O8kRx7xREyNh7zl97ZlHxYftVR
	WeTwdPBohsdaQlpB/X4qfILbFYxtzBxdj5DKSqj1yMeZfrZhaOK+jYq7NWAHqUyMsh1sJ2+AzayNE
	X2/p2KbA==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIM-0000000HIsr-41lq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48fe6629235so4597255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292638; x=1779897438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwQ7nKFRuRlu0LJRik1dF7YG3UyIAH7qsByZKNSFesc=;
        b=H3+LlhMivFtFgxmpFHfSmwKIw0kHvRst/YBteiqHBpUF7Dh3pVkkmda99pJJCK7RTY
         XtUe7BUTV49KVketKh2QcG3210XxXhWbK2OxSHeHmRqLSh+vDnxVP2oKibgwWklcZUUd
         0hyZeUoOOseIHyyMVNhWp5cjo4XXOLFl50PJtoREynRKqA6PZ74OFS29J5zu6ZRi2NRn
         aK99uadxmGA+zbbWCGqXf/ruB2gcc5YmKfru37C9eSOdHdIddA2CMU8a8TKliRiBOD0Q
         SZGblK5gRk/V8reNCDGvZVLZvML8qsdH+9+vyQTDnzxGJakGEmr4+spPddOx+H7yTIal
         loPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292638; x=1779897438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwQ7nKFRuRlu0LJRik1dF7YG3UyIAH7qsByZKNSFesc=;
        b=J6PJHmmASSP6co/aXKVWdNrfEWWQvbgl0K/Lj+yq5d1BQEV+D/NBUPeg9vxOFz/jIx
         /DyVXNa2ybplBeQN8ZRHWHmb0UUwgveyEukDseBs3Mo6JxrjPIOpJcrc2ris61d1aT0m
         RY+lKb8N2jAoR4ksYP35O1/D0yYAz3TYQf+dAybI9gbXo4DfkCjCJ2CG98S9DnM1r5ch
         ATe+cAHO/4m7+fjLtB0GKjwQ2sYhMZndvdLahyyd3/nek3j/mCAL/Fik1Ci1rk5ZdEpJ
         pf3A82ZGZeEbaWbadBd7opp+f8JUeAxA54ERrOdOTtzyF2H/6R4TGW5A/6iqgFNHbNFR
         uW9w==
X-Forwarded-Encrypted: i=1; AFNElJ/a21whFC3PvCireRjkb7Erf9EEb6gATknoksUzKqez8/9MOYqhTCoh/0fnggm1rQ51TWG8v2W3x9qcogxKEQmW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4JYzeFn0xXGSjW315xBTX6yaTAqAgkcawAcJ52Sq7QQnYTM/b
	O+HfCHVa9dEUhRwskF5A4p5XopxxrLRYm8K8ZMKFvQ+uM99QgOduPGVe
X-Gm-Gg: Acq92OG0WgEe3B38Mi3Tzok/iUZoWQovhFmhM+nse9M9C1L9mj891UeLFIsUDKQlN5T
	dOe9jEchpogrj69WdmqYVP61nGjYDj/pbxi8B9yXU+l9+Sqq2pJwz567u4DD9WK4OSTzcFQeeSP
	AWYOMvZD8cxP8QZjxBOgFBzmDxJgh1XJuwB3PFqeJlWu08IK4HgqoizQa4LVvLlE4sHuQvTZcJR
	YCQUx8cw8PZk1GA26l67yuDqqHtXxRMoWo9/QPcJKzRZ6Fb2NsDABdbeZtUyhHYGBj4vTRY97QF
	Z+lPIGH8RkmMVVgjZaPbfdrOWn31UbRrDVVBwUbrW+5oUuQZq+41OjU4pQdNFY9d+wdfpST2ihp
	21Cm6Hge23QHIkC8QsUC061lose/FfrKijYSCW4y7OprPBttJQZdW/IRcuQTSEoL7undriBoF8H
	e56EIVmatGoLgMiPBHmtNQengGS7Hmbcq3gf2aMixH+MpRaR2+2oaoQUpD43H6tjM=
X-Received: by 2002:a05:600c:1f8c:b0:488:abe9:86 with SMTP id 5b1f17b1804b1-48fe631817cmr186005145e9.7.1779292637515;
        Wed, 20 May 2026 08:57:17 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:17 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 05/12] crypto: atmel-i2c - move client management instance into core
Date: Wed, 20 May 2026 15:56:56 +0000
Message-Id: <20260520155703.23018-6-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_165720_021947_4FFD279B 
X-CRM114-Status: GOOD (  16.64  )
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
index b06d47babd2e..cf6abc94d6c9 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -26,8 +26,6 @@
 static DEFINE_MUTEX(atmel_ecc_kpp_lock);
 static int atmel_ecc_kpp_refcnt;
 
-static struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
-
 /**
  * struct atmel_ecdh_ctx - transformation context
  * @client     : pointer to i2c client device
@@ -408,8 +406,6 @@ static struct i2c_driver atmel_ecc_driver = {
 
 static int __init atmel_ecc_init(void)
 {
-	spin_lock_init(&atmel_i2c_mgmt.i2c_list_lock);
-	INIT_LIST_HEAD(&atmel_i2c_mgmt.i2c_client_list);
 	return i2c_add_driver(&atmel_ecc_driver);
 }
 
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
index 30ed816814af..d54bd836e0f5 100644
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


