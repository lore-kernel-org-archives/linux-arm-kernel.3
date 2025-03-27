Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2C1C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9og7QHW7yZ4FvbucctyT5rc0uqSsMWzyqs7LNH+w4zk=; b=anhkedN8+DWjo3qcJyeiFuyRuS
	cziaR3NhyW7lNwuSkSsWGZ0XtvAjKl+yJbhqnYbNkr0/ScGOWZ4M/hWNINzGWUZvJ6FZxfVSQW3zW
	mJim8/z93UM3ZJHt9Zjtw+D9OxGTMdHAA3r/ePxVcxdJFQ0OWs8pVEx04z0xSCVmxLaVfpsL/BeRs
	Z0eemj4i/tJeemSZ4se10CVy5hDWb9wkV0ndx7nm9XO6WauWfPpPp6ZWjbe3AhY1EF/y7JAz9fhCG
	aIDUZcOTNZFAiS5IoA4qYq/hXu/C917T++Hp7IsMrjenCyTYQmddA/mGM4YcJH0pf+sa+rTJzlZIq
	qgN0e7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoj0-0000000BIKx-1JO4;
	Thu, 27 Mar 2025 15:00:54 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoWz-0000000BFvv-1xX5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:48:30 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-47690a4ec97so11236831cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743086908; x=1743691708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9og7QHW7yZ4FvbucctyT5rc0uqSsMWzyqs7LNH+w4zk=;
        b=RD/e8deu6H5A3Mf/H2fnJb5ghIMEa9rreKaXGLPNNEOMGl59B5P2ShsRwjDsAYiPAD
         Vx2TYghXvYZK0W8dx7ARTus/ShR/AsfCcsLZ3dvbxm9Lf7RxZzSn82oQPFTbz0Uu30UI
         R+HQnPZER9HKQs1rCGLJG+25qg8XH7R2UZyH6yeF/I1CzSpSK5x8kif9v1EuxLf628Jc
         mUfjr9T77B/ClVvRvM8VRbS8I1FFzSjMA18Ck+o0gEnCDycWTI8XXUHpyLscaHQrJb6w
         SsqYMf+okBxpvseLUTrUcsRHWQ7C2OV6yqmfReb05XZ7md/rr762E7EEFkvRf00pmUcT
         78fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086908; x=1743691708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9og7QHW7yZ4FvbucctyT5rc0uqSsMWzyqs7LNH+w4zk=;
        b=mwYq+H6qcyBdlQAcVhd7qVuZrq8nET3wyhTF5f7ecELGJK0wJHM8ltn0MOY8siMWvy
         vlRV43S7EHp+TymgiAla3mfYRuBJyKNJh7//lbxN5XncgGFFR+upmT7iEwtBvzJ6lkhr
         LUbaOA8o91IKQT/MW5He72StKECObF8W1N2pk5clUoZW7GBaDirreS9HpQK43Cky/w0d
         x6U++a8ukDHDy/QgVofwUD3OM/NoCkzTNzIXQrQwBHsjJFj5yqBYny7uvuchx2JsNOAD
         IQ+EshmC6JS4NLh+MY7qvgU/4bhFiu3sczYybhGIkn3Gqy1xCyr/RDXXAmLNdYvvKs5I
         FrMg==
X-Forwarded-Encrypted: i=1; AJvYcCVTcnOWECaAuyA0PR3ZIoPvzCJtGiTewgXUwQ+n2xI5tVKb7m258j74Xhs2VUQz5xiYg5qroTD5jXpY3oTmj2qX@lists.infradead.org
X-Gm-Message-State: AOJu0YyAONtpC5fq1SfSmzfSCddcZ+EBskWmsAI6AYacxZyDadU02M7L
	FpO5m+ShcoaVvGfImGHGoqhsT4ZeYicxsmTkzFJlRdytWFjf+Jrh
X-Gm-Gg: ASbGncumi4r6zec6Z3RwenyQJv0c8YRgBq/vE5VHG3M/ggg/liU+cCmVaimMWjMMy/j
	OjBL4sQr9X6u18/AD+XUFOgk7YuTonoeMQwvNoYVXY7dKNw7oJHcF/yHUFsxmZxvK4HYgk+M0cY
	DiIguJPzeT29Ygk/GQ7pzYtPDL9nx3D4CBQ/zfaFsq7OUXa8StB8TxoczW93zNVV0Rpowi6hdOJ
	s2amcYJeVCWzNtg5Y7mHfFe708GpTKMduTWI0jBn1fHBPsOfkUluv63oU4HdHUcAg/OxDkqbs3J
	ahn0aLagNSl8Ewm/Ow/m/27ddelGkNjHAipA3WN5uYHmacjbUBXp8IiB001+EYPvtxUnUL+1LP+
	ytF4r1nAXL8NM9tRu9AuWbNoUBDdK2hce+kJP1CqYsiGf2g==
X-Google-Smtp-Source: AGHT+IFZ0iTeup043Uaqa4k8vNniJp3yD6375e4R3nCqSubhPSwoSDkhZWAnx74Ht6mOe6vI5TarXg==
X-Received: by 2002:a05:6214:2483:b0:6d8:b3a7:75a5 with SMTP id 6a1803df08f44-6ed2399af9emr61996706d6.42.1743086907453;
        Thu, 27 Mar 2025 07:48:27 -0700 (PDT)
Received: from localhost.localdomain (219.sub-174-198-10.myvzw.com. [174.198.10.219])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9645d1esm115796d6.35.2025.03.27.07.48.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Mar 2025 07:48:26 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: torvalds@linux-foundation.org
Cc: bpf@vger.kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@kernel.org,
	peterz@infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] BPF resilient spin_lock for 6.15
Date: Thu, 27 Mar 2025 10:48:23 -0400
Message-Id: <20250327144823.99186-1-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074829_509119_649B59F6 
X-CRM114-Status: GOOD (  20.06  )
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

Hi Linus,

The following changes since commit ae0a457f5d33c336f3c4259a258f8b537531a04b:

  bpf: Make perf_event_read_output accessible in all program types. (2025-03-18 10:21:59 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git tags/bpf_res_spin_lock

for you to fetch changes up to 6ffb9017e9329168b3b4216d15def8e78e1b1fac:

  Merge branch 'resilient-queued-spin-lock' (2025-03-19 08:03:06 -0700)

----------------------------------------------------------------
Please merge this pull request after main BPF changes.

This patch set introduces Resilient Queued Spin Lock (or rqspinlock with
res_spin_lock() and res_spin_unlock() APIs).

This is a qspinlock variant which recovers the kernel from a stalled
state when the lock acquisition path cannot make forward progress. This
can occur when a lock acquisition attempt enters a deadlock situation
(e.g. AA, or ABBA), or more generally, when the owner of the lock (which
we’re trying to acquire) isn’t making forward progress.
Deadlock detection is the main mechanism used to provide instant recovery,
with the timeout mechanism acting as a final line of defense. Detection is
triggered immediately when beginning the waiting loop of a lock slow path.

Additionally, BPF programs attached to different parts of the kernel
can introduce new control flow into the kernel, which increases the
likelihood of deadlocks in code not written to handle reentrancy. There
have been multiple syzbot reports surfacing deadlocks in internal kernel
code due to the diverse ways in which BPF programs can be attached to
different parts of the kernel.  By switching the BPF subsystem’s lock
usage to rqspinlock, all of these issues are mitigated at runtime.

This spin lock implementation allows BPF maps to become safer and remove
mechanisms that have fallen short in assuring safety when nesting
programs in arbitrary ways in the same context or across different
contexts.

We run benchmarks that stress locking scalability and perform comparison
against the baseline (qspinlock). For the rqspinlock case, we replace
the default qspinlock with it in the kernel, such that all spin locks in
the kernel use the rqspinlock slow path. As such, benchmarks that stress
kernel spin locks end up exercising rqspinlock.

More details in the merge commit cover letter.

In this patchset we convert BPF hashtab, LPM, and percpu_freelist
to res_spin_lock:
  kernel/bpf/hashtab.c         | 102 ++++++++++++++++++++++++-----------
  kernel/bpf/lpm_trie.c        |  25 ++++++++++-----------
  kernel/bpf/percpu_freelist.c | 113 +++++++++++++++++------------------
  kernel/bpf/percpu_freelist.h |   4 ++--
  4 files changed, 73 insertions(+), 171 deletions(-)

Other BPF mechansims: queue_stack, local storage, ringbuf
will be converted in the follow-ups.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
----------------------------------------------------------------
Alexei Starovoitov (1):
      Merge branch 'resilient-queued-spin-lock'

Kumar Kartikeya Dwivedi (24):
      locking: Move MCS struct definition to public header
      locking: Move common qspinlock helpers to a private header
      locking: Allow obtaining result of arch_mcs_spin_lock_contended
      locking: Copy out qspinlock.c to kernel/bpf/rqspinlock.c
      rqspinlock: Add rqspinlock.h header
      rqspinlock: Drop PV and virtualization support
      rqspinlock: Add support for timeouts
      rqspinlock: Hardcode cond_acquire loops for arm64
      rqspinlock: Protect pending bit owners from stalls
      rqspinlock: Protect waiters in queue from stalls
      rqspinlock: Protect waiters in trylock fallback from stalls
      rqspinlock: Add deadlock detection and recovery
      rqspinlock: Add a test-and-set fallback
      rqspinlock: Add basic support for CONFIG_PARAVIRT
      rqspinlock: Add macros for rqspinlock usage
      rqspinlock: Add entry to Makefile, MAINTAINERS
      rqspinlock: Add locktorture support
      bpf: Convert hashtab.c to rqspinlock
      bpf: Convert percpu_freelist.c to rqspinlock
      bpf: Convert lpm_trie.c to rqspinlock
      bpf: Introduce rqspinlock kfuncs
      bpf: Implement verifier support for rqspinlock
      bpf: Maintain FIFO property for rqspinlock unlock
      selftests/bpf: Add tests for rqspinlock

 MAINTAINERS                                        |   2 +
 arch/arm64/include/asm/rqspinlock.h                |  93 +++
 arch/x86/include/asm/rqspinlock.h                  |  33 +
 include/asm-generic/Kbuild                         |   1 +
 include/asm-generic/mcs_spinlock.h                 |   6 +
 include/asm-generic/rqspinlock.h                   | 250 +++++++
 include/linux/bpf.h                                |  10 +
 include/linux/bpf_verifier.h                       |  19 +-
 kernel/bpf/Makefile                                |   2 +-
 kernel/bpf/btf.c                                   |  26 +-
 kernel/bpf/hashtab.c                               | 102 +--
 kernel/bpf/lpm_trie.c                              |  25 +-
 kernel/bpf/percpu_freelist.c                       | 113 +---
 kernel/bpf/percpu_freelist.h                       |   4 +-
 kernel/bpf/rqspinlock.c                            | 737 +++++++++++++++++++++
 kernel/bpf/rqspinlock.h                            |  48 ++
 kernel/bpf/syscall.c                               |   6 +-
 kernel/bpf/verifier.c                              | 248 +++++--
 kernel/locking/lock_events_list.h                  |   5 +
 kernel/locking/locktorture.c                       |  57 ++
 kernel/locking/mcs_spinlock.h                      |  10 +-
 kernel/locking/qspinlock.c                         | 193 +-----
 kernel/locking/qspinlock.h                         | 201 ++++++
 .../selftests/bpf/prog_tests/res_spin_lock.c       |  98 +++
 tools/testing/selftests/bpf/progs/irq.c            |  53 ++
 tools/testing/selftests/bpf/progs/res_spin_lock.c  | 143 ++++
 .../selftests/bpf/progs/res_spin_lock_fail.c       | 244 +++++++
 27 files changed, 2312 insertions(+), 417 deletions(-)
 create mode 100644 arch/arm64/include/asm/rqspinlock.h
 create mode 100644 arch/x86/include/asm/rqspinlock.h
 create mode 100644 include/asm-generic/rqspinlock.h
 create mode 100644 kernel/bpf/rqspinlock.c
 create mode 100644 kernel/bpf/rqspinlock.h
 create mode 100644 kernel/locking/qspinlock.h
 create mode 100644 tools/testing/selftests/bpf/prog_tests/res_spin_lock.c
 create mode 100644 tools/testing/selftests/bpf/progs/res_spin_lock.c
 create mode 100644 tools/testing/selftests/bpf/progs/res_spin_lock_fail.c

