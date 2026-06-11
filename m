Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF0ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9VSr3L2PUq+IIVyRFMFp2ylv93VXlT6FqLB8gcAR40=; b=hgW9WVR1GOCdrO+GHyxy4L4tDk
	LvDNxd4m271qj1ZRM/ap9MylwFZD4cSXlj9tHFg0GB4hU9z3bsTm9hSaknAdp/6NOatabHktAREg1
	8lirTMHq0cNDZmEPZL9O7tyr18OkHJnxYCLSLcJ1O4jh5PMeNfwANjQWt8hFkuL7fCG3THBjE4TR5
	8eUkKA6fld9p5AdX+SGbpkhg/VCYitEgB1/H9T3J/hf5c0AZhRpg46ozPR8mvPyglFb7PPyiJokB8
	bHJQn2s2TRKyqK8WIQIVnoBTQx+p+L4c89d9mpkskZPINyLKiMoe69e4LYv8f0oYWnW6lWK867csW
	ncMdPWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3S-00000009TAy-2r2m;
	Thu, 11 Jun 2026 13:02:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3R-00000009T98-2h5f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:02:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 190A4601E6;
	Thu, 11 Jun 2026 13:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461651F00899;
	Thu, 11 Jun 2026 13:02:37 +0000 (UTC)
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
Subject: [PATCH/RFC 4/9] firmware: arm_scmi: Add a flag for power-management clocks
Date: Thu, 11 Jun 2026 15:02:08 +0200
Message-ID: <9f632656c2f8311192efd23761307a1fb671e6c2.1781171705.git.geert+renesas@glider.be>
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

Power management of on-SoC modules is typically handled through two
methods: module power control and module clock gating.  The former is
exposed as an SCMI power domain, the latter as an SCMI clock.

Add a flag to indicate if a clock is intended for power-management of a
hardware module.

As the SCMI clock protocol does not support advertizing power-management
clocks yet, this flag can only be set by a quirk.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/scmi_protocol.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 1d55374bc8cdcc72..c98e0add25f0c6c6 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -55,6 +55,7 @@ struct scmi_clock_info {
 	bool rate_ctrl_forbidden;
 	bool parent_ctrl_forbidden;
 	bool extended_config;
+	bool pm_clk;
 	u64 min_rate;
 	u64 max_rate;
 	int num_parents;
-- 
2.43.0


