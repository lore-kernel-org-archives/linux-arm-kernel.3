Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE58C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U98VHTJnoCJClU4vtKi3XydHHa9Y5G8dke5eY353k8=; b=oURVtGG2IAGMWKqi+z7Yukb2/S
	MNUGcfL5OdgAnUTz8H0T19hNFfYJXRhgZadNmLkG5hSTgWkxPM0IMnjiIXloQhyBgAVoqlCJs/dmw
	6+S0OhWhOdgqhnhdzMBmUqM7HCv/ad/SKmJAk9B483Y6C4Uuj8gffgJJ/NnKn8xgCVUcHEc+ebJJk
	IdrKEgLkH5j0oQxgnjWrtLDMJ0iclndQuhNwAYfW/AMNfAGcf24qCm6s4CugtP4EJglDkhdZb5oO6
	mxau3XgyaJxE0ukr8Ts+fchn2QZtMxl11HjjTTPo2zB2CkzoyEo9F5gUAInzEC6jWzvszR95rZHT+
	F0yV02SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Obj-0000000CmoH-0mqd;
	Wed, 09 Sep 2026 20:09:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Obd-0000000CmlV-1kMh;
	Wed, 09 Sep 2026 20:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+U98VHTJnoCJClU4vtKi3XydHHa9Y5G8dke5eY353k8=; b=qy2zdGcDYJNKNR/BJ0SL9qNE1Z
	EbwwyOIcVQxjWy9hjgABigwik7+X8VnmmdVe5LRyv+2/aFL6cVXyCbSMCScPMhpF96JKbPGAEBdeP
	jplUM2kPIkMQrjY8qJPcVJy0FnkpIjjpydtfWXSy9w15a4P+NRekBXO0M+dYeBezzxfy/GzrOIgn3
	lu/3gG9e4/PO67dLk9ESHrF2gnPP0Ru4okEvUcAPwkQbSTq36PgUnHzk/wPu597vbrXIMHc5Pa1sb
	y0hMfjdJ0b5qSD2Sjq4ZBEiU12VlG67UlbQQMN62iwTtVbx/udeiiPkSXmhZuRTa1oAFPjbaz819I
	yysE4LCQ==;
Received: from out16-185.antispamcloud.com ([185.201.18.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ObZ-00000001dLR-1ZcJ;
	Wed, 09 Sep 2026 20:09:15 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx321.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1x4ObT-003Tal-6H; Wed, 09 Sep 2026 22:09:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+U98VHTJnoCJClU4vtKi3XydHHa9Y5G8dke5eY353k8=; b=t2rYm5bfMxYtEGkc5OiP1vQwiX
	h/sCUqxXGGZ73gyLSz/lpi/Evh9kvI/l1p46jNdbn7a8i5efVDW1kKGCO5G3mb4RIOR4i6zsYnGS6
	0j5YuXTE0Y5057eWD/lDjy43/zCw/y811w8VTcTof9BbA7gFeODH4mWdbwUQunXm8NYJ0B8oLuh21
	oHG+b/3F9uiAWoPL1vc0+nzCbVPExIQprlHdRbnZWLxn3l6QZL8LB9M6fN5ASz6JggnX50GjQTQ67
	hvQ6PpwMUs0FZdhmJ162geUFPPex0sQ8pnOSBi3pzcWSUapYSaV9sWim3Fv2wxt1mVjwOOt2VADDg
	vvPR3HmA==;
Received: from [188.251.249.2] (port=52430 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <dan@reactivated.net>)
	id 1x4ObS-0000000DWp8-1DNV;
	Wed, 09 Sep 2026 20:09:04 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Wed, 09 Sep 2026 21:08:11 +0100
Subject: [PATCH v5 5/5] arm64: dts: broadcom: bcm2712: Add GPU IOMMU and
 IOMMU cache nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-bcm2712-iommu-submit-v5-5-2539c52b249e@reactivated.net>
References: <20260909-bcm2712-iommu-submit-v5-0-2539c52b249e@reactivated.net>
In-Reply-To: <20260909-bcm2712-iommu-submit-v5-0-2539c52b249e@reactivated.net>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00672512193597)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuUotdtz0EqniYeLXSRPpJj4oL0aLKDz7BK4
 AmnE4PQtyyu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIOwqOrUsWnwk6uqkD8xcwQBGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWBp35AJbRNknLgMOj3O/cqXeB7itP8hgjDRserKv4bhb7ubyJcscJCC/8jhyq4eIIJWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5Ay6i8PhAwy
 ohd+GCGjMSaCo2g+pLXSstFFr2Pmsof7eeRHKvLDzn+sBlvbv5VnduIaCC8T432LXhcN9iDypd/G
 jBIJaw3nA0JWQqC5+Jig4CpfjrlgQefNeWcxSH+UCzbtFoUUErjvkjClnO+z3Y8BCB4GKZ8tHsR5
 A+L9kzDG/K63IFf1tTl6XjJBLr8hyqcPiIfzvuBQjcdRxCwh8eiHlonTJYQp6P0LGGk5YcssJBnE
 oCFelNEuPkquluSoEnYwJqEylk1bBhjIWUVQpiEaCXgutbnJ8XLRZlxuyGE4ZkJ+Ct1rytEV3nXE
 30Z2uRLE/8mc4sO+W8vok4IjJdnmU8DTX941WdbezDc4vvZrV3V8zxJiAh4HD0pbHodESl7kaNlb
 x8xIGSNGie95MFeWVyO9Qfhfm+3ZVXwsV2bUYWW4ep6BcO097ndMLXudKQNe6wQxb/xNrVv5jqyP
 WOQmo5yGQxPG/xMZnQ40fhcNtfvkev6/xX+U3yGuqyRgemTtQtCSvx4KxRbJEJ09WFY+0epO6OZG
 ArYx3jVR0FzGbpLboasl4DTMuBftporpB7j1TF3K4aTBfMUL3R9jex5BEvvs2fA5zL3xWHlW2VXa
 wF/lag+DgD9xY7Yj7fvC65xWAU3TJceJXG+jXar6FtDTl6SazWHDhW0k3iY0Nxd1+egvPpyylyRk
 sDtvh9EglVwlBP3PkVHlQGQFk2KBEkFw3+vw1RS8zKP8o2x05FSSJsC7k+LzVpQY05oubiJ9GrzY
 ++DuIQUs/5JJj4C/n4CILpFTKQlqbzX/LSb50zWeMLtz8gacq+U9Dqtm91PWIuQm+gHvhbUQMCQp
 BDD10s62nqJfN6DTVjUszJAalIcW0Bh5dbygTK7jtNAOpOLoYrBwYYKC6XIWdfPsJXrcrDW6vfdj
 zQ6YC7Heg3Xf7O1TOd7yUx++SDY6V9XDGiqeh8jJhxFbE1QSjfwMTndprmVkWxS1mi+nw+nJxqi8
 G/0EWIVJA/X1E5lxcDfs3JvX4rNFly4ThMfV8G5zmJNkDGUg7XNHf6G/7NjKIViWFaEeldR/m2+i
 TN8ji+Mhbk3TTo2Lw6nIoDr0sXUZ7YZoZ/GZ+slJL25ATsZTVifNjYlkFmCz0w5vcdcHI3py3L8t
 PqWAmEN/CjKjK3VVq9SDkpBDU8/nN9BMID38D/++xf97O23y3deP8vNnmz84mDUvZqxnHNc/wp8s
 bbUui5b8WkACIg5AB/ilm4apSU2goW8TQ8+z0w5vcdcHI3py3L8tPqWAC7xZyfryQF81aCkSJYKS
 vg==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_210913_562491_BEFD0703 
X-CRM114-Status: UNSURE (   8.16  )
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

Define the IOMMU and IOMMUC nodes for the Broadcom BCM2712 SoC found in
the Raspberry Pi 5. Enable use of the IOMMU for the graphics/display
block.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 45aa8ec5e2b1..f40651ea29bb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -626,6 +626,19 @@ pcie2: pcie@1000120000 {
 			status = "disabled";
 		};
 
+		iommu4: iommu@1000005200 {
+			/* IOMMU for VC4 (HVS & MPL/TXP), Unicam, PISP-FE, MiniBVN */
+			compatible = "brcm,bcm2712-iommu";
+			reg = <0x10 0x5200 0x0 0x80>;
+			#iommu-cells = <0>;
+			brcm,iommu-cache = <&iommuc>;
+		};
+
+		iommuc: iommuc@1000005b00 {
+			compatible = "brcm,bcm2712-iommuc";
+			reg = <0x10 0x5b00 0x0 0x80>;
+		};
+
 		mip0: msi-controller@1000130000 {
 			compatible = "brcm,bcm2712-mip";
 			reg = <0x10 0x00130000 0x00 0xc0>,
@@ -667,6 +680,7 @@ v3d: gpu@1002000000 {
 
 	vc4: gpu {
 		compatible = "brcm,bcm2712-vc6";
+		iommus = <&iommu4>;
 	};
 
 	timer {
@@ -701,5 +715,6 @@ hvs: hvs@107c580000 {
 		interrupt-parent = <&disp_intr>;
 		interrupts = <2>, <9>, <16>;
 		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
+		iommus = <&iommu4>;
 	};
 };

-- 
2.55.0


