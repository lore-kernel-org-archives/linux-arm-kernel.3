Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF738CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53RW3r37vVd/uOGEJeJ40vwWJphKZpVppDFV/CpDLs4=; b=OxwifrYXzCMK+jPLf9HEFSJf9B
	STwY/BFH3LrxeMobH2i+zkAvcQMWaNExkhQ81PZIOZB5ktip/YiWMOy9zh19KXRCt/bwPZ6GNb8Gj
	aigfPB2lSqXw2Kuz4A66CG7MxYSBJCDwMPF68rW75Hh/S+XegiyL6urV0j8maDMorf0r8MVHWnZnG
	wmkJMZCwMrKqmqaqATkN4pXcv8u+oeFZVUzkDtqx9+X3nUTAbNax2UuN6sempHg6pkxHkziFH2K0b
	Bm3534u6OeWXvVsDNII52Iw9pdKoqHnZlCQAqp+zNocgRn4eO9Jwhu56ij8BFSZKDAirEB9Uffab0
	zXg4RSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtD8-00000005NHS-2i9r;
	Tue, 09 Sep 2025 07:56:18 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO3-000000051l7-0uZw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:32 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32b5d8bea85so3574438a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401410; x=1758006210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53RW3r37vVd/uOGEJeJ40vwWJphKZpVppDFV/CpDLs4=;
        b=HDfWDUFrNilJc5GwpfNjwrpmCIsOqsmEDJvRdOvypGgeRG3uWyFgPMtWXnjt3uTSOv
         R8cN+sYmk6t2Q6MWZw3jkv41YArhhmU2ly/gbTu/Ne3QezYAy2nIdYs71jiw6fZFqhHV
         ooWC1Nry5dnZ1k+6M43kRA5KYSWKd3rhYCWbBwwDdrGfzfiF8uqgce7zjuF+YREej+ah
         /+a52a6sHdxDF3ta+D5Q9JZMoze8rZ+pMSnROzcVsN/M6+wvt0Z24qeK8f8iktnP9Prf
         TDTC8mj3ffc4WOpryfyYyaprNJsAN2aEal1TAa/dpxWjX2Yc9doIEhPsPwXmSI1cIAjd
         3WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401410; x=1758006210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53RW3r37vVd/uOGEJeJ40vwWJphKZpVppDFV/CpDLs4=;
        b=Zvl4mm6tl31Kc6aYtWXDk6f999rqtmzkfw+zRQVzQdujZZsQ+iPXdJgHSfSUfTjlSr
         uTrKc30mvDuA4750nTqHVVF5yLLtYhRN9/AxUk1q7gC/hAqnR8NKvdo6NrN4MFcPcnNF
         6jtvxCi/2ogx+xu+hFM50wmw+sWqKyBZMYsuQMivio1Vo93TtK6EiKnwulLiOn9uyzj+
         sJm2dGCEWXfq0pR99I4Zzi1umCbrulAIV47khtRZQ3B4N2wgufGdd9DvRER6VloytVot
         snYu48rPF+FxLC9T+Mry6stENNZ613iFoO4/6G8GQjHacg62uLqbZygFuHRGvW2qZMSn
         OHig==
X-Forwarded-Encrypted: i=1; AJvYcCWOw4xYnz2FHAHE2LC+/hxzWb5tyZ6nI8s2TA0mSNT/YOzoo78QRzH8+VW7YFz3entYrUvcr9T1dwnKPKOM+ub1@lists.infradead.org
X-Gm-Message-State: AOJu0YyxmuuZBNUl75KXMxRDUfABAhFbZ/t7FRH+dl6csHW47coafQ/3
	BbdIl4MDvMdMFYvHJnFsM8iTU71WZuOx/Pw1Z5bT/oB2wN6TXegbcKRZ/wfEk9oqoUM=
X-Gm-Gg: ASbGnctni7yY/zvrWFsoZ3AXLtxoaKsSWy2kGQHPSscgldlKdnszuqO3TOlBRpJ6qxQ
	EllQQkjNIv8r2uSO5p0mlKL9VgPOPYZuu09Rys0AB5OfMQVVY/zrdOMSoC0WXt4vpQyqETdEsQI
	X7qLoOBNmGcfhtiuM+oSUY5B+oggx1VhX0HqsMp0BlSH/eDTLSBIh9qAu96/onJ/8SlhgLyArZ7
	iSSog6jX+DM5rcsjYkhAQ73T7R2k2tblzcSGN0HfmBkQ46wLzjLZdmzbHPQoZHVRSkxCjAa0VuQ
	rLWbQG0W21wLnpEfsPex2AZSxj6WENgk8sAN8CtKAlLfJYN0RnaFtlU6xRHVFP7jLFts/ABVJoh
	LHBewrydA95YiggInicNytmudoQx51XDTLFs9NqfwR7852A==
X-Google-Smtp-Source: AGHT+IEp7M2YTd5oqLJWntqYzx+W66KU/8IVhi9uG5EgartrnOvK3S6t6vrkn2Q3yP3sdZUpu5Y3+A==
X-Received: by 2002:a17:90b:48c9:b0:32b:96f2:e2c9 with SMTP id 98e67ed59e1d1-32bbe104088mr17623995a91.12.1757401410327;
        Tue, 09 Sep 2025 00:03:30 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:29 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:25 -0700
Subject: [PATCH v6 6/8] RISC-V: KVM: No need of explicit writable slot
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-pmu_event_info-v6-6-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>, 
 Sean Christopherson <seanjc@google.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000331_253365_1C9C26DD 
X-CRM114-Status: GOOD (  14.08  )
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

There is not much value in checking if a memslot is writable explicitly
before a write as it may change underneath after the check. Rather, return
invalid address error when write_guest fails as it checks if the slot
is writable anyways.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 11 ++---------
 arch/riscv/kvm/vcpu_sbi_sta.c |  9 ++-------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 15d71a7b75ba..f8514086bd6b 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -409,8 +409,6 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
 	int sbiret = 0;
 	gpa_t saddr;
-	unsigned long hva;
-	bool writable;
 
 	if (!kvpmu || flags) {
 		sbiret = SBI_ERR_INVALID_PARAM;
@@ -432,19 +430,14 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 		goto out;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable) {
-		sbiret = SBI_ERR_INVALID_ADDRESS;
-		goto out;
-	}
-
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
 	if (!kvpmu->sdata)
 		return -ENOMEM;
 
+	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
 		kfree(kvpmu->sdata);
-		sbiret = SBI_ERR_FAILURE;
+		sbiret = SBI_ERR_INVALID_ADDRESS;
 		goto out;
 	}
 
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index cc6cb7c8f0e4..caaa28460ca4 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -85,8 +85,6 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 	unsigned long shmem_phys_hi = cp->a1;
 	u32 flags = cp->a2;
 	struct sbi_sta_struct zero_sta = {0};
-	unsigned long hva;
-	bool writable;
 	gpa_t shmem;
 	int ret;
 
@@ -111,13 +109,10 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 			return SBI_ERR_INVALID_ADDRESS;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable)
-		return SBI_ERR_INVALID_ADDRESS;
-
+	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
 	if (ret)
-		return SBI_ERR_FAILURE;
+		return SBI_ERR_INVALID_ADDRESS;
 
 	vcpu->arch.sta.shmem = shmem;
 	vcpu->arch.sta.last_steal = current->sched_info.run_delay;

-- 
2.43.0


