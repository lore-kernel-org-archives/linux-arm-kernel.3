Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F457C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NL+JjaCkPLIbpCFGEZpnZEqKtEvm89wxDo8gtW9i88g=; b=2veAH0Rpn026Ce8S8G2F1+yA8Y
	e5ftw+h984xCju0lC7wfQh3LvQqRwQTPhEqiB6cC4la9Fto9Y53K2G8LPYp5JWpUR6s+5rfQMvaPW
	tJn5KbOT/RVTPXBoFQ9ftEzIoWwWa2hYmfeK12FdU5WB5hyfUm58MG/kJSL/X3VCNJwhkxhUh6Llj
	B+6gAWuvlF69sI1MVDrXNY+IoEhSNEmnSKGPdehPbIVfnQUy2m/zMEhV9hVdf1DUUaAT/gZnjgUOA
	n8HIIOIirhTSWq5oe6vlnXEjtMscPpoopTI+x+z+Q+5kyjdFxOfVHGPCl1NoQt0LpEX4LEVJrFE/h
	SJMk59vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBTI-000000020rU-3Juh;
	Thu, 22 May 2025 19:20:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCs-00000001wVR-3otB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:03:56 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-231fd67a9aeso1774705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940634; x=1748545434; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NL+JjaCkPLIbpCFGEZpnZEqKtEvm89wxDo8gtW9i88g=;
        b=G/x/xI96ny/JbhY2PVQ1Waa39l7iDiIPFnIFn0NLPcnfaz2v82/skLijn/LVRsmClF
         y44pJ6VT4Y+GAR9nrGrB1I8M/ZaLF2sVopdRTz8LGVCzvfZ0d8YsLuBlBYa9lnelJtCO
         mGkb4xjxtGRsbXZK5STKly009D5eZlTiGshWEJ12fmFaUE6+DL7YXDiCGRrlQYaTcev2
         wuwbfN7EwHlBvVDNrz02yYAYSZD0Rch+9SwSkUN1OLVkycG0at+zSVaVK9/EuzH7ZB3/
         1aEmZamvBpchzdTjtSpj7U8sVWltRnruE68uJ9G7Lyu0lR0ntpeGyGD3henP12hK3xyE
         KbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940634; x=1748545434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL+JjaCkPLIbpCFGEZpnZEqKtEvm89wxDo8gtW9i88g=;
        b=m25mktGCc+1SLhvsrjjnp5Jjg+r253bFvkETaM9pS+MXsJlPq1/LTODiYi2icKXCfD
         LtWhlLwiJJ7f2PYvo65yFeB3OpceOcbj9pFg3Iw4SWVU89CfT0/oDM203QobuLScdvM8
         tMYA324ZB9ymjHWeqTN4HPmR71m3GhblHuVN8pQsF4CXPZPVruCCjIRxyga9947kNB62
         HAqtbYtvjhqUVCAJn+LpH/vAAudgw1hv/KUQCxwWgVTz8/R8h9P6RkAzOaEjI57o9OEr
         OBYigJFdCKVxtKZhT5U8Rnp0ybrOWEd4zPtiJkyV15i/ymg9exrmZ7OOWR+j3z6kvJQu
         qe6w==
X-Forwarded-Encrypted: i=1; AJvYcCWi1O1ZCzJTANXz6lI+XKOis0aw4vV/4MVO0vMwYyFhaMpO8CdxXGJwMSuzC5hgQX4DmAq+hbnwWH6ZjR1nDnHW@lists.infradead.org
X-Gm-Message-State: AOJu0YzA2KdD5g03hsfOarsMGnPKNqmlPxwlg3cT+NY9J4c64iGwtvAB
	0LhjIqJt2FG0JzaBvREGZSGmwEx5ED8b+9vCkq2vDPMrfV/C/Lq/F51X3kUVUknjhvw=
X-Gm-Gg: ASbGncuE/M8gPocX7wt3wApsd6hswWaXYeaVrSFBqbi9HcVDUpAoiKHKCVtoAG8L5Kg
	huxvcarhZbqqk+Yu1AE0jNKCmO8NCmZD/NW9+GBY7jQgtK/Soofiz6cF4z6IG9JgX1GdkWI5YYT
	NnTBrByDo7yQEL4AAtoYaCf/2g+mv+RNdYzeOvDyQ662id7tit/+KJFXa/JdPkxB9BwMx+hKzEo
	tA7RbMsfeniKT6Xx4wtOaYgJ1C/RPWp0ele7rBe5Dbm9MIlVwNLTohm38CPvMjsRnjp8LJx2SYR
	DcpdTzaqUkY5N/hwiCt9HBQqEV7NPtj5UiWpsL47O0xv51vcld+MRtvYi163YpQD
X-Google-Smtp-Source: AGHT+IE7MkEZajOwtulJ1pSoS+YJGY/C1JUznV8zU99zjbdE3O1pdB4nhaqsx7X0UH6Pko2Lha+e4w==
X-Received: by 2002:a17:902:e545:b0:232:1d89:722f with SMTP id d9443c01a7336-233f067c489mr6091775ad.15.1747940634357;
        Thu, 22 May 2025 12:03:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:54 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:43 -0700
Subject: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120354_959369_2E2996DE 
X-CRM114-Status: GOOD (  11.30  )
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
index 4ed6203cdd30..194299e0ab0e 100644
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


