Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F1CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 11:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYptHwQxYppzTfCWVdL/R5bMHuCmx/luf6VVt6namUI=; b=tPwcaZAPAlRWsqgIEUYmyFdtCf
	HQPeB3FdPWYBmFUJwCHVFGF0Svm7SN+6hZmySZMqxatE+0bMom+7YgAABlJMfBXWJOZ4yApRx0lvA
	V6FFqQf4YWMHO7wLKVRzoqsku1kZ4ukvMvyr7uuBv5mF7kh+ugaiE7BwNjZXqqHiRVgBeMOAxmEwZ
	gdJgp2N93J53Oxsx58fU1xAxbvBrjH5+aNM4F/twAVe0G76BVagZpFHTaw3S9uAjlEVZDLgt4ssW1
	v1lu6we4mmVnU4ItIphaP1M7A4bSpjK/ylJO+TEFEs204MGEC/zK7DRust0MBZXA0xvw3EemD+CL2
	JQeyy0Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jik-0000000HW9M-3zjO;
	Mon, 06 Oct 2025 11:49:38 +0000
Received: from mx-relay04-hz1.antispameurope.com ([94.100.132.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jii-0000000HW8d-08Td
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 11:49:37 +0000
ARC-Authentication-Results: i=1; mx-gate04-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=KYptHwQxYppzTfCWVdL/R5bMHuCmx/luf6VVt6namUI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1759751359;
 b=DmU4TQn+OJ6FHxtrlliwdRsZczCN54ywsRRK/S73svW9yDUgtqB8hl9tPCXYVfo/3XjHhadI
 h4QZtx1u/mrzz0B1RBAEJ52XUQzypdbiiwza+Vj7eTEsnSUh5RY52S1szCwhub6uoh7UG9ysZ99
 /NHZECY+qUFWJ/zWciF6H7972b8SzRo5bi/BZkX/4rh6vPqK1PnWf6rNgRTISWThZMVNcgdJQ9r
 7hwKces3O6ZdvWWGdsHXUv8qYyOdY2zYe+giYUp7peO2cyTF0moHFr0LIeu47FecRYYVG0fhTPq
 4mmoh7oECtfdYwKIfzyhJLt84iNOTiDcLEW/+W9t1Ep/g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1759751359;
 b=ZWFSALrweJH4kz5GOl4sP6ZtePxbddmepWHjg8mhLeixisLUDGywsmMt2slHoSbLXSqrvUEF
 HTnyiP5sl1oDhmoOxC/Z6b/9iefVJFPIH0f3Qj3N/FWSRUW1Lu+Oewcw+1ecjHp0xx45c6Jt/BQ
 O5LlidCG4lDYFlmBMzryT53lTmn6+HMg8nqCqZEvBYAN5dqX4CngQvkujGY6NdrSHs87mFvgXLt
 q93UKfo7rfgSwqyLewYgv1InLGSHxkhjd+8zaZWVmknj6SavG/M4dSpwy7PpEZFtRwH8x8Z2TsS
 kCXDsDpkSHWWkjEs+mLWGsQRBJY3m247lDfCKw/9k+/IQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay04-hz1.antispameurope.com;
 Mon, 06 Oct 2025 13:49:19 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4F5EC220CF2;
	Mon,  6 Oct 2025 13:49:03 +0200 (CEST)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM family and carrier board
Date: Mon,  6 Oct 2025 13:47:47 +0200
Message-ID: <7691a2ca5ed49da6276d406e5dd986c91f221c9b.1759749553.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759749553.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1759749553.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay04-hz1.antispameurope.com with 4cgHc010rQzS0jY
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: b8a1cefe5a1b3338a1f745c2baa9dc55
X-cloud-security: scantime:2.278
DKIM-Signature: a=rsa-sha256;
 bh=KYptHwQxYppzTfCWVdL/R5bMHuCmx/luf6VVt6namUI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1759751358; v=1;
 b=Wl9qLE34WerpiOAtskTM2X9EeaTu2/EapQo3gLkSarJ4v/JMkQT8MTgmsg//9Bo1qSfCo/xt
 3o/S/gMcbsc9LN+0bGcihJO/xHKcj4BCsksOHZKGMqc8ZdTyVl3N57+Tt2R5t2MvhMcAeMOWgF3
 bkWMjUIU8i04ApaqSHx7pxz8l7eVSM61gPjWuBpsf8rOpP912c2DJfoLrZcD6UMB92zxoOF0Ot+
 1Y+boB3nCbefxccKHUsyUMnlT5RWG3542kXuyxUuCe0lg7xy5wMdLJqcwf5T7bh1JLAPFPE+Sdo
 wF76c5EmWNNXJG6T+UsZid/1KHhYgXW9lqOG9gGlxlHog==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_044936_209420_2264F1D5 
X-CRM114-Status: GOOD (  10.28  )
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
index 0105dcda6e04d..ed89a7a36e1f8 100644
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


