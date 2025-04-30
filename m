Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD44FC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kt+PJysEfOP7r2Wg4l8xcp//IqyeBTg9yDxzQtKWL+g=; b=s1xLy6pabvAdL2MtrdXVk9MsPB
	ZZ9mUOVfLIX4jSxSCkG/2m6aVTCU+M5JXxsditLnVY306KH1E9RKUxqF8OjtMGzVyOd1a8GUxiXBJ
	2QHgEwQ7jIbjyYoAXKQrKxjmQz0oskB4WD3lSzk0OneI8xGBiodvcXrF3sbnisTW3upwZ4/0fCA85
	PlvX4k87SfDukWtK/pzNN2Ld82x2FekQ4uyQs1XZEXndadr3kt4i2QvxH4Xqb7MdQ5y1d+NiCjgbE
	zkSxvqEpRKqWFMUw59FLJC6G13jfhsIQauk+dNpK9EijDLrsAalO6VgMIFpBLPPoJLOaPGtUnVSL3
	zlR99Xlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4Mt-0000000CTcK-2xtJ;
	Wed, 30 Apr 2025 10:08:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3x2-0000000CPIw-36VH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:42:02 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0D6F81FA38;
	Wed, 30 Apr 2025 11:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006118;
	bh=Kt+PJysEfOP7r2Wg4l8xcp//IqyeBTg9yDxzQtKWL+g=; h=From:To:Subject;
	b=iKnUWzP1eoXD9trFYsk54XxIcT1NqnIAKw60ytYeX4YKPTsXjSfPd6dzWlU/sX9yn
	 Y5kkx4u02RVNSQDlXN7saZqJz1uc7IuSWPTORvBg1c0cWP++QZIprYE08WUfS0451J
	 hy3enqHpdNCPXbXK68u6wz1/VrICJ5mtHIMIZiiBwaxmf9E+oy++pOiE9j9AWKtTgc
	 Uf9rFtKvzIEhoGCPNMnBAvM43ewAdLaKwOADpNGjghe73/PqjIcAxRpf/VecZJlMbi
	 HgAWoAAXpG+pJfY83Qi9bB0SgS0bMW2khvd4nZ2I5tAjQhwKCK1RNGc5XBvf5NNmVG
	 l5eIWoJttW2LA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: freescale: imx8mp-toradex-smarc: add fan, ec, gpio
Date: Wed, 30 Apr 2025 11:41:46 +0200
Message-Id: <20250430094151.98079-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_024200_935993_3DDD3093 
X-CRM114-Status: UNSURE (   6.78  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add fan, gpio expander and embedded-controller to the Toradex SMARC iMX8MP
device tree file.

All the required DT bindings and drivers are now in next:
 - https://lore.kernel.org/all/20250331072644.17921-1-francesco@dolcini.it/
 - https://lore.kernel.org/all/20250414171455.155155-1-francesco@dolcini.it/
 - https://lore.kernel.org/all/20250402102146.65406-1-francesco@dolcini.it/

Emanuele Ghidoli (2):
  arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
  arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander

Francesco Dolcini (3):
  arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
  arm64: dts: freescale: imx8mp-toradex-smarc: use generic gpio node
    name
  arm64: defconfig: Add Toradex Embedded Controller config

 .../freescale/imx8mp-toradex-smarc-dev.dts    |  9 +++++-
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 32 ++++++++++++++++++-
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.39.5


