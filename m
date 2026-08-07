Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836D1C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P881470vA/pMUipJXIw7ad96jigQEZxWmkUYlXLZPIQ=; b=WAE5gm4xjZ+1rcI8uZAh9Q8wCj
	Rq/zaDlndyrL01zDf8B0lGiqPPv0ItD56P/Y5askt8rQONUwn+V8bzFXK4tdk9uMV8+qv8cdyYUpW
	xnAQhyxunB3hKYOvRQQ979yL118GUCqnPl0WerPp9rE7rhZHA0lPqe78FzvTxpiDA8dKM1TNm7kcB
	fCOC9Fllh0TiZkW0fjv2seNAdff+8fP5xdnR/W4NmbYflowgRqZnWwHDOSeemAwoWVE5B0ybvMGQm
	91VCwmRfNiGyfPcnfx0tiIMn5IlRUQbPv0WvvC4K/Jtiz11RB/rI6OaHFhaRdMOAHHOVYN/r25EtP
	6u/7WQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMJy-00000008KDT-3clS;
	Fri, 07 Aug 2026 15:17:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMJx-00000008KDN-1fbX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:17:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7495F600AF;
	Fri,  7 Aug 2026 15:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAD51F00A3A;
	Fri,  7 Aug 2026 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786115836;
	bh=P881470vA/pMUipJXIw7ad96jigQEZxWmkUYlXLZPIQ=;
	h=From:To:Cc:Subject:Date;
	b=f3jadJWgsR1Gfbka/nWnu8fE81C09GzaPwOGu/9ZXVqXdmAdoKy5d2KIyvPddl7UK
	 6MhVl01IwCZOZxquO1EyWo6Yx5BNNlABYu+iKa6BtRfVg//fEgjTsxBWBwujqqIO7u
	 DSXePZMGQun2JatCANuYMDnR+2xzVqoqQGPK5JuuCepAx2Q3KsPMXXtWvNNnE/ew/6
	 TmAl1aqS4LND4qVEhB2HUczo3A+zYZznqFbtSOw8eQba7TDd39E8QQRetXqsGlR9oX
	 V1l+JpwGKM5zVlv8ABZBC55FxkqIJhszZak7HeyTyRmunC8YkPAYfoODYHVdQ0X1CU
	 n6/W8Vdaglxcw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	William Bright <william.bright@imd-tec.com>,
	Biswapriyo Nath <nathbappai@gmail.com>,
	=?UTF-8?q?Dawid=20Wro=CC=81bel?= <me@dawidwrobel.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
	Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
	Stanislav Zaikin <zstaseg@gmail.com>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Xueyao An <xueyao.an@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree updates for v7.3
Date: Fri,  7 Aug 2026 10:17:11 -0500
Message-ID: <20260807151711.601956-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


The following changes since commit 23da74833df803c5e8bea71feb878173764ef121:

  arm64: dts: qcom: eliza: Describe the ADSP GPR node (2026-07-29 16:22:07 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.3-2

for you to fetch changes up to b426fedcef8c277574bd7beed0ae9d482c03605a:

  arm64: dts: qcom: talos-evk: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies (2026-08-04 22:32:44 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree updates for v7.3

Introduce the Asus Zenbook A16 (UX3607OA).

Add IPQ9574 PCIe bridge descriptions and enable PCIe0 and PCIe2 for
QCN92xx Wi-Fi cards on RDP454. Align IPQ5018, IPQ6018, and IPQ8074 PCIe
PHY and reset descriptions with the port-node binding.

Extend Shikra platform enablement with CQM and IQS SoM Wi-Fi and Bluetooth
descriptions. Enable CDSP, LPAICP, and MPSS remote processors on CQM, CQS,
and IQS EVKs, and add SMP2P, QUPv3, DDR bandwidth monitor, CPU frequency
hardware, EPSS L3 interconnect, OPP tables, thermal zones, GPIO
reservations, and display and GPU clock controllers.

Enable Eliza CQS EVK audio and add its LPASS macro and SoundWire
descriptions. Add PMIC ADC support for Hamoa, Monaco, and Lemans, and
ADC channel macros for the third-generation ADC block. Add minidump SRAM
configurations across affected Qualcomm platforms.

Fix QMP PHY vdda-phy and vdda-pll supply assignments across Qualcomm
platforms. Correct PCIe IOMMU mappings for QCS6490, Lemans, Monaco,
Talos, SM, SC, and related boards. Fix the Glymur/Mahua PDC interrupt
mapping, USB HS properties, and wakeup configuration; correct board
identifiers, pin configuration, GPIO supplies, default bus frequency, and
DT validation issues.

Enable the X1E80100 deepest idle state, configure SPMI ADC thermal
monitoring on SM8550 and SM8650, add the Milos GPU clock controller, and
assign SM8650 CCI clock rates.

----------------------------------------------------------------
Ayyagari Ushasreevalli (3):
      arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
      arm64: dts: qcom: hamoa-pmics: Add ADC support

Bibek Kumar Patro (2):
      arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes
      arm64: dts: qcom: shikra: Enable CDSP, LPAICP and MPSS on EVK boards

Biswapriyo Nath (1):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add vbus-supply in Type-C connector

Dawid Wróbel (1):
      arm64: dts: qcom: sm8250-xiaomi-elish: correct the board ID

Gaurav Kohli (1):
      arm64: dts: qcom: shikra: Enable TSENS and thermal zones

Hans de Goede (1):
      arm64: dts: monaco: Fix CSI I2C controllers default bus frequency

Imran Shaik (3):
      arm64: dts: qcom: talos: Fix cpu6 1094.4MHz OPP frequency typo
      arm64: dts: qcom: agatti: Add missing CX power domain to DISPCC
      arm64: dts: qcom: shikra: Add support for DISPCC/GPUCC nodes

Jishnu Prakash (1):
      arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

Kathiravan Thirumoorthy (5):
      arm64: dts: qcom: ipq8074: move PCIe phys and PERST# to port node
      arm64: dts: qcom: ipq6018: move PCIe phys to port node
      arm64: dts: qcom: ipq5018: move PCIe phys and PERST# to port node
      arm64: dts: qcom: ipq9574: Add PCIe bridge node
      arm64: dts: qcom: ipq9574: enable the PCIe support on RDP454

Komal Bajaj (4):
      arm64: dts: qcom: shikra: Add cpufreq-hw, EPSS L3 interconnect and OPP tables
      arm64: dts: qcom: shikra: add WiFi node support
      arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs
      arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm

Konrad Dybcio (12):
      arm64: dts: qcom: msm8998: Don't pull-up I2C pins by default in sleep
      arm64: dts: qcom: msm8976-longcheer-l9360: Fix accidental node override
      arm64: dts: qcom: sdm632-motorola-ocean: Fix LED default trigger property
      arm64: dts: qcom: qcs8300-ride: Fix BT RFA supply name
      arm64: dts: qcom: talos-evk-som: Fix BT RFA supply name
      arm64: dts: qcom: Rename pci@ nodes to pcie@
      arm64: dts: qcom: sc8280xp-crd: Add pmic-glink orientation GPIOs
      arm64: dts: qcom: sc8280xp-crd: Fix the pin index for misc_3p3_reg_en
      dt-bindings: arm: qcom: Add Asus Zenbook A16 (UX3607OA)
      arm64: dts: qcom: eliza-cqs-som: Add eUSB2 repeater supplies
      arm64: dts: qcom: glymur: Fix PDC IRQ mapping
      arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)

Krishna Kurapati (3):
      arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb controller nodes
      arm64: dts: qcom: glymur: Fix properties of usb_hs node
      arm64: dts: qcom: glymur: Configure USB controllers are wakeup-capable

Luca Weiss (1):
      arm64: dts: qcom: milos: Add GX clock controller

Manivannan Sadhasivam (49):
      arm64: dts: qcom: kaanapali: Fix the PCIe iommu-map entries
      arm64: dts: qcom: kodiak: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sar2130p: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sdm845: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8150: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8250: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8350: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8450: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8550: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8650: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8750: Fix the PCIe iommu-map entries
      arm64: dts: qcom: talos: Fix the PCIe iommu-map entries
      arm64: dts: qcom: lemans: Fix the PCIe iommu-map entries
      arm64: dts: qcom: monaco: Fix the PCIe iommu-map entries
      arm64: dts: qcom: monaco-monza-som: Fix the PCIe iommu-map entries
      arm64: dts: qcom: monaco-evk-ifp-mezzanine: Fix the PCIe iommu-map entries
      arm64: dts: qcom: lemans-evk-ifp-mezzanine: Fix the PCIe iommu-map entries
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Fix the PCIe iommu-map entries
      arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: Fix the PCIe iommu-map entries
      arm64: dts: qcom: qcs6490-rb3gen2: Fix the PCIe iommu-map entries
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sc8280xp-blackrock: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sa8540p: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sdm845: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sdm850: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sm8150: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sm8250: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sm8350: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sm8450: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sm8550: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: qcs8550-aim300: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: qcm6490: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: qcs6490: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sm7225-fairphone-fp4: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sc7180: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sc7280: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sc8180x: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: purwa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sm8650: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sm8750: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sar2130p: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: kaanapali: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: glymur: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: lemans: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: eliza-mtp: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: sa8155p-adp: Fix swapped USB and UFS QMP PHY vdda-phy/vdda-pll supplies
      arm64: dts: qcom: talos-evk: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies

Maulik Shah (1):
      arm64: dts: qcom: x1e80100: Add deepest idle state

Mukesh Ojha (13):
      arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
      arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
      arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm8550: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
      arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node

Neil Armstrong (5):
      arm64: dts: qcom: pmk8550: add VADC node
      arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

Pradyot Kumar Nayak (1):
      arm64: dts: qcom: glymur-crd: Add FocalTech ft3d81 touchscreen support

Rakesh Kota (1):
      arm64: dts: qcom: Update spmi-pmic-arb interrupt trigger for shikra

Ravi Hothi (2):
      arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
      arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with WSA8845 and DMIC

Sayantan Chakraborty (1):
      arm64: dts: qcom: shikra: Add DDR BWMON support

Stanislav Zaikin (1):
      arm64: dts: qcom: taoyao: Drop adsp_rpc_remote_heap_mem override

Vishnu Santhosh (1):
      arm64: dts: qcom: shikra: Add SMP2P nodes

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8650: Assign CCI clock rates to 37.5MHz

William Bright (2):
      dt-bindings: vendor-prefixes: Add IMDT
      dt-bindings: arm: qcom: Document IMDT QCS8550 SBC/SoM

Xueyao An (1):
      arm64: dts: qcom: shikra: Add QUPv3 configuration

 Documentation/devicetree/bindings/arm/qcom.yaml    |    8 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |    1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts         |  141 ++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi        |    5 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |    4 +-
 arch/arm64/boot/dts/qcom/eliza.dtsi                |  189 +++
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 1269 +++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |   25 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |   20 +-
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |   20 +-
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |  158 ++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   20 +-
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |    8 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   12 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |    5 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |   10 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |   10 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   14 +-
 .../arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi |   33 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts        |   80 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   56 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |    4 +-
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |    4 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |    9 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   13 +-
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |   22 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |    4 +-
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi         |   93 ++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |    8 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   13 +-
 arch/arm64/boot/dts/qcom/milos.dtsi                |   10 +
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |    4 +-
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso    |   22 +-
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi     |   16 +-
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi         |   43 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |   29 +-
 .../boot/dts/qcom/msm8976-longcheer-l9360.dts      |    4 +-
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |    4 -
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |    5 -
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   24 +-
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |   30 +
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |   21 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |    4 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    4 +-
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     |    4 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |    4 +-
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h          |   88 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   16 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |   18 +-
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |   58 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   26 +-
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |   26 +-
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |    4 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |    2 +-
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |    4 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    5 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    8 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |    8 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   16 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |    8 +-
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |    4 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |    8 +-
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    4 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    5 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    4 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |    4 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |   16 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |   16 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   16 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    6 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |    8 +-
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |    4 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |    4 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    8 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |    4 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    4 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    4 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   69 +-
 .../dts/qcom/sdm850-huawei-matebook-e-2019.dts     |    8 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    8 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |    8 +-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   19 +
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       |   80 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   19 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   19 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi       |   88 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1720 +++++++++++++++++++-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |    2 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |    5 +
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |    5 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    4 +-
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts  |    6 -
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    8 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    4 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    4 +-
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |    4 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    8 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    8 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    4 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |    2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts    |    4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    8 +-
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |    8 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    8 +-
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |    4 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   13 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |    4 +-
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |    4 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   13 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |  281 +++-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |  281 +++-
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |    4 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   13 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |    4 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |  281 +++-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |  281 +++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   14 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |    6 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                |   11 +-
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |   20 +-
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   20 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |   16 +-
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |   12 +-
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |    8 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   20 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |   20 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   16 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   12 +-
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |   16 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   16 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   20 +-
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |    1 +
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |    1 +
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |    1 +
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |    1 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   21 +-
 156 files changed, 5933 insertions(+), 649 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h

