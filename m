Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44210C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gH9gg1qvejjX/sPdW+X7GvG6xfgdjVwQ/p+bz1yISpM=; b=TYSzTvydGQNoggrZ417HjWa4lN
	xZO5hjdNaVWQKyqT0CN2s2BbIMKsD5P31Z9sRJMOuJ8qa87QXq5Sifst6mlUd7HwDSHD++KQZL7o5
	XV9U9L62Yyg42RSSXik7sxuTL1ofk6pYykWIshom8lps/pR43iF698Uko2553AfO2ATLFQH9I7ho3
	EUfBTyDR4gsKoZandVEglo3pUAGRCmIR5NaKr4k1+/0H7xLI0ruYXDPKuz/CTplGV4SsYfafKB+Af
	aIWOHrc4Jk7mAbiB0Cn4yvflcDw6TfmfQhgwv7ehGErEQMrPXmYzXH5r8+IQhib4YQF8JTCE0yvPn
	+KhP+30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2S-00000006jYb-3OF7;
	Mon, 07 Sep 2026 12:01:28 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2O-00000006jWj-0VAp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:01:28 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-459281bc13bso2310968fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782482; x=1789387282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gH9gg1qvejjX/sPdW+X7GvG6xfgdjVwQ/p+bz1yISpM=;
        b=DZs4Y9GcD+G4+OWcEM7YbUUnoBtil9y8nKFNeQoJHk7L/Zq1XxaIP/xY+Wciva4Q9N
         3Yg/miO5pj4xsFN5ZosaXbSnFtaDAvu9tig69saWG+Lic15m6EPDj4zCSgH6H/7IH4NC
         6h6aL75HFNyA5xxVSKrvYDk/vN58/jgCec5q0w1ktkyLqbcM5DjTOW7bltiHrfHBtXbW
         51pQ/sK+fwEWOjW38A4IRGRo175805uQRpPtuhfjoyz6hHNStnKPMSZ35acr4xcQDCWF
         J2OupeVV/iev20sQvb/eB1Msn2BVUJdufZEc3aBcygj1BX5Aa1qO6Rb55oEmB6eA2F3t
         ZuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782482; x=1789387282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gH9gg1qvejjX/sPdW+X7GvG6xfgdjVwQ/p+bz1yISpM=;
        b=kHPUwHg+6c6hPEPbFN3foUYFuujsv3Km5SuHZRA+Mi/63QMID7uvJlwLonhlifmWGb
         /YeyRUwf9yiszhES18bhy+l5CTNRAMlkFyTKHvZkYx4ARu1xM8RnEjtOuP1pqI3xhLcd
         o2qIaSU71vp+dSJZHxuBLfR1JQvc1MK9QQGqgE3tGhQWX9wFIDkHYXeWwKULMDYVUCOx
         BMsMHKD3zi27rs7rJp3NiivfWrPCkWs4lVvFXv7c9keWnkcGvwwVPR3W3bBi4DPLhs8N
         Mp03vwgJhcvrFddbpr6AeD/gVcTY+wF093dM5/viXtChRkTHg3G2CZbHgTDP6Ow6JNtD
         B42g==
X-Forwarded-Encrypted: i=1; AKwUvBwljeMVHm2yVuhXU98ViYcCnQr72/bzhWhtukHS9hBCn2q2s+91pTV/vqxXP08MEwz/DeKWz5jePfi3a5/aUFHa@lists.infradead.org
X-Gm-Message-State: AFuF++kZqaKVgqkdHiEtWobe2zgs1Xl2cGUREQiGscqAF4a6fdh1znA/
	ZHLMWh3HoYL0CdjwfhgVqKsxfJIwPdsNANvFfnRq8pgZzg5pNmWATeCy
X-Gm-Gg: AYBFou1563rfXgKLIYCNAyu0jfilQOCnDIlqa9U7yJxDs8zL6WYd17vmkDwnHxNkxzl
	hUubEw5gSaCyapKnLgvk/7lRjoe2iYWvAi6yDKrvj5a5Qlk06ThzedlLLu3fAYondvvG7+qF14w
	QFLeBP8UYkIL7TfQM1Zd5tcO4RXNTKCwH82l0cXzhshcZVug8/9N+sdBaiJVlnLf4vxrIVgXtWG
	EPdY+v0zK+6gmSQQLb0aZcb7F1DvZ3m64cdz+UTjZpoTS0COUKb5ZYNok8WnA1U5V4UfUK98Q4X
	WBCBY+ClKhCwQvQjLLwegQbb+OicnwMHO2he/zoISYhQEv4E0XzQ4DKoIrTe/H/+ROaIP0W9mGP
	kmEhmP3dpAViIDSExrnJOMw0OujOYKNwCpRNXwKHFcvvpNojiQclktEhoZpCwp+up+w4bDo3o8p
	n3qwbJmS/CdtaC8RiZkZYdppB1HVYRH0UXybB6fp7fRVpbJODPL+Gd60JTuhZipvk7SW2QOuXdp
	ki/Vi/aQe6ivA==
X-Received: by 2002:a05:6820:a0e:b0:6b6:d425:53f3 with SMTP id 006d021491bc7-6b6fddbd240mr13817787eaf.33.1788782481883;
        Mon, 07 Sep 2026 05:01:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:21 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 3/7] powerpc: net: fix typo "upto" in comments
Date: Mon,  7 Sep 2026 17:30:39 +0530
Message-ID: <20260907120043.36894-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050124_166073_C0959576 
X-CRM114-Status: GOOD (  11.62  )
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
-- 
2.48.1


