Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEB9C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 21:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kGr8K/Jrp1tAGA/eJJa9wlMW/rBqmhnQFVrb9DVGZWA=; b=WswQDxmRVKfK1molkXgTP/7D12
	T6JxEtc+lCwc3emVoIOXWTKfQ30aeAvEYfshfq0FgDx92bPDLtBx7376N7xm595e3O7+Qa5F+L2Rl
	YaV3bhv2C5eZCiGF7/dDHZD7nBu0dOYZSpvMdMy9/U8pf8mbyb6KAOXpnbx3xtiwoPu72UQTpGHUb
	NtIM+EYuh3Ub752n0o1lQSvsLPcpCgL+QSfqkn0Gk4S1jUALg8eA77+t2MBCN0HZdwkHhTM/S8rB3
	CZkXKY0TKmaEpOJgSiLfwqhceuoejf08CypBz+76jo0Yw446Gp5hZvVwbwg5yiScs1fYnEnGepjN/
	qDZaiyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExeb-0000000DcJ7-0TgQ;
	Tue, 13 May 2025 21:59:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExcU-0000000Dc6y-2CjB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67EBEA4DBB2;
	Tue, 13 May 2025 21:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEC0C4CEE4;
	Tue, 13 May 2025 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747173421;
	bh=ifsMEznsU97LMq4Eq2UBEmojQKdA/27+wMDcWhlnn6Q=;
	h=From:To:Cc:Subject:Date:From;
	b=gKgFkHRqYouv8V6DFWoEDD6fimfsv3H77RNMCkPMV5ZxYIG0qIpLl0kjIHeXJ4kGU
	 kgPj5SuBd+HAMgRzALqbOv/hpekNrk1iBJeja0ZNJBX6HucE1g8sFXUAgG70HoFS8O
	 A4I/V573s7zayAwHPnM46I0xgryGG0e26Dcehcu6NMqKw8VVlOWE2wmK0Z/yIObOZE
	 /57Y5GD4E7/83yOhTLQe9/9PMAngQ7cClHpHVfGEPIOyHoSgk7IZ/6tnxn9LWIXRf+
	 D0Wty/VU1Ob9411cidso2MBaDHjKYnY7AkhUAEuCKKhK90dNDwrj3+yRA2e59hOTAY
	 px/sQBfn85Qgg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Jens Reidel <adrian@mainlining.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.16
Date: Tue, 13 May 2025 22:56:53 +0100
Message-ID: <20250513215656.44448-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145702_696845_F3C3A380 
X-CRM114-Status: GOOD (  10.27  )
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


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.16

for you to fetch changes up to 2c04e58e30ce858cc2be531298312c67c7d55fc3:

  soc: qcom: llcc-qcom: Add support for SM8750 (2025-05-12 22:26:21 +0100)

----------------------------------------------------------------
Qualcomm driver updates for v6.16

Allow list QSEECOM for EFI variable services on on the Asus Zenbook A14,
and block list TZMEM on the SM7150 platform to avoid issues with rmtfs.

Extend the last-level cache (llcc) driver to support version 6 of the
hardware and enable SM8750 support.
Also add socinfo for the SM8750 platform.

Re-enable UCSI support on SC8280XP, now that the reported crash has been
dealt with, and filter the altmode notifications to avoid spurious
hotplug events being propagated to user space.

Add SM7150 support to pd-mapper.

----------------------------------------------------------------
Aleksandrs Vinarskis (1):
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14

Barnabás Czémán (1):
      soc: qcom: smp2p: Fix fallback to qcom,ipc parse

Danila Tikhonov (1):
      firmware: qcom: tzmem: disable sm7150 platform

Dmitry Baryshkov (2):
      dt-bindings: soc: qcom,rpm: add missing clock-controller node
      dt-bindings: soc: qcom: qcom,rpm: add missing clock/-names properties

Jens Reidel (1):
      soc: qcom: pd-mapper: Add support for SM7150

Johan Hovold (2):
      soc: qcom: pmic_glink: enable UCSI on sc8280xp
      soc: qcom: pmic_glink_altmode: fix spurious DP hotplug events

Konrad Dybcio (1):
      dt-bindings: soc: qcom,rpmh-rsc: Limit power-domains requirement

Melody Olvera (3):
      dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      soc: qcom: llcc-qcom: Add support for LLCC V6
      soc: qcom: llcc-qcom: Add support for SM8750

Mukesh Ojha (2):
      dt-bindings: arm: qcom,ids: add SoC ID for SM8750
      soc: qcom: socinfo: add SM8750 SoC ID

Unnathi Chalicheemala (1):
      soc: qcom: smem: Update max processor count

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  15 +
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           |  24 +-
 drivers/firmware/qcom/qcom_scm.c                   |   2 +
 drivers/firmware/qcom/qcom_tzmem.c                 |   1 +
 drivers/soc/qcom/llcc-qcom.c                       | 497 ++++++++++++++++++++-
 drivers/soc/qcom/pmic_glink.c                      |   4 -
 drivers/soc/qcom/pmic_glink_altmode.c              |  30 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |  11 +
 drivers/soc/qcom/smem.c                            |   2 +-
 drivers/soc/qcom/smp2p.c                           |   2 +-
 drivers/soc/qcom/socinfo.c                         |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 include/linux/soc/qcom/llcc-qcom.h                 |   8 +
 14 files changed, 577 insertions(+), 23 deletions(-)

