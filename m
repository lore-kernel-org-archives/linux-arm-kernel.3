Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B16CC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pi5hsDnuks7nSFD8RayInQ9oz1eBhk4hTX7Cx/64BFI=; b=j2pO+izbdXb4vsOX3NqjOzJoOZ
	qpRSieYlqIbEnpwUMz3d1PAuFZ8SPLeIeDrIFJu9qn4ZiRcBTggFCB0BUNmEVS3UWL1EF8tYX94w9
	eRdAvHEyw7hhP/rLAzmkS4HcFFWBK6p/yHK5fDW4380li8+rYQYt47aU6Kp3j/3NYdo99ms7NAeJO
	2s0Fip9UhGrFiIysKueGu2zzR5I7s48jzSzbhD13fhE4sXIvJv7srVOhAHX5maH6cZ1GRJj743H/5
	lXFw2Rp9gBooWJMXgbBcV1WS2tYBItioTEBuGYy6uiik+B379CNYNAcF/xlL0MmKxTj2Zu5mlGEI7
	jlvolEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmsR-0000000Gky9-1EeQ;
	Wed, 06 Aug 2025 22:44:55 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHT-0000000GH1v-2kyo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:37 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-24004ac2ecdso3150645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510314; x=1755115114; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi5hsDnuks7nSFD8RayInQ9oz1eBhk4hTX7Cx/64BFI=;
        b=Hgl9Tqxu6scnD6Ula4H6HuF6vdt3hQIXl969ndEoyieBVaCpSgeL/g4UYDUi96RLth
         W/seyHigZQWitduwsB1FKT+tkFBjHyHQ/PrIst7umtMi846F+HavWIw8w4x2ngHUf1+O
         TiUFQdo0fvj5vrZIZz/BoHeV34olo8bnKxjTOPsqMHyNU9CCoR1YCmywf0InPPVcfBqF
         AmPvu0mQrvnPByfQl5zIqUO9idbWaX4CV0OckCgXRlEdVQ26VjThQbL9quB3zbnmQyfZ
         a065ZoLO/dmjT9U1Xf6VeJl1sfX8ZLmDZ9VcbNs+9MTIKpiKLcghh4PYzEBRLiSx4/SY
         +uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510314; x=1755115114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi5hsDnuks7nSFD8RayInQ9oz1eBhk4hTX7Cx/64BFI=;
        b=VIthMqnlh4IUd5uw/0zc3/zxbwnu3+NIzdXzwp6oEJz/WRiMtoUR9/kgiPIc36ChRw
         z/xcs5UdRzktC/AksBz9wBc92fVGvEBN5AQq+1Mmz9D6eYmpwvgYNTqWRMW2fVpH2yZG
         VzCMU89iGPmre2zc9XGdB9FCMblNYEXZdNpBuRqIHpADRD4Q//cpX7CgI11zZ2jA4ibW
         OoJn6F4x4twbx77qdkYbU6T2+jDjCS7ImhBFtqf537lbII6G1T50jvQjjFN0Z+lpwcnZ
         TumNoYFUjhyVA/VQQtZMbchVIT6JAjCibcXhwhLeCAb6FztX6pi8AQeRZ/wLGzYPn0UH
         x7bw==
X-Gm-Message-State: AOJu0YyEkc4iIBHeSvwm7dyoShGJCTnUU+mUZinc+9AFgJoCCM5CEH6z
	pPsPGgxIhHOnOauujht9/Q1YLlTg3HJzV+zq/NPEv1da4KY0+JYM3iPi7t/z7wq1sGI+bBe8I9R
	/Lo0hBA==
X-Google-Smtp-Source: AGHT+IEJD5GH7UI5TAAlffejmtsOUdJu9B+mpPPWAxLwTCJvZJKLbNbFAds3hHNJ28h7v90ap7LjckKJrbQ=
X-Received: from plhl7.prod.google.com ([2002:a17:903:1207:b0:235:f4e3:ba29])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d581:b0:234:d7b2:2ac3
 with SMTP id d9443c01a7336-2429f2eea48mr59065095ad.20.1754510314065; Wed, 06
 Aug 2025 12:58:34 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:58 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-37-seanjc@google.com>
Subject: [PATCH v5 36/44] KVM: x86/pmu: Always stuff GuestOnly=1,HostOnly=0
 for mediated PMCs on AMD
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125835_691653_DAF6A171 
X-CRM114-Status: GOOD (  13.95  )
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
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 9641ef5d0dd7..a5e70a4e7647 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -165,7 +165,8 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
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
2.50.1.565.gc32cd1483b-goog


