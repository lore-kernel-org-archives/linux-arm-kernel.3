Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0B6C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juzMyLx5J28dogWl0dvZjIex3AlV6esdHMv6/KGnTD4=; b=TJNPoIqzFn8i5IwlcbNcJ85woW
	YtTqfUEIOFmvBJveRjHic2gcJrc+LFaK5kj5Z0BGo0rMStWGXad1rXbPkJyxv+q8Ux7sCV2vd+3Ia
	zSiikF2gqUxSTveCJ/Yxsb4jTKtNHlnUfmAOLggGipfM/lVSQTLuJpk65LOhGISBDBUEEfF6mvv3K
	52f3GAcQVkCA6a69V0N3FiwdFs/oAVQEaS98x+TJi6Y/ke2e9dmS62eDVbLJtUg3wBybOPO8N5G4r
	DChplnZZEcrfe57ax+VcI57D4XFn/Z+aWyDunMvH9S+epBaHBZVNyK4VAvmMZMErJjjj+TmObDvgU
	Ju4A/83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Z3-00000000lOQ-2LgK;
	Thu, 20 Feb 2025 12:22:01 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5VD-00000000k8M-11ea
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:18:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22114b800f7so14227875ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740053882; x=1740658682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juzMyLx5J28dogWl0dvZjIex3AlV6esdHMv6/KGnTD4=;
        b=MbP4Dy9FkT2l6N1+EIVKutKRrFvJTKIT+aDZRbw0BbjSiOrJ6LAaLwUBz9tp49AnKZ
         gbABatuqfRi6phX6nDZFIhq3/+ovJhB5Lji/vBVx4Gbr2tftskSBqE/LLbXsbYI+fOMO
         R/ZRoxsIEPIqaXRb4sU8yZU9O3WjLGL8HsuZo/IDrjQZbYIrHsJBIkz+/Ijp19e3xAYb
         Z7KurJOAINF2b428wa//j1rrEKZs8diL46LuVP0VhvD6e7CdJeqk2ZIKmQFPcIVTzSHo
         OhqEaCurq/dFhD1nfb2ttloAKrw62jGFnUnNebAhJuKHFvFVzjv1ag3Ux4GG0IG1W34i
         f/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740053882; x=1740658682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juzMyLx5J28dogWl0dvZjIex3AlV6esdHMv6/KGnTD4=;
        b=imezByfWBeKS2Ox3h/PitCxHjoE7w3zBQLkr3gVsJixBxz1oEaEJ12uYJ5tNfkvGjr
         CUCEDZBBUCY7G2jLRGOZeoTojhk+51T6PWuNG4++RikiZI65B3mq9Q5eDi2CetRy91Ax
         w5ON3lpH7+3hmNSoJF2CJo9khNKPIvKeHZi1oOyrxHd37R+eIQFmIUnEf0/ISuR3Wl5C
         ySfVaChZucT/Tju9ImlTxieDkQIEVzzAtBqf+r+YG8fOJH8YkaGjyeC15o325mjoeW0L
         iWR4sWeL15UZg+pe7hlPuDMg3HMpI2jmUVJm9xYZ5lYkiLiI+CprY9o4Mkfz/c8T8+EI
         DZtA==
X-Forwarded-Encrypted: i=1; AJvYcCVoDDwau2yP/8ahnwUToOXAI0+82SqYXm8t3W6OvAwZuLRdwqoNl95WdSTqH3Fx9lUu7+bAQfdrS3zJXuDkHS3u@lists.infradead.org
X-Gm-Message-State: AOJu0YzEw3GtfKF1RkJUPB9c5g8KXojOvUqq6v6R1PtYaUonOgs1Kv5U
	v0HsWTRhELZiyvhXfJhscM+tEKoM5YIZtcEOvYgS3v3B0NMq51GMxhEbDF7qUWo=
X-Gm-Gg: ASbGncuO9An/piTuEqpZjaTVstboTaIV0AKRq2ALupOGbLN2FNv/S/5JfGcapnx4FJJ
	smn/BMFgvDGu8OcMS6hEtAAsbHDvxvuM0YPhKFAoasMiqoRT/EFzYIc+/2TygVJxZWioj2fk56B
	5hXSvdgaxO1Lo59l1sFfZF185XIBqe6sZzkaBlQPebZNhPIBBj2MaEhvt3Z49MTMu3qQ9rQUNe9
	3ROjhxzUP2UfM9kh1sfOGs+juatsw3UMehKsQe+oxjQNsO1jYGrbAj5UtKc+9Fz61DdSHMR+CyA
	wYJ1Vk8rYY9p+gmov0yQAECkS6z8kIeFomUjwpXLd2i0ZGONDw==
X-Google-Smtp-Source: AGHT+IG9TMnvbyOkty/+IgJLUTpsHYYN+sn16XIRU1xBzk2Wl5EGIuL+mvxJhhYIG67jSv/YFg65nA==
X-Received: by 2002:a17:903:2309:b0:215:7dbf:f3de with SMTP id d9443c01a7336-22170988a8cmr130641525ad.28.1740053882339;
        Thu, 20 Feb 2025 04:18:02 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-221040434d9sm87773895ad.196.2025.02.20.04.17.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 04:18:02 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v4 1/2] perf/dwc_pcie: fix some unreleased resources
Date: Thu, 20 Feb 2025 20:17:15 +0800
Message-Id: <20250220121716.50324-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250220121716.50324-1-cuiyunhui@bytedance.com>
References: <20250220121716.50324-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_041803_281870_64E335C4 
X-CRM114-Status: GOOD (  15.85  )
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

Release leaked resources, such as plat_dev and dev_info.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/perf/dwc_pcie_pmu.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index cccecae9823f..19fa2ba8dd67 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -572,8 +572,10 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 		return PTR_ERR(plat_dev);
 
 	dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
-	if (!dev_info)
+	if (!dev_info) {
+		platform_device_unregister(plat_dev);
 		return -ENOMEM;
+	}
 
 	/* Cache platform device to handle pci device hotplug */
 	dev_info->plat_dev = plat_dev;
@@ -730,6 +732,15 @@ static struct platform_driver dwc_pcie_pmu_driver = {
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
@@ -742,7 +753,7 @@ static int __init dwc_pcie_pmu_init(void)
 		ret = dwc_pcie_register_dev(pdev);
 		if (ret) {
 			pci_dev_put(pdev);
-			return ret;
+			goto err_cleanup;
 		}
 	}
 
@@ -751,35 +762,35 @@ static int __init dwc_pcie_pmu_init(void)
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
 
 static void __exit dwc_pcie_pmu_exit(void)
 {
-	struct dwc_pcie_dev_info *dev_info, *tmp;
-
 	if (notify)
 		bus_unregister_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
-	list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, dev_node)
-		dwc_pcie_unregister_dev(dev_info);
+	dwc_pcie_cleanup_devices();
 	platform_driver_unregister(&dwc_pcie_pmu_driver);
 	cpuhp_remove_multi_state(dwc_pcie_pmu_hp_state);
 }
-- 
2.39.2


