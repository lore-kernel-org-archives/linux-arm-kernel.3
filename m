Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799AEC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9gS41i4b8bdV8abBVl7zIdw5U02aYbeLimiuCip0iQ=; b=4fkHrNi9lf8YYpufUvbi3Luaru
	vU2TxaaSQ9ajYHWO7STk6MC6PqbBdnXCG87ZaNy0Vld9tQRU5AlS1AVZ2zxrNnDImS2/BCFrqWNOZ
	y5t+hht4nOYveaMFgmixAQoLXtCSpQ1SLz8e2aO72fck5hE/lfRxfx9tnlG+wD3JZj1ZRE0wcDJuL
	kfAF1PF4EnCoWbcqrAnQ9F3nMogTPPn9ynSwsVlREzlqdbp47cNpxxWXW0gVUyk7VyRs6oOsB4BJE
	dzZNyAEjfZJxy8yXK5Kak1bK26WpFH2RgDYlSnLGudfz9RSxitVdvY4u3gjG3AA+K28WoybW7Lxxr
	Py/r2ylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7jK-00000009fmC-21lW;
	Tue, 06 May 2025 02:08:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4eO-00000008shm-10ZI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5C22A4CB9E;
	Mon,  5 May 2025 22:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06CAC4CEED;
	Mon,  5 May 2025 22:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485463;
	bh=qm8pJYqgBS9g9flUCLFZljzZnY4uiLUSesZQ6cB7eEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d6UXE1EHHjNf4DXb919bjcwd7FjnfpvVLp3/X/Ih9E+yFO95vLeHwyERfa8gvPkui
	 NDwE5CIuFYEWGfu6KxIPt5JBjg5azBPn0zpJbdJjj2NkUfV9+G8aiaF1A3nqdI4RME
	 EF6nLlIxy2GHmixp3xefSz7nlYPtulUHiStZgOKKNdrgtF+rX0xpfKuL0fY4cRFx4N
	 R+yJ1f8MlC39uWfiznmbJ0Xk+D0zODBK9v/SyqVHMfJQ1agHQxUxZkkaSPBtDCJj7e
	 iz5KRl+OW/838/RBWUdNYiTl0la5aBWfJzB2u32PJZ74q9crx4RmyNxtUuaoFklddD
	 cvds/QeDubPVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Siva Durga Prasad Paladugu <siva.durga.prasad.paladugu@amd.com>,
	Nava kishore Manne <nava.kishore.manne@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	ronak.jain@amd.com,
	jay.buddhabhatti@amd.com,
	radhey.shyam.pandey@amd.com,
	gregkh@linuxfoundation.org,
	u.kleine-koenig@baylibre.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 325/486] firmware: xilinx: Dont send linux address to get fpga config get status
Date: Mon,  5 May 2025 18:36:41 -0400
Message-Id: <20250505223922.2682012-325-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_155104_345020_CEF64206 
X-CRM114-Status: GOOD (  10.05  )
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

From: Siva Durga Prasad Paladugu <siva.durga.prasad.paladugu@amd.com>

[ Upstream commit 5abc174016052caff1bcf4cedb159bd388411e98 ]

Fpga get config status just returns status through ret_payload and there
is no need to allocate local buf and send its address through SMC args.
Moreover, the address that is being passed till now is linux virtual
address and is incorrect.
Corresponding modification has been done in the firmware to avoid using the
address sent by linux.

Signed-off-by: Siva Durga Prasad Paladugu <siva.durga.prasad.paladugu@amd.com>
Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
Link: https://lore.kernel.org/r/20250207054951.1650534-1-nava.kishore.manne@amd.com
Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/xilinx/zynqmp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index add8acf66a9c7..5578158f13750 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1012,17 +1012,13 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_status);
 int zynqmp_pm_fpga_get_config_status(u32 *value)
 {
 	u32 ret_payload[PAYLOAD_ARG_CNT];
-	u32 buf, lower_addr, upper_addr;
 	int ret;
 
 	if (!value)
 		return -EINVAL;
 
-	lower_addr = lower_32_bits((u64)&buf);
-	upper_addr = upper_32_bits((u64)&buf);
-
 	ret = zynqmp_pm_invoke_fn(PM_FPGA_READ, ret_payload, 4,
-				  XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET, lower_addr, upper_addr,
+				  XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET, 0, 0,
 				  XILINX_ZYNQMP_PM_FPGA_READ_CONFIG_REG);
 
 	*value = ret_payload[1];
-- 
2.39.5


