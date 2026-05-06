Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F22CCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wlAad2pyl4+gxQL1nIcAxfpfgfSowpzHoOIZQe3GlmM=; b=rortLv8/skn9/wQth7kR/IqbqI
	A8deUkjUEmDYCQVq/1EwgZ7BPdD8ra7OvTLX4cX5039BWQ+pWBsySln6zd0w8Um7CnnauRZgPztqt
	udC1wJG4ZLmLuZ2bLWPeS99psEQECOqkZiAHa33xVGy7dNOCIQLZi5CwSZh4XECkY6rYRKgwB0aS6
	5CVF//6LrmLcYNS1m7/sfzXJ9czi5xWeZk5EcV394ArpVMep6dfjF4V1t6cvmjKdp+a2PBZj+0Ztz
	/1nKHUIVuJmoGDiHGoWK8krtKEWaTMaIMApvSnVslqibNC2CJ8ts9H5iHmvj2G526Y6p4zs98RfAS
	Scx2f3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeNF-00000001N9y-1mDQ;
	Wed, 06 May 2026 15:41:21 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeND-00000001N9D-419h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:41:20 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a860667fabso5412433e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778082078; x=1778686878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlAad2pyl4+gxQL1nIcAxfpfgfSowpzHoOIZQe3GlmM=;
        b=eDN7sxikie/BNFEE+46q7eO+h5RsxQooGlugywqOQ2XTedB4/7jyaba3U6hK8TG012
         ZI/iWlytE5LQN3IgtwIl+cdzYbkOMZCGxXJhrAuEIh5bZdCMpIgCGecRMhKWw8GTU7DJ
         EFEQDCWTHgp+DxSckDbdAhhpyRv4X2fGdcUUz5lyCfhl5LCXwXCcnRh1RxmptJkwBKbM
         RIw20bWUXA/t7H1owJ0S/8Hv/iH/341IcIk3+3nc8hjlObdjacDdXrs80qBZv34b9JvI
         HhywZrWvLr9HJ3gPrQNMj/j+lB3ro5UnvX3ivB57i9z+uFYMyvq6wktIdsta/+63j4cI
         +Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082078; x=1778686878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlAad2pyl4+gxQL1nIcAxfpfgfSowpzHoOIZQe3GlmM=;
        b=TpkxjLlYLcRUVI7ub6kOD6X3gEyu+8F3Fyu6NeC++xkTj8PAuW4lQNpjKbo2Qt/D7H
         eXyp7D4AXvTxM49XlKEHTQAu9rpjw7CNHjzG57Mbnh4iQsOAHUd+BDWef6MhK8bIfzJ3
         JHEZVozpJEVPgHgZX3e6Rs1ZBK8YvcX+oiNMUThex4fQDCNusv7+xSn7iow5qWxs6kpF
         in3CVsJC93aOKg+nVqZhJUxgTFU/l3girewe2FSvB6FhD1eV781kodo2K6PmfS9Bt2Z4
         LDGsKCtyJ1fuUYT+26yBrHluii2N3CQHn8BWifYJG/0KavbxeaGRyL6olaPhg3Yc16r5
         Rbzg==
X-Forwarded-Encrypted: i=1; AFNElJ91Nm3nylNc8axqSOHEvFvM6ECYyA95Rnhz/kVzKqAQzL1kt9moeDKAZV5H2uj7bCcQbcjSn/LpWNS+qTaQKfy/@lists.infradead.org
X-Gm-Message-State: AOJu0YwuwFH2BG+k9Vm/BTmJ1S/F8XrtA1iDhbGdTqiLbyrzPfUyJIOD
	TFbcB4sX6yDqEC6pxf71DytQja79TWrIRd+tzEJLjCz1yO4k0ixzDfBz
X-Gm-Gg: AeBDieuwk+qgod+88nNBaKXkKjWG3xW6ax5f+zgjXSfStMQR5L5cnjk7q7SfEhxITa5
	Fk3SgILVB/GGRkeXCAKNdN1Fa4m1rLJR3SIHDkkmyrWVeM8clNMNunBuUuz6tUe5zJZlzu5q1Ie
	GWnE6LjafZLrt3gEHZRBXQfENVxD9Y68YIokKSMvfdRObAwpde7+8cDu/maKOR51rFk3zqJK2se
	6J5ULzzD46MNBlF2G1fjWrxsyOforyQezZtJaruqJ8T5omsmbQynMgHOtlfLpqOk91AyT3F1U0y
	ABNp/s/zyTrn4I6y10vyZwqWZQELlFVhk7/6LHK7Z3w/tcw2DoceLkGAzVAwiHOAgA81QsZZSdp
	p8wPNPx0zbo/qhaqmEqVoL8NtFZfY/tKvlw6YYcbmqDPTLuh3tH3tT0PMHd/GSaQSWbkT6/jwo+
	u8tp74K2VHVu3JUz7PXkLAXEOCyB9ltPnnU7Ct69VGhU5YlXFylxswFmZFJc9XZ3fGSk676+tHk
	v4=
X-Received: by 2002:a05:6512:3f06:b0:5a3:ffc6:6600 with SMTP id 2adb3069b0e04-5a887ce5f9cmr1433469e87.31.1778082077493;
        Wed, 06 May 2026 08:41:17 -0700 (PDT)
Received: from Shofiq (87-92-218-151.rev.dnainternet.fi. [87.92.218.151])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230cfdsm4950379e87.21.2026.05.06.08.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:41:17 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: nm@ti.com,
	ssantosh@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v2] soc: ti: knav_qmss_queue: Implement resource cleanup in remove()
Date: Wed,  6 May 2026 18:41:14 +0300
Message-ID: <20260506154114.2288-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_084120_007398_D819A53C 
X-CRM114-Status: GOOD (  11.85  )
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

Implement the TODO in knav_queue_remove() by stopping PDSPs and
freeing queue regions and queue ranges before disabling runtime PM,
mirroring the cleanup performed in the probe error path.

Set device_ready to false before cleanup to prevent any further
use of the device during teardown.

This ensures resources are released on driver unbind and avoids
leaking queue/region state.

Suggested-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 86d7a9c9ae..a064457878 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1873,7 +1873,12 @@ static int knav_queue_probe(struct platform_device *pdev)
 
 static void knav_queue_remove(struct platform_device *pdev)
 {
-	/* TODO: Free resources */
+	struct knav_device *kdev = platform_get_drvdata(pdev);
+
+	device_ready = false;
+	knav_queue_stop_pdsps(kdev);
+	knav_queue_free_regions(kdev);
+	knav_free_queue_ranges(kdev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.54.0.windows.1


