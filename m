Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B92CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fv/1dtOUoVNCKZwbZNeQlTXmM6tuMobbgYpONhXMsI8=; b=xOMNIN4TFN3XNNwsSRz2ufgr04
	giOcZ1qV70e4nii8tCAt4cug5qWkJ8pyB2FidZR+exbBvgx5f5gsxDpCqJ9L3AjAhG4QGnZ4qdzCW
	QepXR+ReTi2OruAMLCR9X6z9W6vqTQVbWT2S5lcxTl44UklUeDC+aTR7P+eANBUiYRm+Atty1xBFd
	iimReZnfq9V6dcxwqZjYOsNh+dwvJil7DpqBsxkEPozbtJh6DlDDZJBm59+/914EXC8FPbvj2ypeq
	fd7jS3dip3i845cGeqGq6bR2rQTDkVPpUacxV0c4e7NbborcwQ3+E/CSbfdriDt7Gtc4v6xPDfTIU
	5O1yz+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5Fj-0000000BGjO-1eKH;
	Fri, 26 Jun 2026 12:01:47 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5Fg-0000000BGiz-1uGv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 12:01:46 +0000
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-05 (Coremail) with SMTP id zQCowAAngNMgaj5q5xZnFQ--.22291S2;
	Fri, 26 Jun 2026 20:01:39 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: alim.akhtar@samsung.com,
	bmasney@redhat.com,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] fix: clk/samsung: exynos_clkout_probe: success path leaks parent clock   references from of_clk_get_by_name
Date: Fri, 26 Jun 2026 20:01:35 +0800
Message-Id: <20260626120135.34173-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAngNMgaj5q5xZnFQ--.22291S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWxAFy3JrWkGrW3CF45KFg_yoWkAFg_CF
	1FgFnrCry5GrnrCF1kCry5CFZIkr9a9Fn5XFWIy398A347uF17Zr4F9wnIyw1jgw48XFZ8
	G3Zrur48ur1SvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUoWlkDUUUU
X-Originating-IP: [117.182.75.66]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCREKA2o+TZNWugAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_050144_884579_85A33C68 
X-CRM114-Status: UNSURE (   8.68  )
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

of_clk_get_by_name() acquires clock references stored in the local
  parents[] array. All error paths correctly release these via the clks_put
  label, but the success path returns 0 without releasing the parent
  references. The references were only needed to obtain clock names for
  registration and are permanently leaked after probe completes.

Cc: stable@vger.kernel.org
Fixes: 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to module driver")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 5b21025338bd..ee3048d36040 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -190,6 +190,10 @@ static int exynos_clkout_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_unreg;
 
+	for (i = 0; i < EXYNOS_CLKOUT_PARENTS; ++i)
+		if (!IS_ERR(parents[i]))
+			clk_put(parents[i]);
+
 	return 0;
 
 err_clk_unreg:
-- 
2.39.5 (Apple Git-154)


