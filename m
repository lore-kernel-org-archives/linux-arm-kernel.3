Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617E6C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Usl6H/nBtIdNWk85VvCvQgapH1XWWJZiBzQZgQJqsc0=; b=qPFlh/2zw+M+B4SyVNSkqeUXSY
	n7Aisw183x3jGque4vF6B0uIJMqH+4IUMfEzOBxy0tWu0KFBj6fdQT+Y7fg1plz9mYJ+rFOp2NTzg
	rYM3NxjIZitq+EilqcwFXzfpSaZIioEjb/aXMWuob5wBa6RZAOZD2PFJgxd60FO53QVLqx1ficUvJ
	y8mYzsWVr/iNY0tI+NnmeFMqXCFcWoNbjkF/GUKT3EMIcknONNZiU8BZAvBguWdcoBWdLoopOHPc8
	iq50DUXChOCM/ARdZNlFiRMWqzXMlv21jutV7vvZ9NdMTBZ1dyrhDE1YIIlh0l/uwNfb3CmivGifb
	i3FsNauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYRbD-00000000Tfu-3mxV;
	Sun, 06 Jul 2025 15:48:15 +0000
Received: from smtp-18.smtpout.orange.fr ([80.12.242.18] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYRYr-00000000Taj-4BXK;
	Sun, 06 Jul 2025 15:45:52 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id YRYluars3Th6NYRYluaK11; Sun, 06 Jul 2025 17:45:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751816744;
	bh=Usl6H/nBtIdNWk85VvCvQgapH1XWWJZiBzQZgQJqsc0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WpBgGGCFmow0oQIz7lEbxTEUnoCkbYoEcfTdvX/txtOTWtzj8srDrSJmFh/sTMrxg
	 lcteRfLOmO+XuBK1WftkCUmOPbb6EUj/OpqOe10NI5Q3hQvFNeOZgkth1i5EE7XJC5
	 sRGw3La2irDJwYQ7MKbl/BMTRr6UJ+wgy96HhKcx187G7G9cqMAbQRlF/YBMC4Ij2h
	 kqBUQLRDeJ+c5P2TVhMpHSi3WgL+4NR3b14qMNxv/zfGYVHJD+e8lTALlQOa0CH4PG
	 f3eKwkV3ucYuQqWTfnrqE1QimImOtZUCo9QzmAoofhGCVsrT0gRIpjYiTMwr41goKE
	 Tgzz6j7HW3tJQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 06 Jul 2025 17:45:44 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] pmdomain: amlogic: Constify struct meson_secure_pwrc_domain_data
Date: Sun,  6 Jul 2025 17:45:41 +0200
Message-ID: <e71abd8d75dd842690e5a11e38037bcf5feac189.1751816732.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_084551_241256_4D80CC3C 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

'struct meson_secure_pwrc_domain_data' are not modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increases overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   9248	    408	      0	   9656	   25b8	drivers/pmdomain/amlogic/meson-secure-pwrc.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   9344	    304	      0	   9648	   25b0	drivers/pmdomain/amlogic/meson-secure-pwrc.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/pmdomain/amlogic/meson-secure-pwrc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
index ff76ea36835e..e8bda60078c4 100644
--- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
@@ -342,32 +342,32 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
 	return of_genpd_add_provider_onecell(pdev->dev.of_node, &pwrc->xlate);
 }
 
-static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
+static const struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
 	.domains = a1_pwrc_domains,
 	.count = ARRAY_SIZE(a1_pwrc_domains),
 };
 
-static struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
+static const struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
 	.domains = a4_pwrc_domains,
 	.count = ARRAY_SIZE(a4_pwrc_domains),
 };
 
-static struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
+static const struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
 	.domains = a5_pwrc_domains,
 	.count = ARRAY_SIZE(a5_pwrc_domains),
 };
 
-static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
+static const struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
 	.domains = c3_pwrc_domains,
 	.count = ARRAY_SIZE(c3_pwrc_domains),
 };
 
-static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
+static const struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
 	.domains = s4_pwrc_domains,
 	.count = ARRAY_SIZE(s4_pwrc_domains),
 };
 
-static struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
+static const struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
 	.domains = t7_pwrc_domains,
 	.count = ARRAY_SIZE(t7_pwrc_domains),
 };
-- 
2.50.0


