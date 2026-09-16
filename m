Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C72BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Uey6tC/T7IpUvm5V55TBF80oOWcS7JlMg21NcQENq0=; b=J/Vx4G8ZKfc7MR6zfaYL4vds2F
	f/cYoNeLeZ8oUVO6kcOSQYamdeS9HpD/KP7MHsGxX+TB0SgqT361EPdd528P+5vuhynni8QKnHHUB
	aOoyAxHek4G3RN047PMfkuDHavNrFV4qs2jvDYcvRw4gKtmUKtiFWqACaFezRL9WXXwimGtA9Tg8x
	JP+xze3ilznsCsGXBMs/15fh6ziiqY/LQeT1tbRnYQIViD9wvqx0dfxeCAB8UHUpaL3Vr+UTGY+sE
	jkliEgDTXkO11s9tyzqyxHsO4aRcIkDuZ1Bfzs9LH/oF+i/CXmM2SpyzQEyixoYWUt84nq9+BFyJN
	5wOOmJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jwo-00000008ZxM-0DSI;
	Wed, 16 Sep 2026 07:20:50 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jwl-00000008Zwx-0D5B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:20:48 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAC3wkBIQ6pq3w3fBw--.65491S2;
	Wed, 16 Sep 2026 15:20:41 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: airlied@gmail.com
Cc: alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org,
	inki.dae@samsung.com,
	krzk@kernel.org,
	kyungmin.park@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	seanpaul@chromium.org,
	simona@ffwll.ch,
	sw0312.kim@samsung.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH 10/20] drm/exynos: dpi: Fix OF node leak in exynos_dpi_parse_dt()
Date: Wed, 16 Sep 2026 07:20:12 +0000
Message-Id: <20260916072012.1967169-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3wkBIQ6pq3w3fBw--.65491S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF4xZw4DCrWUCrW3Wr17ZFb_yoWkZrg_CF
	1xZFyxXr15uryvvrsrAF1fZr929Fn7uan3CayIvFWayw15Ar4YyFW3ur18ZrW7uFW7W3sr
	G3Wjv3W7tr1xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUCNtxUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEMA2qqP7kPgAAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_002047_482537_7764FB58 
X-CRM114-Status: UNSURE (   7.86  )
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

In exynos_dpi_parse_dt(), ctx->panel_node is obtained using
of_graph_get_remote_node(). However, when "display-timings" child node
is present, the driver uses display timings directly and ignores the
panel node without releasing the acquired reference count.

Call of_node_put() on ctx->panel_node and set it to NULL when
"display-timings" is present to prevent reference leaks.

Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 0dc36df6ada3..0b64d1031951 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -168,6 +168,8 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 		int ret;
 
 		of_node_put(np);
+		of_node_put(ctx->panel_node);
+		ctx->panel_node = NULL;
 
 		vm = devm_kzalloc(dev, sizeof(*ctx->vm), GFP_KERNEL);
 		if (!vm)
-- 
2.34.1


