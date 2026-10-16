Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A48CCF2CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V27ywo42dwrqD0sywJczDAygr9nsvrEc5R2nS5dbB3I=; b=fOPSaRvlsZmf4DrsCXb4NL8DWG
	bs/e8QaV5isjfjHKz1K4GiHuSRDxJBvNBsyf09OkuoyWIpzJkSLSbMFyLKheNyIlzhhG1zF+tQnZw
	3f7JHPpUME0O+ahWWe1g7faBp3phRpRD0AniuBRM1+b6q7hOAEj6zquEnGSJ5LxSgy9k/8DAh2YUB
	BmZrp9un07duiI8qHNmVuEvs3Rz1tMrx04tYm9WRSVrwFObDRe7qBhbfW8dXCQAUNgbZtWb6C9tdD
	htDk/8HAq4M2fWrp/xPY8lL0wedhjFinoVqYNPU1ne1rAs39G7VMyz05D46Iy0OcvTJEd9sX9iNjv
	2slq+OPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpE5-000000044Cz-1FZa;
	Fri, 16 Oct 2026 21:12:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDt-0000000446m-1yrT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 21:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=V27ywo42dwrqD0sywJczDAygr9nsvrEc5R2nS5dbB3I=; b=S5rlfENQ9Bma/G5/WuFSdvIXvn
	mFuhJGVCD6Ob2APg/cfIhAZKbnWAE/T44rDFiuB5scoRlBrjlYcjflaiXjrRzSkyiXQNU2Rqv2t5A
	ptfUXwDv16eE4stLQntgg37Xn+OVaWfLvz4JY3lBEZsS/cPVHWJwB7s1JYAEA7ZfbCIN14orchUxE
	8uujG4v60vz26wHHSHpD5CMJxIDiOdLZUgIwNHvIc9JB45oTRjSuCZggoR1OzCMwvKk+ZILDrluPy
	OAXCeiGF/NpLEV5/+03/0YTTRU02sdT2SqdpP11wIPft3OTbrRTuvc+1zm0WaKQI4wMcjbNpZJWbl
	ktxEMFvA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHpDp-00000001xSa-28y7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:12:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48FC014BF;
	Fri, 16 Oct 2026 14:12:09 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7813F673;
	Fri, 16 Oct 2026 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185132; bh=HMkE+TtGqBzGnfvZsjubcUGlEE/uoi7haxt9mMi8TJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SiZwJbMjJAnms3+CzvR0oJtnms0AmA97PKKiXUIzuQ7ZG7i8eH7GAXGx0wsBy2Sm+
	 n7WeQ5K+hPmUMBFdRKhOVBzwqAUz5gFkUNznk1mj5iz6vWt8pUgnQ6v8F56HbMXpYg
	 zUk27BHfPQ2SA/WI8Vm+EYtIgrUlmhBQoqngH0Y8=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:48 +0100
Subject: [PATCH v2 10/11] perf cs-etm: Reset decoder on AUX offset
 discontinuity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-10-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=2836;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=HMkE+TtGqBzGnfvZsjubcUGlEE/uoi7haxt9mMi8TJk=;
 b=hILxfLNr0Pt2uojkobUyJf/29/nJfq1kgCY/ds6pHImc4IujSbHaVqnOEl73bsvJxKrnBkGbq
 C0sO8xO22thC9KFkguC5k0UhYHkivVOfu5sD4xtezncnYvNRkZO89Iz
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_221213_926241_D3CC8ECC 
X-CRM114-Status: GOOD (  15.12  )
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

Indexed AUX fragments do not necessarily form a contiguous trace stream.
Snapshot reads can retain only the end of the AUX buffer and advance past
the omitted prefix. AUX metadata records can also be lost when the normal
perf ring buffer is full, leaving the corresponding trace unqueued. Neither
case guarantees that the next queued fragment carries a collision flag or
retains the source's restart synchronization packets.

Track the expected next logical AUX offset for each decoder queue in
cs_etm__get_trace(). Request a decoder reset before processing a fragment
whose offset differs from the expected end. This prevents decoding bytes
after a gap using stale packet and execution state. The comparison also
covers overlapping fragments and backward offsets.

Perf can internally split large buffers into consecutive pieces while
retaining the original AUX offset. Preserve continuity across those pieces
and accumulate their sizes when tracking the expected end. Keep the decoder
byte index separate from the logical AUX offset. Track initialization
separately, as zero is a valid expected offset after the counter wraps.

Zero-length fragments still carry logical offsets. Check them for gaps
and retain any reset request until nonempty data is decoded.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 8f04d7ceddd9d1f7ff22af234b19400efe27ba2b..37ae7ff5149433ed27cb3c9b880e8422d742a74d 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -123,6 +123,9 @@ struct cs_etm_queue {
 	u8 pending_timestamp_chan_id;
 	enum cs_etm_format format;
 	u64 offset;
+	/* Expected logical AUX offset after the last fetched buffer. */
+	u64 next_aux_offset;
+	bool have_aux_offset;
 	const unsigned char *buf;
 	size_t buf_len, buf_used;
 	/* Conversion between traceID and index in traceid_queues array */
@@ -1496,6 +1499,21 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
 	     old_buffer->cpu.cpu != aux_buffer->cpu.cpu))
 		etmq->reset_decoder = true;
 
+	/*
+	 * Snapshot clipping or missing AUX records can leave a gap between
+	 * fragments. Check logical AUX offsets, as etmq->offset only counts
+	 * bytes submitted to the decoder. Internally split buffers retain
+	 * the original offset and mark subsequent pieces as consecutive.
+	 */
+	if (etmq->have_aux_offset && !aux_buffer->consecutive &&
+	    aux_buffer->offset != etmq->next_aux_offset)
+		etmq->reset_decoder = true;
+
+	if (!etmq->have_aux_offset || !aux_buffer->consecutive)
+		etmq->next_aux_offset = aux_buffer->offset;
+	etmq->next_aux_offset += aux_buffer->size;
+	etmq->have_aux_offset = true;
+
 	return 0;
 }
 

-- 
2.34.1


