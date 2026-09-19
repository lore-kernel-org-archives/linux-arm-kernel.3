Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14360C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 16:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgqhI+7tTNR/gehAUgAlA1m56lV4Jk2GGCXFewptpVg=; b=yfnIPF6dAy9ZxHqCcfc24Ozzfe
	1BP5ej3tWPAxxYQnz+pq7oFvTb0ARf5T/uPOr9oVOzMqpTqIkuR4BMIG3EMOHlwirrrkCjUreBgc9
	GUYIhIAP+DVptikZEBl7mxpvH4K2c/+0jib8EJCTVKlx1Dpkn4TpQHI3Rpnfcyq732/A6QFL6+3si
	rd+WcLeXybEbdW3e694ck1IhgDyF/BIna9sanGw4wS1iPJwtSONOrJsc8PJ9Ie/SUoIM+NXzWCxEI
	1IkL7tGYdnWqlG63rlTZg8EXMso4NQaE6w3GMTzz4Bi7fnIhCsDlYiZxBqMtQ3ssifo4PRv3InOnI
	Upqq1S8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7y4H-0000000GWdr-2a8r;
	Sat, 19 Sep 2026 16:37:37 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7y4C-0000000GWcW-1J6T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 16:37:33 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4858bc96fabso1381836f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789835850; x=1790440650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgqhI+7tTNR/gehAUgAlA1m56lV4Jk2GGCXFewptpVg=;
        b=cKT0kO+6ps9DFEXVNS54zHxMzYYX8XpcWjxgAEe4+7JYGdfEMSWZbFr9XFJWiEBIaF
         t4VwUZ31PJ02Pa1PlEe/Oxf6IMplym5okMs3jltqeDbAEN/tE2N5K94bweBkFAH5IEhE
         TTAOqyaDPaEs8NuijfKKQUnWvc++wruhTNxHA+GErYbHmaVKZEmbIyLlC2pxfmXXUZTn
         v+BKCSgo0Tg/VP/QYNSVkXt53OORYKw/Dpg7ZpE90AmPPt3JDp+XAF6r0ipN/zHorafE
         3KUCehTi4jjRrpltCTkbU5RHV2Zlsi/3f3DMU87+HTYZKTevrR8voMwjubqKPfqehFhe
         EOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835850; x=1790440650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgqhI+7tTNR/gehAUgAlA1m56lV4Jk2GGCXFewptpVg=;
        b=m1Ds9i8OgyGcAtuuzi7o59I/4eEq3z0/nRDkkshuuKSFV8Ke21ThK3lClV06ftuXQ5
         tICmR/lMCdd8vJk3xNI9DFHstKfVAy/GXIY5BZtux7s1nHWfHBdNrxjt4e1cE6VhVmQl
         IsgEqQTas5ZukRqO9GaEkKXOHw7wOFFNkVCTnfuw/jyGnTJhNb3n8d2pjZjVDnfq33au
         6iDwH/lq7Jse/DwMfkbiPAPE3skPnUNE3CCTF0TzdpQ6Sk/BBxlEU54CYqBWdvp9FMxy
         BrL6LzSJ3BbNRTbHFGkqNemIsTBTqXEQ2mD7XGfSYdsnw9gnFeqM7TFXZlIG8aQ3AGxW
         xGrg==
X-Forwarded-Encrypted: i=1; AKwUvByqE8o1qZ2v4XC4/2n+2UY8L6q2txFGRpogPK2UbbAA+O0RSHCA1PIhIBtEqyWDUVWf6Nfg9CsO7WQ+YQT4ovMw@lists.infradead.org
X-Gm-Message-State: AFuF++klcJekCxuBDoqlbp7fn4VjFforBALtSHxOpPAaEvPVwSN4v3QV
	fN5jsDwAX23GvT+J7MEH7MXJgt/oAyix7KzxmLRfO6KBSIbr6J5JX2KW
X-Gm-Gg: AYBFou1cbXrwtvPVNRCFt+4PsFO8936aJBBsouNttmK671kQAKA4SiQwDH2V8+oW8lv
	CYN4l2W142VuPk89lmLH39zdybCYdNxnBZ3o95s5vNXewLmEhJRO7e0zvTb7gGbTZjFroKIX5sP
	+2KPQzdwk8wTiY0AIphioZweCezwfrnjmNzxiIDbxgArIjU++OLlBJh0vhBsKRuJ02B7hYfWzLx
	mIcSCcxmvj29hlR6U65yI0zcAnP60MDb38xDmVHTF6IVV0FJKQrvHrnwj7EimVPYKmCFvDhG436
	fnEDiKADQM+fa4ZiZNWBJLkbP1/WA/6HtSoVgOlKqXax19pUkb5SEGQYy0Am3M8LqJOzqYZDpwZ
	oSjTUBTmCscFz1yR+QudKg9CfeKnMSRd2liFywYEVBMzlnP9OTfVbfQ0HAJkhV6XT5H3clOwiyG
	hiCx9uzGH5QizAYL0+bv3pZjyCgHUX1cpo2Dqh9B8C6oJ+8DhGzIIgxGjstJX1tvVXjDGv1CnSX
	Tj2UzlTqRxeNTT/amXvl74qGb3BpYOSDEslXFY322VUd1yYKZ0g1TD6a9DibidB67PfeuamdxHb
	Y7TH+SYBkHaRIZkQGtbqoq6LKLgpPgas3mx4/sN/e8ZdMlj6chUC4ANGSBDwSOv0BZLjprTzL1T
	uu5ejGeIOZGeVV+U=
X-Received: by 2002:a05:6000:24c5:b0:486:f980:2361 with SMTP id ffacd0b85a97d-4871e3b20e1mr8905817f8f.45.1789835850295;
        Sat, 19 Sep 2026 09:37:30 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872442263fsm8155986f8f.1.2026.09.19.09.37.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 09:37:29 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: ti: k3-ringacc: Fix DMA ring initialization kernel-doc
Date: Sat, 19 Sep 2026 18:37:21 +0200
Message-Id: <20260919163721.89044-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260919163721.89044-1-kmehltretter@gmail.com>
References: <20260919163721.89044-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_093732_365062_9B0DBCFB 
X-CRM114-Status: GOOD (  12.41  )
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

The heading for k3_ringacc_init_data repeats struct, so kernel-doc
cannot match it to the declaration. Its three fields are also missing
descriptions.

Use the structure name and describe the firmware handle, device ID,
and number of ring pairs used during DMA ring initialization.

Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/soc/ti/k3-ringacc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 2de6031b9424..37a333f9a10b 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -254,7 +254,10 @@ u32 k3_ringacc_get_tisci_dev_id(struct k3_ring *ring);
 struct ti_sci_handle;
 
 /**
- * struct struct k3_ringacc_init_data - Initialization data for DMA rings
+ * struct k3_ringacc_init_data - Initialization data for DMA rings
+ * @tisci: TI SCI firmware handle
+ * @tisci_dev_id: TI SCI device ID of the DMA controller
+ * @num_rings: Number of forward/completion ring pairs
  */
 struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
-- 
2.39.5 (Apple Git-154)


