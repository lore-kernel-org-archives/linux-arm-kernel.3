Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F35E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RvbDxQ4A1EptjobRaqpc7o/EgCwdWFn22hfbMU2HugI=; b=vUAf88tpqd4UwByqNmKZUWKUlc
	NLSlYBxihPLjsjq2rMVscgDR/IM824vuVr0eIMIn4nLCJ6xlC2PsMN5w/2YQ15+Vydvwh3Z3xoFOp
	nH1cxEbLtl/3ZXAh2TBaG+7hSj56Bahgz2pRsAYsAVSkVUYZ2gSpDnhhcu8EyQ5m3SNNrkmGcexyw
	lOpDu71B9gAgo8WbzQXYefdGWdgTgpRW2ZQAIfyIdoToYraaZWbHQdG+rZfT+tFywcve6GK+d4Y8r
	BIIKXs+fePE1o+5aEZjcbcOmPtDFoG3NSFnqjnN/yG59kkpol9zWGIXSFKMYHx+gxlw3ybDJaz/iu
	vYwz3EGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWg6V-00000001Dje-2N8J;
	Sat, 11 Jan 2025 18:20:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWg5F-00000001DeF-3gZE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42ECD5C0772;
	Sat, 11 Jan 2025 18:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8ABC4CED2;
	Sat, 11 Jan 2025 18:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736619580;
	bh=Jiclm/UQrXSwf/i0YUvttU0i7gkLxfi8RMB/r2lWy30=;
	h=From:To:Cc:Subject:Date:From;
	b=P0I4plFlvx0EYAM31oyAw+YjWu46feh122zSpPQWEIoark1B3CL8sFE0mus7sHTsZ
	 5VSNHjsgdml03T+t491Dw0ixoOYq5dYgliIzMKzL+DidUHJy0jMJ970YDsa4CH6+lj
	 tmwOc0nlqV7NGx3CrchFUJnGg6wsb8K/GyeTFgTsW4iZL3BV9NGW/YxoZbXqPsm9Hu
	 a+qVCpD+GU7jhs4zZcOFOR4xCNFZiNQPMbqzRlCL1KS442aNmlu9cQaF/xzhfNe96y
	 4Jv+yg16vFV8bmIHJNl6J9RIGLU0kUMUPsK9QGcbiR6wqUVEwTfog0VkiiuO7mMxYp
	 CkzbZtPJaI6dQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Daniil Titov <daniilt971@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Anastasia Belova <abelova@astralinux.ru>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.14
Date: Sat, 11 Jan 2025 12:19:37 -0600
Message-ID: <20250111181938.395276-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_101942_011915_3E951EA5 
X-CRM114-Status: GOOD (  12.52  )
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


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.14

for you to fetch changes up to 5e419033b5cb20f9150bfec15dc6cdf10049e654:

  clk: qcom: Select CLK_X1E80100_GCC in config CLK_X1P42100_GPUCC (2025-01-07 22:45:19 -0600)

----------------------------------------------------------------
Qualcomm clock updates for v6.14

Introduce support for IPQ CMN PLL, SM6115 LPASS clock controller, SM750
global, tcsr, rpmh, and display clock controllers. GPU clock controller
for X Plus, global and rpmh clock controller for QCS615. RPM clocks are
added for MSM8937 and MSM8940.

Support for Pongo and Taycan Alpha PLLs are added, together with a few
fixes to the existing support. X Elite Titan GDSCs relationship is
described.

SM8550 and SM8650 PCIe GDSCs and X Elite USB GDSC are marked at
retention/on.

SDM845 general purpose clock is improved to allow more arbitrary
frequencies.

IPQ5424 introduces interconnects for NoC-related clocks.

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: gcc-x1e80100: Do not turn off usb_2 controller GDSC

Amit Pundir (1):
      clk: qcom: gcc-sdm845: Do not use shared clk_ops for QUPs

Anastasia Belova (1):
      clk: qcom: clk-rpmh: prevent integer overflow in recalc_rate

Bjorn Andersson (5):
      Merge branch '20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com' into clk-for-6.14
      Merge branch '20241221-topic-x1p4_clk-v1-2-dbaeccb74884@oss.qualcomm.com' into clk-for-6.14
      Merge branch '20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com' into clk-for-6.14
      Merge branch '20250106-sm8750-dispcc-v2-1-6f42beda6317@linaro.org' into clk-for-6.14
      Merge branch '20250103-qcom_ipq_cmnpll-v8-1-c89fb4d4849d@quicinc.com' into clk-for-6.14

Bryan O'Donoghue (2):
      clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the parent GDSC of subordinate GDSCs
      dt-bindings: clock: move qcom,x1e80100-camcc to its own file

Daniil Titov (4):
      dt-bindings: clock: qcom,rpmcc: Add MSM8937 compatible
      clk: qcom: smd-rpm: Add clocks for MSM8937
      dt-bindings: clock: qcom,rpmcc: Add MSM8940 compatible
      clk: qcom: smd-rpm: Add clocks for MSM8940

Dmitry Baryshkov (4):
      dt-bindings: clock: qcom,mmcc: support LVDS PLL input for apq8064
      dt-bindings: clock: qcom,mmcc-msm8960: add LCDC-related clocks
      clk: qcom: rcg: add 1/1 pixel clock ratio
      clk: qcom: mmcc-msm8960: handle LVDS clock

Dzmitry Sankouski (3):
      clk: qcom: clk-rcg2: document calc_rate function
      clk: qcom: clk-rcg2: split __clk_rcg2_configure function
      clk: qcom: gcc-sdm845: Add general purpose clock ops

Gabor Juhos (6):
      clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from IPQ5018 PLL config
      clk: qcom: apps-ipq-pll: drop 'alpha_en_mask' from IPQ5332 PLL config
      clk: qcom: gcc-ipq6018: remove alpha values from NSS Crypto PLL's config
      clk: qcom: dispcc-qcm2290: remove alpha values from disp_cc_pll0_config
      clk: qcom: dispcc-sm6115: remove alpha values from disp_cc_pll0_config
      clk: qcom: clk-alpha-pll: fix alpha mode configuration

Konrad Dybcio (6):
      dt-bindings: clock: qcom,x1e80100-gpucc: Extend for X1P42100
      dt-bindings: clock: qcom,x1e80100-gcc: Add X1P42100
      clk: qcom: Add X1P42100 GPUCC driver
      clk: qcom: Make GCC_8150 depend on QCOM_GDSC
      dt-bindings: clock: Add Qualcomm SM6115 LPASS clock controller
      clk: qcom: Add SM6115 LPASSCC

Krzysztof Kozlowski (8):
      dt-bindings: clock: qcom,sc7280-lpasscorecc: order properties to match convention
      dt-bindings: clock: qcom,sc7280-lpasscorecc: add top-level constraints
      clk: qcom: rpm: simplify locking with guard()
      clk: qcom: smd-rpm: simplify locking with guard()
      clk: qcom: spmi-pmic-div: simplify locking with guard()
      dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750 DISPCC
      clk: qcom: clk-alpha-pll: Add Pongo PLL
      clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller

Luca Weiss (2):
      clk: qcom: gcc-sm6350: Add missing parent_map for two clocks
      clk: qcom: dispcc-sm6350: Add missing parent_map for a clock

Lukas Bulwahn (1):
      clk: qcom: Select CLK_X1E80100_GCC in config CLK_X1P42100_GPUCC

Luo Jie (2):
      dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
      clk: qcom: Add CMN PLL clock controller driver for IPQ SoC

Manikanta Mylavarapu (4):
      clk: qcom: ipq5424: remove apss_dbg clock
      dt-bindings: clock: qcom: gcc-ipq5424: remove apss_dbg clock macro
      dt-bindings: clock: qcom: gcc-ipq5424: add gcc_xo_clk macro
      clk: qcom: ipq5424: add gcc_xo_clk

Manivannan Sadhasivam (2):
      clk: qcom: gcc-sm8550: Do not turn off PCIe GDSCs during gdsc_disable()
      clk: qcom: gcc-sm8650: Do not turn off PCIe GDSCs during gdsc_disable()

Richard Acayan (1):
      dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible

Satya Priya Kakitapalli (1):
      clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg

Taniya Das (12):
      dt-bindings: clock: qcom: Add QCS615 GCC clocks
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS615
      clk: qcom: rpmhcc: Add support for QCS615 Clocks
      clk: qcom: gcc: Add support for QCS615 GCC clocks
      dt-bindings: clock: qcom: Add SM8750 GCC
      dt-bindings: clock: qcom: Document the SM8750 TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for SM8750
      clk: qcom: rpmh: Sort the match table alphabetically
      clk: qcom: rpmh: Add support for SM8750 rpmh clocks
      clk: qcom: clk-alpha-pll: Add support for controlling Taycan PLLs
      clk: qcom: Add support for GCC on SM8750
      clk: qcom: Add TCSR clock driver for SM8750

Varadarajan Narayanan (2):
      dt-bindings: interconnect: Add Qualcomm IPQ5424 support
      clk: qcom: ipq5424: Use icc-clk for enabling NoC related clocks

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   77 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |    4 +
 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    4 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |   27 +-
 .../bindings/clock/qcom,sdm845-camcc.yaml          |    6 +-
 .../bindings/clock/qcom,sm6115-lpasscc.yaml        |   46 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 -
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    1 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    4 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |   62 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   74 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |    6 +-
 drivers/clk/qcom/Kconfig                           |   65 +
 drivers/clk/qcom/Makefile                          |    7 +
 drivers/clk/qcom/apss-ipq-pll.c                    |    3 +-
 drivers/clk/qcom/camcc-x1e80100.c                  |    7 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  181 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   13 +
 drivers/clk/qcom/clk-rcg.c                         |    1 +
 drivers/clk/qcom/clk-rcg.h                         |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |  198 +-
 drivers/clk/qcom/clk-rpm.c                         |   27 +-
 drivers/clk/qcom/clk-rpmh.c                        |   47 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |   81 +-
 drivers/clk/qcom/clk-spmi-pmic-div.c               |   13 +-
 drivers/clk/qcom/dispcc-qcm2290.c                  |    2 -
 drivers/clk/qcom/dispcc-sm6115.c                   |    2 -
 drivers/clk/qcom/dispcc-sm6350.c                   |    7 +-
 drivers/clk/qcom/dispcc-sm8750.c                   | 1963 ++++++++++++
 drivers/clk/qcom/gcc-ipq5424.c                     |   57 +-
 drivers/clk/qcom/gcc-ipq6018.c                     |    4 +-
 drivers/clk/qcom/gcc-mdm9607.c                     |    2 +-
 drivers/clk/qcom/gcc-qcs615.c                      | 3034 ++++++++++++++++++
 drivers/clk/qcom/gcc-sdm845.c                      |   43 +-
 drivers/clk/qcom/gcc-sm6350.c                      |   22 +-
 drivers/clk/qcom/gcc-sm8550.c                      |    8 +-
 drivers/clk/qcom/gcc-sm8650.c                      |    8 +-
 drivers/clk/qcom/gcc-sm8750.c                      | 3274 ++++++++++++++++++++
 drivers/clk/qcom/gcc-x1e80100.c                    |    2 +-
 drivers/clk/qcom/gpucc-x1p42100.c                  |  587 ++++
 drivers/clk/qcom/ipq-cmn-pll.c                     |  435 +++
 drivers/clk/qcom/lpasscc-sm6115.c                  |   85 +
 drivers/clk/qcom/mmcc-msm8960.c                    |   61 +-
 drivers/clk/qcom/tcsrcc-sm8750.c                   |  141 +
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |   22 +
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |    2 +-
 include/dt-bindings/clock/qcom,mmcc-msm8960.h      |    2 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 ++
 include/dt-bindings/clock/qcom,sm6115-lpasscc.h    |   15 +
 include/dt-bindings/clock/qcom,sm8750-dispcc.h     |  112 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h        |  226 ++
 include/dt-bindings/clock/qcom,sm8750-tcsr.h       |   15 +
 include/dt-bindings/clock/qcom,x1e80100-gpucc.h    |   13 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |   24 +
 57 files changed, 11254 insertions(+), 145 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8750.c
 create mode 100644 drivers/clk/qcom/gcc-qcs615.c
 create mode 100644 drivers/clk/qcom/gcc-sm8750.c
 create mode 100644 drivers/clk/qcom/gpucc-x1p42100.c
 create mode 100644 drivers/clk/qcom/ipq-cmn-pll.c
 create mode 100644 drivers/clk/qcom/lpasscc-sm6115.c
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8750.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs615-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-tcsr.h
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq5424.h

