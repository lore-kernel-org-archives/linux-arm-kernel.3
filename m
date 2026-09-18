Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05710C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdQvZ61QalUJARA1z7MGMnRy/kwDRIhCjBePd5NVVQ0=; b=gKgxzzadZUqrnVnPGmY1YlEAlW
	Rw8QG5X9v8HLQJFqfLPCqdfWJkZH2TdxnrHXju7wbqC9rncdAfSJieMCYRI9S1MwRnl4tGuQbL+7a
	XycULMyMYjsHYSw75+i+0w2dZ0Aw2HXMcq9pG35ogRcmHj9940IBMzib8m8QWfksHeFG9aj5gC3PX
	UGZeYggYVTIjb4TO3EST1rdJQMLJXjdnUJcpjVLKJ9mKfeL28RGS8xWucyjqZUQRf0wVK0geO4uuG
	R+Hl/1ydXX0WEsyiDkua8ae7o/lIDsKwqGc5t7zdXsZeDcn9xLCptBfCEySzX+MJNCJiKI8C2Tkko
	G7PTmQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7PEU-0000000DNtI-2Btt;
	Fri, 18 Sep 2026 03:25:50 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7PEQ-0000000DNsw-13Tg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:25:49 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260918032537epoutp0214684e756e76e1877e0b8472a9284e3b~WTG4KzrsE0847408474epoutp02A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:25:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260918032537epoutp0214684e756e76e1877e0b8472a9284e3b~WTG4KzrsE0847408474epoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789701937;
	bh=EdQvZ61QalUJARA1z7MGMnRy/kwDRIhCjBePd5NVVQ0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RwXjMA+ZDheh/JjJSjft4QdcZk4bIXCNxOnoeBinV65wU5Y/FqHCVlF7/hxl2RH4O
	 IvASdMKrbOzORuVdTjRGGsRQztJYnMQYf+deW1dcEY7m1rTpFKAaBfQozIGJCyhzq0
	 sHvcUqs1uKRWZZjQZMF5jxQcKlOcHlHF1HZnwmc4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260918032536epcas5p3c037713c8e6229d0e8726a6bb418f76d~WTG3LYZix1189811898epcas5p3j;
	Fri, 18 Sep 2026 03:25:36 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hmJ0v2SLNz6B9m5; Fri, 18 Sep
	2026 03:25:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260918032534epcas5p1db19e612e5a173ae5f2eed6e817b6c37~WTG1XPfwn1605516055epcas5p1B;
	Fri, 18 Sep 2026 03:25:34 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260918032531epsmtip134ab7e6ab681d7dddb7c7d095e9d4d06~WTGymFoR50136701367epsmtip14;
	Fri, 18 Sep 2026 03:25:31 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Selvarasu Ganesan'" <selvarasu.g@samsung.com>, <krzk@kernel.org>,
	<peter.griffin@linaro.org>, <gregkh@linuxfoundation.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <mani@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <jh0801.jung@samsung.com>, <h10.kim@samsung.com>,
	<dh10.jung@samsung.com>, <akash.m5@samsung.com>, <hongpooh.kim@samsung.com>,
	<eomji.oh@samsung.com>, <shijie.cai@samsung.com>,
	<muhammed.ali@samsung.com>, <thiagu.r@samsung.com>
In-Reply-To: <20260916122229.2604003-3-selvarasu.g@samsung.com>
Subject: RE: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
Date: Fri, 18 Sep 2026 08:55:30 +0530
Message-ID: <058301dd471d$5d985170$18c8f450$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGcfDqIrCW7OKewQ35ZfbAvR1onfQHu4CTLAhM/jCu3NS/WcA==
Content-Language: en-us
X-CMS-MailID: 20260918032534epcas5p1db19e612e5a173ae5f2eed6e817b6c37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
	<20260916122229.2604003-3-selvarasu.g@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_202546_946820_75EAB110 
X-CRM114-Status: GOOD (  12.94  )
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



> -----Original Message-----
> From: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> Sent: Wednesday, September 16, 2026 5:52 PM
> To: krzk=40kernel.org; peter.griffin=40linaro.org; alim.akhtar=40samsung.=
com;
> gregkh=40linuxfoundation.org; robh=40kernel.org; conor+dt=40kernel.org;
> Thinh.Nguyen=40synopsys.com; mani=40kernel.org;
> selvarasu.g=40samsung.com; linux-arm-kernel=40lists.infradead.org; linux-
> samsung-soc=40vger.kernel.org; linux-usb=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Cc: jh0801.jung=40samsung.com; h10.kim=40samsung.com;
> dh10.jung=40samsung.com; akash.m5=40samsung.com;
> hongpooh.kim=40samsung.com; eomji.oh=40samsung.com;
> shijie.cai=40samsung.com; muhammed.ali=40samsung.com;
> thiagu.r=40samsung.com
> Subject: =5BPATCH v2 2/3=5D dt-bindings: usb: Introduce samsung,snps-dwc3
>=20
> Add the Samsung Exynos8855 DWC3 binding using a flattened node
> representation, where the DWC3 controller is directly addressable rather
> than nested as a child node of a glue layer.
>=20
> This is the first Samsung Exynos binding using the flattened representati=
on.
> The existing samsung,exynos-dwc3 binding describes the parent and child
> representation used by existing Exynos SoCs, which can be migrated to the
> flattened model.
>=20
> Samsung Exynos SoCs sharing the same flattened model can be added by
> using the samsung,snps-dwc3 fallback compatible and extending the
> compatible enum with per SoC clock and property constraints.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali=40samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali=40samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> ---
Thanks for using flattened node representation. Are you planning to migrate=
 other existing SoC as well?

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


