Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1FED232F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aoza9Haxbx5GFTKXR2e7jJHN2DZHptcSpiNA0k5YVqc=; b=AyYEWqyKT/JIF0A4OI6sXK82Et
	hb9TKkiZ0em0x0cR76REGh9+SWawxq5aqRlZjE6OmC2ncA/9oHgF95dR2OaUXnXPpu+zL9XpPvDsw
	EEyljcPyKLhO/gE7On+AifMsczxFm9aDRjo81/Hu0klxr9YjJBgX482Z5qVN+mc+H88qqTOI3xELZ
	HTIc6NuJyKklMd+QU9u2/hNa7OPz+NrHawp6G7hy/YRyvEzl/rEu70UPdk1RVso1L2UjrtHIl5t0b
	87qMJxLD5jh/4bm1sly8KDayPh2rK9ty99OTbff+zFDBd703qed/X+lq9TmwMWvAbqQVwk+Q2iJ6k
	ZE7aR6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lV-00000001snO-24Tg;
	Fri, 09 Jan 2026 08:22:37 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lK-00000001sZS-4360
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:22:30 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47d3ba3a49cso34841665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 00:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946944; x=1768551744; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aoza9Haxbx5GFTKXR2e7jJHN2DZHptcSpiNA0k5YVqc=;
        b=ti96EGaqsyxzWZHMqzgKeXOctVXKlX4wavtXdlXrIlBf4ojG+OswKPcE0GrKJ6ojnQ
         WLTYNnm7obd5QlejkhdCgCuVw4QO7qKXthGwfbxJ9n7kFRMnf0prGSYFD2fVesYXgv+a
         Q78igzSC7fRO3nOGROHILvNq4QqEpu/kbRa8uuTjR5577nFHCFixcJMrhHSYVCg3nNZh
         meC6lL6MvUPk5FCtrz8d1guQkxI2r7T7ZN/278Rmd7C5ojHTbx/H0/8KTktPmgXeCkq3
         onr+StImqs9pPMF9lRhQpOI3jNxBgW5k6QxpQj/0YHTkTqK0JOcv3fJYxkKdiuMBsx4t
         ZdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946944; x=1768551744;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aoza9Haxbx5GFTKXR2e7jJHN2DZHptcSpiNA0k5YVqc=;
        b=dWEh70e9BTwPo+akjuxpwAYxZ+z8JCB27jW0e8CzPjDN9GyqiIODpjGPVqNXsv62dx
         tAUSMu8irnNY1qyj7c0FG1dpaUNcT6rE8K7uA8KEDq338Tnp42+nRfCoTz/yaIEnEckN
         Jy98pqX0exROprePHWXDx6xYmM8zj4Ikn/GWLjoZSkLxL7AittfZgU5X2N87EaglSfOb
         PI1ifHrExD4MVwJcb0JXuNIX/2pHO4ViM5kzv0qInDxWQ3QOwKPKSjOAXwRmCtl+X2hJ
         euh3Tcukash6nBpCfaH+qpl92Vh704TNfXZh3afOh4+Sc80eZ5LcAZmlnsaLwTfnaoKk
         4dNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV34pBeucM4dzVKj26CDJiu30dUcLwCHkNQUBNUhJ0L/GZ5u8YoXkgRV0zcpQdt0TT7Ni8X+ZYv3Dlwblt5oS5n@lists.infradead.org
X-Gm-Message-State: AOJu0YwLLUC3fllICsIf4KN3n+0G564bt0iAXTUl6KRkpt/V59V/MK+i
	8ivYeBPFGb5YPh+t2eSgXAsSqvp0VXR+DENxVjMnIDSoX4kEEBsQfoadETW5iyJ6Vc14lYmr4mC
	D1w==
X-Google-Smtp-Source: AGHT+IHW9z0RPtuJdgNq8q1u7Cdds1c5PfbSHvpUeu/W5K7Hz57K1sxTcMubWIfqET+Z4aJyqUaOS37UlQ==
X-Received: from wmpj3.prod.google.com ([2002:a05:600c:4883:b0:477:7949:c534])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c3cd:20b0:477:af07:dd21
 with SMTP id 5b1f17b1804b1-47d8a17124bmr45924505e9.25.1767946944632; Fri, 09
 Jan 2026 00:22:24 -0800 (PST)
Date: Fri,  9 Jan 2026 08:22:18 +0000
In-Reply-To: <20260109082218.3236580-1-tabba@google.com>
Mime-Version: 1.0
References: <20260109082218.3236580-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082218.3236580-6-tabba@google.com>
Subject: [PATCH v4 5/5] KVM: selftests: Fix typos and stale comments in kvm_util
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
X-CRM114-CacheID: sfid-20260109_002227_070768_B5E19455 
X-CRM114-Status: GOOD (  14.91  )
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
index 747effa614f1..97f9251eb073 100644
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
@@ -1264,7 +1264,7 @@ static inline uint64_t vm_page_align(struct kvm_vm *vm, uint64_t v)
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
2.52.0.457.g6b5491de43-goog


