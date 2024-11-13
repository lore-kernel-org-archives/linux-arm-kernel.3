Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDAED597DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 03:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AOUAWH6pV1fsYko+Yxr0f+QFCTZ+RX3OpT/Dx5oR4KQ=; b=bQValHn4Wh4DbxQIbMt9DWZ5qG
	mAw02tvdU9XfW6cNNp31d5II5IHIjs+GW2F8NUiWauYy9hwVAttXZBMA6OqIBfU+jewZbI4fsHR1n
	F7efe9hfrI5VJIBawQGTAePTDZ5JBqyzboXeCyeF7cFzRlZs0htXLtsY+F0pddSMGMBV98KlaAOxq
	IKt98FMiODjym7iggLnVNknghQ0BxC6+3qyNxrwQURCZWL2OmNwxsIF9aoprqy/MDNhBFqW8fX91v
	UMjiV1UougVU6c97TGV3dgAaMGJYzoUR3UCUeQSEfhPtaxTb08/LTwYOR+H1PY51dpZoGhZQJZASh
	/D0KpXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB41M-00000005fx0-16Mc;
	Wed, 13 Nov 2024 03:26:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB3zY-00000005frI-2S4g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 03:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EA4AA40F87;
	Wed, 13 Nov 2024 03:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1092FC4CECF;
	Wed, 13 Nov 2024 03:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731468267;
	bh=ZYSRn4jhHEScLQY/RV9Zp1TTf0al4w/RdxqA8X4W1h4=;
	h=From:To:Cc:Subject:Date:From;
	b=UhY5xhK9SMnm68gF5pphZ74bThArxDM9WxtmB3hHSYWaoLtR7ZvDmyenHh/37OznC
	 qE0w7bEtm6JMdk4q7K3abST8Zax8cpyM+X+znZipQkA5wDiu0GT9aQtvzrpAQruR0+
	 zWF4yafDpe/cYEnupQsJ7LXn4VPij0fKi3XiLQOXDxUxkGDTV8P65W4mny0zlgBiyL
	 t3l44w8g02txnAt4xYUWpqAPWQCxMfYwEy8rr1HS9edhliY+ifzrAA8F08rDuuAod7
	 QKlHAOaSw3b+nYWcPOIgY4BHIjbgR0OXGErwa8fbFUIhRDyjOIwBH8ai93FsTCRzFW
	 kSPkKy0XxhN1w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Song Xue <quic_songxue@quicinc.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: [GIT PULL] A few more Qualcomm driver updates for v6.13
Date: Tue, 12 Nov 2024 21:24:22 -0600
Message-ID: <20241113032425.356306-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_192428_770659_4390C385 
X-CRM114-Status: GOOD (  10.30  )
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


The following changes since commit d088afa7de3cbe689954dad49e7058d2c4b8944c:

  soc: qcom: socinfo: add QCS9100 ID (2024-10-29 15:09:02 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.13-2

for you to fetch changes up to 54a8cd0f92068a3718092f68c8ae99e2078f44b6:

  soc: qcom: ice: Remove the device_link field in qcom_ice (2024-11-11 22:03:30 -0600)

----------------------------------------------------------------
A few more Qualcomm driver updates for v6.13

Make the Adreno driver invoke the SMMU aperture setup firmware function,
which is required to allow the GPU to manage per-process page tables in
some firmware versions - as an example Rb3Gen2 has no GPU without this.

Add X1E Devkit to the list of devices that has functional EFI variable
access through the uefisecapp.

Flip the "manual slice configuration quirk" in the Qualcomm LLCC driver,
as this only applies to a single platform, and introduce support for
QCS8300, QCS615, SAR2130P, and SAR1130P.

Lastly, add IPQ5424 and IPQ5404 to the Qualcomm socinfo driver.

----------------------------------------------------------------
Bjorn Andersson (2):
      firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
      drm/msm/adreno: Setup SMMU aparture for per-process page table

Dmitry Baryshkov (3):
      dt-bindings: cache: qcom,llcc: document SAR2130P and SAR1130P
      soc: qcom: llcc: use deciman integers for bit shift values
      soc: qcom: llcc: add support for SAR2130P and SAR1130P

Jingyi Wang (2):
      dt-bindings: cache: qcom,llcc: Document the QCS8300 LLCC
      soc: qcom: llcc: Add LLCC configuration for the QCS8300 platform

Joe Hattori (1):
      soc: qcom: ice: Remove the device_link field in qcom_ice

Konrad Dybcio (1):
      soc: qcom: llcc: Flip the manual slice configuration condition

Manikanta Mylavarapu (2):
      dt-bindings: arm: qcom,ids: add SoC ID for IPQ5424/IPQ5404
      soc: qcom: socinfo: add IPQ5424/IPQ5404 SoC ID

Melody Olvera (1):
      dt-bindings: firmware: qcom,scm: Document sm8750 SCM

Sibi Sankar (1):
      firmware: qcom: uefisecapp: Allow X1E Devkit devices

Song Xue (2):
      dt-bindings: cache: qcom,llcc: Document the QCS615 LLCC
      soc: qcom: llcc: Add configuration data for QCS615

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  32 ++
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   2 +
 drivers/firmware/qcom/qcom_scm.c                   |  27 +
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  11 +
 drivers/soc/qcom/ice.c                             |   6 +-
 drivers/soc/qcom/llcc-qcom.c                       | 615 +++++++++++++++++++--
 drivers/soc/qcom/socinfo.c                         |   2 +
 include/dt-bindings/arm/qcom,ids.h                 |   2 +
 include/linux/firmware/qcom/qcom_scm.h             |   2 +
 include/linux/soc/qcom/llcc-qcom.h                 |  12 +
 11 files changed, 676 insertions(+), 36 deletions(-)

