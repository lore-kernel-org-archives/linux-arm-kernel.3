Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414A6C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nkInFxMRft8SM/EsWMHnh5CKtPWKT4sSAWgTUnaMbe4=; b=RgLAkwJewCsOH9OT5GbkIrzQ34
	EG7OyqRLX62vGyk+RyMBXtsdLJNMbcW8n1uceR81XuGIKnyMCjiJslWFMEv2bMaoljmw+Jritk4hN
	al4Ih5E8S0+tuOGa8V9776HYGRJTx2gnC4zHt98I5z6qDl5AwW1W+ghRDNpeb40DSBRta+zRebWaF
	SyJuwtNblDMz8wAmr3aGD7VpXy4+GIgwQtHakOi2YNJh3cOu4H6JyCqbEovgHe49rdPtX6V3OsPQG
	TzSbGcKwkNODCWwpBlWe26j9gDHJe3F3PShne0YhvowS9kHgSUsG3B1dvh7iZr9Q0teGoL0FsMmxo
	FlMOCr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qr7-000000021W7-0jWj;
	Sun, 13 Sep 2026 20:31:17 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qr5-000000021Vb-2Lde
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 20:31:16 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49e6ba4abdfso13757115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 13:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789331471; x=1789936271; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkInFxMRft8SM/EsWMHnh5CKtPWKT4sSAWgTUnaMbe4=;
        b=wKHajyd7DLvsotdDsYdMJHnLjSnGDtxDJFFEqHCk8HQ19aF6vAN9ijcTihkX1fUfg7
         nRBFCHLVAd8LbJGQRSHBLCS0gqNssC3DJMUM2SHUHuypMS6xPNdBB6UtSpC7szpZtYv1
         Kb99dMYUm80hGzA6v2DAJmzDGRvEm8zCziT7oQ1Q3X/iaeuQutWkHVSz0svKkMLkgDWx
         cXsjlQYwxUQExUamiiO14nqZa32jbTl3Eh8Hg/CCC44BF2wxItiSYs54q05GFewXCMXn
         ZlGAxnlUWoDcppJYREl60A/Unk3FbeHGcaNFEmPArqDDYTrcCk/QsLBo63skgXtyKfPM
         WUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331471; x=1789936271;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkInFxMRft8SM/EsWMHnh5CKtPWKT4sSAWgTUnaMbe4=;
        b=qqgDgyf9mMDD/Ryr4u7Vd3wQ1IJaLb+jfObD4EbhWEFPEOnfEgU9cZNoGwDtGOXdjZ
         tR+rMk53FWGdfnNxwZuW1Xbv0CnodRa4284VAPUOj1kU96gCrutkNNJYmDCcfmbtP4fD
         mP2fKXay2UofpMtH+2pmf5cF3C18EZmeNQMwoibp4wpmpNzY0qusAj+7EB/NFGhegjlN
         gXpFzC/+5mqCt5RAlhuEKEj7W9rP1JinKbXCnfyEUx9LYqZZujDOhCCiIlcDi6VjfVDw
         +nLEgBr4/95ZU0/fIxWj+wA2OK3XWdyNZYUOuWQynilnPcMjMDTKzC+DmnBCCIHt/Z5v
         6pig==
X-Forwarded-Encrypted: i=1; AKwUvByp7LFd0pFiIWuZyxjWQZB85MjOjivICiuVD5GMjttJ4qJtszuzNG7XBKqoALQJek3FOBSM2DBPsaDkVPDNBD5r@lists.infradead.org
X-Gm-Message-State: AFuF++kQflBhUZDeJwBd/NJLYEtq8tPikbBAIWFlorzsr8def/Akek3Y
	L5gWb4AlK3bZ3HaPdAgXZvBonNeBJagJ4NbdD69eeYOiiPLJkwLT3R6FXEaBbhmlf4AxfRDxWdN
	/4byixS/YGFxu6zztm2o2ww==
X-Received: from wmcq22.prod.google.com ([2002:a05:600c:c116:b0:49e:6bc5:85ce])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8411:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49e619f5049mr328748215e9.11.1789331471258;
 Sun, 13 Sep 2026 13:31:11 -0700 (PDT)
Date: Sun, 13 Sep 2026 21:31:08 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260913203108.3343404-1-vdonnefort@google.com>
Subject: [PATCH v1] KVM: arm64: Advertise MMFR0 TGRAN for pVMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_133115_635515_53B3203B 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

Protected VMs can support granules bigger than 4K. Advertise TGRAN16 and
TGRAN64. TGRAN4 wasn't advertised as it is enabled by default (supported
when 0). Add it as well for consistence.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8758c6801776..ec469d96516a 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -121,6 +121,9 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr0[] = {
 	MAX_FEAT(ID_AA64MMFR0_EL1, SNSMEM, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, BIGENDEL0, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, EXS, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN4, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN16, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN64, IMP),
 	FEAT_END
 };
 

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.55.0.1007.g17ff1f9808-goog


