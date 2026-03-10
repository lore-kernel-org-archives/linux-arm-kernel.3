Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E90FD4F1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qW+QVjbSbl42AeCb43SJ2UVqpZZ2uD49+T2/5K0He9U=; b=mATVghRnLSZNWn1tImKhgq3nU7
	MwFjnRZySq20DptvGydATyk8JHvMJGbSlLpprxrD4wCtE77pCIOt6ijVec8aaOvz3LFt+rkwHNzI+
	X/CWLXRHwjHR/OrTz+g4JSj5V089dzODwOROVFznBHoEQQPSLkcXvsc7zL/RW0LdBd4lp0ABj1YvP
	P/9lRPRR5m/fMYNrQICga9v6X/C2Kj7iRHVNCvusv85YmrWtappsg6gIM+fGbdR+lSv4bQpYElFOL
	Ay+SiJDfVT6SZfK1dyQ9FnMtZjbv+AOn7G+4pF1HnGzgKvy2xkoMoNCrSpNjsr/aum+tjYr06d425
	heh3LB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0211-0000000A6Uo-2eyf;
	Tue, 10 Mar 2026 18:41:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0210-0000000A6T6-3S2p
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Mar 2026 18:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qW+QVjbSbl42AeCb43SJ2UVqpZZ2uD49+T2/5K0He9U=; b=Jsipv/mm76jO56K3GbwOfvOTll
	t/aq+f69weCik60+z8aELCzsWRNPtAnqIZK/cgvvKmc98Jf+HdLH0sPpNJZ8XA/u2TTL+26EV4Cdl
	krEnk0VyfyjyU205GTVSJAYlYPUHJqDwlmyGMLY2q8bjGuBlez4SiP9MZItQsd+zMOubQszwQjx99
	6SsPUahr4TrnYGRRMQdWbz0PuZU2zqVwuOgzdcETAIKnekyTkV0/QksIs7b5tbiUoHTtCizeE3Grd
	KCo9gsPb1uJH6n8SOdhpbvpp4H0afc6rtqv1slxhsGf7Z0MvKuRenRa36xqPQJGet9EMKk6d46lNF
	oAE4iHIg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w020x-0000000FLZs-3MVi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:41:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86C111596;
	Tue, 10 Mar 2026 11:40:59 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28F193F7BD;
	Tue, 10 Mar 2026 11:41:02 -0700 (PDT)
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
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 06/13] firmware: arm_scmi: Drop unused clock rate interfaces
Date: Tue, 10 Mar 2026 18:40:23 +0000
Message-ID: <20260310184030.3669330-7-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_184108_063719_02BB49AD 
X-CRM114-Status: UNSURE (   6.88  )
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


