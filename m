Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1410CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TilJGsSaVbNKEutDOXvAU0tIsDvjIQ7ttnA5DEprCHc=; b=O4w+FR7Zt/zXfNv7d76t4e8hAY
	oshc4jXrbQV1wtZrfJL658TTy96Q/Sfb3evigxep6nZraj5efqXBobbgA6fVtAPItDlTZHl9T/hpq
	L5y46/Y/vCra7CVk60oqBpT0t8Bu0zy0i02XIiDRr7+RhkaZAOX+BO/q38Z2cEkgbafx59pRognON
	c6/ZtOEwWH5Zh0nka66v50QHcQsDS4680eb1PgGQe+np7+WdocXF8RWAJZzuRDHtL8dTA31s1LQhF
	FqxkfrswbJOC8veiOTo4cCsMJxv3JyLqLguqEHX+KsN9FkLQ7WtjSu0sTkEuI5ijlPsvt25QkM2fj
	q66N8c2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPY-0000000Ax32-1sbr;
	Fri, 02 Oct 2026 08:14:32 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPV-0000000Ax19-2uN3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=TilJGsSaVbNKEutDOXvAU0tIsDvjIQ7ttnA5DEprCHc=; b=KZ+0VgjIfZaEr6UBx+lRQq4NxR
	drdZf9OQ5sHAR95pzm7kwxXYsLDBmN2e5lLKgE/wBACx4i5LOVRU8zagJAYg2T7J6INuZ0dtILNvW
	wbwBIFvXmEDLmeXx2mQph85jPLcGby4BMDR1C595oeP038JZeGjFlXMb96YkFGW5sjfsD0Ry75vHd
	00iRNZs3APIg7D7HiOcMWOliMNOEM46UZcv8EFYM7o/s1dqzPc4RNRzoRa/hXu/nf4Drq1tuSC8uh
	IX5qXdtZ3XJn3J4pY92eVGKldykUJgiv7weuL7NK6eAyXljqbaZPeZyzNSyo2Rl8esSdMLAslbC2P
	XRj9jvrQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPO-0003Ms-0e;
	Fri, 02 Oct 2026 10:14:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPN-000FgI-2i;
	Fri, 02 Oct 2026 10:14:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/8] Display support for TQMa6UL[L]x
Date: Fri,  2 Oct 2026 10:14:01 +0200
Message-ID: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_011429_866347_091F9149 
X-CRM114-Status: UNSURE (   8.99  )
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

Hello everyone,

with the integration of custom bitwidth on DPI output in commit aafd4205a75de
("drm: mxsfb: Add optional DPI output bus-width configuration") the display
support for TQMa6UL[L]x on MBa6ULx can be added.
The mainboard uses a slightly different hardware connection which needs
customization.
Both LVDS and parallel display support is added resuing the DT overlays
for all the variants.

Thanks and best regards
Alexander

Alexander Stein (8):
  ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULx
  ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULxL
  ARM: dts: imx6ull: Add LVDS DT overlay for TQMa6ULLx
  ARM: dts: imx6ull: Add LVDS DT overlay for TQMa6ULLxL
  ARM: dts: imx6ul: Add parallel display DT overlay for TQMa6ULx
  ARM: dts: imx6ul: Add parallel display DT overlay for TQMa6ULxL
  ARM: dts: imx6ull: Add parallel display DT overlay for TQMa6ULLx
  ARM: dts: imx6ull: Add parallel display DT overlay for TQMa6ULLxL

 arch/arm/boot/dts/nxp/imx/Makefile            | 26 +++++++
 .../imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso  | 53 ++++++++++++++
 .../imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso  | 53 ++++++++++++++
 ...6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso | 69 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi        | 64 +++++++++++++++++
 5 files changed, 265 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso

-- 
2.55.0


