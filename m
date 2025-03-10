Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E80BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFmJVkvgEr7zPfQ20jjW3wMDTUUTOBdrrvb2AdJk2z4=; b=ND7B7Ct52ZmiQ+HEU73ZhZq/aM
	Gntjl2B3b8lSPwUrFuXogIPVVMXblmZ9NurrsCPOPI8C5InxmEVciLNX2k7+KHKlvYu+x3mJVSPfy
	QYkhJHY7kAP9ovyruF/JVq5y88uys2wukbGdNF8iFbFug88A3RdbmmpCIN6/YbNXrjZ2NPGxSmsnQ
	E7t8C/jllL6lkR/gg2yZ6QHBZ5VEFaQKtIkCjuXnfV2S8xfS4cnGLQlJ0bthcqT8NpqQHWtgWRli+
	vTbWNOnPf7c0dL7KQknaJvFNhAQ0HwC1wwc3L5TegKxfRMwoY4SBgkuOrPtW/WLs30ekSRvvHYDSQ
	0nXAtaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgYM-00000003RGR-3OTQ;
	Mon, 10 Mar 2025 17:04:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgAn-00000003MwO-1GBl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 16:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GFmJVkvgEr7zPfQ20jjW3wMDTUUTOBdrrvb2AdJk2z4=; b=drHcdpg1eYRjzrfXnj09IhtRCx
	VIw00/v3SAJAnmkLC5DwcUgfkhYlIOtYJ3FEDp+6ZJT/tecM7ma+o0nka715j/KziZB9kq68QyMm5
	9eCvQJCbeAxlkQLXgkN+QWiffT6ubaq7hTeBp+XxxlGB3qR3uMuG78X4eDmrHvWKRsFsYpWjIYwr+
	i6GCjxrE0SWEjUrBCQWi/zVYEXF1OrsH6uPZrxX1XJw0vx25v6i3paLBN5+ffiCJ6TzBNb0M1s+5C
	z80EAZXNXCmSOV2z32tNgZBVg31/cTItAatMnERt0k9Bu7LSgld8GPuc2a8pwF/5mwpMy8SOhkpEY
	4xbzNHwA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgAj-00000001vpO-1zL8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:40:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 520E041DF6;
	Mon, 10 Mar 2025 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741624806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFmJVkvgEr7zPfQ20jjW3wMDTUUTOBdrrvb2AdJk2z4=;
	b=VlT4BOzSDzwOKvMH3AFVaudzLMasQEOtRQivw/fPBOo3sQGLitdcE5pPg/HakDLuu5fodv
	RBnilJbL8SejASp4E6onzGzyL5P0ZrZtvqtvUOjEt/LcDLTvzcvjaK5lH/dox0xZPHs44U
	VRDUtxdVXa+JV9YBIgj7SDBYhk4YewRDkKCwhYrNlBtYwX4wq4AB7hXyGwL41bHGVD4Cyd
	xjpJeOCJIDyhgPWU/1xQlqql5tWD2vIOkwxEOATAVscV9S5k8LeLoX4hSSy+KYMTJ/ZSrp
	f7h/BxTgSl33OAFqDbN/ceOSm/6Qc07DjNE2osEQLYxRV+uxPp6cP5xm9U+gVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 10 Mar 2025 17:39:48 +0100
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-varsom6ul-concerto-dts-v4-1-6034fda6ec64@bootlin.com>
References: <20250310-varsom6ul-concerto-dts-v4-0-6034fda6ec64@bootlin.com>
In-Reply-To: <20250310-varsom6ul-concerto-dts-v4-0-6034fda6ec64@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FJ/g4p5K4DhZe5aNgiyBGgNgUhTwe26PsEdnxAtkehY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnzxXlMg/BcfWlXJmfaq+uYf55WPEuRwC7kJQiR
 hH6/2m2X+qJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ88V5QAKCRDRgEFAKaOo
 Nh3vEACk/cWrSLz7Db6mxHyQBfgW2xa23PjCQYpq28VNPJd6JgrYhReZSWBv+GjtlOexgtdKqI/
 QbQ7/BrKtROsHrWWBCR+VRY6Wv0+pYxdM9UrfGSyT1dPCZelAxr+u2tZS+H4cNTO3LGiPqvrfb6
 3Vn50hPc7Bh823P9ClbLaJCjFN1c79nnBwijQo9lTqQzRsWDqBDm0g4bMilk/N0QprwR3wdPhX7
 93C0I6R9+GGvWwDPuER1B/QFfz7wUnN+GdusqpjiPQdViNgw/qEA3Z+f2iFOXE3gYV1Z/7hkTtb
 Fc+dRTNhZ60b/6B5q8raXi9zo5lbBS4FAaTiNlL4kau4V0p4x4MFSQicCdW6jwgEhLrCWGuYfVQ
 V3LpRLx5y40mwMdmliL7ICTCvDKUQ5+07dSgsKEl6nlIqTjbHdkyZp7S2OLDEFHtv0MvlT94PEB
 Tc8PvvB7pqlTLxaW0Npj0rSmnxMWy8nvymkZDbE1wdwKJVM8I2v3OUjXuij5kQGG0SdjBRCz+Ji
 7MRnPMcCbeCx5V0Ke2WLvI8gUYSNK+vC+I62eH7TxvzvByJLni8Gm8FBFJvgtqy0PHOvlklPIXI
 tY7ncDpAifzo5G5b6a7gZgtqo+5FTLT8RW9IjuTO9l5Dtsgx0/cNcQUUq9eNWXYPD02b4mlv4/p
 VJGvvfXlUPLwOmg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhgvshhtvghvrghmsehgm
 hgrihhlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_164009_704561_C66517D1 
X-CRM114-Status: UNSURE (   7.77  )
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

Add support for the Variscite i.MX6UL VAR-SOM-MX6UL and the Variscite
Concerto carrier board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0db2cbd7891ffb361e0ac60fe6be66e381b2a8f4..a8f8cb845a2085eb13594adacf33f372185e8b0b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,6 +688,12 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
+        items:
+          - const: variscite,mx6ulconcerto
+          - const: variscite,var-som-imx6ul
+          - const: fsl,imx6ul
+
       - description: Kontron BL i.MX6UL (N631X S) Board
         items:
           - const: kontron,bl-imx6ul       # Kontron BL i.MX6UL Carrier Board

-- 
2.47.0


