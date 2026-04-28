Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C806CFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7c867vhN0NJ0ysluuN7kPjni8MsLU+yiUrh20mCAzU=; b=fpb2K1FXC5xGAbXcd9r9zJ9K0Y
	TVe8er2v7gvrMNpAmHjpaZHmBEqycWm10T2o2fBI14TfcpRUlfkrBukPOVPipUaG3U5ySRXR222Lp
	fgBj8VwIJjoCsP8BRuUWwMiCOigClDivVHVoS7wbabdRqA+QA48n34nbxgV4nbF5ZGhoqCEjbUNT0
	L7+WFpJUI1DaI4UmYRRIzItMlONSAVhsKpvnG2pE6kx+p8HZnbEJgAyANvP+72RWMtevR7br+S7FO
	dtWhV+QNSuNBSOkFXpgTtobl0GFDYCeiM5yqXIlfqhsh7B1nnIRZTccSHVMSb6zEeKl2OxhFDyfuT
	GbplMlgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhq-00000001AjV-48Ro;
	Tue, 28 Apr 2026 10:30:18 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhl-00000001AfG-2hqv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:30:14 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-672a206d806so10305507a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777372211; x=1777977011; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J7c867vhN0NJ0ysluuN7kPjni8MsLU+yiUrh20mCAzU=;
        b=Tez6u+/9QWcIgJ1t/Ao49YHPEtuTn5jhylbGp8VQwHjUrHIhqGdOpnZ76RFcVX+ibZ
         jt+vikYJWXp4i6Jwx2fe/AZzEYVJPhuUEvUu3iIcvCMK7HIA7f9SCjxS61Vg//GTkeLn
         Ew6eguu0djelzJSfSJpb6BNetupIt+sFzG24h7cDVIQE6RvYcSOGL7iN+fsqTc7NQTX6
         6nZNYOOcdss/SH4Z6FsNFuuoo2WFdb0cWnDwvTDdT7YGNGzqZWr8XJ+yonecOljSgzXL
         EzOOGL1fVvvBqC3cmkJsgFxYcVd2sWDmxjx1229o/xHnBlY5SrD1S3GYdROqkQLorTny
         9GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372211; x=1777977011;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7c867vhN0NJ0ysluuN7kPjni8MsLU+yiUrh20mCAzU=;
        b=E+pkgrl7onU6F8fYEZlp/IYY+mg4jDFLfW/nSj0Te9+IBy9HUAtAbSosLwQZsr5r+o
         A/n/+C8sVxVBAkbqUkKQjfc3adQIVJEr9ghPb0egAHKS9rJeNfPLltrFW2sVI5Q0OX93
         tDN+c5LJP5ZAgZyh/MpDlzRm9wcz1lIPJ3udQWtKCE83mp3erPxzTI+DUCOuEEe9LvyS
         hfjcpZ9imojuDMXYAZZbEPK2oIvhVpjFOLOyrVIwAcSjpZfYblGtRBHMIzPeL73rKPi1
         8Gbpxn3Rec3O448J8Vhas5cPjtnEnfNh4/dep+Dd0SIjJi4im1nQjjWrawPvHnKJy36T
         KXvg==
X-Forwarded-Encrypted: i=1; AFNElJ/9Ey+bdNjLst4ex5PbmdLBwWomws7AClAN2A6JYvT7jONv3d0swC41pyEJ2qcEXJkNY76IqotWgdo60nQzB/Lx@lists.infradead.org
X-Gm-Message-State: AOJu0YwVryVSzXf1amC7T+8RppEC9KcZtnP5ToPf69DqytSbTXKaGcrA
	vXYRSQrI7rlg1kAny/S0DH1tudrPoB4w64RLgjRPZtUy8gsSZip9l1O2n5YLz/jdAYL/Ozs3TwA
	ESw==
X-Received: from edru26.prod.google.com ([2002:aa7:d55a:0:b0:674:1e56:7dde])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:158d:b0:678:a553:bcf3
 with SMTP id 4fb4d7f45d1cf-679bb0a125bmr1160027a12.21.1777372210503; Tue, 28
 Apr 2026 03:30:10 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:30:01 +0100
In-Reply-To: <20260428103008.696141-1-tabba@google.com>
Mime-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428103008.696141-2-tabba@google.com>
Subject: [PATCH 1/8] KVM: arm64: Make EL2 exception entry and exit
 context-synchronization events
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_033013_702477_0B8161C2 
X-CRM114-Status: GOOD (  15.01  )
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
0487 M.b, EIS is governed by D1.4.2 rule RBBSRF (p. D1-7205) and EOS
by D1.4.4.1 rule RBWCFK (p. D1-7209). D24.2.175 (p. D24-9754):

  - !FEAT_ExS: the bit is RES1, so the entry/exit is unconditionally
    a CSE.
  - FEAT_ExS: the reset value is architecturally UNKNOWN; software
    must set the bit to make the entry/exit a CSE.

INIT_SCTLR_EL2_MMU_ON in arch/arm64/include/asm/sysreg.h sets neither
bit. KVM/arm64 hot paths rely on ERET from EL2 being a CSE, and on
synchronous EL1->EL2 entry being a CSE, to elide explicit ISBs after
MSRs to context-switching system registers (HCR_EL2, HFGxTR_EL2,
HCRX_EL2, ZCR_EL2, CPACR_EL1, CPTR_EL2, SCTLR_EL1, ptrauth keys,
etc.); examples include the activate-traps path,
ptrauth_switch_to_guest, and the FPSIMD trap re-enable in
kvm_hyp_handle_fpsimd. On FEAT_ExS hardware those reliances are not
architecturally backed unless EOS=1 (and, for entry, EIS=1), and
whether they hold today depends on firmware initialisation outside
the kernel's control.

Make the guarantee explicit: include SCTLR_ELx_EIS | SCTLR_ELx_EOS in
INIT_SCTLR_EL2_MMU_ON so that EL2 exception entry and exit are
unconditionally CSEs regardless of whether FEAT_ExS is implemented.
This matches the pairing in arch/arm64/kvm/config.c which treats EIS
and EOS together as RES1 under !FEAT_ExS.

INIT_SCTLR_EL2_MMU_OFF is left unchanged: that path is used during
very early EL2 init and the EL2 MMU-off transition, neither of which
relies on these bits in the same way.

Fixes: fe2c8d19189e ("KVM: arm64: Turn SCTLR_ELx_FLAGS into INIT_SCTLR_EL2_MMU_ON")
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


