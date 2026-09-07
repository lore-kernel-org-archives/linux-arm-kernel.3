Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1906C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jE91T1YbcHjh2wKlRe2CKmWmk4DasShLxHNl5T/s+ds=; b=Gfo6gPYAaUtnJTP0MRhL5tYc79
	KIQC8unmTKzUccQnoGfEeytA31D/5ugfD4zL33ud7hYG6nFnvhOnDVdtOWMv90asFOASVxOpEySjJ
	GGzqOWRQAAyrwq9In5L+syNCA0Ks1sPLRv4xbSXlW9BTHRgXPJEe+2FlfHoLRINtkMYHbSqR7YnwQ
	9X9V9BAZHz90Cl2OF45lyXPwRnRpXxnBiGy+iwZ85E8qfWo5iaN93PA3urz79+5k3vff7A4Sg9Ijb
	3s7yYleLiM2GMdTRE/85erAsT2X6QhGjnRw6/lSqqJx04Yxm4o/Sewod8cMk1uVAVWtnmYK3dTqmU
	2GeoutfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y1y-00000006jOT-3Bma;
	Mon, 07 Sep 2026 12:00:58 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y1v-00000006jNp-3WC5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:00:56 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7e6b5737bb2so4140816a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782454; x=1789387254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE91T1YbcHjh2wKlRe2CKmWmk4DasShLxHNl5T/s+ds=;
        b=oRQkbZlSkdQrRPVc/3hgaQGS6mVQraQH28kD3jrUvyw6noFCtjj98teitDJpTQSaPW
         ApZCznp0BroT6DIWWou3Sj8fAQBw44rihjwm5KScwuiNog0GInIvCnviZK3pPSHVmYWw
         fw+qhlTcVD7/f0sNhvtNZfcbA3PAO4lP3M6VztDF+o3eRzB+uIVWs2UEmThgrjuk5y2u
         bHergcxPO5mn5+Cn4Bo6IJ1xTkkkDQQ5EJAr6f+HJ1zby8MFWpuCLcN7I8U0+ZfDSRss
         uIXlYAzJwrOdwmyJ08beu8cpwReqxyE/iOTVcfw1pQ5vJ8aWHv8mnjxELjtma58enTwz
         aFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782454; x=1789387254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE91T1YbcHjh2wKlRe2CKmWmk4DasShLxHNl5T/s+ds=;
        b=tSQg5INCqldTi51V19INOcLcS9GgELUeEowE8ory09MyfdtBgFdkPcScDDScq5lPOO
         0/cSxxaK4S9mtlLcY3Tg3eHoUd82FCnYpn6jY5fWr5Vo8+N74Vuqft8fo8r0pgMYm7vH
         s2YORdDhq4OstXzSMxM+64ab6PdmV7Cy8VJs8pNWCf7V5kXdaIKy42u3ai9U+RvsBFjI
         pIi2Irp6yyqO2XIznAis3F14ekjVLeposV4oaNMGaZCQyBWBlCnwwgGJH0kaEW0yK0Zz
         W213kQmN9RZGh38m/GjtuydV7K5F8vSItEZDHm03jApXFEOvZN6XLwBHdS18Njji7Dlc
         iHIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH2WTeAMYjiSv+bPFtNkPHsAe1KV0hEbzI1F5C6zse4bWk8xSZiDAajA2BaOt599uTQaxrUTF3Z6zJzb866IQL@lists.infradead.org
X-Gm-Message-State: AFuF++lZUzqvrJ6jroSx1Qc+clzusa0l+GqKcY1dZcDRIx7CQqAHYxtu
	f2x7N+XCadzSXZST5ysWFJfq486MPKcFGaoOt26mPEeXokSV19bOkzIq
X-Gm-Gg: AYBFou3mhsZt2T7l5BQEuKw954RRKb/FeyytomRU+4NoUnToiLZPgKNQHasuu3nrYy0
	wk58R1CwX8HnArE33fhWAuuGN2SCBVjW1t5yUIK3m8Ah1Gf+D0PLmJh4Eu/hYkff9D/Dgz19jpl
	znPLB79DBuC8coGXyIPDkF7Hdyvm/5bkpLFAJBdfclxjZwqqigAUnnEr3BXbUIkEHTcRC5ve2+U
	uBFkF5l4kIIiqLy9bRB8D3Mg6UZ4QZziW7Moc9+EIA0q44n+d4KsY9QtFjIrztj1bK0cwOyyBDI
	V8AX6/xcQ5uH79rEWSWc6NLvEXoMf7UPl1elptULLey2rkewtvZ1Knwl92iG0dqN0lWZVLL673D
	eFD+hmClZvNHhuGk5GrGeLpy5UYyfvsPs3JV6c8BF+j00+YDs4g/I3i7NtYTMs3+cAWLGEKk1Gz
	7ka2aBiY5Vrnbw3SY6hYsBUWzGU/voZ1NnB1HQxoVzDz7Om6Yh6Zz5MwoFBxyzCTZXcspNKERvx
	Nml1RJpWWQyZA==
X-Received: by 2002:a05:6830:4424:b0:7fa:5c49:5243 with SMTP id 46e09a7af769-7fa5c4954c8mr12688858a34.28.1788782454447;
        Mon, 07 Sep 2026 05:00:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:00:54 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 0/7] bpf: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 17:30:36 +0530
Message-ID: <20260907120043.36894-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050055_880736_55893FC7 
X-CRM114-Status: GOOD (  11.19  )
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

Fix misspellings and repeated words in comments across the BPF
code, found with scripts/checkpatch.pl using the misspelling list
in scripts/spelling.txt.  Comments only, no code changes.

Changes since v2:
 - rebased onto bpf-next; v2 was based on mainline, which is what
   the BPF CI reported a conflict against
 - dropped the kernel/bpf/stream.c hunk: the comment holding
   "accomodate" has since been rewritten upstream and the typo is
   gone, so there is nothing left to fix there

Changes since v1:
 - use the selftests/bpf: and libbpf: subject prefixes that the
   rest of those directories use, as the BPF CI suggested

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


