Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AACCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 03:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEbv2kkdrC8rwlUoOnhbkcziBmsHX3loSmyy4N0I/+A=; b=RFM3btCMEJGnDVIm5xlqjEFC6o
	r/pfZMiksN6JqhKEhoQwAfXPJw6yhBtmSSZqAT48LSG3wIk5kiUi2BrJ+uHsQ5bwt35yeUpMSdiLD
	+oeyEQPWBoaZDM9LPPK7pVCDzzGH27lV7xsbtwL00jjTBkJZcSZ1hUdz6WprNECxkwF5g2VE2Xgzz
	XYmnNcZXlGK9WKtYOeCEAI1hh/EpBTaZZwn06T+ZdMMpN7gYDnHfTajlbOF62LUPeNwYDi+W7GD7+
	UXCGGWmMyxUrhtdjnoBha0GRIMao1gW9qHwEH8P+XEVa3Nr9AB4Z2JziwrYPlkxY2HhO8wuQJqFQj
	wE/hQLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaEs-0000000F9wv-31HC;
	Tue, 28 Oct 2025 03:19:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaEl-0000000F9uw-3Yjl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 03:19:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A89F4605B1;
	Tue, 28 Oct 2025 03:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50248C116C6;
	Tue, 28 Oct 2025 03:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761621546;
	bh=rhuTQBILO/3ko7T4YN6viqf7VD8LLS2B2vglmaJ12pc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LqO2RohPzR/SipeTjO6n7Be7rqBTm+38Wx5xx0V9m30hcBqoUzUhgo53X8Y1Fg7oj
	 XMGhKXB9AeXM7wvEkRAmimYLMVEUGy+XcpzBIyHrS4o07sEDmsOVCQmAvA7tOxW6fF
	 FE5nQ2CVMnqZ3fIu7X9uXZxoWL4PAOnmRmwMfuYxkbq5JT8E/jn2NKB+RgK48PRzYn
	 YZ0vKoUUy05e40bQwECgHbgEIyxYTnSoLEddOprddEG1x65Z0NaOfuoxvgzAGS4u1j
	 OfYuqmtY/tJRuA3DIjAHKbwl7dIrmg+vZEnDdpVkx29AqmsGHlp71te1jvveNXci2Q
	 VFfXHkfoXrUQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484D7CCF9EA;
	Tue, 28 Oct 2025 03:19:06 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Tue, 28 Oct 2025 11:18:45 +0800
Subject: [PATCH net v4 3/3] net: stmmac: est: Fix GCL bounds checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-qbv-fixes-v4-3-26481c7634e3@altera.com>
References: <20251028-qbv-fixes-v4-0-26481c7634e3@altera.com>
In-Reply-To: <20251028-qbv-fixes-v4-0-26481c7634e3@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>, 
 Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761621544; l=1340;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=k4E9iK4RiPK/MUr6aNRMEoxEsNmOvrcMsNQIhLkPefA=;
 b=HfSDPmgRlDitrbNjivy6sUn+fYyJqUgImrklCz+82NoRqDphaIwBDiBGGyY0CrBJWNiQZSNVn
 MX41EgUgcl5BCokGi0lBGPv+Zq16SiugloP3OYI08P9v3VN9Ixl2ObO
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Fix the bounds checks for the hw supported maximum GCL entry
count and gate interval time.

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index ef65cf511f3e25eb512187d52775bb363bb83902..d786527185999db6bb6a18a29eee5ff5282b8ef4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -981,7 +981,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	if (qopt->cmd == TAPRIO_CMD_DESTROY)
 		goto disable;
 
-	if (qopt->num_entries >= dep)
+	if (qopt->num_entries > dep)
 		return -EINVAL;
 	if (!qopt->cycle_time)
 		return -ERANGE;
@@ -1012,7 +1012,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		s64 delta_ns = qopt->entries[i].interval;
 		u32 gates = qopt->entries[i].gate_mask;
 
-		if (delta_ns > GENMASK(wid, 0))
+		if (delta_ns > GENMASK(wid - 1, 0))
 			return -ERANGE;
 		if (gates > GENMASK(31 - wid, 0))
 			return -ERANGE;

-- 
2.43.7



