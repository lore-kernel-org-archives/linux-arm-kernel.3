Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35600D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 02:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9YNcMzr2iuZs3aPijfdu0EH7e9VjJIBMMpMeMGn702c=; b=XVn9ExqVNcQyC2iaVzt0O/iJKz
	m4PJUuL3jxaN/CrIe5l62vmZJdh+H78iqVSDAtcJA2JwpTYEuqAVpT2tmxvEViFX2DEwQkv6dJmC/
	GZtiJQsgbGttmnHQ9x4GtjGgYZpXYpgYr79NqXUthWeRzrw7KtNzn8KxZOFHEcqPCL/WtXcYgKsgc
	XmjDyB0qaSE+zZKISNsWJBIGuPB2lLkhAkHTvFIHyiQl13eVwEqRY+vyUx7EdMOapczOh676E0s/Y
	duEWeXqMzUJh1ijbWoEInC0sq+KO0le7tMi1W6ubV3TrqUVE2x1OexoB7ssW19OVgBhNXrmpYK6KL
	WI9C5m7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUyJ7-00000002wh0-3qYP;
	Mon, 15 Dec 2025 02:27:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUyJ3-00000002wgC-0TNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 02:27:28 +0000
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-01 (Coremail) with SMTP id qwCowACHL2v+cT9p2CezAA--.45584S2;
	Mon, 15 Dec 2025 10:27:19 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	mathieu.poirier@linaro.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2 RESEND] coresight: etm-perf: Fix reference count leak in etm_setup_aux
Date: Mon, 15 Dec 2025 10:27:09 +0800
Message-Id: <20251215022709.17220-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowACHL2v+cT9p2CezAA--.45584S2
X-Coremail-Antispam: 1UD129KBjvJXoW7XryfuFW3XryfKFy5JF1DJrb_yoW8JF18pF
	4DK39Iyr98GrWvv39rJr1DZFW5Ww1SyayagFy5K395uF4YqF9FvF15KFyFvrs7CrW8GF93
	Krs7tF48ZFyUXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67
	AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb9NVDUU
	UUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_182725_584177_7B7A5510 
X-CRM114-Status: GOOD (  10.29  )
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

In etm_setup_aux(), when a user sink is obtained via
coresight_get_sink_by_id(), it increments the reference count of the
sink device. However, if the sink is used in path building, the path
holds a reference, but the initial reference from
coresight_get_sink_by_id() is not released, causing a reference count
leak. We should release the initial reference after the path is built.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 0e6c20517596 ("coresight: etm-perf: Allow an event to use different sinks")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v2:
- modified the patch as suggestions.
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17afa0f4cdee..56d012ab6d3a 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -454,6 +454,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
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
2.17.1


