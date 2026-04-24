Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29882FE51E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chjLWLOIpt5H2yMUpJCdXjXW1BJ6wL0l1ZmewdyTk+Q=; b=YPaQMepfamlLDxMnBP5I9AP7gY
	TopqHD7nr+2fm4FM0WF3Gt7yDxnDPM6ToMpWOu1YrHKYktvXY2G05ANKdwel+F/TiZ3sjnxbuFGWe
	S/y7Faw4ofMtQxfPNUB8fC4W4E1gmN8Tbq200p45wzll783TrQ7j7eLjfPNKXUa73tben1rV4ZbOQ
	Xr5deHL+VW32pGfVZXGzjTkw7OOmkGVh9f5ybhXlsAcx88CgUyY72rxAHE0Q0DCNKQFN1UfwrS9jB
	ZPp8lFWW7B9LHWNOz1769+5EwRyTP2RSJAgs8xT5nIbRIJputD/8aU4JOpVfn/SBMcGHY6Heb3bIo
	QkkGzORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDu-0000000Ct1n-0l8p;
	Fri, 24 Apr 2026 08:49:18 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDp-0000000Csz1-0TRO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:49:14 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b9c1d1f7e5dso767526866b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777020551; x=1777625351; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=chjLWLOIpt5H2yMUpJCdXjXW1BJ6wL0l1ZmewdyTk+Q=;
        b=hga9qHFug81BnNn3AfDO3E3H/V1aK5Qz0jvr5YfuucMVo/kDT+ugD89VxepQTAt+WI
         XRDgn+zGmw2E8UKLEUho/baOJPFABefnEYP2eMHXkOYkRaiwXnQVvD2SAnSpPJGEGpbu
         Ept3zXV6mbpF6AELZ7o0DMp5ujAa/NAizjyOI1Mg7vdSYrX3O2vhJ3+bkwAV/kLRYL8g
         AeqjV1d8XBe/EuboSnu1wiJx7vQRboNc73JkjSXdl1kpMxOqsGTI1rgiQmP3iAT0JQnR
         xoEWYaOX9DjQhh8HNbcBVyJ4uId2Je5l4vLfaH3LCWLIeVNIrZsYfTvQPSuRAjbsbDWs
         RxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020551; x=1777625351;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chjLWLOIpt5H2yMUpJCdXjXW1BJ6wL0l1ZmewdyTk+Q=;
        b=mDAhe1Y4ZsT0V7rmpJNvrRUTaYHyRpLbNrm057vIx2vnNKahUuK47UmPgCBaNbCJb0
         EyCrSypDiHKqCKxG6lEqKqTZYmqO34uFIuNkV9omG0SaHoHpyIDHGTeDyBikd3acSCfJ
         1wLJ7rToeDHSOd9V3UvFctP/WqsFY1E/UjH8icWulRZdLEA6JkKxFgumKKHogwjkV6Li
         GLCd3zzqH5lNTwJ+b1P7O7bvJmeMBb+ayzRtjj7zNMonFbqP71j89cggpcsJU+A7dNyw
         SgEOV4tAhYQJyv0DFlKLs7ja3My1qdK3rk4vUeQ8XVRisR/8TTKmmfhGbwELXfw49Eaa
         ZVgA==
X-Forwarded-Encrypted: i=1; AFNElJ8r7L+fpRqYZsjGYOpNEAbCLZmLh44ASwLlTirF3RU9knrJwSvbOkHAxy8S7lmxVBqf+7wDc2MF8jy+Rxx+gup9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw76gOdQEeC4FyGcxHhc7p4S8mKP1J3P7ezTDDyspfvAfUy5MT
	bLZFV9Fx+4LZGsMiL0xZFpKTfaO4YeLiM6JlvvvkRTZwORQ0776GGCSEw/yiuH73h7F0t7PpYgP
	Z6w==
X-Received: from ejbwt10.prod.google.com ([2002:a17:906:ee8a:b0:b9b:9f09:c27e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:cd09:b0:b9e:f58:c581
 with SMTP id a640c23a62f3a-ba41b3dff09mr1835202166b.45.1777020550736; Fri, 24
 Apr 2026 01:49:10 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:49:03 +0100
In-Reply-To: <20260424084908.370776-1-tabba@google.com>
Mime-Version: 1.0
References: <20260424084908.370776-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260424084908.370776-2-tabba@google.com>
Subject: [PATCH 1/6] KVM: arm64: Fix FEAT_Debugv8p9 to check DebugVer, not PMUVer
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: tabba@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oupton@kernel.org, qperret@google.com, suzuki.poulose@arm.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_014913_162906_18B1EDB7 
X-CRM114-Status: GOOD (  12.72  )
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

FEAT_Debugv8p9 is incorrectly defined against ID_AA64DFR0_EL1.PMUVer
instead of ID_AA64DFR0_EL1.DebugVer.  All three consumers of the macro
gate features that are architecturally tied to FEAT_Debugv8p9
(DebugVer = 0b1011, DDI0487 M.b A2.2.10):

  - HDFGRTR2_EL2.nMDSELR_EL1, HDFGWTR2_EL2.nMDSELR_EL1: MDSELR_EL1
    is present only when FEAT_Debugv8p9 is implemented (D24.3.21).

  - MDCR_EL2.EBWE: the Extended Breakpoint and Watchpoint Enable bit
    is RES0 unless FEAT_Debugv8p9 is implemented (D24.3.17).

Neither register has any dependency on PMUVer.

FEAT_Debugv8p9 and FEAT_PMUv3p9 are independent.  Per DDI0487 M.b
A2.2.10, FEAT_Debugv8p9 is unconditionally mandatory from Armv8.9,
whereas FEAT_PMUv3p9 is mandatory only when FEAT_PMUv3 is implemented.
An Armv8.9 CPU without a PMU has DebugVer = 0b1011 but PMUVer = 0b0000,
so the wrong field check would cause KVM to incorrectly treat EBWE and
MDSELR_EL1 as RES0 on such hardware.

Fixes: 4bc0fe089840 ("KVM: arm64: Add sanitisation for FEAT_FGT2 registers")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index f35b8dddd7c1..093290b366e6 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -192,7 +192,7 @@ struct reg_feat_map_desc {
 #define FEAT_SRMASK		ID_AA64MMFR4_EL1, SRMASK, IMP
 #define FEAT_PoPS		ID_AA64MMFR4_EL1, PoPS, IMP
 #define FEAT_PFAR		ID_AA64PFR1_EL1, PFAR, IMP
-#define FEAT_Debugv8p9		ID_AA64DFR0_EL1, PMUVer, V3P9
+#define FEAT_Debugv8p9		ID_AA64DFR0_EL1, DebugVer, V8P9
 #define FEAT_PMUv3_SS		ID_AA64DFR0_EL1, PMSS, IMP
 #define FEAT_SEBEP		ID_AA64DFR0_EL1, SEBEP, IMP
 #define FEAT_EBEP		ID_AA64DFR1_EL1, EBEP, IMP
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


