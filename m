Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932CCC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 05:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXtiOD32k+3IRpg7Tl5Q1Nm4vKBBcoEeXUHabwSNFEc=; b=KAniJUoWYx/cMTZ9KU/vOAxlzd
	kmCrH7sj9h9nFZEPmvu7XONVE4xoa9+e9aQKz0FFHkEQu/Z6lycc2tsDI3NFNPLof1Y6Ffrgt43+Q
	WmnGfmn2jfJHumCZF0b7h4RIjVa4UTcoAP9bbri+hze39yeTtzXA4oKxYBPqtRYC+IMLYaT7hi6Nx
	v/vam1PhPVXHeETlQbCtgm1zJDlOiwMMNmFMROzXzafKEiGWsxSkgnqm17Gg4OroJg4jTDmj4yxOF
	1m9hEZy4/Ie7qGDxSVVBlKu2Ch0BryEd8/qRfcB94llJxdao5FoF54/9uG7cJy4mKH98Z2g/TrEfE
	GeSchR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgTa-0000000Cc9Y-3TeI;
	Wed, 04 Jun 2025 05:15:46 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgNB-0000000CbJX-2pHW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 05:09:10 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b26cdc70befso4168816a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 22:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749013748; x=1749618548; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXtiOD32k+3IRpg7Tl5Q1Nm4vKBBcoEeXUHabwSNFEc=;
        b=WC0uwU0cYLtx/hpHOnfFftwul93KXCqXnS+MuQgCmx2Zwx9IutIxoq0nNL3ibCtikd
         INJiLfyWXVI6mqTlw+7XF6/xGt/b2ktLGzOVZq8U0f908dw32x/IFfwm4k7Pzjn3K103
         xZk4YWETmBKm1OAZgjZHgtNWAIirnJM4WGAY63wf4dwILkcq25wHLDdrG+WPa5FLXc6r
         TS16+NqZMPZ0i2jxF1k/ttnrFYa90DyJ0fJYNgroB4biyD+y7b6t1s2vccpz9myxyCf3
         Dsls/JsvfoswOH/NQYemUeFfy4DfCxe7o/Fc6+EpT42gNe5r3X6GqbLo04I8mfmI3BFw
         8iDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013748; x=1749618548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXtiOD32k+3IRpg7Tl5Q1Nm4vKBBcoEeXUHabwSNFEc=;
        b=oA+AB9kEdMO47CI3DD1BqlKGY78pqZnF3fvdl1TZYuOqYBZ00FNWMNm6484rSenIzY
         dGw1Y4ypuUCan0v72/vvC/SjNieUuCx3le6dy7yXjVMs/6r1KPBVEXHifDEg7jFRenGV
         1sQSNROtdXXY8aVdrZk9ucddZDnOx9ytovoVoRcqbMQ028kBJH/v35D3nX6XtjZczyWn
         Gp5Dm997BiHF7jrAfcgsQxFbOGRtSLwG8pBuzaxMCByYZT8naB4r8A/k5baDeIw51ISc
         vPdGEmEPXbpLBHjSkmwdBuJkDKNxL1swOCK0KJFAoRXrLLcC92jeS8ICw9TpG5YN4N26
         R0kw==
X-Forwarded-Encrypted: i=1; AJvYcCVav72I8joD3UVYm9feHS3xMmzqsvqvW3R06jnTXIUw6ymQHckl39WzYSeZogNjR3NwXG2m2dK7za8ZITPc4cra@lists.infradead.org
X-Gm-Message-State: AOJu0YxtXTdMpQFIJMLYNkavqbRfjGiX0rNwEQg66tJvRLC1VukMa9Mw
	TTdIQXH4hDi1QCL7psudIuvGO5KdnB2thpkoIM8QZCnOOd/OJYGGYD/x3yVFOl53cR0sF08TQpY
	RoGhBFEYAJEBTxw==
X-Google-Smtp-Source: AGHT+IE0yG+wVldA+Ut+AEkkDvhjuf8f2LJxfg7qHFUSl5PI3nGJnDA82B1khwNucVOGJtMX8A10UmFpgQtpEg==
X-Received: from pjh4.prod.google.com ([2002:a17:90b:3f84:b0:311:9b25:8e87])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28c7:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-3130cdfb38dmr1864793a91.32.1749013747721;
 Tue, 03 Jun 2025 22:09:07 -0700 (PDT)
Date: Wed,  4 Jun 2025 05:08:57 +0000
In-Reply-To: <20250604050902.3944054-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250604050902.3944054-3-jiaqiyan@google.com>
Subject: [PATCH v2 2/6] KVM: arm64: Set FnV for VCPU when FAR_EL2 is invalid
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_220909_710330_9EF08DF6 
X-CRM114-Status: GOOD (  12.08  )
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

Certain microarchitectures (e.g. Neoverse V2) do not keep track of
the faulting address for a memory load that consumes poisoned data
and results in a synchronous external abort (SEA). IOW, both
FAR_EL2 register and kvm_vcpu_get_hfar holds a garbage value.

In case VMM later totally relies on KVM to synchronously inject a
SEA into the guest, KVM should set FnV bit in VCPU's
- ESR_EL1 to let guest kernel know FAR_EL1 is invalid
- ESR_EL2 to let nested virtualization know FAR_EL2 is invalid

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/kvm/inject_fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index a640e839848e6..b4f9a09952ead 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -81,6 +81,9 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	if (!is_iabt)
 		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 
+	if (!kvm_vcpu_sea_far_valid(vcpu))
+		esr |= ESR_ELx_FnV;
+
 	esr |= ESR_ELx_FSC_EXTABT;
 
 	if (match_target_el(vcpu, unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC))) {
-- 
2.49.0.1266.g31b7d2e469-goog


