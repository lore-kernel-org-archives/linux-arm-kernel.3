Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6C0CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 07:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PKKpVdrDqnA2ZI2QQYb9QpGJK08L53pkl9uf3Eglr+E=; b=XHTP3WUhcXafaivp+RQwEs1bYk
	2uM+FVoZD1MFgLMqEhQ0QGYALh0xIHkw2UqRtH+brf4T7C92WS7+88I3LUGvqe2QgdZpMuVnJFF6S
	TChvZN6yhK1p0liiorNQA6czQM+DSq6htTbbcGDRwGVJ5AUlfKqeDSRyrqk454SP8kOSCWO0qAYOo
	cdX3rTTvtMuC/AHeHlrxDv/qP2NrthMaBpVy2s3KCcTeWpxaR4CJvZmtT6ifEWpwE1TZMAaN+j4Yh
	pxRWGLMAYlBjAdOuSWVG8W1UO8KooQi7O8JT1g1MpOicYJQwq1DZYXkm44k2WOC1Dz2ZKSQqcuaq5
	iO0WhSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYo5-00000004Wj9-3ckj;
	Mon, 22 Jun 2026 07:10:57 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYo2-00000004Wih-2NAc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 07:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=PK
	KpVdrDqnA2ZI2QQYb9QpGJK08L53pkl9uf3Eglr+E=; b=Mc61r6eoBo3Zj2fSog
	DbAenP3c1ATyZb8YielV5V/QhtIZNPmWDLsD+VRT4q7KPOcwTWLLdnj9fn3t7u0w
	qBI5dHDFGnqdP9OE/1Z0QMucpqt2VmnKU2cH15FOpje5KP5QscdN4nejk63+IgRZ
	iCC3ak4ikwPQWJmYZiXILHZqg=
Received: from ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wA3RArQ3zhq4SzfEw--.24449S4;
	Mon, 22 Jun 2026 15:10:15 +0800 (CST)
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
Date: Mon, 22 Jun 2026 15:10:07 +0800
Message-ID: <20260622071007.691231-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3RArQ3zhq4SzfEw--.24449S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw4UAr17uF43tr4kJF48Crg_yoW8ZFyrpF
	4jkws0yF98Gr40vws7Jr18Zay5uw4SvF4agFyfKw4DuF4YqFWfZFyjgryFyrn3urZ5Gas0
	g3WxtF48uFWUXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_miiDUUUUU=
X-Originating-IP: [202.112.113.208]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbC0xfV4Go439cCMAAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_001054_997631_052F9B6E 
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
index f85dedf89a3f..d5116177c1b9 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -456,6 +456,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
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


