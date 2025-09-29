Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF5DCAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlD+Oa758snTIeLWIc2UCK6i1q2QhpKw3wxOF2sifOI=; b=X4UXIwJq+5AoUOa5TRIPYNovYc
	BaX6AtUG4dfPH5t6lTNrL54fB7xsdMKszDDB2rHz5LtkagvjE56OfjxZDkTwGpKSAf2JY6Jcm8it1
	4BkBJY/987lhW9o03W7XSnPqrVsl2SNdQulTZo+65m/hLhCGamxYA9nMujMemquUBHIDY6V5S99Ak
	Ov7ZqSBtD0B6n/4O8RWC/nmiJ0g4q1b1DzVw5AZrTa0Ms6yp3rAMp8HyB7y/rW7PdaUgj83CxHuCk
	eoCHh2PYAOEb3+b72dHDkZZcE3zCZfK2mq8wgF51o79WowVb4Ufi1FXLf/Ov1vRc/WQvANgyc2ooq
	/ycrOmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37fF-00000001W9W-0dVV;
	Mon, 29 Sep 2025 06:47:13 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37fC-00000001W7c-1Qne
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 06:47:11 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250929064707epoutp0392bad98468f4692ea14349d99fb7055e~prfwQ0mXe1909219092epoutp03w
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 06:47:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250929064707epoutp0392bad98468f4692ea14349d99fb7055e~prfwQ0mXe1909219092epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759128427;
	bh=rlD+Oa758snTIeLWIc2UCK6i1q2QhpKw3wxOF2sifOI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=aBg3H/6VmTNiLUkV2VTTS3hxnFVduv5g/xJsDfljmOWJGC1Ap2KvsQL8cvl6RkPFo
	 bEmrkzXV7YkIU8iERRiGCsr7wM6wzeMzBTmoMqgLHUomM41CoPWwILzpwjSXCuF915
	 qmM659j/KaH6KbhEmnXKIx7UiCS3T73wNZVTyl7M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250929064706epcas5p25fbef3d266435f18a5a7d550bd7fb1d9~prfvr9wQe3152631526epcas5p2C;
	Mon, 29 Sep 2025 06:47:06 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cZsDn5g4tz3hhTC; Mon, 29 Sep
	2025 06:47:05 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250929064705epcas5p28b43638ca8368376aaa55a652e2c097b~prfuB7tJr3152631526epcas5p29;
	Mon, 29 Sep 2025 06:47:05 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929064700epsmtip1803678f881cc80bb889cc76568fbd6c2~prfp-PR7e1213412134epsmtip1f;
	Mon, 29 Sep 2025 06:47:00 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <igor.belwon@mentallysanemainliners.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250903073827.3015662-4-pritam.sutar@samsung.com>
Subject: RE: [PATCH v8 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Mon, 29 Sep 2025 12:16:57 +0530
Message-ID: <001501dc310c$de18fb60$9a4af220$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgI+elV9AgkpZOa0HXqrMA==
Content-Language: en-us
X-CMS-MailID: 20250929064705epcas5p28b43638ca8368376aaa55a652e2c097b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072942epcas5p2154a85b45152af50e2714248c38c5adc
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072942epcas5p2154a85b45152af50e2714248c38c5adc@epcas5p2.samsung.com>
	<20250903073827.3015662-4-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_234710_694829_798DA386 
X-CRM114-Status: GOOD (  11.46  )
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

Hi Pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Sent: Wednesday, September 3, 2025 1:08 PM
> To: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com;
> pritam.sutar@samsung.com
> Cc: linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; rosa.pila@samsung.com;
> dev.tailor@samsung.com; faraz.ata@samsung.com;
> muhammed.ali@samsung.com; selvarasu.g@samsung.com
> Subject: [PATCH v8 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
> ExynosAutov920 combo hsphy
> 
> The USBDRD31 5nm controller consists of Synopsys USB2.0 femptophy and
> USBSS combophy. Add-on USB20 femptophy is required to support USB20
> data rates along with USBSS phy. Document support for the USB2.0
> femptophy found on combophy of the this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


