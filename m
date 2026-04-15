Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C19F419B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJ/g0M6nIzsGKbX6brZJSUwMyF1dOX6znsTMtk5A1OI=; b=jQIkEGg+VipJgLn4FFcmPh7WDu
	Up9FAXXfIwE6Wbcz0VlRUPFXGP8b+766Jo30msBhzyAH2iSAVQ35lzUCB5V0I998UOR1u+cI7XsMk
	SjddDaTs+FLziI0TKq41aIVfDzcysOU1hh2kPLSIUzYFGZlCYs3X9OXaO8F5T25ga+kWbhFIEIp99
	QCmYCVyhnRKwOpb8aBMfiLhYIlJnyAjkWuxbNUuMJJ0kOviEGS+m6pmwp6MThbIksQ98cYSIAtPvD
	4dQOZHDxL9TM4rRgY2PNNZwWDpFGtre4CW+p30Zqdb9MWYq8d8ctNX9sryiAY/bD50QFi5qdIcTbP
	eBY8+P2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4Fi-00000001T2q-18fH;
	Wed, 15 Apr 2026 17:42:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4Fg-00000001T2V-0h4q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 17:42:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2aaf43014d0so43029165ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 10:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776274931; x=1776879731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJ/g0M6nIzsGKbX6brZJSUwMyF1dOX6znsTMtk5A1OI=;
        b=fxj1qBmEg5Fg24lGDsOPLWpP/G+XRkrQ4mQ8oGY3ffK4O5IUcdxvCfUmimjK+c7dAM
         9QI2dL/hdZTnp6b9UpC6iCY3aKa1W8dTM+pGORuYMq51vqWTu8x/up7nKgHlJlVPmMO8
         ERaMsWEUkgHauQNhj0Vihii1DW6Vs3nHLJ5bG9IPcNGdipkAVgPhYptgWInp6Rp/cu7A
         PdlrywrQBmQf6tGvm+qVRzviGHFNX/Q4Uz28uPWGOH50jetjrlK6JIW1dos5rA+08t8j
         c6Lx8CTHWVpk+c3vBdLXcvoDkk9X3hRkGdw7LwEKIjL66Z8a7VBAP+09SbNpVDRShokJ
         dh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776274931; x=1776879731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJ/g0M6nIzsGKbX6brZJSUwMyF1dOX6znsTMtk5A1OI=;
        b=gJT5+lF8HA9QsB2EwPce/FTEPODGsqDwjKtRBdcMUeBrJ6z7mhJ0LlKS7I5AcTI+Ew
         BqP8GTpSX88CYlgn5L50Cgw9iuqJj1nE9SMTNfWRFnYD75R+g9arrsOg7BmnaLBCH2h6
         /xNTdAcsqUkl1BHJwuN+uvSdegmLFShhUDsERWtcEo5h5g4HJueQZHV4/aNB06NdGP0F
         9N+eg9AXs8ZwVi9XN9xNurBGoJzBBil08rn4tSG7Gc6MZJBsdv0naUf61l91dufKcSmU
         O3lSs56vdu1vkHK09/YHMFdJem4WaK0pIgOzhfLC7vR1vmS8vA9eYND6ru/Ytsa55KZ/
         2Z7g==
X-Forwarded-Encrypted: i=1; AFNElJ83O8/+9lj5mwLtOY0FkA5h4zf45AZYez6QBpOZgO8NePnhoOL9Nvx8dJYI/+YtUeO+tY4vfpha5KCTnf8ux/s1@lists.infradead.org
X-Gm-Message-State: AOJu0YziafI5G+ZqE+VRZxIH6W0q10/I5pdc2GAsxc4qkpsA5AC6guUG
	W/kp47iTK73fFXUsCUfNBnKxv+V+NdccnyjovjAqrHJp/nTHU4xMY0Bz
X-Gm-Gg: AeBDieubhLbQKanlw2s9vK5Hy+Qayk/wjBM7mCNGYHZqq2y2S/TkSIPZfONiz5KzHDi
	uY8S/NVt1ibZ92QUVfzL4j82D0CeEZYcdkUtF0Do4igRHz5MhuBdIBRPcdl0aNdKPJcUbM2TOem
	uvJ0+BN9nY8U4sFZ8mulrgj6PlmVdyeOMLJQ/ClNi5/tUc8ocgaej8CEBgq2HypgSptflg+ePdp
	WRPT5oN59Ex/udPxUcfj0FQ+WvyM4VudabHudoAz9/iURo9/YwojY67a07MxiVwtsfS9akF69WL
	rU577vN53fRbsugb1HankS72pL5FJDKyCrUiUQOiAGWuioYXwKcs0S8uBho2CgADI8IKXfN+QiD
	FG5OMq0OmrOhll3G5UUb3UJPfFhzgVKV0sn9cOn3tpULOOgxte7lZpX660l8yXR9ck9hLXL47Yf
	sDBc4aZesaywe6tKsAELLSTGUec+dOcXcBejXR
X-Received: by 2002:a17:903:b0e:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2b45ceaf83emr139663995ad.4.1776274930985;
        Wed, 15 Apr 2026 10:42:10 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:48dd:8f21:beaa:cec8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47829a4eesm33777805ad.60.2026.04.15.10.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:42:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm_pmu: acpi: fix reference leak on failed device registration
Date: Thu, 16 Apr 2026 01:41:59 +0800
Message-ID: <20260415174159.3625777-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_104212_206246_9BB7AFFE 
X-CRM114-Status: GOOD (  13.36  )
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

When platform_device_register() fails in arm_acpi_register_pmu_device(),
the embedded struct device in pdev has already been initialized by
device_initialize(), but the failure path only unregisters the GSI and
does not drop the device reference for the current platform device:

  arm_acpi_register_pmu_device()
    -> platform_device_register(pdev)
       -> device_initialize(&pdev->dev)
       -> setup_pdev_dma_masks(pdev)
       -> platform_device_add(pdev)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() after unregistering the GSI.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 81e5ee4716098 ("arm_pmu: acpi: Refactor arm_spe_acpi_register_device()")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/perf/arm_pmu_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
index e80f76d95e68..5ce382661e34 100644
--- a/drivers/perf/arm_pmu_acpi.c
+++ b/drivers/perf/arm_pmu_acpi.c
@@ -119,8 +119,10 @@ arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
 
 	pdev->resource[0].start = irq;
 	ret = platform_device_register(pdev);
-	if (ret)
+	if (ret) {
 		acpi_unregister_gsi(gsi);
+		platform_device_put(pdev);
+	}
 
 	return ret;
 }
-- 
2.43.0


