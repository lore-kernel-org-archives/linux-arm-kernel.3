Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0241106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QculMYzqOcVS5jqBwThraH5L2YlIJzL3vCNO5HmuC5E=; b=p1wg7eHuWaGemYROmvKGLp6fws
	KIeoK8CWw646VDPgqfkYXWMmw/lud6fwqQr0OHTCl7woDFWHILI3XZO+2U2oWFHZJ9LKnzV4zn+8g
	Wu1HbJQUhDIPzedLi/nG41dMW1YwrIUiN8BcZO4GYsNM+xdGshd6x38XlVc2ht2ySs3uZHvG7aQTA
	UEL+hn7ZPCqpskDlU3HyTy5FJ7MLNP/QMXgt/5CY4HFb7xXCZKndgXGb38PMOT3qb1lHwZw2NG9KW
	i7WWo2KJNlyW+4nNETulodlBRqcvM6hIqIZmHWyV7VRg2cL5pr+K4F8SF5Zv/uNJAlnhKJbi3w+Ak
	TFQKjf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcl-0000000GyK1-2OT4;
	Fri, 13 Mar 2026 07:07:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wch-0000000GyHI-04EG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QculMYzqOcVS5jqBwThraH5L2YlIJzL3vCNO5HmuC5E=; b=hJlxxyLU0uJlaJT9cVI4ZmVL7g
	lHZN4wUa2XaDp4exUGp4FuLtKTu/GGWo8NIl/3TJwxM9fByEyNss2K8NOqBwEtvbrYmQ5hsT7FeuY
	Zbxax58RfNHuHRf3WSgUsvlvWFyDptAAs+UGkENRcIOxcXGAQDKqm+9V5f5tLypD4slY1jMaJLmDU
	Qwfe6ZtICag2d4o1PWEscHBpdNA+kW8BkdsiGBie0VFOX8VFqsphZUeaZkwt0cPC6Dl3SFkr9NXR8
	sjQQh0m2Vq5yMmRF68y7vOmyZjwP8Qd/3i6i7UDkulDUG6UA7hNpN1pgrk5/vTNxAmPanLXYyJjsv
	6HBARFXw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcc-00000002ioX-05KK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QculMYzqOcVS5jqBwThraH5L2YlIJzL3vCNO5HmuC5E=; b=fBe/aQSZPtuW8bVkeLBXabxaIe
	pcfA5/L23ACYF8jF4e2UA8FHmzb+N+jyek7vMjJ05znqfmf+kDxMJcPYi6cKI5lNogI+JiRQutoJo
	NZp6G6psGHWXNIYslCRKQjMTTyjW6cVRyuFSbwW8T3aMZRiD4GD2JJhvvfa9+GII7vjaV8s8jBjcQ
	WPgqulUyco1R+VgT4g5DK+wZDhqr3zXzHjSMqJs43qYc0wRuZh7QVFH9IvQmKXFqNwEL+5y7AwOFv
	X4ae8pIm7hyO4mpBMqL8EVfauj+8mbVlYqFBRJmigYsDxnbH8vO9A77QNEGyc4ca5pVv94YQ/BB2q
	SGCkyp1A==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcb-000CVJ-17;
	Fri, 13 Mar 2026 08:07:45 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wca-000IYT-2H;
	Fri, 13 Mar 2026 08:07:44 +0100
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
Subject: [PATCH v2 2/6] clk: imx: fracn-gppll: Add 477.4MHz support
Date: Fri, 13 Mar 2026 08:07:32 +0100
Message-ID: <20260313070740.585043-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070747_390097_490782D7 
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

Add the 477.4MHz frequency support that can be used for display with
pixelclk of 68.2 MHz. The divider of 7 is important for LVDS output on
imx93. It is also usable for parallel output.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index fe6ee77ba1485..4048c16c0578b 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -85,6 +85,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(519750000U, 173, 25, 100, 1, 8),
 	PLL_FRACN_GP(498000000U, 166, 0, 1, 0, 8),
 	PLL_FRACN_GP(484000000U, 121, 0, 1, 0, 6),
+	PLL_FRACN_GP(477400000U, 119, 35, 100, 0, 6),
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
-- 
2.43.0


