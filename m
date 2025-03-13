Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54FFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4CWs8MteW/WaidbFLCARB0U29Fg/zJsP3Gsrar0C4Ew=; b=S+mchFrP/layRdfeig53hwQuqE
	C9xl3VR/5OY9Ke3rUBGHvcq0vjjPge9sM2N0qPjSxxZHuubr2SIN7F8K6qkljIK1v4CWax0R3/biv
	KVOykRYcQ9OTMABLMTrwNMaLdI4+Dy0HLR1GA6NKrE7vfwyhGs8WmTKmbfkB0/E7h8z6aMWiRflwb
	VJ6KRxnhOJndo+iv8kY5POqSlxTqKx41P99iPune90h3OAexp7e6MGSsDddlMPZ/RiXS/gNf0Ru4n
	bwcYDPkWmQ2jY41DZ9kVGMe0a+wCLG0qK8tgcOZXH5lhSeEAeDQ5hzPQSYH6LCuFB+wGJTC4QGTo0
	8DbmQbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsir4-0000000BPt3-3PMJ;
	Thu, 13 Mar 2025 13:44:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsinp-0000000BPHP-03AN;
	Thu, 13 Mar 2025 13:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4CWs8MteW/WaidbFLCARB0U29Fg/zJsP3Gsrar0C4Ew=; b=TQKU+5u7/k6ia1MBUu6HdfZYRU
	kxkXEdZb6U33Qrg9WRe4L2pBqIdUfUwXL5D/g6zPBAnG8S3NYZTx/QI9xN16smgqfVb8dCealSktR
	8fH6ZHrTLAbNMS/ZvRtQhNLB8yIL+9V17jC7dquHHbuPuKcF6S4RMuW2ZOMm9eXWbX5adeSiCR4+w
	NqQiJi5648GNmXd14sl1LEAImTJWxM4X8K3C8Euv6YfK0hlfDl021lBMV3YTha7BoSTYotN8Q801Q
	1gfAjXT83nA1zsJtZnsI9787I5JBtyV30D9peSIEDvN/db7guSmjlqAbA1PAjbs9hIhU4yhX+14Wk
	1bqxGzew==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsinl-00000002dyU-3cWJ;
	Thu, 13 Mar 2025 13:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=4CWs8MteW/WaidbFLCARB0U29Fg/zJsP3Gsrar0C4Ew=; b=gyJyVrD1SJUsXkw6uxZS3GyW3g
	yN5gt3IJJom2RAdV08DWMh0KkFwfK18ljaOcqm4qZWt1izix6OXX2Auikxa04YcUR6+zDUNjglmYE
	VyOyTWb74IUejLowq3DWuBg8J4yF3Iu7EnWN+HGsPGnGEs6RkPFdzXj1ywrAuRwF+vuqlXPKwPckJ
	VBGZmJMpsIutJjLqs9/Hajm7p8B4mCeJsI/tZ562ePWcQKI9BuQg7GOnAPmGTC2vcj18QIkJMHBtl
	ubbZMr45dsNr4lewH6/APGmfJ8/G8A3TmiASAJWn+Pzdy/iNaFtiD6URQDxbv8hL3CjX1Xkhsszis
	iVHssZHQ==;
Received: from [62.91.42.92] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsine-0008Rg-Vf; Thu, 13 Mar 2025 14:40:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dse@thaumatec.com,
	heiko@sntech.de
Subject: [PATCH v8 0/2] MIPI DSI phy for rk3588
Date: Thu, 13 Mar 2025 14:40:30 +0100
Message-ID: <20250313134035.278133-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_134045_966757_0CF8E487 
X-CRM114-Status: GOOD (  17.78  )
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

This adds the phy driver need for DSI output on rk3588.

The phy itself is used for both DSI output and CSI input, though the
CSI part for the whole chain needs a lot more work, so is left out for
now and only the DSI part implemented.

This allows the rk3588 with its current VOP support to drive a DSI display
using the DSI2 controller driver I'll submit in a next step.

Only generic phy interfaces are used, so the DSI part is pretty straight
forward.

changes in v8:
- add comment that the timing values comes from the vendor kernel (Vinod)

changes in v7:
- missing pclk-disable in resume error path
- replace remaining magic values with actual constants
- lower-case hex values
- made lane_disable behave similar to lane_enable wrt. lane count

changes in v6:
- rebase onto 6.14-rc1
- add Krzysztof binding review
- v5 was sent at the beginning of december '24, so probably has been lost

changes in v5:
- add bitfield.h for the FIELD_PROP definition
  (reported by kernel-test-robot)
- add Sebastian's Reviewed-by
- add Conor's Ack to the dt-binding

changes in v4:
- moved to #phy-cells = 1 as suggested by Sebastian, with the argument
  denoting the requested phy-type (C-PHY, D-PHY). This works similarly
  how the Mediatek C/D-PHY already implements this, see mails around:
  https://lore.kernel.org/all/20230608200552.GA3303349-robh@kernel.org/
- dropped Krzysztof's review tag from the binding because of this
- dropped custom UPDATE macro and use FIELD_PREP instead
- build a FIELD_PREP_HIWORD macro for the GRF settings
- add received Tested-by tags

changes in v3:
- add Krzysztof review tag to the binding
- address Sebastian's review comments
  - better error handling
  - dropping empty function
  - headers
  - not using of_match_ptr - this should also make the
    test-robot happier

changes in v2:
- fix error in dt-binding example
- drop unused frequency table
- pull in some more recent improvements from the vendor-kernel
  which includes a lot less magic values
- already include the support for rk3576
- use dev_err_probe

Heiko Stuebner (2):
  dt-bindings: phy: Add Rockchip MIPI C-/D-PHY schema
  phy: rockchip: Add Samsung MIPI D-/C-PHY driver

 .../phy/rockchip,rk3588-mipi-dcphy.yaml       |   87 +
 drivers/phy/rockchip/Kconfig                  |   12 +
 drivers/phy/rockchip/Makefile                 |    1 +
 .../phy/rockchip/phy-rockchip-samsung-dcphy.c | 1719 +++++++++++++++++
 4 files changed, 1819 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

-- 
2.47.2


