Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6323EC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 04:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuh/yBsybWoOF1NhxfFmA6tgTOCf++Nm+y+ido/Xxwc=; b=FOX8fKl6VzodjQNYGL7tNIujCD
	VtS1cZkM8p2J+KcTLALMzlrUfCfm/FcEeV3pie2iQUiB3EroTolo58ljJdvouHYGwOlfd1gyGwIYg
	EOEwSgySquIopkbTezG6S5aLA7e/RwaaouyvetcAV+WgXG17LxFHml7zPr7nWi4QBFBtUk7AnFKVN
	+0vAllkUluuagG8sWMjiPJIKKJv3gdVUvfKSEcBMZoJZV3Ic18i2lqxYz1PDuZHe37S6kZe/0YrJ/
	j2AZjVEKSAEok6PqLBjYKuSZWDIdQYFVnGmbFtS6JPXMVRTAPRdNXSfxCedRvjBHSD31mw4jrfx+V
	U7+yeG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9YZ-0000000A84E-3lAA;
	Tue, 06 May 2025 04:05:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4xy-00000008yhg-0xva
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 458C44A6C0;
	Mon,  5 May 2025 23:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E059BC4CEE4;
	Mon,  5 May 2025 23:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486677;
	bh=oxeGttg3SoJ505VY3yrwYPkfynDRPeZkZ0HzLDrc7gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YuT933/d+uf/GcHdrR1Pwpc5KfGSR3a8hySKOStKrPhiO5BW2ewV3WMAcahXoV8NJ
	 bWza/D/qKu9VArNoL7vrx67ScJQyFKD9DjcBXw4H+eL/7J8IlwqPfzaKttel7NVJPw
	 E5z897aIfIiL70Nk+y4H/rhzhXNwwFgF5hyzkTue4EYfJgPr65AHR2M50sxQhrZp7Z
	 GhHcaWthDOSHaqbTqYD9cETz/5gSs2XlR+WVeDp68r+IohzbJO3iFklC43Ql/6pgKN
	 t3bGfU5WITnPppR2Ps7GBjuyy3RrNN/Hm7lKJ9A0937ReMp2RY2rUM7SvaAeR5Ql6z
	 rfZcnp5P1JB4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 146/212] pmdomain: imx: gpcv2: use proper helper for property detection
Date: Mon,  5 May 2025 19:05:18 -0400
Message-Id: <20250505230624.2692522-146-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_161118_287059_66D6AF15 
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
 drivers/soc/imx/gpcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
index 88aee59730e39..6d5b6ed36169f 100644
--- a/drivers/soc/imx/gpcv2.c
+++ b/drivers/soc/imx/gpcv2.c
@@ -1347,7 +1347,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 	}
 
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
-	    of_property_read_bool(domain->dev->of_node, "power-domains"))
+	    of_property_present(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
 
 	ret = of_genpd_add_provider_simple(domain->dev->of_node,
-- 
2.39.5


