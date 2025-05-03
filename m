Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC01C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 20:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gH2+1VtxfEdmAeyQLvI3/wPTQrCH5G9W+C09NAWMwXs=; b=Z/hQf0AGOf0DsIn+hVPLhc1Z3o
	pjxc0aqS0VBGdijD5pQHO3T8E9u4ZuUNj7sV+PnyyLwpWgXu9uACftT6WyYvupdrsPhVdFITX/XZk
	cG2zmwI+rlzVuDhrLpZDrIYH91FTFJ+8RRhk6b+/6DpT24VaPmCk4WZ5SfyK3/wV0QciEBctIlQSw
	AT4MmAj3LY0KwY+KELApmXJkUJTxznHzb8qxxiVbq/UiHqcEY5FVRdmv0xzWpn4hqpel7/x30WNyu
	0DlK7oSbBOW7qCDW78W8UsWsmAYLrSpMdN+9X2AEuz4zWYqX2WCBtThhVoyL/lCBptkcAixpmPHbK
	sFV6K82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJJw-00000004SVd-2uBo;
	Sat, 03 May 2025 20:18:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJGi-00000004SAG-1P4I;
	Sat, 03 May 2025 20:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=gH2+1VtxfEdmAeyQLvI3/wPTQrCH5G9W+C09NAWMwXs=; b=MtlBx+YkkbvsT9O8zXz8IANIRY
	F6Br6B61gGkNBzEHdeqhYmVYnc2Q8e6ZuHhq/4vbyETfkuYU7wm0QFex7wMJPrl4/yEQtaW1VXasN
	qSAkpQvjdXh4Q+N3428yzMIQhGqSaJRZvZaECxyLJ14t2EkLBlbDynmsBnukq0n3sFBx9EPeP28aX
	A3XYnwNxqg7re6L4dvqlMRrQTblqNA7PvtMMe5A6ybDclzkJBcGZjGoTqQpSTaq4tssNV8oDZOchO
	GaZNIT8C6Q65Ugynm/gQKUKEDYBK//okjNCIHXJ9+K4hFl1g2YygLQMEbZ0MpNx/KlmQ91PXlNDGi
	NO4/mdgA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJGg-0001hY-Va; Sat, 03 May 2025 22:15:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb-phy support for the old rk3036 soc
Date: Sat,  3 May 2025 22:15:09 +0200
Message-ID: <20250503201512.991277-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_131528_375301_4DF4672B 
X-CRM114-Status: UNSURE (   8.37  )
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

While trying to resurrect the rk3036 board in my boardfarm, I also
implemented the up to now missing usb2phy support.

The implementation is quite similar to the rk3128, except the not-
supported charger-detection, so its addition was quite simple.


Heiko Stuebner (3):
  dt-bindings: phy: rockchip,inno-usb2phy: add rk3036 compatible
  phy: rockchip: inno-usb2: add phy definition for rk3036
  ARM: dts: rockchip: add rk3036 usb2phy nodes and enable them on kylin

 .../bindings/phy/rockchip,inno-usb2phy.yaml   |  2 ++
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts   | 12 +++++++
 arch/arm/boot/dts/rockchip/rk3036.dtsi        | 35 +++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 32 +++++++++++++++++
 4 files changed, 81 insertions(+)

-- 
2.47.2


