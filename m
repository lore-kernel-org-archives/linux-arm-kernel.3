Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C67CF6BF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vMvOlrPgjkIwmEXFdQz2Q2ubA3EDVESm5G8NqGI75c=; b=j0m3o13IZqgtk0TbBytDke72E/
	rKjlAmWbX71zTxJpVMRkqsxHIB6rI/ZD0/x2AFxzawQt0lAOJdKGhcr275BnfqJRKL4CRlGk3iMIz
	0YsUA9YPA0T3kGQWXuZM1h5te1S7wEs6M4U547trsWZdQYOccqDOmhHbugrPukxA+tx8kEvNEoCTL
	no9FfcnuavZE07vvW4u3WREa9pvB3gnNm8buuWNDpJrXNLCZ+SZQaWXSBUTW/XlSzAQZluH2YVPVp
	DZ8WRlXWM6UBQm4afOmanVgvh/Lw+r1MrHmKA8rOgp8KBcDVb8G4gyxtmqNIXXMF8qCaImUvG4V/Y
	onhhvFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOh1-0000000ENFu-49Nn;
	Wed, 07 Jan 2026 08:14:59 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOgv-0000000ENDI-2Kc0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:14:58 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=+vMvOlrPgjkIwmEXFdQz2Q2ubA3EDVESm5G8NqGI75c=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1767773676;
 b=MHoLeEfU9i1Jj9BGi5Boc7sdFhFtX14fPRaflfQLY+FnDIVt6CpQf7MOuDVkj5M7Mirf7+h5
 ewvkm9wtQ/SIpOVfAMViiFm8IWiMKGWz7VFwoE1XFI02PlkYLgZbVYEK9XQR5UHLFS0+iSwzCVp
 4wmmYQ3Z134NmdS64PMAJYNtjaJcPrHegu3urZHJdkABH3zHFXWLizkIGGfXM2xlh4MBpu3mWcc
 l5r85EuHI01uNFsTIJUtt/aY+KvzfESWXwFnv8f8BVsdEan+SHK4nRahjYxd3t9r2AN0slcCQk7
 rtMxUsW/Cj5dp9hp//fJWKGmZHPZkXpvhTTGxeKMtrReA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1767773676;
 b=V4ir+v5TCreEVH8ivkU+oTwOxiJ1SVKeVheBl2Gah++hfO0E+KuT2r9omvZCJM/12uNHm+w4
 WMe4Ud63Yt/7R2yVQLjZ/GQRiMBFb3vJiEYnK6rLEeNTurS990DRSFpzYARKMQVa7G+JS+0t/21
 9Qt198F9HTG0r3JXkZHaM2Sfe43Vo/4/bI/gotmjUKggZvGXsq5lxVDv+n95j/NJ66uvdlCqS7h
 OBiuTjuipH3os297sJRrvQVnE76+xWX6KsJm1MEuzGQpxW3kstRJ9c7iOmf+BsdokVFE9PCu2uN
 cAQeYat655btaGaAqc9ncM2J03tDEddaeFTfNEIjw/6Aw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 07 Jan 2026 09:14:36 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 673DD220CF3;
	Wed,  7 Jan 2026 09:14:22 +0100 (CET)
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
Subject: [PATCH v5 1/2] dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM family and carrier board
Date: Wed,  7 Jan 2026 09:14:01 +0100
Message-ID: <510c681c6428a9470c2b3710e4e3b399c2886d76.1767627010.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767627010.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1767627010.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dmLRM1WGdz3ybNh
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: bd7b7d3b06095a7435fa3d9b1d159766
X-cloud-security: scantime:1.841
DKIM-Signature: a=rsa-sha256;
 bh=+vMvOlrPgjkIwmEXFdQz2Q2ubA3EDVESm5G8NqGI75c=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1767773676; v=1;
 b=IdGPAph/nxo5pUys6xAz9Kr7DE84vopbhHMo1/wj4tgpchq/LIvwPRuD9dUM6NWV9aQ2T65d
 dDrKcRLjnIGo/m14XG8TDJMs6ejRZd7L0PZnY2j88+tlckm3ZOh58yTqzuAuIS88nrLw3Xcti4r
 +IBgTGcJbvXZnOzXpoEc5gGQDPdCthNXJ1c0UMsvCPUg1ca6Ij4n1tYIEEAnBEHCHXCWKzdjlw4
 TU84kqbzlYsLX6s4O1dm56nx1PyE6+CZn7rRGUWgYQYMM5ozOxdmczoO3UKz+N2qnMzuteg7GqN
 AZT7XLDJq6TVIguVl7C1GzpwwAgoEq3Fw6kP4ZXzuasXg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_001453_733132_5FDDACE6 
X-CRM114-Status: UNSURE (   9.99  )
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

The TQMa62xx is a SoM family with a pluggable connector. The MBa62xx is
the matching reference/starterkit carrier board.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 85deda6d42920..f1b6ef98714f3 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -95,6 +95,13 @@ properties:
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


