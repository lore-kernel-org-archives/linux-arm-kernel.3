Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0404CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; b=QYPQUP7Nl4UOWOuD6Jsbt+eMD4
	1ZixxjzGceTo3PXnuWxTIFDYFuEJha+lQSarxkXI9uMVGoJsKc19mA46DzuQGRBNiyMGrTDgjOEVO
	DW1Jb5H2V04NdxXuNGzcshkUCzuC4Fk6sP3iJp2DkgxtEgD5SWWEHgIGFFb5xHSo9qnijAjpGo+TQ
	8NxexNZNkJd/H0xLFnTZUihAaPpUi5EZob+yhdlTPHe0C7qL/2zipOxm/zovUIOrl4XOZRhgkpqWT
	Xr0U5+fk4NliXUrtvAjYmuLrIUeAU6AAo4AEjCa48mtFVF9fnv8rH0tF/OFsDzbRCXzEny7ww6cp3
	m9tHE5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyUG-0000000G4up-0Y0q;
	Mon, 17 Nov 2025 12:37:40 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyU2-0000000G4kO-49OU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:28 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383034;
 b=I0StgQorTFEEsBtjaL5FwoW84FpSXuafwTf7apXtb7k0ZM5c+kElN2/tp46GwqIR49yrqLlA
 7nqo60UaqVgZy8kzpkp/Jk6Rno/MfkiEloWTmReF0yzKSm8L3IXcbBrBUHWtx610ScEDpP1tqQt
 wS6+K9i5KaqI/oARWFwoNEOZkxauEsiUG1Xm3jQorX40n4v7Czx2AizRJcZOmPzZwpvSQsvW7dU
 Pv1Uyl0z8w/E6be1UGrHunuKCbbVHlG7UA7eU/a3Ctz3s5MY1Y0rBBBva5VMeEOoKbv1iAzCzjL
 Io7TZQXS8D9enb2m6v3fV/u2KtBSxJMX7pqGm6dImdPyg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383034;
 b=iwa0W6melFSHi5FFCdrxvX/8iZUnkBXq3cDytgfIN+lhBJ8NhlVx2mxDHhPxxdi5gIVZUkF2
 IlqTZ5+dd/8EqW1FT8WXur38tbR+JehApuXBgut4YLd3WN2GP0d61AtxHIljwO8H2uC41EoyGm0
 ocynX/PYTCeJnoAWWquJE/w8GtBWdsbW0qeGhMR5a6Beiem3TNpUpYX6GB8xGlW8aEeEjuYbeDk
 JLU7L5XSCswm75N0UkLsWnEATeo3/OoO5n1Vz4vX850uQQIE8OnuJ1VBStyeNTvmV0cjo/jqW8L
 YBHh9Dbu4Z2wPckMGGA1xfS67I8ZbynFAfSLS/x8GeZkw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Mon, 17 Nov 2025 13:37:13 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 185C9CC0DF3;
	Mon, 17 Nov 2025 13:36:56 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out signal
Date: Mon, 17 Nov 2025 13:36:32 +0100
Message-ID: <20251117123643.711968-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4d96gr5rnvz4Mb39
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 99c01bc02baa59d35c741e13cb81e250
X-cloud-security: scantime:2.386
DKIM-Signature: a=rsa-sha256;
 bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383033; v=1;
 b=cmlFyByi0qbhlEI3YAkIc1wnOIqnafK9MbHKgyD++OxI236VyoTkd82zJFPeHLH1eofduzPr
 3wmtMhT+OUTIhCHSJ/WzwOHsbKsDOrzDgi7eAgum3sGSEWxRPQtW2tUjCxQAaMz2Oe7wNkW6NgK
 G2mWM2MegSQUq5ABMT/MWR95vMxOqfqzJUj0cKCyaGc34jOaUWpqH4z9PbnfHqG2S/2sCZOGrZa
 tz+qclwBAeAjXGYrCYDhjdAgIKhnMBv+p5s6GVWMboc6ZRaveW2LH6kiqlaXAgVlyZ+h/b5SlsP
 HmcITNoEjONzEvzG+W/bnXZ2FABS/BJJe6wOWcDIm/8Fg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043727_179649_00BAA49E 
X-CRM114-Status: GOOD (  11.92  )
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

The event out signal on channel 2 is available on pad SAI2_RXD0 which is
connected to X63 pin 13.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ac889a69da69a..fdfe246c56407 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -807,7 +807,8 @@ pinctrl_eqos: eqosgrp {
 			   <MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x12>,
 			   <MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x12>,
 			   <MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x12>,
-			   <MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x14>;
+			   <MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x14>,
+			   <MX8MP_IOMUXC_SAI2_RXD0__ENET_QOS_1588_EVENT2_OUT		0x16>;
 	};
 
 	pinctrl_eqos_event: eqosevtgrp {
-- 
2.43.0


