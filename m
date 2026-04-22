Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D810FFA1FD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuqi0pEQ4aDjkPf/VIftR9YnRng2yC+64fHr+GUwwKA=; b=aGmw6zkWN/SK9gXj7m0aqesuf9
	Q5BGRcWi9/NuXT5Uy+nQB40Dk4GtRP/uJRd+9FCXGNIDeE74EVLtDE66QTHPzbm9oEKFSCRwPxkHb
	ZEpOrIiM/q1AYy8m7V+b8kgEz07QYo/ZiWIWcGb5M6GQWvvfSEM4Avexn6I/meGbE67W/xEOWXkr3
	oSjL/P1IULR4jTSRXMJxd6TLS+Pb+KXpP8WPIflgxK8Ync/iQS03frL9qSbJyLU4ylbcN+AyWQ7PS
	2BchkXj8YorQGpOyKj1kItLTrMCc3m9p/6DeKDQvSj14jmT8WN0z5MFJHx5O4Yar/dBoInLqKYrxn
	Y2GVsbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCp-0000000AYiw-2RgV;
	Wed, 22 Apr 2026 17:17:43 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCY-0000000AYWA-0tAF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:17:29 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43cff5ef652so3547615f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776878243; x=1777483043; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kuqi0pEQ4aDjkPf/VIftR9YnRng2yC+64fHr+GUwwKA=;
        b=XR54Wn9DYL07h41DD+8SJ+ef6v6LENHn/ksJLcTjymv2kQevY8LTYyNntQ+HLQS1Ye
         EKWftYo9rHg2ot5a4H96NyLorF+ALUX1FccrqLPwRk39gSVTGMtf8ExRGdgP5lE1eRGY
         Yd2kpIs7E/SPS5njQ46UUgfBs1nvV0Q+2clvKqtP24vMB6Q2tuOsokg2xH91hsWwu1au
         zyIeVrjh0S4Z5HHRhGN7BV1E+2wPKL70W1yGt3H16eHyjMxitVlTq4lG/FsYcQV2tiNy
         wJGeoBF5zsHjPVpAqce+51gy41f1IGFqO47vdTbkRlm/CIw7828eokurt/wAyyVpwuhA
         auaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878243; x=1777483043;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuqi0pEQ4aDjkPf/VIftR9YnRng2yC+64fHr+GUwwKA=;
        b=UOZw9+jk2sjtgGmM8NMDijk5ns2qjQCKXUK7P9vs2m4b0c6/FzB21NxhdzKAIwB6RC
         MHI+96YSvw34/pujw9Y4jpbRskfP5dqlW5UxNUzMJj6mONl+aXSORbGsF7WKMHXA57en
         UEwRP0LWMRJj+trgF+ImJ6HCZcsD7zcTKafXfupU+DLQqUimU//UXvNjnH6E8zUjNTza
         IGEiUJ6WdcunxbgD1w7BLufwfBLC1jrIld/7mb0PByqx1VjkWWoKA88L9AK9j0ltQPsB
         s+E1HJCPcKDXE2uEEgByF4mfVVwpNEq1XNzC0/l5Ku79LJdMQ/RpDRB4xhV+DKpaJrD4
         5zlg==
X-Gm-Message-State: AOJu0YxjWWgzzMtf790rdZrJY9Unc3B1i7KBjDkGV8TOReHfNBZ+t0Fm
	iWUHCSdR2QNB3vIdjv0ds1voxbJM6c4Z+Rjlb+QwXLlisHBZy9Si7OTHi5TcfwLgbs1yOAgmgEs
	7gH4RuHlzerEGUbJ8p5egwW46Mdkf0mhnwPUT8/DYyKKoBrEXfHOBnUlJC5aPRpKi4cjTmS9O4V
	GvsSSeoI4ZsQeWNb3ZKIVil7aZcTEDOcdZlLLNsRmqBoDj
X-Received: from wrre15.prod.google.com ([2002:adf:fd0f:0:b0:43f:ece8:6610])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:adf:e789:0:b0:43f:e94a:e773
 with SMTP id ffacd0b85a97d-43fe94ae82dmr21574127f8f.27.1776878243132; Wed, 22
 Apr 2026 10:17:23 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:17:03 +0200
In-Reply-To: <20260422171655.3437334-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20260422171655.3437334-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=ardb@kernel.org;
 h=from:subject; bh=+mzv579oicQpnDQky32vkIYpBcS6q+p6cFrwRCDc7Xs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfMl0+QsWclLTI08gu6hEhMu7A35euEEW6dSWKjl9/l72
 /V02k53lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlcjGZkWBPU73Lj+qWTd63+
 v1Vte9Jum7H+F++3/57q01c99cpjXszwT3Ges/Pv8JpTnFHXRMzrzzjrnd5eURr07u203D1/Nu1 cxAIA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260422171655.3437334-17-ardb+git@google.com>
Subject: [PATCH 7/8] lib/raid6: Include asm/neon-intrinsics.h rather than arm_neon.h
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101726_286088_346E8CFB 
X-CRM114-Status: GOOD (  14.89  )
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

arm_neon.h is a compiler header which needs some scaffolding to work
correctly in the linux context, and so it is better not to include it
directly. Both ARM and arm64 now provide asm/neon-intrinsics.h which
takes care of this.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid6/neon.uc            | 2 +-
 lib/raid6/recov_neon_inner.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/raid6/neon.uc b/lib/raid6/neon.uc
index 355270af0cd6..3dc20511103a 100644
--- a/lib/raid6/neon.uc
+++ b/lib/raid6/neon.uc
@@ -24,7 +24,7 @@
  * This file is postprocessed using unroll.awk
  */
 
-#include <arm_neon.h>
+#include <asm/neon-intrinsics.h>
 #include "neon.h"
 
 typedef uint8x16_t unative_t;
diff --git a/lib/raid6/recov_neon_inner.c b/lib/raid6/recov_neon_inner.c
index f9e7e8f5a151..06b2967fb8b6 100644
--- a/lib/raid6/recov_neon_inner.c
+++ b/lib/raid6/recov_neon_inner.c
@@ -4,7 +4,7 @@
  * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#include <arm_neon.h>
+#include <asm/neon-intrinsics.h>
 #include "neon.h"
 
 #ifdef CONFIG_ARM
-- 
2.54.0.rc1.555.g9c883467ad-goog


