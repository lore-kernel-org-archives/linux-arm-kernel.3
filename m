Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4E9D132AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B/m0DmMmdN7OE/GwES6hP0Nrm+id8/nt/xalEt0CiLM=; b=SxYGwDIkXbnvxV3Ed64IGwg8CX
	WgmdTzzZXQpmykLUI8eZPQwdFd1V7SV+qBoSnHHxEw9lf7qkP0+eNHJuBc+hoETAdwmnpKYdXtVzI
	ZsifmIfmnRZYqOUcAIgfU0TKP5/l3JQL6v5E1BOQE8D13Kg1ZXKs1pUKCYHd0Y+0/+TQHTyt1WhFP
	SHIzUHzCFIZnaWrGOhgMBS/yTrmb9g6pu10d06hK1Xw5JFZbrL3k7JaBqWQOeGz0/lGYZFIQbMHeH
	j5SjtjZxRnhaJgT+v7LqvCFdOXKM+EulV83YdrFdxPekl9BcEmegVKd8w6egAy0j9S/siaE/R8HhD
	Ck8cdsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7v8i-0000000DUIt-0iYh;
	Mon, 04 Nov 2024 11:20:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7v04-0000000DRwW-05kX;
	Mon, 04 Nov 2024 11:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B/m0DmMmdN7OE/GwES6hP0Nrm+id8/nt/xalEt0CiLM=; b=kqt+5cnKknfCwkNP2anZVlLhZ1
	3yicda/sP6J99Pj117/14X9ivNNDnzPGwKavXDcPMR/WjBkMosqd8uaMxv8nlSjxGVvr3PvmywqQf
	zfFDMaU24BTPMR32V4XXMFnUL8C7Ab9Zt5aRopW5Tgl5zwfO/NbNGtvLj3Jzo514dDc7C6ncvR22w
	ePJlxGZ1K+IPF/uRJrdjVuJxuCUuFMX0TJOcSGw01GZs8pHN1GAzs3Z1M2huZ/CR0W7mi1O+ZIBfl
	UgsfSU0B9PlUK2vwiZ79z8QPNxwPDAmKtVEtyq6iUuCz+YoUuAWTUB4tzWp5ShTyAsIyXRf2d0FdV
	hTHp19sw==;
Received: from i5e860cc9.versanet.de ([94.134.12.201] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t7uzy-0008Vi-8W; Mon, 04 Nov 2024 12:11:54 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de
Subject: [PATCH v2 0/2] MIPI DSI phy for rk3588
Date: Mon,  4 Nov 2024 12:11:14 +0100
Message-ID: <20241104111121.99274-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_031200_234774_95FE1197 
X-CRM114-Status: GOOD (  15.36  )
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

changes in v2:
- fix error in dt-binding example
- drop unused frequency table
- pull in some more recent improvements from the vendor-kernel
  which includes a lot less magic values
- already include the support for rk3576
- use dev_err_probe


Heiko Stuebner (2):
  dt-bindings: phy: Add Rockchip MIPI CSI/DSI PHY schema
  phy: rockchip: Add Samsung CSI/DSI Combo DCPHY driver

 .../phy/rockchip,rk3588-mipi-dcphy.yaml       |   82 +
 drivers/phy/rockchip/Kconfig                  |   12 +
 drivers/phy/rockchip/Makefile                 |    1 +
 .../phy/rockchip/phy-rockchip-samsung-dcphy.c | 1654 +++++++++++++++++
 4 files changed, 1749 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

-- 
2.45.2


