Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96128CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8n6toQkVFfP8na+ISaaEJDAIrFZoZwC9O7ud2sWM9B0=; b=v61oxUzMJji7oX6VvStJR3jLww
	8bmtpk5IOnQksRiHkdR85BZgZoUkjKMFUemUBAYvNB4cxdkkLnJsIzqpdNDJdvY/k1kSZOBw+GVqY
	53OvoaqD91FK8hNpcaWrlyRVzltfYZWgJP7EcnJSzhA4OZJUJMbqPJx9MB+Cq9xSdUWM0vI30duoC
	3yJUVgG7K61yDYQV7EFuP40XEsTcjacpPdY9PJAe1jBwBAqtYx0lH+2CuCkeIQqNG8q0jKdnMaNSG
	Hfo6nwu7ZsWjyGMoBAPO/36EoY2rSZhQ+c4CEF0c440O+3mQb1xRKqkguKSDf4wHK6DToTB8Gn720
	owXnz+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iT-000000076lj-09xR;
	Sat, 30 Aug 2025 00:45:13 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0I3-0000000649h-2SW9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:21 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-77238a3101fso130030b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478479; x=1757083279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8n6toQkVFfP8na+ISaaEJDAIrFZoZwC9O7ud2sWM9B0=;
        b=RFJWm7CsDwCstkehXdLsKXGDaxzhHcjZXXSCj/ndpTEKzNcieTE/X0ndFmtDY7Dxc6
         BUhGcpA7o0CuU5VQ3Ewr4y8w7qUeViFql+ItZ7QqbS9JWYLjziBvTTBnOz5ZeK4sKeTw
         pnPQVxs1L2ZTvZHsFr9PKhzBF7le8BjUSc3jxClmLITPZPLsit/ZXizagAQNgJBXgRnq
         yPNgUntquUNaDPkkz6I5ebgFY3ITYrQgrMFqfJUUG5DI7qKPNOgEsQdZSSNR5o6Zvw/y
         iXpXa1YYYWz92pZL0j1heoeYF51qmSWA7Ewyp3YJIKzHiMdVPO7bSShfkEIYezLNxHUf
         jUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478479; x=1757083279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8n6toQkVFfP8na+ISaaEJDAIrFZoZwC9O7ud2sWM9B0=;
        b=mIiY4usGLQMMIj9WZ6sDRkqiLctUEaYSirPpEdb/b7ZbPxdivPNf2nccFY7UXOeb83
         ksbdXZWiNOquM7HWs+k22wt7X30DKAUAJJ7Zk++yJ+YoADMl5UWWaUTBDgncSgkudLgy
         UX/a32eWS0jBBX1b/R2seOMY4SZ3WD1F/U7A8rQbJAfR/eqzDdc67sZkyGiIgh9yFV1Y
         /5w1kFI30Ka1O843i8i5BWQ+rBSgTReFkNq1PV61hEOvakHqHTzRtEu2nw9TCIbRw1yE
         zhOIlt9eUcIoeLxmwf0+vRlgJWIqA0RGhk2DcGz0vOM1cE8907y5d8yEdCbzCSUpOK+j
         Y12A==
X-Forwarded-Encrypted: i=1; AJvYcCXK+ZfKdW9LbOn3jiJXouwzD+oJTNjhwaAwMFzJGyAi2cPWFQ45TH2qngGVSXUvkEe9jD2FSAQ2rpwIu/V4v4PL@lists.infradead.org
X-Gm-Message-State: AOJu0YyR9ZL8S6bvv2/slO6+s+OYcvZ2QehCx4baW3LGuw0HreF+aAA5
	IkZ3tOSeGJuc7izUywdU4guKf5kOEl2gZzUBRWxfORGe18Pu5GSziUcjFxLJ3alUDck=
X-Gm-Gg: ASbGncsgB2fzQuulkQVDMDYgy6jo5wZxqfT2wmC8HWhnvMIeNuH7ClvLOxYBzdzTXVe
	EdsCG34NdiZjyIjjMfVFM9fJ9B9ePoxT7DPvf5Y11cBwgCXulyxCjOVS2Txp23FMQ6r/2smGQqi
	Jw0XaNpsy/oVhpNqdhEnuMFu8ov8j+t2Oz2kYsHCAj+n1btRLlX8AiO5bVPhZ7lKzu/zscyYVUA
	13GNYR5LlTCyKmVGeRpv13me4qkJnqW9gXq+oxNyH6mxM7MbaErbFUoDaqVy8TtDMUFNmDqyl/C
	7pD8o+25RkeE3RLV8eE5UT7kH/hXBISL/lUT2+y7UXwF8qbwuJ0+LVMJaazWDzArZKy1SZJQ0To
	K6xNpgB5nN3WBtxuHFYlDo83JZTc3NXrRq+o=
X-Google-Smtp-Source: AGHT+IFbwzsbSElYu8KYbXCV/+je/6mE2S0/2liCEwQBNCHEuRYMQctOBLGbIAGZhqVBmpmbFujhhA==
X-Received: by 2002:a05:6a00:929f:b0:772:306d:a1ed with SMTP id d2e1a72fcca58-772306dac16mr3197588b3a.32.1756478478747;
        Fri, 29 Aug 2025 07:41:18 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:16 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:09 -0700
Subject: [PATCH v5 8/9] RISC-V: KVM: Implement get event info function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-pmu_event_info-v5-8-9dca26139a33@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250829_074119_623360_78C7B12F 
X-CRM114-Status: GOOD (  16.46  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/kvm/vcpu_pmu.c             | 68 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
 3 files changed, 74 insertions(+)

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
index 851caa86cde2..bd93b0f2ed26 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -453,6 +453,74 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	return 0;
 }
 
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
+{
+	struct riscv_pmu_event_info *einfo = NULL;
+	int shmem_size = num_events * sizeof(*einfo);
+	gpa_t shmem, gpa, end_shmem;
+	u32 eidx, etype;
+	u64 econfig;
+	int ret;
+
+	if (flags != 0 || (saddr_low & (SZ_16 - 1) || num_events == 0)) {
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
+	end_shmem = (shmem + shmem_size + PAGE_SIZE - 1) & PAGE_MASK;
+
+	for (gpa = shmem; gpa < end_shmem; gpa += PAGE_SIZE) {
+		if (!kvm_is_gpa_in_writable_memslot(vcpu->kvm, gpa)) {
+			ret = SBI_ERR_INVALID_ADDRESS;
+			goto out;
+		}
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
+		einfo[i].output = (ret > 0) ? 1 : 0;
+	}
+
+	ret = kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+	ret = 0;
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
2.43.0


