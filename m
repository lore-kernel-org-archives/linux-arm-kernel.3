Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404B3C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zg3eP0xfFnnvxihTFudnitZKRaskOF78/ArFi6db/og=; b=lwDcwzX8oAlcJZAtCDOFyFPXRV
	m40qhJa0lLN9OvglpHW8hHVVE/nGX2IssIff/BAcE7PQVsxLGXLjBfbsrY4V6Q2A5zjR4xvdTlIxH
	fHk8t0wz0kq+AkErPV2Xplsjd3yeA/IPMCvh6Fjd74+YKw3HYQp/RToB8yog8QcScPtxODg/OxMru
	j9qhV7Il6fxm+vGQonWCEHFXy8bzTfFGoq0kr8k9OGBQVFCoz9ZWca8qkOp3RYLVMzSA0tEnkqHtx
	0xOCLgzAeiTPzFUqEGu4rp87rmpduI/zOIw/Ihac3Q40cA216eV6npQ0R0NfrfQ9624/jqTzY4y28
	m4Q430lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqb-0000000FhOD-0OIH;
	Fri, 11 Sep 2026 02:18:37 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqF-0000000FhI7-1HWV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:18:24 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260911021802epoutp02b8b692d0029140f2326a4a9b639df640~UIq4IAZrr0125601256epoutp02U
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 02:18:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260911021802epoutp02b8b692d0029140f2326a4a9b639df640~UIq4IAZrr0125601256epoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789093082;
	bh=zg3eP0xfFnnvxihTFudnitZKRaskOF78/ArFi6db/og=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=BrKgkGhy6/j2Zb4biwrc0YYPjqgOZMdq6fxRHqnXLzW/VWbyNTaYWfrrR2WY0VjDc
	 fqZFH8ikdmUm2ocpieq2m5xYyjqhWSD29ZRAodeq3g1tjAEQZlcSOIovZMu5OCj5yt
	 JozgOvStftJRumKZvbuL3eqPdk6b6Hjkj48TKvrk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260911021802epcas5p1934405434cae972b5397d63c8a600c57~UIq38BlJh1486114861epcas5p1e;
	Fri, 11 Sep 2026 02:18:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hgyrB4MHRz6B9mJ; Fri, 11 Sep
	2026 02:18:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260910145211epcas5p29abffd4523c683de3ac96c5e4a256097~T-UDI2d8c1658516585epcas5p2e;
	Thu, 10 Sep 2026 14:52:11 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260910145210epsmtip27121fb27835bf4e781e8446a54a80db1~T-UBsyo711915319153epsmtip2E;
	Thu, 10 Sep 2026 14:52:10 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-fsd@tesla.com>, "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-2-1b755a446b22@oss.qualcomm.com>
Subject: RE: [PATCH 2/5] arm64: dts: fsd: evb: Correct node order
Date: Thu, 10 Sep 2026 20:22:08 +0530
Message-ID: <1860250540.01789093082598.JavaMail.epsvc@epcpadp2new>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+vGmeAYQ1M8KGwzLNRALcGC0DngJYshc/Afimduy14mOI0A==
Content-Language: en-us
X-CMS-MailID: 20260910145211epcas5p29abffd4523c683de3ac96c5e4a256097
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260909141817epcas5p3ca45b73a93df14f08e47eb9beee485d6
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
	<CGME20260909141817epcas5p3ca45b73a93df14f08e47eb9beee485d6@epcas5p3.samsung.com>
	<20260909-dts-samsung-cleanup-strict-v1-2-1b755a446b22@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_191818_288107_49BA2D09 
X-CRM114-Status: GOOD (  16.83  )
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
> Subject: [PATCH 2/5] arm64: dts: fsd: evb: Correct node order
> 
> Order nodes by name to fix dt-check-style warning:
> 
>   fsd-evb.dts:61: [child-name-order] child node 'codec' out of name order
> 
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 503abe52a81c..a1f3d3fbbf8b 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -50,6 +50,11 @@ simple-audio-card,dai-link@0 {
>  			bitclock-master = <&tlv320aic3x>;
>  			frame-master = <&tlv320aic3x>;
> 
> +			codec {
> +				sound-dai = <&tlv320aic3x>;
> +				system-clock-frequency = <33000000>;
> +			};
> +
>  			cpu-0 {
>  				sound-dai = <&i2s_0 0>;
>  			};
> @@ -57,11 +62,6 @@ cpu-0 {
>  			cpu-1 {
>  				sound-dai = <&i2s_0 1>;
>  			};
> -
> -			codec {
> -				sound-dai = <&tlv320aic3x>;
> -				system-clock-frequency = <33000000>;
> -			};
>  		};
>  	};
>  };
> 
> --
> 2.53.0




