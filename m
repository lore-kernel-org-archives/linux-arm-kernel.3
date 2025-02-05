Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF3EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 03:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6rgULuGtXE32btbLFBjKmAy8JieCa+OnfxHI6tl0SM=; b=KqQBRth73SL7eOakwpqNRPkFpz
	2I533bgbpU8D14mbC6X2FgXLUgqCeDrTqdDxtr6KFPAzsdcxTrkuxdY0un0uOUOgDfd+f5k1MRnLD
	njnOON3F1elG0z9QalRFnUI6OjZueI/jPk7J9qbWx77Raqad+9sShrWdfEB4xg9Nij1Wx4EIU9Qor
	GSSw29eSSr5PGXHoi101vHo2lmHUgNss7d5n474X8LBzQ/FAIemtd1AMFurq+MpI+cHNpkHdU4kr/
	c9DLGxMLS9DXfCuhdq9Yu8SfNgESX9GPT4Q7z4buJvYWQyOVe3tWLd0DvDy++UZzf9lyYMB+Q2KIv
	ICQSvR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVuo-00000002DDR-0MVn;
	Wed, 05 Feb 2025 03:17:26 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVsA-00000002ChW-12dl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 03:14:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso686565a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 19:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738725281; x=1739330081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6rgULuGtXE32btbLFBjKmAy8JieCa+OnfxHI6tl0SM=;
        b=QPZns6/OCCQeJ9lsbFPFZzrBCR/aRLLGfBUfc9WrPF6uxT3BndwoUT47souh8Lp1v9
         /C5CSmJP9TBu+wDyk0JUYd1QUV2nfya/PYYr9VoD3JhOnBEF3yfKfDmPjm6CxH25LK3P
         iDOGWT9hJS23sSfsKOeOZ3fmLtnD1HhBbD0j6ual2lTuXKTojuI1F4ESTvVO83i+uY7/
         TQd06Euzk5sOlCK+Fujkm2x6LWDgs/gJ51xuS3pox36ZV7n/dbmQ2mbtgGPENNNsv2NJ
         lYRv6aKeTTvb6jduNKu9buqflRFqte67+NuKF95DhM4fPshtv3L3nmtk91MesqXA68pP
         TYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738725281; x=1739330081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6rgULuGtXE32btbLFBjKmAy8JieCa+OnfxHI6tl0SM=;
        b=BvOZ/iKSWBn7BkZNFJh+7SH9EmXfsCyClrpXguEddZPbftqk8RNtYvzumxzcHM1LDe
         V2lQ1KQdZVU/B2HUbkdh5P70uATsAwua53LfqISXzeyNuN8twhdAFyC0sYOzj1TbvpK1
         KjLLGmmb29jn1bnncVyua6Jt0NeVIEgKkLtH3BH09ZOf4GBfg5Egwznlc1Ktd5yHGoXN
         8LMyHBzM+WZQNeqFXKoCaNu+d7BTqkcuS/RIc+gTNzPHmJHUQjPMIsio8gIt9Hf1XsFq
         4j+timlolTiSg4qpBnIpTg04QtVmfryfodUDsUJPwPixCrf3MwZkcI9xLe6vP7oI5cmc
         MN/w==
X-Forwarded-Encrypted: i=1; AJvYcCV3zZFqe5gx5Rbbl5t9lBQbUPP3xTKyvBAAC6x+mhpAc0XKt2Utk/C8TfiEGu5OPzsiJELdXQw5gux+17AwTkEw@lists.infradead.org
X-Gm-Message-State: AOJu0YxpbZ8UtkY37hhDwkEAnQnPbCMlNN5gQT8Bsx70CMnAZGi01FxI
	is/duMs9LVbqfVKObW4dKn2lOw7wX6TeyLXwJo9Iueb6R2FdC1IrcqoUKz7M+hE=
X-Gm-Gg: ASbGncvVO40QhJwibRiBHAHDzpFEdUhDCw8M/DvAMKyyGcjiWL1agAsFLzviA8dvnug
	l+ruJWA11s1ZmWTqzjIh45khABzAuXe1vQ1YrPezm+QN3wVDS1mMIwDS1LL5+meMjNOzyqMDm+h
	QxLnhoHkxdmMfkf4gVDSzKZ1YIgJb4NRae1AIPgDJnn51o0yordUqAJg2S4cTojO8+p9+FV3HsZ
	GMQLDQ0z0bb7+8OXWKpO2T1SsQmOm4q0XAYorcV0+6dFn5IYkedcKds/XQis55pKo9EapobRrPd
	3ZiHYFuJMmTdl6ZlHQR8PPD8fZSXLpte1UKCibo2PeR1g62GZA==
X-Google-Smtp-Source: AGHT+IEgWoIyo+md6WjJjQsXcbOKmrxi/N2/4YdNia+eqfR9OqZiWotZNEXqD46THuMV2yKqlqjrYw==
X-Received: by 2002:a17:90b:1954:b0:2f6:e47c:1750 with SMTP id 98e67ed59e1d1-2f9dff6c294mr2267628a91.13.1738725281126;
        Tue, 04 Feb 2025 19:14:41 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330342asm103509115ad.193.2025.02.04.19.14.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Feb 2025 19:14:40 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 1/2] perf/dwc_pcie: fix the incorrect reference count
Date: Wed,  5 Feb 2025 11:14:24 +0800
Message-Id: <20250205031425.67265-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250205031425.67265-1-cuiyunhui@bytedance.com>
References: <20250205031425.67265-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_191442_288625_DDD552F0 
X-CRM114-Status: GOOD (  15.51  )
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

for_each_pci_dev increments pdev refcount. Call pci_dev_put after access
to decrement it.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/perf/dwc_pcie_pmu.c | 42 ++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index cccecae9823f..4ac53167d7ab 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -553,6 +553,7 @@ static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
 
 static void dwc_pcie_unregister_dev(struct dwc_pcie_dev_info *dev_info)
 {
+	pci_dev_put(dev_info->pdev);
 	platform_device_unregister(dev_info->plat_dev);
 	list_del(&dev_info->dev_node);
 	kfree(dev_info);
@@ -572,8 +573,10 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 		return PTR_ERR(plat_dev);
 
 	dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
-	if (!dev_info)
+	if (!dev_info) {
+		platform_device_unregister(plat_dev);
 		return -ENOMEM;
+	}
 
 	/* Cache platform device to handle pci device hotplug */
 	dev_info->plat_dev = plat_dev;
@@ -594,8 +597,11 @@ static int dwc_pcie_pmu_notifier(struct notifier_block *nb,
 	case BUS_NOTIFY_ADD_DEVICE:
 		if (!dwc_pcie_des_cap(pdev))
 			return NOTIFY_DONE;
-		if (dwc_pcie_register_dev(pdev))
+		pci_dev_get(pdev);
+		if (dwc_pcie_register_dev(pdev)) {
+			pci_dev_put(pdev);
 			return NOTIFY_BAD;
+		}
 		break;
 	case BUS_NOTIFY_DEL_DEVICE:
 		dev_info = dwc_pcie_find_dev_info(pdev);
@@ -730,20 +736,29 @@ static struct platform_driver dwc_pcie_pmu_driver = {
 	.driver = {.name = "dwc_pcie_pmu",},
 };
 
+static void dwc_pcie_cleanup_devices(void)
+{
+	struct dwc_pcie_dev_info *dev_info, *tmp;
+
+	list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, dev_node) {
+		dwc_pcie_unregister_dev(dev_info);
+	}
+}
+
 static int __init dwc_pcie_pmu_init(void)
 {
 	struct pci_dev *pdev = NULL;
 	int ret;
 
 	for_each_pci_dev(pdev) {
-		if (!dwc_pcie_des_cap(pdev))
+		if (!dwc_pcie_des_cap(pdev)) {
+			pci_dev_put(pdev);
 			continue;
+		}
 
 		ret = dwc_pcie_register_dev(pdev);
-		if (ret) {
-			pci_dev_put(pdev);
-			return ret;
-		}
+		if (ret)
+			goto err_cleanup;
 	}
 
 	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
@@ -751,24 +766,27 @@ static int __init dwc_pcie_pmu_init(void)
 				      dwc_pcie_pmu_online_cpu,
 				      dwc_pcie_pmu_offline_cpu);
 	if (ret < 0)
-		return ret;
+		goto err_cleanup;
 
 	dwc_pcie_pmu_hp_state = ret;
 
 	ret = platform_driver_register(&dwc_pcie_pmu_driver);
 	if (ret)
-		goto platform_driver_register_err;
+		goto err_remove_cpuhp;
 
 	ret = bus_register_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
 	if (ret)
-		goto platform_driver_register_err;
+		goto err_unregister_driver;
 	notify = true;
 
 	return 0;
 
-platform_driver_register_err:
+err_unregister_driver:
+	platform_driver_unregister(&dwc_pcie_pmu_driver);
+err_remove_cpuhp:
 	cpuhp_remove_multi_state(dwc_pcie_pmu_hp_state);
-
+err_cleanup:
+	dwc_pcie_cleanup_devices();
 	return ret;
 }
 
-- 
2.39.2


