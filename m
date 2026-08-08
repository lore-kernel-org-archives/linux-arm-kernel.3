Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B128BC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RX1DphTMSs3B4MvCbqjOAvkckybgUBneK6EG7I97Aec=; b=Rew5425QUVhARggYhCsCQ61aEM
	JVRHth5XuD5A6QABXL+gLk0nzRamH+r906RPZdR0xyu5ML5BkauV2AO7KW90JitJMISReZXSLXbUh
	QCrXy/wTT+iZifkWE4EFAAfcb7uAQF9zGgGiL34sa8wloxfOMQS4jyzFfgDOVGQfPSst/wrOydk1n
	UJQqtRTM+wHIbquTVJ5/xL5of++OcvGz5A0lsyAwME+jlFcYdY2HTGINYV2m8qNwLosbf1AgLoaN4
	3C8XTj0mUS8dxQS1DFGY7xXCVF9b4FJrOju+RpB6joRj8ozystvrsUKWg67iU7fxGFan3+XGJX3K0
	09PkU9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdW2-00000009EAl-0fmV;
	Sat, 08 Aug 2026 09:38:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdW0-00000009EAH-03lO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:38:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so266647a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786181931; x=1786786731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX1DphTMSs3B4MvCbqjOAvkckybgUBneK6EG7I97Aec=;
        b=lVtfGMegerFn+lgx4NFg7kGa74/TONTrUgpURdStn4Mlvs79pn7rlF8RV9IZZgkFdI
         As1uP1lDnrmxrBlBN6ZTkJ62iKbxjjikqybvVOCegN+Pv2QpTTa6CTLpyc1hi5jRBswr
         QTapHa+iIYTvCZE0OCFxEsn3iyyL6IpOdSl0YFyoyz4PLZEFNW5E+w79ywhWuItcXquY
         v8Ntw15y5fxYjVRq6v4Ov3+T/s2fXWLb4EbY3PH0N3H0Ao4a/04Xh+2ZVK14p4gZ2VJx
         DjnzAOrtMwf6zZf9UOQ2/A/D7+GMMDrW11issmexcmMKXV3AMcYxOuzMgVf8c+TDSpj3
         64NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786181931; x=1786786731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX1DphTMSs3B4MvCbqjOAvkckybgUBneK6EG7I97Aec=;
        b=sy0gaN3VilIwJi/2/BxmrHnb68fXeetuw3XoWj32P7w9+x0aeew+K2RqUgK+2na3eP
         qmjA5OliTtD4sbqjxwgPsxj0xb8+6SgnZD/U+EeOp1dajfG94xts6648cpGnGEZTQUR0
         kJrlopv4VhCL0Rn7s43yEr9mY6xoK5ge8QHIVZv87fMxdvPG4WW9hv2/t9Z/u/UMChtt
         6YOKenzMTUxy8VD5TDu5tfWn7h9xP+78MHKCjqcSyRa2YusMMjOcKEQlHh3nhbKHG0/B
         83um1npzT6MP9pDW2OGOhJiKqSuOvAWcgRAb/qgpCAQA2DVSCe6kMh4AOz+/InwMNbZv
         +Oxg==
X-Forwarded-Encrypted: i=1; AHgh+RrUC+R7f/IzSXE4mLhcS4WncUHny9F749nabm9NuaW+mKQcb534AhOttVcOHTOH+b1bRV59GCjv6gfkqbXx6rD1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6xtNYUmcFN+phqyOy0saBIkI1yrDjIndIid7I1214JoWUcq7O
	qTheqX47Ud5vAbI+7xD5fR0FIcQjfAEmCLhTwepDwCkCrW+IpfVil2mK
X-Gm-Gg: AR+sD11/I6SX9A3eBrABnkIdWU21M3kmBJ5ZLh1b9wv+OwiqtQqXktNdVi3cn5tsxwn
	mbKAh9km4Z/mZwSJxU6ihlXZZitXkbEMPx4qWA/100oMM5UbCJZeCijs6ykyzSZTld8DpwCXfP0
	4GRb20WizLbUKx3Ng1KEBZZUPh3Bp98PNyLUBey36WP+5P4DeYbL6+7WvM4WvZv3HVwtVO3kQJC
	9Hi4voPfu3lcdRIahkokevBg+/85m8Fx9bW5KikSQaDftmffqwwxJpVDTn7TOa++CQ7WVDD85pH
	5p8AELZMgabfoJ2Ce4LCh1dadx9jjzY0bFl/r1SBgxQlhVzGpbcOGFPgkAfqAgsSzAHpBkbo1La
	U3f6XJE0/po9/ZlzcSfBCZiNcmr7JW/yux1s/Y4nQNbtkyYhAyAqvObWJL2ZKJPRZ8HzKLpBE59
	Nv2HOrsAO7bCdbCOtc0/7HYJChR9q0TSg9UHlvbDcBygVqR7sPlp5iXA==
X-Received: by 2002:a17:90a:ec86:b0:390:b3c5:e2c9 with SMTP id 98e67ed59e1d1-392846fd57fmr1926782a91.17.1786181931093;
        Sat, 08 Aug 2026 02:38:51 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6dab4sm5615231a91.3.2026.08.08.02.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:38:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Maxime=20M=C3=A9r=C3=A9?= <maxime.mere@foss.st.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	"lionel.debieve@st.com" <lionel.debieve@st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] crypto: stm32/cryp: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 17:36:23 +0800
Message-ID: <20260808093623.2744314-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_023852_053514_C22945B4 
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

stm32_cryp_probe() calls pm_runtime_use_autosuspend(), but neither the
probe failure path nor stm32_cryp_remove() calls the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to both the
probe failure and remove paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 65f9aa36ee47 ("crypto: stm32/cryp - Add power management support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index b79877099942..74f6e329b1fa 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -2691,6 +2691,7 @@ static int stm32_cryp_probe(struct platform_device *pdev)
 		dma_release_channel(cryp->dma_lch_out);
 err_dma:
 err_rst:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 
@@ -2722,6 +2723,7 @@ static void stm32_cryp_remove(struct platform_device *pdev)
 	if (cryp->dma_lch_out)
 		dma_release_channel(cryp->dma_lch_out);
 
+	pm_runtime_dont_use_autosuspend(cryp->dev);
 	pm_runtime_disable(cryp->dev);
 	pm_runtime_put_noidle(cryp->dev);
 
-- 
2.43.0


