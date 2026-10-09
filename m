Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62925CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 13:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5lskzRZiJ/wLUBka/Bq8NWnKrbKgiPUxlSQcyyAYMDw=; b=V6s/wclQl0uu0h8wSVY1qp9eHt
	zYk0uJfp+qqLxUQR3gqTfN4RxhgvXld6ks6Ft4Z76uKgvrmURfrJlAwouvtZOIsWmdSPXL5/BzX07
	ZNFTfHgYBn9uvEp/qjCV0rRb51iJpGmg4oduqK0Hd7LujvrEVuFTvvN7ckiaYNG0XvcVxASxvCWw7
	S1E3lnPkIKncwCDekaSgPgKg5lnjIT1WhWLIks+2+Eq+IJvh+C0vs4TjQxt2VfVgy6z6TmsRCI8JR
	4uaGkv1TRndbAF3h24xESo+7llv3wcy2RVgjhW6wAVpTYiOi4LfagSYURy9NEwEN7fxd3ytN915Al
	UUWVkbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAbx-00000006NRU-2O1E;
	Fri, 09 Oct 2026 13:26:09 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAbo-00000006NP0-2i8K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 13:26:04 +0000
Received: from francesco-nb.. (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by mail11.truemail.it (Postfix) with ESMTPA id A13AD1FBC9;
	Fri,  9 Oct 2026 15:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791552357;
	bh=5lskzRZiJ/wLUBka/Bq8NWnKrbKgiPUxlSQcyyAYMDw=; h=From:To:Subject;
	b=i6l2LpQ8qfF86Vi8Cgi/4Mt38dxdm9qSO6urKGuUKTHN1GMR8OzMG/LGjyYD3E6cg
	 ns+S0c/4ZotRjwC7ayy+BVgTWSQdMoJjD2YdA9cM3Tv0614yTurGCoPJ43OsVBQkRo
	 NUgMTLmC+02+BLU/MC9Pu9D2WWyNSIpwB0eLIh6AF/kZJ+E7DtM0u8QDKROUocSCDX
	 Fsh5XSHg7A4/dPXxYh5+N3DMCIcpRQ/fQ89e156BEXx0RiwKJv5OROWvKqW7QgmyZd
	 Z21XypLpdT+nxZw96q/JlrsBb7C4UtBzjKqH5YfWhTZaqIsElwd14ejDLRmnVSGvpo
	 g9bCRSmmd4ZOQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx9[135]-toradex-osm-dev: Fix USB_A source PDO to 900 mA
Date: Fri,  9 Oct 2026 15:25:46 +0200
Message-ID: <20261009132550.20793-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_062601_613784_6E059911 
X-CRM114-Status: UNSURE (   6.72  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Correct USB_A source PDO from 3A to 900mA.

The USB_A Type-C port on the Toradex OSM development board can source
only 900 mA on VBUS, but the connector advertises a 5V / 3A fixed PDO.

Francesco Dolcini (2):
  arm64: dts: freescale: imx95-toradex-osm-dev: Fix USB_A source PDO to
    900 mA
  arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix USB_A source
    PDO to 900 mA

 .../boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi  | 2 +-
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.47.3


