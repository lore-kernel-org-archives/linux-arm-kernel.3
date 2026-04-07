Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F0E105D98E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqidrScT16TfGl9OOKC4+pSPsXAkboMmOB/9IGJL6F8=; b=Z5ImALxD/EvGuhlzn96JRxhFJa
	8oHPcSkWc9UZ+4q4tMyxlqyLZ6Rhwx9FuTR8crbBtgmjYG1xc9Qdya+ggLcVCqC39wP4TzvGhOCZK
	0FEfWqRO8x4t0vgWgdicAUquDNLwJm+tlXYyxz6t3/U6UHWL+ir1lOjo+SCjL1Xh7lYDX/rEpynxY
	gXqDtE+lN7gR1btAIfWI8OXFs2dMKcWkmx62U5yL/oVQkd7XhfWC5igTANzrrGUAE+dbSU6plDtuY
	lh6x7a3Ma84pGn2+NgWoGeui6bM5ncI9SFqO0li8nQKEM5cwterg1MZyeUnzLooEqeABNruwxjgn7
	8iRawARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAGHU-000000081Wo-2YdJ;
	Tue, 07 Apr 2026 23:56:28 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAGHO-000000081Uq-3xfQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 23:56:24 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 47A12C011866;
	Tue,  7 Apr 2026 16:56:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 47A12C011866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1775606181;
	bh=lDHPIP0z91YIoy/9et8RAk6xDXDfMvOvLikEmjLe23E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=etZKesGqg8Yyrjb9O/jaDjI/86KXY6pYOmhT97KKTouVQbpQSlEg2zk7wuGKb389z
	 VU41KCeCikcbyThzNvL8gvnUOBrfGa6CRrQk+a6MO8JwjHXJ1A5YU3aaHk6Zz0zVcy
	 Tay/hxbKuORbJU3qIbbYwu8thbi3eP2vnyg2XtUk=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 399BDAE80;
	Tue,  7 Apr 2026 19:56:20 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:PIN CONTROLLER - SINGLE),
	linux-omap@vger.kernel.org (open list:PIN CONTROLLER - SINGLE)
Subject: [PATCH 2/2] pinctrl: single: Add bcm7038-padconf compatible matching
Date: Tue,  7 Apr 2026 16:56:11 -0700
Message-Id: <20260407235611.550515-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407235611.550515-1-florian.fainelli@broadcom.com>
References: <20260407235611.550515-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_165623_132654_934FC57A 
X-CRM114-Status: GOOD (  13.26  )
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

Just like the TI J7200 padconf, we lose the context and therefore need
to save it and restore it across suspend/resume states.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/pinctrl/pinctrl-single.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index d85e6c1f6321..657b42caf811 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1960,7 +1960,7 @@ static const struct pcs_soc_data pinctrl_single_am654 = {
 	.irq_status_mask = (1 << 30),   /* WKUP_EVT */
 };
 
-static const struct pcs_soc_data pinctrl_single_j7200 = {
+static const struct pcs_soc_data pinctrl_single_loss_off = {
 	.flags = PCS_CONTEXT_LOSS_OFF,
 };
 
@@ -1972,6 +1972,7 @@ static const struct pcs_soc_data pinconf_single = {
 };
 
 static const struct of_device_id pcs_of_match[] = {
+	{ .compatible = "brcm,bcm7038-padconf", .data = &pinctrl_single_loss_off },
 	{ .compatible = "marvell,pxa1908-padconf", .data = &pinconf_single },
 	{ .compatible = "ti,am437-padconf", .data = &pinctrl_single_am437x },
 	{ .compatible = "ti,am654-padconf", .data = &pinctrl_single_am654 },
@@ -1979,7 +1980,7 @@ static const struct of_device_id pcs_of_match[] = {
 	{ .compatible = "ti,omap3-padconf", .data = &pinctrl_single_omap_wkup },
 	{ .compatible = "ti,omap4-padconf", .data = &pinctrl_single_omap_wkup },
 	{ .compatible = "ti,omap5-padconf", .data = &pinctrl_single_omap_wkup },
-	{ .compatible = "ti,j7200-padconf", .data = &pinctrl_single_j7200 },
+	{ .compatible = "ti,j7200-padconf", .data = &pinctrl_single_loss_off },
 	{ .compatible = "pinctrl-single", .data = &pinctrl_single },
 	{ .compatible = "pinconf-single", .data = &pinconf_single },
 	{ },
-- 
2.34.1


