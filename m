Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2955C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UteMe9gZB21qEfsvoegR3ARf01qZ/ZPY+2eTrayK8Co=; b=uOwGyfIVanxbMk13WP5g1WmlEX
	m7BoE+fkPpJjy41LYpl7Up5EGdvsyVQpRX/uZiWhGCktLTqUtiUtrYDSc+YnSlIygi4WasK4qvuaW
	f7xttX1Px9fZ6JSldL4FeVE3ANFuI1KXq2N9jr/dd5DmUz4kyFHzMJNf6HradM7wfaKb9N1bRTcx2
	S2Sovf67iUBVXB8Wizv4aGaf7XZ9NXhgAb6lZkLLSJx/ZQL2ES9giXSOhvwlcIXqXHEhm3S3HCWtx
	VIZLkkbMs2/F0BZqkaIH0Ag15iMnLz12MS4EZQ7YZt44C+iCKWZSBy3Sq0CQP0uOEKkwZhVFfc+of
	FivYjZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSCt-00000003t0P-0f2k;
	Mon, 27 Jul 2026 20:45:51 +0000
Received: from out13-75.antispamcloud.com ([185.201.17.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSCV-00000003smn-3DHo;
	Mon, 27 Jul 2026 20:45:28 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx198.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1woSCH-00FEI6-2b; Mon, 27 Jul 2026 22:45:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UteMe9gZB21qEfsvoegR3ARf01qZ/ZPY+2eTrayK8Co=; b=C1iVzC86E2vkRoMdzy/T51aBft
	UZFSeYAkBWFcQi0PBihZEshX8f8m26Wp7grKyEI5297315dfFQAKeh3CkfO1VEfwLcwk1SPEfkao6
	ItxGWHXOL4GQLWllcSeneJ4H6nS3uYtDuS9796VaIezITMyyQmew2K29m7Gl02AYCyEvsyEDzUHGF
	raZDNSNRmIc/kb+Rr82hYuRJkZPytdTgr77aEwfvhwOHzZZXE213Hzr+jh8xicmp0IBfUuFOGT4QD
	uFEjLcmKUZwQgZQbyPXt1OmxG9TZCqsvi8QAc+tazweXLDVPhH0ysPzMj5YRDpf8obQhcBF91OnEB
	sa8Zb73A==;
Received: from [188.251.249.2] (port=52006 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1woSCE-0000000AlhO-3eIR;
	Mon, 27 Jul 2026 20:45:10 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Mon, 27 Jul 2026 21:44:00 +0100
Subject: [PATCH v2 5/5] arm64: dts: broadcom: bcm2712: Add GPU IOMMU and
 IOMMU cache nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-bcm2712-iommu-submit-v2-5-0247b5c03de8@reactivated.net>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
In-Reply-To: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
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
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00635946595888)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuW2GhYG9WM1fFMxYr/A4ZjSBWLZU/SZvEk0
 DSBlw2hBJCu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIMTC/Cs0+0u0sU/cx0RUV6MGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWAIN4GsiK0O3K+JEByc7IobeB7itP8hgjDRserKv4bhb/pXHHNX+LCF5x5jewa7FkNWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5AyO3cajqKP
 N2TQucmsPqkADN9YaMSDrgb8f3EnZj8JSSVcMQtcPaBj0oM3kYoQzFFh/1fSrLRlrfqhJUG8z4R9
 /uECIyfb59UKcPyKB7/seAhbEXLAIlQO41grCDpV7x4SG0sbLPkEPwaTR9JCgIIwUaKDJQlUrg+c
 sO2wlDq1j4FhXBjpwUH3T5DwogMcW3n9eq+zqef+wJHXDp70tdmxlpLzlnjbD/7Y4GiVM0Vs+iZc
 VYJfyg12CBbscT1cNN1Jsfa3HCw6gGU1+SdwTBKf9HkMLWk/C0vLNlLzxrmqyasitZFgJIlVn1LH
 h1zXo+HQWBsS3EZt9a+xyS/dOq7TUqYyGJZd46kBXaReSYigCAhlVRgJDS0AzAOltsq3PRbZ63Kg
 QzPNdZuTKxU6aj16VjYz3CPunnl+LI7l5fzInLuGrwLN0VeqvzLlcRxwGgEvNMtirEVgSD8PZy6W
 zRj7WHIZl76lsW55eQV2n2lY9hpC2YtTBQO/Nu6TVwO6CV7e9KZY7AUftyem5JXm2HSubn2WKeN5
 PBvIRkiU4E8H4e7X9sw5VBsaDF9CxNBjABkH3hTMjGc3lQAtuckU+MNQlLpWhjjykqbde3UjWoF9
 cBo9q3T2iWmfFRW/Psbz8QFVy0V5rN3M2TZ9grsaBV7hOgCSkfEzb1aIdlnbLZp4DCYOuNFQ+5eG
 III/qgXB3gv2NI/ukWuQBNrXV+EmIqM8SxKOhcObZXWnkEw+6F9CGyYC9AhR1ZLKC40YaZQ+trtn
 c3HOUHNRces2OQfEVEXjAldSSgDh65Tx0HVW0TLZh0mizxFc684o/A69h/CvHI/GeXW8oEyu47TQ
 DqTi6GKwcIp24VOsP5eu885wo+t+ynT3Y80OmAux3oN13+ztUzneZGHdcUfaxYq0ZH+Cc9iqnocR
 WxNUEo38DE53aa5lZFsy2onypIM6qetbKE/25wcBMqszonzcp5SiMMdbPL5kkC2FWZ33728NGWo2
 KfadmYRr3Z1SFe+4OrB9Rro7EpOy1Um2iVRPSUxhtw3wz3yqYcOpyKA69LF1Ge2GaGfxmfp09oMS
 l8c4ShQ//ve+MHzjs9MOb3HXByN6cty/LT6lgOv2AzRyYGlsi3xQeIJ6TM5o5F89lTjPCn99uwfA
 g5wm8t3Xj/LzZ5s/OJg1L2asZ/4te3BTDYEBZZ1yPQnIH5IVn/pKnch3lmmwSrgldH+Ps9MOb3HX
 ByN6cty/LT6lgO+c9AHZZ12442bv/l3jZJg=
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134527_812259_2DABEED7 
X-CRM114-Status: UNSURE (   7.79  )
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
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc..2e0dcf8ccd4c 100644
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

-- 
2.55.0


