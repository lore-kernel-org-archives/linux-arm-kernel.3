Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B89CCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MakGsp/S2cNx5PFmj2E2VVtHHLv1RzGj2Qogo6hOhw=; b=fxoahjg5xyKK7htul/YwIvAzqx
	k4+QIWXZXZQK7Ro5khdZPsm+ADXeNgeuJNfVJjdWQzbS37eJwAIB1tbLeeHIYnWpwGuVQ5y9UXmjz
	nJ9bpQIoK8FL50uFYnfMICBdCpceeYwJPBKq11G59cH580Hjx/+JcG88diDbz6w3ZxtEejWZG/cRs
	mxjoZ1je9MqP6Hp3bkhR1HO/dDIzhU1s6y08NXXQUg4e7FJTG8rPKexUax7DvryxAtCA6tBYoLItw
	d/l0rYfoqXzbzENOZKEHgRN1O3N8XYO4pXctNjNzZiejWqKbDF2ExS3KlH2I9AEi9XexHn6/6uBJ1
	8RHKPVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iP-000000076ev-0fnb;
	Sat, 30 Aug 2025 00:45:09 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0I0-0000000646t-2CRB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:17 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7704f3c4708so2608232b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478476; x=1757083276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MakGsp/S2cNx5PFmj2E2VVtHHLv1RzGj2Qogo6hOhw=;
        b=F2gim3kZwCNQZfnYCYV9jCacTg71oFBovYOPkKoz1qPK7jcm7BcJVfpQ4qa1+VN5Mc
         nU5qtmM26xCdplUPZlNWwcZFsXQ3uR0A5vF+N9wNzkDQfQP7Y7u3UrKRDm6v+VZES/A6
         fbcMjRgDTpCX+nc1EulVhglTCR4okqHhhs7PGqSjogIWUdy64wDK9XmzKi0ysn0Dam2R
         XMJW+xN+yupEzVwojKNbCDcRiCgFMibbRqU73uE3ky6BW6rovvPWECVCtSHXixMp3VAC
         BehgAaNRaZVK+6Jy6opj+YJ5LQI91PFxTQ073/80PK8qvBiavNFUFm+yJfOyQRWMvB9d
         fT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478476; x=1757083276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MakGsp/S2cNx5PFmj2E2VVtHHLv1RzGj2Qogo6hOhw=;
        b=bySJP3GICkbJHsWDSP99slhZEbQKhdBcLWVGWdIUQoRgep1BqOzYRTz04eW1UCHlOb
         mQ3G4xoEoSbqSJ7bx89RoAYXwifE48wsRdXBNlUJ/MbSW2/Mf4vg3kidFmVzM2prRQRH
         eALDtZfQB0/fpD+lRkN9pxaCmDysnx+lAPSfqWtdXUQDlAlXXJor+SOsD4LrgmZUjJ/L
         iPL6QzItTxrEe0fD+TZd+SL6XoBI0vsxkfBJfCLydpIDVD2vGQA4JCzfmQXVn+PbihsG
         qsIycZgF0H5LP7T2DFxOvkHV1yBXZdFQo+gEQCn0skC3q8Mm8/rDsdgwWOefUV9fwohn
         buqg==
X-Forwarded-Encrypted: i=1; AJvYcCUDL48tkWpQfaf49uK0TqSk6dCnrXblDNE4hsCtKY8tt6TTu14l2aFIrR6RE18ruZo0ERBr4H3uo57kgajR9k1f@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo744GF2SLLcBtsONSLMbSnF78VTOwKTNHIN+ibef4dhOYl4ab
	RWYSYsNuhv+i2UVDsySyr1sVrEq9bBfZuEecCKW4scjo8JifFefydv4oQJ/L6Vw8mEAxq84UWJ1
	uy60v
X-Gm-Gg: ASbGncu0v6rA6/M4StzECZoukrVAhHNE6ATTDqAOXNyxo5DP6laN4VS8Wm23YzwmBPY
	IywqnNU17NG/A5HvqpRxMOniDkm9FL6ADGqzYDNa7ZIduhXrvOua0sLewuDIonb6E9fwB3/6FUo
	XMjX4CSfxO9K/ShwmVJ0LQfyD0GNeZrJZpRPQYpEJD8JpBXvWxV5LxkwzT6snk6eN9DfDTmMwcU
	I8aO7sZZJ/zvjZqO/T4ZATO7sWWvfPFWQ2yLII1mhQeHivgGYtCKPeJV6EOgzGArdpqUOpAIAd5
	DGOENXZNadK3KikubBJ/i0nVmVTY0vDPqQuaOztPCy6KWq6NHQXXlLD4dayU0PTrCBKsNdk5X1G
	Dt+bQ3h3t1H2SchiQKX5oRLpBLcNEdQHY1KN0jQu74WvVzg==
X-Google-Smtp-Source: AGHT+IFbDhya0VpL4dDdmpa2UiIlEb5E5l+kiCERG2V1mfvmn8kbsxwgyRACqpsdN0fY/j0vO5OnzQ==
X-Received: by 2002:a05:6a20:7d8a:b0:243:78a:82b1 with SMTP id adf61e73a8af0-24340db3ac2mr40858661637.57.1756478475772;
        Fri, 29 Aug 2025 07:41:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:08 -0700
Subject: [PATCH v5 7/9] RISC-V: KVM: Use the new gpa validate helper
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-pmu_event_info-v5-7-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074116_598541_84E63D0A 
X-CRM114-Status: GOOD (  13.13  )
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

Remove the duplicate code and use the new helper function to validate
the shared memory gpa address.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 5 +----
 arch/riscv/kvm/vcpu_sbi_sta.c | 6 ++----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 15d71a7b75ba..851caa86cde2 100644
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
@@ -432,8 +430,7 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 		goto out;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable) {
+	if (!kvm_is_gpa_in_writable_memslot(vcpu->kvm, saddr)) {
 		sbiret = SBI_ERR_INVALID_ADDRESS;
 		goto out;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index cc6cb7c8f0e4..80acbb75041a 100644
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
 
@@ -111,8 +109,8 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 			return SBI_ERR_INVALID_ADDRESS;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable)
+	/* The spec requires the shmem to be 64-byte aligned. */
+	if (!kvm_is_gpa_in_writable_memslot(vcpu->kvm, shmem))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));

-- 
2.43.0


