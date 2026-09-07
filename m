Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48A1C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dj5/gWxeDk47uSELqCVU9KzfoSY5+X/l8m45uFaTtlw=; b=pMCNwROcACM4EMkU88g4aptbwH
	feMgpc689ece/jh1CXzYk07K9VX/3hwfqWQtkYgC8dMpCf8pXlmOKs3LsQy07d+PtB3Of1dfsPrar
	FvkpUq6bkvpA/44Ok2sbBF21xpRZtELx/owOy0TEHH8sZyjeUrN+Im/vbq93mvjjK9obJCPpz4JYn
	X27bfdHr/xPxGpuhHt/SOobgEN6xKSSgKCWsqAkJOuxygF4vuYDeAYbu7SeHsKvLULKz6Leo9+Tom
	O4ERuBGof31EnWRFfBdqM7gV9EzicNLzelzKnlWeViRPfOvHyIpk/01kXeYbUtBnsBYAXfXt9naDJ
	PcvQ0jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RLD-00000005szK-1DKp;
	Mon, 07 Sep 2026 04:52:23 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RLB-00000005sxs-00Oc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:52:22 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2978098a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756740; x=1789361540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dj5/gWxeDk47uSELqCVU9KzfoSY5+X/l8m45uFaTtlw=;
        b=EWyHs+PM0Zhc8mvP3vTBPTzQiS17FlSHIznk2yT88xNr47nOXbJFTW0yC0YpBz+Y53
         xR2CLV+GiZR1lvecC4G2jk2GKms0jmc24cyEET4pRnyokP8LW+vFf9kEl76CInEcwVsG
         xzFzceZnWuJc3WCYNRgQsSMMkBHQwecbq8/yYBMAnuclHUjfOqkksJ/oHXlCINCRZCOD
         KCETwhQ2VcpkYUDO0U5Ym3quxY4Rzj7f0y1b7ATqQYL6lERAr7V4XCcOzRJecmcLwD6O
         xuM+GFm4N6j9Li5bPEvx9zFLQUxpjuN5pZyPkfrJJOKyipWNNgUdwO/4nxVgQqbPivA+
         rN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756740; x=1789361540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dj5/gWxeDk47uSELqCVU9KzfoSY5+X/l8m45uFaTtlw=;
        b=p8jp5R7paohzqObcyLJatJOp7jYzB26CdyuEYUf43sOKL/MrDN02NFr1VjJ6ZdF+rJ
         Rg//kDWaVgxCIqDJIEJ4M2/brV1kIkXr72pnIbvhLmPzCaP5MGNUZ191HX8Il6Vqu0aL
         doFLWVKlIQoU4/aVikf90CbuIPNztswzTFj5hFx2yrQmn0Za3BKGmSqaUK7t1L5AXcXJ
         3qNnUr3SstjYkX0Eh6KgxW3kBfVhvUzreDPBuJ0UAxKEvqjOqW9NaVix5uFEkD7pf8Jp
         wAbFxMsESbrkU+X3nVVeqgiV1eb8YAjMcELiw/DhiWHJNGcak6dtjhluqGTrX2E01Qlx
         HCEg==
X-Forwarded-Encrypted: i=1; AKwUvBx4uLFNIF7294YXAlLFuEYrO3Hw26UBn+mrWYiWAUjrTnDpnOvOb3PWvcVfsD+la8iZeIciItCQTFqC9Q/3DoIr@lists.infradead.org
X-Gm-Message-State: AFuF++lm22NOtPiOoR4fXH2TyV5VA+bqVC14TZ1opO/oGaznRFre6YEz
	pna0LNOHINUYazbE2nbVaVfNOHni/N9If/xIbUCA5Izd2oQFmUcxl//w
X-Gm-Gg: AYBFou00KgElOx2TYeDIm3+W63vewPU152ygI0fIggY+++ga41Bm0tPggB+aGfG2cfi
	m5uiBSgOPCrBa3r+vtK0E6ocQkcjGQJsyVJW6iQPwE46oIRjuzJugDvBxmmjXkx/W8xG0sF1kdo
	bMtWCLVHAq5+1thltMtoiMjW31nEpSP0GOXcRZdV/c94KaXEiCTitEmrGjUvHP7DGknn8moaCWK
	f2RUAmUorXnppjxxRBDIn/4lCohACTQMNgnvTAvqayMmO51qbUhWgT5xlo1EaMiFUO01abqUEhH
	muDj03pYEkXZlypZIYxJjIpz1rY3J4OXnEeLHpnDaKSurux3IcriFQdZ0QnuR6DWehr8DjbQa0o
	qTyhl/qc1u8t6TLgLY6wpk3WQxZqvlsjERUu+XpsMkIKA9AnHJ26ithBYUYyqXhbblHZfGdJ4Tv
	8Zz5xXHFobGyGeBsTk1e4SyvvJMyDpR5fkkEaMAC6xrNw/Zp3j46iqvvvkPBtBA21kW5CEtCNCh
	MQYSYnPMdX+bg==
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr28234165a91.8.1788756740085;
        Sun, 06 Sep 2026 21:52:20 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:19 -0700 (PDT)
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
Subject: [PATCH v2 4/7] selftests/bpf: fix typos in comments
Date: Mon,  7 Sep 2026 10:21:32 +0530
Message-ID: <20260907045135.13317-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215221_048879_9EA44F26 
X-CRM114-Status: GOOD (  17.02  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

The subject prefix changed since v1, from "selftests: bpf:" to
"selftests/bpf:", to match the rest of the history in this directory.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c b/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
index 1b25d5c5f8fb..8b96fb861368 100644
--- a/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
+++ b/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
@@ -13,7 +13,7 @@
  * IPv6 header with a Segment Routing Header, with segments :
  *	fd00::1 -> fd00::2 -> fd00::3 -> fd00::4
  *
- * 3 fd00::/16 IPv6 addresses are binded to seg6local End.BPF actions :
+ * 3 fd00::/16 IPv6 addresses are bound to seg6local End.BPF actions :
  * - fd00::1 : add a TLV, change the flags and apply a End.X action to fc42::1
  * - fd00::2 : remove the TLV, change the flags, add a tag
  * - fd00::3 : apply an End.T action to fd00::4, through routing table 117
diff --git a/tools/testing/selftests/bpf/prog_tests/task_local_data.h b/tools/testing/selftests/bpf/prog_tests/task_local_data.h
index 8ae4fb2027f7..9f2971fc7cd5 100644
--- a/tools/testing/selftests/bpf/prog_tests/task_local_data.h
+++ b/tools/testing/selftests/bpf/prog_tests/task_local_data.h
@@ -243,7 +243,7 @@ static tld_key_t __tld_create_key(const char *name, size_t size, bool dyn_data)
 		}
 
 		/*
-		 * TLD_DEFINE_KEY() is given memory upto a page while at most
+		 * TLD_DEFINE_KEY() is given memory up to a page while at most
 		 * TLD_DYN_DATA_SIZE is allocated for tld_create_key()
 		 */
 		if (dyn_data) {
diff --git a/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c b/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
index 624078abf3de..d7e30ee576c9 100644
--- a/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
+++ b/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
@@ -7,7 +7,7 @@
 
 SEC("freplace/btf_unreliable_kprobe")
 /* context type is what BPF verifier expects for kprobe context, but target
- * program has `stuct whatever *ctx` argument, so freplace operation will be
+ * program has `struct whatever *ctx` argument, so freplace operation will be
  * rejected with the following message:
  *
  * arg0 replace_btf_unreliable_kprobe(struct pt_regs *) doesn't match btf_unreliable_kprobe(struct whatever *)
diff --git a/tools/testing/selftests/bpf/progs/verifier_var_off.c b/tools/testing/selftests/bpf/progs/verifier_var_off.c
index a63e33675091..227dea0da3a0 100644
--- a/tools/testing/selftests/bpf/progs/verifier_var_off.c
+++ b/tools/testing/selftests/bpf/progs/verifier_var_off.c
@@ -225,7 +225,7 @@ __naked void stack_write_priv_vs_unpriv(void)
 }
 
 /* Similar to the previous test, but this time also perform a read from the
- * address written to with a variable offet. The read is allowed, showing that,
+ * address written to with a variable offset. The read is allowed, showing that,
  * after a variable-offset write, a privileged program can read the slots that
  * were in the range of that write (even if the verifier doesn't actually know if
  * the slot being read was really written to or not.

