Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBEAC79FB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L/XcuxQLLZLXrKN2g2/0ioV+GT9Ym5AO4xWn00BwKE=; b=KUGWloKTzMaTLluzt0X8W8b97n
	HymgiTsOCLcsRKiCP0xjKFLtsidbFkd8EGtfgYL6ebF45+6Dxou/pfse0lRtUWfe6pUypWg8SVcMf
	GnHUbEe2CZnp2sFc8e5AuFwKE9GNfYrIQRuBsNfDY+iwzGkKz7Z3LImop9YN6YjUeweDb+GBIbNHJ
	8yD+vT1a2qTJ309P5FHodEybog0cOb8AJlBLyU+OUilk5ZuwEbrN3pCzMg0o8hL51LBJ1QVhjYX3w
	eNrCMMhKdZHhr7cpC7SlbaMTMRlLM562COea22qX9ZBvEs7vvGa0xpC1iy1FYtK+GRx4QnR7L3SDe
	YAn1jqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGI-00000009BeO-0gQF;
	Tue, 08 Sep 2026 13:53:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGD-00000009BbU-1ZkN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5L/XcuxQLLZLXrKN2g2/0ioV+GT9Ym5AO4xWn00BwKE=; b=f+F0DB5u124OCgFQTzqYmFjVqn
	Wvxm4a+5THpslzxX69UtOraZj9GXX7v1RldkmWWlf8AEa9bTafEIJtbVyVjwuS0iOsadW7JnzULK8
	Xm47hBNpOWYVyvcjfPBZigo63VGSuo44ugtZUDnjxfJr5WijGeIOwX8zp98ubM/1FmNVsae1PBRxX
	1D4PEiAnnn+jwaeTWi6/lQs8nXOXnAbVS/zcGeH4rNzqoL1ls+OuVoDZ4H90dpnV5VQtjAJmpEIrg
	LyCK3AkuoGeTboZi0rsrdZHmnJGhvAVQ+cNRRdhP/l40fvxAjcKkT9rEKPqajERWQXHtIrCeG8U1m
	Zjkd1UGg==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGA-0000000HUfz-2M4l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:16 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5L/XcuxQLLZLXrKN2g2/0ioV+GT9Ym5AO4xWn00BwKE=;
	b=iaAyeTrNCJLJQ/j1QOdrJeo4ecxauVYTE6q2lNJwsWzui/TbmSEGNFzvIm4jWcoi7KwgiF
	JSWv6zSeLZd9L+orB9++8d69scpw+fhl5Y2YSgc9TX/hQz9BFIYTOr6IyQnif09M//l0Xe
	QyiWozek7suUN87L2D3fP8dM4FVIAg9hj4Oo0ag/aJoWDrDKP+n7vFA3abBrdD3yKaWMrp
	nS6BvFJ3oa3bRDusZ6RfFXIyYW9LkjNJiGNwEhIpdz88hxjSYQLbl6QEB/L+2LwtG0naV2
	Q63NMlZC5O/7FY9IuLEjQQHMSXEQFSxF7rrri42xaJEwJR6+zUM6VqshEZV+TA==
Date: Tue, 08 Sep 2026 15:51:52 +0200
Subject: [PATCH 5/9] arm64: dts: imx93-kontron: Make USB-C connector
 "device-only"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-5-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=nBXNsn5j9wvYH8NLcZ6PDt1KYldwEPOzwtDvyon9Z9k=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsHPxhE4np20PVp2LeD3rid+cPmkx84+fm9xyhC8Kz
 Xt1NIW3o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCLOsxkZrm5dtvJziNeqI0+P
 XP8zcdW5yd+enQzs1+Y34ftdc/LPwhJGhiNzPQ2XXLnVM7UwSufh3oauZnYtJoa0NUzZTkk1G+b
 lMAMA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145314_805706_BB64250D 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

The dual-role support was broken on early prototypes and has been
removed in later hardware revisions. Reflect that by setting dr_mode
to "peripheral" and removing properties related to dual-role usage.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
index 4620c070f4d7..0277640d7c4c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
@@ -158,12 +158,8 @@ &tpm6 {
 };
 
 &usbotg1 {
-	adp-disable;
-	hnp-disable;
-	srp-disable;
 	disable-over-current;
-	dr_mode = "otg";
-	usb-role-switch;
+	dr_mode = "peripheral";
 	status = "okay";
 };
 

-- 
2.55.0


