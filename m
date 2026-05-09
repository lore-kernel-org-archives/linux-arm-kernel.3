Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B47CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 01:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TXXt6IPoG7zkad4DUA+McXh2fJcYiyph1jCtx0enA5U=; b=ZNhqa2TVaoI1Tq401aNIRW4VKe
	a56+9JdCej61xpGwawnle4qAk52WZVmv7M0+ybZfxjN8QFGsIV0wk8gRLGmJ8U8CiaLzUVfWQfuvl
	JXnDx+tZapB0jvlMQjsSD/+mywGQA3fJ0KCxfxd7YBTMooAT4Fd11+0xZIz3CKBtKdYYwIsrUQkqk
	3cfhOh6G+4JFyNVofFlBr0rkYgUto5qsmbIAqPcxsPHN5jNyauoqjJ8KEth4Mac1eXbrzZHr7e6Sh
	HdxYb+yur9l+wML9gAOJJJ9Zo4MgMg6mWnwxkbpf96xfbG6JR7QwVoiv5fbLQiLMP85egXryLtUZl
	MjOSKRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWGP-00000007t2Z-0DHC;
	Sat, 09 May 2026 01:13:53 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWGM-00000007t1y-1s5Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 01:13:51 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-130b2295ed0so7558128c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 18:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778289229; x=1778894029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXXt6IPoG7zkad4DUA+McXh2fJcYiyph1jCtx0enA5U=;
        b=V4D1t1m53JU+vurb+kt9B8bemIKmbl8jIunF7U3xD+xxYIC/OJ70QDmSzlzWS3jaKN
         58HH+jo0hMxJMAhldlwSBMzOe1hLfnHValfBGRxPjD7PzToMYz2+aJJG4Vzzk+Jejo7V
         MaWRvHjl2GpRWzwHhpM97YZZLS4kDSSQir2rFAqxAPA+j/kzWuBR2dZgbTJanBLYbMZT
         1mbqqwxRf3v/miVttLsH5Rc32sH2W2GDZowy+FiWS7ZYXsOfqaw1ecQQ4LRvH+58nKl/
         KAODw4IXAPe6PIz4z83tXbzuh9tiQ9DOmWdD8OcFWK6JNDoG0f/71qpn7DMPKXrALGiR
         J+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778289229; x=1778894029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXXt6IPoG7zkad4DUA+McXh2fJcYiyph1jCtx0enA5U=;
        b=fIF5e43i8UO0gtWXxVT9HZra0h0HuiZ/YIn2zDdVezDi/Ko9dc3RW/Ghuyv+ZfeZHk
         JvLahDcO11tuT0RWtCgEKqU1Xg5LxtNt0x8/KK6nhO5iMLrxhU8TnxyQPX5cB3WeL22s
         bgFSDTpY5lf13An8IQuKXxv/MmC2pFQFJnjpSYZfvR7K3kXrBUDXRbE8DQqJte7XuWdy
         aSQf0bw4j5lSpLVuGV30RqT+EiPjXIPqNav1NqPeI6iTAr3WuYutwiU1+5shLKh1MyLc
         SHYeM/Mn+y22Wo7USa1JTmnnVYoCCqVZLLE1w8/qQ+N1OGKR+4oZLMtlxi5hAaL8qMO1
         O/PQ==
X-Gm-Message-State: AOJu0YySL4uAhzvhFzRRf+/mj6g1RpP1u7r1asMp+8SHWo9/bgn/UJEi
	8DY7AYfekN7C2qRbaEdSIWXzvuqDwqECnkCfpTuepNPUEPpvA8fKpJQk7pN5yUv+2aU=
X-Gm-Gg: AeBDietN/kMQzS7VKQGVeH5HQXurcbca3XWN8EwB2alZhcdn/XJv/mtk47eoExBmIqR
	4ri5Zu2OttqYJthZ3+x43pnmStWGGYEqZ7esB8eOkuKQ2j8aB1JkMk5ObKDOYv3f2urLJwruk0k
	vszY5Hy0PpuxmsOVg0Bz6IyPauWb/m+7D32Xh4FgR5bzb3GCiMCTwUTb6msWVVYBBUKhL+SKtyZ
	raj05Iw8V7N0ZlDN9YGGt/C7ZBk+k/14KgYjf+wZM9tOlXJuhGwBCgRNAn+OFzU4yh2xG0mWTCH
	0j+xybGkn5BBgo0NnfYEkvSZhJAJf7JyMooHMhUq8lr2SXzzMO7L6oa2Tv79BmqjWt6EEhJi94z
	kXrNf9ej/h/nuZI/ijWb3uOF7vq94zgzd/ATNTP7Bmc4t8NCrtpkCpAhRAMiz2mRU9YqUXKJFB2
	jud1NZG6MV6JSR3a9o6Icg5iKbFmXcAC2xlAO3kQ8CZMBNTliuIE6fzxkrKu22iqmhwOvedLd9L
	QYUJqiJQiGJUFYWmak1WoWqW0+ri8aTWf64NgH+rBwCGMUNbbQSKGe2mDMHR/KBZ0E6W5xe5nAC
	xOM8Wda/ed0aPlcmdw==
X-Received: by 2002:a05:7022:e98d:b0:12d:de3e:cbfd with SMTP id a92af1059eb24-1318eb56aa8mr7426643c88.36.1778289228724;
        Fri, 08 May 2026 18:13:48 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132787673ffsm5716709c88.15.2026.05.08.18.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 18:13:48 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] arm: boot: head-sharpsl.S: don't rely on MACH_TYPE_* of removed boards
Date: Fri,  8 May 2026 18:13:20 -0700
Message-ID: <20260509011322.13013-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_181350_579306_41BC107E 
X-CRM114-Status: GOOD (  12.65  )
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

Code in head-sharpsl.S relies on the MACH_TYPE_* constants for five
boards that are no longer supported by the kernel. They were removed in
commit d6df7df7ae5a ("ARM: pxa: remove unused board files"). This
prevents the removal of boards no longer present in the kernel from
mach-types. Replace the MACH_TYPE_* references with hardcoded values.
(If the IDs were simply removed, these boards would be detected as
other supported machines, causing incorrect behavior. The kernel will
abort on detecting an unsupported machine ID.)

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/boot/compressed/head-sharpsl.S | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/compressed/head-sharpsl.S b/arch/arm/boot/compressed/head-sharpsl.S
index 992e784500fa..da05e01903e2 100644
--- a/arch/arm/boot/compressed/head-sharpsl.S
+++ b/arch/arm/boot/compressed/head-sharpsl.S
@@ -103,16 +103,22 @@ __SharpSL_start:
 	.word 	0x08010000		@ w100 Chip ID Reg Address
 .SCOOP2ADDR:
 	.word	0x08800040
+/*
+ * These five machines are no longer supported by the kernel, but if checks for
+ * them were removed, they would be detected as other supported machines,
+ * causing incorrect behavior. The kernel will abort on detecting an unsupported
+ * machine ID.
+ */
 .POODLEID:
-	.word	MACH_TYPE_POODLE
+	.word	424			@ MACH_TYPE_POODLE
 .CORGIID:
-	.word	MACH_TYPE_CORGI
+	.word	423			@ MACH_TYPE_CORGI
 .SHEPHERDID:
-	.word	MACH_TYPE_SHEPHERD
+	.word	545			@ MACH_TYPE_SHEPHERD
 .HUSKYID:
-	.word	MACH_TYPE_HUSKY
+	.word	543			@ MACH_TYPE_HUSKY
 .TOSAID:
-	.word	MACH_TYPE_TOSA
+	.word	520			@ MACH_TYPE_TOSA
 .SPITZID:
 	.word	MACH_TYPE_SPITZ
 .AKITAID:
-- 
2.43.0


