Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EC2F34C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6D0e/cuow2udIW1NJbpNY3L426VIkd2ZBjeoiqRQiXE=; b=BsTdurcCkGn7kf8wIl+dyEl90C
	jCupsCaUYPqoHJZoa54rwo9MdiKk5CHUdWdoUlvvYFiKuqSWfsYDGpMNKp7olDNQMtIkw65GlO/1c
	ynudxA1AiO+4lnr+0lr3Ddb0oYtUNKIZWjNvMgJLDmBWGFzNakr7rhFHqVWOESwyH7oud+EJQ1AKm
	UxbDCY+6227LsZb2dpDbgqze8dSr0e7waumg7Oa1ZSGkabFIXhpQ8RYHpqNuobGj5foyJBVHJdWDV
	mAxmwnKhxH4Dgik4PmJJtSGEqp7FLTgdKqtDnQYvgLViAbMcxAAf9RPlVMuJde74WJuW4zh4vAilU
	CnpMt8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGTr-0000000FeQ3-27kE;
	Mon, 13 Apr 2026 12:33:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGTo-0000000FePd-28bq;
	Mon, 13 Apr 2026 12:33:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4411240A90;
	Mon, 13 Apr 2026 12:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E2CC2BCAF;
	Mon, 13 Apr 2026 12:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776083607;
	bh=wDEfO/xa61/CEJ6jniOSKCwWHmjQlG9qEwI4fGV3AGc=;
	h=From:To:Cc:Subject:Date:From;
	b=IRzYJPLtqyLTFDkW/E3erTl2pGBOqmAeso6+BBxzRo34O4QBovomeWcfquiET/MKM
	 p5ED9lkTfMffRJhzYHIWthsOtj4LLQmJZ4hZUxXOJMOehclBB9EXYql4RxVLEpWzEe
	 GhuqetgomPeaWQX/4PJnqIcZGdNCfBwbc6/SjjeOXRX0WYWdXvwMRNPqo6hWCpnury
	 FyYY9tTrqHh0m6+YoGqQNa8B9x/LHqB6dtXzLCg+X3Xsc44ejCjWoB8Gz/VvWykmnI
	 S+W1HNlVKveGdHiBri6PUzAqjbDo5M6M2Ln0WCVUmbD6q4KxUwOpdmZM/3T30wltqy
	 P7sNedl2CTHPw==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 0/2] bpf, arm64/riscv: Remove redundant icache flush after pack allocator finalize
Date: Mon, 13 Apr 2026 05:32:53 -0700
Message-ID: <20260413123256.3296452-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_053328_601083_1EA54165 
X-CRM114-Status: UNSURE (   5.25  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When the BPF prog pack allocator was added for arm64 and riscv, the
existing bpf_flush_icache() calls were retained after
bpf_jit_binary_pack_finalize(). However, the finalize path copies the
JITed code via architecture text patching routines (__text_poke on arm64,
patch_text_nosync on riscv) that already perform a full
flush_icache_range() internally. The subsequent bpf_flush_icache()
repeats the same cache maintenance on the same range.

Remove the redundant flush and the now-unused bpf_flush_icache()
definitions on both architectures.

Puranjay Mohan (2):
  bpf, arm64: Remove redundant bpf_flush_icache() after pack allocator
    finalize
  bpf, riscv: Remove redundant bpf_flush_icache() after pack allocator
    finalize

 arch/arm64/net/bpf_jit_comp.c | 11 -----------
 arch/riscv/net/bpf_jit.h      |  5 -----
 arch/riscv/net/bpf_jit_core.c |  7 -------
 3 files changed, 23 deletions(-)


base-commit: 71b500afd2f7336f5b6c6026f2af546fc079be26
-- 
2.52.0


