Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAA3CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 22:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KaD8PMAL1fGcxVqGq3EhU94/gRz7M4CXPsJBOwicYdA=; b=s1zeieLMBdhgA9xEYrJ8vocyiI
	HEzQdJ6rYVa4i4PjGmOW4P0TGenGXHZHcbJQAMBsuXxMGhXdvhC3OUkjnWdd+4p9n3IbsbycBXNII
	1OvFllVrvJiFbiMv88xE/66zhQZ1hU7/Ov4ePGvVRdVnkniS/Tuc+JToMuS1wKQ0G+GE7rUnOazc6
	aeHlULtd0aHCHIy6FuEyV/56zGyjp1OZ6FqMW9io1APmzjYVHMAJY6cNF2qOIMgOxs3FYDnGOD5vx
	2cp8gSYwR7gfxMr149LuIBb7WRXUpg6aMaYT+FHM7UN8v/6KIruiI7hQLKbx+2VOfHTIq2ebrx7zL
	Z5+WL/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLqJZ-00000009kqn-1VxC;
	Sat, 09 May 2026 22:38:29 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLqJW-00000009kqJ-2wX8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 22:38:28 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-12c8f9846c8so4485274c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 15:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778366306; x=1778971106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KaD8PMAL1fGcxVqGq3EhU94/gRz7M4CXPsJBOwicYdA=;
        b=jvXnZ9VZf7n3Gjd404I6TP5RZn4H82v1NNigUXI422OhP1YbLzVKyTbwttrnB8g1rj
         ebpa/mJsnd5lqtKRq8S9DBcPHp0F+BIqbtRTHl+FZeDMvE22uIpaKIaTJO+YtGfYFjab
         n29uLWledi4oyj1qVxKs3u9hFa+Q+9Vxd0RZddsReuSipkoFOxAvxrc3NbL7jfpxHk+e
         hhorpxNwP1mxXsBTY5wiGmZrXCArDzQV801r0ApoUfJqzP5QIt1OlX/ANIc+eMC/oZ8L
         dz1H3O7dv9vPXcvQtBm1fwlSTRoJhcDnH0bShzQr3SsITRvvQ8o5nLkoIs0Deg+tIzGY
         ppuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778366306; x=1778971106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaD8PMAL1fGcxVqGq3EhU94/gRz7M4CXPsJBOwicYdA=;
        b=r+A7bT25nwDNz04UjmASIROAAE3EtZVIMFJXXOQYjiAPInORNwtB2ohl49DKmYLuEg
         4uj4MhNhLkvoF97C/5+lgGLQSx6ysXyKMNkUIdxafYfuNAbmDTA3b+upSKAlJxy5mgxl
         nxZd1gzyXIKdH8PMF4jxBOx2/w+1+M9mZ4cTq2WWwCVoCudDTXS4tKzBftBPR9qD4S7A
         ziUhPhrORf58CBJcBkovn3qeRNK1t7sQ2wNPw5Ye6awVDa4hGmzf2Kw07is02qmVKsld
         FIJaYpW4ZyIKg0eOaMzf40CPsATV5r983EpWfaL+cSRU9SAwHy92FXbx5NknSePgrPpz
         XReA==
X-Gm-Message-State: AOJu0YzcSibU511qCNryuw4gWgwCGy0INKvSAKNuwVmJSUDwnZSIMO4k
	fte6VpJFppz1neqfS1edS0pDtbboPMuCcXZ6vpSzMVPmoUvs4cZWjSkF4nUbww4l5ys=
X-Gm-Gg: Acq92OFcrC64NCxXB1vB2IoErx8aswEHLKc11HHNJR3USz6I+n4CjZNtY/7aTa2ZIHw
	J+d3JUOXI0ux8iJ1f3C6qepDZT8mOacM8cocbMnhapSRI4UEouiHDNHF836mSe5z3HMSCsE7Qmh
	Egn4mrIQ7tcQSYiP6OXtqOdJBGMlZK7chUtkhw2LHmBrI+P53cAW0HqoaipwCsnuKBWfqRaOlvq
	F5yi4J0+9MDqyc7nFF6XpAOOInHJuqQO5ryG9EtbEVLuv9uQgbS3J8dk57dIUE+RKMqgRKZf3CK
	nOsfVPbH1tQM3ewDV6WyYcjv5HPgpxgfyf/bPWCNUyFrv7w0g/Uq0Cb74PU6d6pxxr11vTyblK0
	FjrJt8E7v0m8VwyRlPxbPsFc03yUuBaFx5R2+tsV2u2nTJzOryHWtnwHzpRBTDBpnqviuycNrZM
	XH6Qb8h8q/zoarkKoWJKF0fd20xl0hF/2q1WUX1+ymCv3CAZ2vSC8y/10frWg4DRvYjxZOWh4iV
	YiMnbHS6o8O6mhIRSpIcogqfSCG0/mdUaqZhKloXYNLoEWv7kiNrMCMB6WMzcFEjfE+wXbJ5bsH
	9O98+lc9IBaVDYKa7A==
X-Received: by 2002:a05:7022:238c:b0:12d:de3f:f3dc with SMTP id a92af1059eb24-1318ec5fa20mr8840329c88.38.1778366305800;
        Sat, 09 May 2026 15:38:25 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm9887550c88.4.2026.05.09.15.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 15:38:25 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>
Subject: [PATCH] arm: boot: ep93xx: don't rely on machine_is_*() for removed board files
Date: Sat,  9 May 2026 15:38:19 -0700
Message-ID: <20260509223820.50347-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_153826_777409_6833E5C0 
X-CRM114-Status: GOOD (  13.66  )
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

Code in misc-ep93xx.h relies on machine_is_*() macros for several
boards that no longer have legacy board files. They were removed in
commit e5ef574dda70 ("ARM: ep93xx: delete all boardfiles"). This
prevents the removal of machine IDs no longer used by the kernel from
mach-types. To resolve this issue, create local copies of these macros.
(The checks themselves are still valid because the IDs are still passed
in by the bootloader on these machines.) Also take the opportunity to
remove three repeated checks for the same ID.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/boot/compressed/misc-ep93xx.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/compressed/misc-ep93xx.h b/arch/arm/boot/compressed/misc-ep93xx.h
index 65b4121d1490..b0a1b42aab31 100644
--- a/arch/arm/boot/compressed/misc-ep93xx.h
+++ b/arch/arm/boot/compressed/misc-ep93xx.h
@@ -3,7 +3,22 @@
  * Copyright (C) 2006 Lennert Buytenhek <buytenh@wantstofly.org>
  */
 
-#include <asm/mach-types.h>
+/*
+ * These machine IDs are no longer used by the kernel since EP93xx was converted
+ * to DT booting, but they are still passed in by bootloaders, so we use our own
+ * local definitions of the relevant macros.
+ */
+#define machine_is_bk3()		(__machine_arch_type == 1880)
+#define machine_is_edb9301()		(__machine_arch_type == 462)
+#define machine_is_edb9302a()		(__machine_arch_type == 1127)
+#define machine_is_edb9302()		(__machine_arch_type == 538)
+#define machine_is_edb9307a()		(__machine_arch_type == 1128)
+#define machine_is_edb9307()		(__machine_arch_type == 607)
+#define machine_is_edb9312()		(__machine_arch_type == 451)
+#define machine_is_edb9315a()		(__machine_arch_type == 772)
+#define machine_is_edb9315()		(__machine_arch_type == 463)
+#define machine_is_ts72xx()		(__machine_arch_type == 673)
+#define machine_is_vision_ep9307()	(__machine_arch_type == 1578)
 
 static inline unsigned int __raw_readl(unsigned int ptr)
 {
@@ -60,14 +75,11 @@ static inline void ep93xx_decomp_setup(void)
 	if (machine_is_edb9301() ||
 	    machine_is_edb9302() ||
 	    machine_is_edb9302a() ||
-	    machine_is_edb9302a() ||
 	    machine_is_edb9307() ||
 	    machine_is_edb9307a() ||
-	    machine_is_edb9307a() ||
 	    machine_is_edb9312() ||
 	    machine_is_edb9315() ||
 	    machine_is_edb9315a() ||
-	    machine_is_edb9315a() ||
 	    machine_is_ts72xx() ||
 	    machine_is_bk3() ||
 	    machine_is_vision_ep9307())
-- 
2.43.0


