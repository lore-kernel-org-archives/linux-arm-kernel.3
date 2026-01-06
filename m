Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD41DC47BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CY0nmexOazthmZ5H6pdtIqZB8AItwvhQd/s34gISyww=; b=SSJ+Yl6SHqwRHiBCfExMF1YyPu
	+wOVyL+G49bY9e+QCgOzPXS0AqGk8XVEwJInse0GsonrcDFqF9CbduIZUQYCbOgXCtI8dg5AKXqhI
	7v7YDF2Xgg5+fRi/px9mPZ9iTJLCP4BXbJrY7feAt67gJZoAIC8Ia/7zte3/UHo8UTB+sm/voOjot
	XoE/62zTrG/XnvVjxXpMiUIR/R2lzpQnnmS7s/muVbgCCOQ1WY11G6hidrIJfGd8WaRlvE/q/1mj4
	H3UfGvXBAFwjJl0+8J9g+haxpmFc5+ZmltN9SR4OBZKbFB+X9fgKk5rklnd2cmVEdtdGN7hgGG2si
	6bT8X8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Is-0000000Ci8D-1Z5W;
	Tue, 06 Jan 2026 09:24:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3In-0000000Ci16-0lNp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:24:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47d28e7960fso8650625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767691471; x=1768296271; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CY0nmexOazthmZ5H6pdtIqZB8AItwvhQd/s34gISyww=;
        b=r4HYkUSflVnX8/YqxohtRWFBt6Iu2Ad/VShi/A/8zikXP0tmWkOZ9vJ7aUpv7NEChj
         Z7Ub/pWZB6JgyFmkzfVQn5oroFmXKLANGyGXL/pWcg4oV0Wb4x4to1r8ABAwbvNwzzqN
         N9UP35iSNuP0BJUaudg7415gcyV8J7aQhRMrBSIBkdIEoFC56gcHszgtL4ebCA/IHv2p
         Izdx7iCzjxZIyp2A1rPt4xeOKeXoXzFj0cl43O7QRl4oGEolGcnlVV6tMhYZdCZAnDCl
         YJSZiA9bYUl1jXCwrLm63gYZCswhzmiawqSt+Z0IMK+6DasyvdxzoRvvSmBYEXqYO1TT
         4x1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691471; x=1768296271;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CY0nmexOazthmZ5H6pdtIqZB8AItwvhQd/s34gISyww=;
        b=mKeW10MEtKrvw/3JEkJ4epCLARaG4isACCNS+OmrfWDub6sSmQUFH3j2VSwsHNggya
         MTomHDA3O/NicBgQwdeurqJY72kDVuvUTQ9v8zimhaSHOB361Lv1FLeghRTokrh5+GmT
         R+dJoeWPdxpbua8Sd6ApVYvM1o7ohh8wfSD43ty0XQPV6JDzh1jQ0btWfiTZ8WQqgQyQ
         9wQW10yV8/V+wWTbFX9GcB8PLkun3tKLef10w7S9vvm/7qsSw3YlG2Mkx1FINUJIFXLU
         ktKrjLNO9Shc6tYZH9Wun97a+Tnqh1HA/UfwIN8b/GGcZNaqGubfvL9bJBfzLavyPXq3
         71Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUXXm6/C2ZNPbhhyJ6U2mrLH6yPOCYaia16EfL3zDnTNoyC/1mqduM9Sv9HkfkXJCq6ZVdUIHu8/qgLV2lTjeXA@lists.infradead.org
X-Gm-Message-State: AOJu0YxPGXRLYYkp5c6tGk4DM4AnkDNIILPWCZvMFZb9zDQcEfHvGFwn
	2UOWxVKo1u2sdRkJicjk55eyMVlas1j05uaPf7NyJKcXfVRqwBPiuGLsK+JqCqMh4aj1NIeSLaG
	sGg==
X-Google-Smtp-Source: AGHT+IH4a3WanlofrHZQi1TFDZ2kdHhieJiwoT4O4SCA7gXcrGwc3UiWaYl27kXqMWKHd9vR2euGSEKV6g==
X-Received: from wmsm16.prod.google.com ([2002:a05:600c:3b10:b0:479:3624:3472])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3155:b0:47b:deb9:f8a
 with SMTP id 5b1f17b1804b1-47d7f09b87cmr27122825e9.30.1767691471353; Tue, 06
 Jan 2026 01:24:31 -0800 (PST)
Date: Tue,  6 Jan 2026 09:24:25 +0000
In-Reply-To: <20260106092425.1529428-1-tabba@google.com>
Mime-Version: 1.0
References: <20260106092425.1529428-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106092425.1529428-6-tabba@google.com>
Subject: [PATCH v3 5/5] KVM: selftests: Fix typos and stale comments in kvm_util
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012433_240346_9DB29041 
X-CRM114-Status: GOOD (  15.36  )
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

Fix minor documentation errors in `kvm_util.h` and `kvm_util.c`.

- Correct the argument description for `vcpu_args_set` in `kvm_util.h`,
  which incorrectly listed `vm` instead of `vcpu`.
- Fix a typo in the comment for `kvm_selftest_arch_init` ("exeucting" ->
  "executing").
- Correct the return value description for `vm_vaddr_unused_gap` in
  `kvm_util.c` to match the implementation, which returns an address "at
  or above" `vaddr_min`, not "at or below".

No functional change intended.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 4 ++--
 tools/testing/selftests/kvm/lib/kvm_util.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index dabbe4c3b93f..e29b2cbcb82b 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -939,7 +939,7 @@ void *vcpu_map_dirty_ring(struct kvm_vcpu *vcpu);
  * VM VCPU Args Set
  *
  * Input Args:
- *   vm - Virtual Machine
+ *   vcpu - vCPU
  *   num - number of arguments
  *   ... - arguments, each of type uint64_t
  *
@@ -1264,7 +1264,7 @@ static inline uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 }
 
 /*
- * Arch hook that is invoked via a constructor, i.e. before exeucting main(),
+ * Arch hook that is invoked via a constructor, i.e. before executing main(),
  * to allow for arch-specific setup that is common to all tests, e.g. computing
  * the default guest "mode".
  */
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 8279b6ced8d2..fab6b62d7810 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1351,7 +1351,7 @@ struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id)
  * Output Args: None
  *
  * Return:
- *   Lowest virtual address at or below vaddr_min, with at least
+ *   Lowest virtual address at or above vaddr_min, with at least
  *   sz unused bytes.  TEST_ASSERT failure if no area of at least
  *   size sz is available.
  *
-- 
2.52.0.351.gbe84eed79e-goog


