Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F97FC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvt12wgFT9s8Sclfi5Btxj6tC72UvL0+SXqxbc8+i+8=; b=DMSOnqDDxpgjsfJgzzCtt8RJIl
	xQ81KSzoanYzBG0sYc996vDL5DA7xavALDgWqgkMic7Y9sTGJfUJ8aVRcrYoxtT0ufJq29aFD6uGN
	1TbMjjcBQziEwX1A4nN9SdVlS2VcPTT/KMu6RYE6A0YjCLEoPUHl1KuomMSIhFE3zAGRxu23Q/6/P
	bUKI3TMDyb9TCzmRevnu0rn6+yvIqVUGd7jh6d0IcccNA5pjxUukiREt8Vpk4y1cXa+ITkyGGlKQ8
	mbTnGfpwnWy6F0+eHZNawedqIpUK/3Di5CSwOINGa+sL4BzIeEG51a3wo+P6rN8317/oVieltE54L
	99tVHEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7dJ-00000009ePl-2MlT;
	Tue, 06 May 2025 02:02:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4dt-00000008sWn-0sdm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F7C14374F;
	Mon,  5 May 2025 22:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580D3C4CEED;
	Mon,  5 May 2025 22:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485432;
	bh=x4IvsUEfzHlSC2LzP/8/YpTVrEUqXDFL+x1OF5RhMqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lse/RbgD4Ydb4c4WIcTxrSSg/aD5NqKt+xvYPVIRYPJjJMonf8vVUUL3qB6jiKuz0
	 agvFIB3ZcIDkZ6bisfl3CJyUssrqozdiZgpLH0i4Mx6OjRYTbKQ8DNABqInatI9/HR
	 EwK0m+MzuOfKHIJBlaIYZdwACAAozmnJcLvwL0Z1/9+Yxx59jmzolBvfjk83t99VG1
	 44sTVo4griiEBkN8zWemFrxH/rEoHMBu4TZ5csJDD0K4smzwXx7vG1wOyGvGMj4C5T
	 d6cyZlQuoUM14gOK8v+kNhV8NnON+ct5jcz7aGxdhdKYwIENUa6GkLKHS4YFns0bIh
	 5sB3IYhCc/Zjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	shengjiu.wang@nxp.com,
	peng.fan@nxp.com,
	joe@pf.is.s.u-tokyo.ac.jp,
	dario.binacchi@amarulasolutions.com,
	krzysztof.kozlowski@linaro.org,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 308/486] pmdomain: imx: gpcv2: use proper helper for property detection
Date: Mon,  5 May 2025 18:36:24 -0400
Message-Id: <20250505223922.2682012-308-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_155033_290981_A80C63A6 
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
index e03c2cb39a693..0dbf1893abfa3 100644
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


