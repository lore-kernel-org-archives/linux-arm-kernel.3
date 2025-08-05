Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9448BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LLt3pZSNwp/Iozyqay3NMtUYSSaQpFcEZxczhdMZ6+c=; b=i6hUkdaxqfXTQQ+O0sxIXy3s84
	xVzrTpdM2QdFL66ITbqtmOAJ2NJ2cx/1jIlwPwyrseLz+fGSilwCpqrKa7OetBgyzxBXzYG630vQ6
	WweeTwjvtJwM/uPgX5aDLAjXuEpjPD26k/6UgYhr7JZOvgMK0LHbEkuO2KZOzQd2NfaFlWkLPqPPR
	7X512P0wnZhoPrNL91BcaXaprqsySNVO0pIYkOUcjr8gWvfMam6NGerK5kx0ghlhrBnVH6XDCbtaJ
	FWcjQDec09xu6ULWNgnTBGel19X1fBDz3wAQN6D6saFunUCbN5iUmuVnmPCpDNYGKuocwG8/sw6TH
	1hJjyu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCXW-0000000C5pB-35GE;
	Tue, 05 Aug 2025 07:56:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCPV-0000000C45L-3bHo;
	Tue, 05 Aug 2025 07:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754380116;
	bh=dfz9GEQtGUBOq+4N1TmCcfkFU6ARoozvcEdCqiVMSXg=;
	h=From:To:Cc:Subject:Date:From;
	b=Odn44y4uCkUytDBo/oOSHQ7Idxe70sJ2w8swzbeUWboeYTHjT/CsidZXMOuT+Dz9x
	 0IJC8XC8Bpd0b6dmKLumrBFue826zqygwgJGH7itTCDFn8xkj0NMBRWHQ4DkwdgDN2
	 NOmPMQLG3v3Bjcisl1wcX2tG+iaXbzcUTS0Q2c5oF/AYdtTS7+UafYfCuPXRFwi3ha
	 aC/YeUbGdMf+JFc5+mJ21QF0bVJungC5MpQsWpPPbemOdacMQclz8vLGy+yx4Pd5SU
	 7X4Xh0j82ip32kfhOI7pIh+ISaqH7ku2XYYTKmjzyqUzBO3ue7vfIB2il1Sz/JLJS6
	 WZC6R43AR4kJw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5175D17E01F5;
	Tue,  5 Aug 2025 09:48:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 00/10] pmdomain: Partial refactor, support modem and RTFF
Date: Tue,  5 Aug 2025 09:47:36 +0200
Message-ID: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_004838_128969_D6574C35 
X-CRM114-Status: GOOD (  20.32  )
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

Changes in v3:
 - Dropped specified items for cells restriction as suggested by Rob
 - Fixed an issue in patch 4 still referencing "mediatek,bus-protection"
   as it is entirely replaced by "access-controllers"

Changes in v2:
 - Added #access-controller-cells allowance for MT8188/95 infracfg_ao

This series is a subset of [1], leaving out the Hardware Voter specific
bits for MT8196 until the discussion around it reaches a conclusion.

Even though the proposed code was born as a preparation to support the
MT8196/MT6991 SoCs power domain controllers, it is a necessary cleanup
for all power domain controllers of all of the currently supported SoCs
from MediaTek.

You may also notice the addition of support for modem power sequences:
this was brought up 6 months ago (or more) by community contributors
(mainly Yassine Oudjana) that were trying to upstream the MediaTek
MT6735 Smartphone SoC and needed support to provide power to the MD
subsystem - so, even though in this specific series the code for the
modem power sequence is not yet triggered by any SoC, please please
please, let it in.
Besides, "a bunch" of upstream supported SoCs do have the MD power
domain even though it wasn't added to their drivers (because if there
was no support in the driver, it would just crash the system); the
addition is something that I plan to do at some point, but definitely
not now as I have no bandwidth for that (bar MT8196, which will have
this domain).

Compared to v1 in [1]:
 - Changed mediatek,bus-protection to access-controllers
   as suggested by Rob (thanks!)
 - Added commits to document #access-controller-cells on all of
   the access control providers

In the meanwhile.... relevant excerpt from the old series:

This series refactors the bus protection regmaps retrieval to avoid
searching in all power domain devicetree subnodes for vendor properties
to get syscons for different busses, and adds a new property which is
located in the power controller root node containing handles to the same.

Retrocompatibility is retained and was tested on multiple SoCs in the
Collabora lab - specifically, on Genio 350/510/700/1200, and manually
on MT6795 Helio (Xperia M5 Smartphone), MT8186, MT8192 and MT8195
Chromebooks.

This was tested *three times*:
 - Before the per-SoC conversion in drivers/pmdomain/mediatek
 - With per-SoC conversion code but with *legacy* devicetree
 - With per-SoC conversion code and with *new* devicetree conversion

All of those tests were successful on all of the aforementioned SoCs.

This also adds support for:
 - Modem power domain for both old and new MediaTek SoCs, useful for
   bringing up the GSM/3G/4G/5G modem for both laptop and smartphone use
 - RTFF MCU HW, as found in MT8196 Chromebooks and MT6991 Dimensity 9400

...and prepares the pmdomain code to accomodate only the directly
controlled power domains for MT8196 (HW Voter support was left out).

[1] https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delregno@collabora.com

AngeloGioacchino Del Regno (10):
  dt-bindings: memory: mtk-smi: Document #access-controller-cells
  dt-bindings: clock: mediatek: Document #access-controller-cells
  dt-bindings: power: mediatek: Document access-controllers property
  pmdomain: mediatek: Refactor bus protection regmaps retrieval
  pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
  pmdomain: mediatek: Move ctl sequences out of power_on/off functions
  pmdomain: mediatek: Add support for modem power sequences
  pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
  pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
  arm64: dts: mediatek: Convert all SoCs to use access-controllers

 .../bindings/clock/mediatek,infracfg.yaml     |   3 +
 .../clock/mediatek,mt8186-sys-clock.yaml      |  15 +
 .../clock/mediatek,mt8188-sys-clock.yaml      |  15 +
 .../clock/mediatek,mt8192-sys-clock.yaml      |  15 +
 .../clock/mediatek,mt8195-sys-clock.yaml      |  15 +
 .../clock/mediatek,mt8365-sys-clock.yaml      |  15 +
 .../mediatek,smi-common.yaml                  |  16 +
 .../power/mediatek,power-controller.yaml      |  37 ++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      |   5 +-
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |   6 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   4 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  17 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  12 +-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  23 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  13 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  20 +-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      |  16 +-
 drivers/pmdomain/mediatek/mt6795-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8167-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8173-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8183-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8186-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8188-pm-domains.h |   6 +
 drivers/pmdomain/mediatek/mt8192-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8195-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8365-pm-domains.h |  14 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 399 +++++++++++++++---
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |  74 +++-
 28 files changed, 594 insertions(+), 181 deletions(-)

-- 
2.50.1


