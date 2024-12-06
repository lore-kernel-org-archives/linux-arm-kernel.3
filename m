Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90BFE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odFeXfqtlca+kvw0AmBBC4wYZf1vb1zFbu4qDCM5v8E=; b=RQyR1AZABexNOmAkRBmb6Te7m/
	1rJYtU9G0QDW96UDulrLXDvlIPQZxVmROoHf1MrOs3ccoN9lwFrhXDHonVsJhjfTH4VpFCYAIOir4
	GeMfqiCsM3sn8+HVm80NExyppMENvToU7ZLHO0r7BLnLGMQ9ZbGoh8EFSrtSrI9OO4oLq6ueEyvrH
	kG2e90NuAmBOi0bYnszaliBITpkCqot6fM6DxjNTFsXZofyRIxLaRQ5Hnzc8vGRzMFbsj4eN2PDlt
	F3hYir6sRR+aufMgWrW298WTcVNGavVthMbBXGI3Vdq3nYvDIK8A2nY9kuqCUm7gmt/ybiwhpfZz8
	jRNxoZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMnd-00000000AHr-0xRz;
	Fri, 06 Dec 2024 01:06:29 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMkB-000000009eR-0l0j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 01:02:56 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee86953aeaso1561253a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 17:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733446974; x=1734051774; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=odFeXfqtlca+kvw0AmBBC4wYZf1vb1zFbu4qDCM5v8E=;
        b=J6gay0mcihh7Zx4uxOccNEgGT/BwzsqDTwix6qrdmXG8XbB0WlsdQuP3UkPgqjLrWw
         MDRT/QZX7C13h7s+RA6kMmln4C7gPhgTmvP5aBkXT/JES9tDBQEi7g15XEjKZUqB5CFC
         8EdJlMC2n5izXlJ5YlTEYd34vkQmf5ajmBqcrCjhAxfn6fEKPq4pZkE4zKnhRL2KQDOX
         TRhsBGD5+23E9LRf9XMXneEide+uQkk/56X4/ioMX07XbCusVEzfO1MhQG6mdSKgdkO5
         WTXxKpspx6VNjojJTYdMQolhWaSnfvNaTAcSEPeQuqgnA+M3R4EPKSX1iKgo1bM7QflW
         k4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733446974; x=1734051774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odFeXfqtlca+kvw0AmBBC4wYZf1vb1zFbu4qDCM5v8E=;
        b=eSzvDvyxDdFozMZxhoVFGpT+Eik4WUA/mQR+WBCV+5hXxQm6yDWSCGb6+B4uPyip8N
         kM9m8nkYWyjOQ5hRU3q8huOIpYnpJnboGMzn3UCEvXSgPkk3bMScCt0Pq9Sjsokkykt0
         J+DKvew+eEc35HHZIvH54mhCfA4IwNMje9f65rAI8fXmQUjYZ1BDIFxJkFx3LOco9lGp
         CBQXVFeE9olgYw4MvPtUawm7vh2D9l8t1FoCBrS8ppkhKQBmYwmUaw+w/+GUKUaMGSM1
         1L/0Iz+BBsFAnjoIEQfSsGqqeyVhZ5Azn0/eTQyfKVTpSo58OSbpdT9xuMNQ3sG0c43N
         6uNA==
X-Forwarded-Encrypted: i=1; AJvYcCVAv9CIn5kTb1Ts4S6YSzl0T5kbjvISP8kp6+KpryCGo7XDfG1gb9+aZD0ZRHsNN/zA+OgAe9EHIrbcyLnZnrk/@lists.infradead.org
X-Gm-Message-State: AOJu0YwL0f++8vF+R7QERpr4Ae+6e9l7XAuPMa3Oo+jJkLjrLy0nRaN4
	t5X+yN+YEIqsQFEN37KdBmD1xMA+B20eRdHHp8SHtjqMmvpl7mzaYJWzgTHDZa6JlsbffRyIyhX
	HapkiQFOclw==
X-Google-Smtp-Source: AGHT+IG/xsuehHtVKFEvmGgFIgshQ+B4zAUcgF8mwEzljCVlVfmJ7/hjNhV2sOIJea1Ftx1RfhpzvhzzdrXv8Q==
X-Received: from pjbqo11.prod.google.com ([2002:a17:90b:3dcb:b0:2e2:8d64:6213])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c07:b0:2ee:d024:e4f7 with SMTP id 98e67ed59e1d1-2ef6919952fmr2142759a91.0.1733446973755;
 Thu, 05 Dec 2024 17:02:53 -0800 (PST)
Date: Fri,  6 Dec 2024 01:02:45 +0000
In-Reply-To: <20241206010246.40282-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20241206010246.40282-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206010246.40282-2-jiaqiyan@google.com>
Subject: [RFC PATCH v2 2/3] KVM: arm64: set FnV in vcpu's ESR_ELx when host
 FAR_EL2 is invalid
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_170255_215265_0647BD78 
X-CRM114-Status: GOOD (  12.48  )
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
and results in a synchronous external abort (SEA). This means the
poisoned guest physical address is unavailable when KVM handles such
SEA in EL2, and FAR_EL2 just holds a garbage value. KVM sends SIGBUS
to interrupt VMM/vCPU but the si_addr will be zero.

In case VMM later asks KVM to synchronously inject a SEA into the
guest, KVM should set FnV bit
- in vcpu's ESR_EL1 to let guest kernel know that FAR_EL1
- in vcpu's ESR_EL2 to let nested virtualization know that FAR_EL2
is also invalid and holds garbage value.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/kvm/inject_fault.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index a640e839848e6..2b01b331a4879 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -13,6 +13,7 @@
 #include <linux/kvm_host.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_ras.h>
 #include <asm/esr.h>
 
 static void pend_sync_exception(struct kvm_vcpu *vcpu)
@@ -81,6 +82,9 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	if (!is_iabt)
 		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 
+	if (!kvm_vcpu_sea_far_valid(vcpu))
+		esr |= ESR_ELx_FnV;
+
 	esr |= ESR_ELx_FSC_EXTABT;
 
 	if (match_target_el(vcpu, unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC))) {
-- 
2.47.0.338.g60cca15819-goog


