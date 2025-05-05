Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C5C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXTos5e4lHHK0kP8vDIreKxfUbGrZqzTYtUPro5FppY=; b=XLdwm7S7+ejnk5OVai7HE9U+9h
	vtqcJI1/YLXPttoH9Y6ciUpCljmjsW9MFs/cWX60UsI82jE1rMPE7TVRTUrWwXGA68C+ZGo5Y9Dv/
	V0MvgcO1f0//7E4gFAmPLbj+USGeVoIrJGWBnYlDXu3BXJVQoA1r/6uGVjLgH1YjxNAC4PwWLTeh+
	PkK2Rvy+ZmitC6n1ytShJcgGbfr9suHDnsA9+EJZFtYNtUik0IoUIcVuFLQjRsh6f0XwkjBAkQaTS
	oqEtTAvSuIAGT4x7uMErFqQCdEXW8UzSTc2V3aycHy8ZB7gc6mxzaQk9X0Kvu3ITlHKY68WokdXWG
	iS4zRo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5w0-00000009EH3-3n1G;
	Tue, 06 May 2025 00:13:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Ko-00000008mRI-3pc4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42C445C5400;
	Mon,  5 May 2025 22:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB42C4CEE4;
	Mon,  5 May 2025 22:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484250;
	bh=W1z9LlLC9I5AttB7l1i4Ia/f9RWJJFje1bqZEjRt27w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=czF5dTQjCC6jiNfCX1hjZwuvtqGecoDnCt6uoxyeB3YEEYL/vau7QTq4P3ctQ4zLN
	 t/6v0VuAkBLJcWpcurSBfj7l7ru1ItfzPAXTZZ6rROUnPWjFoIDWQhJHKGr0TCk/tG
	 fDLRIcCbZMRbKi7FIz2Q+XVPDY8XhWl13AqYVogrLDnikXARcwM0Pbu13hu4e8CIt0
	 EcRA3E9djLEM0YZsgN0fo2brlIWytoR/tQMtlaXeV08UIfskjMKZNGpxyDVjK8Wdh/
	 D6uDN0IEhQTuAYEQDiUG08+BkRsPYSAMLHzI8O2k5DtC0MpqG69mWuQGZqJe2BhWY0
	 SrMB1WKc9qz8w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Siva Durga Prasad Paladugu <siva.durga.prasad.paladugu@amd.com>,
	Nava kishore Manne <nava.kishore.manne@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	ronak.jain@amd.com,
	jay.buddhabhatti@amd.com,
	u.kleine-koenig@baylibre.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 411/642] firmware: xilinx: Dont send linux address to get fpga config get status
Date: Mon,  5 May 2025 18:10:27 -0400
Message-Id: <20250505221419.2672473-411-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153050_992974_9955DFC8 
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
index 720fa8b5d8e95..7356e860e65ce 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1139,17 +1139,13 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_status);
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


