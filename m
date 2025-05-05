Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24992C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp4YMrZWf1cJ60Z3cKWlA/tJ68GAx3ZW1JyVpqPx8bo=; b=AE1nVXuCj93rX1VNywp+KVfSa7
	kw35oto8AmgATFuS2+3o0d2z8csEJhCgD3gNJY8KpTX8MsRrL5SUQQE7RDLIno7l1D0/4FEZI5cx4
	cO/8cHdYk4I8Gkdi/p4co45VnTTmWnOBIeD2KGNHLT7iZ/j/npulkGIgTGflvMeH5z00stRKmP+s5
	Mz7NV3dXari3DQhXsef6zlFEFx95KxxtV1Fc7bORqyvgQgpSq8alVlCxHGlxHpPRyVERueO5Cg9vQ
	wyejQcr7NAk3d9GU/BXm0scu+uo4ENqNdK+2vKf6OVjXRiQWGB8rvxldu0Jg8xzlQg87kbSk/GPyI
	s/8hUvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5q2-00000009CjC-07uT;
	Tue, 06 May 2025 00:07:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4KH-00000008mFr-3gbc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90E76A4CD85;
	Mon,  5 May 2025 22:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2CEC4CEE4;
	Mon,  5 May 2025 22:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484216;
	bh=0SqSalVLNIGV7ZGEkllDtan/2CZ5yqAgZD7fPjaulCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IqyQhuD8MmBuM3bt8GlSiHB9oharCb3ejbevYIWd+5G5Bw+RJk28oon3WbJRTSRkB
	 9MIESsKDWkGC9B07XY8nC8RSvCbO7Bti+FdmxQ9tfVmJOa3X1WmgK2nqV4YsDwNZYF
	 tUDaXyfCNbHIt217pLQKGGcXxyPfnzeayfXUJbUey/sP7A0LzzyANW4ffGnADzs73z
	 b5Uzr4sndhXCC+8sjSz49FbXsdgCuFQL+b4uYmyg2DFwjTiIOfVQ19rPCDGQvSLyuc
	 uKxsbvqkcUTSCbeUhULRSrDDHJKJyFWKAbnut2VFxxpIrjdDSOO7sBZRZ+w+Ko//yi
	 mAA1JKE7UnLLw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	shengjiu.wang@nxp.com,
	joe@pf.is.s.u-tokyo.ac.jp,
	peng.fan@nxp.com,
	m.felsch@pengutronix.de,
	krzysztof.kozlowski@linaro.org,
	dario.binacchi@amarulasolutions.com,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 392/642] pmdomain: imx: gpcv2: use proper helper for property detection
Date: Mon,  5 May 2025 18:10:08 -0400
Message-Id: <20250505221419.2672473-392-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153017_985782_A9C496C1 
X-CRM114-Status: GOOD (  11.99  )
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

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

[ Upstream commit 6568cb40e73163fa25e2779f7234b169b2e1a32e ]

Starting with commit c141ecc3cecd7 ("of: Warn when of_property_read_bool()
is used on non-boolean properties"), probing the gpcv2 device on i.MX8M
SoCs leads to warnings when LOCKDEP is enabled.

Fix this by checking property presence with of_property_present as
intended.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Link: https://lore.kernel.org/r/20250218-gpcv2-of-property-present-v1-1-3bb1a9789654@pengutronix.de
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pmdomain/imx/gpcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 958d34d4821b1..105fcaf13a34c 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1361,7 +1361,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 	}
 
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
-	    of_property_read_bool(domain->dev->of_node, "power-domains"))
+	    of_property_present(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
 
 	ret = of_genpd_add_provider_simple(domain->dev->of_node,
-- 
2.39.5


