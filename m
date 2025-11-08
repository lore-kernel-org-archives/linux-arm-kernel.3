Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CECCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 22:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxZAPUKdi9AxX63zPi/NWqNTntX+DYqp6OrCNhCWvus=; b=4qNnjlq1v6t2U2pzMzuyfmFMkZ
	CIbXzFO08AevrvUR0JsQ7Qee+zNMNrzaWR/lzmOjlPkL9K0HJBS9jI5Jf1pWzijcllpeSFdlM2ABE
	YUrWCWzpPHDT3vQckyk3kMvJIk3uCyaur8fdEGlP/o2+A0lpE8SsJYJvgS73F1DdDyVR6rs2IlllK
	6FDDh0+SjaQOaSSlGdr5FH+4eG72l0ZJxiPP+GtN5Skn1CVRy0+8dQm3EwIQqWi1pKECvMnP3saW3
	IWUrjXAMMpOxIKj+1hgRca0xa1YEE/kbMRiE401bebP8qX/v9oPjiAw5W+V3eKuAuyoFhKasRDB45
	ivuxR0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHrFt-00000003WAl-1MWL;
	Sat, 08 Nov 2025 22:17:57 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHrFr-00000003W9r-1etG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 22:17:56 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59435d82c1fso1958452e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 14:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762640273; x=1763245073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxZAPUKdi9AxX63zPi/NWqNTntX+DYqp6OrCNhCWvus=;
        b=nlA/acOPk4H1fEyscDtY4Md/IRM6j0v8lz1JOIFLmmMKBbqGtVNNCAQvVAeBNlx627
         W81Fvxkj0ivNvfMdNIsu4YJHLl0+R/NoUc7sJFSqMl1K8wXem0MOcvqg38yWYnXs7xtk
         ZulqYkS/9DfZwHwnuJZtE2rRz12Ny7QHGKM+htw+GONgIzqyCfP7DWBD2kTBMa6NzsWa
         BT3vC9NReHQczo/zxIarHZ7yYiiO/XCoX/44MSQY8mKRB9OKVz0qVgzFm4uWEOhSMbWt
         cHXFK8PcmUSlSivWdSh8WpacKO7cCkiXYVMJGBVAg72+WYXnAGtTl/vvqSKISSfEg3JZ
         D0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762640273; x=1763245073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TxZAPUKdi9AxX63zPi/NWqNTntX+DYqp6OrCNhCWvus=;
        b=nmUQLHdxcGHprs4nbe7d/uOehQOL58ipJRiuhj0Y5RRWBRZMRuyAF6SJihvgqAo69f
         lm503KRY8I2q4ijUYP2e9Kh1LLChcNnqjggc0c356Ri7qOEjldB41Y6M2q1IgS9Gnqlz
         38XxpkCHQ+ED2RRJ5C0u5pV3TnzyAJJle3ID5cTHVpdtqENwnkRGotAD8L7IpwNl61Nl
         SYrq3yUvu/Q4KCD0Se+/kMRfpEDXUYiT+u48tliFElz5QYJb2PtE5FNhFnYQBghESzXz
         uMN0DdudxAWVQY1Hlqc6uKuu92ie4Y7GHh/LLDRBU1KcQhwR22vH8dxyInO+8RWEUcJF
         iTgA==
X-Forwarded-Encrypted: i=1; AJvYcCWQhCxoQyfwyWvo3PJ8Vo3LMfL8uYP5COxU4SL6Rx11HVeVQJ9M8mpEx3lAh7XyocGI8NCD19kpPl8WGBGujrXu@lists.infradead.org
X-Gm-Message-State: AOJu0YxtyPS/YpXEKEykSSG/uFhf6r47N5UBwTHKx7kErxyas1OtFrRa
	NWk5B5/Mln3Fbv/cU7C1kwGU/ys3mHpqgSbop68LpdM6ghBTHCDmuPt5ohOYYekebcI=
X-Gm-Gg: ASbGnctVY8kN7y1kccdocipVTFBwDWI8IHXzIs+VwYP23jYGXfwcyNYg7KTi2Hxc/oO
	jO6LOSX+R2k+eY41TRdkLmLhpkM7rOEIfT62HH6gqa2EEDMPhsH+vqWvJfsCmRmaEdqOmvizSh5
	BVpJq3xH0R2BnABYyOposkk4UB8xAzL5vIWRs/bz4lWG++qrxMWKjbJprJYYRIM+TTK25mI9Ekk
	XsaxSD8RUjLn3brxWXk7Bjw2XkQr+WiU2lQ8UwMwVGSXDuXeQm1GHa+WXQjQtKZhS0/AauN/PH6
	r+lmH+qskYx1AfDRwxGXl1Xzzoje5tIbCldzpabI6vUGN3PnoZBszJNpLE63uF/AQnnPKJCOX7x
	+pwPF0qN50m4FhJyXz6NA6rHFKJu9OO9dbSpOp5lvMT1VXgTCUZ8Q2k545FmqRP3NwnKoZ38jp1
	WqZRjPAcAQHajUgCbmlLgB3eV3BiKt/lQOhxp0cv3TizVtiS/9yk4MUA==
X-Google-Smtp-Source: AGHT+IHolDwBEdVgVHkXvTMdRX9qh3n0EPVAJ6MxeIpHVw17L7ivQtjPHHGLRV+poAHUxhwCFcmwTA==
X-Received: by 2002:a05:6512:2209:b0:594:27fb:e7ff with SMTP id 2adb3069b0e04-5945f1cb40amr1082915e87.51.1762640272741;
        Sat, 08 Nov 2025 14:17:52 -0800 (PST)
Received: from Shofiq.home (62-241-229-58.bb.dnainternet.fi. [62.241.229.58])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59449fd04b3sm2620347e87.0.2025.11.08.14.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 14:17:51 -0800 (PST)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: nm@ti.com
Cc: ssantosh@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH] soc: ti: knav_qmss_queue: free resources in remove callback
Date: Sun,  9 Nov 2025 00:17:41 +0200
Message-ID: <20251108221741.48610-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251105013049.45646-1-shofiqtest@gmail.com>
References: <20251105013049.45646-1-shofiqtest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_141755_440356_77E0DCE4 
X-CRM114-Status: GOOD (  11.87  )
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
mirroring the allocations performed in the probe path.

This ensures resources are released on driver unbind and avoids
leaking queue/region state.

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 6e56e7609ccd..1e5f3e9faa99 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1884,9 +1884,14 @@ static int knav_queue_probe(struct platform_device *pdev)
 
 static void knav_queue_remove(struct platform_device *pdev)
 {
-	/* TODO: Free resources */
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+    struct knav_device *kdev = platform_get_drvdata(pdev);
+
+    knav_queue_stop_pdsps(kdev);
+    knav_queue_free_regions(kdev);
+    knav_free_queue_ranges(kdev);
+
+    pm_runtime_put_sync(&pdev->dev);
+    pm_runtime_disable(&pdev->dev);
 }
 
 static struct platform_driver keystone_qmss_driver = {
-- 
2.51.1


