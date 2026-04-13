Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F77F531C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeYPSDGXS0RvsIF/D/tFQHAyDiBPAywW+yzcYLwRaQQ=; b=bOzjgv/jIS9YOM9T0oBkSje6TO
	4pIWq1GnMxcg4mVs47lZ3LH81+lV44E8tTStU8R46OCGJURaC1MxiReG9v8K9temmLDACbKQJGdod
	aaEXaIsSTcRllbXEqkwKp4XoOv3nlpG3lIV44nTYZwJ1fHYxHyNQGQi5QzELLxenJ+Pi4Iy0nIbsW
	0sdOKEMoSN3ZGiLB95QFDstwE4SyBvw5MB1REMdLO/M1yAZ8rqNLonoX3vdcOZbPPrqcskbkWtAOb
	J2V3qFH/7sKcOG0HjogpISoinEiSPK4M1ZFlyUsID9pihedZ2a8hvt/vLPwcDRqIOaIagc3W60mtT
	SJFQYrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMUS-0000000GFEN-2WrD;
	Mon, 13 Apr 2026 18:58:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMUQ-0000000GFDV-1O3x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68CC14388E;
	Mon, 13 Apr 2026 18:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2382AC2BCB6;
	Mon, 13 Apr 2026 18:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106709;
	bh=JQPVHfvUkzj2ic9SS65cmjJ9pkCh/Jz8i86/isDKNZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PYOt2bz4Gg+cTM8EoWwBy0FSyl4AWWaEADtib0LmRnPICQ5nItok66sSo64KYL8mU
	 aWqAQc4VbMpftssTkn/Wy/zpsnc5JzF4mUUdKbiqIMFFAj0C/wLRHCFi3n8PeMwci/
	 04Z/IJe7JjHwj9kdvmHXz+dtxwz7kq4jFgrQqzAyFS6MPxR41hkiI3jrsE8/VeVrJs
	 uOOTZsHJzRBlIwNMmYDNyXbi4/uJsq3TKwC2AiWcItqUnBWZMQF1uF7x6GlmB7wWqU
	 WkGVl3rfd5mstu6bqRKmYAEtrVubwR8mZNsRSTFFThxLqowYT9Tl8QZeKZZYREXkFA
	 WRHj4cX6/k6QQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Stephane Eranian <eranian@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v3 2/4] perf: Use a union to clear branch entry bitfields
Date: Mon, 13 Apr 2026 11:57:21 -0700
Message-ID: <20260413185740.3286146-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413185740.3286146-1-puranjay@kernel.org>
References: <20260413185740.3286146-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_115830_410845_F7381FB0 
X-CRM114-Status: GOOD (  14.36  )
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

perf_clear_branch_entry_bitfields() zeroes individual bitfields of struct
perf_branch_entry but has repeatedly fallen out of sync when new fields
were added (new_type and priv were missed).

Wrap the bitfields in an anonymous struct inside a union with a u64
bitfields member, and clear them all with a single assignment. This
avoids having to update the clearing function every time a new bitfield
is added.

Fixes: bfe4daf850f4 ("perf/core: Add perf_clear_branch_entry_bitfields() helper")
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 include/linux/perf_event.h      |  9 +--------
 include/uapi/linux/perf_event.h | 25 +++++++++++++++----------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea..f7360c43f902 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1474,14 +1474,7 @@ static inline u32 perf_sample_data_size(struct perf_sample_data *data,
  */
 static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entry *br)
 {
-	br->mispred	= 0;
-	br->predicted	= 0;
-	br->in_tx	= 0;
-	br->abort	= 0;
-	br->cycles	= 0;
-	br->type	= 0;
-	br->spec	= PERF_BR_SPEC_NA;
-	br->reserved	= 0;
+	br->bitfields = 0;
 }
 
 extern void perf_output_sample(struct perf_output_handle *handle,
diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index fd10aa8d697f..c2e7b1b1c4fa 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1491,16 +1491,21 @@ union perf_mem_data_src {
 struct perf_branch_entry {
 	__u64	from;
 	__u64	to;
-	__u64	mispred   :  1, /* target mispredicted */
-		predicted :  1, /* target predicted */
-		in_tx     :  1, /* in transaction */
-		abort     :  1, /* transaction abort */
-		cycles    : 16, /* cycle count to last branch */
-		type      :  4, /* branch type */
-		spec      :  2, /* branch speculation info */
-		new_type  :  4, /* additional branch type */
-		priv      :  3, /* privilege level */
-		reserved  : 31;
+	union {
+		struct {
+			__u64	mispred   :  1, /* target mispredicted */
+				predicted :  1, /* target predicted */
+				in_tx     :  1, /* in transaction */
+				abort     :  1, /* transaction abort */
+				cycles    : 16, /* cycle count to last branch */
+				type      :  4, /* branch type */
+				spec      :  2, /* branch speculation info */
+				new_type  :  4, /* additional branch type */
+				priv      :  3, /* privilege level */
+				reserved  : 31;
+		};
+		__u64	bitfields;
+	};
 };
 
 /* Size of used info bits in struct perf_branch_entry */
-- 
2.52.0


