Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2080FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qW+QVjbSbl42AeCb43SJ2UVqpZZ2uD49+T2/5K0He9U=; b=G4D59moQEtGl1IgcX/6s4/7CTj
	YnCDmYIOEnUHWz4DDnnvkQ9CQ5ICQClZU3QiLaSN5RSIGmhu8PS5c6AEu1rGUo3Zf/8CIbI0tOBCj
	okktY9R8gu7SZ1vdsS2sM85CFohlwkS6VtG7NOOZ93FGq0VkiRHCYotdHeZatf2xHKG/DwOMfpjh0
	eVoZy7Yft4IdNpacCfItdN5fpxiVPNluve4Mc44X7mPQjVTrSQSUC2jVmnnJBSBtOzElblE9HDXDX
	dNN6irrqceRg016ABnaqrzrvYFjXQewSgGqooxqd5nYNra8ULZAl2I5vyUe5LSrt4G9cNaZ8FofkK
	LbJI/kRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHos0-00000002PeE-1ZuO;
	Tue, 28 Apr 2026 20:17:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorV-00000002P1A-0Utz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:17:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C90E3297;
	Tue, 28 Apr 2026 13:16:45 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 324CD3F763;
	Tue, 28 Apr 2026 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407411; bh=Jx+iLBHfzCZCNu0Rbo9kQcSH7PClpwB4Q84bljdtVgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sr0/0rj5P8vzwkIIc0/cpwv1h5ZJ9lneWh5bUsnTMKh670rVMXPYa01dNXg2q5TKq
	 /cpYwe9MsfAPSFDOrnIvNWdSZPiSETE10P1++Q2VCypLXHF4N8PHyMHDJMmZOzwhZC
	 3LBrU2qq3dptQPMJEkEODWjL59PPy9F2fsFnj/A4=
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
Subject: [PATCH v3 06/15] firmware: arm_scmi: Drop unused clock rate interfaces
Date: Tue, 28 Apr 2026 21:15:13 +0100
Message-ID: <20260428201522.903875-7-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_131653_446392_6DDCFC5B 
X-CRM114-Status: UNSURE (   7.57  )
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

Only the unified interface exposing min_rate/max_rate is now used.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 --> v2
 - Collected Peng Reviewed-by tag
---
 include/linux/scmi_protocol.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 7283302b0c85..d97b4e734744 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -53,17 +53,6 @@ struct scmi_clock_info {
 	bool extended_config;
 	u64 min_rate;
 	u64 max_rate;
-	union {
-		struct {
-			int num_rates;
-			u64 rates[SCMI_MAX_NUM_RATES];
-		} list;
-		struct {
-			u64 min_rate;
-			u64 max_rate;
-			u64 step_size;
-		} range;
-	};
 	int num_parents;
 	u32 *parents;
 };
-- 
2.53.0


