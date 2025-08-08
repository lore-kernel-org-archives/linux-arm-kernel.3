Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF7EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 19:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sk4TAr1bZq7PgDg2M8s7TSpfTxFYnEADuDok+A31+Vw=; b=i3vJWsYVqvZJ0wxojk9nwL7vKN
	ssKTuHGHCPR7qmsgM5VFG3H5tP/XXwAOemqg4JOqSTp+7COoXpt8awLEhNUb1z9AwS5Rt2IVtYmxc
	mLxEAnfnedSaQpgmn7gtS9InztQRV9PK6owaJ4LrlYvwk9La5MmRykvBv9yu0lUDKf7zSGLBqfQes
	LK42tLsZeyYbBL3LyeYkEcLk7qU+S4H7GN811ZKOYg3/QtKY6dDvHIBTriqzuh2f9snWFlRIytgKw
	BHX0joNrM1Nnjamcd60kKkCVyobckHzBqGk8UHaw8Z0gOCrMcenajb7gYz+B6uQzemKAMCf9cil8q
	VQw+gy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSvO-00000003YDR-1BU9;
	Fri, 08 Aug 2025 19:38:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSss-00000003Y0x-0NZs;
	Fri, 08 Aug 2025 19:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754681768;
	bh=1S4gIsUy/lP67CX0Xrs0Zs4bAm7U3GED0ShLh7xGT4Q=;
	h=From:To:Cc:Subject:Date:From;
	b=luyk3vpZZleLUQYOIfaTqEaQsi2CMvz/TrDYdnaOkJKrBYG/VaDu0UPjjloLOw34/
	 QW1T8u4Vxk0x42MfzoLRwvGbOI5WR7gPIyHmardIs7uwtJnNFjgNoD7bV9C6BMh/1o
	 n5GKzAhtdNAKeDZxiykac45FHF3oYLQ4nizUKS7OqcHems8+OXQpI2pux0lNNU+qoG
	 VIbO2riIdyMnfy/PbfBn/QPzD2P62OWJZ4Rfjgz7lTWWXJ0QqN/CTLrlksmr9owHXT
	 LelojNN1riLUDLzCoFkhIBDr0x7DPmjtNLmewnnCTZkocarhleco8RwjNL3Fd+pegU
	 0J3eFmdsx82QQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3535117E0299;
	Fri,  8 Aug 2025 21:36:05 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Niklas Cassel <cassel@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Alexey Charkov <alchark@gmail.com>,
	Patrick Wildt <patrick@blueri.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Diederik de Haas <didi.debian@cknow.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add vdpu 381 and 383 nodes
Date: Fri,  8 Aug 2025 15:36:00 -0400
Message-ID: <20250808193602.142527-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_123610_286595_06ED3686 
X-CRM114-Status: UNSURE (   7.89  )
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

Add the nodes for vdpu 381 and 383, respectively RK3588 and RK3576.
To keep compatibility with older variants, the reg ranges order is not
in register order so that the function reg range is kept first.

Also adds the corresponding iommu nodes.

Regards,
Detlev.

Changes since v1:
 - Set node name to match first reg range

Detlev Casanova (2):
  arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588
  arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576

 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 36 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++++
 2 files changed, 110 insertions(+)

-- 
2.50.1


