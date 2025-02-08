Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CD4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juzMyLx5J28dogWl0dvZjIex3AlV6esdHMv6/KGnTD4=; b=ys3t73A81st9CLc1lPZ6cGn16j
	GXHlhmQbYQCAqTiN5HoEmXDPtayZA2rAl18kNgIxfk3YjZLNxU44iOzrp+I9GsLQxYiD6Q3ZQj1bM
	cjXlB56qecxKF2Y3zw3Fpr0gCjVwJcSZ+xqVjyR2DwNoUVkuBry1jWISbBR5NBcSBGOssNhZDvnNd
	jzUO3NUgs4Ls6zBMLz5SbGxsBO5PLG23/PpqUHMmWB93i2q6r2ykYFyalcsRNhI8sg71qE5f6BTIo
	bKwJxyJM4+oQ3sKXb1P8+setiD8tNiYvXrvtM1WPoy9v2nM9A3sesTBZy5E2fnWIZNW6rgrFYuoZK
	/EnDh5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiIi-0000000Cm1V-2WAN;
	Sat, 08 Feb 2025 10:43:05 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiFy-0000000Clfm-2CGB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 10:40:15 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-219f8263ae0so55045005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 02:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739011214; x=1739616014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juzMyLx5J28dogWl0dvZjIex3AlV6esdHMv6/KGnTD4=;
        b=EQjhynJlbdPX4mjTni5kM/iSc9Pj8RjPqsgkpnvoDacDRjEaOGhmtX5PR8AHksDklk
         sc7UwfTRI/KbgFXvqdzoq1CocWtG9+mavH3BfnM9gxko7zoJMpvo+UuM+0DMXqQt0SrH
         /Gd451ohRvr0iO4VObpF9NREekubO/urvzhw2kDdqTfzQD2hdunPNr3YJScvGtCh/Knp
         MbZEIX/DGPW1777WOkToqisOZWXu2dm9IcUdok30hUBIOJhOT/591m3qOO55pKc4fydQ
         da6GQOvobb3ii2c3PvDOOFuiyIkF1dk1RsRlX5kPdLgCBdyYVeO3M0RWeu9C2R3AYrXr
         gKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739011214; x=1739616014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juzMyLx5J28dogWl0dvZjIex3AlV6esdHMv6/KGnTD4=;
        b=CfPW1QqI7ZT8z5MxHXg/FWaBVECbcFg4+mvU2w1p/rz3unqDrhd3oUPezZExC/23Hd
         79udD8X5PzcXS7+9pvdKNg6INFnT4KClaZTjHxk+dkj/wcQEwJU2dBwAPVpS170YeIhX
         BrbbHhh/X+62sjKLaX/UNixDSLB5eK/p/neeWl0GvyAvVtRphmuYz53HOHQB/K3FzCyt
         JRS3ngz9NthULRu1mQqkhis/H+J8HPlk2bl5y5Lr0p5KRvGgpVeioyY1dzyVPQOMxb1x
         lla+aOcZBcorfaJr7TTCj/gJ3OUNsBsPvvY6Fovfvfs9H2pMxTFFQbBsZA31C3Q/oG0n
         //Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWi5VPH/B1b55KmMRWyTQ9rMVRTQNe22BSB1vh1eozDROQQfLC1RfN2lYtFhHhpxSuAaoQOc2N9t6BplK86hE7u@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ2SP4O0mq3e6lS4fFIVYwtLGU+3cKmbpvc1uNBA3dX2HZ/Kxs
	P9IDRn5Huf1qQJWd87qBkvUoJoemzuZbnXtVFQYjoscgkSyXhClLQVw0vLO/MLo=
X-Gm-Gg: ASbGncsNdicKp5tyEIrnLm/dXU2IblfYxPDhXR8lZ5LedD4hFrEZxmL0nf+/q2078aV
	VravgjKIUuWyCF7FUM+k8T6Gmojhx66+tzPmvP04BRfDfeyotYxYgjQO4sVLVd6+34Ex80d9FA/
	vvW5vHk5NBnQ2kFlWnrXVDsqPc5edKFK4Is2i78joXhSf0kUR7bbLlRLFE6T+kVUiNrIAEK5/Ki
	abQsDYi/dIRw9oCmxufP/vJv6OCqfhDafGW+YioV/zOjGgRUPfZHGGpV5SDJuVwNXaPE7S4mQiv
	x8CTCpIT9+TvBg/blrobCWgkQGG1myzNwaHnEG2Wjjd5raLEAA==
X-Google-Smtp-Source: AGHT+IFNmb13ZbZg6r1svxx+lR3YmmJ7/TTTWvUWZuHu1+y5DbctWyFT6u0lXzmMcuDYGTINuAWpuA==
X-Received: by 2002:a05:6a20:d706:b0:1e0:ca1c:8581 with SMTP id adf61e73a8af0-1ee03a8dbb8mr12390695637.21.1739011213669;
        Sat, 08 Feb 2025 02:40:13 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad5460b8d4bsm216325a12.11.2025.02.08.02.40.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 02:40:13 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v3 1/2] perf/dwc_pcie: fix some unreleased resources
Date: Sat,  8 Feb 2025 18:40:01 +0800
Message-Id: <20250208104002.60332-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250208104002.60332-1-cuiyunhui@bytedance.com>
References: <20250208104002.60332-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_024014_563527_A508184F 
X-CRM114-Status: GOOD (  15.60  )
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


