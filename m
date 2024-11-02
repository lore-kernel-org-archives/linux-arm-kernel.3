Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7DCE67819
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 23:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VmyhwcsJB6eQ9NOFuSQ7CbvO/Jiplr6YFjUPysNomKk=; b=hwnPZdXudpPSj6Cbnwfr3ZJcxo
	+mJ4wfwSiU+JnR+bHRhnPG4F4oUljFR26Ebm3Zr5IYYBb/TixbKJnoQScIuHsWcXAtQqtGsCb4R0D
	evU+kdWhTnqF6P22S1lQi4sFt+dTEllqcqGqDJ/kVEVwGwDmpF79hKLALpepDoJguAYeO0Uzb3O9w
	YOTUb7UCCIsJV92PAVI7vyLLy3WUDHSyw7suuGGvmsGvQSiaTKZn8FBGljcXO79wEgEWOnzXzhVIM
	F7qH4lsswGw0mTApLkhN+YqvfR8rOxaiP1xwvJgd/PKIu8hBCwZQq+c7F0ctW61griIhyWkjfNE0s
	NIz69kyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7NR7-0000000AaeG-43n9;
	Sat, 02 Nov 2024 23:21:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7NPR-0000000AaX9-49Pw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 23:19:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E7D4A41693;
	Sat,  2 Nov 2024 23:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B57CC4CEC3;
	Sat,  2 Nov 2024 23:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730589596;
	bh=/BnZgvaqjscf0IvYfmdX4PIdhBAXfbRaWA+hx7RV3fE=;
	h=From:To:Cc:Subject:Date:From;
	b=V8ph0RKJ9/nHSPRyxYP8hMtmj3Jfq+78V3LGhWV0DZ2GKHOA4oQ/iSHPWq/0F1mSW
	 f/eAernmmhsbQ/TyHwv6YWNliDuuEEsSy7YA653OHm1uQtvx5wYWScMWU6/deMdKg3
	 pczg76sQ3lCtXoinx625QxBpmzCai+SQZzdq61ByXhWdP/r9aUgxDqo8AqB/Gg7T5X
	 CR7FZyUvy88+hj8x8siUyAJPlFBPkGNVmBD+kAZ724H3CqJVTbiw59FqTPaR12X2Qp
	 0dbROLlF91p+NDq/i674qvhQRFyYsK2RtpPrMVYDUh1hylA0d3//IyxE3Sqwov/ZQY
	 dx4HGdMnS6MFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nikunj Kela <quic_nkela@quicinc.com>,
	Zhang Zekun <zhangzekun11@huawei.com>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.13
Date: Sat,  2 Nov 2024 18:19:48 -0500
Message-ID: <20241102231953.871067-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_161958_179928_8C00B35E 
X-CRM114-Status: GOOD (  11.26  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.13

for you to fetch changes up to d088afa7de3cbe689954dad49e7058d2c4b8944c:

  soc: qcom: socinfo: add QCS9100 ID (2024-10-29 15:09:02 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v6.13

Enable QSEECOM, and thereby access to EFI variables, for Lenovo Yoga
Slim 7x, Dell XPS 13, Microsoft Surface Pro 9.

Last Level Cache Controller (LLCC) driver code is shuffled, to improve
readability of the tables.

The Qualcomm socinfo driver gains support for QCS615, QCS9100, SAR1130P,
SAR2130P, and SA8255P.

A few drivers are simplified using dev_err_probe() and guard(), and a
few kernel-doc issues are corrected.

Mentioning of the #linux-msm IRC channel is added to the MAINTAINERS
file.

----------------------------------------------------------------
Aleksandrs Vinarskis (1):
      firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345

Bjorn Andersson (1):
      soc: qcom: pd-mapper: Add QCM6490 PD maps

Dan Carpenter (1):
      soc: qcom: geni-se: fix array underflow in geni_se_clk_tbl_get()

Dmitry Baryshkov (4):
      dt-bindings: arm: qcom,ids: add SoC ID for SAR2130P and SAR1130P
      soc: qcom: socinfo: add SoC IDs for SAR1130P and SAR2130P
      dt-bindings: firmware: qcom,scm: Add SAR2130P compatible
      dt-bindings: soc: qcom,aoss-qmp: Add SAR2130P compatible

Jingyi Wang (1):
      dt-bindings: soc: qcom: add qcom,qcs8300-imem compatible

Julia Lawall (1):
      soc: qcom: qmi: Reorganize kerneldoc parameter names

Jérôme de Bretagne (1):
      firmware: qcom: scm: Allow QSEECOM on Microsoft Surface Pro 9 5G

Konrad Dybcio (2):
      soc: qcom: llcc: Use designated initializers for LLC settings
      soc: qcom: smem: Fix up kerneldoc

Krzysztof Kozlowski (4):
      qcom: MAINTAINERS: add linux-msm IRC on OFTC
      soc: qcom: pbs: simplify locking with guard()
      soc: qcom: smem_state: simplify locking with guard()
      dt-bindings: soc: qcom: aoss-qmp: Add SM8750

Kyle Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the QCS8300 AOSS channel

Lijuan Gao (2):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS615
      soc: qcom: socinfo: Add QCS615 SoC ID table entry

Maya Matuszczyk (1):
      firmware: qcom: scm:  Allow QSEECOM on Lenovo Yoga Slim 7x

Nikunj Kela (4):
      dt-bindings: firmware: qcom,scm: document support for SA8255p
      dt-bindings: soc: qcom: aoss-qmp: document support for SA8255p
      dt-bindings: arm: qcom: add the SoC ID for SA8255P
      soc: qcom: socinfo: add support for SA8255P

Tengfei Fan (2):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS9100
      soc: qcom: socinfo: add QCS9100 ID

Zhang Zekun (3):
      soc: qcom: rpmh-rsc: Simplify code with dev_err_probe()
      soc: qcom: smem: Simplify code with dev_err_probe()
      soc: qcom: smp2p: Simplify code with dev_err_probe()

Zhenhua Huang (1):
      dt-bindings: firmware: qcom,scm: document SCM on QCS8300 SoCs

 .../devicetree/bindings/firmware/qcom,scm.yaml     |    4 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |    4 +
 .../devicetree/bindings/sram/qcom,imem.yaml        |    1 +
 MAINTAINERS                                        |    3 +
 drivers/firmware/qcom/qcom_scm.c                   |    3 +
 drivers/soc/qcom/llcc-qcom.c                       | 2644 ++++++++++++++++++--
 drivers/soc/qcom/qcom-geni-se.c                    |    3 +-
 drivers/soc/qcom/qcom-pbs.c                        |   22 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |    1 +
 drivers/soc/qcom/qmi_interface.c                   |    2 +-
 drivers/soc/qcom/rpmh-rsc.c                        |    9 +-
 drivers/soc/qcom/smem.c                            |   16 +-
 drivers/soc/qcom/smem_state.c                      |   12 +-
 drivers/soc/qcom/smp2p.c                           |    9 +-
 drivers/soc/qcom/socinfo.c                         |    5 +
 include/dt-bindings/arm/qcom,ids.h                 |    5 +
 16 files changed, 2432 insertions(+), 311 deletions(-)

