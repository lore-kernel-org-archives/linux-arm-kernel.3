Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAD8C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=; b=WKFXUz8u2e4u3tgJlraDUsla3S
	iq0BF8RmsNJ6vQM6gaCZXltCMwycXMJM+OIHPYlbCEW2ORfD9CvcLvNseTnpU87h42UhPVzeYLjnj
	HYAoIoQCrfdfiLk6w0A4uDdqxaog5BA4brbpmjdhyit70nMyiNO8LwBYShXtgRwP0SHfcNsN3FbzZ
	H0pmEq3CZDegJrqgsaCaaVzV8wx2BpjMAiCb30najmcYwTMOV83SIM24a+nVnzguxDJL7NQcJrIbJ
	W6V4wizRY2V7zDwLK7p+DCdLR68dVMdpAqIcEQI3awO5XdGgc5EXiB6lTU/50k/r5K6URb9jIiSbS
	6veYu6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2y-00000006jpE-150z;
	Mon, 07 Sep 2026 12:02:00 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2v-00000006jmH-13LG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:01:58 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d8fd3b729dso27941825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782516; x=1789387316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=;
        b=ZmW0D9lnI5jFTFmP+cKfo8FnKUMipXYdSWCXtF/bzQhFrFU3QVHXGCHSwzlszX+jh/
         a9amOfPsRQ9nrg5MVngPAGPu3rUaFSq0nqfFfw+LkK5mxZnOonoDKb+TvKXRfW36qvYR
         rni2M5H1GrXE6+ZBLCGYP0bTffgmKaNp2yXvs1Vf2vjLZAWQyHnm7nba4kLf7S41fBYx
         yv89Wrw3pkdzi8XyrNEFpY1KY2F7oeVgE66lMlERlKUNl80faigxlyOydfxnnRmDyt+h
         GiF+8uiH0CGN98Oo+VexKrVN7OPAew6dbzPIMm3yP40xEigd888FI64Cl2Mr0gIX2zq2
         5gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782516; x=1789387316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=;
        b=jTy+NOITYFsoCVX92O3rvEli3q3ij0wT3xf/jEdadBHHDgU17dIuE1WIVi5AuLiDvw
         YJZsa6JTeoLZ4hlceq4RTqanSsnE5wuNKix/9J6ffQMnlqcLZdVE+yhiWeiVB3CCvnKU
         zcxeWNHcTbrCYoPTOOxs/bZzjlcrUmgXknXXZM6PBF2qcAwY07NazyUEQFgce8N/szRV
         lhGLdKrtvaF8ZRh2ihAHicZzU9noiakxqHDekWACPe67K1s+LREgaCQhhQER6dODZODM
         WTmWubkdgaF92WiW4jHKaMxVSrA6PjelizvpIRyDuHF7Uv8NF/YY9HPRSrGx7N657kMv
         lyZA==
X-Forwarded-Encrypted: i=1; AKwUvBw++QzkrFPAHs4BNzEzm0baLHxg/79Cxgl4bHzwy/arpQg79+24O1Vj2cdkYaKvdM8f7O3Auo+mCRUv/I59c6YD@lists.infradead.org
X-Gm-Message-State: AFuF++nbeMrd9pw+156Skg41Gz0d8rk2JQ2KJn52FTOXjDzXZqdKFXj8
	U48wPH0lbY5IBRXNhxMXp4T3INZDTXeSFVDe6y59YUKFSDIbxEBV04Et
X-Gm-Gg: AYBFou2ZJ/cgTdr0UToBE9uLKFXRXDHJwC29w+5P01E9YWaEhdzHpwZa7WSnc4Koj5N
	Qb3ScMKOF0G6ugOD4mIWpHGEjAgzZ712/TMZQvWUw6XcA5jiCV5PZaV/sM0+Mg8Ym0f0hPBdtpW
	9zHd06UbbWoTMtHHxL/FdYmB+STrUNmfZYz2BsdsW8FD78P0mlRVC75qKo/fjQI7FUuynn1LuqP
	IoU4l7dTHBAXTDx79GkZa5VpksJWT1TOKT/AGYru4gZ3TTBEQIompvEkbyBOTSrylKR7cHbMYEq
	jpX+WX0YLUBW5czHx75Jul7rlnjIBg+423upTpwTgJco5jj+3A2rHMTMPzxRiE2jE/80UJ9Owjm
	Tp/Ks3oUIrBeiQMBqQCQo8q0RwrApA9GCNRROkHnuxFFTuwz5LoW4c2Gj02Usf2omlrfXzp0nzX
	os6KevR4n0ArwzWRJXp22pmGQzLf2leBRqIEPLUOhb+f9FILhA+XSiJWgZNlaDsjOJz0++cWwcj
	7GPuiClREMwSw==
X-Received: by 2002:a17:903:3810:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2db124afcefmr348302995ad.9.1788782516134;
        Mon, 07 Sep 2026 05:01:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:55 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 7/7] selftests/bpf: fix repeated words in comments
Date: Mon,  7 Sep 2026 17:30:43 +0530
Message-ID: <20260907120043.36894-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050157_325293_5AD92064 
X-CRM114-Status: GOOD (  14.79  )
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


