Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576B7EDF16E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UGGDvqnPusZ8w3DOSxM5/L8hUMj6ctAm+38uUc+sw8=; b=CWEQRYeXLTDnlo4fgizalSd2P3
	/Sc2CKSJ3zC7O/lX160PoAJD3U0qfdejTUS6yppVDwDLhyS7leTCbWhIbTEpHFaEbo7pEMV7l1Xsx
	G06y/UJOhY/jnYexINnHId+vYeXjMlRD3J8nADhMTzDPUHdGnc7VqMYRmRq5bjoL1p+10xdfQ1zAj
	PHnT5409NtGe44twgKtZQvtCfaszYMvAU8d5raMhmQ+tlnyLdXlB8dHVlvjQJZeodzrl3ahXI6W2F
	qbqfBYq4guWySkPcd4+qb5dyBTuT2u+JGyUnfrfw8Zq3wIY9o2G8fHYTTBBOBZOxW0lLdWQr3ScT1
	fyyQgf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJR-00000003XyS-3gAN;
	Fri, 13 Feb 2026 14:38:29 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJL-00000003Xty-2ib0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 14:38:24 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-437159d3ff2so1159192f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770993501; x=1771598301; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/UGGDvqnPusZ8w3DOSxM5/L8hUMj6ctAm+38uUc+sw8=;
        b=0+obbXpm/dBFTPWvPS27QEvp/qltFkKHxQN5u96HpIDz2qV1BoxMSwbGV/mCf1x6ac
         imRHRvJaFwfkxY033EqetoJtZmBJwZHEqo5ejlw8bI5/UQBgeWPYNtS8W9nqpozyvllG
         Ww+tQXIet8NJ8FdP7VYsIcrPkiUmnbHFzpaG3ioCGPG+XYAvcxgqdSQTTsm3juaiinAs
         jWk7nmNQj40AIshHkRCQLTLGYwCcLdxHMSQjJ//lYBNdoQgWCp0S2auv1SwtBc59FYrZ
         zklYHxTnic24GNRYZni6o68yv6vmx/Zj8AhfUhZVhaEgDil87CYV4GZWD6jYX0fSLyHH
         HwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993501; x=1771598301;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/UGGDvqnPusZ8w3DOSxM5/L8hUMj6ctAm+38uUc+sw8=;
        b=D/WzTyapG7gdJRSdpfJPdr2OEuekWdcmwhh9IVRHszPGAs/jUEBo22jCWlgYyUdrXF
         X3w7NOoxA5ru03H44E3lnH5d/YlO3lAW05iTvI69JS+fZ1l9NqN2OkXH3K5ip9Cc59od
         GtQfFhT8AWrSjGegnPtvKEpGyX9YOGSbvrozExgdBaqjFDH4lKmg2S7BZA7QTAGR6Mh2
         CnHSoxVhR1sxuBKHt1t5mXUzJdGLn9ZhftQ77RjOGr5ORqrUGDoGaV7Sx0+5exJrR18h
         RVY+D/obC1+98v3SPqH29IeusMMWfF99XVBnLSUutnkGM6ue/WNDuG0cSX3dlW9aRDTE
         8hww==
X-Forwarded-Encrypted: i=1; AJvYcCUOE0cpT6eLhFQoHp5aGW7RCYdrw5IL0baSzHeZ5QHnB5+zOjuNPUI955VLx9f+jbLc9fFEo2IwhORaQ/rPFGhu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrl1HBpTgOR3t0QycdoXv6vWo1SRHyeSr5M/3Zl79kVV0kIT13
	vAk/LUrm6sRTLoDWhKI/TyIIO6rCcfiTunaPXH5wWN8voQ0idUuV56RpXyglcWz+I+LxHxorn2Y
	o8A==
X-Received: from wrqa11.prod.google.com ([2002:adf:f7cb:0:b0:437:72d9:7316])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:588d:0:b0:436:369f:39fa
 with SMTP id ffacd0b85a97d-43796af9ed9mr4847850f8f.44.1770993501337; Fri, 13
 Feb 2026 06:38:21 -0800 (PST)
Date: Fri, 13 Feb 2026 14:38:15 +0000
In-Reply-To: <20260213143815.1732675-1-tabba@google.com>
Mime-Version: 1.0
References: <20260213143815.1732675-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260213143815.1732675-5-tabba@google.com>
Subject: [PATCH v2 4/4] KVM: arm64: Remove redundant kern_hyp_va() in unpin_host_sve_state()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063823_694947_4725116F 
X-CRM114-Status: GOOD (  11.49  )
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

The `sve_state` pointer in `hyp_vcpu->vcpu.arch` is initialized as a
hypervisor virtual address during vCPU initialization in
`pkvm_vcpu_init_sve()`.

`unpin_host_sve_state()` calls `kern_hyp_va()` on this address. Since
`kern_hyp_va()` is idempotent, it's not a bug. However, it is
unnecessary and potentially confusing. Remove the redundant conversion.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 59a010221818..389fa5f09c3d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -392,7 +392,7 @@ static void unpin_host_sve_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 	if (!vcpu_has_feature(&hyp_vcpu->vcpu, KVM_ARM_VCPU_SVE))
 		return;
 
-	sve_state = kern_hyp_va(hyp_vcpu->vcpu.arch.sve_state);
+	sve_state = hyp_vcpu->vcpu.arch.sve_state;
 	hyp_unpin_shared_mem(sve_state,
 			     sve_state + vcpu_sve_state_size(&hyp_vcpu->vcpu));
 }
-- 
2.53.0.273.g2a3d683680-goog


