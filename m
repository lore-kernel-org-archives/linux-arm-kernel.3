Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D3DC5AD2C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9y4KPReC2ZyGezILlDFx1J9Ati94r3HeNKJB0BgmAUQ=; b=LhpjAXUSLw/qB94C2tr5IYOjw4
	qMHhyclKqHzp3CqJxIvoWVK0TWiihEvR/4tSoqSkPgO3imsEECQsNRvIB7L7j126kTRx5+pX+6HVM
	fLJGQS8eZt2bzCH+zEURjWqEW9d08x9WS9kCUyAUk5xwVKLFnHxH2TkVETaX/jsjXPcYWBaXIY1b2
	x7sL4ZUSNn1PieIN0YKfZ9CZzWEydD+MdUeFcKsL4eHK7XHExnd8mcMU8IG1f6KoTYcq1UZirZZjC
	4u28UelcFLf7ivqlZ/t62uSQkiMwenZEevgtavCOQkeNFD/zYOUmKTZATc5hMIWutufhPqQgF0j70
	i3wTkWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsble-000000098fR-1G2R;
	Sat, 08 Aug 2026 07:46:54 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsblb-000000098f5-4981
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 07:46:53 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38deea72eebso262061a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 00:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786175211; x=1786780011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9y4KPReC2ZyGezILlDFx1J9Ati94r3HeNKJB0BgmAUQ=;
        b=eo+tckjS2MS/9ZTWou9TK5QS7k5UWmtnCpelMVCnAQovY23RmBvnNn1vM6xVZSBNrN
         jF6EJknbSoABneO7sy0xP5vBOW2psadI+EvP3tKhJlSSXQFzlEaGI6HEF43mbrwvcc1n
         tp89t+RRxchqyEnz6YQ6oCCseqKgfwWefoNqBOI/uJEBxn7yTpEl+3EngUtGs/U6h+YL
         +bKrGgaTVx+HhFhbpbD32LTdW3yevRbiBFboBwQJHFRPb47r0mMvIl/CDxVn1YuUXrq+
         vN8l0KrI7W+f8zHzyeoIy1WzzVhbGh3p4MwsbV0OdGMKgdsF9ks9+1nwycV0nmUpD7ZF
         C8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786175211; x=1786780011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9y4KPReC2ZyGezILlDFx1J9Ati94r3HeNKJB0BgmAUQ=;
        b=NiBe3PCmg4PBq/APy1L5ixyZFSYm5irDgTzwM/oGRfPsk1m6/yZh1LzCkM19dLO55O
         ly2Ko4tgngHVF+O6jmQAGkr7AvmFF6OuLgofaM+q0ppawcSjG/JBzlccKpwmmvZmaW1N
         hIjVY7PaeV5I8f3pxpbOXrLr7MrVYZwRK1Jj6J4QI1guAvyQg8So1TowVYIDTHAZ38Ro
         3joj5GHFn6HLNgv5v4Un9SgYEPN7600qP4SSwJ9PBiN/p5vDJIXUAHN3AkVgCoaeLYSZ
         4acPdZ0cCgCHeK9uSUyMy3wmjN/QYTWxBmB+88WPjP14eBoiTeXiBYjGFsyXa7VbJAfx
         8Krg==
X-Forwarded-Encrypted: i=1; AHgh+RqGARjVeE8ElSUmPaGYrw0jC2bcxj+MjGfa2cvwngTsaAkY2La7WKEmZVpcKk2XGGhY2DiUVBEf2oxJ1hQWkNO6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8uzFM5brt4K0GQ7Y/o7CgfPV6d0gmXl/SCG2ALwESX8pnQavq
	juWygeq31vq8bc8CBiiF5ClO2rCvph45Q4s/9YLYS+ufTXemw7XiLHnI
X-Gm-Gg: AR+sD11qJHjBC36WDaCilIf1fHoKgv3VUTK/EqA+uLwcJd57mV6HnAQkPrc9Pt5bRtV
	ew232EyNpuunp+7WonRA1d5cSD9Jo9bqi1S28EcWo//mntA3s7bXlhQjuISxQ+fQbXvDRDlwDFf
	V32DYWUjIPHIr51ClH+FR6aDTyXjepqFGNcp4csdzr0k41xoF2cqCRMia5NLOz1G3JBFg8CcURO
	IzpIJS/0TpImI/f9CQCnBC8OBxxGsQEFufG8e3/gdmBd72K/vzULr13U1GSuSGaC9486t8Iw6QU
	kAtCG8YHoJCJkgbOl1yu9g1olzYla+C4DxFkYVyQL5fjgpC9xMorXduBEqda40bVqN9nDLw3cRN
	xvd8M9MtJ09T9mTmgsOGxBRrlKq/mjm9KrtO0g42sYeaMVH1tuokbAQCXL39cTXbJ0y+zQA/wl1
	7DnZuGqtYl0DZ4ZCdEbPnB4YlXmb+16sT4ifbkQlxCCBacLQw9bBUtO8gBAQ==
X-Received: by 2002:a17:90b:2249:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3928242ffc4mr4644954a91.10.1786175211057;
        Sat, 08 Aug 2026 00:46:51 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd95794sm5282123a91.7.2026.08.08.00.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 00:46:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] hwrng: stm32: fix usage_count leak when autosuspend_delay is negative
Date: Sat,  8 Aug 2026 15:45:10 +0800
Message-ID: <20260808074510.2655473-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_004652_030631_E8A4E2B9 
X-CRM114-Status: GOOD (  14.66  )
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

stm32_rng_probe() calls pm_runtime_use_autosuspend(), but neither the
probe failure path nor stm32_rng_remove() calls the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to both the
probe failure and remove paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: c6a97c42e399 ("hwrng: stm32 - add support for STM32 HW RNG")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/char/hw_random/stm32-rng.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 9a8c00586ab0..6de4c52bd4d6 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -370,6 +370,7 @@ static int stm32_rng_init(struct hwrng *rng)
 
 static void stm32_rng_remove(struct platform_device *ofdev)
 {
+	pm_runtime_dont_use_autosuspend(&ofdev->dev);
 	pm_runtime_disable(&ofdev->dev);
 }
 
@@ -592,7 +593,14 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
-	return devm_hwrng_register(dev, &priv->rng);
+	ret = devm_hwrng_register(dev, &priv->rng);
+	if (ret) {
+		pm_runtime_dont_use_autosuspend(dev);
+		pm_runtime_disable(dev);
+		return ret;
+	}
+
+	return 0;
 }
 
 static struct platform_driver stm32_rng_driver = {
-- 
2.43.0


