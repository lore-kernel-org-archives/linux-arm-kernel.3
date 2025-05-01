Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9786BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 19:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xYcnJfHyu9Qya9nm0+iaohPyzIhpcE4qtAIXaJuOv9M=; b=QB1nvrIURZvVu21qqd47yDszC5
	BaPMCuyPOvtuGqua6Kp6cKDF5ncia188Ud89LypQZSPIHzyFyBlfPwYyIjijO24fKr2zcRIBGyu25
	rKehyVCdcI7UYCnbwW6uV9KMVGMY06yeviwqlvjtYZBM4/5zNi3ZPLNIVlrvuVTmk7QmyDZTBLFdW
	LfUm0yXqRY8rpOSmmupcn9Gz+q5ic0p1CUiWrKEpv9Hb4bsN4MozWzPkVJ2MrKoNTvuAJ7w0y8LII
	nKknmqO6bPtvHcuVp2SoBAJN65eXJr29z2DpERXzedQIh6h4a44hnxXZRD8ZBO0Pch1whaEjzzNK3
	TQmEFh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZHu-0000000GSIs-25zR;
	Thu, 01 May 2025 19:09:38 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZG0-0000000GS7c-23T6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 19:07:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so150513466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 12:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746126458; x=1746731258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYcnJfHyu9Qya9nm0+iaohPyzIhpcE4qtAIXaJuOv9M=;
        b=iIe/O9VDr/gofw7s6Qxt2VrjWh8BHcZMtEL6GmYzfprQf50uPs3VptZSMUE8+sbW/n
         46HDPYzbMK1m7Lz6ci6FJsb8H9955blPMLdwgLwQU6FPDqLTLF1IInxGH1Tp58ntjW9D
         R3Lr57FJqKf+crjE1cT4qdC/ETr29IpoKBL0ANokvPPzt5fPVEV566Bg6q2/PdCtGCBV
         T42AgNhnjNTz0uGbtWTUmR6qN+suHn9MYefxcE9QSDvBCUaWaV19pmORE8M2LIjIGTpd
         j9COhOGwxbyjK3ory4JIwQYl+0AmVqtAeV68aEI/oYRWPG0d6pULL7CFv5Lw99jCCtZH
         ehRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746126458; x=1746731258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYcnJfHyu9Qya9nm0+iaohPyzIhpcE4qtAIXaJuOv9M=;
        b=EVD2O0H178Jf/WoWqlZLq+MEOMVC2OiyqN55VumLtWELhyN3VwpqIfWfIthtys2Y+n
         MWzuP9BQVlqJv669ikC4PFzV2eavOnT55RCuB/RJBuvXgtj7h3GZ0dKtHLTH+NU+dKTQ
         zFwrQHUeNFeVQVJZV+V9GsF3CIekdwQD7eax2QmMRTzJaEJHVKbn3zxUy9znTNKkB0HE
         k1cqBnjAa3NBWygQXmkU/z1vzkAdH6p7eRMMTPm7MOOR8GCLGINTLAQSQSDq4vrSqrbU
         VvkLvdmVrOS0/dmhfRtAQbSwWKPmDmOM4AeaKuyQsUddwwrYxMBEWACW6MqHhRqTJjx8
         Z3nw==
X-Forwarded-Encrypted: i=1; AJvYcCXwBytzUx5WNoxyMmn/9DQS+EXV968jhq8BQHEbDHTdPdUOb91bs8X2030ZDglBtGC91M2hW3v5AjptnjS25UQ2@lists.infradead.org
X-Gm-Message-State: AOJu0YydTjGyrJz3yPYAn8xSsA5lLEHjbueAmrVea7OsboGDoNnQFaDE
	TT7+t+o0IH9gGQEdJ47+Zq8zoRP6UEffhF04/L4VlY66SAU5lWTy
X-Gm-Gg: ASbGnctDEIJZgXvL+u8ToE0nA20JNgFwiQy25N04k7KlyaLNv96aZB+PrhVKefGr719
	+u4sL8pLq90j4fHkRtJfVCMPdG1cdeOH0HQQWGu9z+DdPoU69Z7qjgClin9nb1ql7iZFum4RY4S
	PLfXeODSEKx4gjzktVQxwcEq2PU+Fu87lh3ZZC1brssEOuJjv3r2cou/ug079jwuWdULXMeTfNi
	+/ssKKtqKRuXI5aDhgo4acSB60jnAvwMYk5GinrupJxDoSkV1hc3YVg8vzp5xuMqnm8gi6Yytgo
	6Fafpbqx9gQh+HcTozvV7T4e+WaK9dMbDtI1q4Y0COLAPGARIhpKavpzsQ2vSuKcn7rm
X-Google-Smtp-Source: AGHT+IHfDMVIQ26ycHG3NCY+1odFkBcAwHTLJ2hCKHMBoEhxiuT8ZDLFmo0kkKjR+EXlLecp/8T5kw==
X-Received: by 2002:a17:907:1b17:b0:ace:37d6:a5ce with SMTP id a640c23a62f3a-ad17ad819e2mr39669966b.19.1746126458067;
        Thu, 01 May 2025 12:07:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0c70c6917sm80349266b.4.2025.05.01.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 12:07:37 -0700 (PDT)
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
Subject: [PATCH 1/2] crypto: sun8i-ce: undo runtime PM changes during driver removal
Date: Thu,  1 May 2025 22:06:50 +0300
Message-ID: <20250501190651.3863582-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_120740_531122_CA4871DD 
X-CRM114-Status: GOOD (  14.59  )
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

The pm_runtime_use_autosuspend() call must be undone with
pm_runtime_dont_use_autosuspend() at driver exit, but this is not
currently handled in the driver.

To fix this issue and at the same time simplify error handling, switch
to devm_pm_runtime_enable(). It will call both pm_runtime_disable() and
pm_runtime_dont_use_autosuspend() during driver removal.

Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index ec1ffda9ea32..658f520cee0c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -832,13 +832,12 @@ static int sun8i_ce_pm_init(struct sun8i_ce_dev *ce)
 	err = pm_runtime_set_suspended(ce->dev);
 	if (err)
 		return err;
-	pm_runtime_enable(ce->dev);
-	return err;
-}
 
-static void sun8i_ce_pm_exit(struct sun8i_ce_dev *ce)
-{
-	pm_runtime_disable(ce->dev);
+	err = devm_pm_runtime_enable(ce->dev);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 static int sun8i_ce_get_clks(struct sun8i_ce_dev *ce)
@@ -1041,7 +1040,7 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 			       "sun8i-ce-ns", ce);
 	if (err) {
 		dev_err(ce->dev, "Cannot request CryptoEngine Non-secure IRQ (err=%d)\n", err);
-		goto error_irq;
+		goto error_pm;
 	}
 
 	err = sun8i_ce_register_algs(ce);
@@ -1082,8 +1081,6 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 	return 0;
 error_alg:
 	sun8i_ce_unregister_algs(ce);
-error_irq:
-	sun8i_ce_pm_exit(ce);
 error_pm:
 	sun8i_ce_free_chanlist(ce, MAXFLOW - 1);
 	return err;
@@ -1104,8 +1101,6 @@ static void sun8i_ce_remove(struct platform_device *pdev)
 #endif
 
 	sun8i_ce_free_chanlist(ce, MAXFLOW - 1);
-
-	sun8i_ce_pm_exit(ce);
 }
 
 static const struct of_device_id sun8i_ce_crypto_of_match_table[] = {
-- 
2.48.1


