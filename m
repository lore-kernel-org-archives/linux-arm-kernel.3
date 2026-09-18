Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78503C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 02:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rk+KoXta3dbAs20TzM2qXCVHC2ImAPUr9Ofh7+moDVo=; b=Iqd3ezdybFuCjdbxly9nQtPCmu
	TdUGZHPabqfbVvneiB4fqEfCxQPvsxPzqDoDzMH+bwAPOHnOKB8lXtQD4t4nXgoDw4cB29LVG4z4G
	TC6wWKc29u3KJQAA7OjkPNrDiXh5yHMy+AAsh2wdvY3DOZl4xYQuO72dctEwCMqKf8iDV4/w3XxYE
	sDXF0j/tnIlA4VLqQJmDIkEnVdkU/Y95YG62evoTyY86a8WcTaamIk1jeFqC/zcyXR85sjk+QI5Rh
	7Z2QpDrxUm9MrXCV5WXkA7S9XVUV5ipbtKj8J+sKRMbDrACl7vbzBVm00Fe4XPgI5464y8Mw3EbZ+
	MaOlYKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Oj5-0000000DLd8-1XWu;
	Fri, 18 Sep 2026 02:53:23 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Oj2-0000000DLcn-36ae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 02:53:21 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so72182a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 19:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699999; x=1790304799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rk+KoXta3dbAs20TzM2qXCVHC2ImAPUr9Ofh7+moDVo=;
        b=OIWkko0COY9Ktx37sS8IYRmBNad6XgiFIoyRxMhVW/M9pYoQO7SMbgpiQV4SFa2kZx
         fPuPlMCO0/u2bPwLPMwVsYgMyemrgj3w7TJR8Dv99K8EoMGG/QQnD8rd/vXO573Ab1KQ
         NM8TeH9JPAq+PaSLuOtYqJW0QEgpMLt1AWClC7vg7BCrW42Qykc6TlnGqgoW+il0fYUT
         EV4rpmRpp0cqu25dOUy9LUpKnud5CSk4V/pYITiG39VvEJFHyVzfXzubfKPoqNuAnXVY
         YocyDmfaNh+tAhSgthyWaBNjAku6tPg0PwR6dME9pa0Umzfc9McqSrFtYXNbzLqtEO4p
         Cy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699999; x=1790304799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rk+KoXta3dbAs20TzM2qXCVHC2ImAPUr9Ofh7+moDVo=;
        b=cfR2FmmnwydyyyL5vPZxWCo0KdVVFyWOCGt8JmPJjTP4dI1y+u2UB0I0MigbgFAJe3
         L88AYZa0zPKDwma8ifm+jd7GyviktgXpR6nHzx8zxLPE+8UZdbnmqZvdKC+YOT7RugBu
         5jMLii2iSeeczeUwFgITFiHGtsq1+ySUi1qgrjxmVbH5nSnmlob6uvnNQEs4HFHtKtTe
         YyvGU8IDks0b3zERK46dq0ZaP22EeOMwh9nXDOi41joI3FQBtJwslz+UfSLthQFdoU0/
         1oPtZLvW7VJgY93OK9UrQUR72EUfQzbB4AkjhQD5SafxM4oRlptf4Iw0ZdJC6WZ2nnNd
         4Drw==
X-Forwarded-Encrypted: i=1; AKwUvBxAGaQapvxGs/P7DsSUgBWYc+SnNfoOFORzAZInMcie8OnlVtbbBpOpgBDniZYzuZ8TZCgcaMCXjQsSsoAHLP8/@lists.infradead.org
X-Gm-Message-State: AFuF++lx4eMv/Nj/itDixeCqr3GxVJ+BitA112RZAS61DxIRbmOB4yuD
	Op/q8ULcA+4MfB+A91HdDzu5ywM2cUw/vL+nxDUVfEx82VrLeWEeVvUh
X-Gm-Gg: AYBFou1PdYq5uzHEglJc/kr17BSQKrofEdds54X+3TunJQHpuV5Gz5Heecr3g3C86kA
	9uEFCxPFWtrT6POF8HcztvCNwyB4Z0WMMo6rf7xXHB7I4UN0lRC48C0EP/ydofkypMdRWdER3uu
	57LGRkGIbA9H5Kj2tkx/yV6RNj7esVDhFkzpVkU1iWmDbodNHbGn4E+ltpWPnlx93aMbgfEO5Vq
	KGpKg2PUAHF2WMQhqtWuDNyzcSVHrTzTpaKEUvl77vKjelosc4KI37N/DdB+BocO1HDFDOV/Qf8
	HAV+8mms5Sm7RCrlikLIO/4VJz/52w/Oo952BfsNIqBmPQ+wHZPBLJZDkEMhLfxW4YXc583AjvX
	evPPn7Ii7+XlrI8Z4NLqGv5gdvbmod9O1YLPVg5cgWunNzFJfz2HH8VXjmI5OIIZTEUu+Of8kPd
	2Ll0TqUt/DexNy1cZldbv3dSMdcMtqDl529SLq6L2YxTRDKjmb4DroAjQbCVAgafdRbMcPVLVR1
	LgRgdQwIEsitYvcFAWNDDd5EE/6/Zb2YdLqcGK1RKj7EOf0QAKLZZmsEwB7/TVNQKbWmghiTVFn
	7WwEX7ARDxztJp9GMRu5hAV0IyEDb82/LKZPPydvgb1ckXzLTXrD/GzD+3Ib2j6xmg==
X-Received: by 2002:a17:90b:270d:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39e54d0edbcmr2520801a91.17.1789699999069;
        Thu, 17 Sep 2026 19:53:19 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce02b063sm726939c88.9.2026.09.17.19.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:53:18 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: OMAP2+: remove unused ctrl_module_wkup_44xx.h header
Date: Thu, 17 Sep 2026 19:53:13 -0700
Message-ID: <20260918025316.375757-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_195320_784889_5637AC55 
X-CRM114-Status: GOOD (  13.22  )
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

The last use of ctrl_module_wkup_44xx.h was removed in
commit 6bf588595913 ("ARM: OMAP4: Ctrl module register define diet"),
but it was left behind. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mach-omap2/ctrl_module_wkup_44xx.h | 89 ---------------------
 1 file changed, 89 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/ctrl_module_wkup_44xx.h

diff --git a/arch/arm/mach-omap2/ctrl_module_wkup_44xx.h b/arch/arm/mach-omap2/ctrl_module_wkup_44xx.h
deleted file mode 100644
index 414f14d1e0a0..000000000000
--- a/arch/arm/mach-omap2/ctrl_module_wkup_44xx.h
+++ /dev/null
@@ -1,89 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * OMAP44xx CTRL_MODULE_WKUP registers and bitfields
- *
- * Copyright (C) 2009-2010 Texas Instruments, Inc.
- *
- * Benoit Cousson (b-cousson@ti.com)
- * Santosh Shilimkar (santosh.shilimkar@ti.com)
- *
- * This file is automatically generated from the OMAP hardware databases.
- * We respectfully ask that any modifications to this file be coordinated
- * with the public linux-omap@vger.kernel.org mailing list and the
- * authors above to ensure that the autogeneration scripts are kept
- * up-to-date with the file contents.
- */
-
-#ifndef __ARCH_ARM_MACH_OMAP2_CTRL_MODULE_WKUP_44XX_H
-#define __ARCH_ARM_MACH_OMAP2_CTRL_MODULE_WKUP_44XX_H
-
-
-/* Base address */
-#define OMAP4_CTRL_MODULE_WKUP				0x4a30c000
-
-/* Registers offset */
-#define OMAP4_CTRL_MODULE_WKUP_IP_REVISION		0x0000
-#define OMAP4_CTRL_MODULE_WKUP_IP_HWINFO		0x0004
-#define OMAP4_CTRL_MODULE_WKUP_IP_SYSCONFIG		0x0010
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_0	0x0460
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_1	0x0464
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_2	0x0468
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_3	0x046c
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_4	0x0470
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_5	0x0474
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_6	0x0478
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_7	0x047c
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_8	0x0480
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_9	0x0484
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_10	0x0488
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_11	0x048c
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_12	0x0490
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_13	0x0494
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_14	0x0498
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_15	0x049c
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_16	0x04a0
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_17	0x04a4
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_18	0x04a8
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_19	0x04ac
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_20	0x04b0
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_21	0x04b4
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_22	0x04b8
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_23	0x04bc
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_24	0x04c0
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_25	0x04c4
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_26	0x04c8
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_27	0x04cc
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_28	0x04d0
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_29	0x04d4
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_30	0x04d8
-#define OMAP4_CTRL_MODULE_WKUP_CONF_DEBUG_SEL_TST_31	0x04dc
-
-/* Registers shifts and masks */
-
-/* IP_REVISION */
-#define OMAP4_IP_REV_SCHEME_SHIFT		30
-#define OMAP4_IP_REV_SCHEME_MASK		(0x3 << 30)
-#define OMAP4_IP_REV_FUNC_SHIFT			16
-#define OMAP4_IP_REV_FUNC_MASK			(0xfff << 16)
-#define OMAP4_IP_REV_RTL_SHIFT			11
-#define OMAP4_IP_REV_RTL_MASK			(0x1f << 11)
-#define OMAP4_IP_REV_MAJOR_SHIFT		8
-#define OMAP4_IP_REV_MAJOR_MASK			(0x7 << 8)
-#define OMAP4_IP_REV_CUSTOM_SHIFT		6
-#define OMAP4_IP_REV_CUSTOM_MASK		(0x3 << 6)
-#define OMAP4_IP_REV_MINOR_SHIFT		0
-#define OMAP4_IP_REV_MINOR_MASK			(0x3f << 0)
-
-/* IP_HWINFO */
-#define OMAP4_IP_HWINFO_SHIFT			0
-#define OMAP4_IP_HWINFO_MASK			(0xffffffff << 0)
-
-/* IP_SYSCONFIG */
-#define OMAP4_IP_SYSCONFIG_IDLEMODE_SHIFT	2
-#define OMAP4_IP_SYSCONFIG_IDLEMODE_MASK	(0x3 << 2)
-
-/* CONF_DEBUG_SEL_TST_0 */
-#define OMAP4_WKUP_MODE_SHIFT			0
-#define OMAP4_WKUP_MODE_MASK				(1 << 0)
-
-#endif
-- 
2.43.0


