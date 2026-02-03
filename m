Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D17E8784E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x4Ww3Qu09xzqgxeP4bQd3Q8WPsq0VdcZ9o/BqeRG6iE=; b=WMIiperbymySiC5wKvRuDQPj6B
	JyrSbFTpS9oZ64lmFwq0IIkJvjmOragKHUO/L9XEQ3CwTI+htPIvdJ+SgsRBeFfSfMXtobtgI8BKU
	ZiP/g5eo20vR9ahO149LNJc8DmaRYxaEyf1tX2yVRusi8NiMypS+fs2IhyXNNjvJQ8IBiHc40FfwS
	DczUsuXij+nbtTHlJvPuOJnOWoxvbMSJie6CJucf45hnNULsufcNj3A0pQbXY/qg4jJ0K9QHaW4b4
	Q9bEdKu5x6jCEYNXVz9mWF1yDbfpuYZevrE/MGA5ZX1Ry0w/PUvvCoYO/l0ZFDcOTihcisWep/s00
	phdvzt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnK0j-000000071xn-1sSy;
	Tue, 03 Feb 2026 17:16:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnK0i-000000071xY-1Cz3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 17:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52EEF6013E;
	Tue,  3 Feb 2026 17:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8305AC116D0;
	Tue,  3 Feb 2026 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770138979;
	bh=V+hRYaveht9zKYaY/x1O5Uifx5AVMz4lD+Sn9iPlVes=;
	h=From:To:Cc:Subject:Date:From;
	b=GQ3cEh1/aMEa1eRzUixJkttpRawZoqz4f7u8KkkpBmx7jTWjibs1zj/DH+ViIr621
	 BaVOfdcElW0Jd2Hky6y/TK26NkwP2HwruSO72btzEzmMR2OzqWIYiEyuUaGcT2xTHI
	 O1az1+38QA0ZNAwVwieSa9LZ3XnWePr0nPiaB23h1E61I/XefUWLIoZXyuegyiWjuh
	 c9OTs3K+1dHjBcMX9AhbCmVr9haOH51n2LeczDsMO/t7BwFvwiNiqULBrMEL9XWyt9
	 RhRsyXe8IJgkLXAIl7ATvEE1FUbvn+cbR7sbYyQjNe7HmTlLzCBL8u1YQ/5kwGSh0I
	 FOage/04NqELg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Daniil Titov <daniilt971@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Petr Hodina <petr.hodina@protonmail.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.20
Date: Tue,  3 Feb 2026 11:16:16 -0600
Message-ID: <20260203171616.2830464-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
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


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.20

for you to fetch changes up to 012e012e4917da06b512a3074980c3091949befa:

  clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc (2026-01-28 14:23:35 -0600)

----------------------------------------------------------------
Qualcomm clock updates for v6.20

Convert clock dividers from round_rate() to determine_rate().

Add support for global, tcsr, rpmh, display, gpu, camera, and video
clock controllers for Kaanapali.

Add support for camera clock controller for SM8750.

Fix the SDCC RCGs to use shared_floor_ops across a variety of platforms.

Add support for global clock controller on MSM8940 and SDM439.

----------------------------------------------------------------
Barnabás Czémán (6):
      dt-bindings: clock: gcc-msm8917: Add missing MDSS reset
      clk: qcom: gcc-msm8917: Add missing MDSS reset
      dt-bindings: clock: qcom: Add MSM8940 Global Clock Controller
      dt-bindings: clock: qcom: Add SDM439 Global Clock Controller
      clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_gdsc
      clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from cpp_gdsc

Bjorn Andersson (4):
      Merge branch '20251117-mdss-resets-msm8917-msm8937-v2-1-a7e9bbdaac96@mainlining.org' into clk-for-6.20
      Merge branch '20260103-ufs_symbol_clk-v2-1-51828cc76236@oss.qualcomm.com' into clk-for-6.20
      Merge branch '20251202-sm8750_camcc-v1-2-b3f7ef6723f1@oss.qualcomm.com' into clk-for-6.20
      Merge branch '20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com' into clk-for-6.20

Brian Masney (3):
      clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()

Daniil Titov (2):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8940
      clk: qcom: gcc: Add support for Global Clock controller found on SDM439

David Heidelberg (1):
      clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk1_clk_src

Dmitry Baryshkov (1):
      clk: qcom: gfx3d: add parent to parent request map

George Moussalem (1):
      clk: qcom: gcc-ipq5018: flag sleep clock as critical

Jagadeesh Kona (8):
      clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-x1e80100: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-glymur: Update the SDCC RCGs to use shared_floor_ops

Krzysztof Kozlowski (4):
      clk: qcom: gcc-kaanapali: Fix double array initializer
      clk: qcom: rpmh: Fix double array initializer on Kaanapali
      clk: qcom: videocc-sm8750: Constify qcom_cc_desc
      clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc

Petr Hodina (1):
      clk: qcom: dispcc-sdm845: Enable parents for pixel clocks

Taniya Das (20):
      clk: qcom: rpmh: Update the clock suffix for Glymur
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Add TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing UFS mux clocks
      clk: qcom: gcc-x1e80100: Add missing UFS symbol mux clocks
      clk: qcom: rcg2: compute 2d using duty fraction directly
      dt-bindings: clock: qcom: Add camera clock controller for SM8750 SoC
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
      clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC
      clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
      clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      clk: qcom: Add support for GPUCC and GXCLK for Kaanapali

Vladimir Zapolskiy (2):
      clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
      clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs

 .../bindings/clock/qcom,gcc-msm8953.yaml           |    6 +-
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   11 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |    8 +-
 drivers/clk/qcom/Kconfig                           |   71 +-
 drivers/clk/qcom/Makefile                          |    7 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 +++
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |  454 +++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 +++++++++++++++
 drivers/clk/qcom/camcc-sm8750.c                    | 2710 +++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   41 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/clk-rcg2.c                        |    7 +-
 drivers/clk/qcom/clk-regmap-divider.c              |   16 +-
 drivers/clk/qcom/clk-rpmh.c                        |   60 +-
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 +++++++++++
 drivers/clk/qcom/dispcc-sdm845.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm7150.c                   |    2 +-
 drivers/clk/qcom/gcc-glymur.c                      |    4 +-
 drivers/clk/qcom/gcc-ipq5018.c                     |    1 +
 drivers/clk/qcom/gcc-kaanapali.c                   | 3540 ++++++++++++++++++++
 drivers/clk/qcom/gcc-milos.c                       |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  282 +-
 drivers/clk/qcom/gcc-msm8953.c                     |    1 -
 drivers/clk/qcom/gcc-qdu1000.c                     |    4 +-
 drivers/clk/qcom/gcc-sdx75.c                       |    4 +-
 drivers/clk/qcom/gcc-sm4450.c                      |    6 +-
 drivers/clk/qcom/gcc-sm8450.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8550.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8650.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8750.c                      |    4 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   76 +-
 drivers/clk/qcom/gpucc-kaanapali.c                 |  482 +++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   76 +
 drivers/clk/qcom/tcsrcc-kaanapali.c                |  141 +
 drivers/clk/qcom/videocc-kaanapali.c               |  821 +++++
 drivers/clk/qcom/videocc-sm8750.c                  |    2 +-
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |    2 +
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 +
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   13 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |   30 +
 include/dt-bindings/clock/qcom,sm8750-camcc.h      |  151 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |    3 +
 50 files changed, 14504 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
 create mode 100644 drivers/clk/qcom/cambistmclkcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/cambistmclkcc-sm8750.c
 create mode 100644 drivers/clk/qcom/camcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/camcc-sm8750.c
 create mode 100644 drivers/clk/qcom/dispcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/gcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/gpucc-kaanapali.c
 create mode 100644 drivers/clk/qcom/gxclkctl-kaanapali.c
 create mode 100644 drivers/clk/qcom/tcsrcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/videocc-kaanapali.c
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-camcc.h

