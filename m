Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D25CCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=; b=m1PsGHi+U4GMAReZPnLMfulMSN
	9xAMV5VPVeccPT88cprTW4kEH148J4DKzqCYfilZ4YU/Fk/BMMhXsye3lBeS3/vMeaoSU6Opb7nJ2
	IlEUQGg2zJQ1IQoW/9wfvdaKfpVEj0bzBpcbZRDIo80sUcVy2XB/Ab1/ZuIJqW1J2iJs0VRWtYvXf
	yX1AbvGn7NHEbJQ0yrUaiQGz4rLqgjyqeNxSJIhLnf9odtLDpfTuJs5caKUMtpvtxQvdrwWLZp9Aj
	GY+qgdHy0d2VOuzbiO3IYo7H2lJLMQ6AkpJlVO7LDovxvUB9Kr3a97+0NXoht6oBbcwg5AJScqgwW
	dX37zggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iV-000000076pj-36kh;
	Sat, 30 Aug 2025 00:45:15 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0IF-000000064FQ-2n54
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-771ff6f117aso1953018b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478491; x=1757083291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=fDDoyj2xTwA37BTZgbu6P7mMiQIAy1EpSSpBUyIGhs0o0zDbJNGpA/PBV2AW+1Bq2r
         8mJu0eTsOOpjsoaM/tL2XshJTR3WoszuNJDWqoCAtgQa03/0JxoieBZdGEeEzx2II8pm
         JmiF36yG8EHtS7xUjPofv3dHh/ydC1Y0z8xOwQZQ8IvG4rHAEQjH9Ht/3Nzq5bbbAr/a
         EvSkNNesRZci3kLfQfpEW8bN3tpKjPFJD3Ul/YaBSCquPq2fJOw1b61DevQZPUCL5KL/
         iq1vUgIRNPZNbbRhUYLJcNH4rJNLbwj1GeDBfX4kRV7wn3HLwJubUS3gCDb/1NPidTLV
         ctRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478491; x=1757083291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=oWj9RGWhZAqJ+DndeEOqVx2P93TTlvInUFgB53HV7XmsZmHrQ6tZ2+2qvN0EE6mUX4
         /SywRWemz3o+UvBhLC23spQdOFE71t/OcFMcJ/tIuYKtJ9aTYvJn1cUWh+Z+1qHK/CXy
         KfVZNIZ54ZTAT/vHuyaOg0a28ITev3IXPMZnyYV5zRRjbqARsHaJuyvxSXE3CL+0knUR
         DKvSb3sPdQz7J503eSjkDFIGsy/5V2CupFOBcCQQAM6CPTQoxPw+unPl9Vnxu+f9A0jl
         vFliJXbuNH5d/PesxIsVBr4MuTCXWtgVgn8MRG0bKapl0/jaMKtLmKZPFpvY/mMIeOz4
         DD4g==
X-Forwarded-Encrypted: i=1; AJvYcCX/Qy0QgeipU7sTpthpZn4dt0Mbc5pg3sPhOQyTlyOF4L1ZO9s2gwezvvGOYwa76xzlZs+I+vglSJvPAKB10Rj0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0QFI7JZLtCO2gWhAFar4INvwhA1UYwJVl9ZpmHYH2EcDAgrMR
	ens0DulQ7MEBxwhf/dNWd1ywQpkiprAhdTR7yxoHKUvzJ1xROom2EC4gBDFRadEXp/A=
X-Gm-Gg: ASbGncvpdMG+nlfo2lpwSHtYyphqqFclyjcr6z9iLztQJUGSjhYXZcfw4yTz4kOmNLs
	oIKQJ0HJTIswI3rw2Vu95r4GbYvoRY2J75oHah03UW7tv6ONgo8PUvWn0Aa+L6qBQKLvfqi5LDK
	z7V+1ULbhzNKMaIuiX6uSeWJAbZd7hfhznT5zWL1palflpsZFpWJRG8GoVPlUe4jhIh90BSgh/3
	gAHEm6zg43060SliPRGauRseUMOq2dwy9eShBAyCZUJk/tE8H54LDTgobcwqQpALsMig/Vda8e/
	Jun7AsgKW3E/hWARq1hNuuk9imfFlPYWdstNDtcZBvBqelQHBClAEND8vDWHnUhDaG6BFMDYLP/
	suYIllwwDIkg0iU9C8Y4aLTrygaOzT/9Ru+2k6WBWullzrw==
X-Google-Smtp-Source: AGHT+IFDBhv3MLTcxgH+II4bHiTtnlUQ3Qi3MwL3+YWiPJW3Bh7QRSHoNEvUKcz9tZC69e4QqkawWQ==
X-Received: by 2002:a05:6a00:9a5:b0:770:374c:6c55 with SMTP id d2e1a72fcca58-770374c6e1amr32573308b3a.31.1756478490940;
        Fri, 29 Aug 2025 07:41:30 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:23 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:10 -0700
Subject: [PATCH v5 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-pmu_event_info-v5-9-9dca26139a33@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250829_074131_699571_0C151E0D 
X-CRM114-Status: GOOD (  11.07  )
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


