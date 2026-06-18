Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AE9CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSfLIh1ia8h00/76vM0zOwIn9wq6bVKngqqirdlDuHs=; b=45sZtorkH6BADPMsItx1pFrQZo
	GuZ+gZd4E7BmSTsYAeSM5ijHsOnTwhVplXwxKFUDVZJcDh2a3/vXd5ofw2Grk74qxU9bz+uyPCFi0
	Doqw0f1N8cHIZCcK7uOI7LfGqL9FG79wXGProReQU6xdo15RkP2iQsTUyh/41WanDKmm9PZWV7NrC
	+a7zD0f6B6eXVQSvFFgcrUjEOsPuUHw7fefUD6Z0RWISTW4BI0b+v3av+t4EIxiVZiV+HjM6jXtFw
	k45FVYtSscdQHZpWS2dJxSoeB6NRorAUxhZQDdrvxHf2suGFyXZa6AfCqsj07VMOIUtszNGdH+ZVX
	RbXEYShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfy-00000001F27-25sv;
	Thu, 18 Jun 2026 12:16:54 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfw-00000001EzQ-0fp2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:16:53 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490d3f03883so6246055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781785010; x=1782389810; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GSfLIh1ia8h00/76vM0zOwIn9wq6bVKngqqirdlDuHs=;
        b=FDGyr8tdUABGp3XR5MSmC8f4hSuBSFyOBjh+j95rNu+K9ydx8iamdUUBQHaLY0gTDd
         dEub3HXM2LGCLryHI2tF7gitaFR75A/3EKvQOy//2AnFheQGdXPFnQ10jbETxpu0Pgl5
         MUeQXvzk3wDk4ximiLG+6aJ+wgFHbt+/ujkr2BalCTSuYsqPVZSGgf2Qtekh+oec3Luz
         X6yhHxJAXKMbtZadYRCm2mJTXeHVmTYAoqzhLIGuG7++ypHtAPvMc6N1jg1t0hxi8rWM
         rqHvD+eyyY5JoM2vv6udfYtqBpcTJMmDbNDkgFMempwO9MlJi9J91GCWDaKu6P/ky3i/
         6h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785010; x=1782389810;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSfLIh1ia8h00/76vM0zOwIn9wq6bVKngqqirdlDuHs=;
        b=prvvbPzvPLTEyGIfSaz5sM9UDbjiqGxm6LarrAlDsGTQkFahcwu7ZhDm1+ASWoiZB3
         uF8enBE+kdZKt3cUUJnBY9PZeCCXGK0JVNOaiAbC/vmGDXGQJHCTIGb9pp746bVfpdyu
         VvshRj3EiNuPrrZe99N5UrY9kdFBal63wjzXi3EcJI0JoC/vL02LBLvrZAf3b3Z64RJZ
         8SGPJPvERu4nnepgPpsZiggadYMUi0KCvN+6tp2I6yyqxVIBgSxnstJetoavlcSYU7qp
         I5qQ1mlZ2bMrVVE5R6IpUqI3ns2jX4oKZ06/SJWWCVs+pfMPPSJy1HSXMnkFpWJvJlxU
         kp1A==
X-Forwarded-Encrypted: i=1; AFNElJ+qCwUBNLv04QU/fxPJf394M5KS+OfzEs2gHt17p5smuRGY9DSIBfVA9Ghn9Rz0+BQf2N/DThRAA1DcB2FS6bMO@lists.infradead.org
X-Gm-Message-State: AOJu0YxKYrzZvwMmTTTo1kb4RNyRz9nTIobtdhIgtYdZTo7ed4VXVjf6
	2JDcFkzAKUy174dhdJTNvIGIJyHgT+nK4zy5czExA3tuIiKITVMHQCxMVi+2Q4gNTuisfYXOwau
	jqA==
X-Received: from wmbjl3.prod.google.com ([2002:a05:600c:6a83:b0:490:46a4:b11e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e0f:b0:490:e5c1:b88d
 with SMTP id 5b1f17b1804b1-492333babfbmr148040435e9.1.1781785009399; Thu, 18
 Jun 2026 05:16:49 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:16:40 +0100
In-Reply-To: <20260618121643.4105064-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618121643.4105064-5-tabba@google.com>
Subject: [PATCH v2 4/7] KVM: arm64: Set IL for injected FPAC exceptions during
 ERET emulation
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_051652_209735_49E726D9 
X-CRM114-Status: GOOD (  11.34  )
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

The FPAC syndrome constructed during nested ERET emulation does not set
IL. For FPAC (EC=0x1C), IL reflects the instruction length. ERET and
its authenticated variants are always A64 32-bit instructions, so IL
must be 1.

Fixes: 213b3d1ea161 ("KVM: arm64: nv: Handle ERETA[AB] instructions")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index dba7ced74ca5..b74369e9ad7f 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2776,7 +2776,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 		 * ERET handling, and the guest will have a little surprise.
 		 */
 		if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE) && !(spsr & PSR_IL_BIT)) {
-			esr &= ESR_ELx_ERET_ISS_ERETA;
+			esr &= (ESR_ELx_ERET_ISS_ERETA | ESR_ELx_IL);
 			esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC);
 			kvm_inject_nested_sync(vcpu, esr);
 			return;
-- 
2.54.0.1189.g8c84645362-goog


