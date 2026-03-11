Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F80112583C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQ0KzDnbu1PlI/JdLZkDqAqrxLxl5G06+OR7mjHBzrw=; b=RDs7PxTIqLonrez7WtNu7bnvEx
	wyrfKezqyqALF7FWBvjP4PWEPi7sV7v1XCz0LAY03InHKrhI1JX15tOidpOwALv24xCSJqpqL+uQI
	n3rp1ZmXIRMJlFhMJT0HpzZIfRO8hMEjeKzV1OCsYiITG7gTeifuLRWQNRvPbpWYjApVRmDnDgJY+
	mzcRngQNzkzO1KhEll1j05PA8TnhsgUvfHdWxI6HAEPMpWR0mRy9762FU1knM0zivxvdVl2YM/qwA
	MzKltfIkLwVWKFiU4ml4BYuebzUT8jeerYnkW+TzJ2uZBa+YEbjijqICTyB8xmIJjPkWfoWfh6KWy
	vw56LyWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KcF-0000000Bi75-1YNB;
	Wed, 11 Mar 2026 14:32:51 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KcD-0000000Bi5y-0P0c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kQ0KzDnbu1PlI/JdLZkDqAqrxLxl5G06+OR7mjHBzrw=; b=hsEYROGLnB/YncNfS4mm0yCT23
	dCdQzqETfan7AUpjfxu0f4vF2q0TRxWdq/xJA8xGSCZ3Mvy57trWPuAaQvJdn//QspNH4d2BDMVHx
	Jd0TAMC774ZXSRrnxEFJ/afXHWcyhpkusXKRa9LSb/cQ/MQ1RqWCCzuSvm0Mo8YspIdzF5mmimRHc
	J8Jskq6bwf+MXgKYALDQnxGshyzswb7lIOskcrW17IYvjnSOGGdI2UNKm/wskGpp7RhrdD/ENZoSO
	bnG8HN3Yg/rgMphsUzUOpfAb4SyzhrFAtoK/CRa18eeDIpcDj681vvGMgHGrJL5qSkayxNE9026X0
	y7d85Nxg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Kc6-000Orb-2w;
	Wed, 11 Mar 2026 15:32:42 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Kc6-000GoI-0s;
	Wed, 11 Mar 2026 15:32:42 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
Date: Wed, 11 Mar 2026 15:32:04 +0100
Message-ID: <20260311143217.1700704-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
References: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_073249_130220_EC5C3547 
X-CRM114-Status: UNSURE (   9.60  )
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

Some parallel panels have a pixelclk of 33.30 MHz. Add support for
333.333333 MHz so a by 10 divider can be used to derive the exact pixelclk.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 89ed7749bf47e..fe6ee77ba1485 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -88,6 +88,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
+	PLL_FRACN_GP(333333333U, 125, 0, 1, 1, 9),
 	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
 	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
 	PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20),
-- 
2.43.0


