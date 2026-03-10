Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A0AFD4F1E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLVVVrDTRso1QY488RdaGykuHbX4jKDfhiZeg6VZFK4=; b=VOSR/rbDKiJoAWR9YFfiImASNB
	cuKGRPBTGJ2GH4fsY1TXd/jg2iILtCbZjPIW2xfk0hUGZ+BWlYn7vnqw7+OUW1hgOYg3DNuUwgO5b
	1ujch9tU8px1Du8H03xIdDsuLLwM3XmbcBOpKC2hIfSxiFAyljf9mpfuRXGcMUk8COxQ48mrfnXg1
	SGS5aR3hdi1k2e6oH7aQ1q+aXolaHqVqEA9pUMgHaurbqv81ONmfmNHdnknXZSTvnPliShZT31fSP
	6S+9fPgbVrQlCzaWLDXfgREtLZx+Lt6u7kX99gnvbx5AzlBVmAKWJDabg04ccGXrHULMPTNoWyylW
	uTvKyk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w021B-0000000A6fi-3EtG;
	Tue, 10 Mar 2026 18:41:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0219-0000000A6dN-23S5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:41:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F7031596;
	Tue, 10 Mar 2026 11:41:12 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CA273F7BD;
	Tue, 10 Mar 2026 11:41:14 -0700 (PDT)
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
Subject: [PATCH v2 09/13] firmware: arm_scmi: Harden clock parents discovery
Date: Tue, 10 Mar 2026 18:40:26 +0000
Message-ID: <20260310184030.3669330-10-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_114119_596790_B4E020EF 
X-CRM114-Status: GOOD (  11.59  )
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

Fix clock parents enumeration to account only for effectively discovered
parents during enumeration, avoiding to trust the total number of parents
declared upfront by the platform.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index bf956305a8fe..5f6b25c7b523 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -270,15 +270,15 @@ static int iter_clk_possible_parents_update_state(struct scmi_iterator_state *st
 	 * assume it's returned+remaining on first call.
 	 */
 	if (!st->max_resources) {
-		p->clkd->info.num_parents = st->num_returned + st->num_remaining;
-		p->clkd->info.parents = devm_kcalloc(p->dev,
-						     p->clkd->info.num_parents,
+		int num_parents = st->num_returned + st->num_remaining;
+
+		p->clkd->info.parents = devm_kcalloc(p->dev, num_parents,
 						     sizeof(*p->clkd->info.parents),
 						     GFP_KERNEL);
-		if (!p->clkd->info.parents) {
-			p->clkd->info.num_parents = 0;
+		if (!p->clkd->info.parents)
 			return -ENOMEM;
-		}
+
+		/* max_resources is used by the iterators to control bounds */
 		st->max_resources = st->num_returned + st->num_remaining;
 	}
 
@@ -293,9 +293,11 @@ static int iter_clk_possible_parents_process_response(const struct scmi_protocol
 	const struct scmi_msg_resp_clock_possible_parents *r = response;
 	struct scmi_clk_ipriv *p = priv;
 
-	u32 *parent = &p->clkd->info.parents[st->desc_index + st->loop_idx];
+	p->clkd->info.parents[st->desc_index + st->loop_idx] =
+		le32_to_cpu(r->possible_parents[st->loop_idx]);
 
-	*parent = le32_to_cpu(r->possible_parents[st->loop_idx]);
+	/* Count only effectively discovered parents */
+	p->clkd->info.num_parents++;
 
 	return 0;
 }
-- 
2.53.0


