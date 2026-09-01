Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668CEC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kg/xb+uh9YTaL55AYx88ooXtwAtXXFzRFvRme8FFeU=; b=Ubzpl2QwQC1NsWXbRsizJHofdb
	bJRwMH5zre5SCnsxCCjEL8uQyDlzfFlgTUFLKDP5RJjHr7WTqd7jYojDvnOQGp0RyiBtEGuSkAllG
	e0/KEcJWgdJ8PYQoOlxPHwrZKZ+dk8sWPnj7FSiUOgjRAbOjzUxg7TIk8TvtM7T4WUtidsRz6na3O
	Uk8CRedxF2HsyDUCtXsld99S9jyKazoI4siHN354ddOlUKmnMpjLtP+I0u4bAy5f1HKz/rK3x2UPQ
	rzjnRq1pHoq70yqxqlzcHJJ//6dkn3hez9dEOAQcgIcMYdyw4kvzckvihfLCW175iLxCEzFEaGBPw
	XPThvdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N3g-0000000Bk4e-2d40;
	Tue, 01 Sep 2026 11:53:44 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N3c-0000000Bk3C-1YBA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:53:42 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c1dd2d99;
	Tue, 1 Sep 2026 19:53:24 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] stm: core: Initialize source state before device_add
Date: Tue,  1 Sep 2026 19:53:20 +0800
Message-Id: <20260901115320.3270602-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa05cd122af03a1kunm35ce7b8e16bc7f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHx0fVkIYSR9PGk0ZSk9JQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=HoCwL/TaUT4BUVW/FM6DganyIQHH+VY9A/4L5bVG+VUkAs3VamHw9UgPuehjr3/TEVGgpRgUp0/ERfWpqAUiZ7I4B4lbnWSiDB+DgVm3d1koH6lnf/nC3CoJIdbrBj/Fw8QfReum8LVYSfnskkkD7M2z6kIqVrGkE5xr8WI4/1c=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=0kg/xb+uh9YTaL55AYx88ooXtwAtXXFzRFvRme8FFeU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_045341_022269_FF98BD6B 
X-CRM114-Status: GOOD (  10.10  )
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

device_add() publishes the source device and creates its sysfs
attributes. A concurrent sysfs operation can therefore reach the source
before its output, link lock, list entry, or data pointers are initialized.
Initialize the source state before publication, including the back-pointer
used by source callbacks. Drop any link established during publication
before clearing the back-pointer and releasing the source on failure.

Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
Assisted-by: Codex:GPT-5
Fixes: 7bd1d4093c2f ("stm class: Introduce an abstraction for System Trace Module devices")
Cc: stable@vger.kernel.org
---
 drivers/hwtracing/stm/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index f48c6a8a0..487fb747f 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -1256,19 +1256,21 @@ int stm_source_register_device(struct device *parent,
 	pm_runtime_no_callbacks(&src->dev);
 	pm_runtime_forbid(&src->dev);
 
-	err = device_add(&src->dev);
-	if (err)
-		goto err;
-
 	stm_output_init(&src->output);
 	spin_lock_init(&src->link_lock);
 	INIT_LIST_HEAD(&src->link_entry);
 	src->data = data;
 	data->src = src;
 
+	err = device_add(&src->dev);
+	if (err)
+		goto err;
+
 	return 0;
 
 err:
+	stm_source_link_drop(src);
+	data->src = NULL;
 	put_device(&src->dev);
 
 	return err;
-- 
2.34.1


