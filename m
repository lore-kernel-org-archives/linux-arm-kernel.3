Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2327CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EI3VncdrDlFCBHgHP23iIzteEuQaU2FWB5CYdMi6Jhs=; b=hF3ZTsOnhwERjkc5AIKu0Akqr3
	6HBd39l28sayWGsXCR73sju7bYx5cnJAYbtHXecSmu55nLN9b49L0fhuhmYntQiJukhu1o4TSe+XN
	QAin1lTj6BDyr0uoxo6fP14wy8PR7MioyoaCTJ5R9I2nW4dtJUYlOYcyzyxfd/E0MuKD9GJ1cz+WC
	CNHMZ16COOsZeDfKlFp3IW+H0vja8wdu+ERJIv013ugMnhf4zkJhbq5DxByVWb0FrBH3+Vd277F5m
	Tsze7qyTSUfCQVXaZi5ai2njHZDs2WvmvzvTSULwgTr7nsHNYbhWQ5Px1TAXNWIQ0D5+3DQv+y490
	fbZr8aBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQPx-00000005M5H-00LE;
	Mon, 10 Nov 2025 11:50:41 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQPt-00000005M3Z-19Sx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:50:40 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=EI3VncdrDlFCBHgHP23iIzteEuQaU2FWB5CYdMi6Jhs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1762775421;
 b=if+7pTiHF13A1Zx7Kh5Eb2q+tNmiHlq8ZSGDN7+mhYMSp1am2ZC4g1a5lp4yZlygGZa1ykl3
 jJuF9ZgOVmSm32tS29k62DLnLpCyzooWAHKRcqrEwPHFBpL/vxTKZ4VOP3BKNl92GZrvgW/J10w
 FrsKbpSM/jiurnwzjQ5T/VTgLA6xdP20j9584n7XkAghlb4oy4kjGtB08j4Dc/3NA9KpOw54ueS
 5zrUKqobob8/pxR67CHMMrRLuauLz6uK+vJe74RpCpssW3DDEsthmK9JPJWXt3/ri9UNC9YFmW6
 ahQpvC+ito2UOBX4p0dS6+b3LvRmZ3wDZ3U6h3yhabRnA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1762775421;
 b=VGnz6XtlJzJSoiqEerLDhIrHqwkGyH9zXB7sMLkyCaVqitz3fdNUtTHTl9LEeypb77rrbwnc
 GlNs1rGMpoUPLS83jb0H2lSgTZftXL7dHuITynfUdJ8x1zby0AyB3AiEgBX5QgZ3upsRgfe/zUY
 HuaUjm7lfkyt8Mu494H1zd75+hEI3rV59S7WhZPRZImm1DiIH36V+eMumy0Vtwdrp9OMtT4GIdQ
 vv73y8O8DLyvUv4x/JG0fcGF/nDT9RJmn3KagSZUG/VcIioxTPCLGRgrtpDzotnU9u38ufHt2VV
 4pO4ttbgjOROYWUBinpspaifzYVyqhDfCAUBNfZEHzkew==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Mon, 10 Nov 2025 12:50:20 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 57E2FA40F9D;
	Mon, 10 Nov 2025 12:50:06 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM family and carrier board
Date: Mon, 10 Nov 2025 12:49:45 +0100
Message-ID: <18471e4c907e8681248776e3674e22075e25a50a.1762775119.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1762775119.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1762775119.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4d4nz31Pkkz3yYR4
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4ec77760357b01082a9b811132bbae09
X-cloud-security: scantime:1.896
DKIM-Signature: a=rsa-sha256;
 bh=EI3VncdrDlFCBHgHP23iIzteEuQaU2FWB5CYdMi6Jhs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1762775420; v=1;
 b=LUm5H2gZvnc7iPCf+Ry3FAi0iwVLiwr5I2tk7y92OYZF48sHrhyiZ02NflGzYgprWKuZSSSi
 Ytftu6c4fFH910o0c1vJqK6o0XlHA7lopfgpu2l9HNd8XdFJim7lk6qXppORZ2eS2kB2lVQlWG4
 1eYiTJxcFWPxsGzTvNl7EDkSQ1ra/mmIRqJgXdOgoQCeBZoaS1rZ4UZcpjYEduDue1VtXkzS2gk
 3Ski4KiHr30K+TLACVAgIdZsB4oOkgS10TcUv3yIThenjW+/fF2VIVxxZci67DT9Rh+C87QOa+C
 3qBuMituQKGhw30+cTWo0qw6oT71sYcHLhOGV/1/e+vHA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_035037_471114_88C6A4C1 
X-CRM114-Status: GOOD (  10.35  )
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

The TQMa62xx is a SoM family with a pluggable connector. The MBa62xx is
the matching reference/starterkit carrier board.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2e15029dbc677..cfa158dfdc9cb 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -89,6 +89,13 @@ properties:
           - const: toradex,verdin-am62          # Verdin AM62 Module
           - const: ti,am625
 
+      - description: K3 AM625 SoC on TQ-Systems TQMa62xx SoM
+        items:
+          - enum:
+              - tq,am625-tqma6254-mba62xx # MBa62xx base board
+          - const: tq,am625-tqma6254
+          - const: ti,am625
+
       - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
         items:
           - enum:
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


