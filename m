Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D15FC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igrEsGqbHWgfoRnHL8GMmEJLcVu0uz+y9L1xOkvYOQ0=; b=Wgoam9p58Z+Z1snsM6k2YxOyvT
	BZpWVRH8fEGL7vJFQheVLmn/0A39JonTflAT2vF3/M+fYgwHc2dsgwyKpslHgKIQ4lQ9csyhnF/BE
	T2mgAiaeTYpIs+hOPLpYhgIDgcfKVhkSJFYU2UvY9h4uxl6iuh2pKMeuXvflFH5uSMQ/Mwe7x9o39
	G/yepLfzPmw5hgU7rPpL1VY14RyCwmBcX7e0Cd/lpQ2fNoHvbH6dBS502xQ0/fFw5D32k9HoEv8tz
	PPY8Fl0J2wYEKEu4CMbARkxpQbzw2DE1CKtCzgpfpOOi8WxpwcXpiZvM7FBbjoy3k7u6g9G3XQX43
	82am1yHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnRq-0000000BK9F-3SUy;
	Thu, 10 Jul 2025 09:20:10 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmOr-0000000B8Dp-00gy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 08:13:02 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250710081256epoutp049083ae9b3c0af1608097447d04eaa968~Q1ajNXTqj0820708207epoutp04c
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:12:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250710081256epoutp049083ae9b3c0af1608097447d04eaa968~Q1ajNXTqj0820708207epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752135176;
	bh=igrEsGqbHWgfoRnHL8GMmEJLcVu0uz+y9L1xOkvYOQ0=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=Z5j7IFydb7+OQiBHLr5uH3DmpjS08QJAUq7gemSO75g37VnyCGESGHUoCJwRidtCC
	 P2T4Duvc7Niselt2ZgXRZ27W5QNLIx7fgcWn1Jyx7yYVUlIJuP0sG6LCqgt/qsFyE4
	 +NnQ7vcK7sEJdLgYzvtupY/hEK8ySfwVeSuzWe44=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250710081255epcas5p21ead697b95c274e7ee87d4345ed18db1~Q1aiopNU_0247902479epcas5p2u;
	Thu, 10 Jul 2025 08:12:55 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.178]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bd6zB012wz6B9m8; Thu, 10 Jul
	2025 08:12:54 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250710081253epcas5p2a3e7fb2002cd567c5a9582ecc963510f~Q1ag8qnru3046530465epcas5p2x;
	Thu, 10 Jul 2025 08:12:53 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250710081252epsmtip2e0914db4211594e8c7a3e73ae7a77381~Q1af6a2-T0391103911epsmtip2c;
	Thu, 10 Jul 2025 08:12:52 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250710073443.13788-4-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 2/2] arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to
 Exynos entry
Date: Thu, 10 Jul 2025 13:42:51 +0530
Message-ID: <0b0701dbf172$6f465e50$4dd31af0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQGimcLLktEP7is/4GQpRecJdUJ9JQGQPoI8Ag/Dtzu0gLDqAA==
X-CMS-MailID: 20250710081253epcas5p2a3e7fb2002cd567c5a9582ecc963510f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710073505epcas5p1796f16f9675ac80780d174bae52a6ff5
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
	<CGME20250710073505epcas5p1796f16f9675ac80780d174bae52a6ff5@epcas5p1.samsung.com>
	<20250710073443.13788-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_011301_352899_20C6FA83 
X-CRM114-Status: UNSURE (   8.10  )
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

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Thursday, July 10, 2025 1:05 PM
> To: Peter Griffin <peter.griffin=40linaro.org>; Andr=C3=A9=20Draszik=0D=
=0A>=20<andre.draszik=40linaro.org>;=20Tudor=20Ambarus=20<tudor.ambarus=40l=
inaro.org>;=0D=0A>=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>;=20linux-a=
rm-=0D=0A>=20kernel=40lists.infradead.org;=20linux-samsung-soc=40vger.kerne=
l.org;=0D=0A>=20devicetree=40vger.kernel.org;=20linux-kernel=40vger.kernel.=
org=0D=0A>=20Cc:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.or=
g>=0D=0A>=20Subject:=20=5BPATCH=202/2=5D=20arm64:=20samsung:=20MAINTAINERS:=
=20Add=20Tesla=20FSD=20DTS=20to=0D=0A>=20Exynos=20entry=0D=0A>=20=0D=0A>=20=
Effectively=20all=20Tesla=20FSD=20DTS=20patches=20go=20via=20Samsung=20Exyn=
os=20SoC=20maintainer,=0D=0A>=20so=20add=20the=20pattern=20to=20make=20it=
=20obvious=20and=20reduce=20the=20chances=20patches=20won't=0D=0A>=20reach=
=20these=20maintainers.=0D=0A>=20=0D=0ASure=0D=0A=0D=0A>=20Cc:=20Peter=20Gr=
iffin=20<peter.griffin=40linaro.org>=0D=0A>=20Cc:=20Andr=C3=A9=20Draszik=20=
<andre.draszik=40linaro.org>=0D=0A>=20Cc:=20Tudor=20Ambarus=20<tudor.ambaru=
s=40linaro.org>=0D=0A>=20Cc:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=
=0D=0A>=20Signed-off-by:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40l=
inaro.org>=0D=0A>=20---=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40=
samsung.com>=0D=0A=0D=0A

