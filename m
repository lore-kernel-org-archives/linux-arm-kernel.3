Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B136FD4F16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxUZLviRWzdf8Vuqv3zMQrgFu6v6konJZfnGNVOYkHU=; b=z93dOzcKnz9vW8SKQDS3Ma5JDo
	1QEgcj6xbG0Yv8XuVBICgP8c3MEiC3E9epWYTYd3IjF2xbL6uq5TjSMD8L6WotbD+bnni1r3xsr5T
	nspdj+T9/y6kQkERxT2IAjgKwgqZNdLqmeqxm5PhNffOX4h2zfj6qkT4sQ6RWdF4FbQj3rIXjCXMI
	M8kjJFom81CQcfBzq/UL4dnQQqs5lbm5Jw15UWfeLLVazoWQ2ppp3E1VkYa4Cara508mE6Ywc6yW9
	Zu3QbkgnAENw+Tn5KtRd/o2x6BLpX3XRXfvMt3Ea1NuQLnPVRSUnADmHhVto58502wY6ht1BI3eax
	q7QmAvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0217-0000000A6bH-1jB8;
	Tue, 10 Mar 2026 18:41:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0215-0000000A6Z0-2LP3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:41:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E659E14BF;
	Tue, 10 Mar 2026 11:41:07 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAC3B3F7BD;
	Tue, 10 Mar 2026 11:41:09 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
Date: Tue, 10 Mar 2026 18:40:25 +0000
Message-ID: <20260310184030.3669330-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_114115_707932_C9645EB5 
X-CRM114-Status: UNSURE (   9.68  )
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

Add proper error handling on failure to enumerate clocks features or
rates.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index c9b62edce4fd..bf956305a8fe 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 		    SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
 			clk->rate_change_requested_notifications = true;
 		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
-			if (SUPPORTS_PARENT_CLOCK(attributes))
-				scmi_clock_possible_parents(ph, clk_id, cinfo);
-			if (SUPPORTS_GET_PERMISSIONS(attributes))
-				scmi_clock_get_permissions(ph, clk_id, clk);
+			if (SUPPORTS_PARENT_CLOCK(attributes)) {
+				ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
+				if (ret)
+					return ret;
+			}
+			if (SUPPORTS_GET_PERMISSIONS(attributes)) {
+				ret = scmi_clock_get_permissions(ph, clk_id, clk);
+				if (ret)
+					return ret;
+			}
 			if (SUPPORTS_EXTENDED_CONFIG(attributes))
 				clk->extended_config = true;
 		}
@@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
 		cinfo->clkds[clkid].id = clkid;
 		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
-		if (!ret)
-			scmi_clock_describe_rates_get(ph, clkid, cinfo);
+		if (ret)
+			return ret;
+
+		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
+		if (ret)
+			return ret;
 	}
 
 	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
-- 
2.53.0


