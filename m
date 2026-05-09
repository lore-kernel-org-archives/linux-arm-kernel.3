Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B48CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 21:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hA8cxoO68FqkEkiD4OFiUOBuQSfG4m+IhYBaBK5bzLI=; b=2PYe7LuJjFCX1A9k9W/VhIPq6f
	qSkTnV7qPXbOGMSxDpWs3gbmXZUGfzpReyYFq2WKdVkm1cX1QCeT3+hRzxZPk8V+boap4S3nKWmWo
	QeIHgMOS723bKzx/++sAEH/Z9zlOpF4w+nwCCzHNt3deaxrAtgz3luvGkw2+lRnMLdUbXcsjvvxjm
	hAGJ0rPZtLv7A8Gnjd5dQ7xx+Iik3uPNvO/z19LFjN1KWKRWaugzaR6Q3R0rYKkvkKsm6N8MKBxoe
	fTcvoNYI7ByPZexuXDODLHBpgU9SBUIUAQvueCvSAAVEfNqT0SnSkwWwbaySBDsgNo9DvIyWa2MaC
	eFPkQe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLp0Y-00000009fSt-1E99;
	Sat, 09 May 2026 21:14:46 +0000
Received: from mail-dy1-x1341.google.com ([2607:f8b0:4864:20::1341])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLp0V-00000009fSQ-3r2X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 21:14:45 +0000
Received: by mail-dy1-x1341.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso1833446eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778361283; x=1778966083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hA8cxoO68FqkEkiD4OFiUOBuQSfG4m+IhYBaBK5bzLI=;
        b=c0TrindCHz+wdcmKzegvog4yRjmo+jVF1/1U1gdV0FmBnbCvcNQahuAyk5avVo39mo
         M1+VPpN+w/L9Xlu13dckj8DAqogZjMiIiIjFtBfINjc/mo+DP3q63357w5hG+PvrPmfY
         RW+1NKD6oOzBE4kwiAQvNbrhOkq+cWUBJk9I8CiwlH/Bs1gdJMkNt4Ygmrrs3M31WBb1
         YNWIxGnCeFZ4BxCny2qf2AWNId3I2hQ5oYeW/SH0tyfVk70gd+qDUi0wguD/6YD4zY76
         PymsO1U6m4z+4T2nNY69bEP3s5NoOW6LbYlCCh6UyAdyd5w6oTHHUZ2fNXppFctBq4u4
         BXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778361283; x=1778966083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hA8cxoO68FqkEkiD4OFiUOBuQSfG4m+IhYBaBK5bzLI=;
        b=pYAR7N/7oZbYJq6+dGuYRFb7QHLZbLMUf+HXpjpR2tHSt/ZyUIcu13wVHAFi5k5ZsI
         lT6Cgl6ZJtC425RzpJaG6LZjM3ik2bmPqd5kPnYgM1HzlR2PcC7N1riQe/zdeqA+AMi9
         T0g173za/GOiJf9PXDIzTHLMPvPgNOSUj2uf4KrgTZ8B6F0g+BTbN4phxRLCKEOhNCbA
         DAcTZpabZN5BajQhLuqMKDe9ENownXhkawoNC6v6FKYef/lFFy30I/03V7S07ejX+b60
         3gx00YsA6Wf7RVBlRKQBk7ciJXw+wm78hwMjv65ML8sc20RmziqXlRmYseq0yiaUER1O
         Kz1A==
X-Gm-Message-State: AOJu0YwTXS5rYJ0ozcGbeiWIdCSe1cQmj5yF1zgLmDj1R0PgTIIWTe4A
	x06BU8dIV6jnRVWxr/ciTKhjFpdm7HH3ylHyyp0+5R2Kf4x8sNCT+47n/rAPmYzGhwM=
X-Gm-Gg: Acq92OHKOXUe5NCnou2QGZEOK+q0l/DGY4txvSunfxN8kIA5nscLXhIpK7vf4zsdh59
	iod/DKOqHxoxkQ1j5QOlXe09DgT7yE8oYUV9+OCtkjWVCnqSp+QXtvW3wCRV21f/QaiB+hwhriz
	RIBUfnTVt6sbQ2U6xML8g/1KYTQ6SB15WUXH11h6YdiTJE/ZBwd/MfY/EF9I8VQw+gTdsYPQEc+
	D3Oqi/m2+0T2l2x7pvcx9ZwAL8VOclUCTsdXgMRAzP52D6r6EW/y87oTPaNrJFNmENXfD5CfL1c
	TqE6ZrqfU6+8H8pNJvqphdFb9Eqjbz3jUJ+8Xdesm12phWq0clNasRzet89GhDI7vJjSnvdKxoh
	oLZP5ZGsSZ7J9ZT3ExHk4yIZNnqNLXBbCz7W9HxG497f/bU9XBHWu/EQwUUZd8PQfLTrR8JiecK
	oXSVWv5Y40OmdJhyM6C4vl97nB8lGK+VNw8cTqYI8pijkewi66uuYJS0s9fVJ/ghjsRWHStA2+h
	CLYAdfppPSxLi9JjcLYUibd3S0NbyZ3cycXdS7E5NiN0xvYlGLRfrM1mtd2ThJw1QWU6S1y4Ssp
	aCW4LnxF7PRiRq2JQw==
X-Received: by 2002:a05:7300:2d07:b0:2d3:9c91:6c45 with SMTP id 5a478bee46e88-2f6e24f93acmr5442464eec.6.1778361282799;
        Sat, 09 May 2026 14:14:42 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm7249622eec.26.2026.05.09.14.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 14:14:42 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH] arm: mm: init: update checks for Integrator boards to use the DT
Date: Sat,  9 May 2026 14:14:19 -0700
Message-ID: <20260509211422.33160-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_141443_961084_0AF75E0C 
X-CRM114-Status: GOOD (  14.60  )
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

arch/arm/mm/init.c contains two checks for ARM machine IDs via
machine_is_*() macros. The two boards concerned now support only FDT
booting, which does not use machine IDs, and therefore the code should
be updated to check the DT compatible property instead.
Non-DT booting support for these machines was removed in
commit d7057e1de8d6 ("ARM: integrator: delete non-devicetree boot
path"). The presence of these machine ID checks prevents the removal of
machine IDs no longer used by the kernel from arch/arm/tools/mach-types,
because the machine_is_*() macros are generated from mach-types. To
resolve this issue, use of_machine_is_compatible() instead.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mm/init.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 0cc1bf04686d..a44b16b3c273 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -14,6 +14,7 @@
 #include <linux/export.h>
 #include <linux/nodemask.h>
 #include <linux/initrd.h>
+#include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/highmem.h>
 #include <linux/gfp.h>
@@ -25,7 +26,6 @@
 #include <linux/execmem.h>
 
 #include <asm/cp15.h>
-#include <asm/mach-types.h>
 #include <asm/memblock.h>
 #include <asm/page.h>
 #include <asm/prom.h>
@@ -415,7 +415,8 @@ void free_initmem(void)
 	fix_kernmem_perms();
 
 	poison_init_mem(__init_begin, __init_end - __init_begin);
-	if (!machine_is_integrator() && !machine_is_cintegrator())
+	if (!of_machine_is_compatible("arm,integrator-ap") &&
+	    !of_machine_is_compatible("arm,integrator-cp"))
 		free_initmem_default(-1);
 }
 
-- 
2.43.0


