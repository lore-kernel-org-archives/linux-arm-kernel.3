Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96763D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IED3rJ3zsfdXQmpcDwAq+hG+sXvjgA7/waaA9T5c3Y=; b=oRduqLoXVNb3kS33RbvaPTFoOR
	33Jut5hLIbhmKPXptzWVjKi7OUmyb43wRIbhl/JAgEL7EOv4pM4Wa6LL7/NbHpbsxm0Btot61Dv9X
	5S5df3ENUQDlSpWYUcMAniWtYu73rj63zMsImnVps1NgTGasyIXa4e6C1zv5W8/7PTxra0PxPfAQH
	Zo1P3LdZQS0v3/ptRSmqhNRN4npGkXRS5WKuFSuFUFetXblXU07QBydIuSrI+p2JznT6W1oEOYrpx
	FwxETphlccdUkvMuBmIMlbCA4AH9UgmaXOzESnKscOh5fB+yg210c6HrBqrvJkb1R0A0VWmxrVras
	6oFNgQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvM2-0000000E88c-1hDd;
	Tue, 09 Dec 2025 10:54:02 +0000
Received: from mx-relay139-hz1.antispameurope.com ([94.100.133.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLs-0000000E84K-0O2R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:53:56 +0000
ARC-Authentication-Results: i=1; mx-gate139-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=8IED3rJ3zsfdXQmpcDwAq+hG+sXvjgA7/waaA9T5c3Y=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277619;
 b=f0+aZwblU9vX9WiGSovspwSKbyFEylDw2ZItXW9SrXc0nLI0gGCXuhUlj1f6G86BBxgiRnnj
 CNtaBZCIlWEbWi0nbKsfoT1IN60Pk9lXtTz12LixYSmL3CX59Oo5joNpvN8Z9KzN9AJnHCV6cKO
 p25FKa1abo4eqrV7EMrk8ZYFe3o0kZMKAMuEtNAthu8uPc4MqZ9jYz51w8g6Zpo3V/JcdP1J6/q
 lhFS7fBnX/v6a94gE8NTI3ALHcppD281WckfV5cIJJz38GndCXgSd5laBRevD4PuqwlrLk0DWjX
 B9Tdq4d1hTTtPz5mcuLSfs9LneNfLoc1JhnT/rejS4DFA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277619;
 b=Yi81OdY9DFMJeWh454MIEsSzXNt8AKh+rXodru5/jTbWqUlxLfHThiDCTY+Y8xKD5+uovb8S
 /3+4S0hwcTCC0RCwdBfrZe8+6QCZvCxCBx5ZbtzZHV40lPHv3T9SFke7xEXjiMG3e/298FBZvkp
 vGV1mBDftxP4lzY9aCzBUjOrF/JzgnWIR0o5iczyJpZQ9oQTd99k/cPWo64hlMIjXPyNBH+lV5X
 yflZsjP0HJd4IKLcDdElkUucqnK7pbIu0ukOAZoSPaXukcQ8v0/V7GDQhOLwRc+x3CnHKHAuUY2
 Mwo5uD3yMmLiaNLUgZQ47bvn6WCMkv5BMtCbT5FvR3K8g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay139-hz1.antispameurope.com;
 Tue, 09 Dec 2025 11:53:39 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 12EF5CC0CB7;
	Tue,  9 Dec 2025 11:53:23 +0100 (CET)
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
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 2/8] arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
Date: Tue,  9 Dec 2025 11:53:08 +0100
Message-ID: <20251209105318.977102-3-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay139-hz1.antispameurope.com with 4dQbLC5gtczNwGg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: a09f991505044410bd11d1a9cce7d8b4
X-cloud-security: scantime:2.263
DKIM-Signature: a=rsa-sha256;
 bh=8IED3rJ3zsfdXQmpcDwAq+hG+sXvjgA7/waaA9T5c3Y=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277618; v=1;
 b=Hz7CEW7JOAPq4VXBnm1io1mw2Wjt4w66DUk18sF/IfYUf3+lvRZmgdRXYSt3DhVOEeEXEnvD
 y1QvtKWb7Npz5/TgwdY5ozS7tM6c9TCEnGl+GRY+2eEnvEWykoyWIkPqoPjjRNSN/KJvJRDRuHp
 aA7P2bXm0sWMnA8hZJwKNC9jVOzqRhJu4G6K5cJHI70pczLDkX9J6aF4/vtU7FNOYw9LB+ootGi
 +iNBlt8Z4/cY/rR+T5VBgn/1ck92yLp+V/ZTnbRUZoQ5yCI34awaPlF3kJkGyXFcv8RBxfTYKpe
 sHzt5fPoGUVATSESzm3k/JiJyOzd233/n/9vWMEhXn5TA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_025352_266244_56C44830 
X-CRM114-Status: GOOD (  11.88  )
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

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 0605cf2faf83b..ff2bacf24bfd2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -345,7 +345,7 @@ ethphy3: ethernet-phy@3 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -375,7 +375,7 @@ ethphy0: ethernet-phy@0 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.43.0


