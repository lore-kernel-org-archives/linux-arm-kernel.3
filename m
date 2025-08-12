Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74130CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 06:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kDMXkiqwspte3OFxiCO5uJIctYbcK6fSwBNuY8L+04=; b=USsf1Pjw2dZvLtr6RmiZaIQ0ya
	Z5sqy4qSqMnVbjkvJnn2pA6h+1/DzpqOQnRyCpJllwdZpzaLodT9EBS/wk4CFEOEKI9qkXjL5HNP1
	2ORvmv3zqmD+U0JowOyL259BdE5/Hc5BFq2fndVVcTmqi9bc23iGQrbkOwlkNY34Db4adbbpw7ez1
	l18vpYuSvt3T6BPwPfwD+YVBqE1eG7P0WOAhs059JlqCWKOYx0JXdIQ8GUtj2ZfnOlQVHQ3Ndjd7t
	w2VLUiO6lXCEJIrP2wPLX6q4rD8r5JaUuzY80yuVCSjvbqBJ3L8QK4T7jZmIztoqtenb0Y1B4ZAbR
	n9OrWTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliOM-0000000A0wQ-3JuU;
	Tue, 12 Aug 2025 06:21:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliHM-0000000A0OJ-07TB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 06:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7kDMXkiqwspte3OFxiCO5uJIctYbcK6fSwBNuY8L+04=; b=oEDWqb0xdVic1p5b23j3xT8gow
	vMK8Ruau8Ghg9pKT0z1oe61Diw3Ug2Q355Oy0SKSE29KFPzSLVIX7lWJoX0Zvt9d/UESPSucZTK5y
	/9+qj4Hd5o1MmwqqNfRtOZKMvYxTgtxOXBZa1Uy7GG9xBadj3dWll+BuZKE2J9swsUohBMP/UXaWu
	mAmwJu3Q7ZURUdB0zlsBN1+QYLLOOIrMtF16yh1elzM3V5EKYdsMYOV38VB6Sj6x85L/AE1n5sUqT
	iCVilfdSdFxZQV+FXL+RF5FEEAZlwYcmmyaipWCReRjvTF2qCorUNwSIghe9+mL4JJdBA7Ztu0BBp
	ua6qAZYA==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliHI-0000000FhYs-3RU3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 06:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1754979272; x=1786515272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kDMXkiqwspte3OFxiCO5uJIctYbcK6fSwBNuY8L+04=;
  b=MQxza+jBwlXd0Lwr1SXqfOd4JEnJdTRMyTpVPMYLdWOFS+3rbIn056xi
   jgiYCYkM3mAVnhadgCC9dB7Po8CaB/5y+9A4n3/ZbvSBKp1hpClgjPn9p
   rDdlpjpvnDy+7YR6tzFs8bbkkVsy7BorUNMpcP+50xMKm2NWi4KJDwHEn
   1S/T/P4CFncRrqzvKZ39Q5O6Gcc5HNxJDwyxRrnZ+uEMSn1UC6T7n7BwG
   hEagQ//7+wlQUG8fQv5tPMqSkrDHgNZlOsdlj6a+p8pFXv2GHcaBXkQV1
   944emJUnZkivJfvEhZCIoz3qYJSZUe1dgvtQHqkTbw8v/TJSIlD4vVbP5
   w==;
X-CSE-ConnectionGUID: B4ffp1ALSjKWb0uJfw2sUg==
X-CSE-MsgGUID: 0MqoVO07Ql6hiYkpsM+9JA==
X-IronPort-AV: E=Sophos;i="6.17,284,1747692000"; 
   d="scan'208";a="45692356"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Aug 2025 08:14:30 +0200
X-CheckPoint: {689ADBC6-33-AD8F5F64-F0EACAA5}
X-MAIL-CPID: 742ED08D02BE758A2A1B26C8759E02E3_1
X-Control-Analysis: str=0001.0A002104.689ADBC7.002A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AFFA16835C;
	Tue, 12 Aug 2025 08:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1754979266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7kDMXkiqwspte3OFxiCO5uJIctYbcK6fSwBNuY8L+04=;
	b=VOm5I74Oo5znWlaXmN6u8OJRm5q/YOa+tu/QK1DPY5JPD+J7KZGpK5JP+DU17ptUV0Hb3E
	zH0KCm5pUcm6jc+JsrDLMmMdfbkLdqmuDZgGcNI/xvacXZt35YOmrj5rS/9qA01yQEkhMJ
	qehK313US2ohYsMtXl+5cbLNmpe9CNMuB0qhy/HsC7aaAqu2XMQP6PVnkDcsIvmCJYaCfC
	WjOI/fho5sWWLpFhNWOR9IAwC/vgZ4/7MJ2OQsWnx0gS9ILCSyIHS9ec+va7ZwIFDbnqM0
	D2KA/TaS1pwf8V1K4T/3Ax/ptch+2mCRXDQ/5g5cJwC/31mROSUCp/lNkZNCXQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: fsl: fsl,
 rcpm: Add #power-domain-cells
Date: Tue, 12 Aug 2025 08:14:24 +0200
Message-ID: <2799138.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aIv+CgkePusUoT6Q@lizhi-Precision-Tower-5810>
References: <20250731055806.2265628-1-alexander.stein@ew.tq-group.com>
 <20250731-funky-crab-of-defense-7cd658@kuoka>
 <aIv+CgkePusUoT6Q@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_071433_052294_B85449B0 
X-CRM114-Status: GOOD (  17.53  )
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

Hi Frank,

Am Freitag, 1. August 2025, 01:36:42 CEST schrieb Frank Li:
> On Thu, Jul 31, 2025 at 08:32:57AM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Jul 31, 2025 at 07:58:04AM +0200, Alexander Stein wrote:
> > > dtbs_check for ls1021.dtsi warns about unsupported property:
> > >  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' d=
oes not match any of the regexes: '^pinctrl-[0-9]+$'
> > >
> > > But if removed the check warns about missing property:
> > >  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' i=
s a required property
> >
> >
> > And if any other warning says something, are you going to do that as
> > well?
> >
> > >
> > > Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cel=
ls
> > > for power-controller node") explicitly added that property, add it
> > > to the expected property list as well.
> >
> > No, commit does not explain why! It's one of this NXP commits without
> > explanation, doing random things.
> >
> > No, explain why do you think this is a power domain provider - fast
> > look told me that it is NOT.
>=20
> It is not power controller. rcpm controller enable wakeup source.
>=20
> In arm64, use below patch to fix warning
>=20
> commit e39f567e1c38c29629962ab327f0ad1a288dcab2
> Author: Frank Li <Frank.Li@nxp.com>
> Date:   Mon Jul 29 14:59:24 2024 -0400
>=20
>     arm64: dts: layerscape: rename rcpm as wakeup-control from power-cont=
rol
>=20
>     Invoke power-domain.yaml if node name as 'power-control'.
>=20
>     Rcpm actually are not power domain controller. It just control wakeup
>     capability. So rename it as wakeup-control. Fix below CHECK_DTBS warn=
ing.
>=20
>     power-controller@1ee2140: '#power-domain-cells' is a required property
>             from schema $id: http://devicetree.org/schemas/power/power-do=
main.yaml#
>=20
>     Signed-off-by: Frank Li <Frank.Li@nxp.com>
>     Signed-off-by: Shawn Guo <shawnguo@kernel.org>
>=20

Thanks for the link. I've applied a similar change to ls1021 instead of thi=
s patch.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



