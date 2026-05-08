Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1D7CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TzXyp+yIYJMwCrJFfkFZWc3eBpmjyTzay49h7tNZoA=; b=dvkRcGv72ckfgCTIum8PYlNJvE
	moQqgIUj/hf3LhZyrCtb3XqfaBAk97afRzshzk33EGPrH6Lh5fBJvC4d0L0fWI8g7oLDxNwMf0qhT
	0q+9XOo7T8WxnM7Q0Obi0/o98U1aPVFKB8UDkrBfvsEZTaYQaa3U4Q+kaYF7cPb+rPQsUTLzTTd1M
	teCYDtJB2EUinTBAJHnoO6/3sTs4OkEH3xoi4vY1v2DtKyjdMtfV6QLRASmGcbczPsO7aSP+Cuyy4
	QCKWt+0BMm9lJAw4pxV/Dl7yw3LXZJxFCQ+LTEa9w3TYalkXdKtj93UrnMXUKyFQcnKe+RjqYw/HO
	ZPNFV+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNDF-00000006rMw-2UIA;
	Fri, 08 May 2026 15:34:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNDB-00000006rHq-11kd
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1TzXyp+yIYJMwCrJFfkFZWc3eBpmjyTzay49h7tNZoA=; b=C7bbTGFqD0eKpoxw8dkA2AoYDn
	5FHZzDTXXquFTpvf05DqTdp1Vn6poM2Es3Cu/Bs9c4es8w9PaIuAGua+QUOFSe/9RJ8dPmk7XtXHn
	hcPspCM3xaKbChlTsNZ384qx9Djpq7Izz1SGRoBr+Q5blJ4CScJ4QqAdrkuR3ZzLTEfs2F6vxeHsM
	9zRGhy5le2nDOwxD0FzWTa238rziPpuX79YZjis6FVfv42rZOiUcuhFXfTdUPVqdYBUi7fGsln0NH
	6fuJBBslxc9eYqebXfh12WlOcSHS0ckeRrsk1uV/1tRlatz/nXYmCfLQX/rz4UP2+0wh3vaB3Ocmf
	JPQcAw6w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLND8-00000006iLU-0HBQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:33:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3AC935A2;
	Fri,  8 May 2026 08:33:47 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46A623F836;
	Fri,  8 May 2026 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254433; bh=FCP9MWDXBkmpmaTgWI8hodUMzwfIaYuwHBhh3J2kcKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=We8gpuWMVkDmHnui9cmKinnAybqTZNAuKe+hyKXmEsKxKkZEsuPfoOdu5c0DU93NO
	 WNTj7334SG2qs33M4ExZ26Oqu5x7SVvEJjCaDgH21wvTAQnK0HeEQdIauMrEfFf7S1
	 drGlI6jSs+Nfr0IQtbdqdRLaNOUVR8VCtfXTA/Ao=
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
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 08/15] firmware: arm_scmi: Harden clock parents discovery
Date: Fri,  8 May 2026 16:32:53 +0100
Message-ID: <20260508153300.2224715-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_163354_648385_2A5F8D14 
X-CRM114-Status: GOOD (  11.91  )
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - collected Reviewed-by tags
---
 drivers/firmware/arm_scmi/clock.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index c9b62edce4fd..d07cfef243fd 100644
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


