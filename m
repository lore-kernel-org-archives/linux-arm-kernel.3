Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B67CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 00:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+K1gXhNARScleVAWtD5eQGG7lD45mQaIeuprMz+B128=; b=aYIbkkrSSjZrtBhP22WxJozn8T
	+1AZv1xP+D3bOtsqxryxnaS7kCcw4wU+FVq89LO+x/KCYbPe9mvbMATksxLLRSGvJE2zvNj8+sgxY
	ltby81j5D6UBvWwrzhkUvHXlufmc565rWh92VZ0uLk5A6qkmjGLOjH6vjQOG8rvoTLYcCY6jxAt4k
	n5h0idGtYNIPOVStJJssNk58uYAY8CawS0r9qLYu83bMtXnzRadar7Z0XZrmdpodzmPU9gUGbrtvf
	59MOo3SXDqi3F4CaJmz0hWabRmxlTVHkexDWLb1WjJT+xD83imDd4he3tDQVGypbTIbAq11NTMwfm
	J/a8Ae6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXTZi-00000008VN0-3UWL;
	Thu, 11 Jun 2026 00:47:14 +0000
Received: from mail-dl1-x1244.google.com ([2607:f8b0:4864:20::1244])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXTZg-00000008VMZ-2Z7s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 00:47:13 +0000
Received: by mail-dl1-x1244.google.com with SMTP id a92af1059eb24-13817614cd3so3361895c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 17:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781138832; x=1781743632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+K1gXhNARScleVAWtD5eQGG7lD45mQaIeuprMz+B128=;
        b=HvlJoAdWX+nZzWGXFr69jM0hSHzVIpILself8z2CLsMQS5x0BNY13BfvKoVmzD+HjE
         NOPNm6arhHw6IEFDzpEHECrWezC+l3P07KTD7CW9V9TOI7YwXR3F5XstS5j83VZvxL46
         7ChA9nzQt2AxuDcP54NTfxwpwGHcuHW1p/8hDriildzWYfIbw6OHFshMm0u+HSlxm24H
         uTzE6roJU5Jx4gKRf1zx4M2YXPc2TKBMjpCQioSwejhwFlX9TrnvRd8BMTq1XoaStU1z
         8VHQp1JD/Czin30BkBR0Lm5H9tIkDeTkV60ChVqxVJFwhCnPF+rGqflU/Of5dG1hZXzP
         kLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781138832; x=1781743632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K1gXhNARScleVAWtD5eQGG7lD45mQaIeuprMz+B128=;
        b=YttMyqFPiXA1oN0aI3rS7eB573Qf29240Oelh0e6s7i4eCLdMIVlRu9iDiVVM+7bRg
         NYzbU58qqvdYFx6p7Gc7BX3EXMQoioqcEYrWhEuxQCl78TKhyA9216fnDnTWJrhWSMFv
         f/p3rOg4s0vcbq5FOiJf937prFQRa8O1ZrGkmLhm/x6b0z4uLsCwJkrvu+k7FylEHKKK
         e0BTKmksf1BcOJxAT+DrpbHU9mLpZ7w0JrnKWolxFXSrAJD1bz0+NIbxx43zAR0pdp1A
         cgvknioqHBbpz0ltjNnOP9E9BdZziA058AXuo6bO8M+KHNc6sv8EHNd3HAJbWZ5Hip9P
         VlIg==
X-Gm-Message-State: AOJu0Yy++WPg87/AJWpGIb27/uWyfuB167kgw6bD8Ww1rWBdhCOKHzL3
	5fhf7SvGYoJqF2QQ2umIwlfMxjWWlxLnbssHyUl9+lr3j96U1LjIEYnX/xYzBhfx
X-Gm-Gg: Acq92OGadwYYWvv24T4uEeFn2VP6fNCqzYo7scUFOmZQ4xXHiTUq1u0bxqo886rOgUA
	k+v3XXNSRK9Mbyau6Amyhn9gl2GtuFLA8bbeKSP/wPBDUtvs7n/8T6CM5obO1j6SnT84r/hcaYy
	hedX8JHEwsly8y/heqwwvkvYOMcQG3FZSqsu/N8asKvvOTlgUTWzLTh6uTaATaCLNqRKEeollTE
	BNCujWoGliDoAO1fOXFeSTq6kJW9V86dDhmwwAikPP04r7ZHvVT8tJ/PkC8T/7q4L41JfcPZguy
	ekDjLBcmCL7yW/XJqS9WOiT+iArfkkEWMqwrVnwXjK9sLd9l9/csGiJQXQg95Bg6BuDh1B0jpPK
	gDzCjmCoAdOS/SKF4rwuZzk2XcNUfN5YoLtpH1slETiwr1Rf6cRdfFHAC9qJ2vfzGfM7fVOr0P8
	nZSgxOUWYyfpyFSTg4BVpAZr6HPKZVBrqlGrfmmoPlF3xQ+lSPVqQY9yNjtfLsu7XGqrInXxLBJ
	5W4/kYUCh2T25Wj3rtWuIJFXuJ+q/6SZ/5lxC7C8Lrzk1JAmVrpIqLAWzeC5Yvw5Xl7s8/Cc2SA
	7i2HwWCpYrEN4avq3st+Zr2wNNL8
X-Received: by 2002:a05:7022:ff49:b0:138:104:439b with SMTP id a92af1059eb24-138422e437emr325019c88.19.1781138831410;
        Wed, 10 Jun 2026 17:47:11 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384303a312sm207549c88.12.2026.06.10.17.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 17:47:10 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: remove references to removed CONFIG_CPU_ARM92x_CPU_IDLE options
Date: Wed, 10 Jun 2026 17:46:52 -0700
Message-ID: <20260611004700.395759-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_174712_682942_A3B23608 
X-CRM114-Status: GOOD (  10.21  )
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

Several assembly files in arch/arm/mm contain comments referring to
CONFIG_CPU_ARM92x_CPU_IDLE options, which have not existed in the kernel
since 2.4.21. Remove them.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mm/proc-arm920.S | 2 --
 arch/arm/mm/proc-arm922.S | 2 --
 arch/arm/mm/proc-arm925.S | 2 --
 arch/arm/mm/proc-arm926.S | 2 --
 4 files changed, 8 deletions(-)

diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index 4727f4b5b6e8..0326067c6c75 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -8,8 +8,6 @@
  *
  * These are the low level assembler for performing cache and TLB
  * functions on the arm920.
- *
- *  CONFIG_CPU_ARM920_CPU_IDLE -> nohlt
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index 5a4a3f4f2683..3fe6fdf0d325 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -9,8 +9,6 @@
  *
  * These are the low level assembler for performing cache and TLB
  * functions on the arm922.
- *
- *  CONFIG_CPU_ARM922_CPU_IDLE -> nohlt
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 1c4830afe1d3..2d15467e4a08 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -15,8 +15,6 @@
  * These are the low level assembler for performing cache and TLB
  * functions on the arm925.
  *
- *  CONFIG_CPU_ARM925_CPU_IDLE -> nohlt
- *
  * Some additional notes based on deciphering the TI TRM on OMAP-5910:
  *
  * NOTE1: The TI925T Configuration Register bit "D-cache clean and flush
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index a09cc3e02efd..d94aa8199452 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -8,8 +8,6 @@
  *
  * These are the low level assembler for performing cache and TLB
  * functions on the arm926.
- *
- *  CONFIG_CPU_ARM926_CPU_IDLE -> nohlt
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
-- 
2.43.0


