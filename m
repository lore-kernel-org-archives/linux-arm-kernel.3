Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4EFD44D51
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkzLaSae52UuqsoJEc/MkAHf/7nI2oM6ay3zhyqh1R0=; b=pftUcEIJz7ZCoMgvY064NXOJa2
	/mayjr0HIOFQcFs0AVCOjmq8NxaTXLBUdcuCQ9kLyRXn7hguZNeyJcQpLcGTUpiH+ATU05AvsQrvd
	jRoIrNZ5ZP4dNaHVFx3tROJy0tQTGR1aqWjr3O918x4n+Ls5nqSTZ6zVGSh0Znzppwx8Ehtj5yzIm
	kRSvcuzH2XQlejdYGyg+n07o5PVn0rPmb1/q3hdQP9P/eurNDbsEdFR+/zB3ryu/am4yhMPQufJYJ
	jsZptufzhRESnU/xqkDWuypTflSPPZDMbPLb5j3W5eEDH7C1niCkfq13Fh1bOPUmkOJo14WQKncXS
	AwBTrCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eUn-00000002ybj-2XnZ;
	Wed, 06 Nov 2024 11:46:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8da6-00000002nvn-3LDs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Nov 2024 10:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kkzLaSae52UuqsoJEc/MkAHf/7nI2oM6ay3zhyqh1R0=; b=Vb9agh7gDLC7ScFk0/e2YyPeBB
	CLTXW7Y96pb4JaHnmqApoxX7AFSH6rGhPpYu3yk7x15ORoVtt/CnJHrV40yUR5iUP0YB/zbLVIQXe
	ZoOoPB680M/pet/LZYJ21TlfWDffePQ08GKhWvj03xWMWmtB8g2l5MTvWnsTUt094jXJ18m4p7zMJ
	4fLm2CdEllU/zk4rRNk8DZ20RlAqZsyBsqghMK+tY8G+h86rPY+CxaynyUmGcW3N8O02dtERJgqv5
	Li47bru9lAuyYT06k/qPpbY5zPOIZcJpwoOm3Ij+LyG7rddQk2FTvxYyEqFDE5cCefHsEhoYXGnUw
	hbfaAd1g==;
Received: from mail-4027.protonmail.ch ([185.70.40.27])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8da3-0000000Bw3N-30Lw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 10:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730890078; x=1731149278;
	bh=kkzLaSae52UuqsoJEc/MkAHf/7nI2oM6ay3zhyqh1R0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Cy8eQt3i+sVmuzrwQUbkZo+3V9QU37BBbArhTMO+ocXEiL0ZFAebfWSsf1pH/gFYf
	 itas4urWbas5hv2fE7L78PfbkEpDBIeZjYjTcqmfIAezQlUrP++XjhPnoy1Z3vyWB7
	 AmkK04GCPFMtdkq05wip74al1LhTcwoMIT9rAN4CUroo5SjF9RYBsqth1RgvaO6/ZJ
	 j6GCYxgUUmsmWtA3xejmU5abmxovcOxub+p9ADzFOI+Sc4KZG7Vpby0vPbivXMhK2/
	 XEL2IsSm422a979gS6V6KIXDMpgI+D/cOYWjUb0RGw1fNKlUidqIQWU9h8ZnGK3oqG
	 AsszMpn32hc6w==
Date: Wed, 06 Nov 2024 10:47:55 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] watchdog: mediatek: Add support for MT6735 TOPRGU/WDT
Message-ID: <20241106104738.195968-3-y.oudjana@protonmail.com>
In-Reply-To: <20241106104738.195968-1-y.oudjana@protonmail.com>
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 8b289141cd324fdc2ef6f752e18c3d797afabfa6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_104808_145917_5B1EC86C 
X-CRM114-Status: UNSURE (   8.74  )
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

Add support for the Top Reset Generation Unit/Watchdog Timer found on
MT6735.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e2d7a57d6ea2e..91d110646e16f 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
=20
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
@@ -87,6 +88,10 @@ static const struct mtk_wdt_data mt2712_data =3D {
 =09.toprgu_sw_rst_num =3D MT2712_TOPRGU_SW_RST_NUM,
 };
=20
+static const struct mtk_wdt_data mt6735_data =3D {
+=09.toprgu_sw_rst_num =3D MT6735_TOPRGU_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6795_data =3D {
 =09.toprgu_sw_rst_num =3D MT6795_TOPRGU_SW_RST_NUM,
 };
@@ -489,6 +494,7 @@ static int mtk_wdt_resume(struct device *dev)
 static const struct of_device_id mtk_wdt_dt_ids[] =3D {
 =09{ .compatible =3D "mediatek,mt2712-wdt", .data =3D &mt2712_data },
 =09{ .compatible =3D "mediatek,mt6589-wdt" },
+=09{ .compatible =3D "mediatek,mt6735-wdt", .data =3D &mt6735_data },
 =09{ .compatible =3D "mediatek,mt6795-wdt", .data =3D &mt6795_data },
 =09{ .compatible =3D "mediatek,mt7986-wdt", .data =3D &mt7986_data },
 =09{ .compatible =3D "mediatek,mt7988-wdt", .data =3D &mt7988_data },
--=20
2.47.0



