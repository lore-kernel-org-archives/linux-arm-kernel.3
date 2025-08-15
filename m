Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC0DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kloXm9oCJelFEe12lk+xICkSkTUwSYGASTyAcrdUfGQ=; b=FKEp+hbs9gPmbslpQToeHwtbwW
	8sRhZ6mMtEY45o3lV6cR0Lyz2YXTYeVSuQoKdfv+a1BS7hMBUjbsWuQZyD2CS2MmXxrrQ/REt2mnC
	CkAZ5m+wFmF1wyBpT+fzOpNL2RmaY0zi3/N9cMilJHTmjslvvtbn9zQ7y2HYY8OAuIPEShjF6J1/9
	CzCbGilq6IX9LLVi4YuDPgMpr7xTmBGRpjNjDVRn2++/AdhHUh2EzCLtLwwPi6ROTafPo51S6S5Q3
	L/CMCBiGH7OjPPwaAjMO74uvbcYlxRLVxi3Thz7oGNlTfmeaIKtjmeEc9gja9C3huL5kMIordR7kC
	fFOVGTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyQ4-000000039QP-3uKO;
	Fri, 15 Aug 2025 17:40:48 +0000
Received: from mail.grinn-global.com ([77.55.128.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx0m-00000002w9a-2X2n;
	Fri, 15 Aug 2025 16:10:37 +0000
X-Virus-Scanned: by amavisd-new using ClamAV (8)
Received: from mateusz.grinndev.ovh (79.163.192.75.ipv4.supernova.orange.pl [79.163.192.75])
	by server220076.nazwa.pl (Postfix) with ESMTP id 839F81BCF12;
	Fri, 15 Aug 2025 18:10:26 +0200 (CEST)
From: Mateusz Koza <mateusz.koza@grinn-global.com>
To: angelogioacchino.delregno@collabora.com,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com,
	b.bilas@grinn-global.com,
	Mateusz Koza <mateusz.koza@grinn-global.com>
Subject: [PATCH 0/4] Add support for Grinn GenioSBC-510/700 boards
Date: Fri, 15 Aug 2025 18:08:33 +0200
Message-ID: <20250815160837.371592-1-mateusz.koza@grinn-global.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.50
X-NA-AI-Is-Spam: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_091036_814377_A484C7AF 
X-CRM114-Status: UNSURE (   9.45  )
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

This patch series adds support for Grinn GenioSBC-510 and GenioSBC-700
boards based on MediaTek MT8370 and MT8390 SoCs, respectively. It
includes device tree files for both boards, updates to the device tree
bindings, and necessary modifications to the Makefile.

As far as I know, <angelogioacchino.delregno@collabora.com> has access
to the schematics for these boards, as we've shared them under NDA with
Collabora.

Bartosz Bilas (1):
  arch: dts: mediatek: mt8370: add Grinn GenioSBC-510

Mateusz Koza (3):
  arch: dts: mediatek: mt8390: add Grinn GenioSBC-700
  dt-bindings: arm: mediatek: Add grinn,genio-700-sbc as a valid
    platform
  dt-bindings: arm: mediatek: Add grinn,genio-510-sbc as a valid
    platform

 .../devicetree/bindings/arm/mediatek.yaml     |   2 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8370-grinn-genio-510-sbc.dts   |  19 +
 .../mediatek/mt8390-grinn-genio-700-sbc.dts   |  19 +
 .../dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 673 ++++++++++++++++++
 .../dts/mediatek/mt8390-grinn-genio-som.dtsi  | 208 ++++++
 6 files changed, 923 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi

Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
-- 
2.43.0


