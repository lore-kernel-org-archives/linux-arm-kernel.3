Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DFDC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PAEuUmyEz04MVxzmf/WiadKVMc5DZFmvN02XDvvpgEQ=; b=H568/vRthVyReOCwHNVztrqfeU
	aqHPb7LvQ3kR4KpiMK1ZNJRUMJYWW+TV8vANayIslGt8iBXR/paOvuvZ07NUcsipLXuD9+ftyKmd/
	HevpYl2EqVr7ZrYmm/3C++jOKI/6stBFVcBDON3TqRsQNDys7iExoyDDacMxlfrZQJqTVnvz1Uvpa
	seBj8wBG/UZtdyGxcWVxEG+wcGn7Zb/l4KXVb6eEj2cKWXJX3E2jlphYqfUDcCC53mm4eWQdnJT8d
	iLVuLPd9en9hKr7PuNH8RsxhtKDSi+61IkPXYqqDt8adjjFddyZ8w1/txKUhF6Lw09gtkzyNWPIqK
	Z3uJuD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K1R-00000007rzO-1DFv;
	Wed, 23 Sep 2026 10:16:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K1Q-00000007ryt-1rac
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:16:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE29940BFD;
	Wed, 23 Sep 2026 10:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68221F000FF;
	Wed, 23 Sep 2026 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158575;
	bh=PAEuUmyEz04MVxzmf/WiadKVMc5DZFmvN02XDvvpgEQ=;
	h=From:To:Cc:Subject:Date;
	b=OY6fg15WKZvabGADy6BLAjc4dWtTpXkC6NPxm49EJwOL92z8IwQnVrGaKUtpj/shZ
	 M6b8W3RPV+ZAplVh17q1zJ/hCvztRnyGog+ek5rxq+OwY+5QNCO1H56D59PPxG4E5o
	 29odcAlOSpAv2Qcgtn650tY8rOpySiPcc0hVtvH788X8sPtQBmehKUzjAGPjZI9nh7
	 ep0256BS45ir2jokbGBTaopF4XQwhuZrmjXnYuy5CiUv6z7qm1GChjUzmBv7iXcyzi
	 tPPJeqVH25UyMm6ZLzaCyAtWBh80e1bT4nCxakXb0kz+T/E8yfvSlceBKjP7qTmnQT
	 A0GJrOQpYuWOA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] pmdomain: arm_scmi: Skip domains that fail initialization
Date: Wed, 23 Sep 2026 11:16:07 +0100
Message-ID: <20260923101608.4180057-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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

pm_genpd_init() can fail while allocating generic power-domain state.
The SCMI driver ignores that error and stores the partially initialized
domain in the onecell array. Provider registration then fails because that
domain was never added to the global genpd list.

Preserve support for partially available SCMI power domains. Log the
failure and leave the corresponding onecell entry NULL so the other
initialized domains remain available. Explicitly skip empty slots when
unwinding provider registration failures.

Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 3d73aef21d2f..00192472f325 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -99,8 +99,13 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
 		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
 
-		pm_genpd_init(&scmi_pd->genpd, NULL,
-			      state == SCMI_POWER_STATE_GENERIC_OFF);
+		ret = pm_genpd_init(&scmi_pd->genpd, NULL,
+				    state == SCMI_POWER_STATE_GENERIC_OFF);
+		if (ret) {
+			dev_warn(dev, "failed to initialize domain %d: %d\n",
+				 i, ret);
+			continue;
+		}
 
 		domains[i] = &scmi_pd->genpd;
 	}
@@ -126,8 +131,11 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	return 0;
 err_rm_genpds:
-	for (i = num_domains - 1; i >= 0; i--)
+	for (i = num_domains - 1; i >= 0; i--) {
+		if (!domains[i])
+			continue;
 		pm_genpd_remove(domains[i]);
+	}
 
 	return ret;
 }
-- 
2.43.0


