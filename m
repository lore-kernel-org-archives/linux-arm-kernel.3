Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA30D358F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLJaerXYvnpdMf7J9w74jiDoCWj2bcuZe3+nMmYuDnE=; b=OqCQ547eMy286lQl1wMGM7ujB1
	ooU/1rHrXHO5ebWWECUfl8WRRdppgZUSX3DbZWnA6Pm+PPxbqe52vMdi07Lg3UBoBGZFLsAkAEUh4
	ck1PldWpswSdStM4CU6RRrcPX9bqjvNsCKqzaRMBBP2oSaOHsh3Y9CkgpHqVJHkWpFsE/vRtDtaiX
	J8dZilTUlquVEytMKXEEwZI8EBjam99z1o6SsoxmNovoOVUd0oR3NUBSYoFJTwzh0jePwbFz/2oQ5
	4hj+hDpeU6cF1y77Pg8ubgQ18Nkg6ViQNhFmM29B19wHUh1E0ja70vh1GPllbNOLBHZfglFfdbXph
	FX4fV1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOkC-0000000HXWU-17Vs;
	Thu, 29 Jan 2026 09:55:23 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOk3-0000000HXRN-05ci
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 09:55:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD67B10F7AF;
	Thu, 29 Jan 2026 10:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769680504; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=TLJaerXYvnpdMf7J9w74jiDoCWj2bcuZe3+nMmYuDnE=;
	b=X+yQ6ZuGn+yS9bESPkdaopJOYwR6cOZWhLOnf0qmkl5nQdrJ6EjwrDT672CD6zrunULtKq
	NqdLgcPFIjkSVG3uc4rfL7GY+WG3DA43aZ8/MQReE4jyj5zMTAy+ftp7jAMtJHrRCoEbFV
	48jA5J8cXS4/EFlp2UQLPBw4SxLBEIBmI+q3E+F8tG2JH5OTUEEQoO6rDl1JWDM833KsoL
	d2+UBNHIpqFi1md+CN3nHlPwT9v0bJQqCPKcLUbzgm3NN/xqvFvyH1MsVbL425NMo7hC5H
	IXCykC2d8IvgF4eFCyRa5sHUThvuhKY1oQQHQn+mdCs6JAWmY33r5XEMLDvZ9g==
From: Lukasz Majewski <lukma@nabladev.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v4 3/4] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
Date: Thu, 29 Jan 2026 10:54:41 +0100
Message-Id: <20260129095442.1646748-4-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
References: <20260129095442.1646748-1-lukma@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_015511_214786_0CF86921 
X-CRM114-Status: UNSURE (   9.58  )
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

This patch adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
macros definitions for L2 switch.

Those definitions describe clocks for MoreThanIP switch IP block;
the switch itself and the MAC address lookup table clocks.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v4:
- Do not change VF610_CLK_END
---
 include/dt-bindings/clock/vf610-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
index c91fb86fa9a1..5d94bd561a2e 100644
--- a/include/dt-bindings/clock/vf610-clock.h
+++ b/include/dt-bindings/clock/vf610-clock.h
@@ -197,5 +197,10 @@
 #define VF610_CLK_TCON1			188
 #define VF610_CLK_CAAM			189
 #define VF610_CLK_CRC			190
+#define VF610_CLK_ESW			191
+#define VF610_CLK_ESW_MAC_TAB0		192
+#define VF610_CLK_ESW_MAC_TAB1		193
+#define VF610_CLK_ESW_MAC_TAB2		194
+#define VF610_CLK_ESW_MAC_TAB3		195
 
 #endif /* __DT_BINDINGS_CLOCK_VF610_H */
-- 
2.39.5


