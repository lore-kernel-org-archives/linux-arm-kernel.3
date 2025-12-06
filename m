Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC3FD3ABC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dnk2MNp76sLgAxgNfD42hkkfZBnnHFIERQ6eKlhSyM=; b=va6OoYgTPRWr+NFgMO56Gsaa3z
	cOaMcKLFUnxUy1ViW7tPcZNpHlFFlsMJgKcpM4TsrKHa731ELB+tjHvhCpkQ1aAqwRoAp+7YzDax+
	WaQmLdstf8YKXMYyYdzNKCc1cnca8SyrPZZYHb0byTNtHt/Rf43Tg3ckEHVEIuoh4ZE9C1dX8GwPn
	mRl8rLTXtIeDgZlXBIOds+Z+bqct5oHnWixRmnbDRJyNVtrOvk5iFFK6B+TFMbWKW9wgxPz/9W0SS
	BKZpahSW4iOoyBF9xrp6AbK9SOnJP8sG1pTZWqHVlKj5t94Vqz6fxQnJCR2NaDUccJfOckm/3ulUm
	JWSw8QXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1i-0000000AI74-0SmS;
	Sat, 06 Dec 2025 00:19:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0L-0000000AFZs-1zap
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3dnk2MNp76sLgAxgNfD42hkkfZBnnHFIERQ6eKlhSyM=; b=rUNEazsz/0/OXwn3XuHNdfbZ84
	p4CENQK3sHV7Gewz0NXClwCD13Fek4FgYJnmxTCq+7x7N/xMwiT/cG0eV/EdW3zPkQP6p57uNHLQM
	69/M+l/dod7DyHxDbst968fEHC0NieNW4f7Fwmn3Td2bAAL6WiVyZe8EHG/dzPXM71vZcu2Tk+59U
	E9vo500O9DZGgkn5hgTjfXRSTvBl/0zvtx5T5aCXxmrxQCEQClc7zKobhXnAfkw90BWl3EiFXvlIR
	GnsnNv6UcF/qf5EUPtbQr3fzw6NDJMeF9+hIFXOq270qLIgUDdYMLBcXQsf3WWDqinqyOyslZDjuL
	e3K7bsUQ==;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0E-00000006SUU-3Itj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:27 +0000
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-349aadb8ab9so104587a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980299; x=1765585099; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3dnk2MNp76sLgAxgNfD42hkkfZBnnHFIERQ6eKlhSyM=;
        b=Uz0laklqK05v52Jt5pIi32Wvk7PRTxwabfdBX+B/9WjOgdwq8sqPVuVBFFnN+tRT3l
         lLM5S3R1bz17Sj9bTGW1MQr0kkmPM0X1Z6J5jePbMYoWTQfRUxYEHqYxFjODuxLqD4yS
         7C5/gOU6G7nzgfTb4lycWPxWrrWVg/jJVXM+1sNHWcqirnRzadBPgAna+qQ1RhpPORJF
         m2LXPgv4CSri4uyhCmRUns8j8cBVlLG1hkVS0TM44CxkotwGa7f4m/mlsF1J2xb9qcfu
         /RtFct43z1W5QmLSbvI49xJ2Lyl5Z0r2mVkT0zfxYDyyvxJa40o87ybmy0hZnPu5ae4E
         PzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980299; x=1765585099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dnk2MNp76sLgAxgNfD42hkkfZBnnHFIERQ6eKlhSyM=;
        b=M6/UmfAz1zjZe85mRv7cIpmdKm42gRhOP3ylJYhoiB8iBdqIlAj/8boAPxbpbsFm+K
         RCMKMwCXpXWhjDeXpKZ/lRSUpdwoXizL01/INmKrACnmlXsGn2I9R0dCYr19xAu4Js0U
         b+G/CKuX8S8cF/V1yXc/UyAw+vUw2KOyzk888uApWnifLu2hCCKX8DNjjHINBRvVfR8x
         wsAzwsGIMB2OYM9yCpq9QsPvaHWjkS7+dHuP6nxfpfsAzElMiEMtRPEGpKnDxANuEl4I
         vvQBuVkXeSI+lmm0D/FGmb/fTcDEh/b5zMl/7kTslAa+VILlHwLod9BzwPrX3XoQcmuD
         /EWA==
X-Gm-Message-State: AOJu0YzjDy5YRjOTMEU3csP4lKjzViqLxSneXfZ/rOpCM1rui8G8WZ8N
	skTEd7YsPTcLeT1y5QefykkenQWJDQyXdkmLfxWyoiVVlFEW4Jw95/jYMnRaFkZG9+D8eKacYLx
	pG4dOEg==
X-Google-Smtp-Source: AGHT+IFWJxm66Taju4sAXeG8Zi046j5cUgR9dVl+uDTUXVS82TWmhcnKPkrnyr1pnneTXazQsF/t/WHWvfY=
X-Received: from pjll2.prod.google.com ([2002:a17:90a:702:b0:349:3867:ccc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c4a:b0:339:d03e:2a11
 with SMTP id 98e67ed59e1d1-349a2511dfemr604485a91.14.1764980298595; Fri, 05
 Dec 2025 16:18:18 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:02 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-27-seanjc@google.com>
Subject: [PATCH v6 26/44] KVM: x86/pmu: Always stuff GuestOnly=1,HostOnly=0
 for mediated PMCs on AMD
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_001822_870368_F0BAD75B 
X-CRM114-Status: GOOD (  11.24  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sandipan Das <sandipan.das@amd.com>

On AMD platforms, there is no way to restore PerfCntrGlobalCtl at
VM-Entry or clear it at VM-Exit. Since the register states will be
restored before entering and saved after exiting guest context, the
counters can keep ticking and even overflow leading to chaos while
still in host context.

To avoid this, intecept event selectors, which is already done by mediated
PMU. In addition, always set the GuestOnly bit and clear the HostOnly bit
for PMU selectors on AMD. Doing so allows the counters run only in guest
context even if their enable bits are still set after VM exit and before
host/guest PMU context switch.

Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: massage shortlog]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index c1ec1962314e..6d5f791126b1 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -166,7 +166,8 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		data &= ~pmu->reserved_bits;
 		if (data != pmc->eventsel) {
 			pmc->eventsel = data;
-			pmc->eventsel_hw = data;
+			pmc->eventsel_hw = (data & ~AMD64_EVENTSEL_HOSTONLY) |
+					   AMD64_EVENTSEL_GUESTONLY;
 			kvm_pmu_request_counter_reprogram(pmc);
 		}
 		return 0;
-- 
2.52.0.223.gf5cc29aaa4-goog


