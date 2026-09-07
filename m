Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D23CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F8xNc6JnbnOhSUa3MmC6YFjLwngFDOoggPy4Vs2zK4=; b=ZJmmfg+XkIJhm9Judwwnn59HCC
	TcwarMjuyeKOkTfQf9evB6zrjbpwJ8E8EsJhp+MIrE6YfcKg4EnyK9ZwDDc7AgZAEa+WijLn/5LNQ
	vodw8blNK8VkyMJHE5Adi/6bYKQyeb5FQeuwrWxs8huo/NcS1QbVJ47B558hYYWV/0/9rvystkQ3l
	3Be5Bwmp+f/RuugsQFEgL0hUuJNSj4HoA+HJ9yZug3Q2y+rj+RmE2abQrFhDhchcrN/YdGBOva0wE
	MNY90Hq5ypi8ZNHPWO14q2WxF06z6Og24J91U0Yc/1HTNSYluNiG57yA1yOv7OF0quGjr+LKF5ONJ
	Eq4RznZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2u-00000006jmK-3y6J;
	Mon, 07 Sep 2026 12:01:56 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2s-00000006jkP-1Ej1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:01:55 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7eb6573bd52so3309328a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782513; x=1789387313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3F8xNc6JnbnOhSUa3MmC6YFjLwngFDOoggPy4Vs2zK4=;
        b=kbW3B7hJIlVyV/aH6xJM22fBGXiph87RZexE/IEvqFNLrNpVnxT+TZesRvH1/GaTJA
         otJINCDdDhgi39hnJXTGf5zGy78VMimsklxDff6OkwGYx9ZrsEQjlnxnVXdS42nMnePW
         DTeI+OgkNGfOhbqnopy1Hc/2TTldgZGEOfPlWQncMmB/ZUHDN06ydvoHGWkj2c8JMVN9
         lCxDZ1RWRIuNzEO0q9s/OBgfyhuSzw/byvhxjCYEplZl3YP+TPCAF+Tl1efWC4i+f7jv
         csHqgtyvt7gxl/s+i0mybgwaqt80sSr9pPoczxUmNsrm1Vzg2hoUB1THRY8wNZWllvmn
         8qAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782513; x=1789387313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3F8xNc6JnbnOhSUa3MmC6YFjLwngFDOoggPy4Vs2zK4=;
        b=sF11jc7zsK9R4L/CftHizIuCBpIZCc3ViiPZNuGH/35LLgvu3+yqhrQhi534qQbFQY
         oOiCWDLrzxBoYNSDPBKd6K2YBBDrBv/EO9ZFswWGhPUMNWCCfFNd2fkedJNyYbhYLF4S
         TQWVMVPh1yRPHyqDdljrUiI6nkm9WJxZpD6cM9NUN13Hl6vZt+2GejdTLEoPshb8BQMb
         o23IvRXG6xk/lrjNCheL9M10k2emX8lqF6vF1etY5+q4zb4OJDgl4RJ/PEAPEKSLHdUd
         jWpXnSh1yezGGarDkyFtK6PF7+eKd+G/PlRnxc8JnJhrqiZ3LoYXuxI83c6q506AhJuX
         3pFw==
X-Forwarded-Encrypted: i=1; AKwUvBymK8jEG4S0ApPH/nLUIIJDoSnvHmV0fA90Fqdafsix+zou5MOQDO2iABqOxA0EbDBTbpwg9LaLhlmXSF/CLaLC@lists.infradead.org
X-Gm-Message-State: AFuF++mm+Egvs90QOt1dkvEi9oe6DnwYba9oX2ukyDzX65CTLnGFEHfn
	RNi2JrawsvPf9VS1qyqHUY8VdUM37YUNZl++6k3M1MTE2eGvsgCu9mlb
X-Gm-Gg: AYBFou33YZ0UhT7gmkpLmQXRYAwpzu3G7NAu9mpxNR5rxxcTNGMOr5ihXXhTAde5VDb
	+iFfvq4siCMN/0/Aztjb8J8MVdUAxHCSvTj4Q00HZA5+k7Wz7ZvAVsAiqO+VuJOklAjbxQ2wHSa
	ZIyvh7rrxgy0LwbHe9DqlSRvgqbmAUe5AzZ7jbWu3GPCRJbwOsT0luoS8CDOX18hBT5+RA74Z0M
	jb0uieO9m6KiovbfPccsu/nhDgPHqOt8djQFgbf7NEX0hgnU8rU/yI4yN9l8xkZGfyc262t/QTV
	PVQO+Y23pH/U/ECEsdqGXBAxOzlNwmxvnfhpKXmEVUZK3WVW0q8sU/Xvd+BP2ggWiSrLnZ1+pGm
	hh32xIgbg7VdDMGdBYclJgTeLntBf4p/vKxMzcu0yTHhUoPmJGg6TuqlkQuIV9M7Lid1QYM6h5o
	6pN5Skr2R1WVvkzgZG7PhAxkawpN+DJGwvUIr4qC5Vl5hxRHM4dsubRHXvZDWNLk+Y4IqLAG09f
	ey7DEdE/XhUyA==
X-Received: by 2002:a05:6830:4424:b0:7fa:5c49:5243 with SMTP id 46e09a7af769-7fa5c4954c8mr12694235a34.28.1788782507546;
        Mon, 07 Sep 2026 05:01:47 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:47 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 6/7] libbpf: Fix typos in comments
Date: Mon,  7 Sep 2026 17:30:42 +0530
Message-ID: <20260907120043.36894-7-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050154_458721_F1C282D0 
X-CRM114-Status: GOOD (  16.29  )
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

The subject changed since v1, from "tools/lib: fix typos in comments":
both files are under tools/lib/bpf/, where the prevailing form is
"libbpf: Fix ...".

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/lib/bpf/btf.c  | 4 ++--
 tools/lib/bpf/usdt.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
index c783359977b4..d1c73113e58f 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -3847,7 +3847,7 @@ static int btf_dedup_remap_types(struct btf_dedup *d);
  * types, in general, can form graphs containing cycles, not just DAGs.
  *
  * While algorithm does deduplication, it also merges and resolves type
- * information (unless disabled throught `struct btf_opts`), whenever possible.
+ * information (unless disabled through `struct btf_opts`), whenever possible.
  * E.g., in the example above with two compilation units having partial type
  * information for structs `A` and `B`, the output of algorithm will emit
  * a single copy of each BTF type that describes structs `A`, `B`, and `S`
@@ -5648,7 +5648,7 @@ static int btf_dedup_resolve_fwds(struct btf_dedup *d)
  *
  * After we established for each type its corresponding canonical representative
  * type, we now can eliminate types that are not canonical and leave only
- * canonical ones layed out sequentially in memory by copying them over
+ * canonical ones laid out sequentially in memory by copying them over
  * duplicates. During compaction btf_dedup->hypot_map array is reused to store
  * a map from original type ID to a new compacted type ID, which will be used
  * during next phase to "fix up" type IDs, referenced from struct/union and
diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
index ee9d1b614883..67c60f716c1a 100644
--- a/tools/lib/bpf/usdt.c
+++ b/tools/lib/bpf/usdt.c
@@ -144,7 +144,7 @@
  * about. This state has to be maintained per-BPF object and coordinate
  * between different USDT attachments within the same BPF object.
  *
- * Spec ID is the key in spec BPF map, value is the actual USDT spec layed out
+ * Spec ID is the key in spec BPF map, value is the actual USDT spec laid out
  * as struct usdt_spec. Each invocation of BPF program at runtime needs to
  * know its associated spec ID. It gets it either through BPF cookie, which
  * libbpf sets to spec ID during attach time, or, if kernel is too old to
-- 
2.48.1


