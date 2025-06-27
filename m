Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A0EC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wj/6Y49cGnCGvWUR5KcgCT6qJh/Cr23hC+RaEqDcaIo=; b=3O5EaQmqDiU9Cu5+Hdmp6jXQ3W
	BQwCtWfjMhEvovth2wbSsGZ1LvJzRM/AsI/83rJVF87375rQvabY3XIzqs6ueIGMwLe3BPQlk+7no
	7D5UjYJBxVOi/1+ZAo7nAPh44qxyJQUcsT8+i7IXRevlhzE9ymUAcdCg8vlVyeY+2Rx/0Tk9kT7Aa
	xtTZEMJgJMj9efJDnGI1BB4iCQGh7GXE7SCYIq4WMAHQZV+Q8TrXgwEmJjDQbBg/LDqzbzOETIdgP
	4KWjeiTxecKbsR08oJJ5mqHSIEGfTwtPzwAeE5JwfiqgScd8YjUDkjO09nqrroBDeqKAdUNq1J/R9
	w3HVysaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBKQ-0000000FAJS-165p;
	Fri, 27 Jun 2025 15:49:26 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAyk-0000000F64k-2IHG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:27:04 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751038018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wj/6Y49cGnCGvWUR5KcgCT6qJh/Cr23hC+RaEqDcaIo=;
	b=EAo49fA0xMK8ES/V94l1Hk1DWaZx3MuabqUD2R+mtfqVz/YOuKB23817ppMo3m6rPnT6uj
	22wyCu/uf2rXh7PY4u6qEZZD6CVHsZEs80cpcp3nb1J3pj78OzQMFjqOKjbFLjyd476/DS
	ipVyQgmHL8RxyFajkdjEi0ygt7jB5NMwOuRjh3JGa4Sa/r1j5cBcqe/wasElpdBGlwU5lx
	vKRTuC2fM+ynw5REjtD+D/7ED4ylZSKmH5A0+R3FlaNGevw3mpXmdOX/PSllPBNp5GPJLn
	uQL0tt0CmtfBAPaCNTGyzPQugtCT5YUZkdkHYkqWxUIbm3DMZoHtF4+4CAJHrA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 0/8] Fix several DTB validation issues
Date: Fri, 27 Jun 2025 17:16:19 +0200
Message-ID: <20250627152645.740981-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082703_075496_D7A95FBF 
X-CRM114-Status: GOOD (  15.81  )
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

This patch set to fix several DTB validation issues consists of 2 parts:
1) dsi refactoring
2) various low-hanging fruit

ad 1) The display/rockchip/rockchip,dw-mipi-dsi.yaml binding had:
- #address-cells
- #size-cells

My guess is that those properties were added for panel(s) which could
be connected. While convenient, it's not a property of the DSI
controller (in the SoC). And caused DTB validation issues when a panel
was not connected to the board. So add the #address/#size-cells
properties to the board dts[i] file where there is a panel and then
remove the properties from the SoC dtsi file ... and then from the
binding file as well.

Another part of the DSI refactoring had to do with the declaration of
endpoints in which various properties got redefined ... to the same
values they had in the SoC dsi node. The SoC dsi node already defined
the structure where each port got a label/phandle. That allows for a
simplification of the endpoint by referencing that label/phandle.

ad 2)
There were a number of issues which were obvious to me how to fix, so
I fixed those as well

My changes were based on yesterday's v6.17-armsoc/dts64 branch:
7f9509791507 ("arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC")

Then applied the following patches:
86491c2b99e5 ("dt-bindings: pinctrl: rockchip: increase max amount of device functions")
6f446bbe412a ("dt-bindings: gpu: mali-utgard: Add Rockchip RK3528 compatible")
ab9be0b75af5 ("dt-bindings: display: himax-hx8394: Add Huiling hl055fhav028c")
8358102806c6 ("dt-bindings: power: rockchip: Add support for RK3528")
233eda069994 ("dt-bindings: rockchip: pmu: Add compatible for RK3528")

And then validated it with W=1 using dtschema-2025.6.1.
The validation log file sizes:
- base: 99.8 KiB
- dsi: 82.1 KiB
- low-hanging-fruit: 68.9 KiB

I then checked whether dmesg wouldn't indicate problem on these boards:
- Rock64 (rk3328)
- RockPro64 (rk3399)
- PineTab2 (rk3566)

Even with removing timestamps there were quite some differences, but
that seems related to different boots (and thus the exact order in which
things are probed/configured. But I didn't spot difference due to this
patch set.

I don't have any px30 or rk3399-gru-* based boards, so I couldn't test
with those.


I also identified some other items which could reduce the DTB
validation 'noise' substantially:

"failed to match any schema with compatible" errors:

- 'mps,mp8859': regulator/mp8859.txt
- 'realtek,rt5651': sound/rt5651.txt
- 'rockchip,rk3368-mailbox': mailbox/rockchip-mailbox.txt
- 'rockchip,rk3399-gru-sound': sound/rockchip,rk3399-gru-sound.txt
- 'ti,tsc2007': input/touchscreen/tsc2007.txt

Other issues where a (small?) fix may help a lot:

px30:
- /isp@ff4a0000/ports: graph node has single child node 'port@0',
    #address-cells/#size-cells are not necessary
- /syscon@ff140000/lvds/ports/port@0: graph node has single child node
    'endpoint@0', #address-cells/#size-cells are not necessary
- /dsi@ff450000/ports/port@0: graph node has single child node
    'endpoint@0', #address-cells/#size-cells are not necessary

rk3399:
- /usb@fe800000: node has a unit name, but no reg or ranges property
- /usb@fe900000: node has a unit name, but no reg or ranges property

Cheers,
  Diederik

Diederik de Haas (8):
  arm64: dts: rockchip: Refactor DSI nodes on px30 boards
  arm64: dts: rockchip: Refactor DSI nodes on rk3399 boards
  dt-bindings: display: rockchip,dw-mipi-dsi: Drop address/size cells
  arm64: dts: rockchip: Simplify VOP port definition on rk3328
  arm64: dts: rockchip: Simplify edp endpoints on several rk3399 boards
  arm64: dts: rockchip: Fix LCD panel port on rk3566-pinetab2
  arm64: dts: rockchip: Drop unneeded address+size-cells on px30
  arm64: dts: rockchip: Drop regulator-compatible property on rk3399

 .../rockchip/rockchip,dw-mipi-dsi.yaml        |  6 ----
 .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  2 ++
 .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  2 ++
 .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  2 ++
 .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  2 ++
 arch/arm64/boot/dts/rockchip/px30-evb.dts     |  2 ++
 .../rockchip/px30-pp1516-ltk050h3146w-a2.dts  |  2 ++
 .../dts/rockchip/px30-pp1516-ltk050h3148w.dts |  2 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  6 ----
 .../dts/rockchip/rk3326-anbernic-rg351m.dtsi  |  2 ++
 .../dts/rockchip/rk3326-gameforce-chi.dts     |  2 ++
 .../boot/dts/rockchip/rk3326-odroid-go.dtsi   |  2 ++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  6 +---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  4 ---
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   | 15 +++-------
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi | 30 ++++++++-----------
 .../boot/dts/rockchip/rk3399-hugsun-x99.dts   |  2 --
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts | 15 +++-------
 .../dts/rockchip/rk3399-pinephone-pro.dts     |  2 ++
 .../rk3399-puma-haikou-video-demo.dtso        | 12 ++++----
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts |  2 --
 .../dts/rockchip/rk3399-rockpro64-screen.dtso | 21 ++++---------
 .../rockchip/rk3399-sapphire-excavator.dts    | 16 +++-------
 .../boot/dts/rockchip/rk3566-pinetab2.dtsi    |  6 ++--
 24 files changed, 62 insertions(+), 101 deletions(-)

-- 
2.50.0


