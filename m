Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB884CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWVuJawX0Ef6oR8wZ70yyOE0QWDgmpOY9opwtIfW/K0=; b=TEAZRl3mhXhk2qwU+yRd+jjLA7
	KmzR4cPa3/eViLov7Zvd6ffANRZjNfq6jDRNvVObfuq0vdZT2qDhBZR/hMpfMcXLkRYrvjG8HDzLy
	5UAgaTnmbFt7aqoyrXSim5leDvcShs5ZdN2bx0fVTcR+rZSk7U9BUXt4TIXfquataNl2uhA1voBJF
	OGDDcycdjdFHKCbkcDPJpUyTHZNn862e+oKFpgApWeCQnUdNOAKrG+04hWS2rU+BBAz7toaAxDzPX
	C/0NxiA1auI6bwj0glYBd66bVuCPGF1nUlLdtP1Smtt1MJbXvWrdaGlbpLEjHxQusiOagFUH0hIG3
	G3bqttQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3K-00000009T1h-1kvq;
	Thu, 11 Jun 2026 13:02:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3J-00000009T07-2yCj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:02:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C8E960103;
	Thu, 11 Jun 2026 13:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6086E1F00899;
	Thu, 11 Jun 2026 13:02:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/9] firmware: arm_scmi: Advertize always-on power domains
Date: Thu, 11 Jun 2026 15:02:06 +0200
Message-ID: <1cbd6383dfef1eb397b52a4ff557f66b2064798d.1781171705.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781171705.git.geert+renesas@glider.be>
References: <cover.1781171705.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

A power domains indicates in its attribute flags if it supports setting
its power state synchronously and/or asynchronously.  If none of them is
supported, it must be an always-on power domain.

Make this information available to SCMI protocol drivers, so they can
make use of it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/power.c | 4 ++++
 include/linux/scmi_protocol.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
index a00f7c298efb74f9..11ca8c9965110b5a 100644
--- a/drivers/firmware/arm_scmi/power.c
+++ b/drivers/firmware/arm_scmi/power.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) "SCMI Notifications POWER - " fmt
 
 #include <linux/module.h>
+#include <linux/pm_domain.h>
 #include <linux/scmi_protocol.h>
 
 #include "protocols.h"
@@ -147,6 +148,9 @@ scmi_power_domain_attributes_get(const struct scmi_protocol_handle *ph,
 					    SCMI_MAX_STR_SIZE);
 	}
 
+	if (!ret && !dom_info->state_set_async && !dom_info->state_set_sync)
+		dom_info->info.genpd_flags |= GENPD_FLAG_ALWAYS_ON;
+
 	return ret;
 }
 
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 1c17515ba45d1fd4..1d55374bc8cdcc72 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -193,6 +193,7 @@ struct scmi_perf_proto_ops {
 
 struct scmi_power_domain_info {
 	char name[SCMI_MAX_STR_SIZE];
+	unsigned int genpd_flags;
 };
 
 /**
-- 
2.43.0


