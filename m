Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993E2C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/SDRiEvlFPURLOqU9cvaEHLIGWmWIs1As/F4u7O1+A=; b=meoEahJCd0IYEzG61A2PYEUJaN
	wYvqh+cR/xZPhzZiWrI0mHMgWcGagKkytHM7bDBZSomWclEBJqK7IW4oF5OihFKdiCEQs0uWNmYrf
	IT55VaXbRPHlDpNwbwBU4qB0yu1oC/Sz0V6WiH7NkRwBnUf9arZHgTO7TrLkKmy9rYrttYCeIvr6Y
	kA+2s879ykK5x7JWIrgEOBVjin33dzCc/MsMpWd64bN2TXMnC28pnZxOi1+ArSpByintL0mDef0UT
	+mx+4KGJtTV0g6AtAa8MsZSzrHAEwlsEbcpccsfKBSr9xnLnLyI7kodr17uCxZxZyDtjh+Pw2fSJy
	U58eQVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fP-0000000GoLW-0I6O;
	Fri, 11 Sep 2026 13:51:47 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ey-0000000Gnwp-1NEn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:22 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c21946c03e5so233624366b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134677; x=1789739477; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/SDRiEvlFPURLOqU9cvaEHLIGWmWIs1As/F4u7O1+A=;
        b=AaVurfxlkK9DqCU61GXkBySmFBVFOCQ0eOixQ059bgnBMjqrnOOWyE7uo6t8PqJ3FA
         981YQ6oHnxM8wFKK0MPkCAE63agDQ+9NAw/IDhT8Bmzi8yCadHmlRoqMkpcNKippNmrC
         FF5WR18LSqOLn8253JAkqKWFZQEG4Bxd1cJG0KpGitDowGAZSHJI32UQW8R2BJP+Boh5
         jcZfLEonuMQLLos6vdCJEjJuFeMAmoKvvReUb3jvxfo5g5sw8gTQgXjVb5bl32P140gz
         dIgfqHf6PQno0l4q6srrdRlhdfQ5LXfCseznVnu/ILAmZLGQ13+quoxDTgdUtRxP4DP2
         zmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134677; x=1789739477;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/SDRiEvlFPURLOqU9cvaEHLIGWmWIs1As/F4u7O1+A=;
        b=ocv1UZY/NJbGR0xHnEb97W7LYyp1zbrNKXTldT3/te6lJYVg7YHuZ/HAJjXpNVs72X
         N6zHkS7UUdMi0YHlbSGI8CprDsj9k0UV1ymkBW2qQ4lhAC3wO2DRmi1jOePOD939Jm9W
         6T+oCYNLpAaiIxp9UrG/AHpZTQWiTKShpGOguatlrziB/t0scAQx8UbLVTzuro9w/w5Q
         iDQHdJxlp3xv7FDmJBn5rnjRFIxf+B9e7fQJ7MrKMFLI7sDxDRNFaE9/kHJDsFH2p71F
         Sd+ipULGrrNPCLpKAkXaDLs5JAkgxTohkAy49OUouljFKbb8cVZwDurvJb4WcxJS4Zkf
         e6ww==
X-Forwarded-Encrypted: i=1; AKwUvBw0PEvnT7U9h6xMG3TuYijBJp1iPDOJ/YroZAij6XNtgyOA5B2qnWixo5JrfGVCI80yRICzBZneXpml6iM8RTm5@lists.infradead.org
X-Gm-Message-State: AFuF++k65ASwzlUNgdrtZTdbDla6b97E4kxFjHFE6bbc0o+N2iozf6/p
	amzLhcaG89Z41XxSzxoq2gc9WHl57Dc1utOEh+6qIXlLhxBtqmBgiIs7Q4UQ+yWkDNuqUnxLkb8
	XBlm3AYzQkJ9bW2CwxPJJZA==
X-Received: from edgd18-n2.prod.google.com ([2002:a05:6402:a512:20b0:6a3:ebb1:61f4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5346:20b0:6a9:8df4:13d3 with SMTP id 4fb4d7f45d1cf-6a9a3277ee7mr3752121a12.21.1789134677106;
 Fri, 11 Sep 2026 06:51:17 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:44 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-14-vdonnefort@google.com>
Subject: [PATCH v2 13/22] KVM: arm64: Handle huge mappings in __pkvm_vcpu_in_poison_fault()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065120_399229_5EDDD29D 
X-CRM114-Status: GOOD (  11.48  )
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

In preparation for supporting stage-2 huge mappings for protected VMs,
allow __pkvm_vcpu_in_poison_fault() to work with PMD_SIZE mappings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 674159736495..cfcdf187cbc3 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -971,7 +971,7 @@ int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 	if (ret)
 		goto unlock;
 
-	if (level != KVM_PGTABLE_LAST_LEVEL) {
+	if (level < KVM_PGTABLE_LAST_LEVEL - 1) {
 		ret = -EINVAL;
 		goto unlock;
 	}
-- 
2.55.0.1007.g17ff1f9808-goog


