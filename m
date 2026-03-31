Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3083BFF60CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8cjngpEHQRn8jA1+OGy7uBShTFIXviPt0CW7b9FjnNg=; b=F7UqIr2MM9+iDDNs+FHBDh3AcZ
	Y6gcqk06xht8udg4xBi5tL7MF5cuUwX2kSsQ0EXnS+9LqM6yQzs4UK9q9WEGQYapmjZk6uCBW03c2
	MPLRInD0Wm7Z1AX+tlgQGMZALKQcMAEIwCeE7wFVd3wj75gZxL0b4C69tOv/qhqD1zyHS5uCeDJjr
	og/dErmXASBSoiBo6qW5xGK8N3MiaHfJYiCr3m3IPkOPzOoJfkuemcV2AiWNMaYLpGAValUW3utf4
	ZyC1fwo33yKpPp8r5ijl4Em26vIKvSnGMNWTtX7L/BhtHoIsO3/QJIxsej5wEaDft+JtyqKIPxe/Y
	vKO20D1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TWJ-0000000CURu-2CbD;
	Tue, 31 Mar 2026 07:28:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TWH-0000000CURa-3wj5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:28:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486fe655187so69780535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 00:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774942092; x=1775546892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8cjngpEHQRn8jA1+OGy7uBShTFIXviPt0CW7b9FjnNg=;
        b=bjQOawY5Rv8nHLdgh+0hUZKMbiS1p3UDZXPQxKwHqwWZAa5dxDvsfZghO8ZMPTzWiN
         vO8y2hYyxLZAfSohKYKoP601T4LjqVoB8x3CVlBvd0+ORbJ36a21cfoxSLMU7l44/27r
         9afuU18uJXLfFpoPHILATNEl7hJ+zyTuZBvrEzlCPAxBMTEE1ZisBbac/C5wiPiAdyqW
         rhOWBjV0hbN/+46SllQLNsU5Ms/pu/Lj1tTP1HFGYnD/rSB5DHdpdpoQOPzZ3XFLF/2s
         vp6ePln+NKf1AFqj0OPOwcyN4obycnHz1LGRSd2+5Ykhm+YSM9Cvvii+X2b2pMVwjP6B
         I+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774942092; x=1775546892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cjngpEHQRn8jA1+OGy7uBShTFIXviPt0CW7b9FjnNg=;
        b=Kp/mFvIY9RHX4hghO0inJqf33Fhq/uAzsn2aHAmEBnLABs8eVgI5r+e0g2ExzVgLCM
         +JhpBz7I37oP7dBjrxdG2vYyZ9kkeL0/Uevr/Y0TVetY2a0Ku8xg7uXyeOn75kBuArJi
         O4fxmLMGiTLubMhuYz7uGnJ73iXGXjGnyGCddkFHufceccxv8XClTittyo/TvL6Akyiz
         SAs477KzblJrFnH+F57eHI3z7hrB0MqqG5zQDkcVfDLCgr/MuObWgq7GTraxkcTV00y1
         q0lgQ3r+etJLJqiyZ1rJnoYl2gjmdnOtLXfcDUMaVI4NxXzZa3ZHaM3GqG1zYPgWThdz
         ukEg==
X-Forwarded-Encrypted: i=1; AJvYcCVIvKbUFUIdL6DT4DQHBZQuWfCw5wD8UPbPmLS2kCt5DRHOYGmEfKOFhcvo3snvuLX5Nz7DgHZbKB9mHJNw3LP4@lists.infradead.org
X-Gm-Message-State: AOJu0YxLqekHRH6k5e07oyXXV43nJF/dwcbIsqiyIyu5LRU6Ga8xO6lQ
	f1n7Lr6cyfPoGixuU1VsXbRHtfXnfErwbrhIDXgQMnW4ntfT75M1Tfji
X-Gm-Gg: ATEYQzwoINNjbOhch0XcEND+vClIFpyj0YOCsgxTraWpw92DvVi+JkwZ8vGXDKxHSNf
	rjxcQiNIrqfAyFBXnInF8PzVhy52tgLWTAqSjXhYUrQa8arZbuGOMhOpgPYbgUoOU6RCkgBOB9x
	L+23zhViecH4eKnD/Ci8vE4+uHK9YVTJTov71Pg6/vygyj4Rc7gTkgekWFk3ko69tocKOYvMJUz
	/sgW0GsfUVYYECWvfQZEJ7lXnCDXi61Y94WVRMxScOZHZ4aOD15b7+37Pw/YZlStcJYfRG0x6J2
	UbkgDtZ6TOV8s4Ofs1aBTLmc5FraEx5+m3CTTxMQ4lpqjeJMXwyY9s1Ee8qB+x3+A2t5ky8NSaw
	8Epj6+SpVkIEqBKLC+z5gO6D4QFMY+Fzfqqsrp9Mp1sl7SwOoVEsOmZQZl5Uq0gt15rf5UneT2T
	txfRaWZr6oXn90HZhp36m3BW9FhNe+XQ==
X-Received: by 2002:a05:600c:4e15:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-48727d45881mr266166975e9.4.1774942091245;
        Tue, 31 Mar 2026 00:28:11 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e95c:5e00:f8c1:fa51:743d:7994])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e82e262sm15700275e9.10.2026.03.31.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:28:10 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] soc: apple: cleanup dead code in Kconfig
Date: Tue, 31 Mar 2026 08:28:08 +0100
Message-ID: <20260331072808.37198-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_002814_014363_CA9F7EE3 
X-CRM114-Status: GOOD (  12.01  )
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

There is already an 'if ARCH_APPLE || COMPILE_TEST' condition wrapping
these config options, making the 'depends on' statement for each a
duplicate dependency (dead code).

I propose leaving the outer 'if ARCH_APPLE || COMPILE_TEST...endif' and
removing the individual 'depends on' statement from each option.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/soc/apple/Kconfig | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
index d0ff32182a2b..e04a60722e0b 100644
--- a/drivers/soc/apple/Kconfig
+++ b/drivers/soc/apple/Kconfig
@@ -7,7 +7,7 @@ menu "Apple SoC drivers"
 config APPLE_MAILBOX
 	tristate "Apple SoC mailboxes"
 	depends on PM
-	depends on ARCH_APPLE || (64BIT && COMPILE_TEST)
+	depends on 64BIT
 	help
 	  Apple SoCs have various co-processors required for certain
 	  peripherals to work (NVMe, display controller, etc.). This
@@ -19,7 +19,6 @@ config APPLE_MAILBOX
 config APPLE_RTKIT
 	tristate "Apple RTKit co-processor IPC protocol"
 	depends on APPLE_MAILBOX
-	depends on ARCH_APPLE || COMPILE_TEST
 	help
 	  Apple SoCs such as the M1 come with various co-processors running
 	  their proprietary RTKit operating system. This option enables support
@@ -30,7 +29,6 @@ config APPLE_RTKIT
 
 config APPLE_SART
 	tristate "Apple SART DMA address filter"
-	depends on ARCH_APPLE || COMPILE_TEST
 	help
 	  Apple SART is a simple DMA address filter used on Apple SoCs such
 	  as the M1. It is usually required for the NVMe coprocessor which does
@@ -40,8 +38,7 @@ config APPLE_SART
 
 config APPLE_TUNABLE
 	tristate
-	depends on ARCH_APPLE || COMPILE_TEST
 
 endmenu
 
-endif
+endif # ARCH_APPLE || COMPILE_TEST
-- 
2.51.2


