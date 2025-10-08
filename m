Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650CFCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ShxQV+QBks1O6s3AcHyLi5waN6FTYEdtCJKfAmgrLY=; b=IMwxpGh1ojRyP4wpftoKEBqfMk
	vvryOYTGo5cvh2hiRJjqYwn+/+ZRQ6nMDwa3951ndv3iS7K9e14mrMUm78+SDxD+jZZY1Z/U859cR
	DiFFg10XDEHpDNMd4ET156rLoGqbzuUtN8mCZ/aV+S8GW3iSlo4QdTItjo3GqyE4RIFYISch71Oah
	eSQcAPthExPwzsr3kcs+YKiB2wHhN0mpHGUtqGVC34Yy6fWRDxbBkfy0jQ/qLGict4lpHmoxNTmky
	K13Zk2Mbx463auGmlFDMr5lWYRzCtRxfK4x+MJ+D5Uu00vBX2eQCsO7jX9aKwMgCcsLvwBz5Fijsg
	WuNn/Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6SaS-00000003k9t-2qVj;
	Wed, 08 Oct 2025 11:44:04 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6SaP-00000003k8x-3BhB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 11:44:04 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251008114354epoutp04933cbe57227d3808b878baddeb9bf89d~sgWcp77-l2133021330epoutp04a
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Oct 2025 11:43:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251008114354epoutp04933cbe57227d3808b878baddeb9bf89d~sgWcp77-l2133021330epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759923834;
	bh=7ShxQV+QBks1O6s3AcHyLi5waN6FTYEdtCJKfAmgrLY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=c6gVpSEZzX3u973srcW964ta+l3MuKoscDYuL8t00/tJGbBz+vxvH1F20DVdmBLCN
	 lKKDBZ385sdQoV151A4bDcqC77jG6D63lXdxPzcWoYMfA0Kz1LIXxsgyLtaKIu1iAR
	 OJsf/WtvM0hcu7MnhiFPMAHOHfkeaJQzulP0+Lo4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251008114353epcas5p1aacdfdc53c4473342326e6aed62b5960~sgWbtqMV61645516455epcas5p10;
	Wed,  8 Oct 2025 11:43:53 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4chWP43m0vz2SSKd; Wed,  8 Oct
	2025 11:43:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251008114351epcas5p28f9d1b04c049993b7cc873de492c9460~sgWaQEc-q1865818658epcas5p2Q;
	Wed,  8 Oct 2025 11:43:51 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251008114348epsmtip1c900e626d8c700dcbca7182958142c89~sgWWyKrGI1381513815epsmtip1_;
	Wed,  8 Oct 2025 11:43:48 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <c33a26a8-a054-4ce6-86d9-4945014f69cf@kernel.org>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Wed, 8 Oct 2025 17:13:46 +0530
Message-ID: <002301dc3848$d171a900$7454fb00$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcA7fJUJgHIrfZJAofpNyABqVtXsAE6XDP/AshrECECD6P74rPGYQWA
Content-Language: en-in
X-CMS-MailID: 20251008114351epcas5p28f9d1b04c049993b7cc873de492c9460
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
	<0df74c2b-31b9-4f29-97d3-b778c8e3eaf1@kernel.org>
	<007801dc2893$18ed4a20$4ac7de60$@samsung.com>
	<02ef5180-ad56-45f0-a56f-87f442bf6793@kernel.org>
	<007f01dc2b81$84ef19b0$8ecd4d10$@samsung.com>
	<808d166a-b615-49c6-b0f5-bf5101721381@kernel.org>
	<000001dc380e$612b5680$23820380$@samsung.com>
	<c33a26a8-a054-4ce6-86d9-4945014f69cf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_044402_466894_BD5AE4DC 
X-CRM114-Status: GOOD (  21.35  )
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

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 08 October 2025 01:42 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On 08/10/2025 13:45, Pritam Manohar Sutar wrote:
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 07 October 2025 11:54 AM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>;
> >> vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> >> krzk+dt=40kernel.org;
> >> conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> >> conor+andre.draszik=40linaro.org;
> >> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> >> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.o=
rg;
> >> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com
> >> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; lin=
ux-
> >> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> >> linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> >> dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy=
:
> >> add
> >> ExynosAutov920 HS phy compatible
> >>
> >> On 22/09/2025 14:26, Pritam Manohar Sutar wrote:
> >>> This phy needs 0.75v, 0.18v and 3.3v supplies for its internal
> >>> functionally. Power Supply's names are as per phy's User Data-Book.
> >>> These names, (dvdd, vdd18 and vdd33), are considered  for 0.75v,
> >>> 1.8v and 3.3v respectively.
> >>> =22
> >>>
> >>>>
> >>>> I still cannot find constraints for the rest of properties, though.
> >>>
> >>> Sorry I didn't get it completely. Can you please elaborate on the sam=
e?
> >>
> >>
> >> Writing bindings and introductory talks elaborate on that. You add
> >> properties without constraints. That's not what we want. We want
> constraints.
> >>
> >
> > Have added only supplies in this patch-set. However, was going through
> > schema example and it says nothing is needed to define in terms of
> > supply.
>=20
>=20
> I don't have original patchset in my inbox anymore, so not sure what was =
there,
> but most likely you miss constraining the presence of these properties pe=
r each
> variant. IOW, not each of devices in the bindings have these supplies, so=
 I expect
> syntax similar as in example-schema.
>=20
> https://protect2.fireeye.com/v1/url?k=3Db15f03dc-eee70b7e-b15e8893-
> 000babff88b5-a120365cc01c0261&q=3D1&e=3D61c09dc1-e3de-4b16-b34f-
> edc1fae43bb8&u=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.19%2Fsour
> ce%2FDocumentation%2Fdevicetree%2Fbindings%2Fexample-
> schema.yaml%23L212
>=20

Yes, this was already considered based on Rob's comment and
snippet is as below.=20

https://lore.kernel.org/linux-phy/20250806234217.GA2030512-robh=40kernel.or=
g/

+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usbdrd-phy
+    then:
+      required:
+        - dvdd-supply
+        - vdd18-supply
+        - vdd33-supply
+
+    else:
+      properties:
+        dvdd-supply: false
+        vdd18-supply: false
+        vdd33-supply: false

I understand that you have lost the context, my bad.=20
Let me share v9 with all RB tags added in v7 and v8 and=20
let us have all consolidated review one more time (sorry for this).

>=20
> Best regards,
> Krzysztof


Thank you,

Regards,
Pritam


