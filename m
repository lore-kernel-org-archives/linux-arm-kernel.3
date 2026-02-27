Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B57FFEFB5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agNQyPgtfBRF5dcOrSv/Zo7ERkexHCO5fJrOjgee/2U=; b=vpdkF8hpWSiWakPiKkrzVwc2LX
	BzmubAGq8MOVJzlW8UV+fXVNncVqaMG46W/QUMrTm+N+G4XDhnrym99x7S5sCCmWDJaZO2CHK1pbW
	97ZH5TJ5anUasqMKrn8g7O2TTHc3JR6pKMVKD61YMdnnqur+I13W7DBLrQIv8VoL1cNaZViLJoF42
	fH1o/TKdZ18GJBYvCpJhs36606CF2UPYm9uQylwgEowt0Gb1UlQ9Bv1sLofBWFUMN4gAJvyLopTpK
	tMap7DH/iWBt/gbvzXZFqZqWl7lF4fFLS84CuiYq4clL1o0s2CIS6vKjj5qFEKwrXWW97wmkD2got
	DtLP18EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzqc-00000008e57-3M8k;
	Fri, 27 Feb 2026 15:33:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzqZ-00000008e3R-3avN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:33:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C59A339;
	Fri, 27 Feb 2026 07:33:36 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00B203F73B;
	Fri, 27 Feb 2026 07:33:35 -0800 (PST)
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
Subject: [PATCH 06/11] firmware: arm_scmi: Make clock rates allocation dynamic
Date: Fri, 27 Feb 2026 15:32:20 +0000
Message-ID: <20260227153225.2778358-7-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_073343_941918_28857A41 
X-CRM114-Status: GOOD (  12.50  )
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

Leveraging SCMI Clock protocol dynamic discovery capabilities, move away
from the static per-clock rates allocation model in favour of a dynamic
runtime allocation based on effectively discovered resources.

No functional change.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 19 ++++++++++++++++---
 include/linux/scmi_protocol.h     |  1 -
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index f5d1c608f85a..d0fb5affb5cf 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -161,7 +161,7 @@ struct scmi_clock_desc {
 	u32 id;
 	bool rate_discrete;
 	unsigned int num_rates;
-	u64 rates[SCMI_MAX_NUM_RATES];
+	u64 *rates;
 #define	RATE_MIN	0
 #define	RATE_MAX	1
 #define	RATE_STEP	2
@@ -480,6 +480,18 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			   QUIRK_OUT_OF_SPEC_TRIPLET);
 	}
 
+	if (!st->max_resources) {
+		int num_rates = st->num_returned + st->num_remaining;
+
+		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
+					      sizeof(*p->clkd->rates), GFP_KERNEL);
+		if (!p->clkd->rates)
+			return -ENOMEM;
+
+		/* max_resources is used by the iterators to control bounds */
+		st->max_resources = st->num_returned + st->num_remaining;
+	}
+
 	return 0;
 }
 
@@ -493,6 +505,8 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 
 	p->clkd->rates[st->desc_index + st->loop_idx] =
 		RATE_TO_U64(r->rate[st->loop_idx]);
+
+	/* Count only effectively discovered rates */
 	p->clkd->num_rates++;
 
 	return 0;
@@ -515,8 +529,7 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 		.dev = ph->dev,
 	};
 
-	iter = ph->hops->iter_response_init(ph, &ops, SCMI_MAX_NUM_RATES,
-					    CLOCK_DESCRIBE_RATES,
+	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
 					    sizeof(struct scmi_msg_clock_describe_rates),
 					    &cpriv);
 	if (IS_ERR(iter))
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index d97b4e734744..5552ac04c820 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -15,7 +15,6 @@
 
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
-#define SCMI_MAX_NUM_RATES		16
 
 /**
  * struct scmi_revision_info - version information structure
-- 
2.53.0


