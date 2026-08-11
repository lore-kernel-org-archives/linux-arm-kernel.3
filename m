Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16364C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 04:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmKjP9IjT2hrwlvsGyuoqviwfW/j7e2tW9dKMk7ti4s=; b=dsCfY3xRKJl078eMKNkAONGv6z
	B2HowuijKnIoZNdImjSCbJWWP6GkmzrzEW9Ah/J8yLgICHxC24pJ/+2VOzbwaVGdVe+44rOy+RsUb
	UtiZqf0wVnX0B8v3EstKB07nCXH+a3Q5nuu9t3DoKVkqMJwwMrT5NZGb7c3QgZUP39gwVNH/zIrYP
	iUiF3550cES6Sgsh625tQPx+lN59c5B/N9HbMb7FLB2lg6Rmb7Nqu3voGBZB3rn9MguFChb7DS+Qk
	OsLfmTZb88VWMqaKnBCdBZ5fgFR8n31JoG9L5VIuzbPNRyWmbzBgDQ2YFFdPEWRGERNH0yR6aKowU
	EMIAppdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wteQT-0000000DI9o-19qy;
	Tue, 11 Aug 2026 04:49:21 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wteQR-0000000DI97-0a71
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 04:49:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2caed617615so33565105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 21:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786423758; x=1787028558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmKjP9IjT2hrwlvsGyuoqviwfW/j7e2tW9dKMk7ti4s=;
        b=j73q5nHb+9wNxEr3QJUJ/OfuY+puYMGRpxsN1cVSlhv0Ub66qGTlx0adGVYEHXPpBd
         56GiPamJgpLYxc9d4O/UG1x3+o4AhAVN/9yGPnMQZ8XElU/9vW5+13s4pkas0WVhijhO
         xHqdmMw8hfmCvzqhOrF7VAJzEr1KUmk+TofkFlTdQYj5Nu5ARYCwjMiO/se2MC8W97Ey
         bRMUWqAq3tcg6SFNxgdhQ+IvaG+DnUoH27rLS80qdslj4oGygm+TXUSz3fg3OoVGTym6
         2D5MVCkUKXUPtFKrwCIbOk8ssnxORNdgEiTNjn03pq2OBiDyEtmFiYC4Pu3TUMvpr/Md
         sEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786423758; x=1787028558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmKjP9IjT2hrwlvsGyuoqviwfW/j7e2tW9dKMk7ti4s=;
        b=s/KvaClBaU75tDP62VwaYUfzJq1Tl1cfQMawRhV0wOULTD8OZwA4I1RQgHNePJTQlR
         3k0vfUVK/KUFaYu3G+CkJfnYG7HYDsE3mbHpSG05TRr6QI083W8JeP1HUTfWW+LGVNYQ
         SYHX/RIvWglpdizftSZaTFl8fS2E+tM56vRquDxm9nlHHwmrkn73Mt8eRMlSoxjIbZkZ
         oh2kcDAZxWANGrv7SROGmLRtYwRRDMQtLX3E7djFHT5butmA1GnFwYhfnfaeMpNRneDf
         ehvCbBaH8RYX0iavG46uFaQy3+65OytJXUADiDUeABCfdL/MEPrA9TQecii4kkv7X2/h
         4zTw==
X-Forwarded-Encrypted: i=1; AHgh+RpbelxeGFbMDvAY1covIN6kgHD9VYN3fvueXx07qBn5ot25sPsTKkumefZ7vCKFCa+0Z+QRopm5SxK79gBDg08L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+VJLqmwvGv+hy0y08wFG3PO1aOOcFDrm7UhC/PdNmzB0f3oUS
	jJ1IADWnxXhmTlh1ChLGOkUTqFEx0J4fbo6itBXTN8OnuXsQn+eqZ+nf
X-Gm-Gg: AR+sD10QyH5Su4+g1oY3MQFSIHwBm/cqEOIOySErT5PQ5ltPZTX+JDKAiotdDNnIWlS
	omPm+ojuQztVOZ9F8eimsyVsbQcfw326vJHUc43yA7CLEup7lZJRqSkDZGvezDESkoYd0yzTP6i
	dKQP55o2kZ/Gpo7SCGbU/MN/nAJ7CijrWZPewUijIb51VcXaykfB4MFj+aK/JOF5HvHjdV1yk3k
	Gcv+TzAfGw+nYxrV1zl2BDSiNmblngSoHlf3OHZOJ6KTmk6OaKP/MlMQphCtbjTj2bN3mDeHxHu
	KHq284YTQFzfkMQHx8ydtI1Jx+4uUaPgAuzkLV9dcvRAoxJSy4tOEFM2bfEvll8AIqhMqeLpHnW
	RyDq1b3Wic9CcP2lhOpMNjUlX57JLcU5UdaD1ql6ZCSKRgeb3aPIgHJOPKiBG1rnLqc+xoYjFO0
	mYqmy25Otn4M41mAkI2imkCtiH5a6Hy7NUwKvkJSi6i51v/GxA7FobT2qkPPiSmMUaSDCS+H0IG
	g1FhG1KkGsoCz5qyw7Q7UOr3FlrDNSTuGYT6Nb9UgMkCNjutz1DXBRkJrCkiBPq++qHY425Ofgy
	lIC2pGUAdLsyqkBPxW+Ltva4eT5sMO05WzODkdyRhpmGnWrkMQ==
X-Received: by 2002:a17:903:1ac3:b0:2c9:b8b7:5d27 with SMTP id d9443c01a7336-2d317776218mr11372625ad.1.1786423758109;
        Mon, 10 Aug 2026 21:49:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160cf975sm1344365ad.48.2026.08.10.21.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:49:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: rockchip: pass crypto_info to irq handler
Date: Mon, 10 Aug 2026 21:49:16 -0700
Message-ID: <20260811044916.160856-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_214919_180264_085594F1 
X-CRM114-Status: GOOD (  15.18  )
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

The irq handler takes the platform device and calls
platform_get_drvdata() to recover the driver data.  Pass the
driver data directly as the devm_request_irq() argument instead,
dropping the platform_get_drvdata() call.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/crypto/rockchip/rk3288_crypto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index 7cb1316b6f18..b2b629fffc05 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -163,7 +163,7 @@ static void rk_crypto_pm_exit(struct rk_crypto_info *rkdev)
 
 static irqreturn_t rk_crypto_irq_handle(int irq, void *dev_id)
 {
-	struct rk_crypto_info *dev  = platform_get_drvdata(dev_id);
+	struct rk_crypto_info *dev = dev_id;
 	u32 interrupt_status;
 
 	interrupt_status = CRYPTO_READ(dev, RK_CRYPTO_INTSTS);
@@ -363,7 +363,7 @@ static int rk_crypto_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(&pdev->dev, crypto_info->irq,
 			       rk_crypto_irq_handle, IRQF_SHARED,
-			       "rk-crypto", pdev);
+			       "rk-crypto", crypto_info);
 
 	if (err)
 		goto err_crypto;
-- 
2.55.0


