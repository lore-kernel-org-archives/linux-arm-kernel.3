Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F1C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6DqJBZMRrtqgXe1EMHqbmVcaqG/4/r6dtGHJCM8y1k=; b=vP/iciPtJuqZ3WpKcUEj6NtT6j
	qW1W89f+99TnpkaT08tr0QWTNGxkRuVZVZOf72H7F6MggENUMMMuPgIx3TK4yZnl2gHlsLiEl4Do9
	PkAQidbYLv79sE2F4L9JMBNvxF7WhaovcMPJbCuECjfzy6EQjdD+jVAhHO6Iw3VArbzRbqNHQdEYc
	ViiM8Ej6uwhLwDS8tNZN1mrdtx0mSS0fYFddr+1Bq2GUcmoyzYc2kQeM0L/33A4HC/fsmKqsDzyE4
	5rtOxZP5OMGGVZVC9eq1tSUmmqKb0CMDCh8blhQgRrjWxPdhIevqweFBVuOlMGK6ZCjJo5s2Wo6a0
	eCULsaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoIN-0000000DgSa-0E71;
	Thu, 23 Jul 2026 07:56:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoIJ-0000000DgRH-2Fv0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:56:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-475417f010dso206544f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 00:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784793396; cv=none;
        d=google.com; s=arc-20260327;
        b=Ohvfv4/KqL5E1TOvf3MCVx3vAwwfx3cPDCVwnDA6L5Y5iTNYLaHzbdiRsnXN6JrHS1
         PefnNJvFtySdH886ZYqf7sRQ9HveHt7hbB4MLHhVPevc90GMTqYGtrrPvJOxn4WpN2F8
         ImADwTZxj1uWHTr4ELh8L6Ads1tPR95EmIefSo5N3EkB22m2dRNKrladPDxzGgC5hCib
         Q9fKjlOyvYPc3nYCdtmTzBUyWadaDeOhiArIlrZLEb9NYvleBlk90/C6nis6OdgzT+VG
         R+hutAT+EBWc60u0Z8iSaiK74uL5BYtmQaQQwwXoW700zVRXaHecKLRBt1Absn9KP3F0
         L13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b6DqJBZMRrtqgXe1EMHqbmVcaqG/4/r6dtGHJCM8y1k=;
        fh=gapJs0Bt+h0n6NS80D2PdHOxDPT44q+ZP+BbWCn1Byo=;
        b=d6I4Ydyr/x9BJnpPjsPBfXJ2tPtmNko4FS3MWNAihVl8LP2l3QIQ8p0gvHF5mElt2g
         hrVkq2VRG/tYYE3MkYCzYCy+mu0KxqFlGt0eNCd4/jfblCXScH1monOWbgQP5Mf9gcZ4
         5/7L1II0x8B/GRXGslh9TKpynNwXHa18Ezz762cXRSxvPmVH1na0VPC8B4Z5IlMbqt9H
         GFgJG4vMGBf1IseymvcnbP2+sZ45qlLXjugLSxWIgOfvMy5zHDr4H/0P4mZhBdNPpfUq
         3riJj9uRjlqoXqw7Hld1kGs3l+CvzDCOK5TwEeXHW0QdEqOhwUhAWvBPz9gmt45o9Wbd
         7G0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784793396; x=1785398196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b6DqJBZMRrtqgXe1EMHqbmVcaqG/4/r6dtGHJCM8y1k=;
        b=efXxsn37IsSLoS8GNKUglau5QJagahLPbyh98D65Q0nw8TVR6KrTYRDiqe/x4p/e0/
         AmjnZRzaRd1NFg/AgZ5ZGsfNfzHsinVXkPOK0nON1eIe5nSjKqDaysAS9o2bp8oN+p4d
         0ZR9p+e9N/R97Eu756dYxeWkN6HIFwLAWz7k/cOepa1u6z8qS1TT42p0hhOYVRjlHmb5
         fGX2Xd3apjjJWp6yFLqBoq8vKt1Oul/dwRX3WaH8Z69zWGYSdwLalTt3t/6trJ9U2171
         R4ejR84DrMEmLPqWvZMkgjmoArOxcoGaoR3B5BEt72L8cEHRHFQSp7NQGi69J4gTUMZF
         1egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784793396; x=1785398196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6DqJBZMRrtqgXe1EMHqbmVcaqG/4/r6dtGHJCM8y1k=;
        b=ajeT3a4Ls5KoAtpICObvZWf891FHQJGyt3K0ev1Dx7xrasm+nR3DXkXlpQhP/7KxP4
         jytGdzLkJkxP+fZ6kHP1JwOVz0HLrIIBvsJBBOceQ2u3GIrQjeuN9lxTUeZYssj5EFHg
         4Gq3srIE6EaVHp+2FBVaCu0Ns6qHVT82U1J0HL5xeSLuG5rUk2N+iHJwwGXE1zwDOo26
         NDTBPO0JQav0/SUbPTWO3yKnT2zhY+7aaIg5uSW+ATzgQxSJwzza1xQvp8bZMAbF+RuJ
         Lbk4T7e+4+msErUHkhCXxP6AU/m5Hwc9Y8iY/RjBhapZkSHM1sOeGN0ScjVJPtc8h8xR
         90PQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7NgXJW5UVJtoOsqhifhTxYEE4Q0AyLHsJfKSVOSIJaZqNYbo8eUMxBIrExbKeGPjG894trXhG2O4FgFXGGB5E@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6CDZmEUgVEndczjjULdlQ2iaXfect1mCWP9vUHDYXtQG1alD4
	EckN931pK56ZwZxYvJShcfpR0AUvHsk4KdU8dFtl+xQWiC2js8nOrCxmfdEmr3dY3xS8f8POdCr
	jdaP62jlyqJOkOHr0P/BE/NvmAnr5pHHU/sA6P97LTw==
X-Gm-Gg: AR+sD10//FQqvlYcc2jSVsMKNryEX73gzD57gl2GMHas9Ud+b7SNJRvTPxbmwztutoZ
	mW6DKC7jq+m+R3SPrSwkLKEn6f4BUMhSLVZtUkYMdGQrzPly8cvVQp5sfLhbH8ONK5W9DyS7GrW
	gBT2bYR8RKs9XiBIVFzYfgjAvKWbPHcUgzLwy1OGO1IBN5cvOKhoCbttu2zZMAouoUgvhN7Z/0A
	P7o5jJm6Ob0Gy6JlYGJkRE1AqBXmYBtTFbjVeAWy+kz6GkODDNlMVsDmjcogwDZKwbMNwviG0cp
	PTm0J74vG4EvvT+M8ZrgqAlaKJQe2qt06K6Kt9PAg4jcqAw=
X-Received: by 2002:a05:6000:4717:b0:47f:9254:d45c with SMTP id
 ffacd0b85a97d-47f9254d53dmr642099f8f.31.1784793396668; Thu, 23 Jul 2026
 00:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784732161.git.gregoire.layet@9elements.com>
 <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
 <afa321db51d5e6cc8e0c15badc7204faa0925251.camel@codeconstruct.com.au>
In-Reply-To: <afa321db51d5e6cc8e0c15badc7204faa0925251.camel@codeconstruct.com.au>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Thu, 23 Jul 2026 09:56:24 +0200
X-Gm-Features: AUfX_mxaanYxpNJpBfBXDiyLmy6JFC6syJV6bIP4iGx_AuR3yr8T2VahIy9zQKo
Message-ID: <CAFi2wKbNCVqZzApbG_xcDzyrN6yt_Wc01PVVqtPROcjVnp8hRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corey@minyard.net, devicetree@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_005639_984508_D7463063 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Andrew,

> >  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dt=
s/aspeed/aspeed-g6.dtsi
> > index 56bb3b0444f7..a93fa4cf5d8f 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > @@ -617,6 +617,13 @@ kcs4: kcs@114 {
> >                                       status =3D "disabled";
> >                               };
> >
> > +                             pcie_kcs4: kcs@914 {
>
> Nodes need to be ordered by ascending address:

The existing kcs4 node is already not in ascending order of address.

'kcs4: kcs@114' is before 'lpc_ctrl: lpc-ctrl@80'

pcie_kcs4 has been placed here to have ascending addresses locally on
the kcs nodes and still
having all the kcs nodes next to each other. This matches the kcs4
node ordering.

If ascending address is still preferred, I'll change pcie_kcs4 order of cou=
rse.

Regards,
Gr=C3=A9goire

