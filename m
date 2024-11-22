Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A48E69173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJZcZJ9UkGG88e0G4cRYDgpG4uPgV6cApvRZoFsAFwQ=; b=HmeRwZGTDhKELvxjM9WxTxmJOu
	NhdNRaMnHbiEkdUGMJPURtl834Vwq1mN1MtjT2dReRi88sKZEKBIWqKVRQDuLHKzNpS/Ev1uLNx7V
	P32YXxxherWMxo719E3PUR8fIaPW9UdyQSKV4kkBn9/qNr6tC3JFdzQKj4YIXVdMNbKzdCWfjZnuT
	lfqD2t0Bw2AlcnybnLd2slCqjWnYmK1SYTJg4Pa0QEEao9KZhQJd+gjB7NlAT6yQRh5JZKnAcikC6
	mce4P9g0+YHBcLVnHSvGz2AHyvsytlglP/MKufMPaYlzK0epNZnReo8mSs8uRlSDJLGa7C+PXnMkI
	Hi+MYY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWMt-00000002olI-2j7I;
	Fri, 22 Nov 2024 16:18:51 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWLA-00000002oIc-0tQL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 16:17:05 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E7047A048D;
	Fri, 22 Nov 2024 17:17:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=IJZcZJ9UkGG88e0G4cRY
	DgpG4uPgV6cApvRZoFsAFwQ=; b=PAL9MxsD2fUN13MxW3PTlRXDEuEgueRpIMkA
	YdQ6l31eY/AHQQUaXxyX3aPkj8y9tQPjblAl4m1e8X/6ErvyNUiJqlsuPCPyFR9q
	kza0etZ8VJGfZwkXIMR9ybxmr9oNmtAc4B5YjDWONFf/Kx3kwHO03B0sJ471Gd55
	flztN1VxxJvHqrX1I+v03hMUIMWCgTVpl/RfY5CfwnAh4nCO1dVmGYQQEQuZyKz+
	4mMAVMvgfsTDwTn6BHccPmYbrI0LfeEYNQMDkLrxCeG/leLsvjUGBDGlaUD+rv4/
	NX8wkyJBB1RtzKxNwCh605HaCTIZPvColES0ZN6/taCjksvOpeXiESsNkNmREiOT
	059Zrenfnbf3SHVRASpmKXYRwREBZLDNBUQ37txQMrFba2AVnQqpNIk6AMgtsXfv
	CnweBToegWAlJlJbjKYIb0ZMSA20PnE1GlNZ+lHVGhVtfWPmoKGeXm16aOnZArMH
	Tk1sqlY7WGvLLh9hCIGcIQYoSYLS69SGfa19i608Ypm15TLF0MLXuQ1aj9SdScUl
	EE4iSneFJwGC6DjdnD0aWiINViXNxHQWCkLXuhdDH3n77MjwEgTIFy1mwBSApOhx
	LCUfTzH6ILbAoJFeH6LiakW50ZztcHssJI5rr1o6FYs4KMruiDfF5nNwruKCk1kd
	Ryot9YU=
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
Subject: [PATCH v6 3/5] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
Date: Fri, 22 Nov 2024 17:11:30 +0100
Message-ID: <20241122161128.2619172-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122161128.2619172-1-csokas.bence@prolan.hu>
References: <20241122161128.2619172-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732292222;VERSION=7980;MC=1574022941;ID=75610;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855607263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_081704_403044_FB254089 
X-CRM114-Status: UNSURE (   8.48  )
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



