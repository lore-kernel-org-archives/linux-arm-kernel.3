Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21FEE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAppotxVqxBu+s1WRPO02eQxsgP0S0+AbCLbtcztpXs=; b=2lUD1+70oITZoN8fqxNJUFvhJ3
	vurvcgkzygQ3jrd4NsEww/7xZe0VXbQRlAgKtF8GFxp6maxqfnUctzlHmUKOU50xNAujgAaYMYxWC
	VWQ0B5GwZEYpjhv0rtfTiFnYsnAfpHH58mrp6zp5Pmmt15FCDWsgXSkfUgYBZgzxX0V5h0XIzr5GB
	N+XcnyXZpPXl2s5X813WZ6dT0IRADA1+ga4Ewkxmz9mNlBj/o1wpZ6O4Y1Qf6vKiC7YEG9mT8GZfL
	qzXGdc+qrjLtWTCs4zvZdPOm0Wt8xJU58UPIzoXOhxLDrhUYAJAyv43ZHYPGKK/CWqiLakR6LXJWf
	zsnniPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn59-00000001CXw-1zuB;
	Thu, 12 Dec 2024 17:34:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmRt-000000013pE-1o80
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 610B75C685D;
	Thu, 12 Dec 2024 16:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46B3C4CECE;
	Thu, 12 Dec 2024 16:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734022440;
	bh=4qAF97iSZCAn9ZQB4Y2LAsveIQfyScV9by+OqVTN2Bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lS8W6TFO3fOwvF6flFGHpq/srgwGnYxjcrDnrCTS1fyP8YDIFR7AULbO5Dgfm40v2
	 jmGqBuMhMNJpdjjInH0rhP5RvQD7JycpY5Rqbj2pv4vMqX1Ni7AsAOVwzfPQvz5hmz
	 rlucE6TAMoREtgmmtWOoeu3AJ/qFwkcwCD0UBO64=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@linaro.org>,
	Ben Gainey <ben.gainey@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Ruidong Tian <tianruidong@linux.alibaba.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	John Garry <john.g.garry@oracle.com>,
	scclevenger@os.amperecomputing.com,
	Namhyung Kim <namhyung@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 241/565] perf cs-etm: Dont flush when packet_queue fills up
Date: Thu, 12 Dec 2024 15:57:16 +0100
Message-ID: <20241212144321.005145113@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212144311.432886635@linuxfoundation.org>
References: <20241212144311.432886635@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_085401_555481_D373390C 
X-CRM114-Status: GOOD (  21.39  )
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

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: James Clark <james.clark@linaro.org>

[ Upstream commit 5afd032961e8465808c4bc385c06e7676fbe1951 ]

cs_etm__flush(), like cs_etm__sample() is an operation that generates a
sample and then swaps the current with the previous packet. Calling
flush after processing the queues results in two swaps which corrupts
the next sample. Therefore it wasn't appropriate to call flush here so
remove it.

Flushing is still done on a discontinuity to explicitly clear the last
branch buffer, but when the packet_queue fills up before reaching a
timestamp, that's not a discontinuity and the call to
cs_etm__process_traceid_queue() already generated samples and drained
the buffers correctly.

This is visible by looking for a branch that has the same target as the
previous branch and the following source is before the address of the
last target, which is impossible as execution would have had to have
gone backwards:

  ffff800080849d40 _find_next_and_bit+0x78 => ffff80008011cadc update_sg_lb_stats+0x94
   (packet_queue fills here before a timestamp, resulting in a flush and
    branch target ffff80008011cadc is duplicated.)
  ffff80008011cb1c update_sg_lb_stats+0xd4 => ffff80008011cadc update_sg_lb_stats+0x94
  ffff8000801117c4 cpu_util+0x24 => ffff8000801117d4 cpu_util+0x34

After removing the flush the correct branch target is used for the
second sample, and ffff8000801117c4 is no longer before the previous
address:

  ffff800080849d40 _find_next_and_bit+0x78 => ffff80008011cadc update_sg_lb_stats+0x94
  ffff80008011cb1c update_sg_lb_stats+0xd4 => ffff8000801117a0 cpu_util+0x0
  ffff8000801117c4 cpu_util+0x24 => ffff8000801117d4 cpu_util+0x34

Make sure that a final branch stack is output at the end of the trace
by calling cs_etm__end_block(). This is already done for both the
timeless decode paths.

Fixes: 21fe8dc1191a ("perf cs-etm: Add support for CPU-wide trace scenarios")
Reported-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Closes: https://lore.kernel.org/all/20240719092619.274730-1-gankulkarni@os.amperecomputing.com/
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
Tested-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Cc: Ben Gainey <ben.gainey@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: Benjamin Gray <bgray@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: coresight@lists.linaro.org
Cc: John Garry <john.g.garry@oracle.com>
Cc: scclevenger@os.amperecomputing.com
Link: https://lore.kernel.org/r/20240916135743.1490403-2-james.clark@linaro.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/cs-etm.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index f323adb1af855..6fa698186f0b6 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2126,12 +2126,6 @@ static void cs_etm__clear_all_traceid_queues(struct cs_etm_queue *etmq)
 
 		/* Ignore return value */
 		cs_etm__process_traceid_queue(etmq, tidq);
-
-		/*
-		 * Generate an instruction sample with the remaining
-		 * branchstack entries.
-		 */
-		cs_etm__flush(etmq, tidq);
 	}
 }
 
@@ -2228,7 +2222,7 @@ static int cs_etm__process_queues(struct cs_etm_auxtrace *etm)
 
 	while (1) {
 		if (!etm->heap.heap_cnt)
-			goto out;
+			break;
 
 		/* Take the entry at the top of the min heap */
 		cs_queue_nr = etm->heap.heap_array[0].queue_nr;
@@ -2311,6 +2305,23 @@ static int cs_etm__process_queues(struct cs_etm_auxtrace *etm)
 		ret = auxtrace_heap__add(&etm->heap, cs_queue_nr, cs_timestamp);
 	}
 
+	for (i = 0; i < etm->queues.nr_queues; i++) {
+		struct int_node *inode;
+
+		etmq = etm->queues.queue_array[i].priv;
+		if (!etmq)
+			continue;
+
+		intlist__for_each_entry(inode, etmq->traceid_queues_list) {
+			int idx = (int)(intptr_t)inode->priv;
+
+			/* Flush any remaining branch stack entries */
+			tidq = etmq->traceid_queues[idx];
+			ret = cs_etm__end_block(etmq, tidq);
+			if (ret)
+				return ret;
+		}
+	}
 out:
 	return ret;
 }
-- 
2.43.0




