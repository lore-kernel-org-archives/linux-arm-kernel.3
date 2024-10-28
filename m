Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4B3D1359F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9/PxflEPwF6+1L1C6bU97/eFTtUoLxleMmEpxSkV/U=; b=iSD7tGosOzKy+h48XhAXFHZVqi
	jvjrNad+gg5FjQyzJtpaMRQM47LvgQFlFDS3f2w5v2heFfxx1iag3eWX6IICdTgIB21gsa2xgxdyh
	3HoVmmrpNCO+VaO9Q7zP5LcdAdKIekZDRAynwChYkQNPWjDA67E8S9odl6h2aIT/ojE7v6dpDONU3
	2zumbncNlQ5/0H2RNsgoCR8v2BkGZHFGEyyWBoDkuaKkVsHt+HJgPUJ8iEppSN8wr7GlDCQv1mcOB
	mUzkFfKnxFSCcBgyVs8rF/6p1y8xZFth78wOPfVxcmWzixKXtutZ1vgG3QrQYd9Bl0UoKqh65Vq3P
	DiKqfntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OeX-0000000Ahy7-3Bhv;
	Mon, 28 Oct 2024 12:15:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ORy-0000000Af4S-2j7N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:02:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14E35497;
	Mon, 28 Oct 2024 05:02:52 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6767D3F73B;
	Mon, 28 Oct 2024 05:02:20 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	dan.carpenter@linaro.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 7/7] firmware: arm_scmi: Use vendor string in max-rx-timeout-ms
Date: Mon, 28 Oct 2024 12:01:51 +0000
Message-ID: <20241028120151.1301177-8-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028120151.1301177-1-cristian.marussi@arm.com>
References: <20241028120151.1301177-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_050222_751902_7B3BEDE5 
X-CRM114-Status: UNSURE (   9.74  )
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

The original optional property was missing a vendor string prefix; this
has been rectified.

Fix the naming of such optional property in code too.

Cc: Peng Fan <peng.fan@nxp.com>
Fixes: 1780e411ef94 ("firmware: arm_scmi: Use max-rx-timeout-ms from devicetree")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 9bc1bb7caa55..eed73000c902 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3044,10 +3044,10 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 
 	dev_info(dev, "Using %s\n", dev_driver_string(trans->supplier));
 
-	ret = of_property_read_u32(dev->of_node, "max-rx-timeout-ms",
+	ret = of_property_read_u32(dev->of_node, "nxp,max-rx-timeout-ms",
 				   &trans->desc->max_rx_timeout_ms);
 	if (ret && ret != -EINVAL)
-		dev_err(dev, "Malformed max-rx-timeout-ms DT property.\n");
+		dev_err(dev, "Malformed nxp,max-rx-timeout-ms DT property.\n");
 
 	ret = of_property_read_u32(dev->of_node, "arm,max-msg-size",
 				   &trans->desc->max_msg_size);
-- 
2.47.0


