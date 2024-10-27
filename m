Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BE4D10BFE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWnfSa/E3TDYuPzWXzSPismhOqK3UCMzs66VsrbxYl4=; b=iOQ+UE3ZPq/d9cybdyelT+kMFt
	30qE4HIYOmYN26d4RO5AQHYFOTf6fcLnbK+VUDu3f++ZckyCi6h9z1FGEX5haK5zIF281jZ2s7JZY
	Jqnrj6xMksMPJSHr3uDqBUSvtZR7oTCmqEq4M1M7MCmSqKRyRSkHsNDa2zvb5F98eH5XfHD92qYG1
	ilfIg6YUZVlo8ZuDUfClgW+EsgIP0x5icFbHwZjhl0eVOX7XylHBSNQeZR3Nk3ysr4F3pr7VpZgTl
	D42YiImlcSqI/f6tHEmIbOocwdJM/sp3V57MNqrbxDkRJt0AWIAPWvYLU3mzHUVPBeoqfMk54ykiu
	Zm4ggqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zTP-00000007tKo-0SvZ;
	Sun, 27 Oct 2024 09:22:11 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zPG-00000007sTO-0HmS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 09:18:29 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id BE55FA064A;
	Sun, 27 Oct 2024 10:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=EWnfSa/E3TDYuPzWXzSP
	ismhOqK3UCMzs66VsrbxYl4=; b=l/glu0QV8NTIZ66YNSVUhoaR9YoRGczU1InJ
	urCfdoQXlCnVVekGVY8sXpGWIpk1DixcjFP0pRwXKfpM7S00tDXZDQuXiBpskaZO
	g3E4wkDmAG2cmdw0Y8/8HPbyTQuffWO60Rgoy/zAgpWRnUVvWVOH1VYq7qkxFQfR
	DBWnjjFZAQlCBWrJw2ihcV7OGMXQTVmMI66sgfZc21MZnn3hpj+aikG+ezC09iTz
	Z3xwl60rkNknhTZuPH5bIbZKPdMID5+672RUHkh9Q4W54upHiVpxCNDZ/xrl4YAF
	2NBawj4SikdUaIrxuhDn3kwJs2MeVhD0aeCVi0kN91rPUMhRijm7bYWC7suxWTr5
	dAAv9mK5GR8gSE/XpRPyWlUbbonLUgtC0KukRETRm0qhdiImW097gwahnzLFJ0w+
	UoIwJbHC8utUFqhg8dgaafyYCaY2/5z93JZCUTgeVVLD3IFXODeyA/IaM7DL+sch
	xJ5vcMJZDCodFDsuEzggrb1EsQk/RqXYG+FEJxMdP2aTKoBkyTyT7ztO0Xk+MLFi
	NS4kE4VIDA7mKYFGMtzjRoFbDn0bW23072QZcLgxFnoIbUPDHXs0DWcOEK9x2RpQ
	GFQWTfMTqzfC/KDe3dZJG5Z8oO7t0yYPh1/wJbuItePk5LIJlW3E8w4zwv0kuhKn
	fDYuiu4=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Conor
 Dooley" <conor.dooley@microchip.com>, Vinod Koul <vkoul@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 03/10] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
Date: Sun, 27 Oct 2024 10:14:34 +0100
Message-ID: <20241027091440.1913863-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027091440.1913863-1-csokas.bence@prolan.hu>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730020672;VERSION=7978;MC=2900419732;ID=156038;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677D65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_021754_286508_71F80991 
X-CRM114-Status: UNSURE (   8.80  )
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

Add compatible string for Allwinner suniv F1C100s DMA.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/linux-kernel/20241024-recycler-borrowing-5d4296fd4a56@spud/
[ csokas.bence: Reimplemented Mesih Kilinc's binding in YAML ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
index 02d5bd035409..9b5180c0a7c4 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
@@ -22,7 +22,9 @@ properties:
       number.
 
   compatible:
-    const: allwinner,sun4i-a10-dma
+    enum:
+      - allwinner,sun4i-a10-dma
+      - allwinner,suniv-f1c100s-dma
 
   reg:
     maxItems: 1
-- 
2.34.1



