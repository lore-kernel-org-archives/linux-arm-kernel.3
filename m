Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C93C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvcM8pFAUo8mVZOX2xDK8xE/vCf4z0GzB3iMLovGRHA=; b=Ubf0RGJNKArpZag8LYmYLNWhcE
	oh77YxqKCkOKF+D941+4Btck4EAbilxnvEHxrQmW+d6NrtvWHkJfLSIbBiNmGDMNH5ebbu/FA9zh2
	tMhHCBiceXlJSh6Grp57qAylRPew8PVV+o2c76IYnjo14o0fo+xF3MpEPQKXT1BKEE73ANC/ObuQ3
	m8lSpbf+BEfuvM79P25a0C0gc9O6xP1+im139f1DwVHdj35+UsndWW7W7KYCqe1dedPxKx8iJhj7c
	6ACQ7WPCYe9fadZYwMrj8Tv8jDY8KgMjMJ6Ymd3O5LPhcgdQUEOd4n52oSPbX6EWbHR8i/Potgbzp
	Gtj8Lw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8My-0000000CoC5-0LKx;
	Wed, 15 Jan 2025 18:44:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AT-0000000ClI9-0ZZ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:07 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21649a7bcdcso123382495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 10:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965864; x=1737570664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvcM8pFAUo8mVZOX2xDK8xE/vCf4z0GzB3iMLovGRHA=;
        b=M9W09/dKxI6LTQas8wJ64Ut2YHTk7Lf4hfud8ORhJV/3znMghwTMSKmCS2zEzfJlWY
         uYc9J5fBYTtkXeE8Ht/d696k4Rrp9lazC+H3qleknHJjvSygPy3/oM0v6xIjSA5ZzDAi
         tQPXG+A/z+cvU2Yg8t0fnfxK42cWb6ildgeMId4+mCmxTl5am+PiFEcK3IdJ5n1eQLRN
         YwIJaVZHP458ilWG73D9xDbDaeqmxnDcfGCSmvSVpLQJkcJhNr8KXQljy4TfbSmA03Co
         tbQThIfcHafI1rhsqskmJv1fiZqEdkxGWBQsEJ8SmOAemqXju7vKoT+800gP+qRfizHU
         cu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965864; x=1737570664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvcM8pFAUo8mVZOX2xDK8xE/vCf4z0GzB3iMLovGRHA=;
        b=qzt3flNOiPOXJ0nL/73j88+Ed2U54ZVSQq20n0qRkdRiZJMKkaKK0MfnXvFjV3Pp/9
         hyvk3n11d0WLy+ECnshK9iUWsULAQBu+goBeQ6QslRa0wOnshIfcjs5QfnRvChewFPMv
         DrEWdcomhgKcIZmFw5jFLVf4GXIGkmlZhogGrKzmQVzPw4s0pY1Rj6MP7YBcu2oBQVv9
         GS/6Zb5pSD6NUnYw6cEN4LvVWc3+Y+5IBlPUXRda3wIzgwpxFrQpJq+4GsXGbjqW5n1w
         EDmFz7yUm+WjdI/SKA/kwY/8SnKFXBm0NLgGOsZAFWovRcJQ0lbSSuopGYy4ZQnXeS+U
         TFSA==
X-Forwarded-Encrypted: i=1; AJvYcCX2GJv/aMZOO48gKK07kt1w57LfAuyxWnZVtV+R+OKhQqBgLOWsjpTCS0d0EpINVpdgPKb1KZrGyQQ1kLr9YoGH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7B7VjmKiCucg3bU1jizeT9B6ddk9SguNsoCKdlDjnTi5DZGqv
	7I66deYCVnAGaw94u3nU35XE6IcGvrCZJfCFbCM4Frhp5H5NL/FJbA/qlDpz/cpOKLz+HcfI6nX
	P
X-Gm-Gg: ASbGncsnd+ni4L1HORswZyM9kOty/hZ8OlCdWK0XSmuys9KO6FOPp63KxHAL0gBg5OV
	TYaZttE82UaNzVMzEfK3y3JtzwWlsaJGheXKKFuQMWNS2W+tSdghtqJRoWP/Q0wEGODUMIHTdoA
	Ojqsnn1cnNh9CZ1ejkmpqunbx/JKmkMp4IMmDd5j3vX36+jwTGSTiieXnt40JeWzsYb5jTTADou
	Wt9F2jOKTBYctpsIFGgbkIil7XIOdqfpjSK/X1MULr3YDSUzbvzNv6ylzDljKpCgKM14g==
X-Google-Smtp-Source: AGHT+IGGezhqE5JLeDYHWhClhyZY1cGsFLOXrLsdEJgU2ElrVE/deMFlurFTVr/XKSOcI7Wz9ZYvgg==
X-Received: by 2002:a17:902:e5ce:b0:216:386e:dd8 with SMTP id d9443c01a7336-21a83f54a51mr373139315ad.17.1736965864561;
        Wed, 15 Jan 2025 10:31:04 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:31:04 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:48 -0800
Subject: [PATCH v2 8/9] RISC-V: KVM: Implement get event info function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-pmu_event_info-v2-8-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103105_206607_96FCAD81 
X-CRM114-Status: GOOD (  16.65  )
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

The new get_event_info funciton allows the guest to query the presence
of multiple events with single SBI call. Currently, the perf driver
in linux guest invokes it for all the standard SBI PMU events. Support
the SBI function implementation in KVM as well.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/kvm/vcpu_pmu.c             | 66 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
 3 files changed, 72 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 1d85b6617508..9a930afc8f57 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -98,6 +98,9 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
 				      unsigned long saddr_high, unsigned long flags,
 				      struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index ca23427edfaa..23dedf4c9313 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -453,6 +453,72 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	return 0;
 }
 
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
+{
+	struct riscv_pmu_event_info *einfo;
+	int shmem_size = num_events * sizeof(*einfo);
+	gpa_t shmem;
+	u32 eidx, etype;
+	u64 econfig;
+	int ret;
+
+	if (flags != 0 || (saddr_low & (SZ_16 - 1))) {
+		ret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	shmem = saddr_low;
+	if (saddr_high != 0) {
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			shmem |= ((gpa_t)saddr_high << 32);
+		} else {
+			ret = SBI_ERR_INVALID_ADDRESS;
+			goto out;
+		}
+	}
+
+	if (kvm_vcpu_validate_gpa_range(vcpu, shmem, shmem_size, true)) {
+		ret = SBI_ERR_INVALID_ADDRESS;
+		goto out;
+	}
+
+	einfo = kzalloc(shmem_size, GFP_KERNEL);
+	if (!einfo)
+		return -ENOMEM;
+
+	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+	for (int i = 0; i < num_events; i++) {
+		eidx = einfo[i].event_idx;
+		etype = kvm_pmu_get_perf_event_type(eidx);
+		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
+		ret = riscv_pmu_get_event_info(etype, econfig, NULL);
+		if (ret > 0)
+			einfo[i].output = 1;
+		else
+			einfo[i].output = 0;
+	}
+
+	kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+free_mem:
+	kfree(einfo);
+out:
+	retdata->err_val = ret;
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
 				struct kvm_vcpu_sbi_return *retdata)
 {
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index e4be34e03e83..a020d979d179 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -73,6 +73,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
 		ret = kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a0, cp->a1, cp->a2, retdata);
 		break;
+	case SBI_EXT_PMU_EVENT_GET_INFO:
+		ret = kvm_riscv_vcpu_pmu_event_info(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, retdata);
+		break;
 	default:
 		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}

-- 
2.34.1


