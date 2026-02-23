Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EFFEC1128
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 19:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpp/3PYpq5fXfYO0KfydtqN3X8iStaP5puLBD3gp2IA=; b=ITZQeUaPcaXaIHCfbJo4pLhuVx
	K6JgaqTKNoQbD4CQIEqjf6NoplMiHjVIe0iorq3rvTrUPijcjnbLoeBOnwOJuxt6BpwSXB7n0OaL+
	zEzy8oAoT1wZgLf9fKGOBBzTNZRegp+AEFPj6br13Wz096DqOfMiAIWkC1AAFDCpyYafbTyXhc/+n
	dWkRmJ/AGh6hBxnb1gGQV7gFBVI7mHHuiiaWxcMFS2WRdANYqLj0ROlS0moBjjUCQesY8cHSXCMq2
	n4bPK+/1DXmJ6H0zgAE6ir92z5WmF0bAE9uc8hFFKxQLAW5lPcM2FUc2fQpPIhWY+UPIFdvT9csbO
	Vkx10ZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubrO-00000000wnO-2DJS;
	Mon, 23 Feb 2026 19:44:50 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubrL-00000000wmx-2Hc4;
	Mon, 23 Feb 2026 19:44:49 +0000
Received: from wasted (213.87.162.218) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 23 Feb
 2026 22:44:38 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<linux-gpio@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] pinctrl: rockchip: use *enum* properly in rockchip_pinconf_pull_valid()
Date: Mon, 23 Feb 2026 22:44:23 +0300
Message-ID: <20260223194424.19251-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [213.87.162.218]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_114447_604853_B544E850 
X-CRM114-Status: UNSURE (   8.81  )
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

In rockchip_pinconf_pull_valid(), the pull parameter has *enum* type that
is not isomorphic with boolean type but it's used as a boolean expression
in the ?: operator.  Compare pull with PIN_CONFIG_BIAS_BUS_HOLD instead,
dropping the unnecessary ?: operator as well...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 816823403e97..6d0ba2a258d1 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3577,7 +3577,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 		return (pull == PIN_CONFIG_BIAS_PULL_PIN_DEFAULT ||
 					pull == PIN_CONFIG_BIAS_DISABLE);
 	case RK3066B:
-		return pull ? false : true;
+		return pull == PIN_CONFIG_BIAS_BUS_HOLD;
 	case PX30:
 	case RV1108:
 	case RV1126:
-- 
2.53.0


