Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB655606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0GvWCj41
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4LVdAh7jFKz1/5D+uYBEuLTvX7Jj6VNWI0HOhAsYnms=; b=0GvWCj41Oj6qJAQ4WkDCQ/0/B6
	NVIDR5yPJMEslh7EXKybLYtH3sfWY31RSUtZ1pkOi7Ks5A0yRrXzYSRTMPxULJ48SpJoL4qY2KJow
	766domxRJHKtkUSHNiQSb+wuex6O/8EKbAuLl3rG3FUDYPN4k5/u0Klpcvu1WeGfMNgC2Bm9QQtVS
	vljRHhcW25mDg5NuLVUnFjxfsGV0fQRdZFQcHNYOlpqns2KKAVi//nPdf32yqCgfc2fp4iKsCccM2
	tRO/SOfkjhmdU5ydgHLSGSoP/SAZt4VMLHrxXIVcTujBq49FXRYCvyBVXFosHi/e5BFtK4VMoHW7J
	3Q300JRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQvo-00000004BRx-27id;
	Wed, 04 Nov 2026 02:40:56 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQvl-00000004BNG-3Xgo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 02:40:56 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnEPswm+pq5bk+AA--.9653S2;
	Wed, 04 Nov 2026 10:40:48 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: dpi: fix panel node reference leak
Date: Wed,  4 Nov 2026 02:40:57 +0000
Message-Id: <20261104024057.1508839-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADnEPswm+pq5bk+AA--.9653S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF18GF4UXr1ktr1kGw1UGFg_yoW8WF4UpF
	47Cry3Ary5XrW7GFy0vF1DAFyaya4IkrZa9FZ3CwnrZwn8Xr1UX3W5ZFW5KFy5AryrGFyY
	yr4DJF13A3WUCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
	AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7IU0c6pPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwYBA2rqZFjVVAAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_184054_307383_ED1F8148 
X-CRM114-Status: GOOD (  12.58  )
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

exynos_dpi_parse_dt() stores a reference to the remote panel node
obtained with of_graph_get_remote_node(). Nothing ever drops it:
exynos_dpi_probe() only needs it to look the panel up with
of_drm_find_panel(), and the two parse error paths return without
releasing it either.

Release the reference once the panel has been looked up, and on the
error paths before returning.

Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 74d3a2bebb74..b9417529b38e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -174,12 +174,15 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 		of_node_put(np);
 
 		vm = devm_kzalloc(dev, sizeof(*ctx->vm), GFP_KERNEL);
-		if (!vm)
+		if (!vm) {
+			of_node_put(ctx->panel_node);
 			return -ENOMEM;
+		}
 
 		ret = of_get_videomode(dn, vm, 0);
 		if (ret < 0) {
 			devm_kfree(dev, vm);
+			of_node_put(ctx->panel_node);
 			return ret;
 		}
 
@@ -241,6 +244,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *dev)
 
 	if (ctx->panel_node) {
 		ctx->panel = of_drm_find_panel(ctx->panel_node);
+		of_node_put(ctx->panel_node);
+		ctx->panel_node = NULL;
 		if (IS_ERR(ctx->panel))
 			return ERR_CAST(ctx->panel);
 	}
-- 
2.34.1


