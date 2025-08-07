Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7112FC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9yyMjJ6Z+ujgBsWuyrsPhhrjWzJPw1UoObDzyEPgL4=; b=HH+TJPwX5h2g75jsmEqsZ+VnXz
	TaG+bwgnaKBKID3kSnjcMyxSAJGbTEIQhcgFptCMYizvlElU7iyPubstLDi4KAxIWo0KYvT+O3Agx
	xr79e+40N33L8WukNmftrnkBc5iOiMl8xIK9VFwVtaJzE/aWG5d8owUiqa6MsA641Cb9Dj24dvx5x
	hK/5+Om8W6kqBMg01tfbcIZ9CMA8r6oenWFROi84WtCzoucysG5NCDesQmPLrZ33eXxy7ZOTFG5xe
	14Icy4jooV9TeYzr9KZmTg+XbFT3gjyb+4AwXaQPXt7+XarGFEf0gOZJi4URdSPHdczlHBtb+Lfoy
	NM5Uq3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0En-00000000d2U-47Du;
	Thu, 07 Aug 2025 13:00:54 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk07y-00000000brV-28R4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 12:53:52 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250807125343epoutp033e2f22d8b94fa2251e54fa2608ef0383~ZfTs-LK7_2178021780epoutp03r
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 12:53:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250807125343epoutp033e2f22d8b94fa2251e54fa2608ef0383~ZfTs-LK7_2178021780epoutp03r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754571223;
	bh=Y9yyMjJ6Z+ujgBsWuyrsPhhrjWzJPw1UoObDzyEPgL4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=E9pOdQfq4Qa2TdxuASOp5se5gRtcVeNTzuHVeusffcLZYFYKZ35xpBKe+dkW8KY4b
	 gCleL7e6RdpthnFxPvyOLofetQwtL6bb/zX8TGGa3qNXHMJQVw5N4lNZys1ePsuVQG
	 QweD9NdVskdjUHUsAw0OVN8eQdUVW4FQsWRlRYiA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250807125342epcas5p4cdf059b042ae879c14d7be75965eb1e8~ZfTsXP8_y2236622366epcas5p4G;
	Thu,  7 Aug 2025 12:53:42 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4byRtF4R8Cz2SSKX; Thu,  7 Aug
	2025 12:53:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250807122107epcas5p3978bf8e0b47f7d228a5c54d5bfe0a243~Ze3PYb-jU2564125641epcas5p3K;
	Thu,  7 Aug 2025 12:21:07 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250807122103epsmtip110f44008e2ef1b2699b700ad35390c96~Ze3MRHzto2980529805epsmtip1D;
	Thu,  7 Aug 2025 12:21:03 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250806234217.GA2030512-robh@kernel.org>
Subject: RE: [PATCH v5 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 7 Aug 2025 17:51:02 +0530
Message-ID: <000001dc0795$c0432660$40c97320$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+ZgWj3OwstM5ZbwFL0KmcSzrOlQJdB2aaAjkoxRUCiVKxNbLZYP5A
Content-Language: en-in
X-CMS-MailID: 20250807122107epcas5p3978bf8e0b47f7d228a5c54d5bfe0a243
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114306epcas5p37782c02ae0ddc6b77094786c90af247a
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114306epcas5p37782c02ae0ddc6b77094786c90af247a@epcas5p3.samsung.com>
	<20250805115216.3798121-2-pritam.sutar@samsung.com>
	<20250806234217.GA2030512-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_055351_191417_8E1799F9 
X-CRM114-Status: GOOD (  18.65  )
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

Hi Rob, 

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 07 August 2025 05:12 AM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Cc: vkoul@kernel.org; kishon@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
> peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com; linux-
> phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; rosa.pila@samsung.com;
> dev.tailor@samsung.com; faraz.ata@samsung.com;
> muhammed.ali@samsung.com; selvarasu.g@samsung.com
> Subject: Re: [PATCH v5 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
> ExynosAutov920 HS phy compatible
> 
> On Tue, Aug 05, 2025 at 05:22:11PM +0530, Pritam Manohar Sutar wrote:
> > This SoC has USB2.0 phy and supports only UTMI+ interface. This phy
> > requires two clocks, named as "phy" and "ref". The required supplies
> > for this phy are vdd075_usb20(0.75v), vdd18_usb20(1.8v),
> vdd33_usb20(3.3v).
> >
> > Add a dedicated compatible string for USB HS phy found in this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> > ---
> >  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 19
> +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > index e906403208c0..1932a2272ef9 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml
> > @@ -34,6 +34,7 @@ properties:
> >        - samsung,exynos7870-usbdrd-phy
> >        - samsung,exynos850-usbdrd-phy
> >        - samsung,exynos990-usbdrd-phy
> > +      - samsung,exynosautov920-usbdrd-phy
> >
> >    clocks:
> >      minItems: 1
> > @@ -110,6 +111,12 @@ properties:
> >    vddh-usbdp-supply:
> >      description: VDDh power supply for the USB DP phy.
> >
> > +  dvdd075-usb20-supply:
> > +    description: 0.75V power supply for the USB 2.0 phy.
> > +
> > +  vdd18-usb20-supply:
> > +    description: 1.8V power supply for the USB 2.0 phy.
> > +
> >  required:
> >    - compatible
> >    - clocks
> > @@ -219,6 +226,7 @@ allOf:
> >                - samsung,exynos7870-usbdrd-phy
> >                - samsung,exynos850-usbdrd-phy
> >                - samsung,exynos990-usbdrd-phy
> > +              - samsung,exynosautov920-usbdrd-phy
> >      then:
> >        properties:
> >          clocks:
> > @@ -235,6 +243,17 @@ allOf:
> >
> >          reg-names:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - samsung,exynosautov920-usbdrd-phy
> > +    then:
> > +      required:
> > +        - dvdd075-usb20-supply
> > +        - vdd18-usb20-supply
> > +        - vdd33-usb20-supply
> 
> Presumably the existing devices don't have these new supplies, so:
> 
> else:
>   properties:
>     dvdd075-usb20-supply: false
>     vdd18-usb20-supply: false

Appreciated for the suggestion. Will add this change in next version (v6) of
the patch-set. 
Snippet will look as mentioned below.

+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usbdrd-phy
+    then:
+      required:
+        - dvdd075-usb20-supply
+        - vdd18-usb20-supply
+        - vdd33-usb20-supply
+
+    else:
+      properties:
+        dvdd075-usb20-supply: false
+        vdd18-usb20-supply: false

Thank you.

Regards,
Pritam


