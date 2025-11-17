Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE84CEBF96
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OLdSYVCdTLS2HuLb5QQT3DyBBHRkyJ4iL6VN6xx+YE=; b=NNwNdVcPWIY7FF5B1a6tuimCIi
	GWYnMHrb9C0qFyQEWt6RwZ4BYFGplYcSyFV94r3k8yVLDlH1kIEJO1XCHjWlQP7wuq9hst5Egmr6G
	e4hK9PtJrNfq4fP4/Moa9HtzZqSKtXjfz368dTE165AFoY9Vx+SPP/KksURherzcAxcYARzTTqw2R
	3O+qe+Tviy3FZrSAeBtlp5GLdMIWrRj59Nz/24xDPWemsniEE4OXb0Ablizyq5F8YI6Uzriz1J0GU
	3HUlYCz/RKjD2PthbrY0Tx1vyxz5rEmPDX7jh80GBo7/nT01IB+9p7Ol9E61Z8mex3U7++GRSmHu8
	kMXtifWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyU4-0000000G4mL-2p3c;
	Mon, 17 Nov 2025 12:37:28 +0000
Received: from mx-relay145-hz1.antispameurope.com ([94.100.132.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyTw-0000000G4hg-2nNt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:21 +0000
ARC-Authentication-Results: i=1; mx-gate145-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=5OLdSYVCdTLS2HuLb5QQT3DyBBHRkyJ4iL6VN6xx+YE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383027;
 b=H9JLNkTrhwJcJwwPUW16zvan7c99XqgbceFS4LJSpvnStjBC34J+KyWaDGGuiLoix5Rl/rrm
 isFWwMpVQEaRHHzNIJoEiVtyE4GakLJrlFjj5zWQAOObpG2bRELN0LrtkkLzpdQx+AjgAhjUZau
 dK5mHtIwzbAYNFeza9Pt1jchw19ghZ22Y3iI17oANldmCCkWz7Xx0G3+Iwh5BivHEu+V+5XUKDl
 Wed9TL8J+2lxvx1J1lFyqGoWcYTBboF6jtKYa8NVqp3sra2fJ4QcvN70/0EpycQWj9/tdcBlMkb
 8aPfwXbn2IVboqMQXNC1uvCmmFgpczggkAfYrjRbZHMpw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383027;
 b=I8zoFMvGes4lcnyLY1qJGhwu51uJMlH7h4uEo5LPhLW7qdfS5/CoT1ihPpuEcEh2j3tYf0YB
 ZH7cINxyOxov3F73Tg3HXyiptn7fuoVgODhVtfahJwvpwgJav3B4KJzwU0pUVqqJnqFTa1RMYRg
 dRZeIH/F7kkKDbh9iyZsQrEYmv9AJlLR/X7lZZkL49vlznAFjpWzF+hwBQ00+mznDJyp2+TtmO8
 dDNvwxnL/tTbplTCqbbr11yLvzuy34tmYPmkgmAh/wo0nb1py3nord9fKbaxyf0ZyIF35YwlApN
 w3TiJh1oybLBbF8IRvL7yzOCLBj+fQfRcHl0fUQdfRECQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay145-hz1.antispameurope.com;
 Mon, 17 Nov 2025 13:37:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5E984CC0E8C;
	Mon, 17 Nov 2025 13:36:51 +0100 (CET)
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
Subject: [PATCH 2/8] arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
Date: Mon, 17 Nov 2025 13:36:29 +0100
Message-ID: <20251117123643.711968-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay145-hz1.antispameurope.com with 4d96gm0GPmz22k9c
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 9fb16085ca7376dc03f1681f369c23cf
X-cloud-security: scantime:1.993
DKIM-Signature: a=rsa-sha256;
 bh=5OLdSYVCdTLS2HuLb5QQT3DyBBHRkyJ4iL6VN6xx+YE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383026; v=1;
 b=r/kQfcn/0nzVnynA7C9LbwX7EVz/rT8TJiKRGSUkRh1IX2FYNL+xSMA3KTGGpSk/0QdPdtVz
 TnBcJLcHmhKEB/ScjmZctqIxsYRIr8gdpXSkKo+7/dvxBFfR9MLr4BoQ6y+tQ9zqX0ceqdY3JqV
 8eYpEvyp1JgrdoQP+Kz/LtytXJ7j9S3k6NKGjs17tyFJ4E4z+5caeehBNxECBsaTVgM4fGkNytv
 0d3ZrSOP8xkioqykM05YvNSVXgGwGOnDo4JukVkXe/+YOQaVRxDEsX5Ie0YuTio5OQvafqGqJHo
 i1lXP3X8q1ibk3qvpidF8XS2N9S7BnGIks22WgeRDZNdQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043720_844466_44453C3A 
X-CRM114-Status: GOOD (  12.38  )
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


