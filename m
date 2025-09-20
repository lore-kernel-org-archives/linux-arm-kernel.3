Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566D0CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abA8Sw6usbYjdyq2KoXonFK+N8gmr8jonOU+aOdXl7w=; b=n1FzgqRMjfi3lk9K8JOfHGiPJX
	i8ttYUfBC/w7w4Mw+9AZcQS8bO3Q28iOurqGXPU0gZR38+P6PzsLhMRnOkoHZkDip1VaoNm9p+Sow
	qRZIrz1qFAO/jQwh1pN34HtNSyi8xgruQEClyWfL8ubPGr51C3Reci+FIpVmVzZBAa7PFAnVGCKAL
	Ct9YFpAxpnKmawkmjhskCxcxTdq0Nkdfh3EiBM2bucBelTdlGRF/y2UI8MMCKRmPVXtF2ChP/lD7d
	MGHaq93wcmE6Kg1I+BqT40WBBTDT/BIjt+c4mD5eQ7aISlnXsMDKXaGLJEX4yTyyq/LccoAxp9P3j
	0fP5eFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OU-00000005bkN-31F4;
	Sat, 20 Sep 2025 16:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OM-00000005bdg-10BQ;
	Sat, 20 Sep 2025 16:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C4EB44CEE;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73CC6C19422;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=8AVmMZ4i5vlJy4yy6ArsXwdN8LZl6h2LuSGyZF1y3pQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hU719B0YQ4LUE0/+mPl3T6HjAIxuI8g5AadgBId1wj+jXt9njbl/pTqdrjBpnoJ37
	 HUWKaZMGrORG3k1Da4mYpLVz+25MDZvqyQ4zDjfgEQxKOISriLOmF6cj73I02LRk0W
	 qd0wwPIJzPDbzmHl9vdeLPV6+V7v/Ci1T/wBM1gzTJ9/5caS2v18NX/LdtoSVEUQH8
	 MI7pNy1ldUbJg6k/F+X1HdMnBkGYftAnX8298BA66DG8AEUz5nB7yjUjbu7NqZmpKK
	 m6aZlyicPKWZCbgVQa0Oi8+IC4BrG5jXaunDCPv9C0ygXE6TIfP0a+T2Qg2xFZSwRN
	 9fF7Fm8nqMqyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB4BCAC5A0;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:32 +0200
Subject: [PATCH 07/10] ARM: dts: mediatek: mt6582: add clock-names property
 to uart nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-7-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=1434;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=IJ2WpBgydGyDmriFnyhyzls81B4aPjYb5NY6k/JiK2Y=;
 b=VAp6w9Z5osx1mLNbqsginU96nD8BYUh3ydYdVzHCMjEzRr/CrmZ2ZHQ8JbulRfNn5Th37kQyh
 n5+6W4naoVNCBrFrIuWqNaARBOwLiUqEpeQMwx9EANcZGw5ZhO4CPwF
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_092454_329774_9CCFEA92 
X-CRM114-Status: GOOD (  10.34  )
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
Reply-To: cristian_ci@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Other SoC DTSI files define this property for their uart nodes.
Do the same here too, to be consistent.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6582.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6582.dtsi b/arch/arm/boot/dts/mediatek/mt6582.dtsi
index 54d675ecb390c52c7ca0f406155bfc59e32137ec..82564c740c2182448f8f88bbc2b22c4fef1fdeef 100644
--- a/arch/arm/boot/dts/mediatek/mt6582.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6582.dtsi
@@ -97,6 +97,7 @@ uart0: serial@11002000 {
 			reg = <0x11002000 0x400>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&uart_clk>;
+			clock-names = "baud";
 			status = "disabled";
 		};
 
@@ -105,6 +106,7 @@ uart1: serial@11003000 {
 			reg = <0x11003000 0x400>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&uart_clk>;
+			clock-names = "baud";
 			status = "disabled";
 		};
 
@@ -113,6 +115,7 @@ uart2: serial@11004000 {
 			reg = <0x11004000 0x400>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&uart_clk>;
+			clock-names = "baud";
 			status = "disabled";
 		};
 
@@ -121,6 +124,7 @@ uart3: serial@11005000 {
 			reg = <0x11005000 0x400>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&uart_clk>;
+			clock-names = "baud";
 			status = "disabled";
 		};
 	};

-- 
2.49.0



