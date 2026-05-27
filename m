Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8A3CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6no4BGDS0XyYdBrexKoo6TT3tPuXPbKEDRVyJ4oD9Bg=; b=sIy6rHHPNJBEx224HTsY39Pr6o
	rsOTPBdK29wq6AjAr1ca/VZ6QqZ2jH7Lf1KfzO3rgDgfPDwW5sK/bQV9YRLjhy289sl+yCPKGqNL5
	sV1tBlPJAv/uDvHAQYDhP0i2sLXKt5TpSGXLUWF7jQkvc2rbVlY5NL7/VirYyQsrF0wh+tWVGdhkk
	YLZwRYGzOThqDf7uMM4kpvGKvytW/xWEuBxBPN/VK3pCoPGe2uVu4Cz042jMec81n8Y9zTrjmKjLf
	9XpqJ8qSyh5GWNQQ8jGiP4sCtu3vjF7BHqzoDT6Y19YYNGf9WTdhBr1Jk41TD1WyxKIrfagBR+XIy
	eAS5u1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSD7z-000000043Qa-09ia;
	Wed, 27 May 2026 12:12:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSD7s-000000043O5-1rST
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 12:12:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 391BC42D53;
	Wed, 27 May 2026 12:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6FE1F000E9;
	Wed, 27 May 2026 12:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883963;
	bh=6no4BGDS0XyYdBrexKoo6TT3tPuXPbKEDRVyJ4oD9Bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A4T6SXkbAlc54eDKw65mlkSVgcFAfv+QCqI6M7Eqoj4vFARUv2EOY3fIBfVW0xv2H
	 MynfGT2ZiSPWsJRuX+AzZkU4oh/nFxWZOG9i3D/mzZenfWXHaJh9ncMgHsjLFjXcCx
	 7A7atXEQJDJYgWXAZiK86m6DTRnAQv61S+aOkAcGaedRko2FEsgCYeADBJK28goY2E
	 xyTx6OYYQ77qUlPZCUZYxVycOP1AvbgNLtKM9axnbp70Ngin8pZWTipAm6TNWTtHvf
	 tXiqXY7lM3yvojNpVnCTikZTtctK6Rfp6wTsdF2g712JE+Nu+3/XaCjSIRxhVxyRqf
	 x1M/Kkxf0MB/w==
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
Subject: [PATCH v4 2/4] perf: Use a union to clear branch entry bitfields
Date: Wed, 27 May 2026 05:11:58 -0700
Message-ID: <20260527121207.2312181-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260527121207.2312181-1-puranjay@kernel.org>
References: <20260527121207.2312181-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_051244_535289_84795AFC 
X-CRM114-Status: GOOD (  14.06  )
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
 include/linux/perf_event.h            |  9 +--------
 include/uapi/linux/perf_event.h       | 25 +++++++++++++++----------
 tools/include/uapi/linux/perf_event.h | 25 +++++++++++++++----------
 3 files changed, 31 insertions(+), 28 deletions(-)

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
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index fd10aa8d697f..c2e7b1b1c4fa 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
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
2.53.0-Meta


