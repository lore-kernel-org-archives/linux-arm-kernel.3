Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F32CCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJJKUukmtYQaIR/sVFEBxkRB48geEpUtcVd8LHPTx8U=; b=sHGVt+/xRzOixwcsbRSwDZ30M5
	Hm+ZMa+6FdjAzeCwMq8V+mPsJ7Muv3/tHlWWU1ONqSIZVW3HLRPaF00SJwPublqlm9JYMTFuk9Dzi
	+zJ94iWy7/3X3lH+8VEwMEHPA3WpxsXMD4HiYhK16CwYsiajcMz8Mb6zDXib2RVjEBQ5H1CwsIsj+
	xMK2ukuoGT+s9RH6V1+iEC6XIJM6zUkkwaEzfUPlu7VtoX5H2a14lRZfq8TkvzHc+8Blau2urhxdE
	GnodLnEGjotGN8vn8rDF1+EMy3FGlLqgeHHRf9AlzmfsIoVcIb3ZJ2GeJA+V7kxrB9/91TmJXYs6d
	yD75PL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGd1-0000000Bp6k-3VFX;
	Tue, 04 Nov 2025 12:59:15 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGcy-0000000Bp3a-02Ae
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:59:13 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b6d42c454c2so557687866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762261150; x=1762865950; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJJKUukmtYQaIR/sVFEBxkRB48geEpUtcVd8LHPTx8U=;
        b=wGEh65AEXvzXLJAbIAvL0TfTlQGWdWDkKXMFrqU2HbRvSc5tzVJctS/WM3bGJ9wRjF
         iYHRABxew2dVg+IdYPKQ92zwBeRYmSH2IiAfAzix7ameno4b9N8vyUBVFAW7dTt6U4sA
         HQVTd/sUu4d4jBRlVfpG3DNrAM2f2MMJ+PZopVbHMyJVTGFdx//njyXCPmTjrby67jei
         xGsx5PIPFUEyH4gko5nt+QpyK7PnX6I9Hi1QbuOTL3V0uxgap/To6UkkPl4yhJ2EJlip
         4CQa+YC3Z9PZ8nGKmLaFtC90OOYgIMC59EAWxe+p3f8XgizGMuESapQsKMFGf35mDQqF
         bhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261150; x=1762865950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJJKUukmtYQaIR/sVFEBxkRB48geEpUtcVd8LHPTx8U=;
        b=UjT2cgn7LExJAVFyzWzSquXYHayabjjQuPQ5xWEST67obUXFlg8mXipuj0RYVLAIzB
         pnNa96KInAj6b8Ga10v7kpH78eNl/Gd88cpnxWR0YhC6WvlfdZcntCGITdERgwT00fMp
         8mPNx+Hkn/6Q4sF47BEKsPg4Y7GWubWlN6pZPQlC2kVChSgc9AE/xEEXiT3EdyaYu3n3
         9xsrhlG8W/x6kqd+27CC1YOXAvWGzBR09Iyr9BOAl6wyhS+N1M0zPFwc9JVlEW45638+
         MCT6pKjw2Gy38NuSd+7jUAa0ihSunv29q4kHrYlLOC1WQzReWjj1D/83irBfVgWgq4vd
         s/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCV42ai9qQVWOV5P5EBHgmG6iblwpr2PkJFNLHhAgqiXO+PImfX0S2qhO/ISECnZP9QIo7F/uH2wVUWvuRVxp9Iq@lists.infradead.org
X-Gm-Message-State: AOJu0YyUT+JH3zNfutro7L1fTWuMrlOl8PM2MMGi98CBiq85+00hzYJC
	EEl0tFCN0/F7K+k+z/h0cOtNXrnckrLZmSCRSsqqbNPIFAQFnybpC45AurNVXbqxYkLSzwPaOb1
	jDA==
X-Google-Smtp-Source: AGHT+IEOdP9iyZ5It5atgbSWlljHc9y9jZHiLNUJy7POzcoGzX1zV2NPRsvVKQQy6yVLSjs2DTh56cEzgw==
X-Received: from edrv26.prod.google.com ([2002:aa7:d65a:0:b0:640:6b4f:f86b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3e11:b0:b64:8464:68cb
 with SMTP id a640c23a62f3a-b70700d1daamr1861128866b.10.1762261149824; Tue, 04
 Nov 2025 04:59:09 -0800 (PST)
Date: Tue,  4 Nov 2025 12:59:01 +0000
In-Reply-To: <20251104125906.1919426-1-tabba@google.com>
Mime-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Message-ID: <20251104125906.1919426-4-tabba@google.com>
Subject: [PATCH v1 3/8] KVM: arm64: Enable LS64 instructions when supported by guest
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_045912_053680_6711C4A3 
X-CRM114-Status: GOOD (  11.04  )
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

The FEAT_LS64* family (FEAT_LS64, FEAT_LS64_V, FEAT_LS64_ACCDATA)
enables support for LD64B, ST64B, and their variants. If a guest is
advertised these features, KVM should not trap accesses to these
instructions to EL2.

This is controlled by the HCRX_EL2_EnASR, HCRX_EL2_EnALS, and
HCRX_EL2_EnAS0 bits. When clear, these bits trap the corresponding
instructions. KVM did not set them, which would cause guest-supported
instructions to trap.

This also created a state mismatch for nested virtualization, which
validates its own HCRX_EL2 value against the features advertised in the
guest's ID_AA64ISAR1_EL1 (in handle_other()).

Fix this by checking for each FEAT_LS64* variant in
vcpu_set_hcrx() and setting the corresponding HCRX_EL2 enable
bit if the guest supports the feature.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 3fc62808c548..7880e8290a20 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -691,6 +691,15 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 		if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, NMI, IMP))
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_TALLINT;
 
+		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
+
+		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnALS;
+
+		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnAS0;
+
 		if (kvm_has_tcr2(kvm))
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
 
-- 
2.51.2.997.g839fc31de9-goog


