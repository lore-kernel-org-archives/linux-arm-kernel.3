Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058FBD68BF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sEMnokryldfX1XldS60cSK2diJ6GvhyGPcKxjg9ozVY=; b=sWPr7ehCGvTGzLxdBIFuHQOj3V
	tsSJ8jy/RzuHuC3hpU9nzWp5b+xoMT0zYjOi0+Nwd7GBBZng6PLDnYbTKAinYOoUqACRIOvlHIj3t
	RArHMK147Sdi2BvLIUvCO/U/rsfWtUrYct7d2xpRrACEZ39/bb0d/n4FEaSux6wafB7Gh+ikzV+PT
	VdY4l76ZIf9NlJMRLnxyaixaRKgqtz4FJb3PwX6AkrF8iG8ooPFa2rQyBmGnOafVBwzPUN3arja0F
	qL4fYsUOmAOrVlDRTJhg3fjOXj99eCkBqfzhn3YQm6byTsU6a6RguQuJHCv8FY0oehlLZJfezwAbM
	57iWml4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCLq1-00000005vCj-0U9j;
	Sat, 16 Nov 2024 16:39:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCLp5-00000005v6p-0PZ6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 16:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31B94A406A5;
	Sat, 16 Nov 2024 16:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF6CC4CEC3;
	Sat, 16 Nov 2024 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731775136;
	bh=THeciZJBPS3p0ay6yJsWVLTykpa/po6hSXdreEo/+d4=;
	h=From:To:Cc:Subject:Date:From;
	b=mM0+yP7UAFMPixmn0bhdNjTbZ72Ik6A4c4XgMzShRiV/WxUsRoCyue6DyA1pzy5j9
	 7qjwfnUM7MqjgfTM8g7wuJdCPqFfB16VvIeOWzlHHK99Y/7a39NNdCnsBOntvvzpxz
	 SbbH7hX1q0LoAFrq1LEsj79K32hoKnXtcObu6GAmY38GkIeWaV59ljafd2ygvPEwI4
	 YDRVO795pb2Da1VoZ6DLdS/FFFAABj/QK2tndRFg781MJABVWsjeFL6zHu4hcr+9Yj
	 MjbByS6KPnK5kZdZbB2XpPNA8RXgCZTBC72L1RV2eoBOA0z7FH9VjoCACSXYsE7ePW
	 ExfaZsdNfKm9A==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Danila Tikhonov <danila@jiaxyga.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm clock updates for v6.13
Date: Sat, 16 Nov 2024 10:38:53 -0600
Message-ID: <20241116163854.122610-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_083859_272995_73F6320D 
X-CRM114-Status: GOOD (  12.01  )
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


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.13

for you to fetch changes up to f1f49cc505bc998d7c13e5a518d027419a21fbae:

  clk: qcom: remove unused data from gcc-ipq5424.c (2024-11-11 21:57:38 -0600)

----------------------------------------------------------------
Qualcomm clock updates for v6.13

Add global clock controllers for QCS8300, and IPQ5424.
Add camera, display and video clock controllers for SA8775P.
Add global, display, gpu, tcsr, and rpmh clock controllers for SAR2130P.
Add global, camera, display, gpu, and video clock controllers for
SM8475.

Support for IPQ9574 is added to the Alpha PLL clock driver, and the
checks for already configured PLL at boot are cleaned up.

QCS404 GPLL3 initial rate is corrected.

A new ops for shared rcg2 floor_ops is introduced, for dealing with
shared SDCC clocks.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: qcom: remove unused data from gcc-ipq5424.c

Bjorn Andersson (5):
      Merge branch '20240818204348.197788-1-danila@jiaxyga.com' into clk-for-6.13
      Merge branch '20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com' into clk-for-6.13
      Merge branch '20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org' into clk-for-6.13
      Merge branch '20241028060506.246606-3-quic_srichara@quicinc.com' into clk-for-6.13
      Merge branch '20240822-qcs8300-gcc-v2-1-b310dfa70ad8@quicinc.com' into clk-for-6.13

Danila Tikhonov (10):
      dt-bindings: clock: qcom,gcc-sm8450: Add SM8475 GCC bindings
      dt-bindings: clock: qcom,sm8450-dispcc: Add SM8475 DISPCC bindings
      dt-bindings: clock: qcom,sm8450-gpucc: Add SM8475 GPUCC bindings
      dt-bindings: clock: qcom,sm8450-videocc: Add SM8475 VIDEOCC bindings
      dt-bindings: clock: qcom,sm8450-camcc: Add SM8475 CAMCC bindings
      clk: qcom: gcc-sm8450: Add SM8475 support
      clk: qcom: dispcc-sm8450: Add SM8475 support
      clk: qcom: gpucc-sm8450: Add SM8475 support
      clk: qcom: videocc-sm8450: Add SM8475 support
      clk: qcom: camcc-sm8450: Add SM8475 support

Devi Priya (1):
      clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574

Dmitry Baryshkov (9):
      dt-bindings: clock: qcom,rpmhcc: Add SAR2130P compatible
      dt-bindings: clock: qcom: document SAR2130P Global Clock Controller
      dt-bindings: clock: qcom,sm8550-tcsr: Add SAR2130P compatible
      dt-bindings: clock: qcom,sm8550-dispcc: Add SAR2130P compatible
      clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
      clk: qcom: rpmh: add support for SAR2130P
      clk: qcom: add support for GCC on SAR2130P
      clk: qcom: tcsrcc-sm8550: add SAR2130P support
      clk: qcom: dispcc-sm8550: enable support for SAR2130P

Gabor Juhos (1):
      clk: qcom: gcc-qcs404: fix initial rate of GPLL3

Imran Shaik (2):
      dt-bindings: clock: qcom: Add GCC clocks for QCS8300
      clk: qcom: Add support for Global Clock Controller on QCS8300

Johan Hovold (2):
      clk: qcom: clk-alpha-pll: drop lucid-evo pll enabled warning
      clk: qcom: clk-alpha-pll: fix lucid 5lpe pll enabled check

Jonathan Marek (1):
      clk: qcom: videocc-sm8550: depend on either gcc-sm8550 or gcc-sm8650

Konrad Dybcio (3):
      clk: qcom: Make GCC_6125 depend on QCOM_GDSC
      dt-bindings: clk: qcom,sm8450-gpucc: add SAR2130P compatibles
      clk: qcom: add SAR2130P GPU Clock Controller support

Krzysztof Kozlowski (1):
      clk: qcom: constify static 'struct qcom_icc_hws_data'

Manikanta Mylavarapu (4):
      clk: qcom: ipq5332: remove q6 bring up clocks
      clk: qcom: ipq9574: remove q6 bring up clocks
      dt-bindings: clock: qcom: gcc-ipq5332: remove q6 bring up clock macros
      dt-bindings: clock: qcom: gcc-ipq9574: remove q6 bring up clock macros

Sricharan Ramabadhran (2):
      dt-bindings: clock: Add Qualcomm IPQ5424 GCC binding
      clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC

Taniya Das (6):
      dt-bindings: clock: qcom: Add SA8775P video clock controller
      dt-bindings: clock: qcom: Add SA8775P camera clock controller
      dt-bindings: clock: qcom: Add SA8775P display clock controllers
      clk: qcom: Add support for Video clock controller on SA8775P
      clk: qcom: Add support for Camera Clock Controller on SA8775P
      clk: qcom: Add support for Display clock Controllers on SA8775P

 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |    4 +-
 .../bindings/clock/qcom,ipq5332-gcc.yaml           |   41 +-
 .../bindings/clock/qcom,qcs8300-gcc.yaml           |   66 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |   62 +
 .../bindings/clock/qcom,sa8775p-dispcc.yaml        |   79 +
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |   62 +
 .../bindings/clock/qcom,sar2130p-gcc.yaml          |   65 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    1 +
 .../bindings/clock/qcom,sm8450-dispcc.yaml         |    1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    1 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 drivers/clk/qcom/Kconfig                           |   88 +-
 drivers/clk/qcom/Makefile                          |    7 +
 drivers/clk/qcom/camcc-sa8775p.c                   | 1868 ++++++++++
 drivers/clk/qcom/camcc-sm8450.c                    |  294 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |   23 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
 drivers/clk/qcom/clk-rcg.h                         |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |   48 +-
 drivers/clk/qcom/clk-rpmh.c                        |   13 +
 drivers/clk/qcom/common.h                          |    2 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |   66 +-
 drivers/clk/qcom/dispcc-sm8550.c                   |   18 +-
 drivers/clk/qcom/dispcc0-sa8775p.c                 | 1481 ++++++++
 drivers/clk/qcom/dispcc1-sa8775p.c                 | 1481 ++++++++
 drivers/clk/qcom/gcc-ipq5332.c                     |  382 +-
 drivers/clk/qcom/gcc-ipq5424.c                     | 3291 ++++++++++++++++++
 drivers/clk/qcom/gcc-ipq9574.c                     |  328 +-
 drivers/clk/qcom/gcc-qcs404.c                      |    1 +
 drivers/clk/qcom/gcc-qcs8300.c                     | 3640 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sar2130p.c                    | 2366 +++++++++++++
 drivers/clk/qcom/gcc-sm8450.c                      |  181 +-
 drivers/clk/qcom/gpucc-sar2130p.c                  |  502 +++
 drivers/clk/qcom/gpucc-sm8450.c                    |   50 +-
 drivers/clk/qcom/tcsrcc-sm8550.c                   |   18 +-
 drivers/clk/qcom/videocc-sa8775p.c                 |  576 ++++
 drivers/clk/qcom/videocc-sm8450.c                  |   48 +-
 include/dt-bindings/clock/qcom,gcc-sm8450.h        |    3 +
 include/dt-bindings/clock/qcom,ipq5332-gcc.h       |   20 -
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |  156 +
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |   18 -
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       |  234 ++
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     |  108 +
 include/dt-bindings/clock/qcom,sa8775p-dispcc.h    |   87 +
 include/dt-bindings/clock/qcom,sa8775p-videocc.h   |   47 +
 include/dt-bindings/clock/qcom,sar2130p-gcc.h      |  185 +
 include/dt-bindings/clock/qcom,sar2130p-gpucc.h    |   33 +
 include/dt-bindings/reset/qcom,ipq5424-gcc.h       |  310 ++
 include/dt-bindings/reset/qcom,sar2130p-gpucc.h    |   14 +
 52 files changed, 17573 insertions(+), 804 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sar2130p-gcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sa8775p.c
 create mode 100644 drivers/clk/qcom/dispcc0-sa8775p.c
 create mode 100644 drivers/clk/qcom/dispcc1-sa8775p.c
 create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
 create mode 100644 drivers/clk/qcom/gcc-qcs8300.c
 create mode 100644 drivers/clk/qcom/gcc-sar2130p.c
 create mode 100644 drivers/clk/qcom/gpucc-sar2130p.c
 create mode 100644 drivers/clk/qcom/videocc-sa8775p.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs8300-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,sar2130p-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sar2130p-gpucc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,sar2130p-gpucc.h

