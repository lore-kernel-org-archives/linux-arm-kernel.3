Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA717E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gd7Ac/D1accfyx3iwX5MBjpcDTGTM3je2nHHQvLSHmg=; b=zZq54L3dDyVdoz
	LsgP/pYegil4luZAvLdGYVC0jiOscTMhgq0L4X8mC+NurcW0knyHxU6HPenvwDNSrA+V0FsRm/qgA
	mrxH8g4GKpGjZ9t3KW+zS57pZmi3Lo65xEKETRVnyTx3xDIvRs7WByu4+xTT9kzQ78RdMIicX+HF7
	7f3DQdXls+jzZo2miOoy1wFjCl1N7mGRLIKCth8BT5Xb+exfUWJxkqsXVwmK89vnbf+0wNNmPh5Su
	zalzSOB+DZsY5vysGHJn43Zq0laU0smA6mf4r11CsCcQACAEvdZEd04ARo/J17XCpLOCSe2SeDXqS
	FSN3sVgv3FzD5aS8Rm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9P9-0000000D7iP-3EDF;
	Tue, 10 Dec 2024 23:12:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9K0-0000000D6Nr-27nb;
	Tue, 10 Dec 2024 23:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733872031;
	bh=tG+zEB9hq2JUdiypa3J0UW/bkrCDojHcflJ5SShtQyU=;
	h=From:Subject:Date:To:Cc:From;
	b=N0sZit+XfJbADE8Df1vccR7w7qaJ0F2CVsi5uewEobNB/2/N5dLLjdxhmASn5OgTg
	 BJpvHwJRGPCvc1RcML7+PabPEXUgZ0AkTJhc3qTp62ispPwA5BN9OOwxtVAMVgKPYm
	 5LgB9LlsgSY0RzqBmYLktzuzPaoM8BwrWcOZQz1iePLHs+KFQDbunm33vbs6mr2U4G
	 lYpyoTFLsPGI+WIm7aJGYoHDi0ItzxkSQ6G2T48u1cHXe9LlgK4bh5E8V8JS8qrqZb
	 9ansLj0NeBkKnZwL7FaX1GHS+jJpOpQjMjJ4a5MAQGko92RlnlLokWvcp185F1pxQz
	 qqp/C7bX8VW3w==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 747F317E09AF;
	Wed, 11 Dec 2024 00:07:11 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/4] Add support for HDMI1 output on RK3588 SoC
Date: Wed, 11 Dec 2024 01:06:13 +0200
Message-Id: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXJWGcC/3XMSw7CIBSF4a00dywGKJW2I/dhOuBVubEtBgzRN
 Oxd7Nzhf5Lz7ZBcRJdgbHaILmPCsNXgpwaMV9vdEbS1gVMuGKeSxEfb9T3xdkVGJBVGa2ms7Ga
 ol2d0M74P7jbV9pheIX4OPbPf+gfKjFBiVKuGQYuLEvRqwrIoHaI6m7DCVEr5ArNct7SsAAAA
X-Change-ID: 20241207-rk3588-hdmi1-704cbb7cd75f
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_150716_722901_8842B443 
X-CRM114-Status: GOOD (  11.07  )
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

The patches provide the basic support to handle the second HDMI output
port found on Rockchip RK3588 SoC.

For now I enabled it on Radxa ROCK 5B only, the board I've been using to
validate this.

** IMPORTANT **

The series has a runtime dependency on "phy: phy-rockchip-samsung-hdptx:
Don't use dt aliases to determine phy-id", a patch submitted recently by
Heiko [1].  Without applying it, the functionality on both HDMI TX ports
will break.

Furthermore, please note this is subject to the same limitations as
HDMI0 when it comes to the supported display modes.  The fixes provided
via [2] are not applicable to HDMI1, hence I will handle it separately
as soon as all dependencies are merged.

Thanks,
Cristian

[1] https://lore.kernel.org/lkml/20241206103401.1780416-3-heiko@sntech.de/
[2] https://lore.kernel.org/all/20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Override hdmi1 pinctrl-0 on rock-5b as it requires hdmim0_tx1_cec
  instead of hdmim2_tx1_cec (fixes a pin conflict when enabling
  CONFIG_SPI_ROCKCHIP_SFC)
- Link to v1: https://lore.kernel.org/r/20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com

---
Cristian Ciocaltea (4):
      drm/rockchip: dw_hdmi_qp: Add support for RK3588 HDMI1 output
      arm64: dts: rockchip: Add PHY node for HDMI1 TX port on RK3588
      arm64: dts: rockchip: Add HDMI1 node on RK3588
      arm64: dts: rockchip: Enable HDMI1 on rock-5b

 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi  |  62 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts |  44 ++++++++-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c  | 119 +++++++++++++++++++-----
 3 files changed, 200 insertions(+), 25 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241207-rk3588-hdmi1-704cbb7cd75f


