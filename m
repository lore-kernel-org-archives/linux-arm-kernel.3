Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A16CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 02:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M07VG5bhzSM5mDDbojZSmyDEd1eb4Stzc/AcK1LOVZk=; b=0xerGoiF0Gu45U+UHxAGwbmBkF
	M09p6UhCLIw7LWyK/ThnJ431axSWFMKw6ni9GWtfXHTmyYUlFnrwrxFPzUzLR/gjf/2/DUtHj+LXW
	6YPvOofs1HlGEnV6LxDJ5t8X4g+M75JHrHyC9XzAvteQeDz8UZAdxgI9ys8Kz3a3pX9BMxt4jC5wO
	61H8EbKvoqFPHYyAvRtHyUqdxBZAgb2zA6yhYmSw1gPO4W7I9tTKLYzg0T3BFhfAaR0YzlvAMILyr
	vy+B4fDqd7dsttA7FBt+RKO9Ht97ogeO4c081gfebqji7QAPEKiaazsDFohFuGLueIK1X2gHYyvs0
	+XnTUNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6XH-0000000Ay59-1dIX;
	Tue, 04 Nov 2025 02:12:39 +0000
Received: from mail-m15579.qiye.163.com ([101.71.155.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6XE-0000000Ay3I-0ILY;
	Tue, 04 Nov 2025 02:12:37 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2842e9821;
	Tue, 4 Nov 2025 10:12:28 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v1 0/3] pinctrl: rockchip: Add RK3506 pinctrl support
Date: Tue,  4 Nov 2025 10:12:20 +0800
Message-Id: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a4ca31a7b09d8kunm1bdc99775fc3999
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkNDGlZIS0lDGhlDShpLHxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=g3RWBimOxSGtJkJcow8ACom5ucgsBsJupF+4oTD2tp+pP7DSfSiQyWb+0LpteF5B7grR0jNDFybIau0CyVlTOjZqDVOBwcaZgr+MQf6l1mDRVzjsHmyt9tFEXfWlCfGE8EXMrw4QApXxixNiUykpQ+NNeuZQQMtTS+OYGno/HFc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=M07VG5bhzSM5mDDbojZSmyDEd1eb4Stzc/AcK1LOVZk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_181236_519211_AF5BF7B8 
X-CRM114-Status: UNSURE (   7.69  )
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

This series adds pinctrl support for the Rockchip RK3506 SoC.

The series includes:
- RK3506 pinctrl driver implementation
- RMIO (Rockchip Matrix I/O) support for RK3506

Ye Zhang (3):
  dt-bindings: pinctrl: Add rk3506 pinctrl support
  pinctrl: rockchip: Add rk3506 pinctrl support
  pinctrl: rockchip: add rk3506 rmio support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 517 +++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h            |   5 +
 3 files changed, 515 insertions(+), 8 deletions(-)

-- 
2.34.1


