Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB04EE65D2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 06:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KsdWADtCZxfDmt5l2khF1eoZiMv6I7S5kAe1tkpZwuc=; b=gYoUxsur31zd18gsTZm/q7sUJ6
	njMUIY5FG5i9ZwhaUceMLAPIyxf1/ExfWpJFz2nIAeqRZsPXRBCbnZz9zj51VbGyqIG1N7huLQwFL
	CbxY0b28aQ/n+y4kbqxVr51xs5osLm0x2t2GXxZT9YUSX1l3dowOwDwloru5HswCjF+CL5fqID6g4
	gdaDSCpA0xyN3DaidPRCh2iysDh1saI0e2Y43uR7wHigpKZ5A+WQ+l901PoOtC3abCPT8GktKkSSD
	bTFDvV19UK8lilYT1WWOKBb3ZlYSghRHoYA0661bHFckQSbtHBrYVF07ThJKAJGOnTdPy0BHa8f1A
	34N2VfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEMuN-00000001i7z-0FRk;
	Fri, 22 Nov 2024 06:12:47 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEMtN-00000001i3r-06ZY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 06:11:49 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ea711a76a5so1529616a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 22:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732255904; x=1732860704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KsdWADtCZxfDmt5l2khF1eoZiMv6I7S5kAe1tkpZwuc=;
        b=MBWNmoVZAdS1EBipug1TXAk1IvMAmn67Qr6Wp+8t1kPG3KoBg3dXWy84z5WviXRzVF
         aO0R3NxaA+bJiEeJiC0BD6e2AOCaExdGTuUfBWMoKTJoHzFTbGhIo5LundO/Vq9+9m2q
         QwNbBoq9am13MjTF6aSv6YP6Ryc+oLr2BFXCKs5k1Ozhh99Hiq+TDtAtzRmny9Nfk3uQ
         RLqTR646TrkJJPasltx74yFOgVXwQpDMlOPnujg42Fo8cSQ4dvPzMons2r+uRwRgEVlN
         LFoqmXJb61DDj686dO/Fg3nH7+MtscwEjyJRl65KUQgUQIVnCc5F1inyTaNBx8y+UvJy
         UR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732255904; x=1732860704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsdWADtCZxfDmt5l2khF1eoZiMv6I7S5kAe1tkpZwuc=;
        b=UsvHnGxZG3XBUGCzXTIPPrBojOgPKlZlsYx9fgjqF5L7v+0JKRjHqtVY4BVadTCo+y
         pyGiiGqzzO7MJaXiPpikyXve7ClAmK9Z6neZyD2JO5KRe7sOpbzztX30eu/SAGc+9oru
         M62kI7o9CxnpC5CTMi/UmlHoYIi9WgWiErFw97Ap2xRTEyVT+a4TTKxfFPdYAYqO6M4R
         OZhmeHBWXGO9CSLD0ZEyP3D+o68c6zxCxE8KiKJ8be4Oh+5H8FCq//8MUlkfRijIed8q
         zvKV9JakKYPuM/o/D4RdH5ZODlPfqv4TjX1I3ndetpN0ZUNMe/gMSaYAhpoZlHqyYbZB
         uSRw==
X-Forwarded-Encrypted: i=1; AJvYcCVDXDEAgdw2iPvyu+g43MlB/r/6BaWlPexBI1h8p2ONW6lRUFd/UqtyCBTLBBdzErbmAUkYkRjI2RWP7lGIDHfW@lists.infradead.org
X-Gm-Message-State: AOJu0YxIzV2rPKO1ocawLQ0Hbu4RZoXOo0sOYqX5N2IWMkLO3ejSuiV3
	gOKKSiuN2I1Nvdew5rhr+qACn6dXXymoqmCwRZf7wVbRJlUSYDRZr1lFI+DtYrE=
X-Gm-Gg: ASbGncv/KzDNGxD1OJSAnSxavCj5ESjGiSFHloutRbvI4eAAmXt039fk6qcrkSJ47uZ
	hTKMVrTM3JBwbS3MzbBauXtro8p+WBpG8jQssPNbTf59ifVgYS31K8XWAm9c23GPV/gUpQn0kcb
	XtobTUG0mPURdeopRKvzIUD5sYIDGEVoCM6c/SY9INCQv+qxM5mZwpc0BU1/iidh4az8bGTZs+r
	ZqAVpILn0R4hIf1otRiiduH26cu+k1NyIg0LVlpPgWuKHLeymkG
X-Google-Smtp-Source: AGHT+IE0eJmFuahjKbCISpPbJp4kSO8jy3nKnYRP7eeOOTivTvW9UHLBye4KY33+7uFh0ZrM7Uugbg==
X-Received: by 2002:a17:90b:1d03:b0:2ea:853b:276c with SMTP id 98e67ed59e1d1-2eb0e0204a8mr2029224a91.8.1732255903926;
        Thu, 21 Nov 2024 22:11:43 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0cfe72f4sm768079a91.10.2024.11.21.22.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 22:11:43 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_ffa: Add ffa_add_partition_info()
Date: Fri, 22 Nov 2024 11:41:38 +0530
Message-Id: <9967e35eb1cbdb8d0c0bae3f54401d806700e6b6.1732255888.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_221145_086798_46244677 
X-CRM114-Status: GOOD (  14.12  )
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

Move common code to a new routine. No functional change.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/firmware/arm_ffa/driver.c | 53 ++++++++++++++-----------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b14cbdae94e8..d50062cb6c43 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1384,12 +1384,31 @@ static struct notifier_block ffa_bus_nb = {
 	.notifier_call = ffa_bus_notifier,
 };
 
+static int ffa_add_partition_info(int vm_id)
+{
+	struct ffa_dev_part_info *info;
+	int ret;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	rwlock_init(&info->rw_lock);
+	ret = xa_insert(&drv_info->partition_info, vm_id, info, GFP_KERNEL);
+	if (ret) {
+		pr_err("%s: failed to save partition ID 0x%x - ret:%d. Abort.\n",
+		       __func__, vm_id, ret);
+		kfree(info);
+	}
+
+	return ret;
+}
+
 static int ffa_setup_partitions(void)
 {
 	int count, idx, ret;
 	uuid_t uuid;
 	struct ffa_device *ffa_dev;
-	struct ffa_dev_part_info *info;
 	struct ffa_partition_info *pbuf, *tpbuf;
 
 	if (drv_info->version == FFA_VERSION_1_0) {
@@ -1427,42 +1446,16 @@ static int ffa_setup_partitions(void)
 		    !(tpbuf->properties & FFA_PARTITION_AARCH64_EXEC))
 			ffa_mode_32bit_set(ffa_dev);
 
-		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info) {
+		if (ffa_add_partition_info(tpbuf->id))
 			ffa_device_unregister(ffa_dev);
-			continue;
-		}
-		rwlock_init(&info->rw_lock);
-		ret = xa_insert(&drv_info->partition_info, tpbuf->id,
-				info, GFP_KERNEL);
-		if (ret) {
-			pr_err("%s: failed to save partition ID 0x%x - ret:%d\n",
-			       __func__, tpbuf->id, ret);
-			ffa_device_unregister(ffa_dev);
-			kfree(info);
-		}
 	}
 
 	kfree(pbuf);
 
 	/* Allocate for the host */
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
-	if (!info) {
-		/* Already registered devices are freed on bus_exit */
-		ffa_partitions_cleanup();
-		return -ENOMEM;
-	}
-
-	rwlock_init(&info->rw_lock);
-	ret = xa_insert(&drv_info->partition_info, drv_info->vm_id,
-			info, GFP_KERNEL);
-	if (ret) {
-		pr_err("%s: failed to save Host partition ID 0x%x - ret:%d. Abort.\n",
-		       __func__, drv_info->vm_id, ret);
-		kfree(info);
-		/* Already registered devices are freed on bus_exit */
+	ret = ffa_add_partition_info(drv_info->vm_id);
+	if (ret)
 		ffa_partitions_cleanup();
-	}
 
 	return ret;
 }
-- 
2.31.1.272.g89b43f80a514


