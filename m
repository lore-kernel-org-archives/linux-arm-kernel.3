Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEB5C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5U954//9+Jbg6d97QnaDmxK0WjfwMDw4YFOmYO5qioM=; b=bM0sr9s8jtzEE6
	fjgy+NuUfN28Fd+iPorVrAVliYHip6NkiuX05UmYOVgoATJiUytJPA/MD2IXnT+n79x8s2j315/SV
	vr2dc4oHLB4T1mtQI49TiOXe7IIhLHpm8y3Jm/gFs7VrwHnFJslatMp5ydc80lAO6FZc0Bi6ptNHt
	T0T8l+A/inbrn6FAS4UqG848e4xwyzDi5ys/VDe5NkBR+w64aPGVVz10b3YtuLWeyZ6APeW9uGYM3
	c2fcMa/DnSZo3UyprjJwHMJZTvYqDLWZM7GuAwjx7dubGDD1TYEZdRiRVH7NzKLnUGbvtfGoOQiwX
	1U68HARD2XcIQnZXx3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOgK-0000000G1uv-0KyF;
	Mon, 24 Aug 2026 07:01:20 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOgH-0000000G1s7-2AMv;
	Mon, 24 Aug 2026 07:01:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5B61D2010D6;
	Mon, 24 Aug 2026 09:01:15 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOgF-0033lH-0k;
	Mon, 24 Aug 2026 09:01:15 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOgF-0000000DDM7-0alc;
	Mon, 24 Aug 2026 09:01:15 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/4] media: rockchip: Add JPEG decoder driver
Date: Mon, 24 Aug 2026 09:01:08 +0200
Message-Id: <20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTsi2oC/x3MQQqAIBBA0avIrBNMSKSrRIsYR50CE4UIxLsnL
 d/i/waVClOFVTQo9HDlOw3MkwCMRwok2Q2DVtooq2dZbrwwcpZnpuAIpXLGWoXeLAZhZLmQ5/d
 fbnvvH8NgDlNiAAAA
X-Change-ID: 20260821-rockchip-jpegdec-0d6880cf656c
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787554875; l=1849;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=ZrzT1INpYp2PH7YPp3yG6IEA/R6dIdxom/U7Lx6vDYU=;
 b=E1A/kSx7sqk1KlpzpTjPfPraET1fHCTezJot/oqZ/YxSn9tJQZ2ykdvQQIrYdwYH2GcDTMy0G
 H8WRwyNA9PXDBeEQN/Sx82urPrw1PskfUBSPLddTM6xV8UrH9vUaXUB
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_000117_792764_B5AD1858 
X-CRM114-Status: GOOD (  11.71  )
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

This series adds support for the Rockchip JPEG decoder hardware. The driver
was previously sent as part of the Hantro driver in [1]. The hardware
turned out to be not Hantro compatible at all, so this new series contains
the driver as a standalone driver in drivers/media/platform/rockchip/

Comments to the last series have been addressed where still applicable.

Also the hardware seems to be identical over various other Rockchip SoCs, to
accomodate for that I replaced several occurences of rk3588 with rockchip
and added rk356x support which was already reported working with this driver.

[1] https://lore.kernel.org/all/20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de/

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Sascha Hauer (4):
      media: dt-bindings: Add Rockchip JPEG decoder
      media: rockchip: Add JPEG decoder driver
      arm64: dts: rockchip: rk3588: Add JPEG decoder node
      arm64: dts: rockchip: rk356x: Add JPEG decoder node

 .../bindings/media/rockchip,jpeg-decoder.yaml      |   92 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   22 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   24 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkjpegd/Kconfig    |   14 +
 drivers/media/platform/rockchip/rkjpegd/Makefile   |    3 +
 .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  230 ++
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2279 ++++++++++++++++++++
 10 files changed, 2675 insertions(+)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


