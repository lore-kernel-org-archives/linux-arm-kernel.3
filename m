Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D34C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fDbi4zALnFhUD4L9Nk6WABMkAbrLbdj/pPHftS8rUB0=; b=oCuhT6uGlJEvWiT6vjvU93jv/9
	PHpI2T7CLxeXf7rMTbtWJOW5NN/OIpQQ/Hny9Xmj7/gNnZUMDTAg/i06XElR3+FDB/Tn4IgkzCSAQ
	Gp5gH35ePbFC92PoTcgjp1FCpQNJb+T/kGWvgYebiUK8bWVfPKUTxP7DdfZxI86/N07b4SW9+Z9TF
	VMtZxO0mxGwChOgFs7VczPtPHGrclGS2cnA4WfREcPzvbYMyFIJ9lnYdhGxSaRa0Q2cqThkf9m0VX
	YjcsGKxMyJAv/0b2FSw3tsHpw6XWd3frHD47vfs7x4FJhTfCeb7WfGY4in2yxCKzWyG5OkyNcx9v7
	9V4FIb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdaY-00000009EXJ-0I1C;
	Sat, 08 Aug 2026 09:43:34 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdaW-00000009EWy-17Q7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:43:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc73e322dbso3597545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786182211; x=1786787011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDbi4zALnFhUD4L9Nk6WABMkAbrLbdj/pPHftS8rUB0=;
        b=iaK9rZItuu4jMm0b97hTrvNJanGIzwWWu2Tvlg+CX8MOBpRlMqr+E4FHRZ9IPTycZX
         Jcsjh7D50evoihk9/lB3WhaJSZLZ/JWinaluNtpHYmzHwh44XjPXg+qh73/dc0rLN241
         pOSB77M00KattInm9CBUEo9p3nHmTA8hd72gNmNjnNd4HnPbErwwj+CAvLmc8K5Ax9bJ
         Q/YwoKnJltgu0aFLOkH6ddNgV+KkeBimo5reDO+/ISln1R6xxJEWuN114NqI0Viaz0TJ
         JTB9XUS39n9QppiXF3tUyvZtjyHxBUidQSEuPOArSEihUf1lrlxF3ZtS7RrDbZysf75Q
         PhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786182211; x=1786787011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDbi4zALnFhUD4L9Nk6WABMkAbrLbdj/pPHftS8rUB0=;
        b=ZGF6SvLztuPconAx4YWLXAjUVmkLjurULPR73kUupz2xf2644hrT4LxvHk9X1zIdhH
         TltqNWNv4aCE4CMdxQ6TgzrzE1eVvtylAJIwuaSJ2mmoLxiuPPMG2OLVAkOXBV/olkIE
         KUO4m0+zQfCoG0PtbfNf8zyC668WyImOgo/vw6JrQVvNTs8n5Ha9H+JWk95y4FICfZ+U
         5Mvl2xIs2qvF/tI44awOl1PqzY7T3Hd/nCN6tknI15Ps7xZTS+l5oP1OyDr7agj+mFaw
         FozB42/bRiVvBa3Ss837gSTud26eEJWwNfBNWzvdFTDtbJiiYjAmglEKBLehIYNMcjq2
         1dyA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+pqcG85qq9ogxrrpRoRUVAfLG6EaZK6QD/y3L9GeVFRb749Je9tIBUU5FnoMOzue4FJlXGft8yv5zK4j1fNbX@lists.infradead.org
X-Gm-Message-State: AOJu0YzC+P+hn3TyKCGNee8OkqE7EOjCdnlG/3xZangMBCRZ5eBo94Q7
	6C/+cU9UhDjZhZQGin6iHk/E2k8KV9E/2ySjrYvjyxqMcT92+axqvPTJ
X-Gm-Gg: AR+sD13OtFpMr1pZk36yShFS4p0Yac510+j+cptcwN6A2L2Z5p2cIhVpI25rzCp7CoL
	epX+0qmy5K27pVee3AJPXs0IoGS+toE4ni8ZdaIHsevOEfSaddcwGNvAohzPT4Wa9IdVp7/4GLm
	EDnCmp7hiTlui33HoNAivCk2OW3cOge11v+cu87S6lBtMZizpyBZtxH3U7JfTqTI0K3/98Gc07S
	vmHiZFrRBDQKiQr6106LNcTfYACayRTxjTO2sAV9iZFQAScc6I7Q0SGh/m1qhmUn3fpeQ1FhYK0
	BSswKH4RhOhOmlNq+icQwvvtEIaxB5Z+MUzw33BxifXVPhEuEk/UOSsNpgV5NITtWCCtpa8qBW+
	PiRS/0q/8QJwPkqucrCFNfhhvPVwYCu9gI2VCONyFOVc9M+Dr9qCqfXLQYlRntbt2Ww3OaUJIUM
	96eMThSBzDTELZW9nO5k9mS/vOSRw1c6kh/Le6f+QVx/2cccw2ErZARA==
X-Received: by 2002:a05:6a20:b598:b0:3c8:f342:132c with SMTP id adf61e73a8af0-3cb85e99264mr35264761637.11.1786182211362;
        Sat, 08 Aug 2026 02:43:31 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1b3eb2sm1707505a12.13.2026.08.08.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:43:30 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	"lionel.debieve@st.com" <lionel.debieve@st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] crypto: stm32/hash: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 17:41:14 +0800
Message-ID: <20260808094114.2750088-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_024332_303937_002E86B9 
X-CRM114-Status: GOOD (  11.76  )
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

stm32_hash_probe() calls pm_runtime_use_autosuspend(), but neither the
probe failure path nor stm32_hash_remove() calls the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to both the
probe failure and remove paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 8b4d566de6a5 ("crypto: stm32/hash - Add power management support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/stm32/stm32-hash.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index dada5951082c..12fa1a8f67eb 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -2456,6 +2456,7 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	if (hdev->dma_lch)
 		dma_release_channel(hdev->dma_lch);
 err_reset:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 
@@ -2482,6 +2483,7 @@ static void stm32_hash_remove(struct platform_device *pdev)
 	if (hdev->dma_lch)
 		dma_release_channel(hdev->dma_lch);
 
+	pm_runtime_dont_use_autosuspend(hdev->dev);
 	pm_runtime_disable(hdev->dev);
 	pm_runtime_put_noidle(hdev->dev);
 
-- 
2.43.0


