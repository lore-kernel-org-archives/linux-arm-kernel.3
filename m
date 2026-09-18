Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762D4C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKnmLzLUgthxmMsJgAHHDg791TGmTKkEbBQOle2AQa4=; b=fTuwP/kZGSg6akNNLtoEBnTuo0
	GcFmNS6oe8f7Fgj5TWsn4AiGc0XmU85cUkzcpKMjdZePHzzC3xE/G0oIJJYuHwZZ76k2wmKfpdX+l
	ITfHvm1E7+Cit4cEggqGC6WPQCCWqZXzQ/NOOsC/95Xsud2AwJcD5Kts/+EamnqwyEa+l1xPSpfBP
	WkdIVOlRd1vujWvAv6LTcsBs6c0iFfEP88r+yhOPP3/y753y5E2WOaCudA6JynzNRi4taWiHQgXzb
	TbN6CFAWHJn+OeUpjMwouRSXcxL6Qyvf3jMypFiue8dYO05dEwGlZ26M1rZCOHi5BIZHbRBpaW6mV
	ulVBA+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7P8L-0000000DNae-3Gxg;
	Fri, 18 Sep 2026 03:19:29 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7P8I-0000000DNa7-0Pra
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:19:29 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260918031915epoutp033d2ae2cabd5a2d95776d7c1635e431a3~WTBUiaX6H1425414254epoutp03N
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:19:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260918031915epoutp033d2ae2cabd5a2d95776d7c1635e431a3~WTBUiaX6H1425414254epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789701555;
	bh=HKnmLzLUgthxmMsJgAHHDg791TGmTKkEbBQOle2AQa4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=EQxAx70BgAMbeQjPN03QPSCdtTJoMWBCiuQaiXLyqB8k2WTR2AJJnHSoUtWNxDFMl
	 X17swJE/eybHVt50yrWC1p1554LLztXK0LD64x9yq58S6lZJyiDrSPlbcB7dYyxgaV
	 7e8vTEZO+kKR/OzyFRJ6B0HDF2EyLHZ3OzLc1flQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260918031914epcas5p4317137185eac02f3cbd6d83eac1a8a07~WTBT4RTGW0273202732epcas5p4D;
	Fri, 18 Sep 2026 03:19:14 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hmHsY6F4Mz2SSKY; Fri, 18 Sep
	2026 03:19:13 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260918031913epcas5p48cf1033745bf88d80a3b0c355cf76310~WTBSQ-IGk0273202732epcas5p4-;
	Fri, 18 Sep 2026 03:19:13 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260918031910epsmtip13eff1b3e2ad0dd2db9ce3ea5448d3bb8~WTBPgtuoX2962729627epsmtip19;
	Fri, 18 Sep 2026 03:19:10 +0000 (GMT)
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
In-Reply-To: <20260916122229.2604003-2-selvarasu.g@samsung.com>
Subject: RE: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
 ARM/SAMSUNG entry
Date: Fri, 18 Sep 2026 08:49:08 +0530
Message-ID: <058201dd471c$7a543be0$6efcb3a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGcfDqIrCW7OKewQ35ZfbAvR1onfQLSUTwAAgT4kRu3LoX/AA==
Content-Language: en-us
X-CMS-MailID: 20260918031913epcas5p48cf1033745bf88d80a3b0c355cf76310
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142@epcas5p3.samsung.com>
	<20260916122229.2604003-2-selvarasu.g@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_201927_596374_4AD617EF 
X-CRM114-Status: GOOD (  15.22  )
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
> From: Selvarasu Ganesan <selvarasu.g@samsung.com>
> Sent: Wednesday, September 16, 2026 5:52 PM
> To: krzk@kernel.org; peter.griffin@linaro.org; alim.akhtar@samsung.com;
> gregkh@linuxfoundation.org; robh@kernel.org; conor+dt@kernel.org;
> Thinh.Nguyen@synopsys.com; mani@kernel.org;
> selvarasu.g@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: jh0801.jung@samsung.com; h10.kim@samsung.com;
> dh10.jung@samsung.com; akash.m5@samsung.com;
> hongpooh.kim@samsung.com; eomji.oh@samsung.com;
> shijie.cai@samsung.com; muhammed.ali@samsung.com;
> thiagu.r@samsung.com
> Subject: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
> ARM/SAMSUNG entry
> 
> Add the Samsung USB devicetree binding file path under the existing
> ARM/Samsung SoC maintainership.
> 
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a53620839407..87a1ab24a375 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3576,6 +3576,7 @@ F:
> 	Documentation/devicetree/bindings/arm/samsung/
>  F:	Documentation/devicetree/bindings/hwinfo/samsung,*
>  F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
>  F:	Documentation/devicetree/bindings/soc/samsung/
> +F:	Documentation/devicetree/bindings/usb/samsung,*
>  F:	arch/arm/boot/dts/samsung/
>  F:	arch/arm/mach-exynos*/
>  F:	arch/arm/mach-s3c/
> --
> 2.17.1



