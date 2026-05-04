Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FD2CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 20:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bl9MhJmj1PIXcIiamIIGEmvPpsyWxGcS0ZI3LRp0kpw=; b=V5AfSc78l+lu5f
	VS4Xs7uKgc4h2xJbTV7yGe+bArSqjC2M3dO/hkn063KCr96MFmhDjAl6QNHBINjWCN1hex8Ss6jfU
	cfqA6DomKL3EeEG3g2iAX8pQytU9OAxcogdpD5j+/FMpM9qME5Va2ZvrbNU/5kekTMK8Dn/g+QFs9
	5CSaHM3R56WqqOdV2rkGU462KXqajsxzd25jBsGxV+P0x1/TVsdbPMA0qe9IfAA5MmnEgdg/5kAcq
	RX/3SPukPCvu2hfH/qCNCcFq5HUQ85+6y6Ql6zUdgZ0h3Zu65mu5Gbx4/17rsgOWxWeGqwocy6/Yr
	OJv/AX+hQRepDAAPwVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzo2-0000000EFQ8-1nnS;
	Mon, 04 May 2026 20:22:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJznz-0000000EFOI-1LOa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 20:22:17 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wJznX-0007WV-3d; Mon, 04 May 2026 22:21:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/4] i.MX LDB DT cleanups
Date: Mon, 04 May 2026 22:21:40 +0200
Message-Id: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANX/+GkC/x3LSwqAMAwA0atI1gbS+sWriAttowakSiMiiHe3u
 HwM84ByFFbosgciX6KyhwSTZ+DWMSyM4pPBkq2pohKvBg2e+yEONz/hLDcrtlNBpfWuIs+Q1iP
 yH9LZD+/7AZL914tmAAAA
X-Change-ID: 20260504-v7-1-topic-ldb-fixes-8b3042dc50de
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
 victor.liu@nxp.com
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_132215_422613_0FD1C5C0 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi,

this cleanup prepares the LDB dt-bindings for the upcoming i.MX93 and
i.MX94 LDB support and is a different abborach than [1]. This approach
should be easier to maintain [2] and far more flexible for upcoming
BLK-CTRL or IOMUX_GPR syscon sub-devices.

Please be informed: I didn't do runtime tests but since the LDB driver
never used the reg (nor reg-names) property, it should be safe to remove
them.

Regards,
  Marco

[1] https://lore.kernel.org/all/20260329-fsl_ldb_schema_fix-v1-1-351372754bc0@nxp.com/
[2] https://lore.kernel.org/all/2mkih6id2cfqjfksfvvitzlcnyfz7r4rs4f7bhtvdhf7scwzue@bb4ucnfxa4l4/#t

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (4):
      Revert "dt-bindings: display: bridge: ldb: Add check for reg and reg-names"
      Revert "dt-bindings: display: bridge: ldb: Fill in reg property"
      ARM: dts: imx6sx: remove LDB reg property
      arm64: dts: imx8mp: remove LDB reg and reg-names property

 .../bindings/display/bridge/fsl,ldb.yaml           | 25 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |  3 +--
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  4 +---
 3 files changed, 3 insertions(+), 29 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260504-v7-1-topic-ldb-fixes-8b3042dc50de

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


