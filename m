Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F131AD232F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTwC3FF8o3D1tLIxF1rzohdijBesrjYjdFLpGAMOcJc=; b=bm48g5IGLh2d5CZMTxLJqAmlxI
	FDuLonsRNPjhF9Zegw7zynAa91Dwug5WfP2Nwe56K/ACivwEefnKfX9deiXlSUOeuUPwiEoqp/Lw1
	gZ01VUY5p3R12ipvaDOyC6Ciy0dTgQN1B5R7eTrp7Z1bvLo9E0b6Ubm6sxgTal2ptsnaTJEP14Gtk
	vR337LjAgvuwmoPi1CmNdUxaZJkxC39PGjoCrYXGRd3zwabodxp2FV6alaEe+6DxMoVeaUel2xsqI
	2v+t5aibclnS/Zk7DgprMXrm9JAcvchzu7EQuNplkVuchigBvqmlDZlREGvOQcqJ745d9/9GX16Is
	7A1zVfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lT-00000001sjx-0kIS;
	Fri, 09 Jan 2026 08:22:35 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lI-00000001sX7-3P1C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:22:26 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-430fdc1fff8so2475004f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946942; x=1768551742; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WTwC3FF8o3D1tLIxF1rzohdijBesrjYjdFLpGAMOcJc=;
        b=ff2AmhBHMxXLlIY/3wOYl0C2pChM/bv0TGMJCue4UrJ3BH6HyVrEpzWnTPsddBZmFH
         8h7NNEIZQ4Wm25jC3YZmaBgJKJyuLOE4G6wpU+IbiElSagINp162UW+SNyaRrpGcZ4qc
         0L4Jj9M2I1SeG0nxXW9TkX1aWKbGmqGTD3QFfR+UNIj92ol2ddNGPZ4SnE17lQUe7SGD
         ahy7ntvbS55R3P+uzsHWeY8JsXQdkB296Dpo/lDpnP3+GXZCzQ4gE3R/gdkyHcaTqTD0
         SldJJLTnVConxt5RGdMBECwu2TzlQLH2qcVSOvWuQzBwhQOSP/qnNnHHv113iHgdn501
         XVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946942; x=1768551742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTwC3FF8o3D1tLIxF1rzohdijBesrjYjdFLpGAMOcJc=;
        b=iIHSwtAXJFQazqsN8Z7dsajzRMFRP/8C1l+lM2p+ju3DxJ6PdGBeoXh6TmwO+5cWue
         CqnB+ezcT0fpe+yi/dPssm7VcRGtnKrdL+qBOhDsS6xz+R1ejwYkubtNGSPxqotGV39m
         qqwFOw62Y4vBBZlb8wowSFjFpMo9O6DGMBzuLdEm7riyT8GXuc9BIxFfWqB4/JU0Z9zL
         q0mEkbcaiN+P6IWZe+0ShtUi+BJQKD0oZ5x9GFy/D3Sq9VCgLXH0GFC1qucyMaBY6PQY
         CrnAZCs57yO1DVHcyokJrzKBTJqufdoRjC1ODJRz0N4JLW6TGTlQykaCdqtfXQtGzcUD
         OCgA==
X-Forwarded-Encrypted: i=1; AJvYcCVFA4+xgjn6e2Wm6FYhmjHiaux/354EDWs9RMaPsK6PTIZltzc61V2cDBK7nXc4yiXSzXENGBwPLao9/jZ4GvQu@lists.infradead.org
X-Gm-Message-State: AOJu0YwPI1gMYFBqR1UWLb1NDEgnf/lVKOCDm82BH92MV7MDDkr6yYCe
	hwYHvtov1KQZE5HcCzk3v50L7Bg449vf3llgs8U0JFxAYcJ5EZ14zfDHgkDjdLxGcbB0WcYa4L8
	ZuA==
X-Google-Smtp-Source: AGHT+IEbTZ+JAQZIIX5R/diRf8NtI3qcRyEYMj72NqYPRiSA2F4mmy/NK7W30kPtTdFlYjIQg8wuM2wdbA==
X-Received: from wman14.prod.google.com ([2002:a05:600c:6c4e:b0:475:dadb:c8f2])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6287:b0:475:dcbb:7903
 with SMTP id 5b1f17b1804b1-47d84b17b7cmr101603035e9.9.1767946942620; Fri, 09
 Jan 2026 00:22:22 -0800 (PST)
Date: Fri,  9 Jan 2026 08:22:16 +0000
In-Reply-To: <20260109082218.3236580-1-tabba@google.com>
Mime-Version: 1.0
References: <20260109082218.3236580-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082218.3236580-4-tabba@google.com>
Subject: [PATCH v4 3/5] KVM: riscv: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, 
	seanjc@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002225_067801_E1965BDD 
X-CRM114-Status: GOOD (  12.14  )
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

The implementation of `page_align()` in `processor.c` calculates
alignment incorrectly for values that are already aligned. Specifically,
`(v + vm->page_size) & ~(vm->page_size - 1)` aligns to the *next* page
boundary even if `v` is already page-aligned, potentially wasting a page
of memory.

Fix the calculation to use standard alignment logic: `(v + vm->page_size
- 1) & ~(vm->page_size - 1)`.

Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V 64-bit")
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 2eac7d4b59e9..d5e8747b5e69 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -28,7 +28,7 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
 
 static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 {
-	return (v + vm->page_size) & ~(vm->page_size - 1);
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
 }
 
 static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
-- 
2.52.0.457.g6b5491de43-goog


