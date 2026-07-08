Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B8AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pdc8kUJhsaq8N1r0m6ge5yol36Y1IShouOM/AGoYtqI=; b=IUDsErmqJ1/79VDW7wryyLROwZ
	z8M7DWTC2dcyyan0hkWczHWsyS9EQS2iQnWOTuZvrg/MKVrlXoyNdt6j0yOyfJmBAN67Kcc4eWrUj
	sENOaCjewW8elB1oeW7nvIJ58p1VTrS4ywSiUHsWUwOpk52kziSQo025oBmnvbFYcGwqEPabXPguf
	zfoQjTPytW0oha61IK6tmR4tzS/OfhWpdfaELcgtf2W/nEXuRPi3yZA8QMLVvLh+HvLZXZskeqZ/D
	ug5DLfwDxOm6CrOku8UiMwDFUhUlcKEQeWTjv+QvoA+1VZx1iyKi6zPDpD6MFelgfGvCKYz8QvniS
	FK26w8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP1R-0000000Gn7s-401z;
	Wed, 08 Jul 2026 09:56:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP1Q-0000000Gn7Z-3k6l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:56:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C6CBA60008;
	Wed,  8 Jul 2026 09:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCF41F000E9;
	Wed,  8 Jul 2026 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783504610;
	bh=pdc8kUJhsaq8N1r0m6ge5yol36Y1IShouOM/AGoYtqI=;
	h=From:To:Cc:Subject:Date;
	b=BYgAx0qK9olgdiSMsctTirYk+2OK+/P6NF8jVdupbK4WVeCQYnBZPMzljrqEki9Hi
	 g63ETnn2EcLzAc5m1SXYmJ0Igg4HRO2THScLohlbmm3aGf3D7BuXkCGEBJyzH240mT
	 W/mexf9Dvgleiv/2vFoRICj0wDJrmL9EdfC9L+L+ljovAbL4tBe4IA5IKsg0JMmBYR
	 X5XmeQAIGy0SNtHzaKJ7FcAaHoSS9bl7Hhk3m0VeP7exEZLc7mpK1unJX1GFWXd+RT
	 OlHi01cNAUq4nB2fx2BwtoLbmsK5OMY1xEvbriF7QcNJF1mWXavaZgUMmE447qrdKG
	 wYRlPrLoIfemQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: victor.liu@nxp.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] drm/imx: Switch to irq_domain_create_linear()
Date: Wed,  8 Jul 2026 11:56:44 +0200
Message-ID: <20260708095645.385291-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.55.0
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

irq_domain_add_linear() is going away as being obsolete now. Switch to
the preferred irq_domain_create_linear(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dc/dc-ic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index a270ae4030cd..d8aa46ee6a7a 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -174,7 +174,7 @@ static int dc_ic_probe(struct platform_device *pdev)
 		regmap_write(data->regs, USERINTERRUPTMASK(i), 0xffffffff);
 	}
 
-	data->domain = irq_domain_add_linear(dev->of_node, IRQ_COUNT,
+	data->domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node), IRQ_COUNT,
 					     &irq_generic_chip_ops, data);
 	if (!data->domain) {
 		dev_err(dev, "failed to create IRQ domain\n");
-- 
2.55.0


