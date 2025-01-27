Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A35C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pei6TS7zN6KpP575svXWNqasjmENv16fLc/niEfJAUg=; b=AnLTb1NcGyXCnkY71AesnrWFe9
	tdUDy05XYF7E0db/huJtbK+cMPKqmrkv+kymlW1J0fQdtA7tUvYUWioqD6sitRkHPiDd8Br/MJJ//
	zqXWMpOeDxJ4CedTo2VNUPH4MwQe5ELGLOOH3OIaBIM0SZ61Ye8z3QC1WrhAAQ2bDEpZ6mmZY8Hkl
	xpqGfVrdn5qV3mq5DWP0dy1C3nbQjaKjYQF55JPhutV4EpfSoxGsVdAANrRj7f2UHBLfROMULSAji
	Ma5QvoGPHgfYwX8OmAVmkgrbS/CM0N+i7Uj/CGeSoLVvsT/YcmGLnn5B5egOaPdM+xz6UHe2Og/yt
	S+E8rFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWlc-00000003Jks-154g;
	Mon, 27 Jan 2025 21:35:36 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWjS-00000003J68-06yv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:33:23 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2178115051dso90033505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738013600; x=1738618400; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pei6TS7zN6KpP575svXWNqasjmENv16fLc/niEfJAUg=;
        b=n38YH6Cnb2RwFSauXsTfIcod2kSnBy1TFuiVyvlDNdjGutnpdZqSUkbfxqHAHMOfom
         3SwOrZjNwe23mzwywJYEf8EH4+8Km0Hd90q1mjpvra2vVM2QTXLnQGvgeoBl0ju8AtTp
         Kasyr9FG47AHokbp4vkQEvypNXmTmb+cWhUZ1kJfDUtOKqYtjYZzTixubp0/K3DmckN2
         IOSgdV2OegaywFe68MBe3uyYdRcMwDzDE8lXHkwr/FbgVkyxdCmpFlKUC/nZNBfOQZ30
         zvBwWXbx5fQpwxObXdLuuZz79hFf21UZLOTXf04nABeI7SvSDwrodM/n5TvJwKL/ov09
         9ZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013600; x=1738618400;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pei6TS7zN6KpP575svXWNqasjmENv16fLc/niEfJAUg=;
        b=Q6pM4wT5mbj+YjqLo3ADVvBSSqC6/43Fi3Dz1ZHW/a2dHotqfJLCfeADpi/qLcgs1z
         NwpCd0Q6sDHfZEa5j0Igzuleg2lbFfOx+OqUT9i9XuC6Rsdpex19km2Z3EzhMJFo2uF4
         u0EBzYMg/7kZA8/4Hcck2pfLHivDh+iU2s/jH6uEygu8BHjxht3SXVZaCCYMpGcjanlo
         CiYH5ZQ1IhgVbCUBg3Iop4Et+bWb2BB2eCmLLvt3hyOGOELF5xHJe9WwncYMVn5Wpn8U
         c8IhbrsER3hni4553Ldyn2B4EtnxCziZwQcnh8FA2x0jlN4Ubcq5S4eddK94xAxknqen
         71eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt33Av4H/5y2eoiXgPQFrfuucHJvlahYhXZ5AlipQ+tNuks51bnqlp2aOjmYyo+ZOA6MpSRvJo81/kmie5fwbO@lists.infradead.org
X-Gm-Message-State: AOJu0YzIACIMMam+LMUPhm47JCPhBq9575aPgT1tSQQ509fTBprP9fN6
	ERktGNbPNpPDPTC/RLTkOpzbptOg+rHCB+6GgrI8tmqvGSDk8QD76mqcafKnxzcyfSW8ScTRiA=
	=
X-Google-Smtp-Source: AGHT+IFd/Wq1OyJXHy44vPMMF9MYBDoQ3usrOzSenxsbZ2jr85PaygJtYqioTPHpK2O5SR75d+WNNDbIww==
X-Received: from pgbbk3.prod.google.com ([2002:a05:6a02:283:b0:7fd:55d9:1f1a])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:394b:b0:1e5:a0d8:5a33
 with SMTP id adf61e73a8af0-1eb21480ef0mr71993744637.18.1738013600344; Mon, 27
 Jan 2025 13:33:20 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127213310.2496133-1-wnliu@google.com>
Subject: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
From: Weinan Liu <wnliu@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Weinan Liu <wnliu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_133322_064437_D7687291 
X-CRM114-Status: GOOD (  13.64  )
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

This patchset implements a generic kernel sframe-based [1] unwinder.
The main goal is to support reliable stacktraces on arm64.

On x86 orc unwinder provides reliable stacktraces. But arm64 misses the
required support from objtool: it cannot generate orc unwind tables for
arm64.

Currently, there's already a sframe unwinder proposed for userspace: [2].
Since the sframe unwind table algorithm is similar, these two proposal
could integrate common functionality in the future.

There are some incomplete features or challenges:
  - The unwinder doesn't yet work with kernel modules. The `start_addr` of
    FRE from kernel modules doesn't appear correct, preventing us from
    unwinding functions from kernel modules.
  - Currently, only GCC supports sframe.

Ref:
[1]: https://sourceware.org/binutils/docs/sframe-spec.html
[2]: https://lore.kernel.org/lkml/cover.1730150953.git.jpoimboe@kernel.org/

Madhavan T. Venkataraman (1):
  arm64: Define TIF_PATCH_PENDING for livepatch

Weinan Liu (7):
  unwind: build kernel with sframe info
  arm64: entry: add unwind info for various kernel entries
  unwind: add sframe v2 header
  unwind: Implement generic sframe unwinder library
  unwind: arm64: Add sframe unwinder on arm64
  unwind: arm64: add reliable stacktrace support for arm64
  arm64: Enable livepatch for ARM64

 Makefile                                   |   6 +
 arch/Kconfig                               |   8 +
 arch/arm64/Kconfig                         |   3 +
 arch/arm64/Kconfig.debug                   |  10 +
 arch/arm64/include/asm/stacktrace/common.h |   6 +
 arch/arm64/include/asm/thread_info.h       |   4 +-
 arch/arm64/kernel/entry-common.c           |   4 +
 arch/arm64/kernel/entry.S                  |  10 +
 arch/arm64/kernel/setup.c                  |   2 +
 arch/arm64/kernel/stacktrace.c             | 102 ++++++++++
 include/asm-generic/vmlinux.lds.h          |  12 ++
 include/linux/sframe_lookup.h              |  43 +++++
 kernel/Makefile                            |   1 +
 kernel/sframe.h                            | 215 +++++++++++++++++++++
 kernel/sframe_lookup.c                     | 196 +++++++++++++++++++
 15 files changed, 621 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/sframe_lookup.h
 create mode 100644 kernel/sframe.h
 create mode 100644 kernel/sframe_lookup.c

-- 
2.48.1.262.g85cc9f2d1e-goog


