Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6BACA1000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnfEnmf1rS4wgAw7cCMpCnyH3n29KRVvJCAj5QRuwc4=; b=gQoyZSapCnIWiee97MfLT0ejSG
	peCOFI7ua6zfK2y7u/HUtho4t4KSAG2W6XVSdO5yMS/DpDXgvDEseMZq8hbsOQPksSWJLru0+bFtx
	xfgFmyA7LhPHQpieQQ2JRnPR0TzL09YFJnAvn1fvYmBXhFiCl6vlz5+csfVNdduT4rlDUqp43U7lA
	BK0pRaLJiH6QuwQNc+h/OLpyai3/jmVmFpqGg3bmb+5EYUxtphqsksuxSouRIzUpYcggiMfxVBYs7
	fVO10xrTXX9+5SQPSXqB090nKGTIhMmE7cmwsHXN24IkFQy+gKY7MWBtnUr7Rf/go42HpCwSuHMRH
	RYiP/g0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryAp-00000005dkh-3HZA;
	Fri, 29 Aug 2025 12:25:43 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvlu-00000005CvY-0IFJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:51:51 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-afcb7a3a160so174740266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756461108; x=1757065908; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnfEnmf1rS4wgAw7cCMpCnyH3n29KRVvJCAj5QRuwc4=;
        b=grWB2E8VGEnozKTbYJf2t0NqQVcasISjsb2y+xqOXjz78qpyhZF6/2gvaIwELHd21N
         2V4AK1L5C7DwokTxVRza9TiqrpUV96Vzg7YrpqYqBk0v370eNV3rxuIDgS/gOY0+SECZ
         R8vc3ZdQNJJwhy0b7Ro+Np5mGoCgOmkuQbbzPSJweufifLB56yl6MoAMlsQVGnxX6tm6
         k+zjxRGeS4dJX3He4YdtkwjVyPXCHzbaFXOir0ugSX2i/cNw67VRXge5x4p0OGaSvF8C
         8zotEU0zH2mSevCteceMh3hDAMqsHtK+HfiFK1Nu/sPvww23crcxqPQFt26cnu0zliAp
         PWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756461108; x=1757065908;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnfEnmf1rS4wgAw7cCMpCnyH3n29KRVvJCAj5QRuwc4=;
        b=u1t4wOoy8+9GOwG++fFJ+DYGaqnO6GJdE0AMYaqJ3FOEII4zKdqVV3mUqTgfwAjSsE
         onXbuJ+o3YlfMiq+Pv2jD4xk96kxodsKNY4y2balv2T8jh5qVBwLqPBTy0y18rB1wlvx
         t8FGWEDfSmHagWoZXpjwYZORz2leHzE7HQyjp5ByecXdM0fFfdMLw4HicSjC1+P8sxoa
         jAEMrf/RHv1d6krIpc8oXckEGwOvmugSDe+kXo7XKY155+naLAjWyU+hz89sfAWW79HF
         QZae9Nr/3jAkqIq7mhhQ8gER4HC5D+cXG9gk4Tz1G6P40i7L5LRXNsrn0+Ezn2jxV8qQ
         E4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWVr4Mx9KWY/XFrPDOFz7NC4AmCHD/T8tFSOyZXF2Piobn1mtoedD5tE6dgb/71Hmd1y6FhhDHtKVtRusUVFaQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwEVGNqFNomLQ35AI18Y/4oyHwuv+Bp3LKDCe6H0gY/U/3pbhjm
	AvBm1Q34uU8KktcavA3hsbcCiuTk5Rp3l9rV3eU/HwrULigoccuAq+hBczq+cEEB7stE/wsoAYF
	oBg==
X-Google-Smtp-Source: AGHT+IHsDcMPrhyfskuHWFsChUiLRK+WvCOQw9Iq8m/qVJIKUtbjFtk2SJhvrDDesYXcYxLK1intdRRcKQ==
X-Received: from ejcva5.prod.google.com ([2002:a17:907:d005:b0:afe:c85f:e152])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6d04:b0:afe:ea4f:6225
 with SMTP id a640c23a62f3a-afeea4f6735mr443173366b.39.1756461104699; Fri, 29
 Aug 2025 02:51:44 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:51:41 +0100
In-Reply-To: <20250829095143.123476-1-tabba@google.com>
Mime-Version: 1.0
References: <20250829095143.123476-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250829095143.123476-2-tabba@google.com>
Subject: [PATCH v3 1/3] arm64: sysreg: Fix and tidy up sysreg field definitions
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_025150_108977_BDD4F34C 
X-CRM114-Status: GOOD (  15.23  )
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

Fix the value of ID_PFR1_EL1.Security NSACR_RFR to be 0b0010, as per
DDI0601/2025-06, which wasn't correctly set when introduced in commit
1224308075f1 ("arm64/sysreg: Convert ID_PFR1_EL1 to automatic generation").

While at it, remove redundant definitions of CPACR_EL12 and
RCWSMASK_EL1 and fix some typos.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
Note that NSACR_RFR isn't used in the kernel as far as I could tell, so
I didn't add a 'Fixes' tag.
---
 arch/arm64/tools/sysreg | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 696ab1f32a67..f1a012ee0db6 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -31,7 +31,7 @@
 # Mapping	<name_EL1>
 # EndSysreg
 
-# Where multiple system regsiters are not VHE aliases but share a
+# Where multiple system registers are not VHE aliases but share a
 # common layout, a SysregFields block can be used to describe the
 # shared layout:
 
@@ -54,7 +54,7 @@
 #
 # In general it is recommended that new enumeration items be named for the
 # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
-# item ACCDATA) though it may be more taseful to do something else.
+# item ACCDATA) though it may be more tasteful to do something else.
 
 Sysreg	OSDTRRX_EL1	2	0	0	0	2
 Res0	63:32
@@ -474,7 +474,7 @@ EndEnum
 Enum	7:4	Security
 	0b0000	NI
 	0b0001	EL3
-	0b0001	NSACR_RFR
+	0b0010	NSACR_RFR
 EndEnum
 UnsignedEnum	3:0	ProgMod
 	0b0000	NI
@@ -2528,10 +2528,6 @@ Field	17:16	ZEN
 Res0	15:0
 EndSysreg
 
-Sysreg	CPACR_EL12      3	5	1	0	2
-Mapping	CPACR_EL1
-EndSysreg
-
 Sysreg	CPACRALIAS_EL1  3	0	1	4	4
 Mapping	CPACR_EL1
 EndSysreg
@@ -2576,10 +2572,6 @@ Sysreg	PFAR_EL12	3	5	6	0	5
 Mapping	PFAR_EL1
 EndSysreg
 
-Sysreg	RCWSMASK_EL1	3	0	13	0	3
-Field	63:0	RCWSMASK
-EndSysreg
-
 Sysreg	SCTLR2_EL1      3	0	1	0	3
 Res0    63:13
 Field   12      CPTM0
-- 
2.51.0.338.gd7d06c2dae-goog


