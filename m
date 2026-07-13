Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABD7C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFNvTgSOaIofZGokjnrOm+/+KhGzebARxZ9cUDDgJek=; b=Drst1VeE6Ty0j67LVwmyz6PBOQ
	YMcpvZ+dv1Oa5kjWOz9VfHNi04S2hFAfkpXnoPdObwJXS6+aw3qItHyLu30CuAsOOmkjoczhg4ktH
	G/oI5JGZnv/fRfKmqQFVkPUkgfqQE+N92EKEAoejO9njXGvHRDnFC6HCmHh51kdo5ZBCGgb7207+B
	VUB6WoJcOFYg3XSPJAQ40nSHkkmUVVs/v3KAUi2w4Wog5pQxTF7fjOpiNdqLVvLrpAG/C0TG8nNgv
	86MJxyUMeOYdAlRIIz4ozWs8iaL7Ndaq/iOfJyzz9/Y7UfcllA3y/HLOH4D4Ig7UFUG+LAgxB/WMz
	vh+6mHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIxT-00000009qWQ-2zE9;
	Mon, 13 Jul 2026 15:52:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIxR-00000009qVe-2IC6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KFNvTgSOaIofZGokjnrOm+/+KhGzebARxZ9cUDDgJek=; b=G/uEyQmGXeGjrbr89cH09hkr+O
	wgh+j5anai57SCVfN5e+BnTc4R5PxSmhgarxMnK2Yf6ATt8aMwfWaFPqQLdHd5GZjL1iVxprMDE5x
	c5ln9J5g+nPQNseM9CALw76pj5N0K/t6b8hXQWbnmQYjxssQlFtSGoibD/92LcTRCbOET6iJ2jK7x
	KRvpPCTgav34B3jkh+JtokSYAxrSyfHoM8hlJdUfFem6GrNPYXYxKIWWeAnP7Q7F/zk4NnjzUvN0p
	5FYY7Yzzm6PEUV8CoFi9x+Ecjl6kuH5pp1RP+vxX52zIO/Aj7kqq8PYYUzaAhw39JgpToiG3YC7Pi
	LzDtGSHg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIxO-0000000BnoH-1kZt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:52:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF3924E40D90;
	Mon, 13 Jul 2026 15:52:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93B9160345;
	Mon, 13 Jul 2026 15:52:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEAB111BD22AD;
	Mon, 13 Jul 2026 17:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783957943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KFNvTgSOaIofZGokjnrOm+/+KhGzebARxZ9cUDDgJek=;
	b=KRLzLXspi+LaoNuCOi/KxgDaZK4Km288kw0do2R+A40umXssaMotiITXLTLj2QU8syI7r7
	c66cqbURNCQBA7pEqeSfRmTDGR8n7OhNn2YHmwwLnWaa981l3mJaUjkOjO3rlIM6xJocZC
	oXtiNYjQJfIFdpwiP9QkWQO8jDrPyL4B8zG9KpPDhUEU+2vteF2KN4eKpu9xgP2Yew39Rt
	eJ7WYN2ozxmu9A5S8AT3IJjR0A+tVJpeXF5GbfUG1X52kAZYBLN46Y/8NjDk8WkDR6Ose5
	bta9jquD/OuHNlM+Im4tX5AT5LHAXZF4sBZPU3r8jCd2IaYcOvLMUGsNxkYLQA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: marvell: orion5x: Correct indentation
In-Reply-To: <20260706180333.648401-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706180333.648401-6-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:52:22 +0200
Message-ID: <871pd67uq1.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_165234_592992_B0810963 
X-CRM114-Status: GOOD (  10.95  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-ch=
eck-style).
> ---
>  arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts        | 2 +-
>  arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts b/arc=
h/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
> index 12a4aac2633e..9757c3b57de6 100644
> --- a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
> +++ b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
> @@ -109,7 +109,7 @@ flash@0 {
>  		compatible =3D "cfi-flash";
>  		reg =3D <0 0x80000>;
>  		bank-width =3D <1>;
> -                #address-cells =3D <1>;
> +		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
>=20=20
>  		partition@0 {
> diff --git a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dt=
s b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
> index cb1bd24b7ae3..b2b3309ed1df 100644
> --- a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
> +++ b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
> @@ -69,7 +69,7 @@ flash@0 {
>  		compatible =3D "cfi-flash";
>  		reg =3D <0 0x40000>;
>  		bank-width =3D <1>;
> -                #address-cells =3D <1>;
> +		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
>  	};
>  };
> --=20
> 2.53.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

