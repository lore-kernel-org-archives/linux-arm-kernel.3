Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DC460A381B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=if7+n6js;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Qs4/9F3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HdoJI368+i11GTohISpbz8VghvyqGRYi37yZFl4fhSU=; b=if7+n6jsNIOxbX
	zFF35RqVNtmiC4PVxN6jWMEJtAy5lj34hlcm40A4/Tu+pHubujK0MrMBEpl/BH51gJXnsAY05Sy2j
	anz9sxDhS2zpulZ5ISs7Y/G9SQchnwIHTA/r9kf51NcSsVXlUMxrRQtONV5Kqd1mbcx2VpxtULAT0
	DqUcXzs3Sr9VoVmqZxLuW0r9PrXFPPS4NZCwKQkZkBStSgcW/hHAkBhZGF3lb1RabG631An+jj3Xa
	azQ1hnlD43KXhphcEFJ9ZtMvN7Nh9CA5Vp2lfvJbjRjUDJ74WxInjsJYfxBREY8sSC6KFYCylDgX3
	lq0cj6b03cBmPhtSfwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIR-0000000BxN5-2T39;
	Fri, 30 Oct 2026 15:13:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIM-0000000BxKP-095M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:13:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA2891682;
	Fri, 30 Oct 2026 08:13:25 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C88F63F59E;
	Fri, 30 Oct 2026 08:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373209; bh=RTr9WjFzrRPpi75Lbl9yzt4xCky73PggBYYT3kPl0So=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qs4/9F3bV3ucdyMATv0KEx+gIxVbXJYsw5kfb4dg0TeprsGcDsS5KXefn+opS7X4V
	 vPsawshIG+pAIfC+qTdgWwvi0RKk6PObf3jUOYJet3D4jx8xpQ20c8p1hMYoU8+MAn
	 x5Kb0bXsnrnFtqgPQwX7+GoFuOy9IsKeOlGabF9I=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:09 +0000
Subject: [PATCH v3 02/14] perf intel-pt: Preserve return addresses for
 asynchronous branches
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-2-7629b52ab047@arm.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Suyash Mahar <smahar@meta.com>, 
 Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=1435;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=RTr9WjFzrRPpi75Lbl9yzt4xCky73PggBYYT3kPl0So=;
 b=XUT/mOQBYxtVkq+U7mwQRfttiE7T/mUsjjaVtbkjo566QPr1S+sFczz8A7ynwzdk/qBATN+1m
 yI1UTGywamACmAugoUPcBqeuYl5mZ5fKj0S9y1Kxm5AlF1EyD2CLP3c
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081330_116529_D1410B81 
X-CRM114-Status: GOOD (  11.11  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Intel PT uses a zero instruction length for asynchronous branches so
the thread stack resumes at the source IP. A dlfilter can fetch the
instruction before call/return processing and replace that zero with
its opcode length, advancing the saved return address.

Set sample.ret_addr to sample.ip for asynchronous branch samples so
instruction fetching cannot change the return address. This also
covers asynchronous trace-end samples and VM exits.

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/intel-pt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/util/intel-pt.c b/tools/perf/util/intel-pt.c
index 8c21c9f52d572d2dd4e15b3b5c341b253ccea1b5..e8b9c8a67b0a0635e0110eda4b6ccb2511132fc7 100644
--- a/tools/perf/util/intel-pt.c
+++ b/tools/perf/util/intel-pt.c
@@ -1803,6 +1803,13 @@ static int intel_pt_synth_branch_sample(struct intel_pt_queue *ptq)
 	perf_sample__init(&sample, /*all=*/true);
 	intel_pt_prep_b_sample(pt, ptq, event, &sample);
 
+	/*
+	 * For asynchronous branches, use the sample IP as the return address
+	 * instead of advancing it during instruction decoding.
+	 */
+	if (sample.flags & PERF_IP_FLAG_ASYNC)
+		sample.ret_addr = sample.ip;
+
 	sample.id = ptq->pt->branches_id;
 	sample.stream_id = ptq->pt->branches_id;
 

-- 
2.34.1


