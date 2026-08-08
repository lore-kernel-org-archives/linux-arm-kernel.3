Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D73FC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 11:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BtuOINh8YkDKYuvWIfvZnBXqzDMcNfimlyPxz7Xqg8g=; b=NGJjXkR12VtSspqeFzqWIXASd/
	z9cq1WSaMFhyu3WOWJhOE9okmPwIm3ml5EURfGO45mPkYFQUdZM/6zP4is+HxB5t81hwxP7mOIQTN
	K8y2AGY0m6tK1scBnPnvj0UdChNt/FooBDeoa4tZ6NJRUpPQiYIhZedOqEfePI2CjfMKnFuyrhZE4
	v+3TIYbtRKnR8b2ONQPpvzbdPly72mTdafWOzJau32mwiJVdeZ9Sz3wLh2nBlLfln2ORs44vt0ZFZ
	btAQDLIicp8XgN1gT8ce8Tmnx/iqphTj3vXN1nzNBFHlHPZH//OyjemV8mQzcljMfx8ykFQi8G8xC
	FAbIVxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsfBn-00000009JTE-2v7M;
	Sat, 08 Aug 2026 11:26:07 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsfBk-00000009JSl-226c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 11:26:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38511175ad3so369107a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786188363; x=1786793163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtuOINh8YkDKYuvWIfvZnBXqzDMcNfimlyPxz7Xqg8g=;
        b=U/Tbyu2Df+zD3OuV1Q+NqCtqQDoIgMDrFq9OwkLiDgU8uDShhwPsC5yRq5NTv9oly6
         PRni56/cAuwUQwlDNGFpuSsQF86sj/hTojEqHkgKOzEzVx26kGSCM1BxLU49xpRlyqxb
         YCcxpGSa3M8S6i033BkCI2ZnpJsAU+1e3ObjApc/Dp/TIa6NeGaozvvfEpCIPyzedR6K
         6lsZr3rFzEerrtsk+e1Oyaic/lszZunLc222oFKlzJnlqNDyNQOy6eqguVeBa4VelAXf
         K7qrCwBzkBdrVgS0xhCX448/aKxtME3sFcfBscaQwLwsvjxS4XAb+JMEna2JgciSmTF0
         QjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786188363; x=1786793163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtuOINh8YkDKYuvWIfvZnBXqzDMcNfimlyPxz7Xqg8g=;
        b=INbk+T3sEPOq/avCb3mQLupQvuk9DS6vSMUccthrUeOVVjCWScTWkCVLXIrZO2OyPB
         lHcOKuUepQpEVxADGvxysR6xp8FvX3LMaEK07cjmPEfzXBVxn8b/kQ9yxp1xBBhhZmmo
         +WPAcduHM9NdAs2pXMicPf3NUWW0Jp1epuFore2wnytgs167UQs3938jMImb197pBOe7
         lVvmqTPGSiTEZBSuAZy7sW/diNzWj1YBNuVh6/XioTW2nCrUmK6ZKxhKaovw5MYFcKtH
         T4bROP3DKtf75RnjGSrZe7sv3cfGWswIrw+N2XBvrriJgUaNf3PIi1n4RdGRsXb4/cLB
         vZog==
X-Forwarded-Encrypted: i=1; AHgh+RpO8Y22WWzkCy3mUnFkqkZejUPdHHmBT8qso2E4lc3dEHM+nU5gcHAFeyGSw/wRKyqUqnCVh/7UQm11lJSlLQKf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzldw95FceGnP2bvcnqTgr6uxfcUvqQYNKRusdHTGKvljecbCeF
	TNJSez7iVJwU3t7dh4J7Jz/s5CAuQKviIWve7GKTVTG6Iv95ifegpxlT
X-Gm-Gg: AR+sD13W1dFvZiPVe7wgRG2snz3OGiJEKWTKlCKppuByFtp0g0lmy6gPzk34CebPf7X
	Y/xHIrCPdx61FOe/+d91v2+pmcYO3WAmK6pKTc2TTkxbE+KEsnZokHTWzUA3/x1HF8omm1TFkmF
	ZHIPqFOyLSXeFO/CBv6Z7K8gV+UH/xp84C+YaGmQY1ov6Ee5mmBbdXKJ1L7GaTkty0y3Gd9O4iM
	mBxnjEusNHc4E9CsfFhSkiUtDd3X2gO4uyj4rCTw572PTogB24ersEcIR4kRzZ+Xd/xZuvT7ube
	G6S2Sht56iwWUXPE3rafJzYrNULqHGy8Q/6Olg8spnNO1Qk0MON/sxy+26Kg9LuAANK2McSmEiZ
	RnOlpP5M99GFGk+mZMvkDM0l8ETGJDWqeJ9GLau6qPrbmWIVwKaQR/2C9aecTYq2P+s4Alpg7sP
	muo9KuV94PKRcUbbVp4I+jpC33AyhqPNmmzG8gZno8CjSovOl+7ow=
X-Received: by 2002:a17:90b:1e53:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-3903c54cf2bmr27833795a91.4.1786188363482;
        Sat, 08 Aug 2026 04:26:03 -0700 (PDT)
Received: from lgs.. ([101.36.107.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dbf82csm8235726a91.1.2026.08.08.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:26:03 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: qcom: hidma: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 19:25:51 +0800
Message-ID: <20260808112551.2786782-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_042604_956418_7ACA1DFE 
X-CRM114-Status: GOOD (  11.16  )
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

hidma_probe() calls pm_runtime_use_autosuspend(), but neither the probe
failure path nor hidma_remove() calls the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to both the
probe failure and remove paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/hidma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..78fd765c81e4 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -893,6 +893,7 @@ static int hidma_probe(struct platform_device *pdev)
 		hidma_free(dmadev);
 bailout:
 	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
@@ -930,6 +931,7 @@ static void hidma_remove(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "HI-DMA engine removed\n");
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.43.0


