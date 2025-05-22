Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6684C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZzBI2/8zxd6TBktJeo9hVnWnoPSXGrqMFkDVMKCuo8=; b=zugV7zJHHLiMt3FJdTjVI/QLcX
	pb1NPcqfpO7APlnubElWXwSwrIGcUeH3rBBuJEePP2cGNbvggM6iLFA+orDeKtzjA3Srw6w6tns5r
	3lQ36SCz3VXzdIeU+JgD4XK3f+146MSBkic9yX3cbJBhhBxMqWdcbHIkO/B8sX4Y6OAOu2q6g30VN
	eqyvGuWN80PwoJi1nU/Jgl52mipX6q/6dWNXNccNWy49lAfaFCtmOVJkJc/dmLL5sxCO8c4qxr2Oq
	gDJ8EnNLDKpGJHJWNjVUJpKE3848tRkKYQS75Qd6JsrCqjBPvGVqvOUPsVpWyBNTY5wPGeXOm1ADG
	VVJ4iD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBQu-000000020Ec-1sXp;
	Thu, 22 May 2025 19:18:24 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCp-00000001wRQ-2vQ5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:03:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2322bace4ceso47538825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940631; x=1748545431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZzBI2/8zxd6TBktJeo9hVnWnoPSXGrqMFkDVMKCuo8=;
        b=wfiLjGnv7axN+6eoujhMPT+XM84q4ugt20Cr0pewl6dq9M+tcGSzMaiCL6u6+Xi3M3
         mvMWZlcRJnvA+XXSkg5wnvZhK6HzT27XzOSeDHrMbmDmf9qbkCKdawXTxCVc1mUM7Xk4
         4uSXPzWjMYO1vXqyTfjBGlo4e6QovcmnTyp8nCDTGj5TuHeEAqmuy0+HCtNg4R3tfo+Z
         ldbU65oh9vfTFa4GRGMUvMGMThYV0btNRH28bUrbI8lBon2qef9wSUy6a928LUJtokJo
         q7AvvC0/OKjyx7x5mTkNhwVCjxpwHxNFMJbeVoQe3W6T99V+T49X5vfcphfA7pWLKl8m
         hr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940631; x=1748545431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZzBI2/8zxd6TBktJeo9hVnWnoPSXGrqMFkDVMKCuo8=;
        b=FthfIG1ePq6AKRrnrFJhrt4xtfJSRVo5fWMyzA74S0VtiKi6NPLFzuyPzND0s6b0c2
         /6sS01VMY85o+sQkK8UU9becONZrmVIKJwCcGNQh5gbJDnXsh6ZbwFqQWooEpVKW/Djn
         43FGlc7+U+tdzvwJ0wiTDffid6mx1SJo6JBYBOXuvX99XX+XdphwDr/M2HNOYsgbJaEx
         7Qdswfhuv7EyEf9efU+TmbcPSPmrHyXNjeN45cXkkhMY9JM7FsRWodK5lkvpigX581ZD
         znFVUg+7uDx43+ErwqZRBCyc3Eawh+8tG9GZ2McO9hA1y49Nvy2cPRlphMzm7TFuzFEc
         I7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUL20L3MY2IjKYGLRq5jnwNzc3Fzo+7eKmxCcMlMV0toHpeWXmL8CJDozOQrF7o/v9Kg15Ru5Wjs3pfT2AIFByG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg83T1AMXBT4Sj1f4V9UTGH9xS1p8KH+mDlhumEyzQKRFFIssl
	RGYdQNas7awF8s1dOaegYeVXYBQE7WfrjHGJqVJeZy+HlpfPQQX8BCil0kr+ERHvZ4s=
X-Gm-Gg: ASbGncuJxmuCuPECrFLyJTpRsbD0IZAWYAJmEmKCqssq5MQIuvjsXQh6S+vs2ZgIXoS
	75ZW8E6mvi6+r/31RdoTdytFvNQExdawcVG5xKjIc0EE1jCGc0EPZA58tDBvVAZQgIuzCktA1ad
	+/YomnJy+B3aqi0kXlR7ewg3H6eaJz2uc6Mp6jZ/kidKBWXAT9HCctcgOBm1bw7BmP09hXo0zhx
	6AiCKTTub3up9DqDIFZ1HGpJFrjnjyl0/qHsQq3+Fuej7siZSXVj3r16w9yZeG53tOia9oXLMIo
	qoW6HAAhyq90UE7/crGqsHdSqOlpJv+1v8a1MMciPx8BvBNCivXXl8EDDvmjkbCS
X-Google-Smtp-Source: AGHT+IEr79nTwwFBEJoxFRK5RNwqD1jq2SDcjYk7D0rQW6WwVVGL0IpJIiwt2oBQtuzcW3AhD+odEw==
X-Received: by 2002:a17:903:94f:b0:22c:3609:97ed with SMTP id d9443c01a7336-231d43d9bccmr330946415ad.30.1747940631058;
        Thu, 22 May 2025 12:03:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:40 -0700
Subject: [PATCH v3 6/9] KVM: Add a helper function to validate vcpu gpa
 range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120351_811381_F11163E9 
X-CRM114-Status: GOOD (  14.05  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 291d49b9bf05..adda61cc4072 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1383,6 +1383,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e85b33a92624..3f52f5571fa6 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3301,6 +3301,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
 
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access)
+{
+	gfn_t gfn = gpa >> PAGE_SHIFT;
+	int seg;
+	int offset = offset_in_page(gpa);
+	bool writable = false;
+	unsigned long hva;
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


