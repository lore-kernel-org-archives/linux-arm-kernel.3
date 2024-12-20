Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDB7E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 01:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cRDKUGnjPxUGgjTzF3qCkNkq62oEn2vSDO7JvD7Kppc=; b=DYwlfE3QAVmTsWA79pSFcIzdW0
	4ECW7nUYTYJ8siUBE6uNi3uwdiQ8fqikKdzDSieM1uUxZWD1XTdzKmQU6NwAA01Po7yNJ1lRQYsfz
	fwfR4MLozdNmuHOfbuW0ZjQ67iF6II+C5hm3iAu46V12amIqk5Jy3Fj1HHMFscD5VADqJssLFKDQx
	vlFJM6r6BhjhGUY/+TbxjV+4qvoT08R7Swd9/F8o05y9KWH9UAduFiGXeKJH2nysNimzOGZ+gZdEI
	N0CF2IBAPTmXZKJT4isfkgPdsXHYtqkVxt5ZyauTIjx/4apLeEc6IT99xD7WcRLupMbLayuxGGc17
	zzizELSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS06-00000003dN5-36HW;
	Fri, 20 Dec 2024 01:40:22 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORyw-00000003cu9-172W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:11 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-728e4bdd69eso2045178b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 17:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658748; x=1735263548; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRDKUGnjPxUGgjTzF3qCkNkq62oEn2vSDO7JvD7Kppc=;
        b=qk/Sq3DiZSqeXGi7Z5fuEGD6Q3ZERX8u1jmp77w6gBOmEv5uQwxdiDXl0rz0q5a7oC
         95Q9VUp2qe7O7fglWC+7QOJ7ASFVCGVYsj8bw6HXkWbyNtHnOVPuMeG8k66y4pzxROIK
         QkqHpKIVXcjTAVU2FZ7DuVp0+xm5vSp8e4WZqYoS8nFqOd/Bv9rYQbancoX7yXC5m+9D
         BjfBWQ0EZkVtTXW1VgUwFkWRhuK/GFUpYD88Fx/VnxuVTSKdyM0cXgSX58wHmk6Ddfu9
         ZWtEspSCsaZilTDEjNwn8/2ah5x/x+6cuLvW0hE/WLf+gXKxvc4KI/mLYTTxlajO0cpj
         jPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658748; x=1735263548;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRDKUGnjPxUGgjTzF3qCkNkq62oEn2vSDO7JvD7Kppc=;
        b=EcGRKb+Z/vEMUNXATTzWcj+2TjALOe9fIX16tGuPV2EzLG0yceLA7TgmmratP6nogP
         dK2FAe4w6+6X3swirbVFojV6q34bl5MP5At0KbXjnIGUzYHWeEaeyp/yDAw7Bo4ZlSw3
         gt0pTX04Eg7GX/4A8DLM2cJEG84fC6fnA5B0NPFUI+C3aTiBOMyhdfXej9Sgnep6qABx
         Twq2yGuDcvxWhmKjsEFQZaaAOl3Y9xpNPlhnytja+2Mvh66904D08P2nAmStZpRYP0wV
         EypHYAVyNAzWsIexUXZ6lB6QZG+hTuVjIYfCxBFtUgK6GaA4T5ed/2QmtiYe7bqifLO7
         E5hA==
X-Gm-Message-State: AOJu0YzQMhF4JjPahMGOTCNDdTut6ncFusfAxPYRGxdNHHxp2JyrNDiU
	TQWAZY0PL6XWC1MiwZX+//l0Sv/iMMZzAwjgfUfKEwQzfqOqTiRpuXD5QSRKEUPAiEfUwAZvzWY
	dOw==
X-Google-Smtp-Source: AGHT+IGKk1u1qooE3KT9EvHF6/wnmuA9XWAa8TXLf9DPPdKposqbF1SIF5jz7mHb6qxYFc6rf04T8dQlWu4=
X-Received: from pgbda1.prod.google.com ([2002:a05:6a02:2381:b0:7fd:4bf0:25fa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa6:b0:1e3:c763:74d4
 with SMTP id adf61e73a8af0-1e5c6d6b62dmr8239281637.0.1734658748516; Thu, 19
 Dec 2024 17:39:08 -0800 (PST)
Date: Thu, 19 Dec 2024 17:38:58 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-1-seanjc@google.com>
Subject: [PATCH 0/8] KVM: selftests: Binary stats fixes and infra updates
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173910_330323_EAA6BCD8 
X-CRM114-Status: GOOD (  10.29  )
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

Fix a handful of bugs in the binary stats infrastructure, expand support
to vCPU-scoped stats, enumerate all KVM stats in selftests, and use the
enumerated stats to assert at compile-time that {vm,vcpu}_get_stat() is
getting a stat that actually exists.

Most of the bugs are benign, and AFAICT, none actually cause problems in
the current code base.  The worst of the bugs is lack of validation that
the requested stat actually exists, which is quite annoying if someone
fat fingers a stat name, tries to get a vCPU stat on a VM FD, etc.

FWIW, I'm not entirely convinced enumerating all stats is worth doing in
selftests.  It seems nice to have?  But I don't know that it'll be worth
the maintenance cost.  It was easy enough to implement, so here it is...

Sean Christopherson (8):
  KVM: selftests: Fix mostly theoretical leak of VM's binary stats FD
  KVM: selftests: Close VM's binary stats FD when releasing VM
  KVM: selftests: Assert that __vm_get_stat() actually finds a stat
  KVM: selftests: Macrofy vm_get_stat() to auto-generate stat name
    string
  KVM: selftests: Add struct and helpers to wrap binary stats cache
  KVM: selftests: Get VM's binary stats FD when opening VM
  KVM: selftests: Add infrastructure for getting vCPU binary stats
  KVM: selftests: Add compile-time assertions to guard against stats
    typos

Sean Christopherson (8):
  KVM: selftests: Fix mostly theoretical leak of VM's binary stats FD
  KVM: selftests: Close VM's binary stats FD when releasing VM
  KVM: selftests: Assert that __vm_get_stat() actually finds a stat
  KVM: selftests: Macrofy vm_get_stat() to auto-generate stat name
    string
  KVM: selftests: Add struct and helpers to wrap binary stats cache
  KVM: selftests: Get VM's binary stats FD when opening VM
  KVM: selftests: Add infrastructure for getting vCPU binary stats
  KVM: selftests: Add compile-time assertions to guard against stats
    typos

 .../kvm/include/arm64/kvm_util_arch.h         |  12 ++
 .../testing/selftests/kvm/include/kvm_util.h  |  49 ++++++--
 .../selftests/kvm/include/kvm_util_types.h    |   6 +
 .../kvm/include/riscv/kvm_util_arch.h         |  14 +++
 .../kvm/include/s390/kvm_util_arch.h          | 113 ++++++++++++++++++
 .../selftests/kvm/include/x86/kvm_util_arch.h |  52 ++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  79 ++++++------
 .../kvm/x86/dirty_log_page_splitting_test.c   |   6 +-
 .../selftests/kvm/x86/nx_huge_pages_test.c    |   4 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |   2 +
 10 files changed, 286 insertions(+), 51 deletions(-)


base-commit: dcab55cef6f247a71a75a239d4063018dc83a671
-- 
2.47.1.613.gc27f4b7a9f-goog


