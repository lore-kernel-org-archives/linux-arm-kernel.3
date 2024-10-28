Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD80D1359E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SN8Ng5rTEo1iVfLezVyPz6nzBYsg3jaX1qrAmM9qb8=; b=y4Rp6Uf0o+6V0AmHh55HHwmfUp
	O0LVr6dLmJ6l7igREjF9JFgPzqcZq/6F3a9p9EwBc2OFg26fGRYykzUxLFu9B3uVUkakrOzu/hA2k
	yD+1XukNfPeScnzcO51RSCDj4AgvDfMM0XrI5SYFyE+2Chh6OJB3Lz3CFDJkVbKjsmkliSNgop6sl
	a6k9NauEpqIj/k/PGsLWOL3Za8Faz3t+RK0qgjwLcnFeeSwu2gsHUfb7YC0xVe7zXSdjir1F6eQUU
	LzoaM1vIlTpS6F9OjmQP3tI/cz3lRjATxIN15zDDbwvf9Sl0TQ6SCyr3OPXF6YZFeufLIPWyzBRr4
	8foETWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OZq-0000000Ah7J-3bqp;
	Mon, 28 Oct 2024 12:10:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ORr-0000000Af1r-35Qg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:02:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 267F413D5;
	Mon, 28 Oct 2024 05:02:45 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9493A3F73B;
	Mon, 28 Oct 2024 05:02:13 -0700 (PDT)
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 4/7] firmware: arm_scmi: Use max_msg and max_msg_size devicetree properties
Date: Mon, 28 Oct 2024 12:01:48 +0000
Message-ID: <20241028120151.1301177-5-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028120151.1301177-1-cristian.marussi@arm.com>
References: <20241028120151.1301177-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_050215_844676_0C8C835C 
X-CRM114-Status: UNSURE (   9.42  )
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

Override the default built-in max_msg and max_msg_size transport properties
when the corresponding properties were found to be described in the
devicetree.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 --> v2
- using new prefixed arm, properties
---
 drivers/firmware/arm_scmi/driver.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 015a4d52ae37..b9a1d8c1034f 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3056,8 +3056,20 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 	if (ret && ret != -EINVAL)
 		dev_err(dev, "Malformed max-rx-timeout-ms DT property.\n");
 
-	dev_info(dev, "SCMI max-rx-timeout: %dms\n",
-		 trans->desc->max_rx_timeout_ms);
+	ret = of_property_read_u32(dev->of_node, "arm,max-msg-size",
+				   &trans->desc->max_msg_size);
+	if (ret && ret != -EINVAL)
+		dev_err(dev, "Malformed arm,max-msg-size DT property.\n");
+
+	ret = of_property_read_u32(dev->of_node, "arm,max-msg",
+				   &trans->desc->max_msg);
+	if (ret && ret != -EINVAL)
+		dev_err(dev, "Malformed arm,max-msg DT property.\n");
+
+	dev_info(dev,
+		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
+		 trans->desc->max_rx_timeout_ms, trans->desc->max_msg_size,
+		 trans->desc->max_msg);
 
 	return trans->desc;
 }
-- 
2.47.0


