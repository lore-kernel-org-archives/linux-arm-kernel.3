Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A633C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 02:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mcpZdEUb5wzhXEPobgOFA9AgLwu2TstqBEYQ4tUMF8g=; b=cIMDbDeHZM5Mjr5P1D3QfPItgg
	a+pZ8GYXq8PwO5eFt1rK51hsMGF3y1v8GHMUNvx1b5pUat2u1gGsPn5PzE8tr6OVox6EYR/ZszBIO
	UOVj8LcpP1abdbTwXSuZ4LSSUxTmf2Hu7FWQjZ4/9VVlP8qqma5IH7ipJ2JnDgbseGV8/Mm3kYG5I
	EIi+65uQ7c9F3OPv/0iyFbuIIYtYk87lbUhELDSZ/GCcMYafkck/ynHqGZWWufYizbGHWKgDeFC2U
	/3LLDWmDckymn58KFu1K/q03UGwWGbCDBEv7aoa9t2pS1pvS0lwGw+dth3P/YkEsKCgSe7Sl4Zq2f
	MGGOLIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIeSu-00000005DNZ-29tC;
	Sat, 24 May 2025 02:18:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIeQo-00000005DJN-2w5A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 02:16:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36A995C5B45;
	Sat, 24 May 2025 02:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B21C4CEE9;
	Sat, 24 May 2025 02:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748052972;
	bh=/sJKcJB9D2opaHxxN17lki+er3heUMPimrFbx5WTMCk=;
	h=From:To:Cc:Subject:Date:From;
	b=FU8fKMVoRwRryhvNxeKp24m9VO5TYN2pBzyNS/sAZ9QVtr0uvYQ80CGB4ERjbHqWe
	 vhpdVLhfdA4Mo0OLUJ5F2rcpWIM76XJGM7mFVjoXWIqe0OU5ucg4B/PjofakxF3kif
	 oa74QyHqvUL7NsWuPHmIW/4dAmLHWbSamJeoJGzl2bFCeb1Tdoz+bKQ1BjpR/bCaqy
	 kh9KI9An+jLszGHvOJQ1GtGiBAlCBnYlvg+tvioDPsD02uZ5SolWd7KPM4006zrxZ2
	 RPSPTHvrui6EFqBMCh2JeZSN08Dgxf+NtBpHPBlW+K1dvViDnZWiJZ21RbUXMQ8tOC
	 ZwuL0GsDLvXVQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [GIT PULL] Qualcomm clock updates for v6.16
Date: Fri, 23 May 2025 21:16:09 -0500
Message-ID: <20250524021610.18621-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_191614_826449_609C4A60 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.16

for you to fetch changes up to 201bf08ba9e26eeb0a96ba3fd5c026f531b31aed:

  clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks (2025-05-17 19:28:40 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v6.16

Introduce support for the camera clock controller on QCS8300.

Correct wait_val values for a variety of GDSCs, fix X Elite UFS clock
settings, and allow clkaN to be optional in the rpmh clock controller
driver if command db doesn't define it.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge branch '20250324-sm6350-videocc-v2-2-cc22386433f4@fairphone.com' into clk-for-6.16

Imran Shaik (1):
      clk: qcom: Add support for Camera Clock Controller on QCS8300

Konrad Dybcio (1):
      dt-bindings: clock: add SM6350 QCOM video clock bindings

Luca Weiss (4):
      clk: qcom: camcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: dispcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gpucc-sm6350: Add *_wait_val values for GDSCs

Pengyu Luo (1):
      clk: qcom: rpmh: make clkaN optional

Taniya Das (2):
      clk: qcom: gcc: Set FORCE_MEM_CORE_ON for gcc_ufs_axi_clk for 8650/8750
      clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks

Vincent Knecht (1):
      clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for 24 MHz

Wentao Liang (1):
      clk: qcom: Fix missing error check for dev_pm_domain_attach()

 .../devicetree/bindings/clock/qcom,videocc.yaml    |  20 ++++
 drivers/clk/qcom/apcs-sdx55.c                      |   6 +-
 drivers/clk/qcom/camcc-sa8775p.c                   | 103 ++++++++++++++++++++-
 drivers/clk/qcom/camcc-sm6350.c                    |  18 ++++
 drivers/clk/qcom/clk-rpmh.c                        |  11 +++
 drivers/clk/qcom/dispcc-sm6350.c                   |   3 +
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +-
 drivers/clk/qcom/gcc-sm6350.c                      |   6 ++
 drivers/clk/qcom/gcc-sm8650.c                      |   2 +
 drivers/clk/qcom/gcc-sm8750.c                      |   3 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   4 +
 drivers/clk/qcom/gpucc-sm6350.c                    |   6 ++
 include/dt-bindings/clock/qcom,sm6350-videocc.h    |  27 ++++++
 13 files changed, 204 insertions(+), 9 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,sm6350-videocc.h

