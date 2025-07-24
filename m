Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84680C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieqGzTCdj4VITWiplNNA/VccLe5fuArNXR2nSJt3s9g=; b=L/MozjScR688WIkqJ/ycU6m/Jm
	08gCpytyapQQWXQbYiSxM+K74IxljiAzk4qGNDhxIK5aUie+sDowFJs+8tY5zwmgHg/3FpHUvJkLo
	JfJsnVANGCeZrRXCRllQOxWT+Dg1X3OnjlA2IDKInIm43hFX1m23nS7itXzKdGbYzdXy1YnqLBLv5
	g5M1ZdklYdCshIlLvy67Ycj2321xfsCt0Nh29sqm3LBr4UMRLX8QQq0Xvkx7NAFCliSrI87Z5bs+z
	xg/hqNFtKzJmSoEPIp4K5i8QqUqqx/ddHE30ltWkVS1dDkwqN5Gw/j64E5XxLb5RZ5XYnXhziQk5c
	cVQVOCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrW-00000007rKr-3wy8;
	Thu, 24 Jul 2025 15:28:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR8-00000007esT-36HL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-455b002833bso4614995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365401; x=1753970201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieqGzTCdj4VITWiplNNA/VccLe5fuArNXR2nSJt3s9g=;
        b=gKknCZIxodOvaeuWdDZoRJqD7bUv11f+LerE+O84jwL+017ZEAhprG4Rg95x5MnvDY
         wJv59r00kdP3aQ8ovlBLIHcy2U1jZxKnh55Kth4C7ofWNYFXd0/23YtVRR3zbh1iQTM3
         VM9HPQMjIKIg6hzCOeOHKmp1xabbt3I2s3LkbrdfMawkJYUKswPYf+HIcCtiavy1OdCd
         44k0uhtu99Oa4AHv4KbCzumVp06DE+UvV3gAiqFMXBZrgDaLn69ToJtxK0aPqIBQoeKT
         AlF6zE3dTi0L+eSnQ//JNpxXRkRSzKHGKb8zxMWpLDhQ97i+7RYlGKV0J3rqcUWs41Xx
         SDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365401; x=1753970201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieqGzTCdj4VITWiplNNA/VccLe5fuArNXR2nSJt3s9g=;
        b=JZRh9oZO7OaUyZ9x5ltE4bumqxnwU+elySLmkB528aNftQgJH3Ed/cmqPzQcQ1+jzr
         FSsxa7gxPipjLje9GsrFiC5jCz1UatMeP67xxSksh8pQcBc3Ef4YjyRQ9+rRwTDq6e6s
         TUwozehcvAKNZ3g4X43xkbtJfTLpYPaTCgxzM1n04BMC4YjKc1zKH+IzF1CVg8MRgtGK
         WEOOE5dwIilSWuEmGkcQLz4RKDOIMNJGfdeX/CZH8KL1NaaV9GiSdS9n4CzxN8J3ZRFs
         50DPk60ya1ClbHSciIS/kXATMjsV1X1mrI+sodlqL83lzOtBWeMN24W4NoDLupqsDoWK
         f5nQ==
X-Gm-Message-State: AOJu0YzOKXgQYCH6BZzVR0nPjxDBDJyXBAVgszgefYBA57Q8sK759f1K
	MQ7IosMhHk3EIpIfsPIa7xpxwP77pH9apWDnYLkKfZA5atvAnJhb3B+qwnDi5UI46ro=
X-Gm-Gg: ASbGncvXcdGxDjyAzpkshAkNrAv0Us0b/F2hl37l9LkCLQ6G0Bi6QOOcxWPzHOFoKZa
	3Oy4n65fanbIGLCUZM117N7h6zIj3KMxH6HzTxvpHmoOUK1X223GDaw0OvZQaFEos/6g1CPnwxJ
	/Mt3Kf7pOKTwkYjbx2yK9AF4aBxw547NVlO+FB6MmfBxiiHySrnpkXGOU6+Jkn77UxaZVJFJQzq
	KReI4qPnGH5igdgteo0qbGLvOFifyfsjhCQBCIakKIpVMCfKrBr/LrSV8UViXQZi4OS5aklRghQ
	7nRoUvVfw5ofnlon+OVSo8xXb0jk+g2XKzJS82ulljPjOhj0xOp2boiPdSJKjnRp+Z1frzBQbfA
	0znWnKBuXAD+srjwuVdnzp+MSpUhSe39CCQffrzFnN+VFcgjTS0TRqImYq1cwKAK5ZYtWEQdo8k
	pYgFSu5Yt5SFnZ
X-Google-Smtp-Source: AGHT+IGXEHFsoY1KVpxzOAw5TwDBINg782dVci0CvVy56NLBcwsZCPP5/3Z/QT3qLnRYduHfxvJiyA==
X-Received: by 2002:a05:600c:c167:b0:456:1c44:441f with SMTP id 5b1f17b1804b1-45868d7266fmr61139855e9.31.1753365401169;
        Thu, 24 Jul 2025 06:56:41 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:40 -0700 (PDT)
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
Subject: [RFC][PATCH v2 21/29] kernel/configs: Register dynamic information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:04 +0300
Message-ID: <20250724135512.518487-22-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065642_789683_76951306 
X-CRM114-Status: GOOD (  12.11  )
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

Register kernel_config_data information into kmemdump.
Debugging tools look for the start and end markers, so we need to capture
those as well into the region.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/configs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/configs.c b/kernel/configs.c
index a28c79c5f713..ec94b695f234 100644
--- a/kernel/configs.c
+++ b/kernel/configs.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/uaccess.h>
+#include <linux/kmemdump.h>
 
 /*
  * "IKCFG_ST" and "IKCFG_ED" are used to extract the config data from
@@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
 
 	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
 
+	/* Register 8 bytes before and after, to catch the marker too */
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_CONFIG,
+			     (void *)&kernel_config_data - 8,
+			     &kernel_config_data_end - &kernel_config_data + 16);
+
 	return 0;
 }
 
-- 
2.43.0


