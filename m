Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10986C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IczIPc9KHJgwzJvoZ8OSDmYG0jZ0892D1g8bhwKC07A=; b=UGw6ip+Is6xbZ3xYYzuEXmgF9C
	mwchQVi5j07pQYJ81p1TZw9TQlZPwuUf6UAXzRhiW0R7C8jySnO/P7cTZ4fjDtOopI7EFEIyzwtKT
	ceKjKKl/PGcPzuwyrawv7lBm0bWRj8PvClsIIWQS7r6V2N4HwHloy6orRr0yC+4FnqIwthmrwWv70
	egrNi09UFxOjvOxGHtfRajgVHkaF12ixWMzGgBYCBxg2zBL6a4eIJdoLpDNZj4JJjrYATd8C7W0Zv
	ld3vsBHtaXGmUDuQXf0/llUZJyRThRsJYpZBA3bTv/PUrDWG66IwHa6V9KLxe3MU8zYXMK+lW4g27
	v9BRfkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3sk-00000001CAg-1OQU;
	Tue, 22 Jul 2025 03:41:34 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3Tb-000000019BQ-12OT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:37 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so3824734a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154134; x=1753758934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IczIPc9KHJgwzJvoZ8OSDmYG0jZ0892D1g8bhwKC07A=;
        b=mHFJTXrDxDuou91vK5bvtPiFbGFtQY99AwpPyQNqdwmKtG9/BgL7A3UCHOJNX3v1ub
         SjPNFSn/TGdupJJlUJYq+DbZt4TeQRT/iQvm08TicU5ejFx1aC05UGittMOB4hqAIJVi
         EybCeN+h+epeJ1Nnd8+McRNI4LuJJlJ/EWz3WWqTL1X10vGdvbtfNrRjN/GSwhL8PU2r
         AvZQEyq0/hIh6zLNFXsfV5jfZsur9oTsGXIVyfUirtA4GKHAUNzrBHNPI8JD+1wuZRxE
         X09tz8nYpW6I1D0A1Xn0ciaaI8m9oH6Z63rp+hxPryQer5TYGB06c0Xajg1pPucVwv5W
         w4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154134; x=1753758934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IczIPc9KHJgwzJvoZ8OSDmYG0jZ0892D1g8bhwKC07A=;
        b=DlaCdC7x103OgQ5l6epZ/J0iK3/WdR/fXQzTWTKvCzKEDHFycp33JvX24iCXnKbVqk
         tzi2BdkYO1jk5DJsN0ztQ8a5EOt7987ELIE1YWaXJdD1wwvJ3U8xwO+lsHz5OzQ6bycp
         XuWglnnJQBrvOvs3j7k6V0DeZLjHZNR2jDNrvvn2MbSM+W5V7gxQhHrzhg9pG9ar3uP0
         sWVQzPADYQJDDm2rsX9sVx3fA1049JGP5Hx830eTZgW0kKDqo4hnNwP0Tb5v40Mo2LAF
         QdAHvW5EVxj2dPTpq6IHmM+2pPrBEANOW2GY1A28ctecpyssfx0yXRXUPVXHeOrt48mE
         DnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHwyAg9osI09sx6VGbBKwVpf0QW/B63N9KmkKph1JMpOmUpMQ9UsW+lC+PAE0ka4ejfR5xAVV6ZYaYo3SZNQ5l@lists.infradead.org
X-Gm-Message-State: AOJu0YxRF7xovpWmz35tLm1HSWRXqyVczIniFsI/P+OH/uUXG+8DR2jb
	FuW/fp0DyabPycqbYdp46yKnP7n66Ax5hTrk5+Lq+5Zm6PpLiORoU8MjAuHpR6Xzsas=
X-Gm-Gg: ASbGncuqHPwLUdWP5yN6hsoK0IxBbqbFbHfg/vhXqZIwL4OYDnZl668OYI6dPwlzkFL
	db5e9Tk2aUE2WgnbeCmACpkA7YEjP6NTy9YSGWsIB14375WdZwj0d7fx31NVFnL7CHKEjeZmy/+
	Ne7bXIGlGauB98BNTpb+n1wY57LbvndN+tpiiflHaTr17lcFTt05Zde0j10i4Y/OuIPptdTGrOS
	bzW39VK6MVxhrgpMfLaSrHiWbselVYgmkqzzQeHTZcz9GVQESgg/7xjTObxtgPjNbFOdndK7guB
	jLkkyBv5uAQnfRm5/LnYcDiAdVVExwB30iPqeYE5MlCSnyXbfDxCt/egBkWbZO87tsmPo+6VAYP
	3UbzBDYcb3PJNY6eYnKfaEl13klyhj/EzP5M=
X-Google-Smtp-Source: AGHT+IH3k/+gjr1r10wY69nF/zLNtmLpBdy2psVbdr40RupdADuqBFyStTW2VIXjsnxPyVZeQF0kHg==
X-Received: by 2002:a17:90b:1646:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-31c9e77cfe5mr28771702a91.26.1753154134478;
        Mon, 21 Jul 2025 20:15:34 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:34 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:25 -0700
Subject: [PATCH v4 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-pmu_event_info-v4-9-ac76758a4269@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250721_201535_366317_F5C8AEDF 
X-CRM114-Status: GOOD (  11.26  )
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
index 439ab2b3534f..03fd350ce7d1 100644
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


