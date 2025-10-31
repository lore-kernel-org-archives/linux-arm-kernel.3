Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D104CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EBCI2bCGa2uMBxuOl4BNLMr0TWQdRgwa7kpYQ+xRQo=; b=EiI3yhLOzDg6+9jv02wH9/kOzt
	TsUqCHd2Oq/eS3UBgnEmrrvpEcCN4zjp8fe+rGJanDSEgr6RhWAG8x0M286abY2N8FNTmSKhokXdj
	fGd2SHQ2XZoL13cxzw/S/ym8/KBMcJRuNf9/BTBdkXJhceTmkloHW0mnsf3RS09V7ouPlqwTiJDao
	YD2d/iY5NvUDyxA2Bvv64ADPBY6KriorkhPkqKLFTTzEYD3eliHpG3hiO2iTKh7VV02Y2gFF3Jn/A
	FCIqOBe5j4tHnEXYJ7JAdGc6s0LJRBayjy5ZffOG7RRB8rVFHAZr8/bC8xR/VZt6i1S/jL5g5RRT5
	a/EEzHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZ4-00000005vp2-2XIb;
	Fri, 31 Oct 2025 10:41:02 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY9-00000005vFt-14x4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:40:06 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-475e032d81bso18335385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907203; x=1762512003; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EBCI2bCGa2uMBxuOl4BNLMr0TWQdRgwa7kpYQ+xRQo=;
        b=POf8bMl4PJipZDynBkO86FJd/BRpDlLYgbOi8kDBDZifJQ1ueuFXTqfwXB9t9XP5X1
         imBRzBLoQ6rlqj41zy8mZNDrV0IMimFbba8Hl5bb1XAyPA0ykj/ZdcxLAj+agx/PyTTx
         fL0yV4q219tJFEzbz2hn2H+lBwgHQ7H+Svkgt1oSp50IVf4PMFb77bSm1q13WuiwFNmu
         H/yXGejyfXlk85tdEcvnHH8WLpwrIjJa2d8+7zLjkTc53Xt7JcrP6OxZSawA22ODrbdf
         cb6CfZLy0IAdEE2yS3HOqZX019NBcmTH4ZVMNgKA7dpxN6IWz2E+4rq13anDZVNh8jhE
         L1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907203; x=1762512003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EBCI2bCGa2uMBxuOl4BNLMr0TWQdRgwa7kpYQ+xRQo=;
        b=cKt33lnCXODj6Gp6GmMBQ2faygV9ekH9t2Wa5WukmkHOZaxv/G8Z9a9We7B+NqdNC4
         +6gL5DPsyP13KUOHU8I7csazHF5aATJK6zzeurpNrKX03h9oM6svKCpLJZbT5aPc5RFR
         ccmmnSkqE6JRLOuvAnsInQVXZMZEsX6Z49tkhv7UrAuMzQQ4VtsLg1vmsFJEeH6S9j9O
         C0B4IgbaQAdqL/ZFlW6IiD8DGlFbwbQOD7x4JX7FyAD3sARp6vWudLPXJEoCATVjgECU
         Cn6kMXMWwhRPqxJmAAGIc7CkB93B+5hiFYOiwTYy1AP6uf2fjxsd7dJxtoQRrRl83RUV
         TlMw==
X-Gm-Message-State: AOJu0YzUhIQIMigJwMXR1TWlUh8Ckzo07j0+apTG1HDpNCKBztn8kWy5
	I2bimk8MhaDi3vWylZJn7l1B+v0aPVe3DhuDaiuLgR/u3WG1/J4qgpZDsDkXMYQh0sDUW1dVWQl
	KcnYZZVAxRNsHr5dM4ZVCN7hHdh9PwEAso2tIB+dAZL5bmVppbltdtaMse7HxoIQRm2kJRoEnXy
	HGMX3nIjoybqpurPLnz3EguANuN+c9gXtoA9Be1NyXxHjj
X-Google-Smtp-Source: AGHT+IEsXL7pay8yayVs9zynCOgQoK1Z8jXHUNfyuqH/t2/LwKAhQiBuGbloXMNB6A2V6Qfym6M16bpZ
X-Received: from wmcq10.prod.google.com ([2002:a05:600c:c10a:b0:475:de83:8f42])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:190e:b0:46e:2562:e7b8
 with SMTP id 5b1f17b1804b1-4773086e447mr24492465e9.21.1761907203196; Fri, 31
 Oct 2025 03:40:03 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:17 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2401; i=ardb@kernel.org;
 h=from:subject; bh=+pRFDT2DZ8ceDoxhoXJcyM9jtfEdqdQN8vIsBlZZ/gU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4t1Dt15MeJZtLZJ3Lzvy9fFThtcuKypWxDt61IdM+
 cdQEmrYUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZy8iYjw6+vB+x4V7qGiTeI
 G9gKXzI9xNa6iaNu36esCEmj/TPP6TMyHGXxmszGJcf3Y+WEDUrhOzWLv/x3+6d9ImZ/w8awfis bfgA=
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-41-ardb+git@google.com>
Subject: [PATCH v4 18/21] arm64/xorblocks:  Switch to 'ksimd' scoped guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034005_359173_E47A8661 
X-CRM114-Status: GOOD (  11.61  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Switch to the more abstract 'scoped_ksimd()' API, which will be modified
in a future patch to transparently allocate a kernel mode FP/SIMD state
buffer on the stack, so that kernel mode FP/SIMD code remains
preemptible in principe, but without the memory overhead that adds 528
bytes to the size of struct task_struct.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/xor.h | 22 ++++++++------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/xor.h b/arch/arm64/include/asm/xor.h
index befcd8a7abc9..c38e3d017a79 100644
--- a/arch/arm64/include/asm/xor.h
+++ b/arch/arm64/include/asm/xor.h
@@ -9,7 +9,7 @@
 #include <linux/hardirq.h>
 #include <asm-generic/xor.h>
 #include <asm/hwcap.h>
-#include <asm/neon.h>
+#include <asm/simd.h>
 
 #ifdef CONFIG_KERNEL_MODE_NEON
 
@@ -19,9 +19,8 @@ static void
 xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
 	   const unsigned long * __restrict p2)
 {
-	kernel_neon_begin();
-	xor_block_inner_neon.do_2(bytes, p1, p2);
-	kernel_neon_end();
+	scoped_ksimd()
+		xor_block_inner_neon.do_2(bytes, p1, p2);
 }
 
 static void
@@ -29,9 +28,8 @@ xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
 	   const unsigned long * __restrict p2,
 	   const unsigned long * __restrict p3)
 {
-	kernel_neon_begin();
-	xor_block_inner_neon.do_3(bytes, p1, p2, p3);
-	kernel_neon_end();
+	scoped_ksimd()
+		xor_block_inner_neon.do_3(bytes, p1, p2, p3);
 }
 
 static void
@@ -40,9 +38,8 @@ xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
 	   const unsigned long * __restrict p3,
 	   const unsigned long * __restrict p4)
 {
-	kernel_neon_begin();
-	xor_block_inner_neon.do_4(bytes, p1, p2, p3, p4);
-	kernel_neon_end();
+	scoped_ksimd()
+		xor_block_inner_neon.do_4(bytes, p1, p2, p3, p4);
 }
 
 static void
@@ -52,9 +49,8 @@ xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
 	   const unsigned long * __restrict p4,
 	   const unsigned long * __restrict p5)
 {
-	kernel_neon_begin();
-	xor_block_inner_neon.do_5(bytes, p1, p2, p3, p4, p5);
-	kernel_neon_end();
+	scoped_ksimd()
+		xor_block_inner_neon.do_5(bytes, p1, p2, p3, p4, p5);
 }
 
 static struct xor_block_template xor_block_arm64 = {
-- 
2.51.1.930.gacf6e81ea2-goog


