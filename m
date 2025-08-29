Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501B6CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=; b=UaVz3zCqmvUhUrtF1LWkCPmIXz
	THQCPtBrbKV119dWP8MV1o0Vxc21gYofSGsCCp3Z2/p/MU8HrpQFy1ePK8pOnRpQ2Na6iVYwBxeMI
	bPT87O6kUqcGEiGJKfMLa12syGzWhRW0LECMkJRxGZKNzYeaofq72Xz/nE/eNix/hcVsVurzAopSc
	Mu9JPhJEzjhCL/Cu3AvH9oTyvnx4/1A6skXp7YKkt59e2gIW9TD60N8cxb4KHNvcUoKdwVIu7zywi
	3w9Fa2kBb+/52F8sqAlXllCnO6v9FPO6VtgqnKtYs7LyQ968FjBOXW9+7nqhkITxe46X4fKlVoMQl
	u8E9JDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iJ-000000076Vq-0m8n;
	Sat, 30 Aug 2025 00:45:03 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hv-0000000641p-3ROK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-771eecebb09so2910122b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478471; x=1757083271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=ef57SQwlCbzakcaISrlcrrCbUStVlR+4cfWLaZe2oRqWQrgjFvX1mt8GnXQ8scuCAL
         nXu0SSF6sUJdFz44m83Ac7Yx68pA8TczulqRABxxFRlOJqgHbUjQMEtL9iGYZjQoxCdJ
         u2AzGJl7+gbb4Wo1balMwZeKXXqQzoPdCfLY1efhp3MGCg/iIget84osUieYX9egrQhy
         hI8kf8krbWMJDWOusj2AeQ2YlxqiI1mOEUP+PcsU1AJDB/Mk8ZitI+EKOpYx1I5mkoDD
         VvF9Ryo818tapcTqziy0qwl0rqsAvb2kzmdBpIBNlj00cesA48Co70q0FfPG7rgvJIQJ
         kWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478471; x=1757083271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=q0mVPC3uvWXZtjmW0kxZntq2tmZ7KB6x9iYGXEtVA410TQACSQsMBzyiSPG/NfSDn9
         6jIlWEvg1vCvIhIbNnRVmfmOUV+G/RUsl3KUdwoL32Dt0QtmhPlLc4roTNnVdzffwt9J
         XhprN1XEFGHWUiR1XHPmIE3LM0G+AYQMUpBZBd0xpMrB7JJXjcNpt4YvJhDULh43ORvG
         gYJfGaa5xd3463cV+NHgE9L2UZPGjBOC9pc8X5AO/vmvK3JJnJ6Rp1YHeGNvaN+fL2jr
         tzghXojBcaVSkFYcTFHLRjpHNvG324GdstAqcfYbQEBqJLOcf5NGxLRXzsnT5qupLWMX
         8liQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnpYdI1weye8qguQagJrfsCy7syc1CfyKG+poNKBO6KE33vS+6hJGeBydeTqNPY2M7KlRR5EppQvlDgVnDQMHL@lists.infradead.org
X-Gm-Message-State: AOJu0YwB962Xd3sino7Qtk0DbcomjrwdgpkpleJy1Y25TOWLKjyquO7J
	4TDUqINbiM8aujcIRAJ5kD43Eh4ntdah0udjMKlGxwID4sQLYDwRVLbfmP6G1ovMW6o=
X-Gm-Gg: ASbGnculN3oo/agdZron2/ixdpwWOsTC9nyHxDjOP5l8HzDegESkgMeAwLZtX3gsygx
	k74GRXlKkth17gfyGZYzws/3PjP4vLwmvaBf2ZeACNMlf6EgS72ePce9EWfwSNR8o2gm2AuAebM
	oPX80ySdjgDl+J8bFfdGaCvsFMqmeXBg80msA4SNjk3fLYBdl/6A13vAu9KikeobNSfieUdzvVM
	BG3aeM+N+AHpfEiUG29PwZEKxi8b+TSUxy49MaVG5WQNT1+WiW/nXWYlRssX1MklTVhggfqH47j
	Ni7fcMJHJYW7IOKncHzl+WaBYwjrqLaH8eLd4dK3Y4kExJSkr9T9zKRsK9quMct3De8taFkKONC
	y/PuCbHsNQS7hOoxf9zNhR+wocjlQzD/SGOI/EBuQfJTlgF5wZz2Fqooz
X-Google-Smtp-Source: AGHT+IEjIYlQyj5LF8L5OMDqDMzS8FXoLsXKsGZxQnXqTFQeAwVRK9v09HJ44UP8l3p9Cu40jXYhVg==
X-Received: by 2002:a05:6a00:4f92:b0:772:38a9:4d98 with SMTP id d2e1a72fcca58-77238a950ebmr927358b3a.13.1756478471237;
        Fri, 29 Aug 2025 07:41:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:04 -0700
Subject: [PATCH v5 3/9] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-pmu_event_info-v5-3-9dca26139a33@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250829_074111_874581_E552B9D3 
X-CRM114-Status: GOOD (  11.21  )
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

SBI v3.0 introduced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 78ac3216a54d..15d71a7b75ba 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.43.0


