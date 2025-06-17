Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF90C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 01:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpZ1RB5ujoYUFLrWZd+Soph740N6pKm7nhRUWlK+mb8=; b=fV2ujx6rTZEVtyeQ+duQeu8TwZ
	cfrKb3NIs7GeEbJF6dH9cyC+YjdjyJBEmPDIYZmg+O0bvparOBJ2d05NKTouqxpIC9LQtzWa/GarR
	6jOkvSIecOuqn6bag9kvmPhzD7HInBszAeWI9r4I6P4wq7+V9eW57dUbBd7hj77K+m3c4tMFEhG24
	M5Nilwn1d1GuSG3q+0Lx6UCsL8kdQu5aGcQ90FWQTvHS6p1OKRGFgskvJCNvVZPFJnoOQOS0dYs+M
	OTPTn80C/oYd3jos8TCfxU1TPoULciG/W6MtxRGqIkxGAl42L2pLMWsubalanQ7GzLQQSOv7GsRvx
	OitRv6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhas-00000008kec-1zkW;
	Wed, 18 Jun 2025 01:28:02 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhRG-00000008jlU-1cJk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 01:18:08 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250618011803epoutp03029c5ff63ec909e990f39b2d223c6683~J-kCchaFR1552615526epoutp03P
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 01:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250618011803epoutp03029c5ff63ec909e990f39b2d223c6683~J-kCchaFR1552615526epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209483;
	bh=MpZ1RB5ujoYUFLrWZd+Soph740N6pKm7nhRUWlK+mb8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=OEgcXu8iKlUgh+2/ccQahqZq8huHXyVrj+jZ0O/0Ad7KgkJcAegvkgfrfr2k9giI8
	 rjh+KlIk52IPFzo81pDE2ZeB25af8tRRfSgq4DPwxSqiEz8FjjhJ+wBEMOTKpDF20M
	 hrl7OfBdEBlzg3/npYFk3L/JF/CU5bfFt7xqz5sg=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250618011803epcas5p307f50f49075ed92a804b49867a2dd288~J-kB2HGZw3159931599epcas5p3O;
	Wed, 18 Jun 2025 01:18:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQpc5ctcz3hhTS; Wed, 18 Jun
	2025 01:18:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250617175241epcas5p23c7284be872b6e74e3888b70ce19b01b~J5fLGRFG11003410034epcas5p24;
	Tue, 17 Jun 2025 17:52:41 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617175237epsmtip23b9b569665566d9ebe26adcffe3fbcde~J5fIOTcPr1594015940epsmtip2i;
	Tue, 17 Jun 2025 17:52:37 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250616-resolute-ocelot-of-shopping-1c9c4a@kuoka>
Subject: RE: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Tue, 17 Jun 2025 23:22:36 +0530
Message-ID: <000401dbdfb0$9ec4b010$dc4e1030$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gLpYoryAm9xWLwB5QJ1g7DeUbpQ
Content-Language: en-in
X-CMS-MailID: 20250617175241epcas5p23c7284be872b6e74e3888b70ce19b01b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a@epcas5p3.samsung.com>
	<20250613055613.866909-2-pritam.sutar@samsung.com>
	<20250616-resolute-ocelot-of-shopping-1c9c4a@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_181806_741082_FC9E63AB 
X-CRM114-Status: GOOD (  13.97  )
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
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 16 June 2025 01:45 PM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; m.szyprowski@samsung.com;
> s.nawrocki@samsung.com; linux-phy@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; muhammed.ali@samsung.com;
> selvarasu.g@samsung.com
> Subject: Re: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
> ExynosAutov920 HS phy compatible
> 
> On Fri, Jun 13, 2025 at 11:26:05AM GMT, Pritam Manohar Sutar wrote:
> > Add a dedicated compatible string for USB HS phy found in this SoC.
> 
> You add HS phy in other commit/patch. This is just confusing.
> 
> > The devicetree node requires two clocks, named "phy" and "ref"
> 
> No. Explain the hardware, not the DTS. How many clocks, supplies etc
> hardware has.
> 

ok will change commit message accordingly in next version of the patch-set. 

> Best regards,
> Krzysztof


Thank you.

Regards,
Pritam


