Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D92D5B841
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugLBh2wdanmYlXG/Hn2z0Lmtzfai0mPG/qbIe+jLCHk=; b=lxfsPQ6YcanLpMnMeLu3f8uD4v
	7XuC5m6UM0acov0sSP/bCYVkQOqRUByHg0EZQz8DH8KmR6u/710SjEfiGpZY375bj80IdlG/kGVIF
	iYy2zq0RXYllLDG7QuEw2auKVAM85rqszEbX9yHE0fph7w79SNO294LQYeZL+Gett3t6Zm6IiXs/+
	sZEuHbwCQwU+695IpeyHovosHhEy4D26VPhl/v1cpIKaTsS3NMgenMB2i1BU56bzIC9HAy42KXUkG
	x3+pMz9w3jVET9LbKDdGC748BGl0RehKrMHctFRv/PQWV/XsDepOONXu+Bed5+usR5vsijQBtW5Ew
	h0pPtGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlj-00000003v3R-3c65;
	Mon, 15 Dec 2025 15:45:51 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlZ-00000003uv0-14fU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:45:42 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so33811155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765813539; x=1766418339; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ugLBh2wdanmYlXG/Hn2z0Lmtzfai0mPG/qbIe+jLCHk=;
        b=1g6GgPrTSGK888DEMojkpolZ6dEtIOl6eesubLKulLFCsjCniQBqAIDYF9AajkcEfi
         8zob7mqbhSNeoNVZ5naJPKT6KrcOtnDr3RGsJgjsOBMCaWdrcmkPjmJs91KBB8Vq3ozN
         196BNidjvsyMai/7sRWgeh1rzZcH0IVlneIsa5WDEmBBnFEOtRP0NxyfVDtyiN6UaYXw
         iaMgMSFQBpSEKmxkovl+LmDmYnvcYBJhrQgzV9i9LZ15wD1xcYL4IZAKRIClsCbses6G
         v065ZQGX3mlkpP3b5R7JuwN48inapaio4Au+erFrGx6DhkEiN8OsEtmqa1cF9841x2od
         axLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813539; x=1766418339;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ugLBh2wdanmYlXG/Hn2z0Lmtzfai0mPG/qbIe+jLCHk=;
        b=Y0FHQkNL1y+Btcw/oOelghXaO7BX5s1m53FKp/wao6QqEuwmpcdpT231eqpnhRWdYz
         Ofd6QlMCKXdQ3zjpznRx+Ot6cOD02FXuu/h5UBHLHeiQGta4joX6b5Ueq+Kd/ir3Wc2r
         zM58P9IKU1vF2xMIYqiDH3V8+FPFD3nGVBlQxhidaWwq5eOAspO1vOM/3mqSQbU3taWW
         PneEDmbqzTlAyjwjh0tjSwz6pOyIPETBVkUQVglO5Ojs3ku0//8zKH+5XMxNR+azvWEW
         A/+kLXIByvuyGKQMesx2ugTeDka39rj8BWmUMUTtga1E7aLfeM+ZGr6XxXizKVJI1RA4
         tURg==
X-Forwarded-Encrypted: i=1; AJvYcCWETJtt+CGBSSz2xwFY7RlencwoWLPxTGM1lM0CgiV3ARQsL0LtrYuuEnI6WSYSjSQbswre8PxAKsnW8pLn9lGb@lists.infradead.org
X-Gm-Message-State: AOJu0YyuM7idO7NTxCa7Rd6mHyWiF8aNw1IHgI7lk5T6L/utPgxASQH8
	71V9oQflWmjJzH/pRNoAl/mUe6JG6YmxQdDB0aeUKD7Jp2LkZTkn8Rvi2fugeBR5+n53ukjUKhF
	AMg==
X-Google-Smtp-Source: AGHT+IFJunnbSWICKe5SqT5lO0r65yI8AoUOzlup/Iu59op7JlY08E1k1kCykSYROB9YxPoFwipyMX2vRA==
X-Received: from wmbgx1.prod.google.com ([2002:a05:600c:8581:b0:477:9856:8f53])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b62:b0:477:abea:901c
 with SMTP id 5b1f17b1804b1-47a953da53fmr80716315e9.11.1765813539100; Mon, 15
 Dec 2025 07:45:39 -0800 (PST)
Date: Mon, 15 Dec 2025 15:45:33 +0000
In-Reply-To: <20251215154533.3154405-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215154533.3154405-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215154533.3154405-6-tabba@google.com>
Subject: [PATCH v1 5/5] KVM: selftests: Fix typos and stale comments in kvm_util
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074541_338188_6A59D3C9 
X-CRM114-Status: GOOD (  15.14  )
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
2.52.0.239.gd5f0c6e74e-goog


