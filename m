Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA12F531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gh7rTIF5xjhe36exhKJaQhHcLe+TArIECUvTx0COlx0=; b=lhfEQrw62uOzmiRD1Xja06e/Le
	sBdrQ7JWPZr7e0sYDRkr2Wph5+WRU9JBuMcaJ8GWJZkC6qjRDCBdzbiOX+ONqE1DeR7/SsipMXzyD
	rPh89gUVxgg+H58ATbGSbKpKzXiI5yh0XXpLisYXieUyGnGeN9PN8QJ+fAWEmEreSGNZXxC5e2i8h
	z8Y8sfh6GNOIS9Z9bDbPsUSa7k/81lYqaXHOyB2+nwpgpI/a++QKgy6uOwl12dQS8mdEzEJTFIIvM
	QQMNirbRJ1pCnBtLFO/fbGGtqtjbnV+V0b2yK2r6x/veXteZByvQ/H3XuCzrL+4zAKape2YZgGYVQ
	eRo6GcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMgs-0000000GGvj-2LTh;
	Mon, 13 Apr 2026 19:11:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMgq-0000000GGvN-0xXv;
	Mon, 13 Apr 2026 19:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C56FB43D69;
	Mon, 13 Apr 2026 19:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC95C2BCAF;
	Mon, 13 Apr 2026 19:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776107479;
	bh=wQgADd80D/pun3cifGRSz/mIPDYovCZECVayXUjBKrg=;
	h=From:To:Cc:Subject:Date:From;
	b=eM4ZFz8yZ1k2of+wPmWowz80jBd70rhdHOFyAgCv0sMUcqq0hNqASbK+atDSo5/v7
	 OXff0sMmMm4Uro+jw8NeKEYarPVkLeL8qMq3lqsyEW3QAEvgN03yTT6LiY+l5TwXJp
	 +AOSvHlpjhGl1TGT/cRGpwRA5mk0402pGmvuMok0k9QbhxsrWBnGAZFb4NUo8ATRiS
	 w4gChZ2YV7eK5ePij0+2wggMJnaMHBhNL62obsd5Xtd7ztUYsQpP2rjuqUOSIWmk1w
	 LmDg122CUY1O4kD3Nv4u37ry0E8k8KT+6HL9MZnw6vEt6s2wWVRzsReULl215xuJBx
	 x/H3dsIak8hVQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	"Alexei Starovoitov" <ast@kernel.org>,
	"Daniel Borkmann" <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	"Martin KaFai Lau" <martin.lau@linux.dev>,
	"Eduard Zingerman" <eddyz87@gmail.com>,
	"Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
	"Song Liu" <song@kernel.org>,
	"Yonghong Song" <yonghong.song@linux.dev>,
	"Jiri Olsa" <jolsa@kernel.org>,
	"Xu Kuohai" <xukuohai@huaweicloud.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	"Luke Nelson" <luke.r.nels@gmail.com>,
	"Xi Wang" <xi.wang@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	"Pu Lehui" <pulehui@huawei.com>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 0/2] bpf, arm64/riscv: Remove redundant icache flush after pack allocator finalize
Date: Mon, 13 Apr 2026 12:11:07 -0700
Message-ID: <20260413191111.3426023-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_121120_299762_C13835F8 
X-CRM114-Status: UNSURE (   5.98  )
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

Changelog:
v1: https://lore.kernel.org/all/20260413123256.3296452-1-puranjay@kernel.org/
Changes in v2:
- Remove "#include <asm/cacheflush.h>" as it is not needed now.
- Add Acked-by: Song Liu <song@kernel.org>

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

 arch/arm64/net/bpf_jit_comp.c | 12 ------------
 arch/riscv/net/bpf_jit.h      |  6 ------
 arch/riscv/net/bpf_jit_core.c |  7 -------
 3 files changed, 25 deletions(-)


base-commit: 71b500afd2f7336f5b6c6026f2af546fc079be26
-- 
2.52.0


