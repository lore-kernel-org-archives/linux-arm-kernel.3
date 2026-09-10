Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B810EC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFtbyzYoNl/zCEgTU0VH6n/v1JONtCfMPfAx62T90jY=; b=Y4ICfTED5ZWpbsmK74cHHbnVwB
	5uVlwNc0XZIfyK9TpDoD3gHZcdaOLwnUMF3ZQVCLxdvzOK2lxsNHkZsEWpNfvWYr8HjwsRPThQfJi
	GhHYUYVXH2PncS3zoDzUxMcbw6bdCOMMXvzL6KuTn1j/FLZ+PNubnaSIEpHJznPdYRXpTBdztNb/J
	Y7tZo/HlkTEbbRpG846W3kOsODGJvPtTxVEcXwa25zv0UBKJWwiv6JswYT/kHf3wuzpOaDk2Dz5Uu
	s+Bj544XITl7yol8goEpx8ua2gB/+9cudcyhyimEB75iAn3SK+rvMYyb3glMCVC3SsPSRYKLpTiED
	mu4FYpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqb-0000000FhOW-0mQQ;
	Fri, 11 Sep 2026 02:18:37 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqF-0000000FhI9-1HNK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:18:24 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260911021803epoutp012468bc1dd817ea85471890dad79849eb~UIq40u40g1793417934epoutp01f
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260911021803epoutp012468bc1dd817ea85471890dad79849eb~UIq40u40g1793417934epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789093083;
	bh=NFtbyzYoNl/zCEgTU0VH6n/v1JONtCfMPfAx62T90jY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ZWEAKJZJVgEC7eZ2jFl1u3xZ2Hhys6o8newPTd3nLC9fZ6xPEaB05tziAoTWtxTjr
	 B4hpZh2sClxvvqyGaHKyBLlKOeTEFD1QXCpBKdO/pa+fsdU4/zxRPhX5y7+skWBvCb
	 YoVT56EZh2H+0zs9SkMUcI3tx4OJ8LfU51XvgkUc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260911021803epcas5p125a2fd347d43b9bfdd2cf660e77fbc2b~UIq4dqRYd1230512305epcas5p1s;
	Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hgyrC15sTz2SSKZ; Fri, 11 Sep
	2026 02:18:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260910155949epcas5p25209000963122d8c73dc18152feeabee~UAPGFN7l72530325303epcas5p2N;
	Thu, 10 Sep 2026 15:59:49 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260910155947epsmtip28ec55c8ae2033e856b86e2b9ec9c545e~UAPEp86IB1332813328epsmtip2p;
	Thu, 10 Sep 2026 15:59:47 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-fsd@tesla.com>, "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-4-1b755a446b22@oss.qualcomm.com>
Subject: RE: [PATCH 4/5] arm64: dts: fsd: Re-order nodes to match coding
 style
Date: Thu, 10 Sep 2026 21:29:46 +0530
Message-ID: <2084663827.61789093083145.JavaMail.epsvc@epcpadp2new>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+vGmeAYQ1M8KGwzLNRALcGC0DngIGdcDsAfk7HAC15QOycA==
Content-Language: en-us
X-CMS-MailID: 20260910155949epcas5p25209000963122d8c73dc18152feeabee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260909141824epcas5p28e392ad97ca2e5dae47a857272b5ea14
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
	<CGME20260909141824epcas5p28e392ad97ca2e5dae47a857272b5ea14@epcas5p2.samsung.com>
	<20260909-dts-samsung-cleanup-strict-v1-4-1b755a446b22@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_191818_269259_6482775A 
X-CRM114-Status: GOOD (  14.65  )
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
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Wednesday, September 9, 2026 7:48 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-fsd@tesla.com;
> Krzysztof Kozlowski <krzk@kernel.org>; Peter Griffin
> <peter.griffin@linaro.org>; Rob Herring <robh@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH 4/5] arm64: dts: fsd: Re-order nodes to match coding styl=
e
>=20
> Re-order several top-level and MMIO nodes to match coding style - orderin=
g
> by name or by unit address, as pointed out by dt-check-style,
> e.g.:
>=20
>   fsd.dtsi:981: [child-address-order] child node @10040000 out of address
> order
>   fsd.dtsi:315: [child-name-order] child node 'arm-pmu' out of name order
>   fsd.dtsi:348: [child-name-order] child node 'clock' out of name order
>=20
> While moving chunks of code, also re-order a few properties (I2S, SPI and
> CAN nodes) to fix:
>=20
>   fsd.dtsi:661: [property-order] property 'clocks' out of canonical order
> (should sort before 'samsung,syscon-phandle')
>   fsd.dtsi:936: [property-order] property 'pinctrl-names' must be placed =
after
> 'pinctrl-0'
>   fsd.dtsi:936: [property-order] property 'pinctrl-names' out of canonica=
l
> order (should sort before 'samsung,spi-src-clk')
>=20
> Moving several nodes already creates unreviewable commit, thus reshufflin=
g
> the properties allows to skip changing the same line twice without loss o=
f
> readability.
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>




