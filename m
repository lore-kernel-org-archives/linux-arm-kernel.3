Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B376C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jx7zasuLUVZ+RrQOJyXU/iHGPGIz7MbBeb9Z35S2GMc=; b=1i3WNvQQ8AZkcz
	Jj28G1rmavw5c1RNo1HV5x8l/pGSWVDwIhdDQt25edcvl5Pj8t2el1Ppchyy32tmUvdxiGtKI0BIt
	MXmze4jlGy0Ixz2jx5DpPJx5mSwdK/C9XvtAIwnPN0QSuhy3EM0aLvxghZmEchHILbXi+XoD6EKXa
	TNOA9GRf3LZAqixCpIMxSe4m1G5zQ0oyWVbYeqzZhgOu+9LR+aijUA18epX6R5x/sfDvzfgFvUMlj
	Jrz3wkpoY8gBpJLdlvuIIulZDpsQUyuq5rZSUH5H6K+nFRSkgBcLtjZhzwqp7LOiXnIyk5fXqi2R4
	QNFwXgVspqB/m5onlrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7g1e-0000000Bov7-1d58;
	Wed, 23 Apr 2025 19:44:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fzW-0000000BoPX-3MeU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E03806844A;
	Wed, 23 Apr 2025 19:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C7BC4CEE2;
	Wed, 23 Apr 2025 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745437361;
	bh=TnT5WVpQCYGJKh3P2I4Fm1o0/+22/GE4VkIuIPQ7b/4=;
	h=From:Subject:Date:To:Cc:From;
	b=mrU11t9mU7Qy/iG/bmQPjQWMfW+P79ei4JW5vf9T6v2w9PFz26kb4XMK+F1i8AjjS
	 OekTGSki2lbGXRsIvoWBCAadZprzmI8TkRvJP7iEDr6xj2K1vBmbi5iKx6JBo4Ximo
	 SWhzfvXnCkFBftDegHOUviYnUM31Ea9xJUibEzIf5NwFkZQSB4fBBQq7Qn9QLFIHsp
	 TyILjCOmie9q2AH/VImwHdouqGW3nJNL5PN/GLLSIZFbBirJsJqLvvWbmvJXpSgb44
	 vWBemGESoirKHJnA1GeZ1r/7IExHwiBFFN0aUQrjG7l9DbO2cFXsqehsFa3jfjUxqJ
	 Jx6dxjUaY00Rw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v2 0/4] of: Common "memory-region" parsing
Date: Wed, 23 Apr 2025 14:42:12 -0500
Message-Id: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJRCCWgC/x2MQQ5AMBAAvyJ7tglLHXxFHKoWe2jJVoQ0/q5xn
 GRmEkRW4Qh9kUD5kih7yEBlAW6zYWWUOTNQRaZqqcH5RM9+1weV1yzjRWhpqo2z1rmugVweyov
 c/3UY3/cDrwxX8WUAAAA=
X-Change-ID: 20250423-dt-memory-region-v2-a2b15caacc63
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15-dev
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
it has the most cases. I intend to apply the first 3 patches for 6.16
so the driver conversions can be applied for 6.17.

A git tree with all the drivers converted is here[1].

v2:
- Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
- Export devm_ioremap_resource_wc()
- Rework handling of resource name to drop unit-address from name as it 
  was before.
- Link to v1: 
  https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (4):
      of: reserved_mem: Add functions to parse "memory-region"
      of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
      devres: Export devm_ioremap_resource_wc()
      remoteproc: Use of_reserved_mem_region_* functions for "memory-region"

 drivers/of/device.c                       | 31 +++++-------
 drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
 drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
 drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
 drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
 drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
 drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
 drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
 drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
 drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
 drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
 drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
 include/linux/of_reserved_mem.h           | 26 ++++++++++
 lib/devres.c                              |  1 +
 18 files changed, 339 insertions(+), 369 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250423-dt-memory-region-v2-a2b15caacc63

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


