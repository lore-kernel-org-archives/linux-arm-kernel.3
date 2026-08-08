Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B828C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K/VDwU6YKDYusuf3bOyqkfoe3Kms6rSYmSwfDWd4AYg=; b=I4UFmzTZSS2u1ItyZAGqvyPKyb
	IKqBjUCSdehi/XJKeuh/xTbPMewK6eJkq7Ek1eDL+jqQ49OHTfF7V/OWnQh0WXoFi4WA55zJ5Vb/8
	EYmrEUEpAgwKW0P6IRZ0r4g10K0zWQTq3rkAwrKvQ5FAduEhxMm8784MDupsvArq6XMeyG+RYdx/R
	f65XUxiCGl9h4lxV7kAnuajzsz5tmChK6opBBIGaSEIVZ3epN/CofPDBK/0Y41UyfovpnP/6ld9VF
	bNKwnCfxxHl4UqY0znbCvpAgH5biExx7cItDQHU2OdY+KKJ0xgP5YHTLvpCjRCEGITiretPjkacJT
	rL2jhr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsfkC-00000009L00-0tpD;
	Sat, 08 Aug 2026 12:01:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsfkA-00000009Kzf-1psL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 12:01:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cad8076b01so4811435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786190497; x=1786795297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K/VDwU6YKDYusuf3bOyqkfoe3Kms6rSYmSwfDWd4AYg=;
        b=bndhBDkHI9QHtY91FH5dcznNi6U50AQ8R0paAgJO5VnKElPrNKwg8MA5wq4oI1MMVD
         5VKXy+9m/rlZzwKZSyT7QL2cRw3pTa52qlm4hou+QmjwNwlMqujWghLB1Rr3LzuyfaTo
         4s5zvqZtvoNXdA8wkox16R5GPk7gyWRSTkOo1Q5sO7Flo76czVef+aLhpZtGgbB/jdTr
         uJ+ojkb2ZKInMw0qRUfNaR+i4I/HNjoKN/iF789eNAg4u3Dnr5k+d4p5xKMFMjqKncOG
         K9UuS+d4ejitXQfrDn9FRxLGNSL/y9fdiuj8FunXEmfuhOCfzZDWVuptjDRIIZO6rCnj
         43jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786190497; x=1786795297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/VDwU6YKDYusuf3bOyqkfoe3Kms6rSYmSwfDWd4AYg=;
        b=S/E0tH0WBu0ukCFTeAIpulsaRhjbr6CnWjYPZi4PmmFPfwvH5vTyrjTYtAe6zzBppI
         RPE3mfFVrepNhEo+WYIARvWV5jVjODUhr23ZitzYicMwSQEFGUsQ26e4r/K7Y0d4sp3Q
         P8di/7IBBGJKxeE4ZiOLOxAHI+4SMXvE/RN+l4YliVwzJyutWBn1oZpbLXCvmpZ01pLT
         GJ72eokD2IlcVt6YKp9w6Zv/J4CFCvTz+I4lKAcBReQo4y2rbUdU6ZOz6gORrMrLF7Mh
         THAGXWtO5hNh+CBi/9Mp0yW2GOoGLwRZXFIuHRalGTJAfsxHZ+Pl8h15ndFzTbyJ8PeH
         QorA==
X-Forwarded-Encrypted: i=1; AHgh+RodSc1BYvsiQO1YpiOGuGCqmJShy+DRURfcC/L77NROKrvSrKcTqBTzOD0CxW4S2qPIrWA0IxPkag60/kXH4aVY@lists.infradead.org
X-Gm-Message-State: AOJu0YydBJyXeBStJZhJoQBLRh7Mo1RDINi8GSKarOVQ909LBwd9dPHQ
	9sr/2NqmrMLcNxiBZgTHJbgkTezVGmZmYEEsoVL8OeVs2imsmb6FAw9B
X-Gm-Gg: AR+sD10ou8M9mkvy5WBDDivhYoTTmQKsw2NiJ5YwjMs4U6besSd3Hp9km8Nl+Hrb2jH
	Wq8NF3aUJSP15TRzwTPDF4UmzSy5XXXwyhQ+7za/h4NZ4c2IBpNHjj2MiqhGMvBmFNo1795Yk4s
	Fc/Loyb05CL+OZpNyuzpJxNe4FwFlZNjPmyCDnGxXjRZIho4sSekybqy+5LVT1KtqDcsDBt5IEo
	tHW0B2FnqE25BJrQqCA0RnZlnBAJHMigjjDtsze3aFWVLEuE+xn9yc4i5TsEK+kKCq4QpsQMSGG
	WmTfgFUHcB3jUPoDJEu5TdZ6Jg/p129OOMm0N+B15kDn0gr84DgALcsgNejTALIoJpBdDKiK3or
	KJAxV8UkssB1b5YbcWOrwa4rI8Ou7p55e5I4OkMzWcwPB/2XLCfvxGigoCtJ6q6TvOSbARCTOXE
	kNOjar5o4EX1/ctz6BpGPITwgkHNQPeKm/T2LczGU+eH4=
X-Received: by 2002:a17:902:da87:b0:2cf:4c0f:5129 with SMTP id d9443c01a7336-2d0caa03fcfmr299424925ad.17.1786190497182;
        Sat, 08 Aug 2026 05:01:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeaa88sm18073605ad.39.2026.08.08.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 05:01:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Kedareswara rao Appana <appana.durga.rao@xilinx.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] dmaengine: xilinx: zynqmp_dma: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 19:52:28 +0800
Message-ID: <20260808115228.2798481-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_050138_501179_9A1A9819 
X-CRM114-Status: GOOD (  13.68  )
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

zynqmp_dma_probe() calls pm_runtime_use_autosuspend(), but its failure
paths and zynqmp_dma_remove() do not call the matching
pm_runtime_dont_use_autosuspend().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
failure and remove paths.

This issue was found by manual code inspection.

Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f6a812e49ddc..635c3f6cc5c2 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -1116,8 +1116,10 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 	}
 	if (!pm_runtime_enabled(zdev->dev)) {
 		ret = zynqmp_dma_runtime_resume(zdev->dev);
-		if (ret)
+		if (ret) {
+			pm_runtime_dont_use_autosuspend(zdev->dev);
 			return ret;
+		}
 	}
 
 	ret = zynqmp_dma_chan_probe(zdev, pdev);
@@ -1152,6 +1154,7 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 err_disable_pm:
 	if (!pm_runtime_enabled(zdev->dev))
 		zynqmp_dma_runtime_suspend(zdev->dev);
+	pm_runtime_dont_use_autosuspend(zdev->dev);
 	pm_runtime_disable(zdev->dev);
 	return ret;
 }
@@ -1172,6 +1175,7 @@ static void zynqmp_dma_remove(struct platform_device *pdev)
 	zynqmp_dma_chan_remove(zdev->chan);
 	if (pm_runtime_active(zdev->dev))
 		zynqmp_dma_runtime_suspend(zdev->dev);
+	pm_runtime_dont_use_autosuspend(zdev->dev);
 	pm_runtime_disable(zdev->dev);
 }
 
-- 
2.43.0


