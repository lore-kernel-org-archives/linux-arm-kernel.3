Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A5FC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7aTmkgkOjMNLisksiT3PXivjuFocTpiOSE3RpArX7I=; b=oi3j1dilcxdzFm8y3VPxWNaNX/
	bj6QoYPAdfBH3WGZCWhSTn5Lowq0mDR7bJd9Qsyp6PkBe6netu+2qHqberCwxLchRFeeCJx330f8M
	92cp85t6p05rE8fUQyKbV2qA04hjDVbo5odBVKD/JzTGxa1FO3yReXh0z0Nh7ZvRnnEWI+IhUknjc
	bkS6RTZ8XrNpdDYX3xVPvgxlmHPUujqIKzposyINZwpeJewtQAEtWKUQubHsZee349HxN+DF3o6+1
	XCcyi1RC+dBwODytJPMCJutaS27sNXoLEIko8AsqcpYrYrgA6pu85qFzVamHH2ai/8hb3FYMpI/bA
	Ck4MqDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YOr-0000000DXbJ-3qNa;
	Thu, 10 Sep 2026 06:36:45 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YOm-0000000DXXC-2ykw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:36:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so17535855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022199; x=1789626999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b7aTmkgkOjMNLisksiT3PXivjuFocTpiOSE3RpArX7I=;
        b=L7K8Jy+tb2xvSeMQ55ZOG11zP6bk/N1LVMfZb6c6g3PaNxpXcuuMqKs4tL12qLU6LF
         +EMqOw+2+Ve91pzGSIgYXOMVOLRNN0erqyEwCyssakG/+VOzWJfxos7eplFgz5aDdjeg
         dnt/SrBOng9j4D2iNty7uu59X4qGYK23RDTnt/kQwYCT04GnrprQp6BeFTRi3d4Qg8vT
         DsGqZ2vaxwx+jRljgiR/OVcSv4ssrgKDnpNcY7HpsiMXPKlqFoJUuwJ1XQQUScA/z0K5
         UgguuktW/T5GB0LYsD9j6s0/FuJsR6I/qEUO7blOEwEXArv+iGxZW4gGtJsicHmu3VRH
         +y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022199; x=1789626999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7aTmkgkOjMNLisksiT3PXivjuFocTpiOSE3RpArX7I=;
        b=CnxOihBb9zriDml1tT8VNvhug0sMyu8scKrZ7krT45C7FdnYIYsgLUgpnX0jFjh0jd
         TcovAnwfvLqLT63h+QLdcrOyLaEiqOyKNjmSbAjVCp/g/+S5pBoiLd5G8wMSnX9FG1hY
         EeJJ2AUICxEAtGqIweYw5P1tfl7AfETE9ILbYODLgdGxYWGIt12bD9lQwZHAKFm3zzhU
         ppD6zJDrMk9LVu1iHW7h0BdI8HQRbmra6mnBUAJKuCAVXOg3ISD218DsbUa0vhyRj+iC
         vQWssaIGWLMGtH6RmNNwZTl54x95JerhePPLzY2AHlVLW9OxMlH17ZvimX/Sj7iyoLMD
         09UA==
X-Forwarded-Encrypted: i=1; AKwUvBzvfjYJRh42soWSEfasfSrE9+/Z2TgldM6lZrYbzqoYEOl9Pv6mGJYdhKNSrdNHl3+LTkByqUg01kcZ95e6X1Jg@lists.infradead.org
X-Gm-Message-State: AFuF++kvHH6xby9TC22YNd84IpdJYFtwstWqejFOioPrcxsWneN+40I8
	Lv3Qa664k6T8yqMK/ndup9dzs5axh/ReObL/URrmp2tjachJYJev1Bca
X-Gm-Gg: AYBFou1yTsBEhG1KjN3t3PsiB5yxW4E8+WYqvTttSLrsVcwkFOeiwViD5/j69C4flHd
	9KL06KKsynhPaXaaodm0EKOWiCV1f31RJ+SRzEjAJ2G8rnEmvumz66ZGbC7f27rmB2PRRlXVPLd
	aIVxeNZnLIlNKr5i1PXNmOHrWSUzzcelBXVnWqdvRmZIy185Xg1/Eb69RdiGX9pW/gp/yF/8Mbz
	R2DvO8Gt0I61omO6wGL33izj5md7a2rqT2Y/u8JG+G2M+VyX6Xd6zT7fXrkna6mwvYvmkKXLy/P
	62GE99JQphghVZfK7u5F9/ztpehp9T6NLpsGSD5T+GkOAd819fLdELmmamWiDoFY8Zgnni5aYLg
	rczWCFsYQbDTFyUbsD1yw2huk82swN7BB3upNA/uwc9n4xoFyZ7Uv2Tbr6CGsDnlAV60JR3Mb29
	D7xeRkhM/3XghwiO5kHjBvCUkDjrqXjwLcLCfIybLQSbujSgxtQFKbULyL9+qyyu/zORnbunXhr
	upYVJR/XhrixlV5jqgcP+GiwjDW/UD3seT//9qyQX4582vR23zTk6cuZ2wEyQN9RqGidpScYCbD
	tEoLrslLy6AwTXapQCQExYM7Qtn2vKRUxBr/kfodpJo3k4WhDAdPtZK1eHkGoXVRWhhSM4OEvMY
	yyBQmhA==
X-Received: by 2002:a05:600c:68d5:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49d26d9efb9mr17702415e9.5.1789022198365;
        Wed, 09 Sep 2026 23:36:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bfdb4asm47766655e9.11.2026.09.09.23.36.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:36:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ARM: dma-mapping: flush FROM_DEVICE buffers on legacy backends
Date: Thu, 10 Sep 2026 08:36:20 +0200
Message-Id: <20260910063620.17768-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910063620.17768-1-kmehltretter@gmail.com>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233640_826084_5ED04E9D 
X-CRM114-Status: GOOD (  12.89  )
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

The legacy write-back cache backends invalidate DMA_FROM_DEVICE buffers
when ownership passes to the device. A plain invalidate can discard dirty
CPU cache lines. If the device writes only part of the buffer, untouched
bytes can expose memory contents older than those present at the handoff.

This was reproduced on the ARM926EJ-S (ARMv5TEJ) in a SAM9X75. A
mapping-only test lost 339,936 to 351,744 of 409,600 CPU-written bytes per
100-iteration run. In a separate usbfs test, a webcam returned short
isochronous packets into a buffer that usbfs had cleared. Across five
boots, the existing kernel exposed 29,403 non-zero bytes among 245,708
unwritten gap bytes to userspace.

With this change, five fresh 100-iteration runs on the same SAM9X75 board
each lost 0 of 409,600 bytes.

Use the existing clean-and-invalidate operation for DMA_FROM_DEVICE at
device handoff. The cache lines remain invalid after the handoff, but dirty
CPU data reaches memory first. Keep the existing no-op ownership-return
hooks. These backends already use the same operation for
DMA_BIDIRECTIONAL.

The XScale 80200 A0/A1 path already uses clean-and-invalidate for this case
and remains unchanged.

Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/mm/cache-fa.S      | 1 -
 arch/arm/mm/cache-v4wb.S    | 1 -
 arch/arm/mm/proc-arm1020.S  | 1 -
 arch/arm/mm/proc-arm1020e.S | 1 -
 arch/arm/mm/proc-arm1022.S  | 1 -
 arch/arm/mm/proc-arm1026.S  | 1 -
 arch/arm/mm/proc-arm920.S   | 1 -
 arch/arm/mm/proc-arm922.S   | 1 -
 arch/arm/mm/proc-arm925.S   | 1 -
 arch/arm/mm/proc-arm926.S   | 1 -
 arch/arm/mm/proc-arm940.S   | 1 -
 arch/arm/mm/proc-arm946.S   | 1 -
 arch/arm/mm/proc-feroceon.S | 2 --
 arch/arm/mm/proc-mohawk.S   | 1 -
 arch/arm/mm/proc-xsc3.S     | 1 -
 arch/arm/mm/proc-xscale.S   | 1 -
 16 files changed, 17 deletions(-)

diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index e1641799569b..1ff3d66fe944 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -232,7 +232,6 @@ SYM_TYPED_FUNC_START(fa_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	fa_dma_clean_range
-	bcs	fa_dma_inv_range
 	b	fa_dma_flush_range
 SYM_FUNC_END(fa_dma_map_area)
 
diff --git a/arch/arm/mm/cache-v4wb.S b/arch/arm/mm/cache-v4wb.S
index 874fe5310f9a..87036c8bb318 100644
--- a/arch/arm/mm/cache-v4wb.S
+++ b/arch/arm/mm/cache-v4wb.S
@@ -244,7 +244,6 @@ SYM_TYPED_FUNC_START(v4wb_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	v4wb_dma_clean_range
-	bcs	v4wb_dma_inv_range
 	b	v4wb_dma_flush_range
 SYM_FUNC_END(v4wb_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index 4612a4961e81..c79f3c3e47a0 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -350,7 +350,6 @@ SYM_TYPED_FUNC_START(arm1020_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1020_dma_clean_range
-	bcs	arm1020_dma_inv_range
 	b	arm1020_dma_flush_range
 SYM_FUNC_END(arm1020_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index b4a8a3a8eda3..a117e26e4763 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -337,7 +337,6 @@ SYM_TYPED_FUNC_START(arm1020e_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1020e_dma_clean_range
-	bcs	arm1020e_dma_inv_range
 	b	arm1020e_dma_flush_range
 SYM_FUNC_END(arm1020e_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index 709870e99e19..63b4992f8ad2 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -336,7 +336,6 @@ SYM_TYPED_FUNC_START(arm1022_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1022_dma_clean_range
-	bcs	arm1022_dma_inv_range
 	b	arm1022_dma_flush_range
 SYM_FUNC_END(arm1022_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 02f7370a8c5c..c5e50395473b 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -331,7 +331,6 @@ SYM_TYPED_FUNC_START(arm1026_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1026_dma_clean_range
-	bcs	arm1026_dma_inv_range
 	b	arm1026_dma_flush_range
 SYM_FUNC_END(arm1026_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index 0326067c6c75..e30b013432f0 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -299,7 +299,6 @@ SYM_TYPED_FUNC_START(arm920_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm920_dma_clean_range
-	bcs	arm920_dma_inv_range
 	b	arm920_dma_flush_range
 SYM_FUNC_END(arm920_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index 3fe6fdf0d325..b1ace8c664e2 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -301,7 +301,6 @@ SYM_TYPED_FUNC_START(arm922_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm922_dma_clean_range
-	bcs	arm922_dma_inv_range
 	b	arm922_dma_flush_range
 SYM_FUNC_END(arm922_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 2d15467e4a08..3d91d16e4af0 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -357,7 +357,6 @@ SYM_TYPED_FUNC_START(arm925_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm925_dma_clean_range
-	bcs	arm925_dma_inv_range
 	b	arm925_dma_flush_range
 SYM_FUNC_END(arm925_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index d94aa8199452..bd335d703590 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -320,7 +320,6 @@ SYM_TYPED_FUNC_START(arm926_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm926_dma_clean_range
-	bcs	arm926_dma_inv_range
 	b	arm926_dma_flush_range
 SYM_FUNC_END(arm926_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index 545c076c36d2..ba7158639ab7 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -264,7 +264,6 @@ SYM_TYPED_FUNC_START(arm940_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm940_dma_clean_range
-	bcs	arm940_dma_inv_range
 	b	arm940_dma_flush_range
 SYM_FUNC_END(arm940_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index f3d4e18c3fba..a135c654b854 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -306,7 +306,6 @@ SYM_TYPED_FUNC_START(arm946_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm946_dma_clean_range
-	bcs	arm946_dma_inv_range
 	b	arm946_dma_flush_range
 SYM_FUNC_END(arm946_dma_map_area)
 
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index 7f08d06c9625..dbaf01ba7cb5 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -391,7 +391,6 @@ SYM_TYPED_FUNC_START(feroceon_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	feroceon_dma_clean_range
-	bcs	feroceon_dma_inv_range
 	b	feroceon_dma_flush_range
 SYM_FUNC_END(feroceon_dma_map_area)
 
@@ -405,7 +404,6 @@ SYM_TYPED_FUNC_START(feroceon_range_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	feroceon_range_dma_clean_range
-	bcs	feroceon_range_dma_inv_range
 	b	feroceon_range_dma_flush_range
 SYM_FUNC_END(feroceon_range_dma_map_area)
 
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 4669c63e3121..7df85a32f7b5 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -287,7 +287,6 @@ SYM_TYPED_FUNC_START(mohawk_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	mohawk_dma_clean_range
-	bcs	mohawk_dma_inv_range
 	b	mohawk_dma_flush_range
 SYM_FUNC_END(mohawk_dma_map_area)
 
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index fd25634a2ed5..6c5910bcc211 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -332,7 +332,6 @@ SYM_TYPED_FUNC_START(xsc3_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	xsc3_dma_clean_range
-	bcs	xsc3_dma_inv_range
 	b	xsc3_dma_flush_range
 SYM_FUNC_END(xsc3_dma_map_area)
 
diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index d8462df8020b..86422559d91e 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -390,7 +390,6 @@ SYM_TYPED_FUNC_START(xscale_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	xscale_dma_clean_range
-	bcs	xscale_dma_inv_range
 	b	xscale_dma_flush_range
 SYM_FUNC_END(xscale_dma_map_area)
 
-- 
2.53.0

