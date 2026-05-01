Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58A2CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoZhqW+DbuvcNP5ZEEtFHwCo3yR5b+Lks488o9s6mbk=; b=2S5IqeUo3rovIVsk+44iZxuV/S
	0+uZxtKlSa2k8Kbw+Lvgwq4EgDNXiLO4JRzD8wt+GjheWOudrN5cr/tNHiIvv3JOuk2PsqbGzARZh
	TOKIwMCd+YGN+OoICNZGDIkdYkk3JJyBlDFbXaeQYLfN87gTbbs3nY8TrS3vzbl9ZxVjWTvdoF/+k
	+0xlw5ib0cfoVQRtJFODzg7PywLlrGlv2ZLovQsWOpGTy6Dn5qKAvBowou5xRSbqofnTo01VyNUWN
	21UTiNSQEeKmqjF6hqzTI6WmNbilr/BkVDeB+lJtje58ZMcRrGGnFpKqri61vpIb7CUHk+eJKxCQv
	m4Z7COeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwT-00000006elW-1DIK;
	Fri, 01 May 2026 11:21:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwQ-00000006ein-11Wn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:21:55 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48a5adc12ffso11684485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634512; x=1778239312; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hoZhqW+DbuvcNP5ZEEtFHwCo3yR5b+Lks488o9s6mbk=;
        b=pd7vaR9lSjRops+tNRx2GXPRgwp+lOn7c+PLmA3VhsETKGaSN02FrZkVs4Zg4y74iu
         KIHvfAocPlc3GWj+brxY55Jd6kUgVzevxA35F1Dunycaw1ttmSEbScjMzruYrdACPdue
         B7ksjghGPKQLTSKBSeCB6f8W97T1QQToT9FwnOk4LNkOVES4StUbW+CBrE7uuBkt+z1V
         ABgiJYcAS0fX0l4iSufRDOqWX9a1c3AMh8utR6tJYRdcUbXrdY6weeCR5+7t3Ehm7FzU
         Vcm0muTi/v3e4gTX7x9IrhqW0c0zF5QBxpUNGX/ABhy2Szt0AIC69jDpQTnCJ36StPOz
         kUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634512; x=1778239312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hoZhqW+DbuvcNP5ZEEtFHwCo3yR5b+Lks488o9s6mbk=;
        b=MMrUk+8N0/zwS129vfuHXkHhBApyyeSZWab2ck4jaZXgSJ7PYrmZrv93e2nOfNx5ly
         lTU2p7jLNCyWULVbdMKLEERfPPmBgcrlBdhQn7MjbA0yp0JUTdDBf22GNDtqTG3qpbz1
         rh2LLc7vNrETs+cwa51ube+1r0xfT9uwzY+yo9bYyNqCJ5FiE9VTPjiROa99Rj2xKyYG
         kDYXO6CXuyDL95FR5VMlc6neem74PPlHPyZYyZGw5e8Gg3/57O8hNjL2sfY8sMg1ewxK
         mghOuQ5b3DaHjaXK0WtPpFnS//I+73bka+Z5PPMidvDbj0ji/7QFR4D9uqEfBl0wckfN
         a9SA==
X-Forwarded-Encrypted: i=1; AFNElJ/xxkl1CicgovLzyLwWo3GsuQfsuAxcbifYziov2rN0Z2MpO5ZqZvLFT3sDNn0JHXaDAHfEgsg+pu5gtaQTnr6I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy85HVBzOSVOwiWzWpJMOna7cVkQs6turU8UT+KXEmDAl+U52Hw
	5z3oqaGV23TYecfa+gcIWOyYh4KMQJJ8EvZkUUvVMFlbB939m4AQDNyXJf2zH9fcxV6KYHSk+14
	j+w==
X-Received: from wmbhu22.prod.google.com ([2002:a05:600c:a296:b0:48a:5c24:d305])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a30b:b0:48a:58ae:993b
 with SMTP id 5b1f17b1804b1-48a8451cfe2mr82955875e9.16.1777634511757; Fri, 01
 May 2026 04:21:51 -0700 (PDT)
Date: Fri,  1 May 2026 12:21:44 +0100
In-Reply-To: <20260501112149.2824881-1-tabba@google.com>
Mime-Version: 1.0
References: <20260501112149.2824881-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501112149.2824881-2-tabba@google.com>
Subject: [PATCH v2 1/6] KVM: arm64: Make EL2 exception entry and exit
 context-synchronization events
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042154_325165_1E6F29EF 
X-CRM114-Status: GOOD (  15.40  )
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

SCTLR_EL2.EIS and SCTLR_EL2.EOS control whether exception entry and
exit at EL2 are Context Synchronisation Events (CSEs). Per ARM DDI
0487 M.b D24.2.175 (p. D24-9754):

  - !FEAT_ExS: the bit is RES1, so the entry/exit is unconditionally
    a CSE.
  - FEAT_ExS: the reset value is architecturally UNKNOWN; software
    must set the bit to make the entry/exit a CSE.

INIT_SCTLR_EL2_MMU_ON in arch/arm64/include/asm/sysreg.h sets neither
bit. KVM/arm64 hot paths rely on ERET from EL2 being a CSE, and on
synchronous EL1->EL2 entry being a CSE, to elide explicit ISBs after
MSRs to context-switching system registers (HCR_EL2, ZCR_EL2,
ptrauth keys, etc.). On FEAT_ExS hardware those reliances are not
architecturally backed unless EOS=1 (and, for entry, EIS=1).

Until commit 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg
infrastructure"), SCTLR_EL2_RES1 was a hand-rolled mask that
included BIT(11) (EOS) and BIT(22) (EIS), so INIT_SCTLR_EL2_MMU_ON
was setting both unconditionally. The conversion made
SCTLR_EL2_RES1 auto-generated; because the sysreg tooling only
models unconditionally-RES1 fields and EIS/EOS are RES1 only when
FEAT_ExS is absent, the auto-generated mask is UL(0). The seven
other bits dropped from the old mask (positions 4, 5, 16, 18, 23,
28, 29) are unconditionally RES1 in the E2H=0 SCTLR_EL2 layout per
DDI 0487 M.b D24.2.175, so dropping them is harmless. EIS and EOS
are the only bits whose semantics changed for FEAT_ExS hardware
and where the kernel relies on the value being 1.

Make the guarantee explicit: include SCTLR_ELx_EIS | SCTLR_ELx_EOS in
INIT_SCTLR_EL2_MMU_ON so that EL2 exception entry and exit are
unconditionally CSEs regardless of whether FEAT_ExS is implemented.
This matches the pairing in arch/arm64/kvm/config.c which treats EIS
and EOS together as RES1 under !FEAT_ExS.

Fixes: 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg infrastructure")
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Assisted-by: Gemini:gemini-3.1-pro review-prompts
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/sysreg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 736561480f36..7aa08d59d494 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -844,7 +844,7 @@
 #define INIT_SCTLR_EL2_MMU_ON						\
 	(SCTLR_ELx_M  | SCTLR_ELx_C | SCTLR_ELx_SA | SCTLR_ELx_I |	\
 	 SCTLR_ELx_IESB | SCTLR_ELx_WXN | ENDIAN_SET_EL2 |		\
-	 SCTLR_ELx_ITFSB | SCTLR_EL2_RES1)
+	 SCTLR_ELx_ITFSB | SCTLR_ELx_EIS | SCTLR_ELx_EOS | SCTLR_EL2_RES1)
 
 #define INIT_SCTLR_EL2_MMU_OFF \
 	(SCTLR_EL2_RES1 | ENDIAN_SET_EL2)
-- 
2.54.0.545.g6539524ca2-goog


