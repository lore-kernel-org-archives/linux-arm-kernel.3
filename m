Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78091E9D822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=glDs+zy+kxfWo3GbpUWqcMOMZEJmNHqtSVeL0SRcpXQ=; b=S1uo/1C6Yiv2eP5kcyuE4K+RNj
	4CGSOJ5FGukxmOrGQYRe6ruWVu+sR7vh45Ji+NBWlsVG+UvgfmQDOFco2oPe92etU9FHw3a7G1PrD
	R75OEzQmwKmJeaSWsWC+Xldpi5TUmLX+VlQqJthwydEf2Trui+54z3BQmH4AMPmcFr8tVjVaIYcKN
	PYoS9F0ScoU/vI1bjBhwhGG76hZKdaKnwWjR9amNnwj8DNCsDH6Z61XNa+FJxUx/RENJAHyn2Zwn3
	e4y8IV4tJjzeJT4kSaOxyamZSgaLVrmzEJh4qQcqd9kio+2lCAL2OWSG2ijHwQwTvE8Ue2M5Zumor
	AM7kKU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jsE-000000058oa-1y8v;
	Mon, 06 Apr 2026 13:20:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jsD-000000058oR-0d2z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 13:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19390600AC;
	Mon,  6 Apr 2026 13:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268CDC4CEF7;
	Mon,  6 Apr 2026 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481611;
	bh=StZoYZSX3E03qoBHUpVi4AQ8Vdh7LtYLTjwMGiHSG10=;
	h=From:To:Cc:Subject:Date:From;
	b=lx/63tbTBTxuSxb+GUC1vG9fWJr7naq+7Hx8amitFSBw96HDow9a5P9EtlPvI2qBE
	 /tQsB6uTEvRlVSskV95YURmF2UxXB62MB9O3LTlMbn5eUGi4BKsMA7Sh65TEH/aW1i
	 A4V56wXyAjG1kTwcA+SkK/J1iwWLUNVArP6ScKF/RYBwlsanWOrhgBnqCLGnD+sfBd
	 uzhZSOaipmHa0lB0WPgz51msd/JBnyiiKyMCIR506FY6pEVxjVVbSz6ltbe/V1XRAe
	 zwo5wY7CqWbM9RvbhU1h7w/SoytBZgfFuhg/9dv2Af8/6Di/UzPhttTcquAV0ce4d2
	 LjNN/RWcxbPtg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Sajna <sajattack@postmarketos.org>,
	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Jie Zhang <quic_jiezh@quicinc.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Alexander Martinz <amartinz@shiftphones.com>,
	Amir Dahan <system64fumo@tuta.io>,
	Christopher Brown <crispybrown@gmail.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: [GIT PULL] A few more Arm64 DeviceTree updates for v7.1
Date: Mon,  6 Apr 2026 08:20:07 -0500
Message-ID: <20260406132007.2264408-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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


The following changes since commit b683730e27ba4f91986c4c92f5cb7297f1e01a6d:

  arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 09:35:01 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.1-2

for you to fetch changes up to af241225893ac4933bb8f0615f2dfda8ea2326ce:

  arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X (2026-04-02 16:08:54 -0500)

----------------------------------------------------------------
A few more Arm64 DeviceTree updates for v7.1

Introduce the Hamoa-based Lenovo IdeaCentre Mini X, the Dragonwing
IQ-615 (Talos) EVK, and a Talos EVK camera overlay.

Enable DisplayPort support on the Glymur CRD.

Add WiFi, Bluetooh, LEDs, and venus on LG-based SDM845 devices. Add
battery, charger, and display on the LG G7 ThinQ.

Enable SD-card, describe the audio amplifier, and increase the speed of
the i2c clock for touchscreen on the SHIFT SHIFT6mq.

Add camera subsystem, camera control interface, GPU, GMU, and GPU
cooling on the Talos platform. Enable the GPU on the Ride board.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: glymur-crd: Enable DisplayPort support

Alexander Martinz (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable TFA9890 codec

Amir Dahan (1):
      arm64: dts: qcom: sdm845-lg-common: Add LEDs

Bjorn Andersson (2):
      dt-bindings: arm: qcom: Document the Lenovo IdeaCentre Mini X
      arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X

Casey Connolly (2):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
      arm64: dts: qcom: sdm845-shift-axolotl: Set higher touchscreen i2c clock

Christopher Brown (1):
      arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger

Gaurav Kohli (1):
      arm64: dts: qcom: talos: Add GPU cooling

Jie Zhang (2):
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Mukesh Ojha (1):
      arm64: dts: qcom: talos: Add EL2 overlay

Odelu Kukatla (1):
      arm64: dts: qcom: talos: Add clocks for QoS configuration

Paul Sajna (10):
      arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
      arm64: dts: qcom: sdm845-lg-judyp: Define firmware paths for judyp
      arm64: dts: qcom: sdm845-lg-common: Enable venus
      arm64: dts: qcom: sdm845-lg-common: Enable qups and their dma controllers
      arm64: dts: qcom: sdm845-lg: Add uarts and Bluetooth
      arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg: Add wifi nodes
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

Sudarshan Shetty (3):
      dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
      arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node naming
      arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board

Wenmeng Liu (4):
      arm64: dts: qcom: talos: Add camss node
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 Documentation/devicetree/bindings/arm/qcom.yaml    |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   14 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |   16 +
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1200 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   10 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |  210 +++-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |  127 ++-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts       |   28 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   59 +
 arch/arm64/boot/dts/qcom/talos-el2.dtso            |   25 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |   63 +
 .../dts/qcom/talos-evk-lvds-auo,g133han01.dtso     |  127 +++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |  617 ++++++++++
 .../boot/dts/qcom/talos-evk-usb1-peripheral.dtso   |   27 +
 arch/arm64/boot/dts/qcom/talos-evk.dts             |  139 +++
 arch/arm64/boot/dts/qcom/talos.dtsi                |  436 ++++++-
 16 files changed, 3033 insertions(+), 67 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/talos-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

