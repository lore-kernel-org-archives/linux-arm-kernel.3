Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46118C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U98VHTJnoCJClU4vtKi3XydHHa9Y5G8dke5eY353k8=; b=O46A9zMexivuW3BNc7ioocaHn8
	eWYRn/vkICcm0o+6yBP7dzpRZMua5E89kIIeE1Cy9JO915XHaykitv35pkBpExNf0z3OCswkhgOJ7
	7kIEzV2EUFVeHBMDmPJp0WxTIPnQzh80RYjPaTinBnieuA9nCM1EC5tCCcJQrIJ1ZVdpeJf9OM6Wq
	WfONhdWP15qTOwWiIjMDbJIVy/wmBynY8u2LtH/9axvaFGXfJtD3DcuFGfshZWGO9O3yvSNnJ33wg
	yv7PHvVOAWyBg/pOjYPcSyGxjInGEjZBtclou2iSGqju8FyqAdjSbQA1bGgmAw0Y3RGyKdwd52gA3
	lmd5ltaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyD9-00000001SSp-38Gi;
	Tue, 25 Aug 2026 20:57:35 +0000
Received: from out13-173.antispamcloud.com ([185.201.17.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyD0-00000001SOp-1ha2;
	Tue, 25 Aug 2026 20:57:27 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx321.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wyyCt-009yCr-De; Tue, 25 Aug 2026 22:57:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+U98VHTJnoCJClU4vtKi3XydHHa9Y5G8dke5eY353k8=; b=lDal8ZLnh5dmyAq20fBfmuv7MY
	l4i/pW4yYCw/tmp7TTXfS9nGQnC2lJR1/MOYFPiSHJmpULu1Or0FLFSyINpcbc7pQXtYGbJsP014h
	6y3t+oRrRZgzswOQOTIPszs6Nx6v/iZZM9vl/B0vh+zjNJTe5qM/k6A2/WIbyWsV55rURi+7bhpNI
	PskTXI/jjCJQSxVgVjGioZjLJiqKP2byp+kF2nAx0ta7hN4tI4yg2SYGeKAyXdyOL/Z0hB8MNJACd
	ombvQdIN01QN7hLvlpcjFLBpJ+tq1INm7CdGIikZZTSkYQZiALTMDxRjBxyoS20Fc2IYp7gbBDL/N
	sbDsaUJg==;
Received: from [188.251.249.2] (port=59110 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <dan@reactivated.net>)
	id 1wyyCr-00000007Cd8-0I5r;
	Tue, 25 Aug 2026 20:57:16 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Tue, 25 Aug 2026 21:56:08 +0100
Subject: [PATCH v3 5/5] arm64: dts: broadcom: bcm2712: Add GPU IOMMU and
 IOMMU cache nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-bcm2712-iommu-submit-v3-5-7f143e7289b6@reactivated.net>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
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
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00684167432342)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVOT+A2Kg7Fq7YwtVrRLGVygN4JWRjTqyvf
 DSrj/vbnVyu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIOwqOrUsWnwk6uqkD8xcwQBGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWD7cCGtDjbxRVgnsKOrWMc2eB7itP8hgjDRserKv4bhb7ubyJcscJCC/8jhyq4eIIJWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5AygJMVWPun
 1fB37VxVhASG8hN+IElQvHervZEzNuSEoswa+OggXLEoEANlDvY/gFZy/MXBXk8D5mjUeQRayE6u
 dz97s/DG8E3upRpJ0bS+wzRBHUR15RaqDwm4ioO24b2V/xoVM7xa9YKQVz3PCbzL9B0khM/Q6RX5
 n4wBXe4eJbd26ZpMsCKGEUNQoHD1dBwhSjvFGee+Sma/00rxpBtmA6JtX1tl9hlvVkB9JeTcvfje
 ogVSYoS8EzjRInfDtnb9xonw6auRGB+OqkfrxZvcAu63p/UbUTcmIpuXtxg/CxkM6Ccrh6NgeWPZ
 s2GGiUiSf3BA53ZrBURq7d95Cv9KDCFTYFcUbz5aS+1lWj4m3FNu1rSqDrVNGOYEXgKxu9VpMkhE
 mWb0+yA4G0yKmjhEqma1+/4Wol0EDMzOaSXdF5ul5d/P34eiOeGg3eceP8JBR+Z2rauNhtOAipyU
 VUOpJpoR8LmZMG0KW2fLvmDcwq5ovx/jotULrGAMzuIdJELu9Wrt/oF2ofKYeezPZTW+uJOuOlF5
 x2YtjfaUnDylc396zd5b9fxPYcgbuN9DD1eMzs1Q66kV+UAovquwsOu3XxP+6w9smK/hg5o9u16q
 yIzlag+DgD9xY7Yj7fvC65xWAU3TJceJXG+jXar6FtDTl6SazWHDhW0k3iY0Nxd1+egvPpyylyRk
 sDtvh9EglVwlBP3PkVHlQGQFk2KBEkFw3+vw1RS8zKP8o2x05FSSJsC7k+LzVpQY05oubiJ9GrzY
 ++DuIQUs/5JJj4C/n4CILpFTKQlqbzX/LSb50zWeMLtz8gacq+U9Dqtm91PWIuQm2xDvQwKzzdsI
 7TYy29zNpaJfN6DTVjUszJAalIcW0Bh5dbygTK7jtNAOpOLoYrBwYYKC6XIWdfPsJXrcrDW6vfdj
 zQ6YC7Heg3Xf7O1TOd7yUx++SDY6V9XDGiqeh8jJhxFbE1QSjfwMTndprmVkWxS1mi+nw+nJxqi8
 G/0EWIVbz7StnzDMV8fRd3yoW2k7yN+hG4BzNMiSVhwzB5XeanNHf6G/7NjKIViWFaEeldR/m2+i
 TN8ji+Mhbk3TTo2Lw6nIoDr0sXUZ7YZoZ/GZ+slJL25ATsZTVifNjYlkFmCz0w5vcdcHI3py3L8t
 PqWAmEN/CjKjK3VVq9SDkpBDU8/nN9BMID38D/++xf97O23y3deP8vNnmz84mDUvZqxnHNc/wp8s
 bbUui5b8WkACIg5AB/ilm4apSU2goW8TQ8+z0w5vcdcHI3py3L8tPqWAC7xZyfryQF81aCkSJYKS
 vg==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135726_467509_3BF96C07 
X-CRM114-Status: UNSURE (   7.95  )
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


