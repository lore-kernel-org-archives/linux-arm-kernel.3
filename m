Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF37ACD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2MBEXVQCUICFyYJC+vk71e18yKEtxbyVZMMqmm+Rw4=; b=bZAHJx1dP2dwBWRiYVmnmoCpby
	ZJv8fDyTyKqEDFnUNZFuYp/7g/84lYHXLUOPX8siNZIh2eRN6ZEuF+QQ+lu3ybNbhoQTlwYqkJRcv
	WWaJEtS0W1b9im8cg76XcLuxO5/WR32TZ9RMk3E+qFeSBBRlqYiHrfCtDRd4m9St0GzS+Z3FK8W5K
	DlUAB1TBMXQDJvmQyyQkctSwkCwxF1xaaPy0oepQ1QYPYCbXDJgYW03Llj0KFQCPANdvAtI/sC1O5
	nfIVKuqeqEHCIvmHHSvQyqFe8Upru1WHF6wqkwBQ389wA+bRXSRqzCwUKeWIEnCzLfeZCXJJ8kMtC
	QMvCOFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMe-00000002lNQ-1otj;
	Tue, 19 May 2026 20:48:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMN-00000002l9u-0HjM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-44c44af71f8so494192f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223693; x=1779828493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2MBEXVQCUICFyYJC+vk71e18yKEtxbyVZMMqmm+Rw4=;
        b=mi89dPkOon/QhZ+sWNB/lWfZdwfRSrrrhJZU32PPF0pU3qU4GyP8a1U5iyKNsb8g0V
         Fvzu3dbcrIDwH46aAZgURpsiPXolQ6tDA7WWRpfKgSmoZNRpQDmDGkSVYRXckfB2LHwO
         oFviTSdYK6xng5v51xCfeAC2janNBeYWh/LW4iukdjE3yGNui06Ix1MQP0NTyL6j/UsQ
         wlr6c+lwZ4bCWA9zWUwp6aqHd75W9RNmU5s/POItUyZXmsWh3jRUn1MGuhza3VNcnxY4
         9QJsRlGICqB2ZjKu+7ejmz5njzBTEmycOqYwX+2ocwf60+/hambapk4buYMfqo1QU7LI
         akHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223693; x=1779828493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P2MBEXVQCUICFyYJC+vk71e18yKEtxbyVZMMqmm+Rw4=;
        b=lXBrXDfe+w6um/vqgq84N7EfztJeR9Fw4IKaPlUCs6tJm+fBmMS495iAVpWOVDxWfy
         Fxt5TWYAzYfLsee0bICRzQT0eoGUpXXSovrVmDmuVgeQMU6xAbKl6sHWHCy2agY+YRr8
         6Y4aRWSdJhSn/ZgTrhi9+qE5YBaVNK4rrPZPGwOud6vumF1p/ATjPclXtz8APh458DHi
         cLI7CVXg0GRKJBRyS97GWRNhWJqbEQ95mD1ZT9VyTdZ+dd+uFtuTqSPbUlby2YgtvQT1
         eHOKYe14RFjd3fVQ8dIS1lyqE8OUht1KZhCrN3xyacaAEJE4gK4bnl/Wt3rNHIsWTVtB
         x0og==
X-Forwarded-Encrypted: i=1; AFNElJ+l84nCW4aXJTh/ijDHCYRZUGBlRK6SPtJPRcCiKEZLOePLowgEM9nBph7qPYix+2ciTV4xi69l/lpUj1xIk5Zv@lists.infradead.org
X-Gm-Message-State: AOJu0YwsnKUIUWS+PFNLNnkmOupjMReZdjQc3M80fvVHBH+iynxCpaHC
	6eDVjJXTGOMU/RAiMJYH4UwWzjAGJSkVQyS+OYtbxcadUWC7O7HA9MAg
X-Gm-Gg: Acq92OGUe11kB5aczhf4crqAjTKsLlQks7fwrHo6St8W7n443pWpmnmoUW5qG4S00Pf
	6A90Ri3Z+uUfwdfAG5XfycAu7jeVY+cKppa5vWm8YDgZwjSlMp63igLFuOr5LXmJQ/5j6JyS4kk
	c++bX7/eIV2/cjV/q1vXO9ZREVw2LtC0M/V4Yf+d6PvmjoKxRHDXqkgRKtttrpu4drUfMMm5gCR
	JnSaZ3mGnUJ8j0WKgffBE/UC3ziarFDy7FRlYQ0EAxW4Q50W7F2BPgpTP9M9eMsl6Qad5HzISse
	sLMgNs6ECQvpyy9EuImjMRRPZIc5QlLba8pwvEvdq7ddROpx20048F/nWEBxEM0Da+aCOGljevB
	uMNKGNCASbwhsHjUrjZM/pKKF7gfgEgUbXkMtV/0nSeFl+5uaZdKjayTAic9OkWawVulpIL6Bb5
	OuatteLTPtFN99UzUzVheDpTVq13s5HvwnmZmSjYA4eoxM0L3cv0Ta3PqUAB6+7A4=
X-Received: by 2002:a05:600c:3594:b0:490:502:8422 with SMTP id 5b1f17b1804b1-4900d55ec74mr79065995e9.6.1779223693208;
        Tue, 19 May 2026 13:48:13 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:12 -0700 (PDT)
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
Subject: [PATCH v2 04/12] crypto: atmel - rename atmel_ecc_driver_data to atmel_i2c_client_mgmt
Date: Tue, 19 May 2026 20:47:55 +0000
Message-Id: <20260519204803.17034-5-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134815_123760_71C9A9E1 
X-CRM114-Status: GOOD (  13.31  )
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

Rename struct atmel_ecc_driver_data to atmel_i2c_client_mgmt to reflect its
generic role in shared I2C client tracking and locking. A subsequent change
will move the client management infrastructure into the atmel-i2c core
driver.

No functional changes intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 2 +-
 drivers/crypto/atmel-i2c.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index e5dd166fd785..aa2dde99b2b1 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -26,7 +26,7 @@
 static DEFINE_MUTEX(atmel_ecc_kpp_lock);
 static int atmel_ecc_kpp_refcnt;
 
-static struct atmel_ecc_driver_data atmel_i2c_mgmt;
+static struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
 
 /**
  * struct atmel_ecdh_ctx - transformation context
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index e3b12030f9c4..30ed816814af 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -115,7 +115,7 @@ struct atmel_i2c_cmd {
 #define ECDH_PREFIX_MODE		0x00
 
 /* Used for binding tfm objects to i2c clients. */
-struct atmel_ecc_driver_data {
+struct atmel_i2c_client_mgmt {
 	struct list_head i2c_client_list;
 	spinlock_t i2c_list_lock;
 } ____cacheline_aligned;
-- 
2.39.5


