Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98D0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhkogpIzLqmuw+J4yXbDtFu/+vtMV2ME5+zsyZigSm8=; b=KTnbJJLsSN83XUy08JTaJ0RQnT
	BspZPhXylyA6J1CtYwJyHDii50b+LpZoNw9JfKPKsQVHq2RaGpj84C0eqJYvwdnuBTPIwLSar9uKs
	OhOXPX8vrjSJ8tNaJAffSc7m6TwrCxqBUji5PslHTYRghjUWgc9TS2KWkjcEybhxbXYu1qMrYTxfw
	QeqPJLDtPNatRddyEGiS6fZkZl5U5dZkZDdplNWDFlgIiroVY0dAlvG+53GFjo7Xfnlaf8pXNs2QH
	8pN3pzojlpnHWjDIg0/rX/c/HCrHLbIDOAAerDSRTJAoCKlgfj1Iv5882OPjBhrJcAaRCu/E92bSG
	D1VwHBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3qI-00000001Bpy-0GXV;
	Tue, 22 Jul 2025 03:39:02 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TZ-0000000198b-1IQo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:36 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-748d982e92cso3359279b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154132; x=1753758932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhkogpIzLqmuw+J4yXbDtFu/+vtMV2ME5+zsyZigSm8=;
        b=yo3LNfvCTV89qAjQQOJd9LvhdruZvQgMlRztjseaXtavbsCrmHl7iwqYspvGm8ya1q
         mUS6sdQFlZuPKvZe9QsN5W4ADty2Om0JWQGK61eL6WY61cHbtnfyCY8eOg/v2NzMytM2
         m0rv1FE83EKrfgmijByrkmHr4eThZTZHW62glSTnkGqSxKRtHLA7v8E/UrAgx+MuWfWN
         NnGQab8G0euwCsdzFPP9WOS81tL2E87W614eXwej4DNlP/0Am8mjrKh21URdPTOvrYy1
         afZRMFjn84kpsQTZn3Q7oCqUJ4NxiFzuPzyGON277X6n3MBST7GVVGcJ6vvST/TdLRCP
         yinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154132; x=1753758932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhkogpIzLqmuw+J4yXbDtFu/+vtMV2ME5+zsyZigSm8=;
        b=Vxn5jXPCUGTjfriI1HWbgrcRzJT5vu+R04KeTpUgfZdoAhWYX8SJ1pDo5VuuaCsnNI
         8HPMAtqopq7cTDW6rOlfAtOh8QMo/JuxvyaBcEqtaZQRJEvRAM3jjHnk7RD2dBOvJZOf
         O7E4FVkbdYWsITMRBzWV8NQyx1YS0unsepGDaZQsC9nQswaQdN9zKdFJyH8sQl3iIII6
         z2gD1QPd6iJp35qcuvjTPB5pIK4yWhy/1Rtgg+OhhOZ2fmPKFVfzth6xSta0GVwXZMN0
         k7k8pl2XXfx6jlohDnsWViMg7o29BUMVeigYEl7rEBZTR1gOA+dLM1jZqsCLwaGYsnji
         fc2w==
X-Forwarded-Encrypted: i=1; AJvYcCX7zlDd1h5zPxGIjh87bc1bGpHWdmCwHLdrI77N+7e6B6JJrrv14WMyPLIwrVN4HiAEIXVrR8O//8QuYBUrEKD4@lists.infradead.org
X-Gm-Message-State: AOJu0YyrZQXV3pYolJvyP/gRkC1pmvKBvSDrf3evtbRSNeefqnNxpCY+
	UqPDUaOPnkYCRdBaDyTr9RLi8kD9KoDw66miFl0xA8fgxqyYtgiAbrCakpzfXlRMpJE=
X-Gm-Gg: ASbGncvexuVM0k17EIwXX0QT7+CnNF086LbBM7zc1tUM8YOLwpcNHLEDLeiNuBWm7Y7
	+AUEh0TMJ4rS19eN6LKL8ycMDVHje80Fu+1chVow6UXVK7QOTUTRIPVmRHMGxowZzSn4aIhP1KZ
	CgRwJbB2PdQ7kgVfVM5qh6qzqhFziLbdqutXifSyYiUuY015D+vmDsZVoidnup8ADl+38j06hGX
	xJLSzQRLfSFl98pOSmcKEsiTaNLH3Pgdm5WDNtzmzJOdbK4jwRRYMCN973g2zL+gueMQRfrFD2q
	HIwfHHlAvd12EnORP+AWCojDNX+BC6Er1T4kq+wD2MxlHKHYjuFYFomTo2UJduK2DpawO9VbNoh
	vZt9T/jT/BH3yNNK6h0MNHtky4ibs9Wqjx1XbEDdFM9DKlQ==
X-Google-Smtp-Source: AGHT+IFymBDNRC6n0aOx6RiDMH5WWpmPfPiOTR2NPfmMJh6ymjUAaxXLpsltj/PI9MkAWHdOyBXsLA==
X-Received: by 2002:a05:6a20:7d8b:b0:220:5c12:efa3 with SMTP id adf61e73a8af0-237d89607dcmr37332092637.38.1753154132341;
        Mon, 21 Jul 2025 20:15:32 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:32 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:23 -0700
Subject: [PATCH v4 7/9] RISC-V: KVM: Use the new gpa range validate helper
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-pmu_event_info-v4-7-ac76758a4269@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250721_201534_607774_42BE2A1F 
X-CRM114-Status: GOOD (  13.30  )
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
index 15d71a7b75ba..163bd4403fd0 100644
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
+	if (kvm_vcpu_validate_gpa_range(vcpu, saddr, PAGE_SIZE, true)) {
 		sbiret = SBI_ERR_INVALID_ADDRESS;
 		goto out;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 5f35427114c1..67dfb613df6a 100644
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
+	if (kvm_vcpu_validate_gpa_range(vcpu, shmem, 64, true))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));

-- 
2.43.0


