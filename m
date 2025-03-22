Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6A7C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jGmvRDPdct8hEtd49r0XMoJTHvVJ9NhMxWsqqnUbhO4=; b=NywOSymZRUSUnHHkfVJyvaHgVL
	ELqXR2xA2eb01ry8EtzM5bXjF5PCQpBOva6SjMpZcQnzzx3j4tLM+pmvl2LeSueGS5I925H1Cdhrf
	dFouw0RypDE3LBThTL0Tx90lvCPhWrwwyZK9wDo9XR716hpEtbabN51cUfljfWI+Dh/5ALyHkAirt
	bR0edy6DyEZ4WWuyBke49QFnowTEKZHBU0vxQmoVMt+xaDNZLJlZ5fyBp4vMNkjKS5b5Q97oB8+Pz
	H4RVhrnnx48EqDNidqyxaHvDJoOSJJZ2Ddrn57XlXBkudoyjd/uHhzgyiK60MULXkvORthU9mAlNy
	vUCSRhqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvz1m-0000000HSMh-1T9C;
	Sat, 22 Mar 2025 13:36:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvz06-0000000HSFY-0Z3S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 13:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBA1B5C5541;
	Sat, 22 Mar 2025 13:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A75FC4CEDD;
	Sat, 22 Mar 2025 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742650495;
	bh=sa27Dr3nj8EtkcJIe4rcNumqN4yoVa4yO9/KIgGTsYw=;
	h=From:To:Cc:Subject:Date:From;
	b=bSFNrSWoQVf0GnThmgCrx/ycC9c7Eny7DLlpThLZFwUTfHuunjBFmhNPbzfTBfkkb
	 Dz6/3xHcx6VUBULwxJwDrLFxg6t8vr8h+3B0mRhiF9asY/XUdeDYJSTDaQ942LNHVm
	 AcCvyS/w6unQL0+T9vHWW42X2vG5/7oT2PiZSSBaMZxrhgn6BE6LqdJuA+tRkefvXl
	 vmh5MjTGNBUklWA5x3MoKoreEk0dtRrYJc64ez42Ec9/Ht8h7GrA+1m1I/P8hI6vpZ
	 h7N8ieX4TdUf/8r4IP4kXFLnKZbNi6qtVFOxv+od/4KHNFGIWcJCpLLThbnwmWVyGW
	 r6wPSEWAJTTHQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Daniil Titov <daniilt971@gmail.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Jordan Crouse <jorcrous@amazon.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.15
Date: Sat, 22 Mar 2025 08:34:50 -0500
Message-ID: <20250322133453.2723879-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_063458_289569_83C5924A 
X-CRM114-Status: GOOD (  15.66  )
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


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.15

for you to fetch changes up to 9bf3684e0f7e65298ff844fd81e6dc5105c67354:

  clk: qcom: Add NSS clock Controller driver for IPQ9574 (2025-03-17 10:11:45 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v6.15

Support is introduced for associating GDSCs with multiple power-domains,
in order to handle the cases where both (some form of) CX and MX needs
to be voted for.

New support for IPQ9574 NSS clock controller, QCS8300 GPU and video
clock controllers are added, as is RPM clocks for SDM429. LPASS resets
are added for QCM6490.

Branch clock halt halt check is corrected for clocks with voted halt
state.

SM8250 camera clocks are moved to rcg2_shared_ops, to make sure they are
parked when disabled. Missing SDCC resets are added for SDM660. SM8750
global clock controller regmap is adjusted to not trigger a security
violation if the regmap is dumped.

On SM8650 USB GDSCs are moved to retain the state during power down.

The GPU AHB clock and display XO clock are removed from Linux's control
for X Elite, as they shouldn't be managed by the OS.

A few smaller improvements and corrections to the GDSC implementation.

UART frequencies for IPQ5424 are corrected to fix issues with UART flow
control, SDCC apps frequency table is corrected to make the SDCC clock
tick at the expected frequency. IPQ5018 global clock controller is being
allowed to be built on Arm32 as well.

----------------------------------------------------------------
Ajit Pandey (1):
      clk: qcom: clk-branch: Fix invert halt status bit check for votable clocks

Alexey Minnekhanov (3):
      dt-bindings: clock: gcc-sdm660: Add missing SDCC resets
      dt-bindings: clock: gcc-sdm660: Add missing SDCC resets
      clk: qcom: gcc-sdm660: Add missing SDCC block resets

Barnabás Czémán (1):
      clk: qcom: mmcc-sdm660: fix stuck video_subcore0 clock

Bjorn Andersson (4):
      Merge branch '20250212-sdm429-rpm-v1-1-0a24ac19a478@mainlining.org' into clk-for-6.15
      Merge branch '20250203063427.358327-2-alexeymin@postmarketos.org' into clk-for-6.15
      Merge branch '20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com' into clk-for-6.15
      Merge branch '20250313110359.242491-1-quic_mmanikan@quicinc.com' into clk-for-6.15

Bryan O'Donoghue (4):
      clk: qcom: gdsc: Release pm subdomains in reverse add order
      clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
      clk: qcom: common: Add support for power-domain attachment
      clk: qcom: Support attaching GDSCs to multiple parents

Daniil Titov (2):
      dt-bindings: clock: qcom,rpmcc: Add SDM429
      clk: qcom: smd-rpm: Add clocks for SDM429

Devi Priya (4):
      dt-bindings: clock: gcc-ipq9574: Add definition for GPLL0_OUT_AUX
      dt-bindings: clock: Add ipq9574 NSSCC clock and reset definitions
      clk: qcom: gcc-ipq9574: Add support for gpll0_out_aux clock
      clk: qcom: Add NSS clock Controller driver for IPQ9574

Imran Shaik (5):
      dt-bindings: clock: qcom: Add GPU clocks for QCS8300
      dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300
      dt-bindings: clock: qcom: Add QCS8300 video clock controller
      clk: qcom: Add support for GPU Clock Controller on QCS8300
      clk: qcom: Add support for Video Clock Controller on QCS8300

Jordan Crouse (1):
      clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs

Karl Chan (1):
      clk: qcom: ipq5018: allow it to be bulid on arm32

Konrad Dybcio (1):
      clk: qcom: gcc-x1e80100: Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK

Krzysztof Kozlowski (8):
      clk: qcom: clk-alpha-pll: Do not use random stack value for recalc rate
      clk: qcom: Drop unused header includes
      clk: qcom: Add missing header includes
      clk: qcom: dispcc-sm8750: Allow dumping regmap
      clk: qcom: camcc: Constify 'struct qcom_cc_desc'
      clk: qcom: dispcc: Constify 'struct qcom_cc_desc'
      clk: qcom: gpucc: Constify 'struct qcom_cc_desc'
      clk: qcom: videocc: Constify 'struct qcom_cc_desc'

Manikanta Mylavarapu (2):
      clk: qcom: ipq5424: fix software and hardware flow control error of UART
      drivers: clk: qcom: ipq5424: fix the freq table of sdcc1_apps clock

Neil Armstrong (1):
      clk: qcom: gcc-sm8650: Do not turn off USB GDSCs during gdsc_disable()

Taniya Das (4):
      clk: qcom: gdsc: Set retain_ff before moving to HW CTRL
      clk: qcom: gdsc: Update the status poll timeout for GDSC
      dt-bindings: clock: qcom: Add compatible for QCM6490 boards
      clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490

Vladimir Lypak (1):
      clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock

Vladimir Zapolskiy (2):
      dt-bindings: clock: qcom: sm8450-camcc: Remove qcom,x1e80100-camcc leftover
      dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of required-opps

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |    3 +
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   98 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |    6 +-
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |    1 +
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |    5 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    1 -
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    9 +-
 drivers/clk/qcom/Kconfig                           |    9 +-
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sa8775p.c                   |    3 +-
 drivers/clk/qcom/camcc-sc7180.c                    |    2 +-
 drivers/clk/qcom/camcc-sc7280.c                    |    2 +-
 drivers/clk/qcom/camcc-sc8280xp.c                  |    2 +-
 drivers/clk/qcom/camcc-sdm845.c                    |    1 +
 drivers/clk/qcom/camcc-sm4450.c                    |    3 +-
 drivers/clk/qcom/camcc-sm6350.c                    |    1 +
 drivers/clk/qcom/camcc-sm7150.c                    |    1 -
 drivers/clk/qcom/camcc-sm8150.c                    |    4 +-
 drivers/clk/qcom/camcc-sm8250.c                    |   58 +-
 drivers/clk/qcom/camcc-sm8550.c                    |    2 +-
 drivers/clk/qcom/camcc-sm8650.c                    |    2 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |   52 +-
 drivers/clk/qcom/clk-branch.c                      |    4 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |   32 +
 drivers/clk/qcom/common.c                          |    6 +
 drivers/clk/qcom/dispcc-qcm2290.c                  |    3 +-
 drivers/clk/qcom/dispcc-sc7180.c                   |    1 +
 drivers/clk/qcom/dispcc-sc7280.c                   |    1 +
 drivers/clk/qcom/dispcc-sc8280xp.c                 |    7 +-
 drivers/clk/qcom/dispcc-sdm845.c                   |    2 +-
 drivers/clk/qcom/dispcc-sm4450.c                   |    3 +-
 drivers/clk/qcom/dispcc-sm6115.c                   |    3 +-
 drivers/clk/qcom/dispcc-sm6125.c                   |    1 +
 drivers/clk/qcom/dispcc-sm6350.c                   |    1 +
 drivers/clk/qcom/dispcc-sm6375.c                   |    1 +
 drivers/clk/qcom/dispcc-sm7150.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8250.c                   |    2 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |    5 +-
 drivers/clk/qcom/dispcc-sm8550.c                   |    5 +-
 drivers/clk/qcom/dispcc-sm8750.c                   |    4 +-
 drivers/clk/qcom/dispcc0-sa8775p.c                 |    3 +-
 drivers/clk/qcom/dispcc1-sa8775p.c                 |    3 +-
 drivers/clk/qcom/gcc-ipq5424.c                     |   24 +-
 drivers/clk/qcom/gcc-ipq9574.c                     |   15 +
 drivers/clk/qcom/gcc-msm8953.c                     |    2 +-
 drivers/clk/qcom/gcc-msm8960.c                     |    1 -
 drivers/clk/qcom/gcc-msm8974.c                     |    1 -
 drivers/clk/qcom/gcc-sdm660.c                      |    2 +
 drivers/clk/qcom/gcc-sm8650.c                      |    4 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   30 -
 drivers/clk/qcom/gdsc.c                            |   98 +-
 drivers/clk/qcom/gdsc.h                            |    1 +
 drivers/clk/qcom/gpucc-msm8998.c                   |    3 +-
 drivers/clk/qcom/gpucc-sa8775p.c                   |   49 +-
 drivers/clk/qcom/gpucc-sar2130p.c                  |    1 +
 drivers/clk/qcom/gpucc-sc7180.c                    |    1 +
 drivers/clk/qcom/gpucc-sc7280.c                    |    1 +
 drivers/clk/qcom/gpucc-sc8280xp.c                  |    3 +-
 drivers/clk/qcom/gpucc-sdm660.c                    |    5 +-
 drivers/clk/qcom/gpucc-sdm845.c                    |    1 +
 drivers/clk/qcom/gpucc-sm4450.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6350.c                    |    1 +
 drivers/clk/qcom/gpucc-sm8150.c                    |    1 +
 drivers/clk/qcom/gpucc-sm8250.c                    |    1 +
 drivers/clk/qcom/gpucc-sm8350.c                    |    2 +-
 drivers/clk/qcom/gpucc-x1p42100.c                  |    2 +-
 drivers/clk/qcom/kpss-xcc.c                        |    1 -
 drivers/clk/qcom/krait-cc.c                        |    1 -
 drivers/clk/qcom/lpassaudiocc-sc7280.c             |   23 +-
 drivers/clk/qcom/lpasscc-sdm845.c                  |    1 -
 drivers/clk/qcom/lpasscorecc-sc7180.c              |    1 -
 drivers/clk/qcom/lpasscorecc-sc7280.c              |    1 -
 drivers/clk/qcom/mmcc-apq8084.c                    |    2 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |    4 +-
 drivers/clk/qcom/mmcc-msm8974.c                    |    2 +-
 drivers/clk/qcom/mmcc-msm8994.c                    |    3 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |    4 +-
 drivers/clk/qcom/mmcc-msm8998.c                    |    3 +-
 drivers/clk/qcom/mmcc-sdm660.c                     |    8 +-
 drivers/clk/qcom/nsscc-ipq9574.c                   | 3110 ++++++++++++++++++++
 drivers/clk/qcom/videocc-sa8775p.c                 |   10 +-
 drivers/clk/qcom/videocc-sm8350.c                  |    2 +-
 drivers/clk/qcom/videocc-sm8450.c                  |    2 +-
 drivers/clk/qcom/videocc-sm8550.c                  |    2 +-
 include/dt-bindings/clock/qcom,gcc-sdm660.h        |    2 +
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |    1 +
 include/dt-bindings/clock/qcom,ipq9574-nsscc.h     |  152 +
 include/dt-bindings/clock/qcom,qcs8300-camcc.h     |   16 +
 include/dt-bindings/clock/qcom,qcs8300-gpucc.h     |   17 +
 include/dt-bindings/clock/qcom,rpmcc.h             |    4 +
 include/dt-bindings/reset/qcom,ipq9574-nsscc.h     |  134 +
 92 files changed, 3913 insertions(+), 199 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
 create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs8300-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs8300-gpucc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h

