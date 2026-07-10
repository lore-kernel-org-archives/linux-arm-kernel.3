Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69355C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VI6XbHCkQw0BYyxRAEJxXVAGqyrCldWfR9mQ71QbnBw=; b=cHODuL9tkCc6Y+y2WXephrpVNf
	VYxIGSMXux4HkiVuMIekQOGLqxdc6WB32G8XEHbtyNktiUrHkYZJ70PGeumYk1dZ8BYc5AM8PGxvN
	kVjbtX0qUAyfhElGL+EmU7hqV5is+AnH/lfAq+GRfJeQDLE4QGy5asgYpMUFefbHeo4pYOaItDro0
	xk/pfxCanahZZxwR5F/qoEC5s90HigVX1E4k2C0oaxy8rmbdQ725Qm4V8wlKzCmC3B9aA+z3relpO
	WNgHlpQCaEZ0XvbNhuFaC/K9olrxkVotR7C9LF37OvwDo9Z1M8XmH5G3guG12vJk6ZVCFA/U+Y4LN
	31hmCgzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCFC-000000055LP-02Jh;
	Fri, 10 Jul 2026 14:30:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCF7-000000055K3-3AtE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:30:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so7276785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783693815; x=1784298615; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VI6XbHCkQw0BYyxRAEJxXVAGqyrCldWfR9mQ71QbnBw=;
        b=Pk6zeKFcpl/zp7HWtHm+5cqFFikXWBBeOYZCgJM1Rwl0MFUs/21WZspoPlv1pTexAO
         nJoIzE8KUCdFO2CfDP2zyOuYkI1BpxEvYLL2bUW0Pb998oxuO/LGurixZcPA8XP3iiTN
         nvlgEmXYYmfOeRMhvQ2UrvUPAoUi+6fr80bPs49nCZ3wJnHtkCoTv6EhmrvSdjl2eTob
         r5HLuGCsWpx5xn/JUvpqcYEjVRCUCndxbb2Xkwfqc+eOIQLUIg91ipRN/167LYu2EswI
         SEodXbllG9lgF++XWuLJD/4eZaqWoXpZVSr6R6Cxsvw+LyykvLcM4Y3SgDwPwG4/s4UP
         +Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693815; x=1784298615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VI6XbHCkQw0BYyxRAEJxXVAGqyrCldWfR9mQ71QbnBw=;
        b=EBBlY0o9KbNbqahjfHBASFa3TcuRWgsTKr1DIY5NCd1R2+l+Y1Ha6rTpF7koYVeeWU
         k5sGIsVLIuGXzWlqKkT5d6UE32L/9zv19M9NzoKYBDI8jGVOVTPAE4X1bxFtb0AynZge
         wJS9/ZZG1LWZ09maJ6sIaph3EM54Fzvp2+2BXGXy4qeq2/hx5Dv4SHoiSF2+9wOmCIwd
         HIwRnXD0yWo10dKtZypZ0J/RlugR2DsXmQ6IWUcOr/QtJA52tSG+gqMuQLzr9Rvczeve
         WEALXBZQR3uYP7NUeTc2WeaoQ/TbcX1vBOPC1V3qUZj8lH583OJAcK4ehTY7EZ4vOlSk
         YTsA==
X-Forwarded-Encrypted: i=1; AHgh+RraAGshCajy3g+iGkRRGNB31teIBHAAow38chkcrRSrUY8LPgvbeHZBRNIoQsVZZfWhZHXfkoHESA0Qgxr4bDyo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4rAPsUIOIqKfY1cJdn4VtaenCRDWYaYWuKMqfgE2oNTrXv2mo
	3m/r+F5UWDkQQ2KBPXGWrO6tvAiroMTAZUonpSEsanFwzRTNlYPRfEaxKi6omupr
X-Gm-Gg: AfdE7cmqvc6rxgUHAdavGDRCsiu7JPyT8LB1FrVtqUEgj4y58v2+ylhij1WluVuLADr
	R/GljdlHFmBGHrNxk2+U4U80ewB+KYeYFdb6x1P4htXcMk6bgRBbB+n6SqxpxhhVxipCik2PS/6
	sfpJ3401eXVr4eZz4xytQO+5guvKQNpwEnoQqlHhbrwLO9PErA0LFMy+Tbo+zYjW4LeOVgEvF8n
	KkJDjU+MURSxuusWLT5ONDcNvD8tYvksfdjFVAoCtD3L+Fh31Br7UWbfIBGQazIJcOsKxYSDDJf
	kSkeaUMDZHP4NBV008y6onfV8RrfFcQ5BXL2WFQoRuifDAIu94g8lrAtWWlM2QHy3JDq4/YRraw
	qGoQAwwyx+LzZ/l1EHH+0vfLjzG5RHB/OQwilBcLjzg1hkNZBvg19BDo60dGx4AtxDvH/nk/ewY
	57YA==
X-Received: by 2002:a05:600c:1908:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-493f2b4baa1mr35892515e9.18.1783693814906;
        Fri, 10 Jul 2026 07:30:14 -0700 (PDT)
Received: from enyo ([2a0a:ef40:ea3:3f01:ca44:4cd5:cfae:605b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d88698sm65315605e9.1.2026.07.10.07.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:30:14 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:30:12 +0100
From: Dawid Olesinski <dawidro@gmail.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Corentin Labbe <clabbe@baylibre.com>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: rockchip: Add crypto node to
 rk356x-base
Message-ID: <20260710153012.0a840512@enyo>
In-Reply-To: <4011768.FjKLVJYuhi@diego>
References: <20260708175837.1718437-1-dawidro@gmail.com>
	<20260708175837.1718437-4-dawidro@gmail.com>
	<ak7jEYTAGgeDdi1W@venus>
	<4011768.FjKLVJYuhi@diego>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_073017_806349_7C66D7E8 
X-CRM114-Status: GOOD (  27.01  )
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

On Thu, 09 Jul 2026 09:07:23 +0200
Heiko St=C3=BCbner <heiko@sntech.de> wrote:

> Am Donnerstag, 9. Juli 2026, 01:56:10 Mitteleurop=C3=A4ische Sommerzeit
> schrieb Sebastian Reichel:
> > Hi,
> >=20
> > On Wed, Jul 08, 2026 at 06:58:24PM +0100, Dawid Olesinski wrote: =20
> > > Add the device tree node for the V2 cryptographic hardware
> > > accelerator on RK356x SoCs (RK3566, RK3568).
> > >=20
> > > The IP block sits in the non-secure peripheral domain. Its three
> > > clocks (core, aclk, hclk) and reset line are accessible directly
> > > through the main non-secure CRU, so no firmware intermediary is
> > > required.
> > >=20
> > > The node is disabled by default; board files that wish to use
> > > hardware crypto offload must enable it. =20
> >=20
> > Why is it disabled by default? It doesn't seem to be board specific
> > at all to me (the same question applies to the RK3588 DT). =20
>=20
> You're definitly right about that ... there are no board specific
> resources needed, so Dawid please drop the status from both nodes.
>=20
>=20
> Heiko
>=20

I'll drop the `status =3D "disabled";`=20
lines from both the RK356x and RK3588 device trees in v3.

Thanks for the review!

Dawid

> > >=20
> > > Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > > b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi index
> > > a5832895bd39..9de7e7487ca1 100644 ---
> > > a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi +++
> > > b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi @@ -1112,6
> > > +1112,18 @@ sdhci: mmc@fe310000 { status =3D "disabled";
> > >  	};
> > > =20
> > > +	crypto: crypto@fe380000 {
> > > +		compatible =3D "rockchip,rk3568-crypto";
> > > +		reg =3D <0x0 0xfe380000 0x0 0x2000>;
> > > +		interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> > > +		clocks =3D <&cru CLK_CRYPTO_NS_CORE>, <&cru
> > > ACLK_CRYPTO_NS>,
> > > +			 <&cru HCLK_CRYPTO_NS>;
> > > +		clock-names =3D "core", "aclk", "hclk";
> > > +		resets =3D <&cru SRST_CRYPTO_NS_CORE>;
> > > +		reset-names =3D "core";
> > > +		status =3D "disabled";
> > > +	};
> > > +
> > >  	/*
> > >  	 * Testing showed that the HWRNG found in RK3566
> > > produces unacceptably
> > >  	 * low quality of random data, so the HWRNG isn't
> > > enabled for all RK356x =20
> >  =20
>=20
>=20
>=20
>=20


