Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B8FD10367
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 22:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cYqJjpxRWI31lROzETpBz2SfJd8xZH0dIGWu2ClzwLk=; b=BFzJBQ3BQGoQWrYJ3xi/5XFMID
	urffjtUnycio+kjIvCROLvd6B7Roy1/HGdr0CR+Mh6dqTUFVtXvGa+JYsbXWMMgOhTBxRlcjVU8CZ
	bD5DLgL2Lkj1XazowobE9UEPBTTljKlsvHvF9G7jVfUkdgxWzWRPsoZxt5n/0jTWIq7dc5tw5ejAG
	A9HEOUXhKQY49HMUtXGk1lwbedUWtVoE5QwjChSKfRHYlcHsBvZLfXh1Ufpg6c1QZytwxdtclubAZ
	lahskGzHSzK+6Ql6qkcEGgPrKvOLJi3J8NW6R/u1zXt893JTxI1EugKei1e4XuXtLMLLokMgPGThS
	+NoFFroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1Iw-0000000Dzqw-2LKV;
	Tue, 25 Nov 2025 22:14:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1Iu-0000000DzqU-3g4a;
	Tue, 25 Nov 2025 22:14:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BED943FA4;
	Tue, 25 Nov 2025 22:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4934C4CEF1;
	Tue, 25 Nov 2025 22:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764108871;
	bh=7VbNqwAxa2N0OP450xn7XUR+uM75sQSKDCch+WQswe4=;
	h=From:Date:Subject:To:Cc:From;
	b=Df1krrSEl3wdi2zNkUX7BEUpByp1N0DkH67EmheG0nQTPU1K6QVPOjYURtZmQEVf2
	 Om6EaatlGCObsv+mtwolZCm/oWWd5+YaF+fJcQlGWvPOG53eW00U1qnx+pqdhlPFZ2
	 T0OkyH1dsaP//A5UIuy/Nfh7FuBFgAvCBGsakOFtjRbAyUzbS00tpQZstQmndUeQi1
	 rks0VOxbNjPVQO7wt0IODVHXzU2CgssjlaqosZE1YAuLNKsolaL/2eooC17cf2Zdf3
	 NOazRzGudmlC1s+nrylXWcIwSeahH3vPHjkFmpSCAUIfLzzUJOtoGfYY7Z8lC3Tgvy
	 NefcgkB6u6xmg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 25 Nov 2025 15:14:23 -0700
Subject: [PATCH] drm/mediatek: mtk_hdmi_v2: Fix return type of
 mtk_hdmi_v2_tmds_char_rate_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-drm-mediatek-hdmi-v2-wifpts-v1-1-a6c7582cf69a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAD4qJmkC/yXMwQqDMAwA0F+RnA3YQpTtV4YHNVGzUSdN5wbiv
 6+bx3d5O5hEFYNrsUOUTU2fS4YrCxjmbpkElbPBV56c84QcAwZh7ZI8cOaguHl867gmQ66bnsg
 1VFcXyMMaZdTPf7+1p+3V32VIvxKO4wujpQxhfwAAAA==
X-Change-ID: 20251125-drm-mediatek-hdmi-v2-wifpts-d67b55175609
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369; i=nathan@kernel.org;
 h=from:subject:message-id; bh=7VbNqwAxa2N0OP450xn7XUR+uM75sQSKDCch+WQswe4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlqWi4sKa6RlUEHX+YYpj68/Dzl/capfHcDFkntCmZWv
 JVgzXqzo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwkfwfDP532ctkJ97YxMU4T
 kFlRncgS/Ehp3yTJ0K0FEYFnMuZdNmP4K/ND99HBGU/M7q1OOuUzLXXTnU0xWcfPr1eexiCzuPv
 yGR4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_141432_970945_7D808836 
X-CRM114-Status: GOOD (  12.42  )
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

When building with -Wincompatible-function-pointer-types-strict, a
warning designed to catch kernel control flow integrity (kCFI) issues at
build time, there is an instance in the new HDMI v2 drm/mediatek code:

  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:1331:31: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(const struct drm_bridge *, const struct drm_display_mode *, unsigned long long)' with an expression of type 'int (const struct drm_bridge *, const struct drm_display_mode *, unsigned long long)' [-Werror,-Wincompatible-function-pointer-types-strict]
   1331 |         .hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
        |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

While 'int' and 'enum drm_mode_status' are ABI compatible, hence no
regular warning from -Wincompatible-function-pointer-types, the mismatch
will trigger a kCFI violation when mtk_hdmi_v2_tmds_char_rate_valid() is
called indirectly.

Update the return type of mtk_hdmi_v2_tmds_char_rate_valid() to be 'enum
drm_mode_status' to clear up the warning and kCFI violation.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c272e1e74b7d..454b8b93b834 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1120,9 +1120,10 @@ static void mtk_hdmi_v2_hpd_disable(struct drm_bridge *bridge)
 	mtk_hdmi_v2_disable(hdmi);
 }
 
-static int mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
-						 const struct drm_display_mode *mode,
-						 unsigned long long tmds_rate)
+static enum drm_mode_status
+mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				      const struct drm_display_mode *mode,
+				      unsigned long long tmds_rate)
 {
 	if (mode->clock < MTK_HDMI_V2_CLOCK_MIN)
 		return MODE_CLOCK_LOW;

---
base-commit: a846505a193d7492ad3531e33cacfca31e4bcdd1
change-id: 20251125-drm-mediatek-hdmi-v2-wifpts-d67b55175609

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


