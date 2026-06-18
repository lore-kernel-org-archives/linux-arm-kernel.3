Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FA8CD98F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmD9Cr1xCcQkaKp0J7hG0PAULLmxV4B2BqTlvVuIlHU=; b=pWf24aj0+ZMcNjk2xHYJ8LCBoZ
	jN5ILzZwY/FIguZX7wf4RXr/ijlaM3DbF81Y7UqhuGgGtddX7tt58RVO0sDQK8b39GlM4FVYeQHAb
	mUF4IVyD3KlGVtZtvHQC5Wh4GgaE1ZpD/iwirt15FEHH+iOFZJna0ziH3XozP0vj/O8JF4PjrD3GS
	3KkmNM6xDcfzZY/LSo0BcYVK6AJFgkwKOZZMJZ/0Laiggzjx8sWV0hixJ4+Ai6t5ff9FcR9U6BhWr
	Z+BXMtJkGhq/XHeN69e9SLCcgH3blFcAsuQMlxJfhMf3e1HO/t6TCwsINDB3CA+9dE/Hx+sG9XN5o
	QSVb28lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfy-00000001F1G-0fmx;
	Thu, 18 Jun 2026 12:16:54 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfs-00000001EyK-2eQH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:16:49 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-bfe735f3bc5so79411566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781785006; x=1782389806; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MmD9Cr1xCcQkaKp0J7hG0PAULLmxV4B2BqTlvVuIlHU=;
        b=AdlUz0MSxpxklm8ICdI8zSKtV7IW2ilAiWTI4PrylBfvhGKwCibzi6Jl5PtzHt15h/
         e/SwD4ykFt/BN617uUZ1g8YLT5lpKKbLoBI89LlaTfzdCerb4CIK6UQfrpzhcfk//+At
         ihQq0bEll+4yw8OMNtjjJ4PDmikFPuu8WpeUsyb10QMHdNM3CAYv/dSu0eIQZQf0Sddk
         ieYyZDkn+T5f0e3OC3H4lA0vSZ3XekDiPsJUVEtTatkdxpNoKBzVb4WAZ/EzwUHTrm6G
         5ZEGUrl8HdmQhjpUPoxsfE1koPC1ly4UuofTcfacEPSR3oE+zRTrKN3Wy5Nsjm/rzhbK
         kj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785006; x=1782389806;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmD9Cr1xCcQkaKp0J7hG0PAULLmxV4B2BqTlvVuIlHU=;
        b=olbjQvbw9hPqTj7MtGNBT/9GQyawlJigPEPprQmVyXYvNu/5gWHH0cKP53zHdw0GTX
         kXYsUzZG4VdY0jFA78wtaeQsi//4gkOppyRiCgCHbJ5lXNZOEaO5qppc3RfpqyuAUfT0
         3e8cwCZbtVEdVkvZT3Acx/VqHl1YDcnqDewKxXqNqz9YJ71gA0AXih1txP9yQpstcPTi
         2w1USPVpaukSBa2M2iIEIbYBc/RM6lTGHiHl/TbRvBfd7veWGoacTVHFUGgmeLw73t9p
         JCFRks7BwXxQSnEAle0zfOPW3meG+Mqo0lmy1puVMZ7pEGO09Nxv5LOVjamn8VCr1JkB
         A59A==
X-Forwarded-Encrypted: i=1; AFNElJ+jL4W2d/dnkK84aK5+iw4nTwoE8yy2/wVPPMX927Mwngf6fC4pYQD3stgEOEbKK+Vu0qDIvd7uS8+MJ6pvpkDR@lists.infradead.org
X-Gm-Message-State: AOJu0YzevAknXWyhg8yhiTWPMVGosLc0pgGhLcQuwtVD5fq5CEbGx4Se
	tQdW1TILHhm4EhlMJ0IKKrYBJCu9L6IQHRr73VFk6c+svcWvz+04oedOvf3hgwqcFXSXiHHbDCq
	rvA==
X-Received: from wrs10.prod.google.com ([2002:a05:6000:64a:b0:462:b6f9:c0d7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9305:b0:beb:b53d:4841
 with SMTP id a640c23a62f3a-c05a73a7992mr547603266b.35.1781785005667; Thu, 18
 Jun 2026 05:16:45 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:16:37 +0100
In-Reply-To: <20260618121643.4105064-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618121643.4105064-2-tabba@google.com>
Subject: [PATCH v2 1/7] KVM: arm64: Set ESR_ELx.IL for injected undefined
 exceptions at EL2
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_051648_674482_2C7149CE 
X-CRM114-Status: GOOD (  11.50  )
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

inject_undef64() constructs an ESR with EC=0 (Unknown) but does not set
IL. The architecture mandates IL=1 for EC=0 unconditionally (ARM DDI
0487, ESR_ELx.IL description), so the injected syndrome is one that
conforming hardware cannot produce.

Set ESR_ELx_IL in the constructed syndrome.

Fixes: e5d40a5a97c1 ("KVM: arm64: pkvm: Add a generic synchronous exception injection primitive")
Reported-by: sashiko <sashiko@sashiko.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8c3fbb413a06..9767adf1f73e 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -278,7 +278,7 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
  */
 static void inject_undef64(struct kvm_vcpu *vcpu)
 {
-	inject_sync64(vcpu, (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT));
+	inject_sync64(vcpu, (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL);
 }
 
 static u64 read_id_reg(const struct kvm_vcpu *vcpu,
-- 
2.54.0.1189.g8c84645362-goog


