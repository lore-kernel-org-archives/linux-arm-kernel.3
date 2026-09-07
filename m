Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C323C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKUvGXFfM1WSd/D5lDioUe9VV0OdsRUwt1UqjYJjYJI=; b=MJFeij8RgbmX7dY2erfEd//r/C
	c6DMPyl8ir3FHelMEXfU9udkokypNitZyLzgsO1aD8UzWiHxde4nphfWxGmtfp6hrxYr75Sv+3gpf
	9wyW0WlbJu5z/1s5M4w+29tDQ4UPwXc05CZvVvUj6GalHmoEusMA0MMo6bN+lJ1plVi2vVEEP58Q7
	4den5F6GRbmiq7y63M/VZ1VZGnYjxDyI1KOuAo+C2X4ScVqcoL1FVnVtUACPazWihbF0N5rO61eyE
	3OJc7y5cWr1IenvmP8GuTbGgp9SVsiGQqi2TRqj1XIlrECaUnRDdGbIFefgyVqmvZkKmyOIoXjbbd
	Ebh1cjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RLc-00000005tC8-2qaU;
	Mon, 07 Sep 2026 04:52:48 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RLa-00000005t9s-2gC9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:52:47 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2714819a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756766; x=1789361566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKUvGXFfM1WSd/D5lDioUe9VV0OdsRUwt1UqjYJjYJI=;
        b=ZexaiaN6Ax1GDWusVDo2cSHgs8KiXUlvhYw4ii051SYlz5Jezfi5KPtuyI0bl2lCfq
         lF535P0LJp1NbWYhoGpAXm5fbdQ6opnctalqTcb4+kJt6+o5hHsxnqAMqSGujwBczBEt
         Oyfie8D9OK8oKdEMMM+85HmqyoKKwUy2ffGgxlhmgOFruPgCxtM9za7KDIVx+HUfcYF2
         koPqGT6FdVAtoFcFWJunglZqybzqwpSIcYJKzc+QK1CRrPJSEIOrISZpb1BoWqGq2wSO
         wsAWLvb00u5UoPSjGEOVSsAA/29zZ9z6eVbX/e87O8cDPa7JiQtnz2+ix9+8ikj6Y+fO
         RAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756766; x=1789361566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKUvGXFfM1WSd/D5lDioUe9VV0OdsRUwt1UqjYJjYJI=;
        b=aYjYl0UifT6O/SzwmIFrQ+UhghdBYooGQNVF+rLM+6v0RC1/sp/04hdqKSjUabPPS7
         NgtLw6pe5gnnZJwhT0YijAYce6kyr6eKASkPTY7dDw4LS191VOCnPgqUzvSmDrzciJgW
         MmOcQ2iqQmueorJInbHVJY9WvbK8SrMB0fkjzun3OH0Jtam6wvAKJHVlA7iGqs84Scf5
         0rRpIsBglHa39UL/sk4SNU5FFcV1auR//RXtyfQsefux0m+ohMBb1ei45QCFtleDR0su
         ueVvmnpqEgnw1ZzcDkzMMmaq3ZLIdj4+BYu+9mEEwADrmaooyophbFD4J27c6nBqrlI4
         GHJw==
X-Forwarded-Encrypted: i=1; AKwUvByZ6zd0p4gQKO6ToBl7z1+LRzMLB0tjHy6ycfx6t2RedTGOSbU1mvDex60K4WwrVUdMls1yrvGa442SMxkwChOk@lists.infradead.org
X-Gm-Message-State: AFuF++mfRKNTOusRn/RP7SBYnqE0x2K0ClXE/FfcaOB9AjQPcNrjdZMj
	9e5IstuGJUCXIhIRFQl0r2Zgw1cLZBLPBXOI3+Xx7OqC0m4T7DP+iHSR
X-Gm-Gg: AYBFou0vtx9OWhBcQTt16J2HO6iCBHSbxO2MAbjzh7GbwBLIvUyJLR0xGPV13xgiWBo
	8Qz3aPgkAJh8ElEEecCYVGaIUak0/MhjCwk3oKDil7D7YO97pDL8mvhsO0fz8nZry7EzoAvejAF
	ce37vsQXOmsEfAQcXVVPFaOfkMlffaUZwNFXk1YzyxX2JgxNABJl7WKNaukf2uFingC6lRjCK9e
	/mtvCRquxwlZ9IJeEAXUXJWaDGV55aWvVjhnhXQpAoIK4bJ01bL58f7q78pgecyspgq5anHU3Zb
	qicGyo/Fabokg+ZlvrkRyE94Ht/GZF5M9GgxZi6yLMt9uaYbj4oZVxmvLN9adFumjvnC3NZfcs2
	I1mUhDtMgpliCMsqP1AFKPySxcMOBsnmyr2aoQz0LCkcOEnD6J63j7P7GkCpCRAeE+D3tU5B5V8
	iLV8GRirFOy/Hi94b4fcoYV00okaOEFpixXa2ld+U3bqvLij3QyoLo8u+gC0SAr5u6BAoU6BEYh
	6bT41i896ojZg==
X-Received: by 2002:a17:90a:1c81:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39b2c00ed40mr18971030a91.18.1788756765648;
        Sun, 06 Sep 2026 21:52:45 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:45 -0700 (PDT)
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
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 7/7] selftests/bpf: fix repeated words in comments
Date: Mon,  7 Sep 2026 10:21:35 +0530
Message-ID: <20260907045135.13317-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215246_685410_14EB502B 
X-CRM114-Status: GOOD (  14.42  )
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

Drop repeated words in comments, reported by scripts/checkpatch.pl.  Only
touches comments, no code changes.

The subject prefix changed since v1, from "selftests: bpf:" to
"selftests/bpf:", to match the rest of the history in this directory.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
index 5135d5c72a46..158d95c2520b 100644
--- a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
@@ -221,7 +221,7 @@ static __always_inline bool check_asan_args(s8 __arena *addr, size_t size,
 		goto confirmed_valid;
 
 	/*
-	 * Wraparound is possible for values close to the the edge of the
+	 * Wraparound is possible for values close to the edge of the
 	 * 4GiB boundary of the arena (last valid address is 1UL << 32 - 1).
 	 *
 	 *
diff --git a/tools/testing/selftests/bpf/progs/iters.c b/tools/testing/selftests/bpf/progs/iters.c
index 62d7df9e80be..340670e89ba9 100644
--- a/tools/testing/selftests/bpf/progs/iters.c
+++ b/tools/testing/selftests/bpf/progs/iters.c
@@ -1511,7 +1511,7 @@ __naked int checkpoint_states_deletion(void)
 	 * would get equal to one of the explored states and thus loop
 	 * exploration would be finished (at-least for a specific path).
 	 * Verifier evicts explored states with high miss to hit ratio
-	 * to to avoid comparing current state with too many explored
+	 * to avoid comparing current state with too many explored
 	 * states per instruction.
 	 * This test is designed to "stress test" eviction policy defined using formula:
 	 *

