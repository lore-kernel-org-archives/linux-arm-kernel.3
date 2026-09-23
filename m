Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9D2C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKPvG4j9g8m9GZDieE5Fj9xDXaarMa/hUNDshw8h6f0=; b=yx8ujt8gG6wUDrOMJVC/FuZa5m
	nAvXF1o/t/VWDBYv6belKQka/qMxDYGh8fxXAVG+P1WajQV8zJv/sgW5Zxy+UNSpDS7fgYJAtyWBD
	2pBkdL0HQZ+TmlmXdo9K3xYjV8h5qG0JL2skbO2bZdUMz3mNu49cn5R1t+xK700gA7k5w6lxAJdsP
	eWhfIDl0KCRXKcOkNQEjdLq7ABj5bPL/T0ZvopYZMqRER1/khhZTIx3xUSFH9tXI2EPiwPxqht5l8
	fMciOzmLyOTD39s5+2uPzBJ/9TgA9neczB9iDh0fYmScacIp8WDFJ6P7ExDqii97C6D685Y1q9Ai8
	2Bdcr6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K1Y-00000007s1i-44Mf;
	Wed, 23 Sep 2026 10:16:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K1S-00000007rzc-23Do
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:16:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A099460202;
	Wed, 23 Sep 2026 10:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6461F00893;
	Wed, 23 Sep 2026 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158577;
	bh=DKPvG4j9g8m9GZDieE5Fj9xDXaarMa/hUNDshw8h6f0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NttLNaS2Bb3oxUtafbYJ7ovFw1ULru9z+u2u19KgfjDIWVjjncAO1ab3Yzz3VXXiT
	 8klWFmjaZU0NGmQGtN4TqTxyWnRq0s+jbMF5obnOLNqrDj3pAZkszLvgPF3z/E+vS4
	 8IBPcEeYN9HsH1bqYGmdwUzOJagjtI02h3u7w78ppI3Q5vH807IBrB79S4biWZkcrP
	 YcZNUeyoxtjPXEcOeHq5MgkSUSrIRHqrI+tksnOKQCNXisVJ1BQ07bd8dg1Z0d4uJs
	 ZB4pRsuO65x4ISbIri6zXBjWnh1pkfrnHA/FMO3p1XQxDXotKhPtcKlOzVKYtynOA3
	 9b6OoMlxh5adw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] pmdomain: arm_scmi: Propagate domain hierarchy setup failures
Date: Wed, 23 Sep 2026 11:16:08 +0100
Message-ID: <20260923101608.4180057-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923101608.4180057-1-sudeep.holla@kernel.org>
References: <20260923101608.4180057-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

of_genpd_add_child_ids() uses all-or-nothing semantics and reports an
error if any relationship cannot be established. The SCMI driver
currently only logs that error and completes probe, leaving domains
registered without their DT-described parent relationships.

Treat hierarchy setup failures as probe failures. Translate -ENOENT to
-EPROBE_DEFER so external parent providers can register first, remove the
onecell provider before unwinding domains, and publish driver data only
after hierarchy setup succeeds.

Fixes: fba9c703c184 ("pmdomain: arm_scmi: add support for domain hierarchies")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 00192472f325..874ddb899f99 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -117,19 +117,24 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 	if (ret)
 		goto err_rm_genpds;
 
-	dev_set_drvdata(dev, scmi_pd_data);
-
 	/*
 	 * Parse (optional) power-domains-child-ids property to establish
 	 * parent-child relationships.
 	*/
 	ret = of_genpd_add_child_ids(np, scmi_pd_data);
-	if (ret < 0)
-		dev_err(dev, "Failed to add child domain hierarchy: %d\n", ret);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret == -ENOENT ? -EPROBE_DEFER : ret,
+				    "failed to add child domain hierarchy\n");
+		goto err_del_provider;
+	}
+
+	dev_set_drvdata(dev, scmi_pd_data);
 
 	dev_info(dev, "Initialized %d power domains", num_domains);
 
 	return 0;
+err_del_provider:
+	of_genpd_del_provider(np);
 err_rm_genpds:
 	for (i = num_domains - 1; i >= 0; i--) {
 		if (!domains[i])
-- 
2.43.0


