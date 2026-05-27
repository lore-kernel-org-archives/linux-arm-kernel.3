Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55ACCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kBCvcOAUjSaqdFqgGwlFMO/k+lLQoKOhHvL0oo61Cy8=; b=B++dz3fvksZ/j+GKLFw5/Vbzr5
	pP+RVyrm7pHCscMDqejh3x/6nALL26Psi7HV3eD74C7xKjnlsQKtBBHI44pPYuma8DdxoyWV+12E0
	eP/iscZz9XTH5w6BLBMmnsRvJT0Q89C7Ho3O+pintDvDti+IId5tMyS+MWc0DuSfnppv6Ec/eJwJS
	FqZlv5t0co8oE2EgvHaE/xwYq5U11B7Fs8b+YwSmpBGtTWvU3PO8uE2VKj0DfHUnT6WYUjy9LCWp9
	wFf/pyYSEbYRkp0iZ3DOXtqHFQUdpBG8LHYACf8AD7aTt109CmpfmPbga757XsxPI3fnK22qHTiaG
	uAu0z26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAWF-00000003dVa-0u08;
	Wed, 27 May 2026 09:25:43 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAWA-00000003dV6-2ppe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:25:42 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.3])
	by APP-05 (Coremail) with SMTP id zQCowAC3F9uPuBZqxN6KEQ--.1418S2;
	Wed, 27 May 2026 17:25:36 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] regulator: scmi: fix of_node refcount leak in scmi_regulator_probe()
Date: Wed, 27 May 2026 09:25:21 +0000
Message-Id: <20260527092521.866310-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3F9uPuBZqxN6KEQ--.1418S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GryrZF47Xr18Cw1UAw1UJrb_yoWkZFc_Gr
	yfW3W7JrWDur48Wrn7XFZ0vr9xKr1qgayxZF4IkFW3Cw1Yv3WDJa43Xr9xArW8Z3y8Jr9r
	WwsrArW8Aw43ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_
	GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU52NtDUUUU
X-Originating-IP: [36.110.52.3]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAcAA2oWidms9QABs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_022539_089911_86F3B2C8 
X-CRM114-Status: GOOD (  10.57  )
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

scmi_regulator_probe() calls of_find_node_by_name() which takes a
reference on the returned device node. On the error path where
process_scmi_regulator_of_node() fails, the function returns without
calling of_node_put() on the child node, leaking the reference.

Add of_node_put(np) on the error path to properly release the
reference.

Cc: stable@vger.kernel.org
Fixes: 0fbeae70ee7c ("regulator: add SCMI driver")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/regulator/scmi-regulator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/scmi-regulator.c b/drivers/regulator/scmi-regulator.c
index 6d609c42e479..f1fe20b0fd76 100644
--- a/drivers/regulator/scmi-regulator.c
+++ b/drivers/regulator/scmi-regulator.c
@@ -345,8 +345,10 @@ static int scmi_regulator_probe(struct scmi_device *sdev)
 	for_each_child_of_node_scoped(np, child) {
 		ret = process_scmi_regulator_of_node(sdev, ph, child, rinfo);
 		/* abort on any mem issue */
-		if (ret == -ENOMEM)
+		if (ret == -ENOMEM) {
+			rof_node_put(np);
 			return ret;
+		}
 	}
 	of_node_put(np);
 	/*
-- 
2.34.1


