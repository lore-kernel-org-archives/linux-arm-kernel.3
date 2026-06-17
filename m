Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2A1CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfBHfsWgnUmKaMKmOobQiF8f09zQZj+H1XrDAnVeSFo=; b=jXQJwWfYSlZVxTrpJqbsYrkLkX
	mNRWKoVWDuq47SNMgWNoeerYc+AS+0SCe8Asb4OMIwNrsa1mOsQ2TduKKUl57DDvZmzX7GYllwdi+
	hYgDrd3nqp711bmPAsAj6OpsMHp1AzOO9GwhjnPbNjJb3K6XHB226wFVvC2WULrLbqRHrKHbK3CoE
	dr24jJc79oJvJJ7O+9qopnXf/8lBVyoj9upooGrkU6JDXIx6EIpt2TKLXQxM2Z3l5NPC6vHZpG6Bu
	A50ntPMiCSiSunpadxDMyS99CUUSCw5nrIriFJ13NOg9YkUWap5KhoKQ5h4/3eY2+eVoPm/FIVaEQ
	wshtZ5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfty-0000000GUr0-36Ga;
	Wed, 17 Jun 2026 02:21:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZftx-0000000GUq5-1Cf3;
	Wed, 17 Jun 2026 02:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45047408BC;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1923AC4AF0E;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781662872;
	bh=okVJkcSHdv1fcrHSQb1tZv36Onz2yNyEZIN6TeMJWKY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ngWtH8wvpOXfgKCEHojgD9Sr1IMhVUNuZu+n3bTUriqQcX0YpiePBaRhsLApaOsNN
	 slnG5TSqgWRC35wVLXyL+fDpGf0jYVHPjb3UJYT6OKcZlHSsL+Bz9qx3AV9Rbx7qlw
	 MG7JJXXZBQyxZqRa+9cNjlm9OJ7aTlCjumlxNC4waPW3h4y6I/In0Q/CgYihBVBoM2
	 DtbhGSzcdR5Xn3TtJR6aRyCdAC/AaMpcPaAoG/2FZf9aE/r7Iq8Fm9CAbfYZ/xZDwC
	 CN5yc6x1QKCAyuk4vq3+X8zOZI1WvSP2wHmZr3yTFMXCGMpNFUwpDC0db2Q4zdqi/D
	 QMoGNjjADwJVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06009CD98E1;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Date: Wed, 17 Jun 2026 11:20:11 +0900
Subject: [PATCH 2/5] ARM: dts: mediatek: mt8127: Add watchdog support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt8127-amazon-ford-basic-v1-2-d02ad15ac359@proton.me>
References: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781662870; l=804;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=VQZ++2hpaaS615uXsB1OWz8s3q+mSXl0RmexhIj1JJQ=;
 b=7rwtqv+oizSQabmlSevY4WbpbTst2BLlCJJWBG7WrtKPbQ9bPsyIEEu0s9c0rVp7leuzziRIV
 FJTxOfalaNFAcWNqU5OL4O0RSo9iNIB876MyCAJuNZP25Zu3ku+mVMg
X-Developer-Key: i=zkh1@proton.me; a=ed25519;
 pk=9DiJwhINAERP95fbFofXSP77GEnvfO/rMIRRRFDhaoc=
X-Endpoint-Received: by B4 Relay for zkh1@proton.me/20260616 with
 auth_id=824
X-Original-From: Zakariya Hadrami <zkh1@proton.me>
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
Reply-To: zkh1@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh1@proton.me>

Add watchdog node and disable it by default as it was not present
initially.

Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
---
 arch/arm/boot/dts/mediatek/mt8127.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt8127.dtsi b/arch/arm/boot/dts/mediatek/mt8127.dtsi
index bd61ec7e70c0..1855dda42710 100644
--- a/arch/arm/boot/dts/mediatek/mt8127.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8127.dtsi
@@ -159,5 +159,12 @@ uart3: serial@11005000 {
 			clocks = <&uart_clk>;
 			status = "disabled";
 		};
+
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8127-wdt","mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.54.0



