Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAA4F53D81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XusE5Uw2A71FlWXS54s/a8QC7XzEJTYhsYfjXaXNfDg=; b=NuYakaBtIax3DOofPxdLq4Nhy1
	dI710mQbyFjbMVY7qtqQW51OfPOecJjLhaQJJaWuf8duGma2Y7Iwl0CZtcqFJtGlUfxsTShLd1o2U
	3Ug2B0AqbB4dehl91npx3aLq5HYhTdxWisBl7AV97WPRzEfqx3mE5EHmth1KdIffHLV16HUZXBqUf
	SNNXtQZi1caHCW6jZBJddMP0OmI7IwgrSYwRkY3JleNx64DQ2QQ3hDKjkli8swizoDJP+q1toCXGv
	WoNiUckffisM5h9V4PC4nPqmh3zL4NSszSSRpFwKY0gy3egEL52mdzoPjApJreluUz1hqpcG+tUMW
	/5OK6WfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Br7-00000004Zyw-14Ns;
	Mon, 16 Mar 2026 17:35:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqx-00000004ZsI-3Mol
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XusE5Uw2A71FlWXS54s/a8QC7XzEJTYhsYfjXaXNfDg=; b=dfN0CP3N29y0dhMBkzIg+F0DN+
	dFH29Oc71G7eYP0piRpXAW0LOour5uFxHs3FTJBFfzHicybwDM+LqXK+jodsAomy1kqid6xRFrYBz
	djQ/XVY+jzcfku7TZUXbIRzBFWtt8+gA1Dnwea58wPe05Yon0zMTAzqtywD6KUkn2LKnPtmsehCls
	UhBHPkl8psONmm3pl0jHkPqWhCUcIcu8jBvnKNo9VTmYJ0ck4iGNmWoYfcmZhedvGI8NO8NbBWo8F
	PiC5ZsQKI+rPqaE75NVIIEfQ4mHyCJTLXf2FXK59rF6y3rGLWJUs7Lc5N6LaAi5ASRJ352/rEbao8
	/WeKjIOg==;
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqu-00000007Ltl-3hms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:42 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b9360e9f43bso197886566b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682539; x=1774287339; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XusE5Uw2A71FlWXS54s/a8QC7XzEJTYhsYfjXaXNfDg=;
        b=aNsfPXJDpPcD/jy5Mq2Xg3h/uKqiSM3Gt5YJZ47i2c1ipy6k0Zz9OWAko9hB5wX7rR
         O/TvLaS5Jk6C/MXjQFc6nvj/HNlR8vVJh/zQ1yA6igxoHPdKKSgjw4mSgZi8nHVGv9o7
         VXT27G20IBwaBCkksRhqK7nvx/YpCqyasMRStzpmVqUuvT1Opsh6Qk4g9G5rNHHDfmDi
         bQCQh2zu80GnY5KhHEUGge6U4dQO8iF0KxvErM9k8lEot0DzUevp9kJHgVXNrDfb/Ma5
         tMh28sIFtoUaU7xcAFAXtPcqvNoijTHMK8koJFDG9egB4L3mzwzf4+BKJid9X2vdOKuI
         UZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682539; x=1774287339;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XusE5Uw2A71FlWXS54s/a8QC7XzEJTYhsYfjXaXNfDg=;
        b=o+8PU+kGzd5IMf4FEfVkqH+GtWeXfqIJKUwT2nQCR1IprMS1eaw8bARYE7WjC1EGZV
         I27OJ9xwOmzdxzVaK0CpajIPhikBieYMAL4FE7Gx7Yxa5d1AJQI4tLbq6BB5MY1qpIJ3
         ALAriGIrhns1/ZLBml+KWodZPcWlUWp/nkIAkMrtZw7CAKXNsVUcoBPzcPmrgivtPYIQ
         4Glk6GIbr/2Pg/S9fKXjcRATzHuo+wftGo6NZQ6NDMf6y+Xv5U3/fWRvDdfSozLzvf3N
         bku4G4sGEUkfp65DmtuRP6HYkVVQzlnnVmNu8XyhUVkUKMyiVdyb/MwnK34VH6o0BzRr
         iiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYdHQqMKznU7PGYRhZ0Ez5qR9fuOTwx4NpMgJopgFXXP4RPwXyzHqCTRLKgJBUuLe50dQsj3ZZOS2B0vhiEsJc@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqllc1XYO+XxCMSjed8OfGj+89Ig6HNomGspolEgqVrxOQtpRr
	wrYolMMdKCyIpjuEvoGkTS5TlqaOs0B65o0IOWArpWelYcxX5kDbCE5zQvr9CdqubzMaAl09UWA
	Aeg==
X-Received: from ejcm7.prod.google.com ([2002:a17:906:7c7:b0:b8f:93d4:516f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2d07:b0:b97:c313:db30
 with SMTP id a640c23a62f3a-b97c313eebamr240677566b.8.1773682538520; Mon, 16
 Mar 2026 10:35:38 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:30 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-9-456875a2c6db@google.com>
Subject: [PATCH 09/10] KVM: arm64: Use guard(spinlock) in reset.c
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173540_959778_1E8759FD 
X-CRM114-Status: UNSURE (   9.44  )
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

Migrate manual spin_lock() and spin_unlock() calls managing
the vcpu->arch.mp_state_lock to use the scoped_guard(spinlock)
macro.

This streamlines control flow during vCPU resets by utilizing
RAII-style automated unlocking.

Change-Id: I32e721e67012c4a141f46b220190bf3c28485821
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/reset.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 959532422d3a..e229c6885c10 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -193,10 +193,10 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	bool loaded;
 	u32 pstate;
 
-	spin_lock(&vcpu->arch.mp_state_lock);
-	reset_state = vcpu->arch.reset_state;
-	vcpu->arch.reset_state.reset = false;
-	spin_unlock(&vcpu->arch.mp_state_lock);
+	scoped_guard(spinlock, &vcpu->arch.mp_state_lock) {
+		reset_state = vcpu->arch.reset_state;
+		vcpu->arch.reset_state.reset = false;
+	}
 
 	preempt_disable();
 	loaded = (vcpu->cpu != -1);

-- 
2.53.0.851.ga537e3e6e9-goog


