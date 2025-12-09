Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FE0D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; b=TcPRyktePWZIkeeFOje7LAwCe6
	lnnF+gmWc8v3E3QxULIDNO7dy4fA1MG1qyR89czBmDrY9rJvObPWk60BEDlMqvNZStkN2qe8aV9Lw
	Cd76PJKCL401M8KrBAbl1S2NE7bSy+yprySFKouCFNiYU7UC87Lj0E/AL6gvPggZPnl7UokFiXz0p
	CiLvw6vM3IRECb9Kc+odAdwsOp3TgeMDOAHwyUYkKgD/zWDXBtcKEhWhiD7qS/MecnBnYVUgBhbES
	MBvHpDo9MHcljJ/6oeWzfKXbbf1EmVNkSPdjjGOazznXiw7YLgRIYKGcQOrIZnrfMgx2Pr26F+BTm
	jeIs8Qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLw-0000000E86o-35pj;
	Tue, 09 Dec 2025 10:53:56 +0000
Received: from mx-relay90-hz2.antispameurope.com ([94.100.136.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLr-0000000E84J-1pH7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:53:55 +0000
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277616;
 b=SVkeU4697LzaszazzdFSqVT6+UxRxIfirYghaquMv25W41Vruh4GppkrgJiZIfEJBlnzgQ/9
 oluDBBeWB5ul0XvsRIRJKvzK/WXGPxO6F/Uyl2yVK3i4J3JQYA6eDDElpAEYngWdRTMpSbhCEc4
 oJQga/hxjMdfYPqapY0W2q8VzbHLTZ0LKUhmcc4LvyUJn7AQdmT4apMrBiO0KqQ2Uhsfo6cdogE
 bSsnw1kqdW36N6s01T8s5pDYag5wGw3CW2H80BVjDJX1ktXJl7jQQec6j2tM2sXpIckM2q+dtGt
 XHzTClprVAniKQLAtHMpeq7go3BHsn9vzEKW7j8e2SS/A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277616;
 b=iSWncyyQBwU7qkRU+OorNioX7bpZvP9BO/NoujcxJiuUAMMxSuLm39YYH84GnALKLEtSw4Gs
 +5peED4Fn1lNTGGMa1x1yWpFC2z2uoFLcZ9VrLEinGc8zo92sWJ/v7GNRsEbn95pL9XtRO4eKmk
 /ptKm7MfG/zNLD8jBwcixzT/9GbP4a2Lya0IP+DDmVYegaP9dXQIvOxVrF6ZUZ0ftbwl1YY9s/W
 FEK7P7exuwAhaLWE94+O6HSMvG8e50KTctRU9N3Zleakzjx2lLE3ghUTHY9HkOko6IB8mc/4MZM
 HXJPuiIXDUia2PxdkMMzD7qPq2EJis3TMxwbeuZaZsqFQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Tue, 09 Dec 2025 11:53:35 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id E3CEBCC0E8E;
	Tue,  9 Dec 2025 11:53:21 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
Date: Tue,  9 Dec 2025 11:53:07 +0100
Message-ID: <20251209105318.977102-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4dQbLB4ZrZzWxV2
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 5cdad8a37ec4edf0a973856c329ef64b
X-cloud-security: scantime:1.663
DKIM-Signature: a=rsa-sha256;
 bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277615; v=1;
 b=YNLcN43eViAVUREjBlD8eUhC/AWA7y5ODRKhX1EA+y0Li+QIBf0QJwU00vyRKRzO/MDuM2i5
 RKXWAREW3EgH0ru8/pKMkQfi5qW6+gjtgX6cvRUjyEvfUbjwvqnv343iMZTjRP+3WY+BJAnR/83
 Tc7P0/9e8QjnStY8Tx5fRt/g4dhOa6VHki6yRqOJA6tzQmJ000SfhZJ6vfFJVPz0WGXbut2FpMH
 7wdRITvfRv26K6QUTbnU9trtmG+sFKu6AvvRFgJfQ7M3j3zuWAztqVIs8x7PsNjbwJJR5keN4bU
 I2o6nFffTXbJEAtzkamv4XWvJd+8yibiyUvntfHDtZrJg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_025351_921366_CDC62D26 
X-CRM114-Status: GOOD (  11.25  )
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

Replace personal mail address by mailing list.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 59642a8a2c445..0605cf2faf83b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
- * Copyright 2021-2022 TQ-Systems GmbH
- * Author: Alexander Stein <alexander.stein@tq-group.com>
+ * Copyright 2021-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 /dts-v1/;
-- 
2.43.0


