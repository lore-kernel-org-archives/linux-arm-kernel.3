Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE50CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 08:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IfIDqJZfF08zWFt0Zzta+SmkT86Z+9Yztld18LGVYf8=; b=kPz0CzL4v2W46kQnn4pk+DegHz
	f293WeLfzqV/X7Bdel7wM4zCrcgLg0VHZr4wUGIpuA4U1pdDVST+EPf6i541UK5sT9T21/7G2kIgf
	EJqu3DmNKNgYZkWah/S2Q0MwGTz/qgwx92rIcOoz3J+z0xeMDZt5OJqmPIOVP0YoHYcabp6j3MJ1c
	iNzd025sXNvejSzkQoZ/nVCi49kRuf7nYUkGrEleAv5VSH0dERO4MXXAKK8GIJAfrIXqIb+ZAD2L/
	yOPgwxul+NJ9kBUq0fWn4C8Xx8Az7J0tf9P1l81VAI9l4vBxvfJykcKdlqSEPrUBSAmiCHYRgYNQh
	XtYunHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCuon-0000000D9o2-1rrr;
	Sat, 03 Oct 2026 08:10:05 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCuok-0000000D9n5-1fYE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 08:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=If
	IDqJZfF08zWFt0Zzta+SmkT86Z+9Yztld18LGVYf8=; b=QQ31iLkWuxrMMLO7jZ
	pvmDiuBrzfRF7idvp/0Z83/yMUZTBKEqpikvkZuvX7GR8LFTFzzW+KX/MSTfYMMK
	kuMNas13fFH7FolzBOFKJI5fzD9mAn1HgWNVOAoMffV2ieCOalQU5cVyBF10f76/
	MXMoNSt8vkS/VxH/O6owU3tEg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDX37c4uMBqHTY2CQ--.51768S2;
	Sat, 03 Oct 2026 16:09:29 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] drm/exynos: fimd: handle runtime resume failure for DP clock
Date: Sat,  3 Oct 2026 16:09:26 +0800
Message-Id: <20261003080927.430719-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX37c4uMBqHTY2CQ--.51768S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw17GFWUGF17Cry8tF4DCFg_yoW8XrWrpF
	47JFyFkrWjq3y8KFW2yF129F98Ka17GFW8XrZ3G348uw1UAr1vq3yrCF1DtFn0vrZ7AF1j
	vrs7Ja47CF1jyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piX189UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhkHQWrAuDnOcAAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_011002_780925_E9D46B8E 
X-CRM114-Status: GOOD (  12.75  )
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

fimd_dp_clock_enable() ignores runtime resume failures and still writes
the DP clock register and updates dp_clk_enabled. This can access an
unavailable device, record a state that was not applied to hardware,
and later drop a runtime PM reference that was never acquired.

Return without changing the clock state when runtime resume fails.

Fixes: 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with runtime PM calls")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index b6abdc4f2b0a..ea2b961f0cbc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1049,12 +1049,18 @@ static void fimd_dp_clock_enable(struct exynos_drm_clk *clk, bool enable)
 	struct fimd_context *ctx = container_of(clk, struct fimd_context,
 						dp_clk);
 	u32 val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
+	int ret;
 
 	if (enable == ctx->dp_clk_enabled)
 		return;
 
-	if (enable)
-		pm_runtime_resume_and_get(ctx->dev);
+	if (enable) {
+		ret = pm_runtime_resume_and_get(ctx->dev);
+		if (ret < 0) {
+			dev_warn(ctx->dev, "failed to enable FIMD device: %d\n", ret);
+			return;
+		}
+	}
 
 	ctx->dp_clk_enabled = enable;
 	writel(val, ctx->regs + DP_MIE_CLKCON);
-- 
2.34.1


