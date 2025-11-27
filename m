Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC57DD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spMh75a0LWmahxh8o8eZW/bsUDLucQjxyd3BG3Z+aI4=; b=0xYl7j6UoCSFGvjrCnOIjHYap5
	+biDV0TcZ/N95i52KxERrTP4XV26LZ8HQznHqUGAq7dFlcXLdN94yZlMzoDnYKRpOoVVcq9T23SHr
	fMQ9OFAmBO6TzSdZbHGXTy+fFyVBxStpxnDEsanVfcqyPkyOoi/BhB69L/GEy0cmYTP69l9fbteLb
	MAYCNs9k7PRDQD+z2oilpsWOn+ofVb8K2ortctxMO3XcLjy9o/yl8ZOh8n8gQ0KNIgDSBsCd0WEyg
	MOrB2d4iIpqz7Z5LOp+Q3uPBoKmk6Pbzhb0/DIU8j4tiyVSvMsmA4bNJl+/L14XciFxIPAG8iThsS
	7TI9/05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0x-0000000GXj9-15E5;
	Thu, 27 Nov 2025 12:22:23 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0r-0000000GXfi-3MaD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:22:18 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4775d110fabso6209255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764246136; x=1764850936; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=spMh75a0LWmahxh8o8eZW/bsUDLucQjxyd3BG3Z+aI4=;
        b=z398y3y7HjZ59z7UwNZgwd9wntVo43wr2Y5ZwhtHjTsmDyTwNPff55A+pa5gDdzlmq
         whNGDZb5vtKg5hcBYiJ/2Kccykk8ilLdMfDWHbrbwI4p3v5sD//t/DF7P9nMSBpDb0vm
         lh4/w5oVPoG/jqf5WzVfr9N/PIrhhtPozVZFx40MnbCpuBsWdXJEVsS/Z4GL5nDTaMgd
         jS0OL+84URqMSmiDTJggXioyLVjkO9o55lprfrmCO1oTDp5GD3ErOuMTlO2DGZlznEJu
         jv2Q/3zHOV+oZshgfaN1tR2yoKDz/wGu5Z3bri7Si1fdvdZkgtZpzplf6LTU5oNjkZeb
         6uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764246136; x=1764850936;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spMh75a0LWmahxh8o8eZW/bsUDLucQjxyd3BG3Z+aI4=;
        b=PhGIgiiaIFcS8UMmCDfzjEkCqr2Jcs04mJPTpawwSasmMJr2SPVbdwsbwagcG13oxb
         zbcv1udTd1ZKAonhdgSkUtPW1AFHlAquRHqXJjPpr1ul5eMSnrcsch24PyhzAMLhndx/
         OcA4ZrPhOLzmqVhphzQQAiRIeq0WKtBCbnbhH1kguTF7aNRcrsbwytM5SPtSShQ8yImG
         ZGbOAcACfJ215RtIw4mNFf7X7utWJEOTpMArcH2WJNwqOC3Z8bd6QwmjHLxgF8O4Je2q
         6UtZPGJnFC9X4KhrsQPyK4YpMRtxD6jTQ4qj9EuQbIDuCCK2bgbtahXuwaj8WbUzBKfF
         x8og==
X-Forwarded-Encrypted: i=1; AJvYcCVIAx8b4T7hxDCdpabhol4W4oWB3HRl3V8y551jF4inksGkxUC7vla+S9oajyt+w7L22/DLocTXgZA58DwUqNQO@lists.infradead.org
X-Gm-Message-State: AOJu0YwIcYZjZwOH6yPAk2qGgIW8vpOa/RgIMjNLnjsq1PiZJXDxx9M6
	qkmA3+xgNup5nT1U7YIBfo7eegUcu6LBIj4myh+GFmiHSzTOO5m9N8Vdaf23df0rhMHAU6M88rL
	B4w==
X-Google-Smtp-Source: AGHT+IFk1TWbWQo0Iwg116ubt+VmEH+PIxu0LQh4swg+M7nIgheUq+mboH69dOkqzZxJ3flErP0k6D3VJg==
X-Received: from wmpo25.prod.google.com ([2002:a05:600c:3399:b0:470:fd92:351d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:458c:b0:475:dd7f:f6cd
 with SMTP id 5b1f17b1804b1-47904b36881mr107364055e9.35.1764246135871; Thu, 27
 Nov 2025 04:22:15 -0800 (PST)
Date: Thu, 27 Nov 2025 12:22:09 +0000
In-Reply-To: <20251127122210.4111702-1-tabba@google.com>
Mime-Version: 1.0
References: <20251127122210.4111702-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Message-ID: <20251127122210.4111702-5-tabba@google.com>
Subject: [PATCH v1 4/5] arm64: Inject UNDEF when accessing MTE sysregs with
 MTE disabled
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_042217_866362_F46E6170 
X-CRM114-Status: GOOD (  11.72  )
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

When MTE hardware is present but disabled via software (arm64.nomte or
CONFIG_ARM64_MTE=n), HCR_EL2.ATA is cleared to prevent use of MTE
instructions. However, this alone doesn't fully emulate hardware that
lacks MTE support.

With HCR_EL2.ATA cleared, accesses to certain MTE system registers trap
to EL2 with exception class ESR_ELx_EC_SYS64. To faithfully emulate
hardware without MTE (where such accesses would cause an Undefined
Instruction exception), inject UNDEF into the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 29430c031095..f542e4c17156 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -686,6 +686,46 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	kvm_skip_host_instr();
 }
 
+static void inject_undef64(void)
+{
+	unsigned long sctlr, vbar, old, new;
+	u64 offset, esr;
+
+	vbar = read_sysreg_el1(SYS_VBAR);
+	sctlr = read_sysreg_el1(SYS_SCTLR);
+	old = read_sysreg_el2(SYS_SPSR);
+	new = get_except64_cpsr(old, system_supports_mte(), sctlr, PSR_MODE_EL1h);
+	offset = get_except64_offset(old, PSR_MODE_EL1h, except_type_sync);
+	esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL;
+
+	write_sysreg_el1(esr, SYS_ESR);
+	write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
+	write_sysreg_el1(old, SYS_SPSR);
+	write_sysreg_el2(vbar + offset, SYS_ELR);
+	write_sysreg_el2(new, SYS_SPSR);
+}
+
+static bool handle_host_mte(u64 esr)
+{
+	/* If we're here for any reason other than MTE, then it's a bug. */
+
+	if (read_sysreg(HCR_EL2) & HCR_ATA)
+		return false;
+
+	switch (esr_sys64_to_sysreg(esr)) {
+	case SYS_RGSR_EL1:
+	case SYS_GCR_EL1:
+	case SYS_TFSR_EL1:
+	case SYS_TFSRE0_EL1:
+		break;
+	default:
+		return false;
+	}
+
+	inject_undef64();
+	return true;
+}
+
 void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
@@ -701,6 +741,10 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 	case ESR_ELx_EC_DABT_LOW:
 		handle_host_mem_abort(host_ctxt);
 		break;
+	case ESR_ELx_EC_SYS64:
+		if (handle_host_mte(esr))
+			break;
+		fallthrough;
 	default:
 		BUG();
 	}
-- 
2.52.0.487.g5c8c507ade-goog


