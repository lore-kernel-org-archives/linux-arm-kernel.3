Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0672FC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bC1WWh/xuFVa+YUjJaTnVEkwteG3jK4MlszJkiclU94=; b=twv8LvGHPF9PV+uRXMAr4iT7HZ
	vputxpuuvUejOU4Y7c5bvJqaifDZ+EEtipobfAZ70jh8hToWCI00Ui36w0Jj6+5K5WGRTs28JmPDj
	4O2+pfDPOPxbtif7bnt/GLAd7L+z+Gfyx2FtwflirU9Lq1t/J2kbRdjOH7GLQP3H6dUGXWL2Lkyc3
	KXcky6R1lg/WpogNcc55MzdkwLGFXHx8s5mc6cMsoN4SPhjgRf75MfwgLjrCg3ITquF9BYcgQYuNY
	7C5BVgipOsWBX/kLsYTERcVm91z0qR5+ng2zIlA2Tuj8jC5MHvwaglrNwInSIR/mwIZtBPxmyXikT
	bMQ4vASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2I-00000006jUY-3zDB;
	Mon, 07 Sep 2026 12:01:19 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2E-00000006jSF-2sdH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:01:17 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-39647184c73so4036190a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782474; x=1789387274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC1WWh/xuFVa+YUjJaTnVEkwteG3jK4MlszJkiclU94=;
        b=DX9hIjj1wh+Ar8pHqgHLhnEhOMz28580x3gjLmI+vCAFx7Xe7xkSJ76hptPctUmaeA
         n8zNgMiPiMsIRTISnqSU4qAOZceq2eJV7zvILCOs9i4w5TqC1J1JXT27cuXq6yhvJKoA
         JeePkr5HKb6fV1/PEKq5UanN/KexRk5pZpuRD2ogfCFJrLq4WgpyapKgLxAvcohPdz1t
         qCCUyiYeRTNb4MoqeylF6RkW5h3rRqxpaWbproZ6AybV0I8dJUXcCmRPynL7F5Zq0TTA
         TNgc9YluFPDWfTU46LxF+VQf/Ar3m7psTEzWZTqPk+ddoIuHVk6xlOP/Y1z46YOclhg0
         tqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782474; x=1789387274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bC1WWh/xuFVa+YUjJaTnVEkwteG3jK4MlszJkiclU94=;
        b=qvdgoR2cxANr5Myjk0da5m5bUenodFf0qXPjkMWUqdKbugwID594JiYbkgNSAsoVc9
         mWMlgkDQuvonzOBKtVwE4os2x3CKS1Qb7PlsVxqrmvpos0ulPf6EAc9okClGuqFwr91t
         NDbC5Pb5F5x/XC3ylXCIq+O30CJJLs+EvJTTsSybBijof6lO8P7r6SXuXbu9kbaKy8aq
         EU1dtk/8XT2nwJ+KnUVgDvkj4lm6hdt2aLcfDGrRn4nyMUfRvqfob8sARVxORcWecRR0
         pIG1qX8zicr12KN5bRMiFSfQsWjPLg7jJmGIR0JwXqWjpW5qSG7dHtGod51hIniv07Ny
         lKYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOIEwHw6+W9MxWgKCgKXfxZSrsUe/5sRAuw283kWeKq8heE1tnu+osRyahrF68hqA5BF4c3taGGyeGOKUJU2u9@lists.infradead.org
X-Gm-Message-State: AFuF++mP6YJbcmP3MvC5s1LrPb56wXCqoA1u/WRakGhNVd8ssmPyTFE2
	E82EL5D8xwryPJ/gmpYk2HEcvpZjSF3WHSvdAp7WYPV/UJTAR98CGWHt
X-Gm-Gg: AYBFou2Dt+DfVHnFpJOA7ZN2xpd+R/0m1Vgs2RbS7V+WgYH879dcOEYK920ktoKAQ9z
	MIpNgRBdsei/ggZtupz0vwKj//ksKro4/Td8UYfMNoZFYgzGyHFQntDouydKwpISBg64ILnhePy
	bSpk3MlguHQLDXiIuxBX5fKjMXTfaqv4rIGYW8xFQc86ELludLLPE59SmFD9m+Jz6mNrJr2juc3
	YKa7di+SlOhPxeu1LbghLlXsnt6CtB5MLcxAAzxWebPaHrdy82FgJs78TiyYPCbK3539hkpwHds
	4x3IOBb6yx9G2KpWsHetRfFp6q8huRg1MtPksNL0vluGE5iG0CTDFlYsxkLBEf6kroxHwdlAIL8
	Q2IDLncGp3vvl5FWYFNy1El2j/DBLbOtN0q123LiENc3LQBx0BcZafL0ie8pA6hUG2RSgFYsUVS
	cWMHiDsKFmqMnRTEktfhJyK2uM2w1vekTEj7/hKHtu59fri9xQKHKqcKWtBjlQmp6fr1P1gr4K4
	YQ9ZqgrS0rl6WgSSOGmu9sj
X-Received: by 2002:a17:90b:5745:b0:396:669c:b5f6 with SMTP id 98e67ed59e1d1-39b0803accdmr31092584a91.12.1788782473281;
        Mon, 07 Sep 2026 05:01:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:11 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 2/7] bpf: fix typos in comments
Date: Mon,  7 Sep 2026 17:30:38 +0530
Message-ID: <20260907120043.36894-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050115_965755_7F8062B9 
X-CRM114-Status: GOOD (  14.53  )
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

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/filter.h       | 4 ++--
 kernel/bpf/reuseport_array.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/filter.h b/include/linux/filter.h
index 00ad8b63aa47..4eff6e601b05 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -147,7 +147,7 @@ struct ctl_table_header;
 #define BPF_ALU32_IMM(OP, DST, IMM)				\
 	BPF_ALU32_IMM_OFF(OP, DST, IMM, 0)
 
-/* Endianess conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
+/* Endianness conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
 
 #define BPF_ENDIAN(TYPE, DST, LEN)				\
 	((struct bpf_insn) {					\
@@ -1029,7 +1029,7 @@ static inline u8 *bpf_skb_cb(const struct sk_buff *skb)
 	 *
 	 * In some socket filter cases, the cb unfortunately needs to be
 	 * saved/restored so that protocol specific skb->cb[] data won't
-	 * be lost. In any case, due to unpriviledged eBPF programs
+	 * be lost. In any case, due to unprivileged eBPF programs
 	 * attached to sockets, we need to clear the bpf_skb_cb() area
 	 * to not leak previous contents to user space.
 	 */
diff --git a/kernel/bpf/reuseport_array.c b/kernel/bpf/reuseport_array.c
index 49b8e5a0c6b4..4de08abfd94e 100644
--- a/kernel/bpf/reuseport_array.c
+++ b/kernel/bpf/reuseport_array.c
@@ -207,7 +207,7 @@ reuseport_array_update_check(const struct reuseport_array *array,
 		return -ENOTSUPP;
 
 	/*
-	 * sk must be hashed (i.e. listening in the TCP case or binded
+	 * sk must be hashed (i.e. listening in the TCP case or bound
 	 * in the UDP case) and
 	 * it must also be a SO_REUSEPORT sk (i.e. reuse cannot be NULL).
 	 *
-- 
2.48.1


