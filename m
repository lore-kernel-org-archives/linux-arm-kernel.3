Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96156C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ienGrWTvdd6zKEIXYDHaFGXqV34LCLMuSb1WZLdttt0=; b=jhCsSAo/cj9EkaIb+S4SjSbM3J
	ajPZxXGl+jLGVJ1Xm4WD9u5fbz5r7mZEwlVk8GZtchJBuI2VANUojLSznAkmhSw4ZNUzGbwG2lmzw
	M67vxDSS21fTjqMQP2Pn98ugXAbfzIA9WjbDOT5tCa8Zb+lsa5wvTIG8bNKHF19DZH3u0TFHQve5u
	bA2YUhuLoCYkl9eauK06c6xg9xlOBEgLATUJFZY/TNSCoaMqKUMXpJhObsiwdZaMmKbxuya4Ixjs8
	FK6OtblTTGlvB0mcU5WauXD94WKZBxWTW53R6oF3xBPrHq56+/ZTaGEe5yGCoj04y8ngRPpKADqQ8
	uEy/CVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Hw-00000005Rsi-1Wj6;
	Tue, 22 Sep 2026 13:12:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Hv-00000005Rsa-1jiz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:11:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D41C060DFD;
	Tue, 22 Sep 2026 13:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFD91F000FF;
	Tue, 22 Sep 2026 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082718;
	bh=ienGrWTvdd6zKEIXYDHaFGXqV34LCLMuSb1WZLdttt0=;
	h=From:To:Cc:Subject:Date;
	b=Qt49J1jXvTA9fPhpuKJiow83uONDOaR0kSiTOaCu2O9cGBI8WtyaFMsUvpJ9oYYsF
	 xf85IA2arRmFPIu9YbjpicrI4v+14LsdG2w3CB7jxgAQretvKJ+jmiuGyBEnzmhwtx
	 7K2bdfhN7ivbDAmk9gt1X4ZNJxMNzmTzJIZvccGEAAfp7u3Puq+rUtssTKd2oFFK+4
	 ZMj1+nDgTkuXIB8iEQjOGnLReZ/IpvrviCwlLLpOJKAQEMuDmegLMBwkhMB2fd4CZJ
	 ZkdRsG//fjCaggZIxme5FdmEIatJzQHZ2NY8jedmBuOFJzShN0bQVS8VqjA9E9hitU
	 Dngj0dICNgEjQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock fixes for v7.3
Date: Tue, 22 Sep 2026 08:11:55 -0500
Message-ID: <20260922131156.358224-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.3

for you to fetch changes up to 55981579b27b6541aeeab81c768f248dba0491ac:

  clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable (2026-08-31 15:08:41 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v7.3

Mark Kaanapali and Glymur GPU CX GDSC's voteable to use the right
programming model.

Fix the PCIE_RSCC clock programming in Eliza, Kaanapali, and Hawi.

----------------------------------------------------------------
Luca Weiss (3):
      clk: qcom: gcc-eliza: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-kaanapali: Fix always-enabling PCIE_RSCC clocks

Taniya Das (2):
      clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
      clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable

 drivers/clk/qcom/gcc-eliza.c       | 6 ++++--
 drivers/clk/qcom/gcc-hawi.c        | 6 ++++--
 drivers/clk/qcom/gcc-kaanapali.c   | 6 ++++--
 drivers/clk/qcom/gpucc-glymur.c    | 2 +-
 drivers/clk/qcom/gpucc-kaanapali.c | 2 +-
 5 files changed, 14 insertions(+), 8 deletions(-)

