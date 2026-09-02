Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6D1C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U98VHTJnoCJClU4vtKi3XydHHa9Y5G8dke5eY353k8=; b=ElKt1+LY7gNydd+uZRbiYEjx6c
	a0yqaUADnjkeqUMMRq6SmcgXGcaEzau7c8taHjRZZskAOEZVmCnANR8swNu96cUciV6lWuwHoS7/s
	Cwmf0b/v/dv6fzUHdadc6u4mu49UXcRMVTCXx9hxhzvdBED5SBlBRN0FQNFoCrVDGsUVoMxF44L+1
	8NvxejPdG88KqHROjlwNs/+q3h1eqmyehvmPWeH1TZLhlBkb5cIEm3pAbBXYV3kZu+vcGZMAHjiW+
	xtjw+ILF/aUN97zKd92aOloJ/hU8/y6QSH4hxKVmKoLrzmRsJLkYvRsX5OjbbRjYBFAI+un9RTg0Q
	VX6EwAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pED-0000000FW8B-1oBX;
	Wed, 02 Sep 2026 17:58:29 +0000
Received: from out12-174.antispamcloud.com ([185.201.16.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pE9-0000000FW4R-2YVe;
	Wed, 02 Sep 2026 17:58:26 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx322.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1x1pE1-009oh3-6C; Wed, 02 Sep 2026 19:58:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+U98VHTJnoCJClU4vtKi3XydHHa9Y5G8dke5eY353k8=; b=zdO0zaf7qNBSQeVjPDM4QtFbdg
	AN0FKTlS+WtrHf0tj/jKzrRjV4y3HZoFcKcW/Z2zNFJ1yyhoA0N6UIE6F/htRkMQImaeo0bqVafxW
	pbb3v4FeUYSmbkLOpMgzLGcbUsRy6Iub4UjaNfiHyECLv+uaOR4DsrRwOiatkkc/1XooKFGYLvHSi
	UKd5YvzP77ca9GPOWamEHtLHmYeR9E0AvDD0Sra1IbrGO2mpmeOul76TwtXckkYw99/aLpD8TfaDH
	P6cXeyKGzGTzEBHmdT/Sa0kfbk+v3MLI4A7bOefiwn+SRO/L+hfkF3byn1oui0FNmMbPcEIfuoBKY
	IoVQb9vw==;
Received: from [188.251.249.2] (port=45118 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <dan@reactivated.net>)
	id 1x1pDx-0000000F9KQ-2gCz;
	Wed, 02 Sep 2026 17:58:14 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Wed, 02 Sep 2026 18:57:07 +0100
Subject: [PATCH v4 5/5] arm64: dts: broadcom: bcm2712: Add GPU IOMMU and
 IOMMU cache nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-bcm2712-iommu-submit-v4-5-9dbb657578c1@reactivated.net>
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
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
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.0067731402425)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXPTXrqbLhK6UNQeYl88mCSTcQmDfZvca+5
 2pjxjOHAtyu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIOwqOrUsWnwk6uqkD8xcwQBGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWBpY9ovdkP9RmEvieRDWoEFGZ7f+7oeClYYrL6OxfWC1jM0MOKiGRkxO3FaI58br05WBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5AyJ9N3+CB9
 4aFbAhtG8w3Ly5ZVKmISsN3IhGLWYd0758XIiXx6YYOeazosCcxmb7RWPITtorGl87DPy4ds+UWq
 MUZTL/tWkSfK5K31nzL0AFHJBtc8x8t5TwPji0j+tEORarofO5AIaedOveY7zQj5YZ/cd7uPDhKh
 WGZMn/d4/04OdrifJPLFYXIpN2MC8oCi+3TnddL52Wxml9vX6xG9HT1hMqJwIOFdI2S/IkjHcgoN
 +lE++lajS+EBz4etym25QPOIjlkSAfAYMUguLL/iJ3dHHZk8+BacxJzH0Weev4hlgCBkpmIIyJOF
 ryTdK/1e0oTCxtGGr3tflBYFGrNrmHsCV6TDdtit68pQ4Nki0TzxZwPxmW1OTT5gM4+GMuFG0h5K
 1JfG3OtnsbD10lahPkuf+eM3l5KPnbp/eQthjVMIXiM548XiUPzdeM2DpJkNlS+QlzUpPwM5oicr
 BfHSx0cq8sPOf6wGW9u/lWd24hqw3yFuMpe/j6ywHoVhi9eN8zV1w9vIuEkKCYJ47Q917xCQbH1y
 M38733VOnxhw2U5RfvwcBhGdh7y1bw2tAk6MiqGkBrRAoXiKcRnEPA3cog/JkEYusjKvZuah7Eo5
 LC3lag+DgD9xY7Yj7fvC65xWAU3TJceJXG+jXar6FtDTl6SazWHDhW0k3iY0Nxd1+egvPpyylyRk
 sDtvh9EglVwlBP3PkVHlQGQFk2KBEkFw3+vw1RS8zKP8o2x05FSSJsC7k+LzVpQY05oubiJ9GrzY
 ++DuIQUs/5JJj4C/n4CILpFTKQlqbzX/LSb50zWeMLuo5Hnmju/07lE8IgUQIRKq2N/bp3cwIvg1
 2Mf6vRseTqJfN6DTVjUszJAalIcW0Bh5dbygTK7jtNAOpOLoYrBwYYKC6XIWdfPsJXrcrDW6vfdj
 zQ6YC7Heg3Xf7O1TOd7yUx++SDY6V9XDGiqeh8jJhxFbE1QSjfwMTndprmVkWxS1mi+nw+nJxqi8
 G/0EWIXX8bOwrtW89m+3fa3mCGC7ZpCUmSZ9iG177dYc0ZbObnNHf6G/7NjKIViWFaEeldR/m2+i
 TN8ji+Mhbk3TTo2Lw6nIoDr0sXUZ7YZoZ/GZ+slJL25ATsZTVifNjYlkFmCz0w5vcdcHI3py3L8t
 PqWAmEN/CjKjK3VVq9SDkpBDU8/nN9BMID38D/++xf97O23y3deP8vNnmz84mDUvZqxnHNc/wp8s
 bbUui5b8WkACIg5AB/ilm4apSU2goW8TQ8+z0w5vcdcHI3py3L8tPqWAC7xZyfryQF81aCkSJYKS
 vg==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_105825_659760_B91DA81A 
X-CRM114-Status: UNSURE (   8.59  )
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


