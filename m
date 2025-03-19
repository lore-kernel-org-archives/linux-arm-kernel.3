Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0FBC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oc66l7/d0Jjz8FMmOmNrv+ltKHYwWToN6Hiwa3da7k0=; b=rti8BUISM5koNShVuqpVLNSHOd
	rXVmUqoa27QZtiYTWMjM0U+6pRNTf42D8X8zeQTS8qA1eQ0X+3UG1QzdJ6eBYVlXZtqg+z1TDQ7Qk
	SznhPRlrac0s8aLo1yKrakpK4GExSOPUHNyZbNBRghNayc9HM1SULINgws3g6q1ArmUBxm/wEPGtK
	SFEjmDijsk1EuwK4DldFKWs47H5pVdaL9lKQ+3AHKQ5950/0/KAxBB4SPOSoW3uFVlDLt7kJ86Egy
	Cs625H8ox5fkzq6LDSgWZ3vKiygK8Qz+c7CWwdKuhHW78tXKaP3G/5W9O9wPqQ25+zGuPQZBr4NzP
	BIViVWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turoi-00000008rbz-054g;
	Wed, 19 Mar 2025 11:42:36 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turlJ-00000008r6a-1ggV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 11:39:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-224171d6826so37657895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742384344; x=1742989144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oc66l7/d0Jjz8FMmOmNrv+ltKHYwWToN6Hiwa3da7k0=;
        b=SNi0hnWOwz/orclfMcHkyxc6OZeEN9qRkPHWSFw723ssujMzKA3TwsS4i9omnDF69K
         bY23hSoHx2dAmMwKueTZceWCMxx2Mpg3yX3ZLurVHnKWgy+spCTdWxvORZncbeActkGq
         gvhJtXAYuSUCC0KfJZsZz8Qxf65b5tHv2lev4g98xe7rP12eZLWFJVyz1Up6twwlRo76
         ya2hzZttqrv7vyoLyR5GN4a1WBDmcKGlNLQ1m7YVf1A+zlSn4wJzSY9EBrSnyPV41Lyk
         +fFtW+Olsp34zkYub3R1sjvN/ifHv8J3jwfg7RfKU/IdebqL+9BByxAB23xReO0xA0YC
         0sJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742384344; x=1742989144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oc66l7/d0Jjz8FMmOmNrv+ltKHYwWToN6Hiwa3da7k0=;
        b=to55TPHGX7+lXXcNRsGsFzh5KO0T/p8YUrbwW4ZH0Vhvkq4OEozgU/E1HR+22TGXCA
         Rp8ngHz46EhzVbkfUArbyKvlU4977MILctkwfEbbPtvY1ZgNK4t/drKL4wFuewIR+J7q
         p94fmKlsVofwq9ctSKJtLYF2r1EU237mrzMiWnXcY4toVLNnmbRC2l5rsG+cysMwiO7t
         4cq2n2utlp4ITV78WLx2aWkAgxvTkhygWjnYECGeFoVfGarvTdLjkpy19Cqfqll1qBMR
         U1CVKZK2QhmRioqn/iIUWsgLvsdU6r5hcX12UF2avZsJ+sPgYdkb7U72JWvb3VMIxW/v
         jM0A==
X-Gm-Message-State: AOJu0Yz0pS/oR6CNlhQIQEaLB3An5EIhp8DhzdV/uzSEzKexTsNcB9zK
	+ofhRc96DYjvZKgAXWjSb7ACpT6HYN8ktehvCLB5dYGKcW4E7PSqWf9wiqT4LpE=
X-Gm-Gg: ASbGncvoQrZ6V+Y9yjQtipTPcn72tO0P09pi6s0lCXXFFncvlkKKbT/bO8RNvz0Caka
	CCvc/hppqOCUHUJ3V6uo823H+pPQC+ypMmF8Y5bx4G3OJxqkuh7EkHWcUXa0gwtV9WQ7lUaTB6t
	j2PvU2DBNaZTX4DwN4JPxBLm6CfQXquyfpoVTr9o2hW4xFonp/QnxXGtCpwb2flD1Cy8+kZeyGQ
	f4RxPCODI5Yh0xyl9xqvGZv2u/BCvQi05doBJGDWMqHQwx6LRSlDMQOUC+ntFOcAS6t/wDW8aDK
	/H8cANhPWSl0t7CzECLJaWe1dAzl1yMpE9pmjfHA80cOV4Pf
X-Google-Smtp-Source: AGHT+IGSv0AJ8KwpE6fQl4DpNJB/7VkQwjj59TCcKQRqKU8wam5+t3NXf5mYBQBcpLosGuAKvIYqVA==
X-Received: by 2002:a17:903:1790:b0:224:283f:a9ef with SMTP id d9443c01a7336-2264981d654mr33063775ad.6.1742384344597;
        Wed, 19 Mar 2025 04:39:04 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bd5ce5sm111657845ad.252.2025.03.19.04.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 04:39:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 19 Mar 2025 20:38:55 +0900
Subject: [PATCH 1/2] KVM: arm64: Trace values with kvm_sys_access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-trace-v1-1-0fff03204efa@daynix.com>
References: <20250319-trace-v1-0-0fff03204efa@daynix.com>
In-Reply-To: <20250319-trace-v1-0-0fff03204efa@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_043905_445936_C0D7AC58 
X-CRM114-Status: GOOD (  14.59  )
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

Tracing values written to or read from system registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/sys_regs.c          | 24 ++++++++++++++----------
 arch/arm64/kvm/trace_handle_exit.h |  6 ++++--
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 14f66c7a4545..362e2758d101 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3994,23 +3994,27 @@ static void perform_access(struct kvm_vcpu *vcpu,
 			   struct sys_reg_params *params,
 			   const struct sys_reg_desc *r)
 {
-	trace_kvm_sys_access(*vcpu_pc(vcpu), params, r);
+	bool skip;
 
 	/* Check for regs disabled by runtime config */
 	if (sysreg_hidden(vcpu, r)) {
 		kvm_inject_undefined(vcpu);
-		return;
+		skip = false;
+	} else {
+		/*
+		 * Not having an accessor means that we have configured a trap
+		 * that we don't know how to handle. This certainly qualifies
+		 * as a gross bug that should be fixed right away.
+		 */
+		BUG_ON(!r->access);
+
+		/* Skip instruction if instructed so */
+		skip = r->access(vcpu, params, r);
 	}
 
-	/*
-	 * Not having an accessor means that we have configured a trap
-	 * that we don't know how to handle. This certainly qualifies
-	 * as a gross bug that should be fixed right away.
-	 */
-	BUG_ON(!r->access);
+	trace_kvm_sys_access(*vcpu_pc(vcpu), params, r);
 
-	/* Skip instruction if instructed so */
-	if (likely(r->access(vcpu, params, r)))
+	if (likely(skip))
 		kvm_incr_pc(vcpu);
 }
 
diff --git a/arch/arm64/kvm/trace_handle_exit.h b/arch/arm64/kvm/trace_handle_exit.h
index f85415db7713..b0308d95304d 100644
--- a/arch/arm64/kvm/trace_handle_exit.h
+++ b/arch/arm64/kvm/trace_handle_exit.h
@@ -88,6 +88,7 @@ TRACE_EVENT(kvm_sys_access,
 
 	TP_STRUCT__entry(
 		__field(unsigned long,			vcpu_pc)
+		__field(u64,				regval)
 		__field(bool,				is_write)
 		__field(const char *,			name)
 		__field(u8,				Op0)
@@ -99,6 +100,7 @@ TRACE_EVENT(kvm_sys_access,
 
 	TP_fast_assign(
 		__entry->vcpu_pc = vcpu_pc;
+		__entry->regval = params->regval;
 		__entry->is_write = params->is_write;
 		__entry->name = reg->name;
 		__entry->Op0 = reg->Op0;
@@ -109,10 +111,10 @@ TRACE_EVENT(kvm_sys_access,
 		__entry->Op2 = reg->Op2;
 	),
 
-	TP_printk("PC: %lx %s (%d,%d,%d,%d,%d) %s",
+	TP_printk("PC: %lx %s (%d,%d,%d,%d,%d) %llx %s",
 		  __entry->vcpu_pc, __entry->name ?: "UNKN",
 		  __entry->Op0, __entry->Op1, __entry->CRn,
-		  __entry->CRm, __entry->Op2,
+		  __entry->CRm, __entry->Op2, __entry->regval,
 		  __entry->is_write ? "write" : "read")
 );
 

-- 
2.48.1


