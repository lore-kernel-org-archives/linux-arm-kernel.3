Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2E6D132A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bF9Uq3Q8dX1adVB/pmYg1Vw77dvx2Gt3C/hOrtDal4=; b=sFviOSFbdXvz6woyFSVI/LKjUe
	rCOTTixm7weuPrke7prL+viU2CHTNh0917VPmjCvmpAoJZoe4PuwmdeBZ753JUSvnMSzjqcWc014m
	yuWwe+sDVDmlDdBH06NgcqGl0hHpgcaka1XiZKN4WFMDSzJCEu6BtfOEKxebVsVuJ1yYA79S4nnqm
	BjDxIX1gdUH636fztSgrbp2W0Om3I+iYddcDn3tQdlxcnkFixQsGJRt0SG8mZEsYEGqBkS9VPXEbZ
	D4Go1P8dTJMS85S0MXySgkG0hfQLuv84PtQOxJVG7Ja8k7K7HDyP8pXmQdT/2x5BTKb22isZ0f/GA
	KFZAOWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ttB-0000000DF3T-2pJE;
	Mon, 04 Nov 2024 10:00:49 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7thZ-0000000DD9K-1ssk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730713729; x=1762249729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4bF9Uq3Q8dX1adVB/pmYg1Vw77dvx2Gt3C/hOrtDal4=;
  b=q4rEOsAt5h2kekpf4nU00qoLNXj2Y7pw1AE+NSi0fnKWyEZ/vp8pT9ll
   6xCF9+QJMHD/C3bsmAnwJYs/vnm8ODbLbM7mgvUQVMHF8nbmqwd6Y36Si
   YpNzDkNG+dBSe0Ti6K5oJPj7IDpVjw/d+6P49FDU9G0E0jIIwl2C52VkO
   YF0KzvdO5UOwau/lhRVRGe/+TW95lfEouM14t3ZvfVsK2ncLI4WAnTlt0
   Cn42UEJWdvCovLQhXCmPdS1Snv5AMGISRyFUlT94UV5Qn3gjaJIu5vyhX
   AestfeKyOql8CFS9d8NoP54UVzbw1RDxoTIGhzD2MUjx6frQ+iT3jEKPW
   Q==;
X-CSE-ConnectionGUID: FJihrQ4eSoSnsWD8yr+YcA==
X-CSE-MsgGUID: A/ojzjwQTSy9JlGXM/frGA==
X-IronPort-AV: E=Sophos;i="6.11,256,1725314400"; 
   d="scan'208";a="39827140"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Nov 2024 10:48:47 +0100
X-CheckPoint: {6728987E-32-F5DC7025-F79421CB}
X-MAIL-CPID: 7CAA90896B5648B07D4AD14BAFC460AE_0
X-Control-Analysis: str=0001.0A682F28.67289880.00F8,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA5DD1692CF;
	Mon,  4 Nov 2024 10:48:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730713722;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4bF9Uq3Q8dX1adVB/pmYg1Vw77dvx2Gt3C/hOrtDal4=;
	b=iM07p21m9vLjmMaFAnfwkNerfr5GgwT8dNf6UEIt+ahRyx3/Gzjlsl7ICCfXzQVTfGT75L
	vcfP6fcLeNEiW+H1umVkWzMA6+EGkebQx5c1K/19bTFr8cbS6tdO2PLe/LIEjAd49gypGt
	d5IK3op7TrJjeRUq5KU38CKHMwGRJ0h8MtYkRf5ZtAyO6NskTji3aP9HLakF86eRrLuiCc
	wD4A5BjZISbASLw/cmRgE1S6wuKMVUGwEu75BzwXWt8qKNLcWaw6z6CfrZS4r1631nG4mv
	rIACJ8o92zmi0AaeGULxR247RzQANOF9r1m/GxgFhUuqHl8bzo+P3K6gCkOW2A==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 1/5] dt-bindings: usb: dwc3: Allow connector in USB controller node
Date: Mon,  4 Nov 2024 10:47:24 +0100
Message-ID: <c8c9f19c300378916e920f5d3c26c67bac95d143.1730299760.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_014849_829606_843CE786 
X-CRM114-Status: UNSURE (   9.24  )
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

Allow specifying the connector directly in the USB controller node, as
supported by other USB controller bindings.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 1cd0ca90127d9..2976fb1a58061 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -68,6 +68,12 @@ properties:
         - enum: [bus_early, ref, suspend]
         - true
 
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+    description: Connector for dual role switch
+    type: object
+    unevaluatedProperties: false
+
   dma-coherent: true
 
   extcon:
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


