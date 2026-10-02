Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FF7CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZrXGlX+EZMifV9sD1JVbsaTI6nB8lFWJi0Lwr2/Cbw=; b=Ex8k4K9CN6w5OCWlHZlDNZlxXC
	ib0+5WQ8zbvBlXOaYUSr1gmTzMQ5qDxHE1by2WWiq9JqpBHoiNXkUclh96xbYX/JrH0s9cDVgCY/J
	0eoXO+Df5REZ2mwo6U8/k5vteJI8QWLYhH3ReieLO1Shq/Wd2XSisN1incf+sKjr4iKlNClwQilll
	Q4EFRmVIyFgZbv28+3cnViUg38hQXp1TUjH3XIcnUs8gf+1jDNNVsMuLkmYbkko1t5QpZL5Nb4yML
	v/NOHJsCaOGUuAxv2Ce0kslugwSm88VAtE+sRqptq0bh2N6pu8+36Fm9Jk+8cw4vEVCWDO3M3VvEq
	ydDyWmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXTm-0000000AnLr-0mxN;
	Fri, 02 Oct 2026 07:14:50 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXTj-0000000AnKu-0WEm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eZrXGlX+EZMifV9sD1JVbsaTI6nB8lFWJi0Lwr2/Cbw=; b=ou1wdllRYl1Dw1ozi6wqiB0M/c
	ZnzBXWoSN/DdVpu31A9WQZW9V6FjIYAUfJ5SSc1E7R4i/7c53RXugX949wDAtW6pJkzL71FJWOCLK
	znHYxknUfFqEN2H3C5iAtY6z2oY2RtPVwC+u7nBb4ynrzF58tZ7+FNRxs00vB0mtHsXdc9ZRB0O9Z
	i01GzX3y6or+t+j3gVjzZ8RRMofwQ4DWQNxdMn1lo6dIrsI2CQGuMA8zciLOivlpZrKWQ9Wrnjvt0
	YidALhYblAMguIllY9TCLc3Ephd1fvrUgLDGE0o+oZXZ8tI2qjI53K4eM5iw0hbS9TYrM5SBYCbdY
	zsslijeA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50874 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCXTg-00000002ntQ-0611;
	Fri, 02 Oct 2026 09:14:44 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 1/2] ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
Date: Fri,  2 Oct 2026 09:14:40 +0200
Message-Id: <20261002071441.2499132-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002071441.2499132-1-primoz.fiser@norik.com>
References: <20261002071441.2499132-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_001447_655532_B4B9E534 
X-CRM114-Status: UNSURE (   6.86  )
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

Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
swapping capability") we can handle touchscreen x- and y-axis inversion
directly in the kernel instead of user-space on phyBOARD-Mira-i.MX6.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v3:
- no changes

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index a3c2811e9c6f..a7d6af162731 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -164,6 +164,8 @@ stmpe: touchctrl@44 {
 
 		touchscreen {
 			compatible = "st,stmpe-ts";
+			touchscreen-inverted-x;
+			touchscreen-inverted-y;
 			st,sample-time = <4>;
 			st,mod-12b = <1>;
 			st,ref-sel = <0>;
-- 
2.34.1


