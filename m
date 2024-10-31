Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC119D6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWnfSa/E3TDYuPzWXzSPismhOqK3UCMzs66VsrbxYl4=; b=RvwZOZBEaBnqbypfdgzxNSfJfl
	F0Ony1q8sf7XlgmwEzHfOzvc2tJOy2dNBH57Kz2Qm2ytM+/vvdrwRxsXuyMThpBSDZvAw93bhJPqX
	EwHPuqY8J7WQ8iOAzLci+ai6GocXpkHCMGQSTjka0lak1zRxNDv8LHDdK+nM025mi1I0llnJM1CJh
	Zw0HIh4oX2iGEGczFs0okZbLS3tugUEtkskocgJlisiZMuUBvzm1+uJz3IZjz9dIlnzN3Dee0mfn8
	rAkRHSSTROGeTEDflilVM4t0tGSFd3EUEgB5zokV5uAKN0h86wSKQi6MxHoREcTkmnCXtba/8oJGa
	Cm39Rgkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UVG-00000003ZCm-1uhU;
	Thu, 31 Oct 2024 12:42:18 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UPg-00000003XkL-121v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:36:33 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 3C8EDA0E1A;
	Thu, 31 Oct 2024 13:36:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=EWnfSa/E3TDYuPzWXzSP
	ismhOqK3UCMzs66VsrbxYl4=; b=bsBp1wd3R7oxbjn+pvTcVaPs1IEbBjigVzho
	8liOxlU3iAnxVSXxrT4Qp/Hz93vf6xWdKq5TWt0x5F05znD6GF9poIZaMj+Q+R3X
	EEPbYIRdHmr8GH2e7C36mc6blHdXCCwyjbXP/IsaTFky+Ni4gozKOYhQ5KjtJsVr
	cyRNUTPKbSQhM8mxovvvsera6vNT1UGTojfnR9yOMdcTGwL3U4xt/q3FLJC3BV91
	D/qEB4UXHAan/kBJ1fjv9B/9JNKVFg5kvCAwPt7Re80HIxdPBLceVfw7eUriSElT
	GDPdq0dxOZNMJswCqDnAce8SB579WE8qJOLqSeauEXIbRLIBq2EglXHFXlSxh1yu
	SL0ngDczD3dnWrYqqX0axBnITluqlhP01avLcxt5cMw04tmol7eJbJlhxzCM/v3S
	Wigi5ur/mVpdAV94l3TwUHYDWBpxrttkpRXRv/iUfg64ULifiTFeg2eyUd6AXI3n
	DoGg69VFtORNDBEw83qXEUlLxYyFg9tM6ddzSSwLEuvw7dB/75tweSLBrNEO5Lzk
	MoQuegi5J7Q5jz6Psn05Tyt+BOH+mkvBWI6Qgik7EtiDvZIXw2VYHw1+Tf/nixak
	nPvCOP3unr29hjGnGIPVsTr8HdKW3M2sYKJ+yXY+YNjrcZLsJ2lW+yI/3+PfAjXt
	ATKHe3w=
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
Subject: [PATCH v4 03/10] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
Date: Thu, 31 Oct 2024 13:35:29 +0100
Message-ID: <20241031123538.2582675-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031123538.2582675-1-csokas.bence@prolan.hu>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730378189;VERSION=7979;MC=2199548629;ID=207183;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053632_458135_AF66E77D 
X-CRM114-Status: UNSURE (   8.22  )
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



