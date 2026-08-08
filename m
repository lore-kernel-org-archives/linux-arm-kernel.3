Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C68C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MEwID2P1yRmU8Feq+ODsi1JwIGprGXNdUwcJktuS+tc=; b=CdUyL86xY0qN3tpK2bkLhLBTB8
	x4QX+PNZx4a5WpPEmh6kANHRu71I9sjpXy07h53nUL3dx+HElWl4AHq0UH4l9PRXrXmFXkCzWIzJA
	G+jwDqpeureUmuoiikxjFzrVBeM7sXTokqmDonycpj+hofur9A5oGPJp6u32fTorHsV+Y9tb/2TAU
	5WKAneiqBABDbBOoFj6KIWw1dR8Yhc1Iar2r4NvumWtCoCmnqZfBs4lXn57fWYCqA6vReHeFjivW6
	my/EkdJlYp1kDUBzoTqrYoMmIfwZV2NbrNIzgtOujwHCms8tPltiFo4u63Kf8rMJmZgPW2L45ErnF
	icOUqPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsf8m-00000009JIU-1RII;
	Sat, 08 Aug 2026 11:23:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsf8j-00000009JI4-3QTI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 11:22:58 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d032846c95so5267205ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 04:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786188177; x=1786792977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MEwID2P1yRmU8Feq+ODsi1JwIGprGXNdUwcJktuS+tc=;
        b=leE/hyOKcUHiLCasdCo7cMOFPEezGic0HeMozywmOxh7v+q2Q7OhLUizJEDGs1DUI2
         +G48JvNxMnSMWmDll9S57ikCAQ7uXnPs2KNKeM62a7PCOH03/QBWbuI8Zfdn6Auv0/2v
         esUkTFXUrQmqR2k0dUyIakhIQFVRXp09cOY3n19A+AnPerhs24GPjQlA0U5/zVSrRM5P
         8f6s9vwh8MCX/dAoMYrIOfVwSh1XwjsPwcYIvj/QWQ4T56WSXvGl0Inx2m6HqGzQrWvW
         SeZ9KBGtklZyAkMv0mbW6pLsm8jfo/8dkOMwvCCePOnNOTRi1WhQ6anASzc2yEKnlwhJ
         lsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786188177; x=1786792977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEwID2P1yRmU8Feq+ODsi1JwIGprGXNdUwcJktuS+tc=;
        b=iyNlDxJ2fVVdMHfLYV4fOcsYLW43O5D6ze2Dn/gbbhlTROF/2XOK82lvpB+/fpqSyE
         Wr3ALJTz7MNkgyS+tjNpJC0j8W6e1Kygyd9FnWyafy8z71W75OojDU8MkYVcBUK8THZR
         YBRL3zdrNajS8xVjQhA7WO0EBjImwjqVKRhuHpLCatNH/jjR8Fm23fN8G66+ATJf+kKR
         z0CieIA1MTHKRb900Dft6VEnbhx67p7nmJSKvQ43Gj1sQKrHwjz9PW0tOuYo4/B+ksOp
         iJQpv9BLUJ+rXtiE0Dz/aYi7O+OrbX13Zneb3Y65l5MGVoS9NCW2gVgsKSdraIbCiJZ0
         fQXg==
X-Forwarded-Encrypted: i=1; AHgh+Rrz73GDKk9fghqmGkqslnUXVmPVBqWVGflp9hUFNBUt1YgPdLclgnLoPDjEOMERZHbo3fZ4Brjjq4QGWzTfKkSB@lists.infradead.org
X-Gm-Message-State: AOJu0YyD8cqqduh8vUtuX6JEkoR5EzWjr3e1F+/zy+F4+1wTJtrI4BNI
	ki/gscY3UOZivzlJIfvVVkFqepzMJC6A1xXZaVJuCY+siIinxq4lIOwd
X-Gm-Gg: AR+sD12rd3rWdUvz0G0qUMJpZAnTEmIynNbjaMNIQ/sRtoRGFxawITJzraGi6JUeJuX
	7RsDdDIxm37wKzp1bmiIaZFTD7DGRpAb5xOGxbX8mh5D+JA8zmxW31BFPYYkhaavks0fQdpS0yR
	KzOuDqu6rEJ8OvHnLJ/BNlKE8S/eM3J6uI1JZ3CR8w+5k8CAMFUUFo17iNXFl0t4m5IrRaorYHj
	LDeTgF3M1jgHljV8FaOu+rV8VhhpRnsll3DAY6bZNlwpTHYiYsGcK2UZnrBH7ohSqsbOQywo4hs
	NoaeU3YaKh14ImpQI5IbUEfZRK3WqZTSPIhkm6pv6lURs7XhKXfxI+yA4CJrkku7F6XmPZgc2MX
	dCa1cm5osMG/5cFwQAeRfxYUtG4NLbmnUByLOqjc8QWHI6/+ZZPgJfQfimqL3ZzI0WR8cvSgvfJ
	XRy3FtOGUaY4NXh2MRD+7JEtAHAw8l0UmGsxBfa+iMZEw=
X-Received: by 2002:a17:902:ef4e:b0:2cf:b68a:2050 with SMTP id d9443c01a7336-2d0ca775824mr364281175ad.15.1786188176638;
        Sat, 08 Aug 2026 04:22:56 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeeda6sm18048745ad.42.2026.08.08.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:22:56 -0700 (PDT)
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
Subject: [PATCH] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Sat,  8 Aug 2026 19:20:43 +0800
Message-ID: <20260808112043.2781244-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_042257_860332_E4647F9E 
X-CRM114-Status: GOOD (  11.67  )
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

hidma_mgmt_probe() calls pm_runtime_use_autosuspend(), but its failure
path does not call the matching pm_runtime_dont_use_autosuspend()
before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..470c88f36d25 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -168,7 +168,11 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(&pdev->dev, HIDMA_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+
+	rc = devm_pm_runtime_enable(&pdev->dev);
+	if (rc)
+		return rc;
+
 	pm_runtime_get_sync(&pdev->dev);
 
 	virtaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -310,7 +314,6 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
 
-- 
2.43.0


