Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EA8C36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/+iZ7oXBPhE3cNOeJn0BX2fJsfTTe1JAGSbvb0XfLY=; b=s1z0anw2cfklVcbd40hUkrWUFL
	dQJWJ7uBjpUYu2ltoVAabl//vMRB/kzUpg1pE5Rc8yglUqv/RwoaGuKMQj1Pu7HcfmMBxuRTF5cK+
	9rS6pAdeRfLuH6CJeTfiLvL5lNTsHoA3WYpF+Y9aFtzhsN60GHodSO8VEYQatPYIoVT5fT6XTmYP9
	8HZCy5ESnkOhjEux5VWwHpr0fD8VdOb9nDkO+83h9TC8OHjKLPxO7yCUFi+xSrOzbPr8/cMFI1jUf
	XOpwxTs11i3MLcyWw9yu3gjtGBv1uB/lz+OMFBK+h7mBM0/LvF17rKTf+ssZKnCRDUgk/MCEUvrvo
	Da1uwobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhKR-00000004E31-0USE;
	Tue, 01 Apr 2025 19:31:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhDN-00000004D5K-3Ed1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 19:24:02 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso5689342f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535440; x=1744140240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/+iZ7oXBPhE3cNOeJn0BX2fJsfTTe1JAGSbvb0XfLY=;
        b=l4OW6zk8Z+RO+6IbX6WsJ20pIPoRMiZetlEuc5BATBdJcXVLt5tA/HkSveRYOTlOZv
         NENQFoeUFgVzu2PPFLOM9DGaB9eXmtasr1Y7RKxWpUGyXZGYGJCW9p2vsUQVgHXR929g
         tkJk8KnTrXdM38JdEAPh5YB2wVWZQUzxbX1APfay4+HMlWOJHgZmyqhSi96/XWytPqSR
         /Mn8MkV3TZgkYk5s0sZGDWEBLaRr7t9rcNtLBIDGaQoGCIxvUxZxWWezRojh6kuLeoff
         ANrKm8SU1+nKf2unsB08b4npdP0WtZyI2dXGZgB16QeigJkbBFfxzJ82H5utxhqu45tX
         GoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535440; x=1744140240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/+iZ7oXBPhE3cNOeJn0BX2fJsfTTe1JAGSbvb0XfLY=;
        b=qyOVWbUjAlIgOnmy4XmQo4hRVutPwrUrph9sga7mPEm1/BCy1mc4YrykZcRy6kHWYN
         FTz7pBOyidvSLtD7ISZR6MCpvGgbQphTz1s8XLavkI+WDx9Lcvz3KCnn4cw9n11pnAwK
         pf0OWXXQu4N4o1FOw+u+XujN3HpP8TRsLu0X6V/p+w8/Oy7RxLJvUENTraQtOnFDAbEz
         ijgjabVGzfj/qhPeVWOGMaJi8XE2xLBZYquWed7STyEbDTJc5ZOXpVPoadFbl2qsza5R
         bRqQCd1rGqLL5J0cWeuD4L+pm+HS7TtUXGqtWnC/oQd20ZV9VwwbTc9u4GabjkJWY58+
         zPxg==
X-Forwarded-Encrypted: i=1; AJvYcCWxLcRG2dL6ZfIzqRxk1MrTo6w0R7WcNCVR1Sc2WpSe1sG1W0cS1ZIE6Vx8d1DXT7uPlI/CirK0zrFirDXR7lN1@lists.infradead.org
X-Gm-Message-State: AOJu0YwxihlI1VC1eK/e9j9HWH1lKsx2SUrRJ2TApVu1SB2u2X15siQT
	zDHwILx+NABxjfUS8XTkdQfs4KZmqggEMTGxsy3x/Uj4AH7K5D4/
X-Gm-Gg: ASbGncsFz8U3jS/CtDzEcRX0VRCkike3mInNTR62PPJ/AkV2UwdCT7v8XjZrwieyY61
	I3kOS+fucivMLKVt5SRtehx4Hj+crK+JVGTQLzzdYJHSZl35UqpE3dSW+GKLTZK/WHTnPNGgrSw
	vG+Eo8Ia9KmFEoxgKvxvCqSFjfZLxfKeUvmpVbxfWu+PYIbFGcO7C/wAeL0DXE6ayF/KRrZvORH
	R10ox5inLL4UauBrj1hh4K1ZS4sVHYp1tdWlhb2MLhX2MyUxVj3/YV9f4CqtPK2SiMpQYRWe3aH
	DUkzpzhTk9MEMy3fTqfEyBSTrw5z0ivHwFzK5W/SE3ij7QGS727aMH2AuVNnGwyuwKN4TUcf
X-Google-Smtp-Source: AGHT+IEroLhlH55Nn0a2Cu0BMYw27BSdC4OLp0dlkWXs82H+dhWwczs/WCChC+qm41GDorZgNFvJwA==
X-Received: by 2002:a05:6000:40ce:b0:399:6ad6:34 with SMTP id ffacd0b85a97d-39c12118e33mr11160301f8f.35.1743535440077;
        Tue, 01 Apr 2025 12:24:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:23:59 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 4/6] crypto: sun8i-ce-hash - drop CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG ifdefs
Date: Tue,  1 Apr 2025 22:23:19 +0300
Message-ID: <20250401192321.3370188-4-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_122401_808937_17244733 
X-CRM114-Status: GOOD (  11.64  )
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

'struct sun8i_ce_alg_template' is always defined, even with
CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled, so the ifdef guards
are not needed.

Make sure the statistics have IS_ENABLED() checks instead.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index b0959d8218cb..530c5181d73c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -31,9 +31,7 @@ static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
 				    alg.hash.base);
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 		algt->stat_fb++;
-#endif
 	}
 }
 
@@ -354,9 +352,9 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	flow = rctx->flow;
 	chan = &ce->chanlist[flow];
 
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-	algt->stat_req++;
-#endif
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+		algt->stat_req++;
+
 	dev_dbg(ce->dev, "%s %s len=%d\n", __func__, crypto_tfm_alg_name(areq->base.tfm), areq->nbytes);
 
 	cet = chan->tl;
-- 
2.48.1


