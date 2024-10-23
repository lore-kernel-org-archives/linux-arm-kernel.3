Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B19CDDE62
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xo1eeiTgVZYq4ByM4vw+H1JV/QTd+caClf5hFYE3Uik=; b=0fKLxKbx96oQn+DquwK3Te7Uit
	bIFM9spBigF9ZdnE40B2YHh8K6vEKkmYyO9xHfZSzEPQ8B+6NlOyGlhO6kOS3FXXne3rbXhXQmiL5
	9Jgas6hfBBfDJTGJ6AxEAeEHoW35/RJHkeveXdGjqt6Rm2qnJqicOoLSNTYAQ8mWqvjDTDzH5H3Ss
	UfUkoffIuL3kb/+LPJ8HV2hLKCSZnBmblf6R2YuMzT4LC6HG1co6n5v1LzLiUqE5hSGbokPIGqgPX
	FmQ3LKxX2zCLjV1BZQlT/9bxsWJBKHHxDxtJwLthcF63W30vxEgRiZmpoGmF0VTDNlNwO3bghBXnW
	kcymsahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ys9-0000000E1uM-3eFL;
	Wed, 23 Oct 2024 10:45:49 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YKB-0000000Dw36-14q6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:10:44 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N81PNq031369;
	Wed, 23 Oct 2024 12:10:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Xo1eeiTgVZYq4ByM4vw+H1JV/QTd+caClf5hFYE3Uik=; b=E/rc47slUUGkV4Qb
	X7SV5eUil6zyjtO4R3GKzIPDzBE3qYYbm8Tr95nRH8qxltKNVCfXtJriYD8XDt+S
	XBXFEmbXp/hKilUlVUd1bshlMF/qO/aKh1JmxmCrO5tkoEYGBTthrL4xBwgrW3Nv
	Pvwenlc9Ib8gh1+1o1qIlyHKciFTY2DKub3Vj1f6qxaEQvlONyvYnAEwXQwmxYwD
	2r/Q9MZV1/I27hg9JzvVaL/ZNhcKnd61OZv2lbmWnf1ShO1MRWeazfbaPZgY8ZQ7
	Wj3x2aRoWMAQMDDjpWB9g97pHBiAo+Bh1gwK2+JGHMk4gZ2dRIxlSm/ovNgzv5I4
	3pIsIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42em4djq8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 12:10:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 34AC640050;
	Wed, 23 Oct 2024 12:09:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D04E82699F1;
	Wed, 23 Oct 2024 12:09:01 +0200 (CEST)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 23 Oct
 2024 12:09:00 +0200
Message-ID: <334845caee45ed72ef08867f23f69b5333be57c5.camel@foss.st.com>
Subject: Re: [PATCH 11/14] dt-bindings: pinctrl: stm32: support for
 stm32mp215 and additional packages
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic
	<clement.legoffic@foss.st.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Date: Wed, 23 Oct 2024 12:08:59 +0200
In-Reply-To: <2g65375shtjq4udjfarfspqtpg5q27oeerqskt2uzwj44pvnbb@rderpevnrzxs>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
	 <20241022155658.1647350-12-antonio.borneo@foss.st.com>
	 <2g65375shtjq4udjfarfspqtpg5q27oeerqskt2uzwj44pvnbb@rderpevnrzxs>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_031043_772944_6CC33743 
X-CRM114-Status: GOOD (  20.48  )
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

On Wed, 2024-10-23 at 10:51 +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 22, 2024 at 05:56:55PM +0200, Antonio Borneo wrote:
> > From: Amelie Delaunay <amelie.delaunay@foss.st.com>
> >=20
> > Add support for st,stm32mp215-pinctrl and st,stm32mp215-z-pinctrl.
>=20
> So all previous patches are for this? Then they are supposed to be here.

Hi Krzysztof,

I'm not sure I fully get your point here.
The previous patches in this series add the new features to the already ups=
treamed STM32MP257.
The same features are also needed here by STM32MP215 and in next patches 12=
/14 and 13/14 by STM32MP235.

>=20
> > Add packages AM, AN and AO (values : 0x1000, 0x2000 and 0x8000)
> >=20
> > Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > ---
> > =C2=A0.../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +++-
> > =C2=A0include/dt-bindings/pinctrl/stm32-pinfunc.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 3 +++
> > =C2=A02 files changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl=
.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> > index 9a7ecfea6eb5b..0a2d644dbece3 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> > @@ -27,6 +27,8 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - st,stm32mp135-pinctrl
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - st,stm32mp157-pinctrl
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - st,stm32mp157-z-pinctrl
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - st,stm32mp215-pinctrl
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - st,stm32mp215-z-pinctrl
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - st,stm32mp257-pinctrl
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - st,stm32mp257-z-pinctrl
> > =C2=A0
> > @@ -59,7 +61,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Indicates the SOC package used.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 More details in include/dt-binding=
s/pinctrl/stm32-pinfunc.h
> > =C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > -=C2=A0=C2=A0=C2=A0 enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
> > +=C2=A0=C2=A0=C2=A0 enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800, 0x1=
000, 0x2000, 0x4000]
> > =C2=A0
> > =C2=A0patternProperties:
> > =C2=A0=C2=A0 '^gpio@[0-9a-f]*$':
> > diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-b=
indings/pinctrl/stm32-pinfunc.h
> > index af3fd388329a0..01bc8be78ef72 100644
> > --- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
> > +++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> > @@ -41,6 +41,9 @@
> > =C2=A0#define STM32MP_PKG_AI=C2=A00x100
> > =C2=A0#define STM32MP_PKG_AK=C2=A00x400
> > =C2=A0#define STM32MP_PKG_AL=C2=A00x800
> > +#define STM32MP_PKG_AM=C2=A00x1000
> > +#define STM32MP_PKG_AN=C2=A00x2000
> > +#define STM32MP_PKG_AO=C2=A00x4000
>=20
> Why these are some random hex values but not for example 0x801, 0x802
> and 0x803? That's an enum, so bitmask does not make sense here.

The are bitmask. You can check in patch 14/14 that adds a new package to th=
e existing code of STM32MP257.
Do you prefer I rewrite them all as, e.g.
#define STM32MP_PKG_AO (1 << 14)
?

Thanks for the review!
Regards,
Antonio

