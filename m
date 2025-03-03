Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04847C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gNjkZXsFxPWFMyK2OgocbrFn2IS3HWHLODQTFVqVxX4=; b=ScoGFdg63rnNikn6N4/TD/HnP9
	EwYPF9dm/0d91aDH7MswZ8IRfY9BNwjzlrIdwgZ5GwjjuvJw4d5EhYMnVXbqCuOe1LUq0Fe4U6QFp
	2gilF21Q6qUUNbCobk/71gqFCJpT+perfz78qXEcqJYwWxKj73qdQW83qUr5Cy1BPoIh0h4V38L/x
	6SgX8x0zop4Rvdhtf5BiDUMMKRaQiHAauROL+GzIeJwTp9aaQnekGAzHTIFr3LDes4wSlxTNlpQZu
	OH9UiS+Ny2bnUy9AhSY4LE1h9SKC2AwwrAtj526vxOG440MS0j4pQNh2lll1hqu/kyqum7h9/bnkI
	rSfVM+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6Dl-00000000zJn-48nY;
	Mon, 03 Mar 2025 13:52:37 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5sL-00000000vLx-3wOo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:30:32 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-22349dc31bcso75967235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741008629; x=1741613429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gNjkZXsFxPWFMyK2OgocbrFn2IS3HWHLODQTFVqVxX4=;
        b=A4qmJfOrCA4+EE+FGjRhCUXVNRxz/BHUBEXECnY8bmNe3fgMsghSmnOhoYlQ/Y/jXA
         2/FoL11U9ThdDlKc4uBGQ1ZPRhCb/l1UPSm6czNbcK0Xj1bGWxCnaQPRf45Vx0G6sUoz
         M6x36Zl1qOBfdWB/c2eTp5KAerBsGSB6V/q7Yv7gg0E9MJVe9ZjLJm9h5O8UtZWiorf0
         rGjVflw8/qarCJFAj1/jg3IfLxJVnkswOVKBp7EEpO/NR1P7gq9f0aHakk8Zk6P6OdcS
         /BJSzZ8vNhIVU5PMDty1MeyDWAKJ0wCpcHd/zerdB6a7XTYMJI9GgE96YIlmZAZIMK/C
         uUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008629; x=1741613429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNjkZXsFxPWFMyK2OgocbrFn2IS3HWHLODQTFVqVxX4=;
        b=d8z+zh3/M3UtN+08DeO5jXZRW50RIotHuSL1yKHMaVKtDnVms/PEkp29NaUq+8O4o3
         4Blne+Hr099gtfNMFjXgm0XPTG/7dNCmQzozL8TY2N+cm5tLDm/zg/1PZ8B7Nh97L5Nz
         5FMOHeXpwl99rOI8dwQOVKQoJjnMnxWXSsgVzFgCVeBaftaOxatQ9b5WXQJsqoyQODWR
         G3zt9O+k3HUVjVa55cBnHuO9mCgvnzIXoJV2z/sb4/jfHFGr8E1qH1rL4H1EhvgAcjlw
         pXb52Ht2dIUwJLq0qxHlFOwhIK4PMPCdtPAlnHT0u31DVsT7ARJAmC2VmyQ7xYVvnlpO
         Pmzw==
X-Forwarded-Encrypted: i=1; AJvYcCUWY665v4JT1kZEG2j+79q4UFS0WZw5pe5mHqMuiffltjhOq7PHegVvfwWlyT7GMwWg7m43Pxj4qso+3LpTbKa7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3nkF59NkOCLSntHPxuq0cWvho/PI1AE2EVt0NUqoXLxiS1uRS
	8IjT5bUtnudLDyLQllcwrFlMCgEFlrVKM6yPUMufJDBYNRio5Fwk
X-Gm-Gg: ASbGncudnDunly5HJKNHjsFXXu7ZQaiNbGDnzyZw8gKvs84yXmyKAcq/NIl7hAIQfpv
	VkLNeoIxe3IH7odubu2HtnFPPRXq+BYrwHZKNJ0DzcZruhqg3ejfiP+dj5it8ijyh18cwJtM3MY
	Fi7X9YcwImyGwizzfZT0weXTPA3IW+iBZ7SYt3Z9uYOdwUZuBsL/CAU/XYptAna3Q2DMVCPrvAJ
	HL/pM/jDVXdbhynwXvb90mES0DqWyJJvXyMdwQtnaWGSYBji636fw75TYqqyhe6pqFd53Q9/Dd+
	nhay4dp0SrJUnqE+0a7vdDP/JO0wSVrzuZFIvnLsLWc2C4IRffg5H03hx+QFHw==
X-Google-Smtp-Source: AGHT+IGzwQpz8i9IoNIFYRlZqYmQzdkErFQv2wnbEGpUy1JVrV1T6QdikCneYnb/qYuevmlNGOS4BA==
X-Received: by 2002:a17:903:244d:b0:210:fce4:11ec with SMTP id d9443c01a7336-22368f6a5f1mr188695035ad.1.1741008628736;
        Mon, 03 Mar 2025 05:30:28 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505359b8sm77297035ad.253.2025.03.03.05.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:30:28 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: peterz@infradead.org,
	rostedt@goodmis.org,
	mark.rutland@arm.com,
	alexei.starovoitov@gmail.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mhiramat@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	jolsa@kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	samitolvanen@google.com,
	kees@kernel.org,
	dongml2@chinatelecom.cn,
	akpm@linux-foundation.org,
	riel@surriel.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v4 0/4] per-function storage support
Date: Mon,  3 Mar 2025 21:28:33 +0800
Message-Id: <20250303132837.498938-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_053029_977315_F41EEC1B 
X-CRM114-Status: GOOD (  17.30  )
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

For now, there isn't a way to set and get per-function metadata with
a low overhead, which is not convenient for some situations. Take
BPF trampoline for example, we need to create a trampoline for each
kernel function, as we have to store some information of the function
to the trampoline, such as BPF progs, function arg count, etc. The
performance overhead and memory consumption can be higher to create
these trampolines. With the supporting of per-function metadata storage,
we can store these information to the metadata, and create a global BPF
trampoline for all the kernel functions. In the global trampoline, we
get the information that we need from the function metadata through the
ip (function address) with almost no overhead.

Another beneficiary can be ftrace. For now, all the kernel functions that
are enabled by dynamic ftrace will be added to a filter hash if there are
more than one callbacks. And hash lookup will happen when the traced
functions are called, which has an impact on the performance, see
__ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
metadata supporting, we can store the information that if the callback is
enabled on the kernel function to the metadata.

In the 1st patch, we factor out FINEIBT_INSN_OFFSET and CFI_INSN_OFFSET to
make fineibt works when the kernel function is 32-bytes aligned.

In the 2nd patch, we implement the per-function metadata storage by
storing the index of the metadata to the function padding space.

In the 3rd and 4th patch, we implement the per-function metadata storage
for x86 and arm64. And in the feature, we can support more arch.

Changes since V3:
- rebase to the newest tip/x86/core, the fineibt has some updating

Changes since V2:
- split the patch into a series.
- considering the effect to cfi and fineibt and introduce the 1st patch.

Changes since V1:
- add supporting for arm64
- split out arch relevant code
- refactor the commit log

Menglong Dong (4):
  x86/ibt: factor out cfi and fineibt offset
  add per-function metadata storage support
  x86: implement per-function metadata storage for x86
  arm64: implement per-function metadata storage for arm64

 arch/arm64/Kconfig              |  15 ++
 arch/arm64/Makefile             |  23 ++-
 arch/arm64/include/asm/ftrace.h |  34 +++++
 arch/arm64/kernel/ftrace.c      |  13 +-
 arch/x86/Kconfig                |  18 +++
 arch/x86/include/asm/cfi.h      |  13 +-
 arch/x86/include/asm/ftrace.h   |  54 ++++++++
 arch/x86/kernel/alternative.c   |  18 ++-
 arch/x86/net/bpf_jit_comp.c     |  22 +--
 include/linux/kfunc_md.h        |  25 ++++
 kernel/Makefile                 |   1 +
 kernel/trace/Makefile           |   1 +
 kernel/trace/kfunc_md.c         | 239 ++++++++++++++++++++++++++++++++
 13 files changed, 450 insertions(+), 26 deletions(-)
 create mode 100644 include/linux/kfunc_md.h
 create mode 100644 kernel/trace/kfunc_md.c

-- 
2.39.5


