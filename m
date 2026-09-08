Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D41C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=; b=AAivtJV56HQXo43zdLV/MwtFXY
	cwJllD8Kua32ZbH1rrUND6q5ALEKAyfjHEauMvpaqoKpthe3DOLs/jR9pKgJyeFTLW2/HdIOOlmsz
	BDx93edlQovVwf33DPRSZB6FkcwW0lKTaF92nrvgaXRLQqeU2XbKyeMdg7zM1N3evXVty0Qf3u601
	IoIWxidf+0kIscN14dhaHyhNEEzyw/mFq/fRov2xLPlJfOAqWmnhPf/bLBPDyb5oR0LC0iM5D5p73
	osqpLXJbQvskeKFs7kVpNTaUTWvaC0aRTvcbcWKsuN4f2UP62vdFysP8kDE5rJeeLs8iLPaFOQESu
	73+pcoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oid-000000086bU-1zrV;
	Tue, 08 Sep 2026 05:50:07 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oib-000000086Zw-1AFG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:50:06 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-848643382fcso4307065b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846604; x=1789451404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=;
        b=pvzhecJxk19nBnX6IcDHikucwCDr0SX6e1TiHP+bbsznJ/Vxb0rgbNIxv14h6p1IfL
         gH13i3PdT+BxmmCWAuHB3gkOZb02wfnU8L4r7tvjjB1evknTw9hxBCV013EF4BsZRNaB
         YVPO/m/HlW2S8sEpXIkqbtKgzCom9r99/o3RXlNub6ZadGtkGOqX2+3JaNpMf6buPTPQ
         N+WQlN46T90VxWo2mIo3tAaIvS8QqxLUPgKMniBK3CepwCB5WABk5dw70nTvCOBapzcM
         fW5eTLmo8u53i+J8wL16oZYzyO5dMms6M3H0z0TqsNjLtFQuPM74eTWCqFoN91qUhSAC
         Z54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846604; x=1789451404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=;
        b=k9ts44ywuFR+nfE4Eqahlxyn2cXQDTa8BcxMZL41PhL8/+mAC8wBVQJvwtQF4L9gvB
         MQ9zqBUJ7QZ69NDnrhw9Cz7dXvdfvvm/Fvtv5RYYfZJINLMsM1xtnTOu5cEnYw84b4c6
         jZ1otKcbrIAN3RhyA1hTjFCfNQ/sPQ58gWA56BGI5lfVWFv7yS89lOQylWoqng5HLJJK
         z6/vdZJqkFMoro3IIrVVAcZliZSts6ASQhXYRsMG8Wr2mErt+T75r0eP+94bWvYtHtfh
         JGwNh+9d1ceDg+gHHsaqBfODq2X4neSLUJRH0j0mxsWXuQUCu8BvZNOG63GGqWrOGuyJ
         JbHQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ3E4bBDxS0hd2kPhVzLyIttyqVPpC3OQ/plRg1YRBcB2m9+F5Bc58moWGtR5L9JOT8Ab7pjZA2sOoES3R/xWR@lists.infradead.org
X-Gm-Message-State: AFuF++mJjobhGlDVSf85Z8VvpHa8qL8HiUoyzOpAF+YaZ/V/+eq4hIw9
	u3uN2f2MjAyQVFYAvWrHAzBNTe7Wb7OkeL/ae85nCuK0yw8RPxysYzG+
X-Gm-Gg: AYBFou0vW3s7RGDSKkCcWX+JQCGeYIHTLnIwEu8LGK1tC7O3yzVdxEKOfXMd4gk8cJ8
	t5zHCW4wvDT/NEZhR/cWDXZwADy6ysfsHKJBAvk1lOTPerZcp85enFdfUXGjqoSD71ghCeTRtd3
	Ie8fW2rPMcZ5Rm4tpOUlAJsv2IuLNtSylnVke/Y6kgZEQHfYRjaVCxDp3WVtHIZe755mmgF21Pl
	IgSgVUxyBIipQHYoNhGwhEddYi4B1Jan66HkwkUpFm1PL48O4oyH2V6ra3Joo9dpx3Jkw4YCmTq
	2WNiuLo4Mkr4Xb4hK4aZuGr48MAhDOtplIElIkWlrGJcIhMKyy2u4fQZUPvvjupg6NnW6NmpuUi
	vEI3jWOqFyaVWEdEOE1LeKog4jh+reuXi1kEUMG4gxr+b/MwfNjc9WUrY8KjVzwKGcU+ASX8cEZ
	Td+IUY1A9lqXhyk8Av81Z8E3BSiigLwuz95Y4SCsrR2GExvo7aDKpaRT1U2pxSYoASfS4m6j2vm
	RVXLSxYobyGAbdW/Wi2dfcJ
X-Received: by 2002:a05:6a21:7989:b0:3da:421e:40f3 with SMTP id adf61e73a8af0-3da421e4978mr36173588637.17.1788846604363;
        Mon, 07 Sep 2026 22:50:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:50:04 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 7/7] selftests/bpf: fix repeated words in comments
Date: Tue,  8 Sep 2026 11:18:53 +0530
Message-ID: <20260908054853.13820-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_225005_320030_60614199 
X-CRM114-Status: GOOD (  15.15  )
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
index de656b69d13a..fb50ee4ad097 100644
--- a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
@@ -204,7 +204,7 @@ static __always_inline bool check_asan_args(s8 __arena *addr, size_t size,
 		goto confirmed_valid;
 
 	/*
-	 * Wraparound is possible for values close to the the edge of the
+	 * Wraparound is possible for values close to the edge of the
 	 * 4GiB boundary of the arena (last valid address is 1UL << 32 - 1).
 	 *
 	 *
diff --git a/tools/testing/selftests/bpf/progs/iters.c b/tools/testing/selftests/bpf/progs/iters.c
index c6699159dacd..e44a979270ea 100644
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
-- 
2.48.1


