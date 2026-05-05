Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B20CCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=93gcAeK+pFauxx7NJKjEKC10Wy8T4t0qkj8Q59r5KXI=; b=njkIjVjrUkQauUQxfmQTMn2R26
	PmX+5RoJis7LjVM7jPYBsPN2gkazYFEwyBS303m1S2foewKRZVXJ3DF2dYp1R13JxXzwnPKoa4M7A
	ISjHocti8JFhOiFNEij7lY6qS+v2FfaO0319do/kQ/pSoz/JMQ1XyDHC3O7n2zVOUnoTnKN6BbJFJ
	MNlrwDba4YRB6Opq1jnb+QoF6F0HSueuQ3yN8S6wUx8hXxvGbSkTQmjwrKXZ5ul11owKOe87UiYZ+
	mCnWw6S9STaw7T5+2kK5A2Yo4eWW8NaqGqGntHconUVxPKJz71Woe9oiAAdPRKtim00kITNUBqCAI
	dot08RCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC4-0000000Gz3A-1j0V;
	Tue, 05 May 2026 17:04:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC0-0000000Gz0A-1rhK;
	Tue, 05 May 2026 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=93gcAeK+pFauxx7NJKjEKC10Wy8T4t0qkj8Q59r5KXI=; b=NAcz8RqXkqY5dOxTG9K1dh/z/f
	52boxihZa0OxOBTr7wVTslPE+R0F5KYS2UGdNYUXW4wh+hCPsuND80dRa8FpMux5t1bPzmG39tK4J
	zzbx8H5vAUmf/lFQmajJjfw8N3CrJn4L8U59oSTyvdTd0gOlxdt+CXNMTJSVHUdDlBdephBLnQeog
	ppEQMXggCNno0ikQ4s9JIdbbiiQc6c+t8VCOqZ+xv+yACb3fisEG2popgjk5e/w+5v41AH1y1gMaC
	joKorJNIOBF+y8+TFSlz7UdYnEZ/tcReyEXKSupcJxJdMZfa4PS2MMcKjTzjetZJUeHzMPv1NC6Wh
	M8ZRbXjA==;
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 0/5] rockchip: Add USB 2.0 support for RK3528
Date: Tue,  5 May 2026 19:04:05 +0200
Message-ID: <20260505170410.3265305-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_100420_482220_8877489C 
X-CRM114-Status: UNSURE (   9.35  )
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

This series adds support for USB 2.0 on Rockchip RK3528 to the
Innosilicon usbphy driver.

The usb3 support has already been merge for the naneng combophy
last year.

Changes in v2:
- rebase on top of v7.1-rc1
- split off dwc3 compatible and dts changes
- add error handling to regmap_write (Vinod)
- v1 is here
  https://lore.kernel.org/linux-rockchip/20250723122323.2344916-1-jonas@kwiboo.se/

Jianwei Zheng (1):
  phy: rockchip: inno-usb2: Add support for RK3528

Jonas Karlman (4):
  dt-bindings: phy: rockchip,inno-usb2phy: Require GRF for RK3568/RV1108
  phy: rockchip: inno-usb2: Simplify rockchip,usbgrf handling
  dt-bindings: phy: rockchip,inno-usb2phy: Add compatible for RK3528
  phy: rockchip: inno-usb2: Add clkout_ctl_phy support

 .../bindings/phy/rockchip,inno-usb2phy.yaml   |  44 +++-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 191 +++++++++++++-----
 2 files changed, 176 insertions(+), 59 deletions(-)

-- 
2.47.3


