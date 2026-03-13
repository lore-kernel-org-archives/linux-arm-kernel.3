Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A181F106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G2+7E4OZr6a8UGqF32h4K7HFEK0pdzuC9zxUMQjz/Q=; b=pg0PapfVEQz9be7PeI4Qpj1222
	PyG31XCR4HQ2kJgG8NMZfKWD5lDsdinhx6Smgce+0rWxqHPpQgysGYioAsGFNERp0KKNNijHt9JcE
	qpzIa0qDwsS9uynKoRbFf4GYTG3ymwbkDHL1WWTPLvpJYq43jCR8VJoO7Kea91bNlZkp1bozSdQZw
	/2EBMRJKNWQrUgiT4byVseeSQtxtZje0fY7jggnLNBU1a/5/ymu/LYtHP6a2qgZNuZYYdtDErK1WM
	co70DIoVJNymnFN+6fHK7zF7L6xUi6Ed12FTK/S1HQKih4iW2cEOE9ES4Dfc8Sb7wyx8Dyp3rPUhg
	9D2hjtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcf-0000000GyH0-32dk;
	Fri, 13 Mar 2026 07:07:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wce-0000000GyGK-3shz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2G2+7E4OZr6a8UGqF32h4K7HFEK0pdzuC9zxUMQjz/Q=; b=WocNFn0kjUGfJiXZdgmZhuZIuG
	xfWrQaeNtMq1X9StYpoKfP/ndWMJ4K6CKEqOJKtcotBSJ9dxugiWI8nhg6QiZdktNtSBgSdYvJRT4
	FmlFvqZYjdsbRRlEQmBwYrUgEkV/i8mo9k6sBWp3AqgOcuYKkOD25pHggWkfnIW6OaQGrjxFVyDgU
	EJIW9wbAHWUuvjHvjQ1bH08vzdij9ukIvGR64F6fYowQNpeFin23lNOL7Ekh1qSUD9JBmBsSMaa6L
	2jw7u9r+jhmj7fQH7A8sX2rTRMZ95EtIlabsCGVmiGeQ+2IyMn0nXAkbHWLGuZvaKZrpzD8jF9CPq
	BN1I3o1w==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcb-00000002io5-0Fz7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2G2+7E4OZr6a8UGqF32h4K7HFEK0pdzuC9zxUMQjz/Q=; b=mZ3vl0PSTm7XQAZj85HUESBd3q
	PQtYnhMzLn/Z7d268hhbq1pZsU6HtsAWbJ4gkbvwbfJlqSaauq64Js2QXAitfSpq/vxQJTukFFrM3
	2xaY/E9Wn0V+0US9GqBEM+ACITRoFrH0l5eo76DlZHqFuQt2SXxOX/66Xk1dICLwJwKzuQ8rLwjg9
	U905g7HXmiaWVaH0oxhadVH3GMF+lHSKrMg6cmo781BqfGRhEHsgM4JUHyMCIPdH3jgirFusp14Qb
	ctYPaOnegSHRZGKKpp9l20opYZxxHScbdcZPQeCDT+TW7zlNtJ0R2k3xkemHo/1uynx0HO5bJYoKI
	jcGZtZtg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wca-000CUo-1M;
	Fri, 13 Mar 2026 08:07:44 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcZ-000IYT-2V;
	Fri, 13 Mar 2026 08:07:43 +0100
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
Subject: [PATCH v2 1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
Date: Fri, 13 Mar 2026 08:07:31 +0100
Message-ID: <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070745_453825_A008264E 
X-CRM114-Status: UNSURE (   9.86  )
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
Changes in v2:
* None

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


