Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30728C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J83YG9GAUPPvtVmkkht09aSAQ3zEDIwrgCIGKMpoVBM=; b=d7to0EQ6VoS909dEdX9HxJgyN+
	fkqnRMHt5FdcLqnqpyz7LaCIEDxlgz4tbcFexhuWdqtZuUwqicJpS4WddW+W6/RNW9URJZCL9lp5y
	6jB4bc5oQkBOq6m2kPOYv+KpwsXEyNvTu+b8+DEfWRf+eR94fcYOhOwVKRxUWjwOk6yRO1c4s0O3m
	QmBVMUwSJg97rPPYeNKi5EdNzL2gRmCY3RG8fb135xx1tVaREGSXgmPyPJchNPEVp3zqt76grYOZu
	LjXL1xP9TfZQGrIpn5JIxfl3XcOmghoBe6hFX6FAi6QtsdBkzqDQn/FqGkl7H0e61WaC7/IbJZyqS
	6IpBuF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwG2-00000009YBK-34ub;
	Wed, 19 Mar 2025 16:27:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwEM-00000009Xne-1QHf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3577768178;
	Wed, 19 Mar 2025 16:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CF2C4CEE4;
	Wed, 19 Mar 2025 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742401521;
	bh=UJUrVP6JHH3d2lPXAWZVxl+ybUFWOUsLJr0ZJqz1oH8=;
	h=From:To:Cc:Subject:Date:From;
	b=M3P8yc7y660Rxqw41p4RZO409inrbqr5TN2Z1ce7vDetAF4jEkQb8acaeMTvASP7h
	 0dJmA3bMrGTe+fpcodLlmIgvAlxMwMOOEZUxfCL+Nfh/Ld1ZAyv1TaqU72+E9ECRAi
	 wMqDn6XIoaCu29Jez01533xmuRe4mSLc1JGW2I5+yoeRTysQj1crDnMbtv5+kzgEqH
	 4L8rz3a/kSD2/qNilVY0L+IwZL7uO5e7xx5Ne/tr1x8A2Ri89PC4uoOnYg6pegc4wn
	 JTttwZ5lEpsdryRv7KzKyp6kpa/jImii5PMtZcbEKwU736ei67+/h8PHdMDNyxpIpL
	 uCD7BF2PJkpiw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Gabriel Gonzales <semfault@disroot.org>,
	Maud Spierings <maud_spierings@hotmail.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Vikram Sharma <quic_vikramsa@quicinc.com>,
	Abhinaba Rakshit <quic_arakshit@quicinc.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Daniil Titov <daniilt971@gmail.com>,
	Eugene Lepshy <fekz115@gmail.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Lad Prabhakar <prabhakar.csengg@gmail.com>,
	Manish Nagar <quic_mnagar@quicinc.com>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>
Subject: [GIT PULL] More Qualcomm Arm64 Devicetree updates for v6.15
Date: Wed, 19 Mar 2025 11:25:16 -0500
Message-ID: <20250319162517.2292540-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
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


The following changes since commit d09ab685a8f51ba412d37305ea62628a01cbea57:

  arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq (2025-03-03 22:54:17 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.15-2

for you to fetch changes up to 1a7646d784513dcf0e8b16c1d9124ef54b4ec5e0:

  arm64: dts: qcom: x1e001de-devkit: fix USB retimer reset polarity (2025-03-18 14:51:22 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 Devicetree updates for v6.15

Devicetree for the Xiaomi Redmi Note 8 is added.

The IPQ5424 gains MMC, LEDs and buttons, while the IPQ9574 gains NSS
clock controller and SPI NAND support.

The LPG/PWM node is added to PM8937 and Xiaomi Redmi 5A gains display
backlight control.

The USB Type-C orientation GPIO is added on the QCS6490 Rb3Gen2 and the
vision mezzanine is described.
The Fairphone FP5 gains touchscreen support, and the QCM6490 IDP board
gains a required listed of protected clocks.

On SA8775P CTCU and ETR nodes are added, and the CPUfreq throttling
interrupts are added.

On SAR2130P PCIe EP device nodes are added.

The camera subsystem in SC7280 is described.

Samsung Galaxy S9 SM-G9600 gains a description of the MAX77705 used for
charging, fuel gauge, haptic, and LED, as well as the PMIC used for
display and touchscreen, which then is used to enable the touchscreen.

Display and GPU are enabled for the Nothing Phone (1).

On SM8450 the PCIe endpoint controller is described.

SM8650 is transitioned to per-CPU interrupt partitions, in order to
properly describe the PMU interrupts. Missing Coresight ETE instances
are added as well.

On SM8750 the cluster idle states are corrected, then audio and compute
DSPs are introduced, together with the crypto and rng blocks.

On the X Elite platform RTC is enabled. Regulators that are feeding
resources that should be always on is marked as such on a variety of
boards.

Support for external Display is introduced on the reference device and
the Lenovo Thinkpad T14s. The Asus Vivobook S 15 gains support for its
USB-A ports and uSD card reader. The reference device also gains support
for the volume keys found on the debug board.

The Lenovo Thinkpad T14s DeviceTree is split in two, in order to
describe the LCD and OLED variants.

Missing properties for the crypto BAM is introduced on a variety of
platforms, taking care of a long standing error message in the kernel
log during boot.

----------------------------------------------------------------
Abel Vesa (7):
      arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
      arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support
      dt-bindings: arm: qcom: Document Lenovo ThinkPad T14s Gen 6 LCD and OLED
      arm64: dts: qcom: x1e78100-t14s: Add LCD variant with backlight support
      arm64: dts: qcom: x1e78100-t14s: Add OLED variant

Abhinaba Rakshit (1):
      arm64: dts: qcom: qcs615: add TRNG node

Alexey Klimov (1):
      arm64: dts: qcom: qrb5165-rb5: add compressed playback support

Barnabás Czémán (1):
      arm64: dts: qcom: msm8917-xiaomi-riva: Add display backlight

Bjorn Andersson (1):
      Merge branch '20250313110359.242491-1-quic_mmanikan@quicinc.com' into arm64-for-6.15

Daniil Titov (1):
      arm64: dts: qcom: pm8937: Add LPG PWM driver

Devi Priya (3):
      dt-bindings: clock: gcc-ipq9574: Add definition for GPLL0_OUT_AUX
      dt-bindings: clock: Add ipq9574 NSSCC clock and reset definitions
      arm64: dts: qcom: ipq9574: Add nsscc node

Dmitry Baryshkov (2):
      arm64: dts: qcom: sar2130p: add PCIe EP device nodes
      arm64: dts: qcom: sm8450: add PCIe EP device nodes

Dzmitry Sankouski (9):
      arm64: dts: qcom: sdm845: enable gmu
      arm64: dts: qcom: sdm845-starqltechn: remove wifi
      arm64: dts: qcom: sdm845-starqltechn: fix usb regulator mistake
      arm64: dts: qcom: sdm845-starqltechn: refactor node order
      arm64: dts: qcom: sdm845-starqltechn: remove excess reserved gpios
      arm64: dts: qcom: sdm845-starqltechn: add gpio keys
      arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC
      arm64: dts: qcom: sdm845-starqltechn: add display PMIC
      arm64: dts: qcom: sdm845-starqltechn: add touchscreen support

Eugene Lepshy (1):
      arm64: dts: qcom: sm7325-nothing-spacewar: Enable panel and GPU

Gabriel Gonzales (2):
      dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
      arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo

Gaurav Kashyap (3):
      arm64: dts: qcom: sm8750: Add QCrypto nodes
      arm64: dts: qcom: sm8750: Add TRNG nodes
      arm64: dts: qcom: sm8750: Add ICE nodes

Jagadeesh Kona (1):
      arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node

Jie Gan (1):
      arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes

Johan Hovold (14):
      arm64: dts: qcom: x1e80100-crd: add support for volume-up key
      arm64: dts: qcom: x1e80100-crd: add gpio-keys label for lid switch
      arm64: dts: qcom: sc8280xp-crd: add support for volume-up key
      arm64: dts: qcom: x1e80100-crd: mark l12b and l15b always-on
      arm64: dts: qcom: x1e78100-t14s: mark l12b and l15b always-on
      arm64: dts: qcom: x1e001de-devkit: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-hp-x14: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-yoga-slim7x: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-qcp: mark l12b and l15b always-on
      arm64: dts: qcom: x1e78100-t14s: fix missing HID supplies
      arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
      arm64: dts: qcom: x1e80100: enable rtc
      arm64: dts: qcom: x1e001de-devkit: fix USB retimer reset polarity

Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: sm8750: Correct clocks property for uart14 node

Konrad Dybcio (8):
      arm64: dts: qcom: x1e80100-romulus: Keep L12B and L15B always on
      arm64: dts: qcom: sdx75: Fix up the USB interrupt description
      arm64: dts: qcom: sdx75: Rename AOSS_QMP to power-management
      arm64: dts: qcom: qcs615: Rename AOSS_QMP to power-management
      arm64: dts: qcom: sc8180x: Rename AOSS_QMP to power-management
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Drop clock-names from PS8830
      arm64: dts: qcom: x1e80100-romulus: Drop clock-names from PS8830
      arm64: dts: qcom: x1e001de-devkit: Drop clock-names from PS8830

Krishna Kurapati (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add orientation gpio

Krzysztof Kozlowski (8):
      arm64: dts: qcom: Use recommended MBN firmware path
      arm64: dts: qcom: sm8750: Add IPCC, SMP2P, AOSS and ADSP
      arm64: dts: qcom: sm8750: Add LPASS macro codecs and pinctrl
      arm64: dts: qcom: sm8750-mtp: Enable ADSP
      arm64: dts: qcom: sm8750-qrd: Enable ADSP
      arm64: dts: qcom: sm8750: Add CDSP
      arm64: dts: qcom: sm8750-mtp: Enable CDSP
      arm64: dts: qcom: sm8750-qrd: Enable CDSP

Lad Prabhakar (1):
      arm64: dts: qcom: Drop `tx-sched-sp` property

Luca Weiss (3):
      arm64: dts: qcom: sm8350: Reenable crypto & cryptobam
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add touchscreen node
      arm64: dts: qcom: sm8650: Fix domain-idle-state for CPU2

Manikanta Mylavarapu (3):
      arm64: dts: qcom: ipq9574: fix the msi interrupt numbers of pcie3
      arm64: dts: qcom: ipq5424: add reserved memory region for bootloader
      arm64: dts: qcom: ipq5424: enable GPIO based LEDs and Buttons

Manish Nagar (1):
      arm64: dts: qcom: qcs8300-ride: Enable second USB controller on QCS8300 Ride

Maud Spierings (2):
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A ports
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable micro-sd card reader

Maulik Shah (2):
      arm64: dts: qcom: sm8750: Fix cluster hierarchy for idle states
      arm64: dts: qcom: qcs8300: Add RPMh sleep stats

Md Sadre Alam (3):
      arm64: dts: qcom: ipq9574: Add SPI nand support
      arm64: dts: qcom: ipq9574: Enable SPI NAND for ipq9574
      arm64: dts: qcom: ipq9574: Remove eMMC node

Neil Armstrong (3):
      arm64: dts: qcom: sm8650: add all 8 coresight ETE nodes
      arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions
      arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs

Pratyush Brahma (1):
      arm64: dts: qcom: qcs8300: Add device node for gfx_smmu

Stephan Gerhold (7):
      arm64: dts: qcom: sm8450: Add missing properties for cryptobam
      arm64: dts: qcom: sm8550: Add missing properties for cryptobam
      arm64: dts: qcom: sm8650: Add missing properties for cryptobam
      arm64: dts: qcom: sa8775p: Add missing properties for cryptobam
      arm64: dts: qcom: ipq9574: Add missing properties for cryptobam
      arm64: dts: qcom: sc8280xp-x13s: Drop duplicate DMIC supplies
      arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC supplies

Taniya Das (1):
      arm64: dts: qcom: qcm6490-idp: Update protected clocks list

Tingguo Cheng (1):
      arm64: dts: qcom: qcs615: remove disallowed property in spmi bus node

Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5424: Enable MMC
      arm64: dts: qcom: ipq9574: Fix USB vdd info

Vikash Garodia (1):
      arm64: dts: qcom: sc7280: drop video decoder and encoder nodes

Vikram Sharma (2):
      arm64: dts: qcom: sc7280: Add support for camss
      arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine

Xilin Wu (1):
      arm64: dts: qcom: sm8250: Fix CPU7 opp table

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +-
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   98 ++
 arch/arm64/boot/dts/qcom/Makefile                  |    6 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |   50 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |    7 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   55 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |   12 -
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   74 +-
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |   25 +
 arch/arm64/boot/dts/qcom/pm8937.dtsi               |    8 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   12 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   21 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |    8 +-
 .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso |   89 ++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |    1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   36 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              |   44 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   17 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |    4 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |    2 -
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |    2 -
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  159 +++
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |   61 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  186 ++-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   22 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   14 -
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |    4 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    4 -
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    4 -
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    4 -
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |  271 +++-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    4 -
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    4 -
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    4 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |    2 -
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    4 -
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |   16 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  |  295 ++++
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |   51 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    8 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    8 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |    6 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   64 +
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |   12 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |    2 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  723 ++++++----
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   14 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   14 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  605 +++++++-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  497 ++++++-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   11 +-
 .../qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts    |   12 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 1126 +--------------
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 1487 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |  142 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |    4 +-
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     |    2 +
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |    3 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |    4 +-
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    3 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |    2 +
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |    1 +
 include/dt-bindings/clock/qcom,ipq9574-nsscc.h     |  152 ++
 include/dt-bindings/reset/qcom,ipq9574-nsscc.h     |  134 ++
 68 files changed, 5189 insertions(+), 1542 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h

