Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6825DC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Hk+XNhijnUk0JrFp3DVPvigSnryVRt/+DzNzROaqfU=; b=gRCXgUnyuXAiLC4wM5lojoA3gj
	9Ic7Do1zJ9ZYC0mmfFJenC3/boZVnnD/KiwLfbR5PUiqUk8QSNfaIko0Y9SGj4KeVm7vaSk+S3QKC
	AqZeThdZeh+QGa6FM9DuupCubbePicx/fMJWP0IFTgO9yBFqRbeDjus6Ju6ffUudbxS71xGExxsJQ
	ewsamtac2/mZdzwBbX4HAmcRwj1yhUkbF2iJhhN7+6qXqNlaWsYGKw+lodFvFBNRZPu3seiBhQf6Y
	rKXzmi+w1KGq9eIkaVs0fk49DeiCGr8MKI9yKBuPZhOGSHrHTDLRGaj5lL7TkTafkRBVQ/jecoNF8
	gIXoTv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ohg-000000086DL-2rMr;
	Tue, 08 Sep 2026 05:49:08 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ohe-000000086D0-0E5Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:49:07 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-85590c5aeabso2756943b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846545; x=1789451345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Hk+XNhijnUk0JrFp3DVPvigSnryVRt/+DzNzROaqfU=;
        b=bln25NPA2vbPkV1OF4P4pDSNZvUhyp6Q3meO7aO3k6flRppkNcKjxoofBpo158z6UQ
         9zg4SK2t+zQqlPtd9dG5OMBYS3S8vyqnM7fulJZeaRp3S1BRuFk2iJXRjGgJxaDDfeF4
         FQt8LOX5ojsi4uXatle7benU2RzUWmOScL5twrLNnOOD9vPp9grY3EjH47JqwseIG0HF
         +uPydhtF/Gs3uKCKJJFAkTyxhfR+sLkkA3Z2dXzfxr/aX/Mj2gJSbjpzIRx1dpm8ja0c
         k4m4BhdsEz/947O+LRlNe34a2Rg2v0tRgkPwvOXTOLPF0dtS+CZtqJP4EaclJS3p3D+i
         kF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846545; x=1789451345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Hk+XNhijnUk0JrFp3DVPvigSnryVRt/+DzNzROaqfU=;
        b=lvICVKjQMSPBFPeJE4QdGCJk2OtZJUeaaIS04oEo1f4J9PHDVNgnGlUGbkC9OCCeCI
         U7dqn5C6UcODDZkiYj14sryKJdssUT8O+3lgHwxsLlQFbEb0ijKm9sjEauJHXhlmOW6T
         xh0yS/QjvmktFzZYWBi79jbMaxXOA96XzWB6V0HwS/lo3OjstRabKH+3tpl3dpNGI+Ad
         si1EgeRuP8a+itsdNZLtmvattP1YzLdBpFCZ163vaG/Ch9baX+Ahq3zUjbZTlUdT2qRe
         xgcyaHu2mAFS8FKzhYlfQZT2Mu1ekLTWoiqw2mhO7JRgBdnxH2at685UePW/m82q7/jO
         JVLg==
X-Forwarded-Encrypted: i=1; AKwUvBxNX3xsbLOkj18+BEpwApdwsTLw4RWW9z0MbL8J1U0vS3lZH5IZMqiWUDCRET03CNENd+KU3nnfVZy4w6Adhc3m@lists.infradead.org
X-Gm-Message-State: AFuF++naAZgEPhBwcPEePOns1Mb7ttrQlCaVn3aXJmmSfXIP9jyPgi01
	Pe2Y8j3bmgcSF64Clfokhuatnfo1QANMKQtfwa8RrjLsR55It0wy12In
X-Gm-Gg: AYBFou3qzKiG6GN7QydCTmOSEScAuWZvsBioqMWPUeoPhxDRVkfahSIpMCmeoq16q/q
	djs/Fy98db1mX3CuXdmLj7I8AJvwY8tkR2U4U/gGhhYM/kIvMLJaUq/kdXtTs2fgR9tujsttr82
	b/WQcUnBHKqLkIPXIRMW3B3P5kRbibFiiyasVZaZL9vjai5MaDrSFQhTOR6liCH7vaBygVx5Pzh
	jn05AlOHC04/1SPxoCDyi8mvt0N9+tQppKZFOA2AXWq1oI4NSmNyH5fgyo8CtS4ooCWVPOgWWfY
	J+jKOp+3uL1Vhy6xWxxGKTSTVaDScxvdrl3dsMBNpBLiK10mjPUS0vuDxU/f/0haiD+76YQrlsw
	ZrvHofoRuPzVhGSFZUu1Dq05ow1QkP8oadrDJRN9KlOyFayHEAFyvr8uMEE/8QegXvIJtjf7FeR
	opMA5CFxXLEgSValq22Ff/vlg3ubOSCzXORa8i18CkkpFCr/UqrlI/hUVSLj/fj72fNJFrrCe9r
	nWTOSUw/05WrQ==
X-Received: by 2002:a05:6a21:38c:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3da3a0cc91cmr42893779637.24.1788846544946;
        Mon, 07 Sep 2026 22:49:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v4 0/7] bpf: fix typos and repeated words in comments
Date: Tue,  8 Sep 2026 11:18:46 +0530
Message-ID: <20260908054853.13820-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_224906_098224_B906C403 
X-CRM114-Status: GOOD (  11.36  )
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

Fix misspellings and repeated words in comments, found with
scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
Comments only, no code changes.

Changes since v3:
 - rebased onto bpf-next.  CI reported a conflict on v3 and asked for a
   rebase and resubmit; the tree has moved on since and the series
   applies cleanly again.  The patches are otherwise identical to v3.

Changes since v2:
 - moved from mainline to bpf-next, which resolved the earlier conflict
   in stream.c where the typo had already been fixed upstream.
 - renamed the selftests patches to the selftests/bpf: prefix used by the
   rest of that directory, as CI suggested.

Hemanth Selam (7):
  ARM: net: fix typo "arithmatic" in comment
  bpf: fix typos in comments
  powerpc: net: fix typo "upto" in comments
  selftests/bpf: fix typos in comments
  sparc: net: fix typo "evalute" in comment
  libbpf: Fix typos in comments
  selftests/bpf: fix repeated words in comments

 arch/arm/net/bpf_jit_32.c                                    | 2 +-
 arch/powerpc/net/bpf_jit_comp32.c                            | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c                            | 4 ++--
 arch/sparc/net/bpf_jit_asm_32.S                              | 2 +-
 include/linux/filter.h                                       | 4 ++--
 kernel/bpf/reuseport_array.c                                 | 2 +-
 tools/lib/bpf/btf.c                                          | 4 ++--
 tools/lib/bpf/usdt.c                                         | 2 +-
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c          | 2 +-
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c                    | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 14 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.48.1


