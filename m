Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9434C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzDB3T8h1PmSiiQR5aHwi6QPgnFacs+893qWZ0jSQcw=; b=WCH1MxNC46WNbi0QnwWE1512JR
	jkGVyS6ooPit8eWSA/bZpwIJVcC+0/dyln0WhyVQ+S9MuKa8LRrzHKHR0v/SAOvx1qk95w5oO5F/R
	ETX18Ih3FQIXuK35HNtaGHG7gjpjo2zyP5vH62yof5lujbh0BIiWGsrCVMyr5qXhepFpsV9dSnTBn
	kwrD2/8BXdHwW7BcI6g+3eHbSfo+2O5h2bh1pGcTL3tCC6S+HCQFMyN+vheeXjhguqey7Lkg8b74S
	RXtBBaM2tCj30iE9iIB+RMOdaW7xVUfQZi99KDlcaF+Vn6I4zCM9soqqw1kQi9PcwBqzXn6RwiXKp
	pcJ7ASJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3l9-00000001BNX-3y1K;
	Tue, 22 Jul 2025 03:33:43 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TX-0000000197R-3cAq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:34 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso5181251a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154131; x=1753758931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzDB3T8h1PmSiiQR5aHwi6QPgnFacs+893qWZ0jSQcw=;
        b=EkVkXzhl38H/z3/EI1BlDCByiI3GxbHRYoCk26z+iZMKfhUgkKxtxJb+dCTlFX94+W
         BvTzUIhHqrdk8OLNiCB4Kzr5zelnxFJ1GFGBqbSMkiP3yKnCdD41A8NKHbYC47JOmNTE
         0Wl6royDviIBc3AiXD6tI6hSPSX0OWVh4F7dsTJn23mwjMOOK+/sixzN45MbHYsIkZqD
         Kjq3NeacXaGCQs5a7k75GB64rZQH3pOVy6TIFCEH8tU1oBaRDv/jfWLvW6MrQA2hE18O
         NKNC8/2y+/+vdjQpDW9UR7MJp/PvpyqRgfITCXwxGeqDFslFar+vcVSBtUXKl5+bPKo7
         GBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154131; x=1753758931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzDB3T8h1PmSiiQR5aHwi6QPgnFacs+893qWZ0jSQcw=;
        b=qzA5wo1DHVS6cipUUmf2Fb7RiFC8MsP/nP3Y1OWM9WZuyPEzeys06xR6q0lxKX/9Zk
         5G07WJQ99PMTMGrAeqltcnOuLscPVV1DCg4b1WOxxeSAx9nW8SBnGxgwaluzRZH9xaIb
         JtrStoFbil58Lkq0pYowwH+sQh0uugifgIlitIpzQ7infibg/R6aoIqylsVlAhHVrvz1
         qLD/7lMtCTpo61ENal0saeeAU/jCLTHmpDKpg20iEuiGNvpx3LVDWZKpt26vRK3VqTP+
         bd8elglFmuZh9sJJ3HdrSJKinwxwnM97bDupHNplMqaJAMowDDS66MASC3CcNPwLV8BH
         kiKw==
X-Forwarded-Encrypted: i=1; AJvYcCUQjA+pHV1vZTRABa/PkvqVXPp8CoMYo2YpWKSSSlDgWqNoWXIP2s2PezEyNUWqpX3VQGRuRH3MD3Iy3pXUwkHP@lists.infradead.org
X-Gm-Message-State: AOJu0YzHzUbNMdglERPSbRsj59K5sMAepjYfNVNvf/BDMk9ANqK8hzQB
	52zI6991jqRs2tXO0DMpZ2j9r/AxoRLKLUx8ExD2r5HtAPGRF6kDSlqp6HI0eljDGyA=
X-Gm-Gg: ASbGnctbHVC6O453efUScbdiZuazL6T+1JyN8I5Kt0mNbyvBfHTDogos3w5qdIgMKmh
	U8KScPRpvwhzceYiYGToEY08s4e/y1kFPdHtRGTh8G4pzdIJkS7qiZhCxkHH7qC3CkHemLLe4X5
	/RDSx1lD8oTX/hzeuFCnReX14HKjH7DBhg27LJXh3Q73m0kSbCFaivB1pw8afbhOA7pVDguZsag
	5ogOkJbi7FjDKz1UFcPak0KVkzXt8QHbmLDxkuukTmvjDiI5SSawb8AfUCXZlris7UJnaQGRQj0
	Ne3EW0UXcoAD30aLIxf0/oClPnJS8Sbb4fidQApHN7exxwBZ1rmbxF9eydufcXMaW15YkFSmlnu
	VuQovjuv9jfA1jI/BPbl913zKYF5HDh7opCM=
X-Google-Smtp-Source: AGHT+IFIrVKrPK9UdCTELOyVWNX8T+lBXipMNBQiQT8fVWHbL9rvRg5zysIp/cvj2jz89NoBA/hgbQ==
X-Received: by 2002:a05:6a21:2d4a:b0:215:efe1:a680 with SMTP id adf61e73a8af0-2381143ed4emr32571364637.16.1753154131380;
        Mon, 21 Jul 2025 20:15:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:22 -0700
Subject: [PATCH v4 6/9] KVM: Add a helper function to validate vcpu gpa
 range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-pmu_event_info-v4-6-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201532_573976_B917DE07 
X-CRM114-Status: GOOD (  14.26  )
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

The arch specific code may need to validate a gpa range if it is a shared
memory between the host and the guest. Currently, there are few places
where it is used in RISC-V implementation. Given the nature of the function
it may be used for other architectures. Hence, a common helper function
is added.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..9532da14b451 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1387,6 +1387,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 222f0e894a0c..11bb5c24ed0d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3361,6 +3361,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
 
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access)
+{
+	unsigned long hva;
+	int offset = offset_in_page(gpa);
+	gfn_t gfn = gpa >> PAGE_SHIFT;
+	int seg;
+	bool writable = false;
+
+	while ((seg = next_segment(len, offset)) != 0) {
+		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, gfn, &writable);
+		if (kvm_is_error_hva(hva) || (writable ^ write_access))
+			return -EPERM;
+		offset = 0;
+		len -= seg;
+		++gfn;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_vcpu_validate_gpa_range);
+
 static int __kvm_gfn_to_hva_cache_init(struct kvm_memslots *slots,
 				       struct gfn_to_hva_cache *ghc,
 				       gpa_t gpa, unsigned long len)

-- 
2.43.0


