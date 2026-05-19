Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDFECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sF/jiSemO5W+dkNFkQE5jdtMxCQHf+w3k0/y/t6aQT0=; b=x1n1xpPWGfD8URtSJJn68SY56A
	hbiKDJvk0K5IJq5AOJLqpu+byOyn7mADMWPwHpTpn6OK0FKnyHesAg/REYC++EjU1mbXP8rSG3lCJ
	Ihwi5YeyFDhdAbvFwKD3YQQzS0vRH56Roj1w2nFugvoQjUDI5gWZgGKIGqoVRMSw9S8OEFaoGtNjs
	Tok5Z3SvZBuAOjpC9jC2cYg87IUgPmhsIHBPmnqewSQ/uGqQRenhQh8exr7QbW/GoHE7RVlLFZKsU
	pm4Di/rZylXuwBDu8X4x1tXnQf1A4p1kNYY/g5htmUGPFOIGV7PFWNLBrOCWmo6xy7MojlwRFB+/r
	Xt78GtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG3F-00000000igv-0CMm;
	Tue, 19 May 2026 08:43:45 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG3C-00000000ifQ-1SrX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:43:44 +0000
Received: from ubuntu.. (unknown [202.112.113.208])
	by APP-01 (Coremail) with SMTP id qwCowADXemapIgxqiN6_EA--.144S2;
	Tue, 19 May 2026 16:43:31 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	mathieu.poirier@linaro.org,
	peterz@infradead.org,
	acme@redhat.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] coresight: drop lookup reference in coresight_get_sink_by_id()
Date: Tue, 19 May 2026 16:43:17 +0800
Message-ID: <20260519084317.1472444-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADXemapIgxqiN6_EA--.144S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4ktFykXFy8CF4DKFyrXrb_yoW8ur18pr
	WDKa45ArW5Gr4Ik397XrnrZr45A340yw4SgryfGw1q9w1FqF9avFyUXrnYq3Z3CrWkKFyI
	gr17tFy0ga4UJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQVy7UUUUU==
X-Originating-IP: [202.112.113.208]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_014342_763306_9C3CF681 
X-CRM114-Status: GOOD (  14.60  )
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
incremented. coresight_get_sink_by_id() only uses the returned device
to find the matching CoreSight sink by id and does not need to
transfer this lookup reference to its callers.

Keeping the reference forces callers such as etm_setup_aux() to know
about the internal lookup implementation and to drop the reference
themselves. This is error-prone and led to a leaked reference when a
user-selected sink is used for perf AUX tracing.

Drop the reference inside coresight_get_sink_by_id() after converting
the device to the corresponding coresight_device. The CoreSight path
code takes device references it needs when building/using the path.

Found by code review.

Signed-off-by: Ma Ke <make24@iscas.ac.cn>
Cc: stable@vger.kernel.org
Fixes: 226443925887 ("coresight: Use event attributes for sink selection")
---
 drivers/hwtracing/coresight/coresight-core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..2cca4ed83e2c 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -624,11 +624,24 @@ static int coresight_sink_by_id(struct device *dev, const void *data)
 struct coresight_device *coresight_get_sink_by_id(u32 id)
 {
 	struct device *dev = NULL;
+	struct coresight_device *csdev;
 
 	dev = bus_find_device(&coresight_bustype, NULL, &id,
 			      coresight_sink_by_id);
+	if (!dev)
+		return NULL;
+
+	csdev = to_coresight_device(dev);
+
+	/*
+	 * bus_find_device() returns a device with its reference count
+	 * incremented. coresight_get_sink_by_id() only performs a lookup;
+	 * the CoreSight path code takes the references it needs when the
+	 * path is built, so drop the lookup reference here.
+	 */
+	put_device(dev);
 
-	return dev ? to_coresight_device(dev) : NULL;
+	return csdev;
 }
 
 /**
-- 
2.43.0


