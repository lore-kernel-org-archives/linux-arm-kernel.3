Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB85D44D53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FbpAsg3o7PfFDuCF41WcBi9lk55h04DLXJFlfqA0BE=; b=QCMPFRPrEjeg/y5ByAC3Mhhvqe
	4FZgVIAh1b8TjXCU/S9/yGwIZAl1QsyZ+X4tFVe6v1oIBe5GeiB3yQJ6DnGtsWRevAdGquEVygSr7
	A+z8dwIOhmFdkd2ieNNsjF+22MKhmC2VfLuKpN/MKZadaqo3k4LkAARwAEtixTDBj391qWcyuEYRl
	xtlVQFiKLdaiD1sIi0XiqG0gbjigcl+0qSz7/rlEzD+sytOhX55t4Rtspc7cHz0Ff3KVarOEtgfRT
	SZKkavYFx5T0f728W0R1SRu9XJBMitYMxMelz9XQFCy4Htty2BJ0xDMfrPppWVdnlu55dhq5ZOPSZ
	cDUCd5FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eT8-00000002yRa-0yGh;
	Wed, 06 Nov 2024 11:45:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8da4-00000002nvG-31KJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Nov 2024 10:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9FbpAsg3o7PfFDuCF41WcBi9lk55h04DLXJFlfqA0BE=; b=WcpTTH/nh0BmFEf+hjZi6P5p+y
	tTMGX2oct09gBYHPPNfGlNe7+wSQSCzLwhxZjtUd7Uj22wVahZkZDRtj+gXHvjIO3Ky+P4BREYT0c
	4yf5otStGVwJl0cHOdW+PSEx+rXD9Xjb57RvxPt0jKdTgSdrqA0ZUd9IFnMy0/JE38jU4TQoKmE4u
	tiJOd9t8sn4KWkaPlegGbKDB4NLyb7BDCjxDOOEDrZE3tQ7JnJXuXjwN+wibeoubGic3KzU0GQubD
	wO03A6oc9dJJ/SyiFWI/OzaO/klf5TORcVviH/siHYfZi5gVJJArReZS63wAKhPBIrR6gP5zZjeAi
	QAa5DlVA==;
Received: from mail-40137.protonmail.ch ([185.70.40.137])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8da1-0000000Bw2r-1roM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 10:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730890075; x=1731149275;
	bh=9FbpAsg3o7PfFDuCF41WcBi9lk55h04DLXJFlfqA0BE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=sxsclCJegFRL6x4xkC5mrgqX0ejLFv9tv7vLYtkBjZsBQNV2k8rc9Pg5LVlrCRPgP
	 DMXkRIRLPirrQLw/MPoOBmR+xZiB8tNRGNkedeb2pElaKarIF6e0fMY6PlpFf6tuxj
	 c5ACyhW7/v50RhFxlekVQskzsOQwo+vFlHoKalmyiVDAqKX6vBH3TdD3ww9QIhVOoM
	 YlwiYEBPPB8bTLZ14feBfTjDJsQHglLtVIKm1SXl/mbgGjd7vRWuwefqdjd5TKpqOF
	 MHLqMadkPLWCzQvrKogK/5DqHb+fFPWzGWyATb2VROJtzFabLg6lPQK/6Unh689xgD
	 QsczlP9DlXxcw==
Date: Wed, 06 Nov 2024 10:47:51 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] watchdog: mediatek: Fix mtk_wdt_restart
Message-ID: <20241106104738.195968-2-y.oudjana@protonmail.com>
In-Reply-To: <20241106104738.195968-1-y.oudjana@protonmail.com>
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 2270a8af62230626aa0eba89eb49248f2a8f9a91
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_104805_768062_2D6844D8 
X-CRM114-Status: UNSURE (   8.57  )
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

Clear the IRQ enable bit of WDT_MODE before asserting software reset
in order to make TOPRGU issue a system reset signal instead of an IRQ.

Fixes: a44a45536f7b ("watchdog: Add driver for Mediatek watchdog")
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index c35f85ce8d69c..e2d7a57d6ea2e 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -225,9 +225,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt=
_dev,
 {
 =09struct mtk_wdt_dev *mtk_wdt =3D watchdog_get_drvdata(wdt_dev);
 =09void __iomem *wdt_base;
+=09u32 reg;
=20
 =09wdt_base =3D mtk_wdt->wdt_base;
=20
+=09/* Enable reset in order to issue a system reset instead of an IRQ */
+=09reg =3D readl(wdt_base + WDT_MODE);
+=09reg &=3D ~WDT_MODE_IRQ_EN;
+=09writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
+
 =09while (1) {
 =09=09writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
 =09=09mdelay(5);
--=20
2.47.0



