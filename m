Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D04FC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+EDQvWQa/uEilf5YN4RKSZWevQxdNwz5KzOmFy3UsM=; b=1+C4nBYD0ZrDpJDGpEaET5X8dZ
	a/nRa9sj62VB2BAKNLM9TatOa4sdksgjgCo3R8lU2UUSmmyjjOWqUm4Ax8XaiLLnFXeB19xbJ5ICv
	cjrZqccWToHDqJU8Hul26pZrfgin+T4wt32/6JK2m79hAFs32MBAuF/zLGf5iCmJwz4fKrLW7GVbf
	X6PiOQra/sGUyUdXBekSeJu9EvmDR9M+Y/D3t+NxR67+ikveGJLlAB0hJ70N2XRrozngCJJviaeDb
	pOZjeVNPhyjrgYNBSfWRRCAk8cqNt6D6yxlrGijxy6Y9l1JWfPaw0VRdJqeDexlpZnuHxkiUNrlqN
	g9CynT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqP-0000000FhK9-1oGL;
	Fri, 11 Sep 2026 02:18:25 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqF-0000000FhI8-1HuQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:18:22 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260911021803epoutp03bbc83dfbcaaeb94e2a6d0969259b33ad~UIq4nKD7Y1031610316epoutp03b
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260911021803epoutp03bbc83dfbcaaeb94e2a6d0969259b33ad~UIq4nKD7Y1031610316epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789093083;
	bh=t+EDQvWQa/uEilf5YN4RKSZWevQxdNwz5KzOmFy3UsM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lsXM5a+3mHs9K4g91qU0Scoue8bv7OIX8xBuLJAjhLRgq7UzIC2kU01PFpOhAkGya
	 85sqj3LxIcAAMlWNuL4sqgCRwhTH+tYrdRVWID92In5Gm+zfCsteGLFow4e8la7/HZ
	 W4nMC1BvFvQ0Yk7d9mPWzfG/6LrfvaHtkIPfMjAQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260911021803epcas5p3908cfc4b1c6a992400ac8c5cad070b87~UIq4T34qJ2176921769epcas5p3_;
	Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hgyrB71ylz2SSKk; Fri, 11 Sep
	2026 02:18:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260910152656epcas5p37932f44add3b9a5ed48959aa3e389b47~T-yY9QN4o2646226462epcas5p3z;
	Thu, 10 Sep 2026 15:26:56 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260910152655epsmtip16dad734bbabeb560250d7fb16f6480a5~T-yXkiE3T1817818178epsmtip1T;
	Thu, 10 Sep 2026 15:26:55 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-fsd@tesla.com>, "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-3-1b755a446b22@oss.qualcomm.com>
Subject: RE: [PATCH 3/5] arm64: dts: fsd: Move idle states out of CPUs node
Date: Thu, 10 Sep 2026 20:56:54 +0530
Message-ID: <1524126153.41789093082973.JavaMail.epsvc@epcpadp2new>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+vGmeAYQ1M8KGwzLNRALcGC0DngGenlVEAYPjjQ616+RigA==
Content-Language: en-us
X-CMS-MailID: 20260910152656epcas5p37932f44add3b9a5ed48959aa3e389b47
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260909141820epcas5p346144243c8bbe5126d2f8a4310834c4c
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
	<CGME20260909141820epcas5p346144243c8bbe5126d2f8a4310834c4c@epcas5p3.samsung.com>
	<20260909-dts-samsung-cleanup-strict-v1-3-1b755a446b22@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_191818_271650_A84919ED 
X-CRM114-Status: GOOD (  16.22  )
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
> Subject: [PATCH 3/5] arm64: dts: fsd: Move idle states out of CPUs node
>=20
> Idle states are not really part of CPUs, as often they have domain idle s=
tates,
> so move them level up to fix to fix dt-check-style warning:
>=20
>   fsd.dtsi:300: [child-name-order] child node 'idle-states' out of name o=
rder
>=20
> Also, re-order properties to silence:
>=20
>   fsd.dtsi:305: [property-order] property 'compatible' out of canonical o=
rder
> (should sort before 'idle-state-name')
>   fsd.dtsi:308: [property-order] property 'entry-latency-us' out of canon=
ical
> order (should sort before 'arm,psci-suspend-param')
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> ---
Probably this need to be done for many other SoCs and platforms

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


>  arch/arm64/boot/dts/tesla/fsd.dtsi | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi
> b/arch/arm64/boot/dts/tesla/fsd.dtsi
> index d076ea634f4e..acbe93756a76 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -296,19 +296,19 @@ cpucl_l2: l2-cache0 {
>  =09=09=09cache-line-size =3D <64>;
>  =09=09=09cache-sets =3D <4096>;
>  =09=09};
> +=09};
>=20
> -=09=09idle-states {
> -=09=09=09entry-method =3D "psci";
> +=09idle-states {
> +=09=09entry-method =3D "psci";
>=20
> -=09=09=09cpu_sleep: cpu-sleep {
> -=09=09=09=09idle-state-name =3D "c2";
> -=09=09=09=09compatible =3D "arm,idle-state";
> -=09=09=09=09local-timer-stop;
> -=09=09=09=09arm,psci-suspend-param =3D <0x0010000>;
> -=09=09=09=09entry-latency-us =3D <30>;
> -=09=09=09=09exit-latency-us =3D <75>;
> -=09=09=09=09min-residency-us =3D <300>;
> -=09=09=09};
> +=09=09cpu_sleep: cpu-sleep {
> +=09=09=09compatible =3D "arm,idle-state";
> +=09=09=09idle-state-name =3D "c2";
> +=09=09=09local-timer-stop;
> +=09=09=09entry-latency-us =3D <30>;
> +=09=09=09exit-latency-us =3D <75>;
> +=09=09=09min-residency-us =3D <300>;
> +=09=09=09arm,psci-suspend-param =3D <0x0010000>;
>  =09=09};
>  =09};
>=20
>=20
> --
> 2.53.0




