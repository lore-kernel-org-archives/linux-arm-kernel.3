Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A393CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YV5jWOYhrlFuZdEzQig/ubJ/S8SicyYdD1GKuIZqllI=; b=3RD5gCE3cbys/lDQXJAYB4Hcjx
	Kd1tLrS+RX6bpVTFtGgn3kbUaLRLoR84+1U1Z52OUm72RwT2CmSgOxU4va66i4zKUqGsrsy6GAWhK
	B6fmU1gFzoUngK1t43CwGtEb+Gg2hlV+l0rcB/Hh1rHnAwV9BBas5EzafJM+JxwNaUYoqyHZG8A8D
	AI7Qjibjpb1Rqbti+BcjDkumWxOxE6rI867LvT7BmbRPP2lR4cvhT7KHPPj6fYsxN7WUANMmHYkZU
	8vAccXAk4jyrXpJlVVGhocRMrJCVQoEP0kSUXYhjVsxfall01Th9z7XGffN2n5ss9TR+p4V+GfkKE
	PXiQzZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMCye-0000000Bn3z-1q9A;
	Sun, 10 May 2026 22:50:24 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMCyb-0000000Bn3E-3MBm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 22:50:23 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-132830d8281so5456601c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778453421; x=1779058221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YV5jWOYhrlFuZdEzQig/ubJ/S8SicyYdD1GKuIZqllI=;
        b=MbRSGPOkVsGoSp7AKg/T4gfyZRrdbYNcQD77WAR2/uGPTMVrhD3axE6OpGdQwoQ5dF
         vM5aaTh+00rLAwwy/X4rIVvGpKJmWE6Hz7XWNYcMOVyUWEV9BwnKmWUmcPVhhTqODpTs
         LortL/tGx6jR7wYnmH8el2F+OVOPdQZNwtRsdT+Y8KycrOEvSpcEguPjAoUEaFMU0CmQ
         3Ta2gwHkJLYEB6wvi0v8xnzJXgab+ZCqpFLe3mADiLek0Y5OBVUXgLZGCmKwprT2KJWb
         ncjFg+XCri95R0z0e7MeVHx7curVkgq8Z2Rvry3I7cw4J31l75YkHQAMUSp/a6cl167W
         SNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778453421; x=1779058221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV5jWOYhrlFuZdEzQig/ubJ/S8SicyYdD1GKuIZqllI=;
        b=G8oVP3XCMfpFar5bq0buGmwzq+zg/TRl2ayKhNSYGNLXr2l/PJpKm8c8uzriKpfG3c
         CkgpbcvyKzj06Fh16BL9zbfwDDjaM7lRP+eScWtR/YIt9TBUFFpPZN4OonSpN0JsKTKC
         RsP0DpCAyJP63d1MIn9OsQwCw7r5d4ErI3qEdRbFwNi1NDfz7xp+J2U9Z1bF4gMOOI0j
         7vFbIbw1dzwZMSqcmWzUrYhE3wBVWgjcGgYIAO5xkn8rMhwOFal8WOvNgUnVeOaloMAh
         k1Gpeg9f39H/0z1O2HeiHp/H29+Odd4WisO1OZUjYRcP949LxYgCTQsQh2Xvz8y+ggIv
         kFEQ==
X-Gm-Message-State: AOJu0YyDp+Y3KtjuCUuGZqtXD6rULZSXOSSmLRKmBMZeuJK/orJC3jqK
	5W3bQ/fH6IFl/6+iyHkxW+UDdF6CONFl796MCUqC1JUcHMoFZdkPq5Rnw6IVwv6V8h4=
X-Gm-Gg: Acq92OGHY4ZwqB93uK72sctyclwgIBLj18sAoYQc3ja1E0l5avoGEulQZodXAgHYGKF
	MaNmEW/G+tpK3sY9pWZSZAsCSf5vXqTfJmBYtfQ+iNvu+POZKtacBRKVFYjICZnPCOv1DqhUQuA
	pzqVaLq91c2/Bzgcii9Z63JKDDARP9/K6ZBDVV2yu6g0TTCRUbH6y+U5yNMCQXCXfHngbqLXLCV
	cDaR/QHysV5nkvm/mPcoGuphF2SB4NVSKYcbqrVksKA0FSRRMYGDMCQnETjzAMdc5sF0YSXH8dg
	O3s3VgBZ33dNwHKY488BPCfX4nqapru7rXCbs6ty+AROSeQoOmja9oWHO+EpRq6BS3Do/RjwB0Y
	zRwQc0amOzEIOWvaP17hfp1PNgA5c5jBshPlHTlPx7r5qxvOcUIexWGSdqmbo9z8ZYLhoFTC7Zg
	IXkFbKjAfKetGdC+7AOpmlW3d0xtSX854howdD+rEcKlMCdRRX18XFORYWyz7Dk3QMpUSZXnQcO
	MFdCCe8AJySsFMXp6kVfmh61ozhTZ+oDJKr2gz8nBM04+h5U9wmBXab5t2xDhPKLkEeQRgR0Ncz
	prtMf2pruUr6pEnmMg==
X-Received: by 2002:a05:7022:124:b0:12a:7181:2f1c with SMTP id a92af1059eb24-1327147e065mr6246909c88.17.1778453420600;
        Sun, 10 May 2026 15:50:20 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327875a269sm12000164c88.13.2026.05.10.15.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 15:50:20 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] ARM: remove unnecessary __LINUX_ARM_ARCH__ check in <asm/cp15.h>
Date: Sun, 10 May 2026 15:50:12 -0700
Message-ID: <20260510225015.15311-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_155022_245318_7250BBBC 
X-CRM114-Status: GOOD (  11.72  )
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

__LINUX_ARM_ARCH__ is only defined to 3 on the Risc PC. This is because
its currently supported configuration uses a StrongARM ARMv4 CPU, but
its bus does not support half-word accesses, so LDRH/STRH instructions
are disabled for it. Otherwise, it is a standard ARMv4 platform.
Support for actual ARMv3 CPUs was dropped in commit 357c9c1f07d4 ("ARM:
Remove support for ARMv3 ARM610 and ARM710 CPUs"), and therefore the
check for __LINUX_ARM_ARCH__ in <asm/cp15.h> is unnecessary. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/include/asm/cp15.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/include/asm/cp15.h b/arch/arm/include/asm/cp15.h
index a54230e65647..0d9f40b346e9 100644
--- a/arch/arm/include/asm/cp15.h
+++ b/arch/arm/include/asm/cp15.h
@@ -42,11 +42,7 @@
 
 #ifndef __ASSEMBLY__
 
-#if __LINUX_ARM_ARCH__ >= 4
 #define vectors_high()	(get_cr() & CR_V)
-#else
-#define vectors_high()	(0)
-#endif
 
 #ifdef CONFIG_CPU_CP15
 
-- 
2.43.0


