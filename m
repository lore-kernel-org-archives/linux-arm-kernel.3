Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A949C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXG7080vUoTS71soVhA4Gbq56Ym56pqDEVpEhL2XCIg=; b=j4N3YJuYRiaeqUX4kpycoG4sE8
	WRl+HFpRP9jVvJPlE08wl+B6gXI/bm7m3BWivn2UnZvOGB/KeO43X/YQ00fuSEwQUfJuMwRw1oVDe
	DXVEkOk/xYd4C0BtuxtQsSSlWpfd1DFTJ8l34wZyHbXiuT0sUOUIXS2JIx71vpON0U35WkPKK7HNI
	YZe+oMPrj1QLCsYYu7+3wNiQOpyBvtxbrETnHz07d/3XpTCN/Jk3x7N9MhJw4faD3aTHw+awhrYNb
	4ts68FaoH/XAizkzQDMcNaj1twb9z/CoOfYob6OWdSzS6f4zdtdUzgnamkFvUl//cHzCwa7hwo9X2
	XtDMN2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrL-00000007r1V-3eUG;
	Thu, 24 Jul 2025 15:27:51 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQv-00000007el4-1fSt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:30 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so7035595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365387; x=1753970187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXG7080vUoTS71soVhA4Gbq56Ym56pqDEVpEhL2XCIg=;
        b=wABcq4aASZucsqtu+6leWadsAaZbSlfvQpsWpF12R9uwqjwmzx9Qoc1YWVp6CEH/r0
         kWc/f5EAfWX5oFfvu9TVzK/xDvL5lz3IaT9MhdPXdfdiRDsQ6VX1hSrs+I/oAwe1JJDx
         UKr+DyE3lg7FqHKB/FL/wktGl9IX3q5mXYuCTZlNtBq7arkDJ4c5x5PX+Nzoc/H+EuMJ
         1nalxEG9tyk7HFdmHAW1JvEvmjPw3VnQKTjIXbDQhaNbNVk9bIVn1strVOrO/CfsGIeS
         lDQxU3dRgGTIPWoygcM1q62dpZ1ymRy+4mN8j9oylcQeo4eVKQ83Dij/hBnYHz34K6Mx
         hk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365387; x=1753970187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXG7080vUoTS71soVhA4Gbq56Ym56pqDEVpEhL2XCIg=;
        b=ZpmSArXWPPUUgtQvCRXHuYuPk9vogKn9BYaP/OKJa5iZ1gpN3GS6yYA693x37H4Gos
         +aIc72lCmZPmdI4AIu2CsRzHjvqd7w9ogKi0CGyBEtAdTF1SIRO6mWAJoktMTBUuRIk7
         bXO80T0xAwUDyPrYphi3SwmqjrEFcSZJq1y8pxxTqHU5uUhNWRCx/O0gUxXK4g3xMx8V
         fB6YbQ4iZ/+dHEx3wr4SXUNsl94yus9c8F1TZNN+Z/6KE3/zmYgtTo6HG2YfvIAdMief
         AkiT/et3IpAtdZFK9ZWDIxOxSwK18uf8zaPOsA27oE1ChPGsm0NTWaQyPUIXI6EgknoM
         IV6g==
X-Gm-Message-State: AOJu0YwB0bgcS/nYn6vMvu1i6TlzYURVeKfComm8YbmdMElMQcpfYQXw
	SkM8TUG9tSoOW+VS1UUbhwxpur4wXgZ5PZisbXZjtF42j/HAIj2uGC2tMmo5ZAP5nlw=
X-Gm-Gg: ASbGnct0g2dKCYk+YDgK5JLt42phMFv9I8t9jcCIsjwJk4Z01jM9iuwzVCdDYoypq0L
	raeZuYNzxLOOQPQ9BnCSzedesw8x/kWqgA6uyNzWixmp1ccz/qOpLwKL/qOxk/QIUvaoT3eTWr2
	zNBz+Hp2KXKev70InQYcZhEKE6o9ETo0v+7w5SXgpHE4gHLaWZd7LK89BAdNM1fH9qBeygpheDV
	vr3EDEmlVPTnsJLARx8ijS4hG7E4DR/1M/gBBwlvMZSTxFcDCzFG5Eubai7fHkShMiAmHPy2SXz
	4iE1yh7xuhd/sdLqRNKGYpUI/e7lcZPsvCP2Sa6UsxJhpAW33hcyD5MntulXqtoYkmnQw4uvL3H
	kMNVtvmeAAuaVT3zqvr34MbM8oMDaaNxK6MdJCRMawX/zzjAxgl1Nhioq/QRgZBMzqY8S+cRQpR
	pSxrIT3h/ddIeE
X-Google-Smtp-Source: AGHT+IGoSF/EqSdGIwDb9gZl52m8tCgkgoHOuTGrpWGU+P8oq0e6jpOpRi4GM0HClIhflbnZpXQODA==
X-Received: by 2002:a05:600c:630f:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-4586a7df4e9mr64595105e9.16.1753365387527;
        Thu, 24 Jul 2025 06:56:27 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:27 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 06/29] soc: qcom: smem: add minidump device
Date: Thu, 24 Jul 2025 16:54:49 +0300
Message-ID: <20250724135512.518487-7-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065629_443038_22F40B7E 
X-CRM114-Status: GOOD (  14.56  )
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

Add a minidump platform device.
Minidump can collect various memory snippets using dedicated firmware.
To know which snippets to collect, each snippet must be registered
by the kernel into a specific shared memory table which is controlled
by the qcom smem driver.
To instantiate the minidump platform driver, register its data using
platform_device_register_data.
Later on, the minidump driver will probe and register itself into
kmemdump as a backend

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index cf425930539e..2aae0e696150 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -1236,12 +1238,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-minidump",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	hwspin_lock_free(__smem->hwlock);
 	__smem = NULL;
-- 
2.43.0


