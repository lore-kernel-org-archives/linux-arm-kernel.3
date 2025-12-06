Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B80D3ABC2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8V9DDSigR69uE32CWTID9idTpYitJ2rw2w6q4YtJdw=; b=OoJNAdINYh0aKVnPy+ztKz/q8f
	EVcEBqvuwXpvtpU79bgMhR7U/hojFpaBsEwheD8roAmPoq5pmGeBwkPSrUo2o+IJ80JaNsGHqLrZu
	VnHD51HpMLBvASAkEUf8knrSzY2VqssaGwQg5X0RWXJdgzqBafDPE55RtFxrMIZU2Twcptz4sJ93d
	ntgwqzT1fVEUA4U0uAmePHYxKNL5aIiFtILZspfFrUWK7G9y7xTEUM+Sgg6Nx6oOd9JWsgYYQY/2h
	Uggz7Ff5pyGcCtgpLtCOfWpM5RBSwZWngtK1LwYwkg7jbTFo/MaHwTaaI9XNWDyiI2nJh7phnxIxz
	mrtQk8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2m-0000000AKLG-2ntU;
	Sat, 06 Dec 2025 00:21:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0s-0000000AGXF-0lZb
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n8V9DDSigR69uE32CWTID9idTpYitJ2rw2w6q4YtJdw=; b=K+EZwZgU8m5cKhES/aMMKc8Emt
	6zcPjhNUvgFsrlcsbqkc0OzhFezgPbNKtAxlEiVTv/RwLmYL258NzR/OtMYqha6/PZoNvzFG7/Bje
	XgQlV0KaPLfImt5V1gEbkoPNehUqQgrnla3U6RPF3llYtd39rO53zFiyS8Qd7jsccdFOdPhXcRNRT
	/mrtj3cxCQuI9wzL9FwdAeIf00Cil4YDABMDKXJDNAziBgqvKRW3YicV/8PKohQJ7E3C3GW2+/5H7
	8XUMLfSeRv/olw/ZUYYg+ld3SAgBk+Q2Mr7fCa9Y4WH2DnPV/keCVguFnw3LYodiZmGin75ZacsKe
	Kx2TsS1Q==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0m-00000006Spn-18GW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:19:00 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so2381235b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980333; x=1765585133; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=n8V9DDSigR69uE32CWTID9idTpYitJ2rw2w6q4YtJdw=;
        b=lQdd7+Lyec53L2mx9m0tW0PsQlz7EVBzkVC5AfkccSHmJLbAkKlGMRGG2Aa4kUs4CV
         S5/UcAmxwmtxn9ly/ZKAVFr08PRSb6VWxcDhIea6xnw/n+erF/hU+kPKUE9CDdtlZQpD
         l/oHSD5kk2jQZOe+qG/1E0+aW/ZTksYu8WgbYbio7mAIDORptxdm1Kwo2KH4Pg4edrYs
         OUnD66uo4fO09lP917kmyMIjLmHV5ptCa2+iuBZxH9NGcdt2t36EsAJMYK0G6nMSioJm
         63U1KKdqXlTUj7xygW7LQrnqRR/0bRy6sZg2Kx06HUJmjWm9WehjwramB6i7A4KcnqTt
         w8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980333; x=1765585133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8V9DDSigR69uE32CWTID9idTpYitJ2rw2w6q4YtJdw=;
        b=sfKvFfI7tfN3Y9wczzBa7w7JEsrXXhBrLF3GZ/7sX0Y3s3rUQ8QeeW8iLLhlp70oW/
         nQOcChc6foonN6fKhBSzAdBSS/hTdarVp+xDfeSHpTguN6yF03KsIlWSlQLIZ4iKD+Gf
         eVIzk5iV+JpGQbj+hsitUqyOZooaZhtkqZKnt6hOUsvWHK4oQi0fU38wg9NgGXtWUpLX
         QH15++ouj3yOJmWoQsypwU6Dvpi5+erxXvcQ9Mrsmqgw+P3Ne1qq9K2ujb233sZe0En7
         ESuVNVwH/8wP2nZtPqcoKcfQKM7bGLtjcIInQ3vqYX0V/DJN/Ep82bpWTLDCp2nZzTXy
         9vfQ==
X-Gm-Message-State: AOJu0YxTh+K/dduoCVbqYM0atdbAIxh8PuLgwqsOO3zWyBhvdMYH0A9z
	aCE/qNNziDzV8i38qP3uEWspKW3shcvmUenIyOvRuE9qOSFq0OKKgw23oGm7P/HeBsxzBcmxkFW
	cvsiI9A==
X-Google-Smtp-Source: AGHT+IFvgfK2a2snqIy1Rm8aE6qptyZkQEpan42/+C7VOcIZpnFc5T7dKOJ6QhHIoZwkwV6ZMBDtCsCouY0=
X-Received: from pfbim5.prod.google.com ([2002:a05:6a00:8d85:b0:7b0:e3d3:f042])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:888d:0:b0:7e1:89ad:991
 with SMTP id d2e1a72fcca58-7e8c6da8d28mr855283b3a.32.1764980332931; Fri, 05
 Dec 2025 16:18:52 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:19 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-44-seanjc@google.com>
Subject: [PATCH v6 43/44] KVM: VMX: Initialize vmcs01.VM_EXIT_MSR_STORE_ADDR
 with list address
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
X-CRM114-CacheID: sfid-20251206_001856_374202_9B716C50 
X-CRM114-Status: GOOD (  10.36  )
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

Initialize vmcs01.VM_EXIT_MSR_STORE_ADDR to point at the vCPU's
msr_autostore list in anticipation of utilizing the auto-store
functionality, and to harden KVM against stray reads to pfn 0 (or, in
theory, a random pfn if the underlying CPU uses a complex scheme for
encoding VMCS data).  The MSR auto lists are supposed to be ignored if the
associated COUNT VMCS field is '0', but leaving the ADDR field
zero-initialized in memory is an unnecessary risk (albeit a minuscule risk)
given that the cost is a single VMWRITE during vCPU creation.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 3f64d4b1b19c..6a17cb90eaf4 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4933,6 +4933,7 @@ static void init_vmcs(struct vcpu_vmx *vmx)
 		vmcs_write64(VM_FUNCTION_CONTROL, 0);
 
 	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, 0);
+	vmcs_write64(VM_EXIT_MSR_STORE_ADDR, __pa(vmx->msr_autostore.val));
 	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, 0);
 	vmcs_write64(VM_EXIT_MSR_LOAD_ADDR, __pa(vmx->msr_autoload.host.val));
 	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, 0);
-- 
2.52.0.223.gf5cc29aaa4-goog


