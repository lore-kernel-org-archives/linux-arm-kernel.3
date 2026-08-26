Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2BBC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heZN2DuvfOxZirlVdynH6v1916EkfGJKRv4e6fIVLjM=; b=CSegmn9qWC7tbUPNIEifrDDIXm
	8tZgO1Jkr8etS1r3mb7z5uyRFAu6nhhvfVh7uCfu/ByiBQbI20LMQHqeq4cb+9MXvbTxeKdfvziBt
	L6Zk+4AF9E9ubcDouJR8wY+4Y2aUAMQWvaLBxJBXFfyIup7Li4IXdp5GZ77zp3t/iTBgaXERqiDVG
	WOMTSs7Djji9XMlm+U4MWi0YMU5lCKfvujTSogFDHDYtfkwvb5EmGe3ZZrTjcIObdDk7rQPx9xQ7J
	jW4NfSJsgcJkq6gE0JJaYFbs+ii95GNFwP8hk+aUjmaB4hcvCthDwMJyUEbtdUzKLGbXWqrJE+Ucm
	WNdOtXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMi9-000000038bf-0e3s;
	Wed, 26 Aug 2026 23:07:13 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgd-000000036OR-39Yb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:45 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so1759050a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785538; x=1788390338; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=heZN2DuvfOxZirlVdynH6v1916EkfGJKRv4e6fIVLjM=;
        b=ADBVkLKecQrkwDVl/unH5rAzGHln0tbIiRrKbcKKF1+5qcBhirK2J3L5aBoVHO/BCE
         562iODdbhK57HkByBhDF7bYQeZ7c74p4w/wpPS+jqeQ/KBzFGi63nCuWZ1Qg6EdLa01A
         rAGyz7eYmSUtsbuj4ueCrIcTDqF4AYAmZIuA7CPtbXYc66W18ZtdsXHnr9N7nSr/7Fwi
         sW4gqMoArfurWoHqtWwnL4aUTHh4eZxRigmwfejTYPnWvPtLbT6Tnd5TQIGogOOL7x59
         VU1iIMKTCv2F62rWBwGCKwEwV4N3G87SSjwTYg0hGotJqop9/rrSUgrlQv+FPljiv7bi
         FSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785538; x=1788390338;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heZN2DuvfOxZirlVdynH6v1916EkfGJKRv4e6fIVLjM=;
        b=m8zeeVbUL+oNPjtFf9Nxa2s6QzumoMkMQV5Cx9th9GPifB7ICeVcdFvAGP3TaPvu3K
         M1CNokNZONoYauwpQD8rW8fwTuld3DW0Rz7tBCEk7BizW5Au+kTZi+2CIRq84TQ9TwR8
         fLEHVZCkhsv5JadoyRP+5EHMJwdIWFOX3rRbplmjhZkh03ewgHS6qiqv7BCGCBpB2xzI
         tzq4jJ/4fxYuhygahlg6eJF7o/avL9wt/NiTK3KlyFwweVET3w7DcFB110tUjz0NatFt
         WENiU6lblQnjxTnYzw7QP6oBaAgPJlQryPxA7lgeTl4ViqVbD/tRJLHStYMbGfNa2BWT
         njaw==
X-Forwarded-Encrypted: i=1; AHgh+RpHQjv0IzBuBaRWFGUR3qOJn7T+X7sS4UgpTAJNfMjwlGcfAlXELGE/o6r9A0RJ12jA1X5F/VXHhHYQpw/519s1@lists.infradead.org
X-Gm-Message-State: AFuF++mHFhHxmhpKotHRj2bO0SbcikmUGr3JekvEaoc+RpA9THhcaisY
	mrNYPYN5GMTe0K3EGINSB3PcAlcmJ+75+U4aRKSW1oDhT4y9Kwgg3XpA9WrPWKjdAfTCRRR8lnC
	clzUzBA==
X-Received: from pgce14.prod.google.com ([2002:a05:6a02:1ce:b0:c9e:3c0b:5818])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2013:b0:3d1:3c2:85b6
 with SMTP id adf61e73a8af0-3d103c28dfdmr4039415637.5.1787785538103; Wed, 26
 Aug 2026 16:05:38 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:09 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-19-seanjc@google.com>
Subject: [PATCH 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160539_964682_99994AF8 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
input is guaranteed to fail the test, and with the standard error message
format.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 783f060faf9e..a0cd1b6598d4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -198,7 +198,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot);
 static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 							     enum kvm_mem_region_type type)
 {
-	assert(type < NR_MEM_REGIONS);
+	TEST_ASSERT(type < NR_MEM_REGIONS,
+		    "Invalid memory region type '%u'", type);
 	return memslot2region(vm, vm->memslots[type]);
 }
 
-- 
2.55.0.887.g758fc8c411-goog


