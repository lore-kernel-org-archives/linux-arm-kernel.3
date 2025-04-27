Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24597C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W3KBITx9RJaJB+v1y23nabF6VYlDwF1hnHk+X2NkE0k=; b=v8g56s9sDgb6uj/GoiBJbBbrMQ
	9L9ee/hIytqoosUbMYQ2Z2OAbRU5dA0aXdeQNNRtB5TeAzBYSoXZzL52vbvjA9aomWdRmmnmR4lpK
	zYGfN8RkwaF7UDuwpOFQ+Un/yev2K0Oak3A5m8sEDFIMoOMLdQ07I205vVLQXmCgb0yxi9eGR+3+8
	hlltZmhurWdXq2mnRATTrNR2FxYRFnPd1CKITJf+Mk796DWj5mOCSeV1MgmQ9J897eY79hd2eO25S
	u3vSx4+8t9jejPKfsJmgDN42oX0GUyPbYtLercdJiB3JxKnsDvt8ggbDf2DF0tQeUoGtTRn6jIVri
	9HON8M3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9003-00000003Oag-0uy6;
	Sun, 27 Apr 2025 11:16:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8zy6-00000003OOy-0HyH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 11:14:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so25011935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 04:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745752480; x=1746357280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W3KBITx9RJaJB+v1y23nabF6VYlDwF1hnHk+X2NkE0k=;
        b=j3CR4tGcBl7JulwmJYMmtuOmITlbZnt2zmzioZI42VfRnlZiQzooEvsrYttX/h65p7
         tz27mV+KDpTO0BM7qktwSXP3ZvIy0Awlcp1EOuP75TnVg6J8oLVn8DUpdXqWx0Ns+DQL
         4Jew/AlsuCO2m6xei0jKAtkwmaDgOyyE0HWDn41yjS9spzmP5eCgafPv8FWGHhJ5rgIM
         Qh7vPPVpJRn0fAp7xGoAuQAYj7Dg0eu6u9tMt6RRzz5EX1LgQOgFv2L7t4N3Bg6Fi2Wi
         dr8j6CCv5oPtwciY7l6Fiqa6/fd4iDglz+V5/URLqXLX+3zQBusiZ31eeGDk866MOsBV
         oLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752480; x=1746357280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3KBITx9RJaJB+v1y23nabF6VYlDwF1hnHk+X2NkE0k=;
        b=WPiVoiOqNYHzQDacteeTqRZZmj6sLrslpSZtjFd2SL7ikXLh5HVZnLP7fRHi0b84u8
         g2raj+JDvLZLOhoqtDlrHOVhPYUkj711BNb2EZIUGlinhwAzudeSiDn5yzfWdQh3FLxw
         Oyi7SEhNXhEXBhz7ib21nzC9IbxbSjepKlPK93vqXdBKBbHal7K/oh5xPljtdMva6YY2
         rqbPj6VoX+tJHhjZGFwpA2jTvGSDP65/FrDAr2tXB7W6HaUUpJaEnSuj3MAUu7aS+I5Y
         /Jlt6TEi9HsmC80sVjJo3xsDYcTfZ2wW0UPkKUzlogPmCu6v7GKU/ppGfZz2x/vfV3NF
         X1nQ==
X-Gm-Message-State: AOJu0YyZy/vIdbaHapnulEEy0GNCwBGSkGXsqbl4ZK4vLRIvyHQYEC/U
	gysxlLPLXPf6fRgmb67/dYh/eucEZ8J30nT2V4rK6SfP8pC+Zzkc
X-Gm-Gg: ASbGncsF99giB8OXbapvTioqy9gMF8syudxX7aHt2Lvdw7YJWgi7wxetiQz7Upxax1c
	VAgjfZMbgvyPpvjhJeTfxBKB7ss+Mvy5X2S3lIose2QnM5NMnsESxlEQ6Lf9lu1R9kCZnG4Gopn
	3oqZveL3xa3KElwSuTxLSzeRt50UlMdm2jiSguju7m1+ogGVGHP3aR74z+M5jyLTctzZ4QRxXEJ
	Hwhf98qSs1KQk4iUtfWaHQBHz76Cq4GthBYlYt/79sntQdJHESakAhTQgN0PIMYgJCrVKqHPLJk
	VfbYIxUlBEfDNaPzzjVUONijl/EBJt3rQdJVNCKJuJT0CVK5MLKiKu+ny0mR6Ekc
X-Google-Smtp-Source: AGHT+IEjc9o8H8oECCb05JlQieQM2HuT1pOumzI29bfNceULPIWLWaiAlh6hn8YYL7mavp+K+CgJLg==
X-Received: by 2002:a05:600c:8109:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-440a65d27edmr65047645e9.6.1745752479653;
        Sun, 27 Apr 2025 04:14:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4409d2e0241sm122350515e9.37.2025.04.27.04.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:14:39 -0700 (PDT)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH RESEND] crypto: sun8i-ss: do not use sg_dma_len before calling DMA functions
Date: Sun, 27 Apr 2025 13:12:36 +0200
Message-ID: <20250427111236.25668-1-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_041442_104436_CA0635D1 
X-CRM114-Status: GOOD (  13.53  )
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

When testing sun8i-ss with multi_v7_defconfig, all CBC algorithm fail crypto
selftests.
This is strange since on sunxi_defconfig, everything was ok.
The problem was in the IV setup loop which never run because sg_dma_len
was 0.

Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---

If someone know why sunxi_defconfig have sg_dma_len() which always works
even with any DMA call not done.

 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 4caf17310e90..ddec1b08d4f6 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -141,7 +141,7 @@ static int sun8i_ss_setup_ivs(struct skcipher_request *areq)
 
 	/* we need to copy all IVs from source in case DMA is bi-directionnal */
 	while (sg && len) {
-		if (sg_dma_len(sg) == 0) {
+		if (sg->length == 0) {
 			sg = sg_next(sg);
 			continue;
 		}
-- 
2.49.0


