Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06D1CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRmMDCcVC/F2MSG/rzMXw5a6Uc3R7sPjQLJ20BsNc6g=; b=rTjVfxOmsN/k5zRGCy+pSb5sjn
	tDmPmVb+sZkkFOWvFZeYFk3ZjuR4pTlkmUQayunRShr4LKwcgLysdmJk0I+dpt287H6h1x/PACFpN
	I9r5fKFG+apCPZkoQGY78OqASfD4ThOiiLW6vIF7rVF3mFQ5qqb5h+FnCfLIjm/Ye3VZsMe5WjkrP
	qXlVY7DPX3HOv1eurlpnxmScOxOcc7VzyTvgjMFnUKnUvnVNpIranTaQ+60ebSQOMRRqe21ohxYj+
	rsgOdTb6YU8ZiPHVFlkEecJihU/856ejsMRPOfGKsX2wQ/m6Y1JIl0WqmaZtp+b7ZfFdwtITCHsaW
	Bb8e20jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft9-0000000DAQb-11Nt;
	Sun, 17 May 2026 18:06:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft5-0000000DANk-2UKg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45b030a5696so172306f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041210; x=1779646010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRmMDCcVC/F2MSG/rzMXw5a6Uc3R7sPjQLJ20BsNc6g=;
        b=huGipBZBqX5CyWtvxTSzQl/gzLNg2IFVNCf9BYwGgO1axev/uYwPBitzpdfwwBnIe+
         NUHJPEzf/6rbjM15q+6Q73JRVzeSkzcbq/iHbwMxQ1v00Fbvicl5rqEAYdy/lmPu2sBO
         iy9OgZWT7zdAvOlIfhoXdYE7BMakb74EXtE16o1KWkywibtSReekPxesC6RmnSwfEdYs
         B7rTOoVEVb6P36krVPeDUD9KzWbm7PznlkODcEK7ctkr/GcVi3EncuVv0PgxNcb3IPOH
         r5UZvf4QU86Q38g26CDrS8VLWKFG9eaFTKnnZj+hLWvvg/tcY6QvBGG3Sc4kv0dZnlSr
         Upuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041210; x=1779646010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRmMDCcVC/F2MSG/rzMXw5a6Uc3R7sPjQLJ20BsNc6g=;
        b=J54m06mVMABkkEJr+pg3M/2OQpd0m5UABbzXI6fIBygGAMsJvhLxAJALyId4oCqFPh
         6oww4Coxs21h33RlGplMEXE4QGgSrXLERT4SINN21A/1T5v808MiXegj183OFAoZYvFY
         gssZM3B6Ysl+UKNqmOxDYnmiCmDiyHO9S2+WPN2OEGV3j9eTiEGNJ6bcKaEfZ+hCbgBe
         i7rPPNBRoSX0lEnaXk5u04rSRtfUrQPoeHsGhC+x+CurUZGrJJSVS/P2lziMYE1cr9+p
         YSss8/lbTpZoJbIFrhRANMTK+7i06hFYN2Ra6So21+1Xk7oUdpdCIx3IJhKcolff1peW
         PRRA==
X-Forwarded-Encrypted: i=1; AFNElJ9B4bMYlHvn4yIvas1dmzDIyzhlYdu4NxokjUMc+YwN44RHHer+T9aifYZJXqKD1eD522pG6kzeh5vokBLkwsES@lists.infradead.org
X-Gm-Message-State: AOJu0YzqBhKymj9Y4uyVxGAiOM3VgsfWmc9WQred5WBY04zc2nMODXW5
	Nb4tn2KOiao+M7vRX3HgxVDWhRRgtnpysfCIcOYMgB36J2+DbLTlbr+G
X-Gm-Gg: Acq92OGI+aZbRIX1bvnIEMxJSR2gvQdT9B2HJoctf/2/g10+oH9bROB/857F5buxtGL
	qzqjf8SCBlQOKVzHub9hj0U8UTWJ7FeWmYdmWUW2tSRx9/i7vOF6DLHOsJVKee3BzlYio5GEguE
	3ranSh4wSm3K7gAseInj65D3u34MK4m7IUyRwYmu5PxlGIzkf0PrR8h6ghHaPwlTAXD9o2X06KV
	pDiv91E5ExsEcodyNuLqUKMojbC5nQgGvKIFL/EHzZvHZRFIUBhkH1R654qGvY65M8CRX1Xf1LY
	tps42cgJqkCV303PBZW0RSzHByjPTzC6cdxzPqPNABJyAcKqgzEWTM2CAlgTwhLzFmjmA2oLJAi
	hJ8aG4O9hszILqqJeQ6xaw3qR2jiOXrqri/zpXQyAIObq3zXMaJpu6YhsiC4JbSsTHMiZyJKsZw
	Jm7P9/rlRvYCjCjGwU3GFMIbZHNK1dpmqy4V8St50kQCRMz2pWK5gFEikQs0KBCiI=
X-Received: by 2002:a05:6000:46d8:b0:452:9709:4086 with SMTP id ffacd0b85a97d-45e5c37d127mr4745975f8f.2.1779041209416;
        Sun, 17 May 2026 11:06:49 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:49 -0700 (PDT)
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
Subject: [PATCH 02/12] crypto: atmel - rename atmel_ecc_driver_data to atmel_i2c_client_mgmt
Date: Sun, 17 May 2026 18:06:29 +0000
Message-Id: <20260517180639.9657-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110651_644239_F28C2255 
X-CRM114-Status: GOOD (  12.14  )
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
generic role in shared I2C client tracking and locking.

A subsequent change will move the client management infrastructure into the
atmel-i2c core driver.

No functional changes intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 2 +-
 drivers/crypto/atmel-i2c.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index c9f798ebf44f..9feae468b7ff 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -23,7 +23,7 @@
 #include <crypto/kpp.h>
 #include "atmel-i2c.h"
 
-static struct atmel_ecc_driver_data atmel_i2c_mgmt;
+static struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
 
 /**
  * struct atmel_ecdh_ctx - transformation context
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 72f04c15682f..98a79dcae2b6 100644
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
2.53.0


