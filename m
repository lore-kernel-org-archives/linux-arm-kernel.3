Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AAEC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YM8svSFCVQDdSKgv3UAZlMbvsdfiUPaNlXn4LTfu4c=; b=bGgVEEKaiPW0EPMfFcxyqzpo8P
	5TwsZRpEOZDhSBqWCORIk5a2UfYNAMfjhOFTvO85gyszaN3FXbVacb9OlH9IM1Etu+SNUSHaxLqvo
	QyWileTch7qeleWl4jmpqZKwzzWV/veJlOmHPFd/oNHuYzbHLgZpiU55QAfzpAlfX11IyQRxW8rQ7
	qMbOcDYGoUBWY51wVVKcRkUOqFkWbKIFziD6SFgHaAcw5o8Dct+gxSZQJneXnxbUxOMbVgSzQXODC
	FfPINQCcWKQAI3wrO4zN9MN13oQ6Jz+jLJ0H8lgijwVPxYiE8UIic3FIwWAdsLxWeBT6//DKH01CO
	qX6jcluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqP-0000000FhKI-2kC8;
	Fri, 11 Sep 2026 02:18:25 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqF-0000000FhI6-1GDL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:18:23 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260911021803epoutp0325aca803955039e411ac7942f44fbf8e~UIq5EgKrf1031610316epoutp03d
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260911021803epoutp0325aca803955039e411ac7942f44fbf8e~UIq5EgKrf1031610316epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789093083;
	bh=5YM8svSFCVQDdSKgv3UAZlMbvsdfiUPaNlXn4LTfu4c=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=BqWb8GEnthNEov6KvHRIKeY3zjCHAjFeFqsZeQrLMlXGsfR0iL5qmnqeegr0DAeSK
	 uFDNZGNhxs5mFdXv4x9W9XT7Nc3hY1HUtTMd32+3FkpHvH7v7HcNgkevBgKKsnpU7m
	 zccXdSrUUye9QmXp0hKDUUvxnrJ7g1E6F95QQAW0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260911021803epcas5p4efa9de6ffbfaab9bc9dde3b55a209a27~UIq4mrKMn0859908599epcas5p4W;
	Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hgyrC2Bhjz3hhTG; Fri, 11 Sep
	2026 02:18:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260910160148epcas5p17e76bb1266efb4fd90a242db38acea39~UAQ1XB3ph0463604636epcas5p1T;
	Thu, 10 Sep 2026 16:01:48 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260910160147epsmtip124ef79569d3bed41842f5ee216e05ea4~UAQz9HWcH1918519185epsmtip1B;
	Thu, 10 Sep 2026 16:01:47 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-fsd@tesla.com>, "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-5-1b755a446b22@oss.qualcomm.com>
Subject: RE: [PATCH 5/5] arm64: dts: fsd: Re-order properties to match
 coding style
Date: Thu, 10 Sep 2026 21:31:46 +0530
Message-ID: <27319466.81789093083302.JavaMail.epsvc@epcpadp2new>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+vGmeAYQ1M8KGwzLNRALcGC0DngL3d43kAoQLh+W12SYeEA==
Content-Language: en-us
X-CMS-MailID: 20260910160148epcas5p17e76bb1266efb4fd90a242db38acea39
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260909141820epcas5p34fa82cdbdc8a4cd6988e57c3a36e7676
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
	<CGME20260909141820epcas5p34fa82cdbdc8a4cd6988e57c3a36e7676@epcas5p3.samsung.com>
	<20260909-dts-samsung-cleanup-strict-v1-5-1b755a446b22@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_191818_276686_CC3B7E9E 
X-CRM114-Status: UNSURE (   9.97  )
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
> Subject: [PATCH 5/5] arm64: dts: fsd: Re-order properties to match coding
> style
>=20
> Re-order a few properties to match coding style, as pointed out by dt-che=
ck-
> style, e.g.:
>=20
>   fsd.dtsi:357: [property-order] property 'ranges' out of canonical order
> (should sort before '#size-cells')
>   fsd.dtsi:362: [property-order] property 'reg' out of canonical order (s=
hould
> sort before 'no-map')
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>




