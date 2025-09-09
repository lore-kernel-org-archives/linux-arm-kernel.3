Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB13FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=; b=YrjWblHA/Vot2lh+50LbX7Z56p
	pPn+d5K3XUql3tdl84B/XqU08JzgP0cKDuoFqRh3Z4fNxypNuWy4lzS37+RvpOT06z9WoOJjJ+uB3
	T1tNKAm3iq4EF4JvCIXWh7DCJHl3/fuCegux46/CDB3GZHC2cWn19cbFNKqDEv4/C1rLSTTX6RQeb
	nEJ7nqEsHEsjQ1uXLgH0ztFwgg4LbvwlFSUGhfz/zee3r6Cwkwsilb4nfbW73J/3idH8/oDpcK8Qu
	byv7v6Jmfg++cxHSC31kLcj+9VUvmhSLuWKU5vla3JNVsTzug0K0kTWolhVzucXb7powCEQi5xVzp
	3eWrWTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtIj-00000005PM1-2UAs;
	Tue, 09 Sep 2025 08:02:05 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO4-000000051na-3bFd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:34 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so4095589b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401412; x=1758006212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=UaEMobHbu+gyrkiuzNdfZ0bbE81u2A/ynnl4hidTcRVlpuQ8nC2TC/SD5BuZS7nHpH
         pZ2wcDxy92TPT00HU9IsKV1or66rGLdGmYti7Wur7GCNh845G4QZ18JwpPW0SB8XhqbI
         VkT3e5+3mbJfuz5LlUCNHhl2namYlQzxo9DIiCxuS+cgQa9QfGzc1Pgu3JMmhquderip
         0BV75LPhjK05ZOMvDfZsbm5GS4uCj/OJ/yHLBHJTVp4MJNb01kL86SKSqfAbPErHPSyE
         M/urqPq7pfc4cs0wrXCZdpbxcAcFkl4wh/scJzUG1fTZWDK7gYqpfodZ9BU7HKf5LZdG
         hf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401412; x=1758006212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=HRxyzdnR83t4a7teJJTCvJn9YUCFpEDBgc/ZDPkeGNjMFsyJTkfJDReCtchDmjgtMK
         jbxP7ae9oKA86EMUWciRYnoFtskwjKZpVqnK+3oHSH9YX/NB2lgzgoVzTLDZBpiEbBse
         IPSosmpcyQzWieaxy8KUQL5Rn4bFtDhdZREowrxSjlt7d1p20Pc7LAz0HcjJB7A30HD9
         EcQkmTBGqIY7CNGxXr914ghb/XFgLQMn/vd9icIx/0MZVcfyoOlzNBLAe/hb6c29hEhM
         u7YxMkN6XYyxEj+Q3pgGiulGNVw5BgdalDetkerb0cXFeZ0qgjOBxodG6xneMboUxjZk
         oyBg==
X-Forwarded-Encrypted: i=1; AJvYcCW95wPZ+fDLFa8WbT2OX4/qOjNT7NhW4iBPyk+wU6jWp3Bi/KEUuRy1mSWUuUVx0BZuBmru3y7b8VRFBb9kYmBk@lists.infradead.org
X-Gm-Message-State: AOJu0YwsFgPVR3EevmBKbcP8PwOOHsF3rcDOIk/wH4ay4S9mwtKJYc6Z
	+9Mj3VEjvlxEyy9hmLXJMTDZL/Qn/RAsTQLypNDXdJ5Uxg3zwdQJUrTTvQ8L5o3LbCY=
X-Gm-Gg: ASbGnctBcRu85JDEd6K6RygjsTlPHCX9UJOOPsio10oNS3E/d54jEPuqQiyDkpQevz9
	ayYjUZtfUfVtBIzvzEuzt0Cv0OiFfE3Bfl4DDyyFCkjXwf4z0yR+GAFaDFYu50mInufY//AV1wu
	KV1jvjhqh6RCcRU9pQ4nWCIYNiNDv0n7DH81VzdRw1JwVG02q2NYPZpxIt3XGSv/5ZQSZypp2D0
	pt+bJA/ArmHh4B3iDFY9sv/7vq1Q0MJYEA62NjjBKZlR5X4+4h4qfRLsby4aNr3CuKMXXhTxl74
	l/HdxpIQgiJ9Ni3sVvBDeyt9/pgtxz2ZJI72Ct95UXCBafzlX4tphwUnvwIvWNEZkvWQC23g/2x
	D8ekz/p4h15DVIOqxq+vuNBbMR+WcdujWvZxY568jRxfeoPQFDj1ioYHs
X-Google-Smtp-Source: AGHT+IFeScYoURP1S0tDI9KKWt2+546E0P9kyjl9XLHBCBfgEh4mWYviwRJae66lvgYjFmHDEYj1kQ==
X-Received: by 2002:a05:6a00:140f:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7742de60630mr11833770b3a.19.1757401412287;
        Tue, 09 Sep 2025 00:03:32 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:27 -0700
Subject: [PATCH v6 8/8] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-pmu_event_info-v6-8-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250909_000332_892958_5A81585E 
X-CRM114-Status: GOOD (  11.62  )
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

Upgrade the SBI version to v3.0 so that corresponding features
can be enabled in the guest.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index d678fd7e5973..f9c350ab84d9 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.43.0


