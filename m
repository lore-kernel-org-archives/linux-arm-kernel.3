Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AECC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 07:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFYw8hOPrTm/3W88pyOGE2rioox7AfQj3HADZxYaLVk=; b=CSyjj++qpKMcNQJp59JSkEJXFy
	syypwGnQozJyTdUFjUEUbKDut1uLBTjL33DZ7mkycZEztsdSxyKZZ3HEtS7PCaD/0Z1Hb1EKjtSdd
	8siYDpUlk628vbh3p1OCVXvDkjirVBsk2jRtMeC0futfAYdIBQbVudKwsq7/HfNCIUipfOsZ6cUqW
	ssUJHb6ITRjU8/jBq9/fYG0ib19prBRDk5lrs8N740qiDu7E29U4BpYknXzoxdmcGoPvMat8scjSd
	YkpEDjOhdy5XgXLRgRqNCvK8kYDgkiU8y5USdfqBBamb7V6xIw8hkNRudQn19BKVcjSxwaw1ahAJk
	RCHz0k9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAlq-000000006Ef-3rKT;
	Sun, 09 Mar 2025 07:08:22 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAkD-0000000062r-0h9s;
	Sun, 09 Mar 2025 07:06:42 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5445C25CBA;
	Sun,  9 Mar 2025 08:06:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yQwh282UgXG; Sun,  9 Mar 2025 08:06:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741503994; bh=vylK+Hj423bu2ryxm5MijJrbFuAUeovoLjxbShm2MIo=;
	h=From:To:Cc:Subject:Date;
	b=UTR3mDpz7rkMjVhd2kO+QIsgXg/IhxLxzxMMICR/Nm0AwtTcdLnaSNnqheaqefBB7
	 5vI/6wUGfAs1xXVL9yyGMlb10Qrgwr3XQW2QXe2JNi10axKkXXNEQRHdy6OzaDWq+9
	 EGUZA25+BCspwdV42M5CmfIadGRLcjZh82zMNicK/yP0AoxMjMZ366QmvzLM/ecXZ3
	 1W5VzLyQbB+J/jvguBhQP3p8Edgp2o5UOa4DuRGUowgShSmDhQoPPG44prJP/Zowjf
	 080aCm17AMtxzqB2Fv8usFBpBi9IJiOAUGJwuuKt1hCkmNQsDjbiTkcMkdEyBvQtlH
	 qRHLy/n8Wlihg==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Support I2C controllers in RK3528
Date: Sun,  9 Mar 2025 07:06:00 +0000
Message-ID: <20250309070603.35254-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_230641_338395_B105889B 
X-CRM114-Status: UNSURE (   8.89  )
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

RK3528 integrates eight I2C controllers which are compatible with the
RK3399 variant of i2c-rk3x. This series documents the controllers in
dt-bindings, describe them in SoC devicetree and enable the onboard
EEPROM of Radxa E20C which is connected to the second I2C controller.

This series is based on linux-rockchip/for-next and may depend on the
v3 of SD/SDIO series for a clean apply[1].

[1]: https://lore.kernel.org/all/20250309055348.9299-1-ziyao@disroot.org/

Yao Zi (3):
  dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
  arm64: dts: rockchip: Add I2C controllers for RK3528
  arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C

 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |   1 +
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  13 +++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 104 ++++++++++++++++++
 3 files changed, 118 insertions(+)

-- 
2.48.1


