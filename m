Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8552CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sb5MNahpjnP/vNHphvg5+I/zYJ16o/85c7lKSptPrvw=; b=YuVewN9tjWb7EW2YvK0oU6yKy+
	+VLn5upfH26oYnQdcYYR494hr4hDoOSXNX9W8o2V7eoOmGRxZyZJIYG1JO3O7yLwE3jYZCxA12v4V
	LBH74HeJyeva52gDqr1FyW1wgQcHHgUa3/xpq4tXWC9B4DxaoRnOLuVMUY1/bsm3VuuvdFiP32qwx
	fa6ZkMpKVwMt94ChLJfK3ega/s25AroB3p+hOsVB1Srj6dFg2ioVDnpju9cM/Q6mJMm5g/cYnk6i+
	DnzxhMtVm9iD2+N37EYG3nDBt3dwbG5nXSe3jAO9ItCaSwWv5wC8JKUreKLlqalFahY1Scov5o2eU
	cKdvyn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsT-0000000CARR-2KlH;
	Fri, 22 May 2026 23:02:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsG-0000000CAGL-3Odp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43fe5574cb9so598212f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490907; x=1780095707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sb5MNahpjnP/vNHphvg5+I/zYJ16o/85c7lKSptPrvw=;
        b=HT/2b6c7hkHzM0yYUWHyEFjgoiPFODjEtuLlX2i0dxOnJpAovX+FpxupHipxZsxAE6
         HBNBh5G8fyW0bF5GcK9Xzxc1enM7lh2VhG/PFzLLsEHZZmUkHmC911d+s/NFtc451ZTj
         4iwq+qU0k/pFSJ213Zyg6EXw9qarDri8UwDGncK3mU+7qSlKPZJgGCXsSe+OGNFbhJDP
         WAAUVxKfVyqYqtgo+orMpG4+G+nIMS4ubZcVkBM+DM+513cifohjrLAzrfimHn+NF8tB
         M34XJxoXZlYUVQ7H4fpa+MAchXkfvVzDbgLKykGXIRiM1cwP8zrb9z2ZWceEHZ69J4q+
         UWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490907; x=1780095707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sb5MNahpjnP/vNHphvg5+I/zYJ16o/85c7lKSptPrvw=;
        b=WFUz+eTs3WxfoZfdxTDlfwOjv/ehbopp7c/rh205nlIv2BrY+jA/+oYgfiQ//m8haX
         VhsCosIisNkf9Swe+5Q8lEkNPqSpOzQZ1pb7uiWCnamha8Ypy68qh3U82lSu5faaU1ex
         vqyvn8/830KSl8i3JyGlp0/7cfpzgYynd2ZFwd0Q91JPLOdmPvpc1BDVqzkXMDEW2jL4
         3fImdBxMBHfnQP+P8dmSSMeX60AbfNlsujRLENS8IQbB4YWvXHVwhnPKR+0u3WOcAknw
         E6/1kr07zYioiW2fs+qBLJJka3b7I/giLYa1cqp6DAzihsJn0vYtZDMF6vaqoqZMsDgO
         3fzA==
X-Forwarded-Encrypted: i=1; AFNElJ9eI92TLYBSPd+mP1ayNIFMRHfq69IjXsKgCgpGoCDM82A5qntEkXJgNnpslpPZ/qAmwRqKJgHelvtqZB97tMWV@lists.infradead.org
X-Gm-Message-State: AOJu0YxHQMNF+jDtI5/v9ahA1OrBX5cWQB+4dPmLv1E+A8gPTnw9lPBD
	4qOaORlO5ho4vM8Wst0f2xKsF+0FZ64QCfN3jyNwsnmidtv/1ySI7HqO
X-Gm-Gg: Acq92OE73DDRJvs/aUSgb4lnxr/HPSLHcLCrpe1WGBy+xx8ML45+fzjWsyw77WSNtNo
	6oROd62CQ6IlsWWBOqmAWHJFw0iYl35QAdqS/BkM3P2yXG9D5aHMH0ffGoqbv/4+zrY2e1IqqHU
	/d07B034n1Ib3DhFoVo+nSKfxDvC0V5OE8jieBFsXLs/p4xL5EBZlJTxOydL0BDVSDaVrd2PeWq
	MpFg2veCFcuAyFkh1SxdrXgsyYdjmIpZdPF+R8SAVqkJ/hVTdsD8QUSquw0ptnk6RCLFGJGfuN5
	2MUXqoV9ShL51EJJ4UcNBJx+FJIGsdSzcKjhPJw1qizIRSRCyKP4i+tla8OFLRd1a0pZeR6BTdK
	kUI3S8/aMEVEBYZHEbR8rN1cNo+kqf9pKuDBjS6+/q12zk0sll85/yd0viV/4LHJ4KtKXgNGxIv
	Rtzx1jjzfiepH0C0wAT3dqm/B6GTFuMEbEtgAs+kmlcYYLdn9mP/i9rB38SI6W3E9UA/kwnAJNF
	Q==
X-Received: by 2002:a05:600c:a09:b0:48e:65f3:a950 with SMTP id 5b1f17b1804b1-4904248ad8cmr37124745e9.1.1779490906790;
        Fri, 22 May 2026 16:01:46 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:46 -0700 (PDT)
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
Subject: [PATCH v4 05/12] crypto: atmel - rename atmel_ecc_driver_data to atmel_i2c_client_mgmt
Date: Fri, 22 May 2026 23:01:27 +0000
Message-Id: <20260522230134.32414-6-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160148_891113_692F40FC 
X-CRM114-Status: GOOD (  12.67  )
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
index d12a9dbe45a7..d6ae113c45df 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -28,7 +28,7 @@ static int atmel_ecc_kpp_refcnt;
 DECLARE_COMPLETION(atmel_ecc_unreg_done);
 static bool atmel_ecc_unreg_active;
 
-static struct atmel_ecc_driver_data atmel_i2c_mgmt;
+static struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
 
 /**
  * struct atmel_ecdh_ctx - transformation context
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index b320559e50eb..660ca861b705 100644
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


