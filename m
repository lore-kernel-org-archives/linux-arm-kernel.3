Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242FDCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tUP5Vh/vxPgaKtuE0yVi53j6Lyral0yWxQv+YcshpbI=; b=BhIdVn4h6+wofxaRlp0bQV0f0h
	ozGNR5VzcY6UE4twI7F/vzFs7gjtmuRxBXbSJzzkxZzj7/emHIy4G5gbjd5FQj+S3t98F3FT/YeR6
	vN7NbYZ8eem6amPjSC7FlSqDXxZYZJajKyg0Lou3VPdv8NlA/Fa/Jf1tZc584uFZQ6wyWF94T2nxr
	YLa8jmXE3PyHq8myYljrNg56k/u6eY1BRui9ih4RPZEEcfMGbTsfxiHi1lZeaKIVywaGnF+Aw1MVH
	lLaWFoAPiY43Uh68tjNneviGe+0CPYmi0OUC/TcDFwSNZv0kFEf8uW/klcIK1rL5qmDIKeDbn+8IY
	LPJc2P5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLX5-000000085Zx-3Rl5;
	Wed, 10 Jun 2026 16:11:59 +0000
Received: from mail-gw02.astralinux.ru ([93.188.205.243])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLX1-000000085XU-1CmZ;
	Wed, 10 Jun 2026 16:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1781107905;
	bh=g7BZo8ONelciFNcARnK87kA3zf9NSxNSUp1iCmZQtVQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ma44tvA+NM5cHhIt1pBHaxRO88MNmtYScqat8SnVdYCUN1ymXX9lHpB7m5JDfSsLT
	 +ixHyDKbZnI/KZCc2Sto77QTaMVMRMz9WrHYgkBEisTyPtBFKxydnn6iA1qvOr41X1
	 BfhT/GyI8gthjohkokqof5CdmD5ehOmTb1Ezl/qjtatZgxtjrth/NQQ0qywKmJzuch
	 zDZpi7fnqJXHCIY7bNB1aiso57JTkXRHN4QsnOjpOgD7wfFwFavGZqEcl+/UkmvLlf
	 OVuF90C/UDzlR4lua1Dz5bO3OU+l8/qxLIDFn0RWhykHe0UjWDP4NpCPGDaLT7OFUC
	 FLkLqXBe2YVUQ==
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id 059541FA2D;
	Wed, 10 Jun 2026 19:11:45 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.205.207.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Wed, 10 Jun 2026 19:11:41 +0300 (MSK)
Received: from rbta-msk-lt-156703.astralinux.ru (unknown [10.198.54.246])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4gb9l06wmyzZd74;
	Wed, 10 Jun 2026 19:11:40 +0300 (MSK)
From: Alexey Panov <apanov@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexey Panov <apanov@astralinux.ru>,
	Mark Brown <broonie@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dongliang Mu <mudongliangabcd@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	lvc-project@linuxtesting.org,
	Felix Gu <ustc.gu@gmail.com>,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 5.10] spi: meson-spicc: Fix double-put in remove path
Date: Wed, 10 Jun 2026 19:11:29 +0300
Message-Id: <20260610161129.7612-1-apanov@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected, bases: 2026/06/10 14:25:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: apanov@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 107 0.3.107 575e75fe8e3b9d45c142d144823c5de38605099e, {Tracking_one_susp_tld}, {Tracking_uf_ne_domains}, {Tracking_internal2}, {Tracking_from_domain_doesnt_match_to}, patch.msgid.link:7.1.1;new-mail.astralinux.ru:7.1.1;astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 203793 [Jun 10 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.22
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2026/06/10 13:12:00 #28226830
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2026/06/10 14:25:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_091155_899412_CE63DE46 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Felix Gu <ustc.gu@gmail.com>

commit 63542bb402b7013171c9f621c28b609eda4dbf1f upstream.

meson_spicc_probe() registers the controller with
devm_spi_register_controller(), so teardown already drops the
controller reference via devm cleanup.

Calling spi_controller_put() again in meson_spicc_remove()
causes a double-put.

Fixes: 8311ee2164c5 ("spi: meson-spicc: fix memory leak in meson_spicc_remove")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
Reviewed-by: Johan Hovold <johan@kernel.org>
Link: https://patch.msgid.link/20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
[ Alexey: Remove the equivalent legacy spi_master_put() call used in
  linux-5.10.y. ]
Signed-off-by: Alexey Panov <apanov@astralinux.ru>
---
Backport fix for CVE-2026-31489
 drivers/spi/spi-meson-spicc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 6974a1c947aa..ae818e7df791 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -863,8 +863,6 @@ static int meson_spicc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(spicc->core);
 	clk_disable_unprepare(spicc->pclk);
 
-	spi_master_put(spicc->master);
-
 	return 0;
 }
 
-- 
2.47.3

