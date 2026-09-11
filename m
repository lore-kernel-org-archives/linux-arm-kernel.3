Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE82C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LxpP+BAuFB7ao6BgdJGgtCQvqBcFt+C4zSixfoKRt9M=; b=FqyUW/Sd9maNJ4m8G+crKV01zw
	oZx3HVXV9rdBst08hfNsK7vGILt615bsRNxEZzfFQep9Lz/OzUKcU2qWOLJ2ln1lde61UmZ2B627/
	Z0otMOIB/6p61UVQR+WuK0CoYxiIjn9h0WVUBF8mXIuqDrU/WiHUEK0L4FhBvjnCY7hEkqsx3BwVw
	Nyda6WuIocHWR4zEU4KVvYtSbB9v+EFO+KcrdFhR2srok16zCP3bs2Tp4gztpH1vD9zjhKmEdou32
	v71GWgKFGJbwAFKDjPwmtdl16E9F4NlYthsAyw2nj3mAQPHoFgrRLQo6/O6xn8NRQJnjjrXsN8+Fo
	6nWqBczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uRy-0000000FusQ-43bH;
	Fri, 11 Sep 2026 06:09:26 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uRw-0000000FurH-0NFi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:09:25 +0000
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fa9;
	Fri, 11 Sep 2026 14:09:07 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: nm@ti.com,
	kristo@kernel.org,
	ssantosh@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] clk: keystone: sci-clk: check the growing discovery array
Date: Fri, 11 Sep 2026 14:09:06 +0800
Message-Id: <20260911060906.94179-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15851603a1kunmfe5ea5821c731d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSk4eVhgeGE1LThgeThpOSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=iVJsP1PNhpcmDx+yMPKAJ8RKo1XG9ERhO5PtNGi/SEjVwpSt6eN4ejPStpoYBpxe3QR14FMJhCX6Lpyhtt7EBzwSi4wW6at9YhO+oimyG9c5l5XhC7A+MSUs2MY526UnWzoH48DcvuZ3LdQsXoRMD3GiyiYsYAr2QQjtIENcoGk=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=LxpP+BAuFB7ao6BgdJGgtCQvqBcFt+C4zSixfoKRt9M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_230924_372923_8A5AEA59 
X-CRM114-Status: UNSURE (   7.22  )
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

Check each newly allocated discovery array before copying existing
entries or publishing its first element. Devres releases prior storage
when the probe fails.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 3c13933c6033 ("clk: keystone: sci-clk: add support for dynamically probing clocks")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/clk/keystone/sci-clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d2094bd48e3..dad2fb67c405 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -496,6 +496,8 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 			tmp_clks = devm_kmalloc_array(dev, max_clks + 64,
 						      sizeof(sci_clk),
 						      GFP_KERNEL);
+			if (!tmp_clks)
+				return -ENOMEM;
 			memcpy(tmp_clks, clks, max_clks * sizeof(sci_clk));
 			if (max_clks)
 				devm_kfree(dev, clks);

