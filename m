Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D576C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv/8WAsrrZD9Z6WoNFeiwDVhsb+FhzzkoAYrTP/tCf8=; b=ZjMKZ4ZvXUbOHVSdFlSiyoSuCm
	kXA5rkhGqZkU0qiEyvOGorIeiuKqCBzc/eUVgDaVOZkvBh4K96WM0lDws5xFpWKArS8Fkx8nsAB+l
	bqR+iiJm1mXvbZg2q2paOswvqm5cv1b3JZQ992j/9AVt56qOgonIgDLOnhsOONuwyOybNuZWsGQbm
	jK3GcOddbZOkIWiyP9yG1g+K4cN3ZYMjDnan3hvdg8BElM3rxFMfT8dOGFkKrRDpcd4xI2ar3KwHD
	+fR4p8SIAI6L/+APSseZ5+Q8kxp7pgr8suYYDid2Of40PCKCZaAOLXUSAaKF7f/AgdKyQ+CgXkiDN
	vGWSDZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RLY-00000005t8l-26ov;
	Mon, 07 Sep 2026 04:52:44 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RLS-00000005t5G-0Hb5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:52:43 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso3008614a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756757; x=1789361557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fv/8WAsrrZD9Z6WoNFeiwDVhsb+FhzzkoAYrTP/tCf8=;
        b=heO6bs/ILgBGQyj94y0vc0e6MMHOwS6Eo2LH0jgqq+t1f8syyBcDhcV7w9lKmCnowg
         Oc9PqZyFDvS9wdILfixct38G6YO1Qhz9p8gbIet5Tbl+Ga+HDacejotd6f3FLNf7+8BR
         yZXgW9zA0jZc28i92QYtr/GklZw/c+sImGpvd6wijt6JlGgGWPYGrABMe2j5eed/ozTm
         x3DkVtloZROeZj4reRW6smJDpr3yyX4g7MKOqla4FSognooQFQi7inVH/h4NvNw3oBYu
         sRMBGHcZ+ve5+cKZU50CpVkYFY5ZFdU/zckB/mDsV1hwX1X0OXD7r2uAiCsweQpO21gG
         /LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756757; x=1789361557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fv/8WAsrrZD9Z6WoNFeiwDVhsb+FhzzkoAYrTP/tCf8=;
        b=o3vRJSZISINcnGLHUabFz+sqNuucofd8foUHrAFpx0HCwcIGEMMi/JOOzkL1J6JWPW
         80DvTsmsY5j7YXX3bldkWpAjkgxge1a0BhhddRbxfHVn5CmLlqgIVE6ml0VXhdXKMx9o
         d4+I1ThJZ5iuyHAzPWdty6jcTZDOSjNDGk4lSu+tGdnV47FTEYYcL3692EWxYnqVh13I
         JaVYBts6O0Qwr0E/pKamBFkIjJ0KVjtoVNlRxJNV8FlCHMKzfH1MwD/xxj0ZBw11BjFL
         YNnysi/vGDYAD70Z6f5f0WN/KTBTWeE2bPWNass/XwibXlJmzkIJgnuhny/mmWkjxvHS
         MCmg==
X-Forwarded-Encrypted: i=1; AKwUvBx1QZC3QLq4hlg+h+1mRxO+GlVZJRndUB2K7CfZSfCVM46R4xP6DZk7Bpv4ZIlA3z6l7lEfRrZuD13wQ2Tt0r9z@lists.infradead.org
X-Gm-Message-State: AFuF++njdzYtTmiyFnLCuKK82B3vYmgKdsT4GJeGLNUYgUfWPy0MlmlB
	+rOsmzj9kgj2MnSB2vzhsWfO/ooCPhBPtC2X+qfkVIywGyZJ4dWMp+f+
X-Gm-Gg: AYBFou1cpVfND59PEosUmV+1BmlFBDO3HGrVqPfnZIRNp8FMqQi+4qN0l12wc1/Vl26
	r3ao1UgEWOOCTJnmTjnWb9vHvOAPcIphE/z5LfkjwVktwIeMe/TrwHgEJexAQ5eusoJEV3flBiy
	Uljwmr1Kf+HyohsWkcNqf2+7URuYzs0lwDdClIuDVFJSfXC3ETrWzSY2w1CaGTCSYIBEVkMw55w
	T5h+xYpR85497FOv9o9N1AXZ+zVkqmfZbyt/zfOP0C7dRBrR5LUESftKq2oQ0Tj4P5JFY1xqtQO
	tTkNVTTWN5SbVam+7M0my5qeybUc0ctco52L+NEaQhWVLeuW54D/w22Us9sfyTHEkuTQSZSITMM
	+KyDwJyVMiMLpFEiTGrTkT4nye4YvExEa9Ot1W5E9b6CnRRhZTlV8fzB0HOVk11Ipb7xwynxhaB
	7lgz7tobaskjd53QoCZkuA4mDapBU01+fXTc2o9S1H1QPZUeLXowSewC8AYBlukYWVc4oIMGCn8
	b8XV9wLQNxcwQ==
X-Received: by 2002:a05:6a20:72a6:b0:3d1:e510:905f with SMTP id adf61e73a8af0-3da39b3a6b3mr28486268637.1.1788756757103;
        Sun, 06 Sep 2026 21:52:37 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:36 -0700 (PDT)
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
Subject: [PATCH v2 6/7] libbpf: Fix typos in comments
Date: Mon,  7 Sep 2026 10:21:34 +0530
Message-ID: <20260907045135.13317-7-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215240_014367_1EDF76BD 
X-CRM114-Status: GOOD (  15.75  )
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
index 8417de92d028..c1745bee37c0 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -3843,7 +3843,7 @@ static int btf_dedup_remap_types(struct btf_dedup *d);
  * types, in general, can form graphs containing cycles, not just DAGs.
  *
  * While algorithm does deduplication, it also merges and resolves type
- * information (unless disabled throught `struct btf_opts`), whenever possible.
+ * information (unless disabled through `struct btf_opts`), whenever possible.
  * E.g., in the example above with two compilation units having partial type
  * information for structs `A` and `B`, the output of algorithm will emit
  * a single copy of each BTF type that describes structs `A`, `B`, and `S`
@@ -5644,7 +5644,7 @@ static int btf_dedup_resolve_fwds(struct btf_dedup *d)
  *
  * After we established for each type its corresponding canonical representative
  * type, we now can eliminate types that are not canonical and leave only
- * canonical ones layed out sequentially in memory by copying them over
+ * canonical ones laid out sequentially in memory by copying them over
  * duplicates. During compaction btf_dedup->hypot_map array is reused to store
  * a map from original type ID to a new compacted type ID, which will be used
  * during next phase to "fix up" type IDs, referenced from struct/union and
diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
index 2e56e3ab5b6c..c0933580930b 100644
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

