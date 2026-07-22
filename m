Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50D7C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xmvnf3eUbULdFm7pDoD/hgbP3E1mr0Xg4XKRaqaAFkM=; b=DHs+e2o73blYmyXVlT7uIar5Uv
	2xkbYbsvbT9wszQISPpQL0RRkr30BZTtviJyhtoYCy1cVN+y+p28J0dJzSkxyTOqlcPzbzPioOPc+
	gzCrQck72QLVCSMgaR76mZZVTjG16nsmnxkr5L5ZjIMdQaF4ZWunrH7hkpkhSmPFgKy2uak3kaY27
	VMeZ0Tch/FDoGEY3/M6WDNrpv5mvQkgk7Xa2Vb17OmKJ3a0QlJiHstmXuJQFRd326ezRNrsNrv4dA
	lsDasHuHHZZXGjCIUqKCUw4zaY7rV4RmTLP2wib8qC6JzdzySBskV8oHiPOOI+VyoEtCjhH7r3Mi4
	UvWtcMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRRR-0000000B4KD-3VP3;
	Wed, 22 Jul 2026 07:32:33 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRRO-0000000B4Ix-0Uy1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Xm
	vnf3eUbULdFm7pDoD/hgbP3E1mr0Xg4XKRaqaAFkM=; b=F35iZptHMYHUX3ofsl
	kbjL4+wVanY7hKzkCx4Q72z0JP7GQPeV6cuFf37oKcy+Ps/cmJ4OA4AgiVbyCu9v
	zXjUc7yf89ZmLcQL8aVxxChFglggBGqxlOVzewtS/TqJTJJICYBJwCVa/ctw4hO3
	9f/55xRzfDw7OEnGjYlWojLy8=
Received: from ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCn9gvlcWBq66KzKw--.36137S4;
	Wed, 22 Jul 2026 15:31:57 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	mathieu.poirier@linaro.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make_ruc2021@163.com>,
	stable@vger.kernel.org
Subject: [RESEND PATCH v3] coresight: etm-perf: Fix reference count leak in etm_setup_aux
Date: Wed, 22 Jul 2026 15:31:48 +0800
Message-ID: <20260722073148.1825280-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCn9gvlcWBq66KzKw--.36137S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw4UAr17uF43tr4kJF48Crg_yoW8ZFyrpF
	4jkw4Yyr98Gr40vws7Jr18Zay5uw4SvF4agryfKw4Dur4YqFWxZF1jgryFyrs3urZ5Gas0
	g3WxJF409FWDXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGjg7UUUUU=
X-Originating-IP: [202.112.113.208]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbC1A5KVWpgce503QAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_003230_978673_24673A88 
X-CRM114-Status: GOOD (  14.17  )
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

bus_find_device() returns a device with its reference count
incremented. When a user-selected sink is obtained through
coresight_get_sink_by_id(), etm_setup_aux() keeps using the returned
sink while building the path and allocating the sink buffer.

Therefore the lookup reference must remain valid while etm_setup_aux()
is still using the sink, otherwise the sink could be removed under the
caller. Drop the lookup reference on the common exit path, after
etm_setup_aux() no longer directly uses the user-selected sink.

The CoreSight path code takes the references it needs for built paths,
so the initial lookup reference from coresight_get_sink_by_id() is no
longer needed after setup_aux finishes.

Found by code review.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
Cc: stable@vger.kernel.org
Fixes: 0e6c20517596 ("coresight: etm-perf: Allow an event to use different sinks")
---
Changes in v3:
- do not drop the lookup reference in coresight_get_sink_by_id(), as 
that would return a sink pointer without keeping the device reference 
while etm_setup_aux() is still using it.
- dropped the lookup reference in etm_setup_aux on the common exit path, 
as suggested by Suzuki.
- updated the commit message to describe why the reference is kept 
until etm_setup_aux() finishes using the sink.
Changes in v2:
- modified the patch as suggestions.
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a87..a25985743b7f 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -509,6 +509,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		goto err;
 
 out:
+	if (user_sink) {
+		put_device(&user_sink->dev);
+		user_sink = NULL;
+	}
+
 	return event_data;
 
 err:
-- 
2.43.0


