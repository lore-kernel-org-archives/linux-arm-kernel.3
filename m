Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4E0D3ABF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 05:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iD8eYq5ib5hN+a0GTaQhiJrNeylujhiGQE5LdxAwJmw=; b=kEx0OnP2PaJ4qNuuezv2/SdhvS
	fGjNrVYzpNwcm4fzrhMXMobbLj/tpHk3/BBCY57lRRlL93XEOod6VH2NmoPUJEvsiWBwHSZMubOS0
	On3KYC4mHyBJrQZHduJ7Eh60jbx2u391p+jiuLymQQRa81RQOc3QmgLu2dQQBzj6qF6LHOoGXQqlh
	I7IKXVgnOLPH5Rr2pn/RmujjkU6Z97Gn1jdvOlEX5e9SGAaRWwaEEhzdfYOUv2O8yaJm+HNbQWvjg
	NZsyFoKJltK8UtgvNVHLzN0UTbCBA5TrbgTXGMsRkBKZLcfwlfFSAv9NrFr0OQXTInFPkbyrAuAMM
	74p+F1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXW-0000000AdEk-3IlG;
	Sat, 06 Dec 2025 05:09:02 +0000
Received: from mail-m49226.qiye.163.com ([45.254.49.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXR-0000000AdBa-31YN;
	Sat, 06 Dec 2025 05:09:00 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c3493a5c;
	Sat, 6 Dec 2025 13:08:46 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v2 0/8] pinctrl: rockchip: Add RK3506 and RV1126B pinctrl and RMIO support
Date: Sat,  6 Dec 2025 13:08:36 +0800
Message-Id: <20251206050844.402958-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af21001f509d8kunmae94618c4ed3a4a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk9OTVZOSUJDS09DTRpOGUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JEhU243hs2yTG3n07dQ+K0RqbAKotLONHLm9cSoLpH6dyWIvZj2U2443n1vSlVf5wbTLG+pH6MVU3UNS6uyEJkvwOd2wrxBfpET851E/MD/XDViqGq5KFSK/Odknwms1t0HQ7hVgQt1AYtFztnEOfe89NRCuLkRwaACtv/Jm8xU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=iD8eYq5ib5hN+a0GTaQhiJrNeylujhiGQE5LdxAwJmw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210858_158424_C87A67A2 
X-CRM114-Status: UNSURE (   9.30  )
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

This series adds pinctrl support for the Rockchip RK3506 and RV1126B SoC,
and adds support for RMIO (Rockchip Matrix I/O).

The series includes:
- RK3506 pinctrl driver implementation
- RV1126B pinctrl driver implementation
- RMIO controller binding and driver support
- GPIO driver update to support new version GPIO

Changes in v2:
- Added RV1126B pinctrl support (patches 3 and 4)
- Updated GPIO driver to support new version GPIO (patch 5)
- Added header file for RK3506 RMIO (patch 6)
- RMIO is now implemented as a separate pinctrl device (patches 7, 8)

Ye Zhang (8):
  dt-bindings: pinctrl: Add rk3506 pinctrl support
  pinctrl: rockchip: Add rk3506 pinctrl support
  dt-bindings: pinctrl: Add rv1126b pinctrl support
  pinctrl: rockchip: Add rv1126b pinctrl support
  gpio: rockchip: support new version GPIO
  dt-bindings: pinctrl: Add header for Rockchip RK3506 RMIO
  dt-bindings: pinctrl: rockchip: Add RMIO controller binding
  pinctrl: rockchip: add rmio support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   11 +
 .../bindings/pinctrl/rockchip,rmio.yaml       |  130 ++
 drivers/gpio/gpio-rockchip.c                  |    2 +
 drivers/pinctrl/pinctrl-rockchip.c            | 1188 +++++++++++++++--
 drivers/pinctrl/pinctrl-rockchip.h            |   47 +
 .../pinctrl/rockchip,rk3506-rmio.h            |  143 ++
 6 files changed, 1427 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
 create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

-- 
2.34.1


