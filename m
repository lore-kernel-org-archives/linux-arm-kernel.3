Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975B1E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 17:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fUA+nzOuhofPByYOksFe5oxnw5rvXo7PgCuT3Y2Dino=; b=o7AJ/SfuEnUMuzLCZXrpp21/s1
	9a1oq+URJZskMnbJxZdrgmNBt2Hfim+QXc2DNibGQy/43xOYejzTTRpFA30nyjN3tIFfqO6Hg+vT1
	BBcYphwObK0oy5LRUU4iN/EB5ghmxRvfiAIpDgIGOrvEEwAqe3LDHUJRWyp45BeiWLd5KgO9f2+g8
	+WJjm3tLXjjPezHz+FoGzR+qapbELp9mtpx42qPVcNgkixedrv/QioFcCmZgtBXbQb62L/FpgPdN5
	R46GipdSe98cDAOm2DkPO9faXV+ReEHYxnNjDR6yaj7mMoqgicvnhgkmaurtaasNX7dcVRzCKnJUq
	ddaIEBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWfJY-000000019tu-0YDx;
	Sat, 11 Jan 2025 17:30:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWfIH-000000019m2-2sT3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 17:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F8ADA40433;
	Sat, 11 Jan 2025 17:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F364DC4CED3;
	Sat, 11 Jan 2025 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736616544;
	bh=FoUirM8xOeKQ1mLUb8XyHPHSCZyh4byeBxDe/4kah9M=;
	h=From:To:Cc:Subject:Date:From;
	b=oZAvfzHZeU/A328kNSp03Rfe3SuZWrsKvpNLp4yz8VABUjS37eQSIInA/7zK7criO
	 xqKmGXHZ9MfLCLkH22KuH2F+yV0LWmrSmFmdjBmtCpPmSeTf2ZOMwIJK8Up7YN470K
	 vyBErBDR1m8+e0uA9gTC9oJlvaLnAR1zYm76MZQCENIJ/YnZcurbWmA8lAa38Fayq6
	 0HjrWHVC5qoqqdMjcuccu4opuCsMdEeP7fcIMv10BeFTa8F0gw5m/S/ov6AkcgEV45
	 q0mFYZRgMsrMkJ2iv30f+F/UEoUT4fV5ZkDTSQiKr8tjE9VlUk+ebTVG4xlVn59S6E
	 90mb83LpK2eIA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Wasim Nazir <quic_wasimn@quicinc.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Maud Spierings <maud_spierings@hotmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [GIT PULL] Qualcomm driver updates for v6.14
Date: Sat, 11 Jan 2025 11:29:01 -0600
Message-ID: <20250111172901.391774-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_092905_856271_5D3D30BE 
X-CRM114-Status: GOOD (  10.34  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.14

for you to fetch changes up to 1d45a1cd9f3ae849db868e07e5fee5e5b37eff55:

  firmware: qcom: scm: add calls for wrapped key support (2025-01-08 17:11:07 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.14

The Qualcomm SCM drivers gains a number of fixes and improvements
related to race conditions during initialization. QSEECOM and the EFI
variable service therein is enabled for a few 8cx Gen 3 and X Elite
boards.

LLCC driver gains configuration for IPQ5424 and WRCACHE is enabled on X
Elite.

The BCM_TCS_CMD() macro is corrected and is cleaned up.

Support for SM7225 and X 1 Plus are added to the pd-mapper.

pmic_glink and the associated altmode driver are simplied using guards.

socinfo is added for QCS9075 and serial number readout on MSM8916
devices is corrected.

----------------------------------------------------------------
Bartosz Golaszewski (2):
      soc: qcom: rmtfs: allow building the module with COMPILE_TEST=y
      soc: qcom: rmtfs: constify rmtfs_class

Eugen Hristev (1):
      soc: qcom: Rework BCM_TCS_CMD macro

Gaurav Kashyap (1):
      firmware: qcom: scm: add calls for wrapped key support

Jens Glathe (2):
      firmware: qcom: scm: Allow QSEECOM for HP Omnibook X14
      firmware: qcom: scm: Allow QSEECOM for Windows Dev Kit 2023

Konrad Dybcio (3):
      soc: qcom: pd-mapper: Add X1P42100
      firmware: qcom: scm: Allow QSEECOM on X1P42100 CRD
      soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1

Krzysztof Kozlowski (8):
      soc: qcom: pmic_glink: simplify locking with guard()
      soc: qcom: smem_state: fix missing of_node_put in error path
      soc: qcom: pmic_glink_altmode: simplify locking with guard()
      firmware: qcom: scm: Fix missing read barrier in qcom_scm_is_available()
      firmware: qcom: scm: Fix missing read barrier in qcom_scm_get_tzmem_pool()
      firmware: qcom: scm: Cleanup global '__scm' on probe failures
      firmware: qcom: scm: smc: Handle missing SCM device
      firmware: qcom: scm: smc: Narrow 'mempool' variable scope

Kyle Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the qcs615

Lijuan Gao (1):
      dt-bindings: interconnect: qcom-bwmon: Document QCS615 bwmon compatibles

Luca Weiss (1):
      soc: qcom: pd_mapper: Add SM7225 compatible

Manikanta Mylavarapu (1):
      dt-bindings: firmware: qcom,scm: Document ipq5424 SCM

Maud Spierings (1):
      firmware: qcom: scm: Allow QSEECOM on the asus vivobook s15

Pengyu Luo (1):
      firmware: qcom: scm: Allow QSEECOM on Huawei Matebook E Go (sc8280xp)

Qingqing Zhou (1):
      dt-bindings: firmware: qcom,scm: document QCS615 SCM

Stephan Gerhold (1):
      soc: qcom: socinfo: Avoid out of bounds read of serial number

Varadarajan Narayanan (2):
      dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
      soc: qcom: llcc: Update configuration data for IPQ5424

Wasim Nazir (2):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
      soc: qcom: socinfo: add QCS9075 SoC ID

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  20 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   2 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   2 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 drivers/firmware/qcom/qcom_scm-smc.c               |   6 +-
 drivers/firmware/qcom/qcom_scm.c                   | 271 +++++++++++++++++++--
 drivers/firmware/qcom/qcom_scm.h                   |   4 +
 drivers/soc/qcom/Kconfig                           |   2 +-
 drivers/soc/qcom/llcc-qcom.c                       |  58 ++++-
 drivers/soc/qcom/pmic_glink.c                      |  70 +++---
 drivers/soc/qcom/pmic_glink_altmode.c              |  11 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |   2 +
 drivers/soc/qcom/rmtfs_mem.c                       |   2 +-
 drivers/soc/qcom/smem_state.c                      |   3 +-
 drivers/soc/qcom/socinfo.c                         |   3 +-
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 include/linux/firmware/qcom/qcom_scm.h             |   8 +
 include/soc/qcom/tcs.h                             |  26 +-
 18 files changed, 406 insertions(+), 86 deletions(-)

