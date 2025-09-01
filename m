Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9A8CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IVilufhTk8OxJwrv6/zlVYsrGN5/kHDHMnuC7CDzWc=; b=hFk7Dq98TVGLn9y8/HcCmmUtlo
	V75B0CiPX02KvWumNy6KvoLMCJs+BQJEn/ZuGJDNQI0l37H6kMt3gxMOztnp4fVEvPSOemVQRa1jW
	vc9KI5kJDdgxCLB02PDLFalczp043rAtDBk6qIOmRfUJsnAZPALbmzRlSaATDdiZIWn19eo6LMFsB
	qsSnh4SWgt0/sHx+N/MeMVc8/9J+aMC54fHo1r7QD2T3RH2P27AKBomkp5Jh1mqAbsCGyriTiGCBx
	Qmv9gQg7mySX/eWznVRkMOMjUQ719LKqPMXHWb1GDwJA/0kvNVinY6pH24Dd3zor/tJHBVpfu4Yyy
	zCcovbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8dS-0000000DUje-2W89;
	Mon, 01 Sep 2025 17:48:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5Xs-0000000CqGh-0aZc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 14:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2IVilufhTk8OxJwrv6/zlVYsrGN5/kHDHMnuC7CDzWc=; b=fTStzilcjNSHnheMqeCQhYyGdc
	MO+Rr4nWROmGwLSGcTVewdAfImcg6YWI3kiD9ji77QpLPIjw6G8wHzEdOxorYnHIQqwnmJwqeqd8d
	3+hJn/aMDT/ixKMG1JHlC/y9obocI2Xs9nMNbpiSId6NZK5eBG6YG0RypZgfMbdSrEgbbZ+95xY1Y
	zlIUhX0ImQDBzM8p9mKVwGkJIXN65yHVDRUjMchReGYsY6gBC14huTcG1U/mFmjQ7RSFBkY9W7kIL
	UCHYi3gxMOjO+qsMkhL8cr4qjbnoO8TQl1RZfcvLmStGA2i8XkkdCqFZ2R2FE1QONVchC2zFRcbfc
	KjK3adyA==;
Received: from mailout4.samsung.com ([203.254.224.34])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5Xl-00000003loI-3SV7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:30:05 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250901142951epoutp04142ec0ef86078b56da29d02468357576~hLvxkEj9y2899328993epoutp040
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 14:29:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250901142951epoutp04142ec0ef86078b56da29d02468357576~hLvxkEj9y2899328993epoutp040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756736991;
	bh=2IVilufhTk8OxJwrv6/zlVYsrGN5/kHDHMnuC7CDzWc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lEZ+kvdOgAgJi4Jw3RYYcX1BYw64Dh00cK7YI8yvONrG/6TnTVqR9fyPzn6WX5k7Q
	 7TcB+flqvRXLj0KvWO+tm2WAqvxbOU7bD804SwRZoHV+ffVW1VFhp44wu5ouBy6OQ4
	 +1LIIQ74X+ltEcB3moz9SMmZRmnic2NC1PNK8Xnk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901142950epcas5p13ea9f7cdf7c686e688e71ae08aa36acc~hLvwyJHrt2550625506epcas5p1T;
	Mon,  1 Sep 2025 14:29:50 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFrqd2hpgz6B9m5; Mon,  1 Sep
	2025 14:29:49 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250901142948epcas5p3b6580da89ca826378481451bdafce798~hLvvQIxzi3166431664epcas5p3P;
	Mon,  1 Sep 2025 14:29:48 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901142947epsmtip2a81a5af8319bbbf7d82d50d5339d3232~hLvtvrwLf0150201502epsmtip23;
	Mon,  1 Sep 2025 14:29:46 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Wim Van
 Sebroeck'" <wim@linux-watchdog.org>, "'Guenter Roeck'" <linux@roeck-us.net>,
	"'Rob Herring'" <robh@kernel.org>, "'Krzysztof Kozlowski'"
	<krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: "'Krzysztof Kozlowski'" <krzk@kernel.org>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>
Subject: RE: [PATCH 4/4] dt-bindings: watchdog: samsung-wdt: Split if:then:
 and constrain more
Date: Mon, 1 Sep 2025 19:59:45 +0530
Message-ID: <31f501dc1b4c$dedf8fd0$9c9eaf70$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMq6vyl63rBWSdRs1NKiWzUsYqwtwJkufMiArpZRa2xt8VwUA==
Content-Language: en-us
X-CMS-MailID: 20250901142948epcas5p3b6580da89ca826378481451bdafce798
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250830101916epcas5p13a007b24285862d6ed0db1e2d8b738d6
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
	<CGME20250830101916epcas5p13a007b24285862d6ed0db1e2d8b738d6@epcas5p1.samsung.com>
	<20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_153002_680696_2229C9E1 
X-CRM114-Status: GOOD (  20.66  )
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
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Saturday, August 30, 2025 3:49 PM
> To: Wim Van Sebroeck <wim=40linux-watchdog.org>; Guenter Roeck
> <linux=40roeck-us.net>; Rob Herring <robh=40kernel.org>; Krzysztof Kozlow=
ski
> <krzk+dt=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>; Alim Akhtar
> <alim.akhtar=40samsung.com>
> Cc: Krzysztof Kozlowski <krzk=40kernel.org>; linux-
> watchdog=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-
> samsung-soc=40vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski=40linaro.org>
> Subject: =5BPATCH 4/4=5D dt-bindings: watchdog: samsung-wdt: Split if:the=
n: and
> constrain more
>=20
> Binding defined two if:then: blocks covering different conditions but not=
 fully
> constraining the properties per each variant:
> 1. =22if:=22 to require samsung,syscon-phandle, 2. =22if:=22 with =22else=
:=22 to narrow
> number of clocks and require or disallow
>    samsung,cluster-index.
>=20
> This still did not cover following cases:
> 1. Disallow samsung,syscon-phandle when not applicable, 2. Narrow
> samsung,cluster-index to =5B0, 1=5D, for SoCs with only two
>    clusters.
>=20
> Solving this in current format would lead to spaghetti code, so re-write =
entire
> =22if:then:=22 approach into mutually exclusive cases so each SoC appears=
 only in
> one =22if:=22 block.  This allows to forbid samsung,syscon-phandle for S3=
C6410,
> and narrow samsung,cluster-index to =5B0, 1=5D.
>=20
This looks much cleaner.=20
On a side note, may be you can add an example of latest SoC binding=20
for the documentation purpose as current example in this file is pretty old=
 and simple one.=20
(I know one can always look into dtsi/dts for the example, but updating her=
e won't harm)

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> ---
In anycase,

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  .../devicetree/bindings/watchdog/samsung-wdt.yaml  =7C 70
> ++++++++++++++++------
>  1 file changed, 52 insertions(+), 18 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-
> wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-
> wdt.yaml
> index
> 51e597ba7db2615da41f5d3b6dc4e70f6bb72bb6..41aee1655b0c22a6dce212a6
> 3fa4849089253f09 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> =40=40 -74,24 +74,7 =40=40 allOf:
>            contains:
>              enum:
>                - google,gs101-wdt
> -              - samsung,exynos5250-wdt
> -              - samsung,exynos5420-wdt
> -              - samsung,exynos7-wdt
>                - samsung,exynos850-wdt
> -              - samsung,exynos990-wdt
> -              - samsung,exynosautov9-wdt
> -              - samsung,exynosautov920-wdt
> -    then:
> -      required:
> -        - samsung,syscon-phandle
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - google,gs101-wdt
> -              - samsung,exynos850-wdt
> -              - samsung,exynos990-wdt
>                - samsung,exynosautov9-wdt
>                - samsung,exynosautov920-wdt
>      then:
> =40=40 -104,9 +87,41 =40=40 allOf:
>            items:
>              - const: watchdog
>              - const: watchdog_src
> +        samsung,cluster-index:
> +          enum: =5B0, 1=5D
>        required:
>          - samsung,cluster-index
> -    else:
> +        - samsung,syscon-phandle
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos990-wdt
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock, used for register interface
> +            - description: Source clock (driving watchdog counter)
> +        clock-names:
> +          items:
> +            - const: watchdog
> +            - const: watchdog_src
> +      required:
> +        - samsung,cluster-index
> +        - samsung,syscon-phandle
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos5250-wdt
> +              - samsung,exynos5420-wdt
> +              - samsung,exynos7-wdt
> +    then:
>        properties:
>          clocks:
>            items:
> =40=40 -115,6 +130,25 =40=40 allOf:
>            items:
>              - const: watchdog
>          samsung,cluster-index: false
> +      required:
> +        - samsung,syscon-phandle
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,s3c6410-wdt
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock, which is also a source clock
> +        clock-names:
> +          items:
> +            - const: watchdog
> +        samsung,cluster-index: false
> +        samsung,syscon-phandle: false
>=20
>  unevaluatedProperties: false
>=20
>=20
> --
> 2.48.1



