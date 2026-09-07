Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD536C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGe5bwb/eYgn9AMup9CCvH2ogR87NmRNuEpL6c/z+js=; b=oUykf4JfZrp9k4E9FlVvYEE0pg
	wcVnPxdnpf17+uhAiDUPk6ROqUpIESp559XIhzoeoenBZAsDjj+v/WJgONAjOScxC6jCauxKf07be
	NoZxoi8CLnnKPARTqnnx45snhqH3KDWqHOV/TMsNoMlfvcejUF6ecYPkuy0BNZ5UVyJ3P/eJXha1O
	6IR6R9SQb3L6JUzo6FtLW6fXErDY0oRoTQsvOai1FeUmsVE0X5mMa/kfjGRKfBMtuvC5SXzLqoMRk
	YmXT99+7h78xti4AmXl5j0dbiRQXo3ymIA1fmtNdgggsdsZQ3u2sA9xIakyG0xE9Td9Q+TeJPtCwi
	hAJ5hREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RL7-00000005svV-0RIJ;
	Mon, 07 Sep 2026 04:52:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RL2-00000005su8-28Wc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:52:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d9201076b3so35350745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756732; x=1789361532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGe5bwb/eYgn9AMup9CCvH2ogR87NmRNuEpL6c/z+js=;
        b=mkbABnREbbCtWoPSbIa0/DCPzE3jauTDLGvdNcdH60W1CFQMUuFQ8kDlX3oXXY+t2S
         Yz/Q9N9FusvCHCksDnc1CAWm+e3oH1iRdrx4XTVUtI5FsWRVLXLditISsBGVyONNV0yU
         mwxkQrOyHBL+674ZP99mqey0bGw3IhiEM4e6unWLy1L+dfkMcBNVl09s2nSNInSKvVDr
         1FCCIRB/cg9/0t7D86sUNgmtc2BiWVHuv66JPnMnpDDu62ny5bhjlG7WBSrvMQ+CXnGt
         oJHoTX5lAVHN+Zy19u3y6zdIthlCWuWGk7OjvDb9pcMFZOiLKPVdGHDLUE6UCIZ3pO06
         PfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756732; x=1789361532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lGe5bwb/eYgn9AMup9CCvH2ogR87NmRNuEpL6c/z+js=;
        b=sE7qAlL8xCVaJLmc3MGbA3OH9UuV0BqvhTGxO5UU5960NeHrdq5R31/A1Nv2hD0O2M
         nlF5Jdxt0Kba+ESJtiltWRGbosLzxzCVVVeuPIGtFDHPDiy+ur8Txf5hXVAiiC4mEWAp
         E+KtYz/ZXlOXA1Sjf/uxIfOO3eB8QVw3/Q3uAV21SjLKkSMau2hs6Pe/xHT63Uw5aS6R
         RooLQYXCVHuX9YdYeFxk/z5rUcO9+Sf+EezeiqVLlMO+7+G7V8osE+faJWx+1cD1nprG
         B8kGDMp5ssZ8uI8myhM0cmjPMlhmMSHaBhezAhQzPORPeV0VIrbLtIrUgQ5T3OvLCPBc
         FggQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwm283krzpakoMtq9DvK/bYJHq5YJiTG+PmRx2PB341igqqngM6AusNAL3XsfdaE905KY6K49qoeQ9gNtE1e0Y@lists.infradead.org
X-Gm-Message-State: AFuF++lHI6iR9cZbfrvViGbkp0kc+N7/5BxbZIIYgBSr1DNS2JfIys7u
	dfwPw6b0n8xn8vF5fwk1/ZXVYBEux41xuxyCatlogyBHF3o/VJaKwP6C
X-Gm-Gg: AYBFou1nWq+HhTpGD723NFI6dN334m67r6O620XSBIYwMKQ35dw8mhI20TAMmUxlUWY
	feseeJwwWtQAu4kCtES+VEwhuHnjqSN0gIDPpEt1Z5FIm/q/t1mn2EJaQBwE9ZxlYwy7GweZbvG
	l2i+Akr91Ev7w/nJyjoVP2+07Mx8bf/oglRyWYCn9GSkOr826pVRSb7O4sWxgu3zdWGGcbNxqTg
	G1WVCapBpwxLoLjSUQhQUD4fNqbiYn1FyBQiQdSzeP6iUvDwHPTc6xHufg0N18LPGoNi6ojg/OH
	YXfkKXF/YRU72dvX6ebumv/4AJ2FcnxXvrmnTu3Xxu+6px3fte/mF46Mqe/DOiKBYYxVGopQbV8
	8PmffznGkjOhqZxs59HihvwKNlnFhA4/ci2w6O5LSgnLqpzxLWkjfTIHMKqbcyBxgjccxeXMVyY
	Teq/p5b3XgYEZd+UzjhN+R3SueFYK6Klj9auhMUQSGa0pK6mPDptcwkOICx7ReNqxI6iihl9RNd
	K3pdtM/z0D85A==
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32amr28690908a91.21.1788756731628;
        Sun, 06 Sep 2026 21:52:11 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:11 -0700 (PDT)
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
Subject: [PATCH v2 3/7] powerpc: net: fix typo "upto" in comments
Date: Mon,  7 Sep 2026 10:21:31 +0530
Message-ID: <20260907045135.13317-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215214_009907_277F0BDB 
X-CRM114-Status: GOOD (  11.17  )
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

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/powerpc/net/bpf_jit_comp32.c | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index bfdc50740da8..cf8c1b49da25 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -23,7 +23,7 @@
  *
  *		[	prev sp		] <-------------
  *		[   nv gpr save area	] 16 * 4	|
- * fp (r31) -->	[   ebpf stack space	] upto 512	|
+ * fp (r31) -->	[   ebpf stack space	] up to 512	|
  *		[     frame header	] 16		|
  * sp (r1) --->	[    stack pointer	] --------------
  */
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index fc9db691e820..8a1a00026c69 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -23,7 +23,7 @@
  * Stack layout with frame:
  * Layout when setting up our own stack frame.
  * Note: r1 at bottom, component offsets positive wrt r1.
- * Ensure the top half (upto local_tmp_var) stays consistent
+ * Ensure the top half (up to local_tmp_var) stays consistent
  * with our redzone usage.
  *
  * tail_call_info - stores tailcall count value in main program's
@@ -35,7 +35,7 @@
  *		[   nv gpr save area	] (6 * 8)	|
  *		[ addl. nv gpr save area] (12 * 8)	| <--- exception boundary/callback program
  *		[    local_tmp_var	] 24		|
- * fp (r31) -->	[   ebpf stack space	] upto 512	|
+ * fp (r31) -->	[   ebpf stack space	] up to 512	|
  *		[     frame header	] 32/112	|
  * sp (r1) --->	[    stack pointer	] --------------
  *

