Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2121FD3758
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0joXdqCmpjckjOnaHr+/OVg5l+LX4VW8NWHw8AyruZ0=; b=b+ard6Yf56FvvAi4pmdzLZGdSH
	iht0jDeGCjRRP6J79vpQH0rh0I88OYkQP0nblVQ3WoMgsw/DBrszam8kLnEtZJGeJoW7QgknnAoIb
	wAIuRgCASFyTFpND46K8tHBjZiDSSzIrkX6gKoSwR03VGdmai8EyUiUeKugQhEpOoRIlAFBmyjkSw
	jJ0sS+70ApDtmFoGp9sKD5Wnk93GwfZRSkI+aR/s96YtUTQXgoKDp13QZvVj9s9f3xYjV7ORo8kTN
	1Zg6h0oGyKUTsXh/eoh4LPx4AnB4zGuj+kowWPEVEhebbY/V8RtN/uOxnfOO5SYSNAqiXMEPIOolR
	uUrPGl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEJS-000000041YS-1ymE;
	Wed, 25 Feb 2026 12:48:22 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEJQ-000000041Y0-1CGZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 12:48:21 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so2283742a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 04:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772023699; cv=none;
        d=google.com; s=arc-20240605;
        b=Yv9aW7OkAwOeBe0uPitsI0jsj88C/CSoya2vah68OtHqtUFhgEQRw87Bx2xM/Ajfjm
         a0E8QWod3Zmiic424tVL5occTeXfnemihBV/5IfSAdlGZaJYXM+gVFauiTs4Qk7ci5RG
         YYtqU2wjraMxwiIN3047CquyTwrxOgWE11koLeqC5cmJFB5XFCRVJW8Yxm5TA0g8SH6J
         513qydkF3s9911XoEAHoZsZxwCXYZ3VzJkiQTVSHKIj3m3752REKVMt941toE5n/amL2
         nLfj2uKbpw9459mfn9GPl4tiSQF2GXsQlFyxI2GNQRtoIUkcArbnqq5i6APQudI9lxT/
         SvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0joXdqCmpjckjOnaHr+/OVg5l+LX4VW8NWHw8AyruZ0=;
        fh=4LtQbphNM04igEdWGeouw2xgwzjq2Wu4xA+jJ7gKveE=;
        b=e0RbqHUCsC4LU/Bc5c79aC0bhhHlIHvDNs13UQ3J0XCxt422zTBVLBSQjJNhJua9lQ
         i2lwCKr5x2eJJH9DvAwz6ZY2eSNb4FIchluHNj4pcWjX/lChXZ5jsqn8nnjCfxiT9qui
         se6ZPBAlXpOt6Bp8Wg9KkT1f2jh6XrkHntk6Cv6o00MHf8VzSs/eYK2L/i2VU94y8h+M
         +CzztgWlh5DFk2xFoXFBvKt6Cwtx6NebcMC+5wveXUk0BzsuTA16Vx8qT+1KATbZR7YY
         KrCEyH8ZD1o22rLI1OdOTYpWOUicnMuuoZLGwZWDF9P1RTMHw/BdtwVSA7ZG3Nq8ZI4Z
         s88Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772023699; x=1772628499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0joXdqCmpjckjOnaHr+/OVg5l+LX4VW8NWHw8AyruZ0=;
        b=afGXX2MeiW5m5Fh99z3DJZlXiJTGq0ZB8h0EvYklv4QOMnQPTxz4NGvvVUoP2z7won
         Tt6RBBVFK3q5Z9r4kjBxhwrPKea1PTc3vYLJVssI75fGNFSlErVlcmia4nOzi8WZ5mjb
         zXaRcC9kOcCsG1h4t92oiVzkGckRse/dP51upY3NEjblNXA/IaI0YkBO1wi6+xGmqFsh
         9mRZGp3LlB20CypX2fJoS1rNiSOeAC51o+zAmPc+IsOXx2IaacW8wB0reFCet2W8gHr/
         KXqRaVt2I48n0h9EI2gfRzTchcJIsyp4I1kv66TZbMG/NhVBuETFclW+KWLx4fkpZzzO
         5iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772023699; x=1772628499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0joXdqCmpjckjOnaHr+/OVg5l+LX4VW8NWHw8AyruZ0=;
        b=rkL2EOoyujcEmJ7wFsjhKgBl21KG9WOd/YPSvmWAfmajAssOaqTanhvvpRvDg/NZUY
         0ZuVMq04/GuI2Gnc/DDN9Yaa24FpWjp9cYxv+6Ww/UBJBPUtG67K/dujrFMpKqb20EGX
         Tzk8Qyvua8l2dI/BgC83fpjkZPvAlpvARsCLf2bGRVHIoBsXdR/JaZM/EQs4gmdAKO5X
         hYC98yhlAbuTWVC0o3w2liz4ccfT1qqpAUCjYkRTIR3go1fP7jBkCtOUfKQtu5qVUCeG
         H5ELex6dxR+fVG12hDHLQvQMsEeEFuNbdAW1mdge/OWHNOGELuEOX2njxMLB1TYwGDoY
         rlEw==
X-Forwarded-Encrypted: i=1; AJvYcCWXdrBRxFRckq0q4Xom8O7eJ7nieux+siRSegIA7bQfMQdSB4LVwvT7EkXJGF0MXiYzJdIMv9wUIWFGT8OhuTP6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy3EPRj005W/5JGHLy9FnrQ9H9YtU1NaG2K2Pc2E00QdHjrYdv
	wkStbuNSw+xQeg3pBiviL4Ya/aofFP7YsfVi0Xtdf32H2gWxBL8IPAImivVAenhm4X6cfEq09HO
	h+Bzz/vp8zjjYLwTTEX1CvJgH7lL2N5c=
X-Gm-Gg: ATEYQzyBHAkDuds2Q32eXjEwbMKFKK9NGhBmI0o+EaRzlspYFHZ82OAXdLoONYnTRak
	wgbpPF7j2n2YvHQJTzxbZSBngNwCr6xkH95Fjqngapd70PwGtpCvTd8Ubl53g5FgnTz0YEcVuZU
	INMG8adFU5PerZyG4TtobN7u2tRdW0MVemVvhTICJpAqmGGvLgZ+QwnaxODKgbFqFSNEtMV9gLF
	I9kIz5WfsQLR+1VbpJsfi7UDo9qsO5vMImLZSTEBlElq5poAUxMOSjCE9MwYY0WEcrOxxlOr0VP
	SuLIqTkPZs/1uCKqHg==
X-Received: by 2002:a17:90b:4a4b:b0:354:c602:a573 with SMTP id
 98e67ed59e1d1-35928bc4ed5mr108304a91.27.1772023699139; Wed, 25 Feb 2026
 04:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20260224094527.169215-1-shengjiu.wang@nxp.com>
 <20260224094527.169215-3-shengjiu.wang@nxp.com> <409f6214-7ffd-4076-a658-f4005adbe101@kernel.org>
In-Reply-To: <409f6214-7ffd-4076-a658-f4005adbe101@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Feb 2026 20:48:06 +0800
X-Gm-Features: AaiRm53oiJrh-4UikRVcBaU7QuDhh_o55M-8VgnZYHqUuq2eisQEPvQ0Y1s59EE
Message-ID: <CAA+D8APngdt0vx6MJ7Knj_-0Ngr=1czTeDZruhqA6c7zRSfeDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP audio board
 (version 2)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, daniel.baluta@nxp.com, 
	dario.binacchi@amarulasolutions.com, alexander.stein@ew.tq-group.com, 
	Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, y.moog@phytec.de, 
	josua@solid-run.com, francesco.dolcini@toradex.com, primoz.fiser@norik.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_044820_331226_FF8B6A47 
X-CRM114-Status: GOOD (  12.50  )
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

On Wed, Feb 25, 2026 at 6:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/02/2026 10:45, Shengjiu Wang wrote:
> > +
> > +&ecspi2 {
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>;
> > +     pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> > +     pinctrl-names =3D "default";
> > +     status =3D "okay";
> > +
> > +     spidev1: spi@0 {
> > +             compatible =3D "rohm,dh2228fv";
>
> NAK
>
> You don't have there. Stop faking up hardware. NXP received this comment
> multiple times already.

Sorry,  didn't notice this was a fake device before and didn't check
the history in
community.
Thanks for pointing it out.  I will remove this node.

Best regards
Shengjiu Wang
>
> Best regards,
> Krzysztof
>

