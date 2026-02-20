Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB66C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NTOAFxNSFzgPzLkZ1SGs5H8jvsMJr+AYeOM7IA+JG6g=; b=BNXyPJ+mfSao0Z05V/bEvqf0Y2
	wLZnk55/hAhNDeuU8iqw82JJUovZe0gq8Yl0Fe8UQbtFgdSy/fnM3p1KG8+pSGYaEIQaz31fkjiCu
	L3bOwuRlGbjc8sriMM4kKteiWK5ctbfflspdyj1mFQRccMOuc1Kmm7th4kplcNLMe197GsCWMGS0/
	AvIGsm36rJllrPZA3cQzmKKmIDEKRDuMd769H3bR9itLyaHW2C6l6TEPLSshSH3GUFPvsG6RzXYP1
	crAns9FfbOXWOnZ5QVVcQQndS/HCA5EyL9a57QyiQDqO+dOjf8HfndKiQBwx3uaiSB6cZw5MLYQkd
	5GSjRnwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNCh-0000000DgsF-2BuC;
	Fri, 20 Feb 2026 09:53:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNCe-0000000DgpL-0oc3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 09:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AFF443789;
	Fri, 20 Feb 2026 09:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109A2C116C6;
	Fri, 20 Feb 2026 09:53:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Etienne Carriere <etienne.carriere@foss.st.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] firmware: arm_scmi: Increase SCMI_MAX_NUM_RATES to 64
Date: Fri, 20 Feb 2026 10:53:31 +0100
Message-ID: <bc2b9f5e361f1c50e661aa80fe1c2bcfd93c9c56.1771580928.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_015340_254522_059F8AB9 
X-CRM114-Status: GOOD (  12.55  )
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

Currently, the SCMI clock driver supports up to 16 clock rates.
However, the SCMI specification v3.2 does not explicitly specify the
maximum number of clock rates that can be returned (the theoretical
maximum is 4095 in the first call of the CLOCK_DESCRIBE_RATES command,
followed by 65535 remaining rates in subsequent calls).

In Renesas R-Car X5H SCP FW SDK v4.28.0, some clocks have 32 or 64
rates, which are returned in blocks of maximum 27 entries.  When SCMI
firmware returns more than 16 clock rates, Linux ignores all clock
rates, this reducing functionality of the affected clocks.

Fix this by increasing the maximum number of clock rates to 64.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This does increase the size of each scmi_clock_info object by 384
bytes, which is way too much on a system with nearly 2000 clocks.
As currrently all scmi_clock_info structures are allocated together as a
single array, the .rates[] member cannot just be converted to a flexible
array, without splitting the allocation.

An alternative solution would be to no longer store all rates, as
proposed by Étienne Carrière in "[PATCH v2 1/2] firmware: arm_scmi: get
only min/max clock rates"
(https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com)
---
 include/linux/scmi_protocol.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b06a6e..707f616d9fc9afbf 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -15,7 +15,7 @@
 
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
-#define SCMI_MAX_NUM_RATES		16
+#define SCMI_MAX_NUM_RATES		64
 
 /**
  * struct scmi_revision_info - version information structure
-- 
2.43.0


