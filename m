Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430EAC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNWjjR5K8ESMPCBOjPDxpC1mFayqfXlLuYgjg0J+sww=; b=xqKq5KDSeXj154BIc268QH2NvB
	QIG0tbnfrc0bHXDZQctUgQ3KL7/mha+Npc2zNIG3Mzno/ALgZq2k3cMq+TamBlv/QtAkaxnqgBrvZ
	DY51DtJlbAaNS6g8bOlbtJAIIhxMItZ0it1c+Ra4z9PgqWEu9RhCa0koQXr0WBJmIQvMxuVOroghy
	cRsI/ezc7z/Zfuoo3bPbHOXd9iEf2sidqMGWGsLFn5rYdYJUqnk94ZUSlLx0h2FqY/jr09WLuUdmr
	k9BUimjTTqU4E2TKt62x6YvsamYhisc1pISHYdw8VGAW0Us5EBuCXnZrc6N7HNhbMPHkIbPrSf30p
	kpxX+diw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3nd-00000001Bck-3HhS;
	Tue, 22 Jul 2025 03:36:17 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TZ-0000000199d-48dF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:35 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so4810776a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154133; x=1753758933; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNWjjR5K8ESMPCBOjPDxpC1mFayqfXlLuYgjg0J+sww=;
        b=T2pXlKYpa6Y5pYf2e78ri6Cls9zExn02C9Dtb/8GX8/Ccg0izl/uZKwNzvUMQVH9y5
         RENDdWAaqbB5Ug+JG7UC35UGdagmkSS1lfbW2anbQO3QVjOFRqQGmqsNfJsuPYYkzzp4
         PU4sgz+NM6+y2IDPIb0GwATstU/T/GNF3/t3AzCcd+WtkaTfhpKR8ZixaWN0WdPjktFF
         G96N32TFG/YDf1PgugYqX3o5pKrKeNyKgBzjgB275bKJAaWPw28u3t5UnlGZDA3j+vAT
         8fKNK2BmkQl296J1FHkRoK2DhC61vHCdfpGnIMPREWT7wNchwJ7ys4hSp4MVvQ8CpVFB
         yGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154133; x=1753758933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNWjjR5K8ESMPCBOjPDxpC1mFayqfXlLuYgjg0J+sww=;
        b=evDFxOTlAOnP7e8T/rX39x8G9eqWbSm09NUoGMmlfRCb1vzjXXUnr/nT5TpKIvmKAl
         +ZRUf/2nP8W2QlJAAK3gL3l0eRqyiQfezLYjfYPc8qYT4Bx0J4TjD+yOhSffNh5vZALw
         FLSUQjmb2mEr5NXcsuuJ00kN2WTHI5Y73BVJzhxVD/UURCtkvdSLwzLnoGBnqIXKDTob
         FVgBKPjc4zMZCmINXB+yN6f9wwCYyod6TMS3YZGOgRBIpsV5CGJsGfQx9v4DFKdhrdMa
         1u0r9lx8wG6s2HFHqAnlrtF35Fbhhq1epxnWHxiGTHiTVPcRzWVl6qZH/tpdvFIEHus7
         ijOw==
X-Forwarded-Encrypted: i=1; AJvYcCUSZ2s92HCXRG0H/njBd7AsMRM9YRXuoFUsRSfiVBfWAjEYBubjU/PaugV5rhuS/wpJpj9ixvngaMZUV4GYw6c5@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ+Qk2rnPvE8MEu6dfk4y5IEDhrb2vSHegE/jiYYALnh0jqrTq
	RxWN7cyYbVnoYy2MA4UaE0CWacVPwAFMS/ZB1geJnkDl7edM3SP+msd2NP59PPlypFA=
X-Gm-Gg: ASbGncukKEd4S4UArYDq8B2n/+ecXxMb7GBq+tGBWXCcOZw0d07wB4Gs8//sDN3iTZp
	rZtO0XHAZjqlP1zGBByvm+cQBRf3xZVBJMernncsuRrsIJx4uOWwymOAb8cViEXB4XwUf9/xd44
	m40duWFLLwESltoODaEO80zmnu0juWFNsiMdAP7cEmbBRJeGYYEk+Rxft9JoSIFWrgIa1FT0rTT
	eH1SjLV0im5ZxC3CdGfwxJ3eO/PjA4xa6OITuEsd455MctdNxG/fsqgv+1OMilBQvvL8mnbHzYn
	6XXE9RnrszR7uFxC9XOsVz2FAXT7eI7IV/n4z9HBDDStR06u8NZmS8hhulnKNH3SqTYbhlw4Jik
	ZFQ5wdUT+PR7ZDAJJ5o92geB4yGBFCMPdTUE=
X-Google-Smtp-Source: AGHT+IFlRcqyUqzUESij9IbKtqtTK+LGpo7DYk//VPdyGweTn0oqQsSsmoM0vc3xGcaHFEJntaSgwQ==
X-Received: by 2002:a17:90b:2650:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-31c9f3fc33bmr32891641a91.12.1753154133418;
        Mon, 21 Jul 2025 20:15:33 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:33 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:24 -0700
Subject: [PATCH v4 8/9] RISC-V: KVM: Implement get event info function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-pmu_event_info-v4-8-ac76758a4269@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250721_201534_615105_D906D9A7 
X-CRM114-Status: GOOD (  16.69  )
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
index 163bd4403fd0..70a6bdfc42f5 100644
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
2.43.0


