Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F93D6C299
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=; b=wRHtgBqVQGn1+mLjuyaQi3BSWy
	Yjr6zHTQu6qA+fdviQb5WZDyNqbjG4dg3bkiS0W1bQVNHn7m4w/4J0ZxMvEYphgbJmNdKcG0ZpX9n
	UKJ8yDUjT8XOr8iH6FsMMhQglf2DRGnC1n8XCXtvPbFnGGD2YIe37hK8YlbhA09LjYmZYTKns6rr7
	kOv2VoP7GBk6dgAx1zFnREYV1fpRJJyvydcf3XqwURZdHbKq0honjLDmfLECXdrCgRRvfyI0CycjP
	5GBqrhNO5thENZ5CdC5bAZhEBqHqmf9hF2QgF0VjL5YpgN9HEKe/Ap2idqgkKO7H/HEftFQ4CjHXB
	5/KrhLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUwm-0000000Diik-1e2T;
	Tue, 19 Nov 2024 20:35:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUsA-0000000Dh11-2b89
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2124ccf03edso12427455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 12:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048253; x=1732653053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=jVztKBZYIiwfHJwPnQll3hpJfob00hcca4cay2IdVHosnVCLnWrbjlNv5eI5ugfUhf
         ynryhK90E6MSTcvN/12GCXPM4uJ5UMhq+ssOuK8fB+z+nhkRgSLgfqWq+l/2gZMNtwFV
         izqlRdy/rUl4YWaRoksk0/hql0cpQIzNvcK6XvbKJlNa0OywHmAE1mbDjbogaN4Uwk5O
         hNs0FpJ+W/DYAs1BccwQzsa5JDet1vcy4XqfLCylbX1I1SGXrsoA+8hMO+VlR+G+s3FF
         1pZ2OLGKqTriC4BfyNQFpel2JG0cpJ13sYUm7+al7vvUizDlsOHRIUYcHZfHw/7cbtkL
         tUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048253; x=1732653053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=u9HBEEoRoaEG/9bO6XmnvxSHrJHZMLxQ2Wbd7VJavnb45gh9Jze+Hm4FBF1C3cOjBN
         VqFiZkIEpEFkimopJZqwJE3Zq6Jp9Ius1TvNhLT75bIuhgvzqrR9wwF9fpUqSmGNUYAB
         hwTy7t1FCmJsdwe2nRZ39stoyeuQcO0Y/4gYW4vbNMOZMfFinarwcDtqfJkF97naYBSk
         MbfmxfTz8ulohywj5qBUKC6hOZ618c/L9pvxspd7ZQmRNwvjRcXIx72tq4By13Jjzgr6
         5kzSZeSxhs4R0FCU+lwlZ9AqSbLr14r+AqE+b2pOYe7Efk1u3Kk3U+zqTA0sKEAZ33CZ
         WTRw==
X-Forwarded-Encrypted: i=1; AJvYcCU7vhq61dReMpewfn8fsEVMWPu1oa7Cy9rmsP9g2q934FWbrDWvh28+fvyPVFzTA4m3Lq6m04p85elDfPU1LhjN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5OXJ/Fg6ipRaLUrivoaAqx+t4L/i9WMYWzlBv30lRGuHfQSAK
	AqkU3cRR+O5vzeoI1AZU6cBRbQ7FRYaKj2YxRjL8D3aPc5XnCykc6dltrnhpggM=
X-Google-Smtp-Source: AGHT+IEafgQoRfTXfxDGUyFBcxI9JgtU3iA1K006RwHi5mhUuXe4EdyQsqlE+qS4Y+FQs5c25dBVLA==
X-Received: by 2002:a17:902:dac8:b0:211:e812:3948 with SMTP id d9443c01a7336-2126a259979mr4712555ad.0.1732048253488;
        Tue, 19 Nov 2024 12:30:53 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:52 -0800
Subject: [PATCH 4/8] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-pmu_event_info-v1-4-a4f9691421f8@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
In-Reply-To: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241119_123054_705629_723A17D4 
X-CRM114-Status: GOOD (  11.78  )
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

SBI v3.0 introuced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2707a51b082c..efd66835c2b8 100644
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
2.34.1


