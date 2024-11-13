Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62869D637CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 22:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4og6PGVYmoVjgqQoxtFl7GKtzsIYYbh32WB3ISptOXc=; b=tdNGfIjK5vNh/hGV1xrjZI5hJX
	sAgj564bHHR6G/eIpWfZeUmyl/ntuc6uDyST6j6RG/O7+k0tKsr1CYB/aIXEYwrYcnLLtbbKfs9vH
	j3VI4raYbhWUhe1aZE0urUaoX15WzBTfeK8d/luiKR3ZZ8UWeEJSmfDjvaQDLgaumAHzitvlzy/tu
	Nw6zmL30fADaIRWVdoXILBx6R8hwHoI1cf8vQUz8MiSzpyUxZg3sfcmVg76n87z6ooEsCnzXJvO57
	Yvf8hKfl30Nrgbdj6+kFp5/i02MyV7klDvwGN7pRl0DIkf3M+lskm3+lUsjo3KE/pU7UlKe6c3YAb
	LMRD3GFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBLb7-000000088wO-01ov;
	Wed, 13 Nov 2024 22:12:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBLZD-000000088eU-2M33;
	Wed, 13 Nov 2024 22:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4og6PGVYmoVjgqQoxtFl7GKtzsIYYbh32WB3ISptOXc=; b=kNPIKluTKwIuek4744s04eyNjH
	RFpR1ugPSkM5kzPaALfraFNEHJIPUaf65HoNfDPUxpuHTTQmHXZ83wzJ6ZxC33U9580Idzt/oUh/j
	KaSmWN6KSo11+WF7MPY2tbajoGo39aQhADr1QXD8NTsQoDjwBrXUoJCXVQBJpItG070hb/Da+zrMN
	ghsq8PBg18Pq07QpYj4gWXDu5GocTcXAjb87OdeTP8TyEaXMwyOj7OIZCnFNKT4CujZI0az2xbnvY
	YJA7cxW4Tb90Fb+X78SRntf99+vSjtOMmQ5C6HALu208/IDarq2TH/3PxDm0c3+AcKj6Lb/bDKP5x
	SLLrrTzg==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tBLZ8-00069a-LC; Wed, 13 Nov 2024 23:10:22 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sebastian.reichel@collabora.com
Subject: [PATCH v3 0/2] MIPI DSI phy for rk3588
Date: Wed, 13 Nov 2024 23:10:16 +0100
Message-ID: <20241113221018.62150-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_141027_656603_F9855BC9 
X-CRM114-Status: GOOD (  15.75  )
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
  dt-bindings: phy: Add Rockchip MIPI CSI/DSI PHY schema
  phy: rockchip: Add Samsung CSI/DSI Combo DCPHY driver

 .../phy/rockchip,rk3588-mipi-dcphy.yaml       |   82 +
 drivers/phy/rockchip/Kconfig                  |   12 +
 drivers/phy/rockchip/Makefile                 |    1 +
 .../phy/rockchip/phy-rockchip-samsung-dcphy.c | 1647 +++++++++++++++++
 4 files changed, 1742 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

-- 
2.45.2


