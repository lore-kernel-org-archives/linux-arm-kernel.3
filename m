Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA180C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F8xNc6JnbnOhSUa3MmC6YFjLwngFDOoggPy4Vs2zK4=; b=ArxcW5EwVGQFfcgjz3aa7T6jZt
	m5kjt3+78odBmqV6/z89ELqnEm0LdbqNrzTvEoVxIecdtiuVB4kqQXPGkpnBl5uIjfomCklTO2kmu
	t5gHGPXoiExmx2CBWDEku7+84g+1AoW54gApvjc4SxNnRhh0IU+VGm96W3CveY9yCiG3Kf5ynhwc1
	Akzh2i1BWKpF84TbOdkzdM8bTNzmr5ArwVytc6oYFYnLPL/f1D2S4EnNB2FWajo9Qi/X00Auvguuq
	mmBMW+zx/mtiknlTwUixqP58Q63yrV6z0BrUlmq0JnXDRVeUViDM2uLuoSV505xg5hfvYk23ERWM3
	bcfTYdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oiU-000000086VS-1BGz;
	Tue, 08 Sep 2026 05:49:58 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oiS-000000086UR-3AKq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:49:57 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso3179522a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846596; x=1789451396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3F8xNc6JnbnOhSUa3MmC6YFjLwngFDOoggPy4Vs2zK4=;
        b=dVCJFqUVI7eYVB0AiHt/hdsHAzgi7o57yfS3owrYm/yQdQUrXDlu6MDgeBFU3V8PpQ
         bXWJrGfF+Cjtynk3HnfIT8c1sbzrrMgVlK0yDt13KR+2l+8RL9YM82uJPyyxV1m8yvIK
         yMOQpnhWsfPvgIPflYZuDFM7FBWz8bLgoCVP1QnmdhIz5ZiqjHbE9OCwPdz3+Vv/E+h0
         dgtDrPI1AuKpAXiUbpqMlXSNzIhSjoNOVikqFEUdZv63h0uZ3KIBzFjUjrd18yUjpMuT
         StPlBsRPtYeqYHZOUVw+UmOmY3UvOYJnNiNnE16gKihhP01CFv3vpr7n228eclyD1iLY
         dExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846596; x=1789451396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3F8xNc6JnbnOhSUa3MmC6YFjLwngFDOoggPy4Vs2zK4=;
        b=f6XkBvkrGZEF843jYGE98ANVfWiX8Ig8QxhLcIN6WRvh1eJdw0MBRDMs5D5p7d5nr7
         GdR9Ptu67HdRsCMvejJVu1WIzy+U0cvmDBeWP6iYsMJmNwy0k2BdJMHE6qeYdH/39vHW
         p900KrqiR9xCu1Rn1JqnBvaiVrWTf16KNhDj6Hl4fLZJtG5inYMeYlrnlNBL7F4lo2GC
         pznwIrYJvjVDUHYcMzpOy7RZ7RXSrlZv6DIgKnY3LyBCdyjyaBS3a141WGIyDHvCxp8R
         ENwWYQpOeZpOaN8EGeAgnWSnApBw72KzhF+uNLYx7zPB6c0gAylEC3/P/xsGw3rRCLC+
         RqLw==
X-Forwarded-Encrypted: i=1; AKwUvBxeaLkdnjO3jksgzzK+Fk2UYRxKhE6zV1ZBCESZnlGco1nNaCYaaaodN+NpWYA/C/T9F9aTl4mse2mUblD9whVQ@lists.infradead.org
X-Gm-Message-State: AFuF++kuNKOVVTJhDCZeA/sNUnEnatz8Qwe3t6UOW4yZOfJ7nN+mCBUA
	K3fCk2lZqBUJKrK3AjfQkPiQ3b3FYg+7W5Qr2azGz9KCqWzb81lzNrF0
X-Gm-Gg: AYBFou1MKy/aMgwCkx2VxSah5miiL2r1RwlDq2Hduc64gqFPofjl0b2cp8bu6AwLI7F
	b2N799MRpmdaH9Ggh1gnekKs09RCJ9w+YOCJQXsri1KZwQGpp2/DxAAVasi/gEYy3oobFkaa7Op
	RCRzF944o0amCoCJkN2RIdAwWHa1F/iYVGWDYMiqlU+y39RGHKus3gfPPNAW2KiZoqAArqkvRmi
	JKI3p108nXdL6fNlGTqEUks3LyAqBsf0mvVO8WNaLd9F0sQ6lYk7f+Y7ZtoXZsfYtNgC2m66N4+
	M6MlbEuEsOTL65a9/rjsoQjfyJ5ruAs7/PpePRN9sgl531yNEW6qpWzW/0k98HCfABFSS2SQ7Cd
	Z5P17GKRjC4K1NBi0N0Zof2uK0N/HGnuTeZ0pyU0Z2CTccDsxv0csfbMCU3i5e41uLDtX4U9VS0
	sOtCVv6zvaXK5t7BMjHh6qmx1UbgQiERrf44V8PJpRjce/JaV4TaG9dfDinWGvZrB0hzH+00kY9
	kOaSnsVglvDywvAFjJ9BwBl
X-Received: by 2002:a17:90b:2e4b:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39b26151b89mr41589578a91.6.1788846595925;
        Mon, 07 Sep 2026 22:49:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:55 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 6/7] libbpf: Fix typos in comments
Date: Tue,  8 Sep 2026 11:18:52 +0530
Message-ID: <20260908054853.13820-7-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_224956_790253_0FD6E2F9 
X-CRM114-Status: GOOD (  16.65  )
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


