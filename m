Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52153CAC5BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aV+4eq5V3yuvh6wJeRdM5bCI9Nox+FmNMTZ9rAKXh8U=; b=ciKrp3x9Hco9dhFsqcN2BKS5Ip
	wJkZhZfZVcCnZ+wD0m1DLcFOo4VPGxLp9qYjM/AhbgfGcWPmqzgm9BJGTzyFRz8QnO11yifowtvYT
	KvVGzSTizmQbipDDckLeBEuSyZzPr1GCJTstDqui0IxuYTXzgftDG9kAZ91Hs/maZmtGCjcyWL5e4
	PnEZk9mRaxvxah7z85jJ6VZ3ZZvNuF1pBM/NxyEGllXBv9zTlW/tva5OZx9rrdyjjdc5JrQ5ZKlnw
	6D4oZtKOTstQYJjiTvYqPn46/Pjo3yh5qhTl3oPVeev3o6dPx/NGM7uk/C5z+XAe80a0PvXM4G8TB
	JFdulvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rS3-0000000CEf4-0RiD;
	Thu, 25 Sep 2025 19:16:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rRu-0000000CEXZ-0DMP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 19:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4593F43E55;
	Thu, 25 Sep 2025 19:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3F5C4AF0B;
	Thu, 25 Sep 2025 19:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758827773;
	bh=LmXjoRO1EzhJd0oVq+AF4HxqnVPEE99/e7UvnoA+mZw=;
	h=From:To:Cc:Subject:Date:From;
	b=We+6+yHQCriVASsWlyJx+3xqdTKBvD+fz+MeGQ0NsLN/Sjh+BFhbf0cdzi1LWkrMP
	 XW1iVLYKsRmDlQJg0hfq5OJC8/7cxCxxShMGoFgulyhZDiIkFWX92JpjlU56J/4Ovo
	 AbLji7YU/9aPSuuGC/N1Cjgy2HSzmGNs/uvz/RQO2MrAmpLLtbd7NEqokYztXF836E
	 qim5rFQG1uhf38wNLsMyKTewFB2NCuzoUmdVbBUVJxdNUza/zLDPCXIqM0ZgOjgGhN
	 K3bndyWvx+D9aDF950HQ61luah7hNIHPPXwFKqBSl93iV+sI9R7B484DhKHlKfjO/t
	 QeDLYSgiGkiDg==
Received: by wens.tw (Postfix, from userid 1000)
	id F369B5FCCB; Fri, 26 Sep 2025 03:16:09 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH net-next v8 0/2] net: stmmac: Add support for Allwinner A523 GMAC200
Date: Fri, 26 Sep 2025 03:15:57 +0800
Message-ID: <20250925191600.3306595-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_121614_130224_2BFD499A 
X-CRM114-Status: GOOD (  16.84  )
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

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This is v8 of my Allwinner A523 GMAC200 support series. This is based on
next-20250925.

This version only contains the DT binding and driver patches. The device
tree patches are basically the same as the previous version.


Changes since v7:
- Rebased onto next-20250925
- Split out only the patches for net-next
- Link to v7
  https://lore.kernel.org/all/20250923140247.2622602-1-wens@kernel.org/

Changes since v6:
- Collected acks for DT binding patch
- Rebased onto next-20250922
- Link to v6
  https://lore.kernel.org/all/20250913101349.3932677-1-wens@kernel.org/

Changes since v5:
- Use plat->phy_interface instead of plat->mac_interface (Russell)
- Link to v5
  https://lore.kernel.org/all/20250911174032.3147192-1-wens@kernel.org/

Changes since v4:
- Moved clock-names list to main schema in DT binding (Rob)
- Dropped 4 patches that are already merged
- Link to v4
  https://lore.kernel.org/all/20250908181059.1785605-1-wens@kernel.org/

Changes since v3:
- driver
  - Fixed printf format specifier warning
- Link to v3
  https://lore.kernel.org/all/20250906041333.642483-1-wens@kernel.org/

Changes since v2:
- DT binding
  - Added "select" to avoid matching against all dwmac entries
- driver
  - Include "ps" unit in "... must be multiple of ..." error message
  - Use FIELD_FIT to check if delay value is in range and FIELD_MAX to get
    the maximum value
  - Reword error message for delay value exceeding maximum
  - Drop MASK_TO_VAL
- Link to v2:
  https://lore.kernel.org/all/20250813145540.2577789-1-wens@kernel.org/

Changes since v1:
- Dropped RFT tag
- Switched to generic (tx|rx)-internal-delay-ps 
- dwmac-sun55i driver bits
  - Changed dev_err() + return to dev_err_probe()
  - Added check of return value from syscon regmap write
  - Changed driver name to match file name
- sram driver bits
  - Fixed check on return value
  - Expanded commit message
- dtsi
  - Fixed typo in tx-queues-config
- cubie a5e
  - Add PHY regulator delay
- Link to v1:
  https://lore.kernel.org/all/20250701165756.258356-1-wens@kernel.org/

This series adds support for the second Ethernet controller found on the
Allwinner A523 SoC family. This controller, dubbed GMAC200, is a DWMAC4
core with an integration layer around it. The integration layer is
similar to older Allwinner generations, but with an extra memory bus
gate and separate power domain.

Patch 1 adds a new compatible string combo to the existing Allwinner
EMAC binding.

Patch 2 adds a new driver for this core and integration combo.


Thanks
ChenYu

Chen-Yu Tsai (2):
  dt-bindings: net: sun8i-emac: Add A523 GMAC200 compatible
  net: stmmac: Add support for Allwinner A523 GMAC200

 .../net/allwinner,sun8i-a83t-emac.yaml        |  95 ++++++++++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 159 ++++++++++++++++++
 4 files changed, 265 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c

-- 
2.47.3


