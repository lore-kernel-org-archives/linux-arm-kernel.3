Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD1EC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NxlkOWR/a1EQCe4p7DRvruEyNU88KPzFhMs/lAUuB8=; b=KiKpYixXUFCptZvWlhis0qGo+V
	IgGylVKg+TnhO/Xc1+XKQvKiGKSxjEJZ9AOHkeZfUVW/uyubP8EVsk9pDz/aXSDc7+SwN3TJ5u1F1
	ZrJPvBljfp4ldlGgliDeHs7zNzjvDSO2V7qfptH4XvEJpF6f/Jf6x8IN/4EdNqfcFhRlj1qB/Y+nh
	yk3O4BetR/H8V9zDIJN0HKWImGGICaZNAHs8rL029lqOsYtJd4BMrsU6zsg4Qc4lesJr04qsIv/S7
	K9DvKTryB/HF1flEXqcRIBfIPJo2fmz0UNkNMhvgkCNkJQjYHPjxhs7I37ZeN7lEUOvkfnFWlPu59
	FKvjLOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uWm-0000000FvF1-20ap;
	Fri, 11 Sep 2026 06:14:24 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uWj-0000000FvEe-3hpa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:14:23 +0000
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fb3;
	Fri, 11 Sep 2026 14:09:17 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: linusw@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] clocksource: dbx500-prcmu: check timer register mapping
Date: Fri, 11 Sep 2026 14:09:17 +0800
Message-Id: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15adb303a1kunm43d905a81c733e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHktDVhkeHkpJTx9OQ0weSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=Tso/WePHXZar7n1oxfb8dT2GEVS/faUUYqZIhlxIUAk9XJ3iJYU0WW78Q6eT84VIW/FDzVCz5g5WywVsnxGYfn/+OoDvqmrx/u2bJCLUiQHkWzIFW2OiBMAUncRny2/7lP+weQI8dgFuAREukIlfUjUC7WqVijXA66ndWDnV3+c=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=4NxlkOWR/a1EQCe4p7DRvruEyNU88KPzFhMs/lAUuB8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_231422_108639_8A6A2BD9 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

Return -ENOMEM if of_iomap() fails, before reading or configuring
the timer register block.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 9d2aa8c7961a ("ARM/clocksource: use automatic DT probing for ux500 PRCMU")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/clocksource/clksrc-dbx500-prcmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/clksrc-dbx500-prcmu.c b/drivers/clocksource/clksrc-dbx500-prcmu.c
index 2fc93e46cea3..1af223b0e896 100644
--- a/drivers/clocksource/clksrc-dbx500-prcmu.c
+++ b/drivers/clocksource/clksrc-dbx500-prcmu.c
@@ -52,6 +52,8 @@ static struct clocksource clocksource_dbx500_prcmu = {
 static int __init clksrc_dbx500_prcmu_init(struct device_node *node)
 {
 	clksrc_dbx500_timer_base = of_iomap(node, 0);
+	if (!clksrc_dbx500_timer_base)
+		return -ENOMEM;
 
 	/*
 	 * The A9 sub system expects the timer to be configured as

