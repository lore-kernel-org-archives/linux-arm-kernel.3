Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF432CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt1V1ttJT/rzLxB3yr+Kj2hiXZUyzShEyCvGqxVBJsQ=; b=hKAevyZN26uUevrCK08+GDDtZ4
	c0Dtz6Qk6z/yDIAL1ak2Ipis98UKTgiPlaeQhXnnkj5Bku8ndxo0I63iBJV9brRs1AAdD94uujCsY
	YPcVnkskW981yP3FHtSxxH93fCqm2tnsfYmZ8FQsQseEa1K/yqk2pT8J+cHH2LrycMNmJGuSbXydh
	UmGLLSHYoSj0Zks31DmNniYPVWXh8B3YLcsaO/EBjevSVUlkcK5Zh9jEVXq/o4thMgsB7mV80R2xb
	4Fe3hTJ/opHEYg9A69YO00W4kXje60oG4lBzUevUJnWTHXx6XJ1kbvdnqqtujHdlDSWeVE8+4r3Rn
	Otd/gTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GxH-00000003Y92-2Sp8;
	Thu, 16 Oct 2025 05:55:15 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GxF-00000003Y8b-29JA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:55:15 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251016055506epoutp0110dc8d3585704b44fd8850407e019e0d~u4wLxCCzY3216632166epoutp01X
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:55:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251016055506epoutp0110dc8d3585704b44fd8850407e019e0d~u4wLxCCzY3216632166epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760594106;
	bh=Lt1V1ttJT/rzLxB3yr+Kj2hiXZUyzShEyCvGqxVBJsQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=FHwWz2us2IYVIr+EuFa6oJbqoifB4KHvpW7efNqW30FqFZmUucTZAOWlA+M12qzg7
	 kjrIixlxsVwlX4MFCSgPlx0eKIF7vyEwh38v6QEQsiLqVWRhMzP3sF4zT2uRW1Z3R0
	 DXDOaRU6OpumLxcCPwDaMCMQgDWpxWigiDqYGv70=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251016055505epcas2p1bd7203b2019c94b7e042145b3c441814~u4wLSUwr41320913209epcas2p1v;
	Thu, 16 Oct 2025 05:55:05 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.201]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cnHGx1qvFz6B9mD; Thu, 16 Oct
	2025 05:55:05 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251016055504epcas2p465445e62cb43a07d933890d533c08b97~u4wKYUP4M2158421584epcas2p4M;
	Thu, 16 Oct 2025 05:55:04 +0000 (GMT)
Received: from KORCO115296 (unknown [12.80.207.128]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251016055504epsmtip2ae441a34d309f357a7223522f6fc7556~u4wKSXLQv2437324373epsmtip2j;
	Thu, 16 Oct 2025 05:55:04 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Bartlomiej Zolnierkiewicz'"
	<bzolnier@gmail.com>, "'Rafael J . Wysocki'" <rafael@kernel.org>, "'Daniel
 Lezcano'" <daniel.lezcano@linaro.org>, "'Zhang Rui'" <rui.zhang@intel.com>,
	"'Lukasz	Luba'" <lukasz.luba@arm.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Henrik Grimler'" <henrik@grimler.se>
Cc: <linux-pm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <65380fa1-7d49-48eb-bab4-3e15cc4ea434@kernel.org>
Subject: RE: [PATCH v6 3/3] arm64: dts: exynosautov920: Add multiple sensors
Date: Thu, 16 Oct 2025 14:55:02 +0900
Message-ID: <001f01dc3e61$6b2ec7d0$418c5770$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQIjrV0tYij4Y9dxV2JVizj4BALpcQInw8+iAnOKzA4BpaaqeLQDYDWA
Content-Language: ko
X-CMS-MailID: 20251016055504epcas2p465445e62cb43a07d933890d533c08b97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930005148epcas2p19ffbb0ceaacac4d92e7d43936884dc70
References: <20250930005139.1424963-1-shin.son@samsung.com>
	<CGME20250930005148epcas2p19ffbb0ceaacac4d92e7d43936884dc70@epcas2p1.samsung.com>
	<20250930005139.1424963-4-shin.son@samsung.com>
	<65380fa1-7d49-48eb-bab4-3e15cc4ea434@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_225513_893149_CBA42EE5 
X-CRM114-Status: GOOD (  19.02  )
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

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Friday, October 10, 2025 9:46 PM
> To: Shin Son <shin.son@samsung.com>; Bartlomiej Zolnierkiewicz
> <bzolnier@gmail.com>; Rafael J . Wysocki <rafael@kernel.org>; Daniel
> Lezcano <daniel.lezcano@linaro.org>; Zhang Rui <rui.zhang@intel.com>;
> Lukasz Luba <lukasz.luba@arm.com>; Rob Herring <robh@kernel.org>; Conor
> Dooley <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> Henrik Grimler <henrik@grimler.se>
> Cc: linux-pm@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v6 3/3] arm64: dts: exynosautov920: Add multiple
> sensors
> 
> On 30/09/2025 02:51, Shin Son wrote:
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index 0fdf2062930a..fba403e48aed 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > @@ -330,6 +330,36 @@ watchdog_cl1: watchdog@10070000 {
> >  			samsung,cluster-index = <1>;
> >  		};
> >
> > +		tmu_top: tmu@100a0000 {
> > +			compatible = "samsung,exynosautov920-tmu";
> > +			reg = <0x100A0000 0x1000>;
> 
> I guess there will be new version, so nitpick: please use lowercase hex.
> 
> 
> Best regards,
> Krzysztof

Ok, I'll use the lowercase hex.
Thanks for your feedback.

Best regards,
Shin Son.


