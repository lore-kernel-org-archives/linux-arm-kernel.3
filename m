Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97D7D6C299
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS1moOcp9ct9rXCWQSjf/GhpQtGR0rWY3wjXVfG0zao=; b=HFKH62ymw8ma0pdm7u7NP16eGd
	1oKlX46KsTwEOtY3ieKR9OuutblihBcJu4ROOLp+h04fsU8ATc9xmu0IRrcG6vbNKFRIhUWMT99qZ
	iiaQuwT8pZCVy8EvTkzCMj0Y6DaBDr8WDatwK6Vr1Fu3DN6vvL+Cmd+59GjJofmDgKHSZ8qT5Jlxo
	M0LKIb+DQzTd45AuGz5UdeGKVnLzyAhyMFAjnI6tEWKaFFOeTXslYqtjqLZU2dgKkZhZey4jN/jfE
	Iqa0M7Hu8a/Np3VMronYhWPLgEZLY0MN+FG/H933VwlY0RI/MrJBSdw73c8/dm1Sa5NJf2GUWetN2
	FzctlXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDV0Y-0000000DjkV-0FQO;
	Tue, 19 Nov 2024 20:39:34 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUsE-0000000Dh66-1h1m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-211fcadd960so26416085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 12:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048258; x=1732653058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oS1moOcp9ct9rXCWQSjf/GhpQtGR0rWY3wjXVfG0zao=;
        b=Kte/GkmCE5Mi6EpnNj22KWh3g9gh10YScRU51ikZuNdwAZOVYQ1irIMbHyx6lal76y
         PJefummeKrZi9qpaJDLB4TPpGCqEGOv9XnkdvOZOo1bUUHYfDkrq1THItLTvXXKGFVLR
         hM4EAVpMDwzHKakYMutE1/J7xZepxd1tC9cp8Wu0Tidl9FJx7krHd5Wd3hKk+XO3qOlX
         mUQ6P/SFjkHRoisYxW9mD4qdZ16ibaAfpN5KTu31bPbY4rTo7tnhPwiMt7ImD53ECsIb
         5s+yVdPhMqUHMc6cTVqXu7gTyJXBoqtdwj/p+Y5X/8JvOHFXfabm/tFLEIK4RgeUtOov
         oP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048258; x=1732653058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS1moOcp9ct9rXCWQSjf/GhpQtGR0rWY3wjXVfG0zao=;
        b=mQEYHpzRQvbJVrxxsdQMzNsA9jtQCWSVbCroSeicW9nMQ3IMAo2kF65l0aStdWD+XG
         2IOoV068Um5Xgyom6jneAihZokqBvozUHeBzJhfj/S2EBvvWvWOsrlofGAISXxw6Il6J
         n7ANtoCmJSiDdZPGkek0CS7UXF+EQ74tawlrrEjNnqMEkjgC7TKylL9Ap/msneIibaIF
         5eklyZ7nGHj27PJgpZ3Url3duj1t2Rtr0yQB75cYAKXiYSgVjjqa2dwV9HX5a0Y3ivIj
         PxR986/NUZQTCkYQlSrouA2YFbXmjeuNypL3+z16sXqMbBYQT33KwI5igJ82gYKHyU9U
         cPow==
X-Forwarded-Encrypted: i=1; AJvYcCXzsdGnDV08E2nT3UH/aAMevgBK4kXvtodsAc8KJt4C0RXcNLFYhsiZsauQd7cZKDxyULsVZ8Syr05/Lwjv9WFf@lists.infradead.org
X-Gm-Message-State: AOJu0YzVoNL6esXP5AZQNBh4KDQCHAl0nQGglfwXVIMuCfg5YYeMlIbT
	/YKyWPP98FJzkZ0Pdif6qkFzy9V6z3zwv0UX2fqeQBGLa2aJIFMisSltNZD8RYw=
X-Google-Smtp-Source: AGHT+IHJJKUj/G9a1vcUatY4x43+GcKI1AsZDcQ+KjFbu3ubgI0Q6fpviZE7gWtG38yqh7oUq4m8sw==
X-Received: by 2002:a17:902:dad0:b0:20b:7210:5859 with SMTP id d9443c01a7336-2126b07a574mr1668385ad.38.1732048257883;
        Tue, 19 Nov 2024 12:30:57 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:57 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:56 -0800
Subject: [PATCH 8/8] RISC-V: KVM: Upgrade the supported SBI version to 3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-pmu_event_info-v1-8-a4f9691421f8@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241119_123058_469309_E66B1207 
X-CRM114-Status: GOOD (  11.91  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index b96705258cf9..239457b864d7 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.34.1


