Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6988BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJtO1nuKB/731gs+IWxyxQBo+tSaie/TO/30jHleAGw=; b=EiNcXf71vyRv3ewAWu/4DVe2H+
	H8JeeQlvPuMKZ6e27XU2qHjVX+KeuJ1vt9t4ud9ESddR3olGTaTQRNxmZUzpSq+UyVHXaKy0J7szV
	DBjDjl1cp9lj5xFX2jFobc28/Soj1hd1v8tprG/5dxnWoFFWPzfIIB92bOgRmvzMIWz0gCpuqknY5
	Bzb97rRM5emVQz5NwsCdsbWWry88ALblZ5izjbXJGeLr53acrNR7eqBnx9II2eD5YsZduqvfjU/9W
	vPbOtZvjnDYhTN6uTZ6njQLDivVD6cC6xQemwliXEvnWtOEPIKe9IrIRlpKyG6shCUoIrk0TvpTnv
	FSgPVwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHfu-0000000DnD0-1187;
	Mon, 28 Jul 2025 06:49:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1k-0000000DjI0-2aPl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:08:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so39360595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682879; x=1754287679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJtO1nuKB/731gs+IWxyxQBo+tSaie/TO/30jHleAGw=;
        b=VJnkLGHxw4VWMvaNnoCyqdM1cgwU5dQQQUCiFjYrFGKls0LwaY0Pdjwtq3WgAF5wtr
         c9TDw/oh1KUEgt2cJ3JhbppnZ/MgjqrI9pSkkUX/f/Q0OhHgHxCO+L37KS5UU2/ar1FG
         G3FU2knTL6wPjhdiaM9Hg7czwNM3B2tY6oLg0IL0wwz0tLH1A++HIcjPSda+qQ/kBfhe
         dm1y8WnNmeAP8XQiesebjSiW4k1lZh1XHgmcPeVmZb208X/QqY44gF6ieMdgBOFWhxlg
         zmSnTq72yUEUvnWhP73wO+zn6VulBJkuaYHq8cJ0lboHDt4kEDcyMbjIYQTW4IGd5mBr
         LPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682879; x=1754287679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJtO1nuKB/731gs+IWxyxQBo+tSaie/TO/30jHleAGw=;
        b=Hdgof5i3jSubftqQ8/1MIznWQ9HDz6OoBDWwHPTuQSgoifjGuaIcSpHimZNEgK2roL
         KI6tDbkj0iM+Wl8ToT4G062ooUzlXo9dbfi+/Wu+RBFXScDTnWuI13HP+ANsNs+1E3+U
         L/TwBe4WbS6gIkbyk42ICiYdym0VTUiPD+4VY9dz3MblpAOnFYxHI+dCkw7vs82Q7Mac
         yuUjsURqMl0byBMQmfaeZT6ulGZ0BeIWI0lu7pdAhfzFLFngzuV/BytYwleCM1AMKVN0
         d77BtXavuDirqH/q/cW2nxQezMO9Y5vGA0JE4ts4b0oPvSv2D0hzdgvPciRoOQlymEds
         mYKw==
X-Forwarded-Encrypted: i=1; AJvYcCWXW/Xv6w8Rr+LZbU3DTjB+1p/c+CyC/8DeeHrFAIW1X6oW2N61rh52D4lo5fCRyx5hVcOukQMFx1EbEfomMGmd@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ1alj0r8cr5SxvjfVJ/lC8h433OReDByGzrueihJxeOpTUr4v
	OhOdZDzY0okGljbhIEmDdzA1kCBg0jvsZ22iwhMjEqGcSpcgkb3e6H1Q
X-Gm-Gg: ASbGncs3Tfh3jzj2stU9gG0oUeGuuvYmCyYdgK5AQuFfyeK4OsCyN14go/ZHhnFLzu0
	Sv+1FHy/HKuc7psYAjKWTK+SYhdH1eE18n9d4SVW6WcZq5K4thQKgB26c+DQMzFaEW+aVbn0Tdo
	TGkiYKsE9eL+VM1b6YEejwoMe8AD05E8MxTydQhaZs5UZJphS6y4vkgWpOmksyuxr7ejUMuJW5r
	hoGxGeqvZQwkSnHzozvTQzQyhmSa8w1qLYiO6ssYl45lxh0CPzWTqCWzC38gdXIyA5LG2Ekv1qL
	Xnwq4tsGBfEtJNEeyf6oIjZEhPk6+E7xa+xU9M7RT3nDUp8wLs6F0EJNWI2/8C/tO84ztm7saeG
	qH1wqV5Vc16Wza6SgGPYpaY9UW+44eqJtTXN8wcSehGus
X-Google-Smtp-Source: AGHT+IHcuqZDSycBlmjS65wGUlNSERplHlPi6V2vucApJV8xzGnmPFaJnpc/De5ZHaB9MzmHrkvGag==
X-Received: by 2002:a05:600c:4590:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-4587643ec92mr86897145e9.18.1753682879129;
        Sun, 27 Jul 2025 23:07:59 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:07:58 -0700 (PDT)
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
Subject: [PATCH 4/9] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Mon, 28 Jul 2025 09:06:56 +0300
Message-ID: <20250728060701.1787607-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230800_655742_189DE48B 
X-CRM114-Status: GOOD (  11.82  )
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

In order to remove code duplication, factor out task descriptor dumping to
a new function sun8i_ce_dump_task_descriptors().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 326d9c988bb1..d94304a439d3 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -169,6 +169,12 @@ static const struct ce_variant ce_r40_variant = {
 	.trng = CE_ID_NOTSUPP,
 };
 
+static void sun8i_ce_dump_task_descriptors(struct sun8i_ce_flow *chan)
+{
+	print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
+		       chan->tl, sizeof(struct ce_task), false);
+}
+
 /*
  * sun8i_ce_get_engine_number() get the next channel slot
  * This is a simple round-robin way of getting the next channel
@@ -183,7 +189,6 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 {
 	u32 v;
 	int err = 0;
-	struct ce_task *cet = ce->chanlist[flow].tl;
 
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	ce->chanlist[flow].stat_req++;
@@ -225,9 +230,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		/* Sadly, the error bit is not per flow */
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -244,9 +248,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -260,9 +263,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xFF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
-- 
2.50.0


