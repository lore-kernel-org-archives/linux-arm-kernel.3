Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09183C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 23:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZlzyBVrrpHSoNJ5eU2hE5y/JgFQ4HPEqyieAgEF9u4U=; b=zuKAwBDFG50tIV/XPi2fGGEHnj
	a0mX7Cq+FnzQpKSAPzcwC3sLVVXYO0nKYsgFcTiyBh0Tbswo1/XC6g+KOVE4WfdJR1USVl1WX325G
	o+lBSimGbDyAs8W6F2dA7zZy/MdTEVAfa69X6DUI9JZOLLTI2rlfd17Uf6cxjH93aiZl0RkxJe90f
	z9FlAffo4Q+8/0CJZbB5N4+uq/FiDkQhlr5jC64PKLgqNNuVCt03ksvxoK6iULVRr7p25nr+ua3Pv
	iFWoIX2dWfiLy7ziY2Zbt12ijKh9hNG/jyUR2IgbMPA+uSLaZ5G3owa7kbrugX2MotsThsyqB5sru
	We5oNJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJqe-00000004BYy-0iaA;
	Mon, 17 Mar 2025 23:26:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJow-00000004BL1-39tg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 23:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E410D5C56FC;
	Mon, 17 Mar 2025 23:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BCFC4CEE3;
	Mon, 17 Mar 2025 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742253873;
	bh=dAk2U2sfsY/rQm35ORj2bH3tfDkpp80tHYe3UuarDzo=;
	h=From:To:Cc:Subject:Date:From;
	b=UvtpHlFd7BCNHE3YfWJqiblOSdto+WgtykkwcB5yaLUQxWHRh3Xiw80Cp8w8d5Msx
	 FFr+jZOyukEILitdGNJqFgr7Akf2sbzRCSwutbSKwqCLE/TLxP1YwCcQX61mU12yU+
	 anl/tDQo8B04nwZh63C/43oUZcUYhs+mkpMJX6cLUuVTWH5WLDo8uIsQwCgJRYRpcA
	 3RXjBC8EpAGH905+D3kNsYSYNF118fZztstodISmyBdKzpjZwhnsqaf18xcQK+boBO
	 y/Gl/3moxquEw1v5KfhZtV5f9l7lpTtnGEVgLD/J4fBgbBmybNVD0xDVit+ffDVhpO
	 z97gDIL4yPVqQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Saravana Kannan <saravanak@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/3] of: Common "memory-region" parsing
Date: Mon, 17 Mar 2025 18:24:20 -0500
Message-ID: <20250317232426.952188-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_162434_850628_C81BF4B8 
X-CRM114-Status: UNSURE (   7.68  )
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

While there's a common function to parse "memory-region" properties for
DMA pool regions, there's not anything for driver private regions. As a
result, drivers have resorted to parsing "memory-region" properties
themselves repeating the same pattern over and over. To fix this, this
series adds 2 functions to handle those cases:
of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().

I've converted the whole tree, but just including remoteproc here as
it has the most cases. I intend to apply the first 2 patches for 6.15
so the driver conversions can be applied for 6.16.

A git tree with all the drivers converted is here[1].

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region

Rob Herring (Arm) (3):
  of: reserved_mem: Add functions to parse "memory-region"
  of: Simplify of_dma_set_restricted_buffer() to use
    of_for_each_phandle()
  remoteproc: Use of_reserved_mem_region_* functions for "memory-region"

 drivers/of/device.c                       | 34 ++++------
 drivers/of/of_reserved_mem.c              | 77 +++++++++++++++++++++++
 drivers/remoteproc/imx_dsp_rproc.c        | 44 +++++--------
 drivers/remoteproc/imx_rproc.c            | 65 ++++++++-----------
 drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++----
 drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++------------
 drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++------------
 drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++-----
 drivers/remoteproc/qcom_wcnss.c           | 23 +++----
 drivers/remoteproc/rcar_rproc.c           | 36 +++++------
 drivers/remoteproc/st_remoteproc.c        | 39 +++++-------
 drivers/remoteproc/stm32_rproc.c          | 42 ++++++-------
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++++-----
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 ++++-----
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 ++++-----
 drivers/remoteproc/xlnx_r5_remoteproc.c   | 49 +++++----------
 include/linux/of_reserved_mem.h           | 26 ++++++++
 17 files changed, 329 insertions(+), 368 deletions(-)

--
2.47.2


