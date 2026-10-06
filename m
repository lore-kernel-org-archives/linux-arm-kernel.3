Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69ECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AW+mqH2re19ne9O4KJFVEoTrC+YDZvk13b6+8e/Lv9w=; b=wdzqalw6xWnVj2zv36QbHeRsGt
	kjdSRtX3uF+WvsZ1wpnJEtNm7cflsDl1WiMol25A8cwRJ1m0OFmtRfH2VLU8UI1xGB8PqO2k7Wkoj
	cojd8TMdTgrmXer17N2CWZ+z6w+dp+XYjhMAmg3OfyfJoT23pQdoipeSRXvECIjdwJcbC/W0WW9eg
	20Up2mI6ArdFw8KIf1AYlzWPb49z8B6O8LRreqE7WYeDa2NtNRfmMUZMCxfI0eeit6rBEDs62B7Pz
	c45RkDbN8dgPSQkh6ZMBBxAsSLiX+UknRnao0QmngwuqqyjjmSesNwo8tTfYnnPefJPDpEWUTff/8
	NdWELI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyFL-000000005z0-026K;
	Tue, 06 Oct 2026 06:01:51 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyFI-000000005xx-3NlG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:01:50 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-15dd124bbe7so217245c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266508; x=1791871308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW+mqH2re19ne9O4KJFVEoTrC+YDZvk13b6+8e/Lv9w=;
        b=o87OkQ8/8cx3qdkHUQ42m7suFVT4Jx0dxZcclGF1CD95tymnTGK3UYUosDOr4wj/XC
         SLMGjk+hni/Et9xrl9/Qzmu+XXaUTkAC06zXp0RpSd4MAuncQjbrF/mGIwkjk9+cuhnx
         M2peSbObbKS5o8EfXb+8gTgv/qZB6iFn8vNVtutLEx+Lxk7kDuWmBu9V4LP+2XL34/7x
         5P0vTLPTuHtK02a22vlvT5eS3NXnZ+mfhDlwJjVuhW3uzWyYgSuLWhuq7gWsejmPqKH6
         fD7ZFpjZI1VYB3UoNOxk4m0AYUcvpw0UrBF9iT6kSYFzvoviZc369s87jAUoOEzh+/tj
         LupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266508; x=1791871308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW+mqH2re19ne9O4KJFVEoTrC+YDZvk13b6+8e/Lv9w=;
        b=GYwH2nlrrcmKaP6zKEN3pJ9U+Ulj/teBg8lZLHRmoZIuUDxljRwVmN94D8UG2YhJdV
         xMvlX8CkNwviAjfBw83OMjm7D1YwWfLM/X3z+iNuEW1Ikwjae1FMlKzwlL/GqwrhAtBw
         SB2HalKu7mSAzdl8+xA1xW1ecg/Zo012CgdPuIPsrml6d3zqzX9LJjZ2sZz0DG/+LIiE
         Cn3xXqrlOLYJHGG7BtE1exfSqPdgDxy2zWPernymI1iPBEYPro2gMPDKTWphMaKmao0m
         KJc5mvffoSe1ll35KqKXaGLb3iJf7cjxnFbnv8tZUGAlsF9aRg2Z+OvZjA0o6odbeB/b
         pqsg==
X-Forwarded-Encrypted: i=1; AKwUvBw2pABq8tCCmzyVMPa2QJxOV8TVo5tcU3ZxBakQcE4cAUqViN+a6UH8BL5p/PPLJzLFXmmF53mimdgJ7f4WX+dt@lists.infradead.org
X-Gm-Message-State: AFuF++l3kjxPSIpRiaJEPNP8rPUBaaIRm9zzQeZmReS9Dyd6Isuc/3+2
	kIOimcZ+76uI305mWrVdXC2jkMwPjSWl6xHahli5sHqEmJN11NVyjlGH
X-Gm-Gg: AYBFou3C8uHQAQ+4rEmdCkNToAjoiD5jzrLZZTo6/DPXRvhfcbnl7+N5KRuazKVbdu5
	IMU9QXLAbC5Ryyo7S6In+0u/vbYwZnOXa1MYT6PygD8ccDW1r/V2Tyk8jvf4EYrM8RIA5S5SjM2
	isE3dXtJT//J2ayJDW2jTzdArFDkKZv/lfQIkpIaspHkQe3GcCmONMkaXvvRj1QlPLy/TuY1ssP
	l3BXq0q1enc0INdV5f5OBqZaKm5rErxaYQu2AaTev9TdGfqXVB9NLo+97YYrO+KDRfBAocL77WC
	5RYGgEh8+GkBoUVQFlPsHP93dr7mjiTUtSgYiYPQYz83Q5uZt2EnZARhOfiwkpLToEDlsSM2D6t
	r0ErlbVcJiaVydY3Azewz+lmXl57QSFjNKDBTeyz67f0S4JcWo9nWGRfs+kCBPdobzMARljxamt
	TrRsam7hHB6W/n1Ix/2nOncPG6heG5Ko8foNjAvhUWVgRqdKK3mPzvvmEBJ9Sj06zkL0oWS4PRX
	It4Xm9zc17QkFhGHIgQqwI=
X-Received: by 2002:a05:701b:4287:10b0:15a:4155:3daa with SMTP id a92af1059eb24-15ec93fdd16mr672452c88.15.1791266507680;
        Mon, 05 Oct 2026 23:01:47 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84ec510dsm5486567c88.13.2026.10.05.23.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul@pwsan.com>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: OMAP2+: fix typos in comments
Date: Tue,  6 Oct 2026 11:31:39 +0530
Message-ID: <20261006060141.43425-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_230148_851969_913B6479 
X-CRM114-Status: GOOD (  20.40  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  One further misspelling of
"peripherals" in powerdomains7xx_data.c is fixed as well: it is not in
scripts/spelling.txt, but it sits on the same comment line as one that
checkpatch does report.  Only comments are touched, there are no code
changes.

Assisted-by: LLM
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes (v2):
    v2:
     - Split the single "ARM: fix typos in comments" patch up per platform,
       so that each one can be picked up by its own maintainer.
     - Also fix the second misspelling on the same comment line in
       powerdomains7xx_data.c, which checkpatch does not report because it
       is not listed in scripts/spelling.txt.
    
    v1: https://lore.kernel.org/all/20260907064849.23086-1-hemanth.selam@gmail.com/

 arch/arm/mach-omap2/omap4-common.c         | 2 +-
 arch/arm/mach-omap2/omap_hwmod.c           | 6 +++---
 arch/arm/mach-omap2/powerdomains7xx_data.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap2/omap4-common.c b/arch/arm/mach-omap2/omap4-common.c
index 5d924b85b694..633451b6f548 100644
--- a/arch/arm/mach-omap2/omap4-common.c
+++ b/arch/arm/mach-omap2/omap4-common.c
@@ -96,7 +96,7 @@ static void omap4_mb(void)
  * interconnects.
  *
  * This situation can happen only when the idle is initiated by a Master
- * Request Disconnection (which is trigged by software when executing WFI
+ * Request Disconnection (which is triggered by software when executing WFI
  * on the CPU).
  *
  * The work-around for this errata needs all the initiators connected
diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 03cd523dff87..0f4ba19804c6 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -646,7 +646,7 @@ static struct clockdomain *_get_clkdm(struct omap_hwmod *oh)
  * @oh: struct omap_hwmod *
  *
  * Prevent the hardware module @oh from entering idle while the
- * hardare module initiator @init_oh is active.  Useful when a module
+ * hardware module initiator @init_oh is active.  Useful when a module
  * will be accessed by a particular initiator (e.g., if a module will
  * be accessed by the IVA, there should be a sleepdep between the IVA
  * initiator and the module).  Only applies to modules in smart-idle
@@ -674,7 +674,7 @@ static int _add_initiator_dep(struct omap_hwmod *oh, struct omap_hwmod *init_oh)
  * _del_initiator_dep: allow @oh to smart-idle even if @init_oh is active
  * @oh: struct omap_hwmod *
  *
- * Allow the hardware module @oh to enter idle while the hardare
+ * Allow the hardware module @oh to enter idle while the hardware
  * module initiator @init_oh is active.  Useful when a module will not
  * be accessed by a particular initiator (e.g., if a module will not
  * be accessed by the IVA, there should be no sleepdep between the IVA
@@ -1706,7 +1706,7 @@ static int _ocp_softreset(struct omap_hwmod *oh)
 		return -EINVAL;
 	}
 
-	/* For some modules, all optionnal clocks need to be enabled as well */
+	/* For some modules, all optional clocks need to be enabled as well */
 	if (oh->flags & HWMOD_CONTROL_OPT_CLKS_IN_RESET)
 		_enable_optional_clocks(oh);
 
diff --git a/arch/arm/mach-omap2/powerdomains7xx_data.c b/arch/arm/mach-omap2/powerdomains7xx_data.c
index 921cb1b29cb4..18cd74915b4b 100644
--- a/arch/arm/mach-omap2/powerdomains7xx_data.c
+++ b/arch/arm/mach-omap2/powerdomains7xx_data.c
@@ -223,7 +223,7 @@ static struct powerdomain mpu_7xx_pwrdm = {
 	},
 };
 
-/* l3init_7xx_pwrdm: L3 initators pheripherals power domain  */
+/* l3init_7xx_pwrdm: L3 initiators peripherals power domain  */
 static struct powerdomain l3init_7xx_pwrdm = {
 	.name		  = "l3init_pwrdm",
 	.prcm_offs	  = DRA7XX_PRM_L3INIT_INST,
-- 
2.47.3


