Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FECD3CC84
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 23:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L57JrDO10vIAE6mWyGJRu7gxO6kupeACZRnrj994s6E=; b=nceGCktJcdqR10w0Ui29Zr8vof
	YljfIxXNIn5YzdsBk8FmPN/+w5k+FPt8bDdLFA40nd2vNmeAEubvd0OMUyP0R/5oVXHZyGylaQ/VV
	dw1PiMUFY+kTakffJ3YY3xOsaxBy8slkIK/JzwczzUTI2XdrSpLsVGkVq46JBumyAx5h7tn/OTkgE
	P07lYSjjBYp+HosHQ6HFUzSUg3j3messhKWCsUHzx0/7OXiqy0OInsPxuASnIUBBbJU8zghpwnHck
	EdX+K8CfXn6L5AGzaOJJzL9kuwEonLt9jkNHcoWNAndhQ/pDVwyptz5ZTkCKUZ47q/hGs29F9uVOJ
	kQPt8akA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9xb-0000000B1lq-0hGJ;
	Wed, 14 Jan 2026 23:07:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9xW-0000000B1hD-1L93;
	Wed, 14 Jan 2026 23:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=L57JrDO10vIAE6mWyGJRu7gxO6kupeACZRnrj994s6E=; b=DvNbuJ69LHA4YTi4ZcavoQ4gLm
	xd/oEPIf1ML06fX/FiOmv0vkdbTbxF1FtNPH23tYww6p2Gjh4G/oTLOahkUFv5xD+0jiwPiJrX2JQ
	HYJq8BbcbXhCKAnsoROTGG0pKw8peMBjU8EorHy2FQxHDktJOf9mF+Bh54q+k9Vb1VjIxDUTk+s+A
	QrhTjvDSwbSQcDHBtmTKxrr7CjJscSHwGu+T6xwBOr1r08q/MFk7JF9ifOk/Szw9NEvPLtBq6tEad
	9mRZol/KSNxSzZclcn8YGeMN/hI0IOVwbX8t5a8AixYjipgrRBVLwa16SD1fVDSP42rLUQsygoycr
	YT8l/w+w==;
Received: from i53875b96.versanet.de ([83.135.91.150] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vg9xT-002N2m-7J; Thu, 15 Jan 2026 00:07:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] General RK3368 HDMI support and 2 outputs for RK3368-Lion
Date: Thu, 15 Jan 2026 00:07:02 +0100
Message-ID: <20260114230707.4175162-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_150726_388068_A8B5DF2F 
X-CRM114-Status: GOOD (  16.15  )
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

This series adds the necessary bits for HDMI output on RK3368 and enables
this on RK3368-Lion. At the same time, use the recently added DSI support
to enable the generic Video-Demo-adapter as an overlay on Lion as well.


The reason I'm shaving this Yak is that the recently added DSI support
created DTC warnings about a single endpoint with an address.

So it was either removing the @0 from the endpoint, or adding a second
output option :-) .


changes in v3:
- drop patches that already are applied
- added Quentin's Rb tags (except the one on hdmi enablement)
- moved hdmi supplies to lion.dtsi
- move bl-pwm enablement into a separate patch (and to haikou)

changes in v2:
- pick up Conor's Ack for the compatible
- fix the spelling errors reported by Diederik

Heiko Stuebner (5):
  arm64: dts: rockchip: Use phandle for i2c_lvds_blc on rk3368-lion
    haikou
  arm64: dts: rockchip: Add HDMI node to RK3368
  arm64: dts: rockchip: Enable HDMI output on RK3368-Lion-Haikou
  arm64: dts: rockchip: Enable pwm1 on rk3368-lion-haikou
  arm64: dts: rockchip: Add the Video-Demo overlay for Lion Haikou

 arch/arm64/boot/dts/rockchip/Makefile         |   5 +
 .../rk3368-lion-haikou-video-demo.dtso        | 170 ++++++++++++++++++
 .../boot/dts/rockchip/rk3368-lion-haikou.dts  |  38 ++--
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi |   5 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi      |  43 +++++
 5 files changed, 251 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-video-demo.dtso

-- 
2.47.2


