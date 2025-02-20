Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9630AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWRXbppsiEDXYIZyPawrnpzOZz1QBOlzbaekCOtPmh4=; b=kvqdTm4rft+fgd/oGL4pAIAweS
	uPBZgSmdiliKzHnOxitbZKsvSO1OmXT1exXOl/IlAvyhX2Ddk/9GJJ5tDu2tgEB5kBEFri5Ojnwyo
	zZIeZqEg1Yfz7G2sY4en+AF6/cktcB5rPOUewgmK+PdVANwLNFzEFN6MnAlu59vZ8tgJLmUXb+pWN
	2sx+D1odXrDt6QXJjkQ12HIyXY50QtxZlHUPotISoHZD3WdnZMWL2ML/WMhaBMkEU4Q41eSl9vZai
	A06v8anp2JZhbrKBIrdHd+6+iVSX/NvZTmIoAb2u/D2jJiHfm/XlH0Pxhfy3bfJBOslGFV3Kbz8V0
	tvqT8w9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlG5k-00000003Le4-1jKN;
	Thu, 20 Feb 2025 23:36:28 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFzb-00000003KE3-01oX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:30:08 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc1cb0c2cbso4809134a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 15:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740094205; x=1740699005; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWRXbppsiEDXYIZyPawrnpzOZz1QBOlzbaekCOtPmh4=;
        b=XET/kCuwFZ0kiT3kiW3psSCm61dVPyHq+UnR2KqWaZ2JyPNoFH3Jo4MFfjsCC6kbWf
         YqYEFQaaTl8Y+h2T6QCVwBWUTdeF9QTa8q9DQfPugRaRcsJoxMDnidK3uu6hbUBisgeE
         wIstFU6JER+1ux/L5qxOlBtWxoH1KGo8I4ZkyWnrLtFDlZukM1SVrIzEZEigXt+fFj72
         u2nXonyaTVUxkcQ2hguSXfbAy4m7wmVh/3RPY8wG7eJmzVNpJ4P1ZTZW34rEAa4WxIMI
         kkS/r4XQ78IMAV+Pd0xd3WjXBzEnPSu+Q7NWLyevsFY2waTLY6m56Po30Buupp0aUiJs
         oxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740094205; x=1740699005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWRXbppsiEDXYIZyPawrnpzOZz1QBOlzbaekCOtPmh4=;
        b=Ez0kAlpH9FSLzHmoWfz5u/bTJsa8aXDAgG20L9ZiUwiURYrxdlmcZ0DH0wFC6hkddJ
         ONbd7b0Fns0my9fJUGFegdqsVDMOJVpg0pL1K4D7XEqEL/vDvxyNtRW0AVh8HJUKsIkZ
         St1PET3vV57d/dOgnH2f4orwqcJiS9Hbzx02FWb5/+Htj9mJFWzrKVLOYR6KaHQ5DN3f
         sucU+7ioMbOLDFBWdSIiDqwmIiWuN4w0dm66RwT3bu8cw/rN2kSR+dEllwcH69OTlYwP
         AWhSnsndhHdALVXOJCVTOAf7q7UeanC76YTJYLO/WPDoIA+A9yYflTs721am+yVw+KS3
         zJPA==
X-Forwarded-Encrypted: i=1; AJvYcCWpI1GMj7EMXExIaF5WrqeWmlBFIadfvqoqDIWInvXxcEEhjlwgwRWiZLnLuAc6Vq3Q1VK1t+n8Ao0Ju/Yptbfs@lists.infradead.org
X-Gm-Message-State: AOJu0YxuQ2GRYcm1P7ROfBVYugVaGboiTDtG2w+a3BlzntEAbXltWu/9
	L+Ns6oAQvAjQTpsaQ5o79Z1De7nGA6LvGJxvCGAmvrqHzfQR64DDio0LOiXS/YyifIg8EYu1icM
	vaEw4iHZv0g==
X-Google-Smtp-Source: AGHT+IEJgmi64wdMWyANqEO34cKSZI9Wuz5tHq4A/owmtalUI629cLYAyrOiwBDklXhEIDQhnrCFWifbpOyeVA==
X-Received: from pjz8.prod.google.com ([2002:a17:90b:56c8:b0:2fc:c98:ea47])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2590:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2fce75e1b18mr2115049a91.0.1740094205662;
 Thu, 20 Feb 2025 15:30:05 -0800 (PST)
Date: Thu, 20 Feb 2025 23:29:58 +0000
In-Reply-To: <20250220232959.247600-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250220232959.247600-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250220232959.247600-2-jiaqiyan@google.com>
Subject: [RFC PATCH v3 2/3] KVM: arm64: set FnV in vcpu's ESR_ELx when host
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
X-CRM114-CacheID: sfid-20250220_153007_044659_D4C7D441 
X-CRM114-Status: GOOD (  13.60  )
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
- in vcpu's ESR_EL1 to let guest kernel know that FAR_EL1 is invalid
  and holds garbage value
- in vcpu's ESR_EL2 to let nested virtualization know that FAR_EL2 is
  invalid and holds garbage value

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
2.48.1.658.g4767266eb4-goog


