Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ED1D2E02B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4oK+ppGTcU7dSjV7y+6H5nQdcyYAsUQKkYiXnnfEy8=; b=Ju6d8UQjd+lTu7voZ36zeB2CYh
	jfFQ3f7APacd0c68FrS6wNZ7ZEuFpHia++MGi5BNkdJam6XuB4XOGtMgm1kIsLfigdX6USGhT+ear
	R+/l+vnXLNp5kqHAbRZlA7kCDZ+5rsKlDGx3Zfa4Zy4cRJFw9GECHvGQXrRxR7wEqdvP6LielcZHr
	5vuqLRupTZBZ5hitEk9S5vwSm/KGot4I9VKzJ6U87ZHWONFueeTXngNKbMa12mfFdz8Ezp0T9oT/V
	GUisVxNwHD1WjSevOHX+KrGl1DJUHj06LPg4wSztQPqhYsnHTux/KduI3sf89MYnXX/sXqys/BArc
	tSCKkPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XRo-0000000DkBO-3ngK;
	Wed, 23 Oct 2024 09:14:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XDc-0000000Dfzd-2giN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:59:54 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N81V6Z032518;
	Wed, 23 Oct 2024 10:59:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	u4oK+ppGTcU7dSjV7y+6H5nQdcyYAsUQKkYiXnnfEy8=; b=Ts5wCi4Us1LuKr7x
	FkhxMlBejRiyra2bjKbcFaK2my+Zey3E/JKpZ3atkMlSgXh2EQe63v157zg5bBTp
	dfaJGvqueS7uZmhDxmD4rd+KQNI+9vwR9HOmuYcmQ7+/gEtEup9UUf/gQijF+Yn7
	SpXznbRHmfbviY4XW0YZg2uZr0DWZYhZHAwqLhtl0HFbztYaqwae3b9T4/hpiVsj
	O9+rklX+4/6JxFB9CwtW7RIoDJ4G+YOFp9kfUke5JceL3eIF0V+tNIjb0E2xVKa8
	MIXD6lG5mj1+I2WrjtFEivHGEkACFhMNw5fRtMwKhaIAcrX3OAbUL4/qA4TIJp9R
	RU/Jgw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42em4a2abc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:59:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 355724002D;
	Wed, 23 Oct 2024 10:58:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29FBE265534;
	Wed, 23 Oct 2024 10:57:00 +0200 (CEST)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 23 Oct
 2024 10:56:59 +0200
Message-ID: <680f3e0b7458015d5b909200342a623eb55f907d.camel@foss.st.com>
Subject: Re: [PATCH 04/14] dt-bindings: pinctrl: stm32: add RSVD mux function
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
Date: Wed, 23 Oct 2024 10:56:57 +0200
In-Reply-To: <swbppwzpavktjpyb6piayzzht6ta75w3g36oyndmim54oztar5@svb4452yob7g>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
	 <20241022155658.1647350-5-antonio.borneo@foss.st.com>
	 <swbppwzpavktjpyb6piayzzht6ta75w3g36oyndmim54oztar5@svb4452yob7g>
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
X-CRM114-CacheID: sfid-20241023_015953_092542_308E0DA6 
X-CRM114-Status: GOOD (  14.02  )
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

On Wed, 2024-10-23 at 10:47 +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 22, 2024 at 05:56:48PM +0200, Antonio Borneo wrote:
> > From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> >=20
> > Document the RSVD (Reserved) mux function, used to reserve pins
> > for a coprocessor not running Linux.
> >=20
> > Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > ---
> > =C2=A0.../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0 | 8 ++++++++
> > =C2=A0include/dt-bindings/pinctrl/stm32-pinfunc.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A02 files changed, 9 insertions(+)
> >=20
>=20
> BTW, which *existing* SoCs use it? Aren't you adding it for the new
> platform?
>=20

This is already used in ST downstream kernel for STM32MP15x
In this example
https://github.com/STMicroelectronics/linux/blob/v6.1-stm32mp/arch/arm/boot=
/dts/stm32mp157f-dk2-m4-examples.dts#L112

the GPIOs for LED and for PWM are assigned to the Cortex-M4 and Linux (on C=
ortex-A7) is not supposed to touch them.

Regards,
Antonio



