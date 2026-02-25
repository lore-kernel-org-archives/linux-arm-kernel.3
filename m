Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0383EFB7F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74IdwuXc21OGgUiiss6XTtfN5U3py4VIK4AnmFhKGeQ=; b=ptJ2aY5yMv7eoNJYntxuHNKc94
	nucOeL6B/+UYYblDr4qK2sQBtP13eGDLTwSGyCa0qjf0UVwfs3XWmPtW10vKhEBtm2mo0It3cUjcQ
	uSsv8mIQlw3sjyknyyPO4adIAUjG/WeHfZmg5G37GKjgheTkzuFEJTKEpRnCDo0MroswXhv9msVak
	TAhDwi6iN+Hlr4VxAqlS/QI2dkzBmYOhbLiQRFOe7afoAkYJEzt3RRCnvrRuUE6dlY/Zok+A+tPD+
	81DmZ+TP7j7bYzaQWY/N2aHHNCj1xpc+7a81qkJBjgstz73kM0BCN6SRS1CQ7/u2fHJUpyBiNRm8N
	KSzfJrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8M8-00000003KUy-2Gaa;
	Wed, 25 Feb 2026 06:26:44 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8M6-00000003KSj-2KRR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 06:26:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2add623cb27so2321435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 22:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772000801; cv=none;
        d=google.com; s=arc-20240605;
        b=boZrXzQ+mC69HfduoGFMeRi16XlJdmfoz1USXpEkTMgDKtQAfTZWTE80YusYT5RqGe
         uEjKNqNO1Elo70EkyK28aSj2GQInB8hBlt0WqmQ9r039CsTazXxT4rffAnVJcPv2vX2c
         T6GPNPMvbvCMSrA9X8WiocM5u8wLR72/s3vdjp40dJd3ouZidwczt/Nx2ooveIpHaSsD
         IKcuSpg362D1jai2sVqSNrJgUzzGohHtjxK9Tq8d3e1WPfFY6braoV3HKo6WC1bGHWqt
         rUDeb+DLnpkBT+ue3i2pAiBNW+m9Kt42kWkpRZVQNvHimzT/YEXV/Lfui2Yycm78etNA
         5NKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74IdwuXc21OGgUiiss6XTtfN5U3py4VIK4AnmFhKGeQ=;
        fh=EB519t+viwsf27ByD8q0U1CZHQNdZdQUtYTV3s+7Kno=;
        b=WPUKWTtuoCRMiXfnEvwXcrPTdsyMKEnFrfCw4rDTkVgnfqz06pcTQup//o+LAOtpln
         5SxGSqBnCx09w+1HOiePtwNH/vHx5PTLKbtiBeERxytXIM8BjRvb+ICWCLijsGNqszwI
         LKIKXmU0l5neAQrN5Ry7HnSujCm6CC+E8E63JYwt/dG4BJ/guv4himGLgDa9cRcwRjh6
         w9mwI7CLNO6Uv2NP+x2vbyE414dGnkSSK4Tq0NsBWaqYc4/D3zZmPGnPCdIlXKL91817
         SRIf+bIDbgtrAsui9BqRhNdvG2QST+PxqSCtXeJcorZuKBD3dV3T4bPh3i8y4n1w7kjo
         NEDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772000801; x=1772605601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74IdwuXc21OGgUiiss6XTtfN5U3py4VIK4AnmFhKGeQ=;
        b=YjMfp9bQ2t0/hfP5k4lJ4OSOiVR8UQx/PvRyLsaaGvTQIWXtckdpF113fwRQDF2IRP
         hawtg5uALsbjtiQUW0kBXKK0QGO3Jb6wz3kiiORo4Y8cX2j8uhx/ArglGWsgFwv6MjgG
         81TJpyhSe7AgGN39k03Yi7I3sOLGuiyrOkalt3UOczjt5ii34/QskOKyZrXzPvz7Gouo
         bH22gHRYudJoSPr9gqiwwnOaPiHyZLhbxVNK8v1WesK15M3ncY9tl4w1hEYY5R0yEE90
         Kg+k841yvC+6vulompObiulCO1YLuaV1kaPOzB+B7dz8gCOtzTxDxZnWmu8rr3aWy4bY
         OqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772000801; x=1772605601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=74IdwuXc21OGgUiiss6XTtfN5U3py4VIK4AnmFhKGeQ=;
        b=e0McQkCS5HYUSbXeus/hNqN7nRJp8UBhn1rrw3h0JYD9XRkO3UAIE88SJqU2Jc495y
         4fXX9IS8TIppjQ+IKknNuKuuq1BCjUq79xgyqlaERVw1eRCZmpg8AAe9rKhndXZEE9Q9
         7XeF+xxlfA3tdkllW3lgLczuU5+cidEpULAF6vkqvhMS8uvqeYYBEFkWuPq2BHTNdTOs
         vvLNlVv4MmOLC4rXiGRxreiPBVNM8+9R4dIgIi92aqsyBzF9K/djeaHcaD7NQurBN7jN
         OquDVL1byPX76gqoWZXjjQVrUkXXhXneJIultjp1aV5IVR5og1ohX5qk/37zuGC05T2g
         lVhg==
X-Forwarded-Encrypted: i=1; AJvYcCVcyyKZpsAvBa9T6LjxCoLiH9lZPaQ3iQ8AhCAb1I1a/yhEXceRa6gOWncG31v+t5aHRTULWCrcVy3Chj8rorx6@lists.infradead.org
X-Gm-Message-State: AOJu0YxmKbbsV86YiVCRWsYnQbsxSJhQalC3X7TWKlU0XlH5/IKz7x2m
	UMROBoxPvlZ9inT9VdDIhaWzT0PLxQebG0jQkiVzS2OqVfXiPuuJ0UD34r5d3+4+Ja0JqJQ0PZC
	k0J+JkdWrtR1om75xhs3h43bUAbRzTPU=
X-Gm-Gg: ATEYQzx4JuaicwHVmtozsxbMWTJutHtBYNuINo266BLXfpVWW55n/FpFrkZ4nfJl4g/
	NVwHnMW2AkweHhvoy+pGy8TaRSPXusurHhMoeeMccrneS/ReP1wl9BXVHtX5OuN7duaOrrHjWZ6
	aACNZqK0m0RXYBYvPYMSz45ThEf0zJmUbbmbae3sJvMuHxrdwQwqW9PjGCOe0Y3IicTsjKUBQDF
	fhO6AWe/JpJn2JI4NEEVZlaHTlnBAO+sRH3HN0P5i0pEgMZ6IdgBetHpA1n4aOvPK2xL1Pk1drX
	Wcv28fw=
X-Received: by 2002:a17:902:e746:b0:2ad:ae4e:bb6a with SMTP id
 d9443c01a7336-2adae4ebd03mr38828325ad.24.1772000801097; Tue, 24 Feb 2026
 22:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20260224094527.169215-1-shengjiu.wang@nxp.com>
 <20260224094527.169215-3-shengjiu.wang@nxp.com> <CAOMZO5DW5Yo3A3kPOe+NdQNwTATzzWguCGBDyK2UFjCrHtwFeg@mail.gmail.com>
In-Reply-To: <CAOMZO5DW5Yo3A3kPOe+NdQNwTATzzWguCGBDyK2UFjCrHtwFeg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Feb 2026 14:26:29 +0800
X-Gm-Features: AaiRm53sttei49Mx1DQyMYFyac4_nAUg2Jcjs65LfbJ3vj7sOi1Zd0RL6CnHQbk
Message-ID: <CAA+D8AMRdCu0h=ctdwYdavGquSe5+XGXyHY3JPSmznhAsX1S=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP audio board
 (version 2)
To: Fabio Estevam <festevam@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, daniel.baluta@nxp.com, 
	dario.binacchi@amarulasolutions.com, alexander.stein@ew.tq-group.com, 
	Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, y.moog@phytec.de, 
	josua@solid-run.com, francesco.dolcini@toradex.com, primoz.fiser@norik.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_222642_652634_B45A88C1 
X-CRM114-Status: GOOD (  10.51  )
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

On Tue, Feb 24, 2026 at 6:27=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> On Tue, Feb 24, 2026 at 6:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
>
> > +&ecspi2 {
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <0>;
> > +       cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>;
> > +       pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> > +       pinctrl-names =3D "default";
> > +       status =3D "okay";
> > +
> > +       spidev1: spi@0 {
> > +               compatible =3D "rohm,dh2228fv";
>
> I bet you don't have such a device populated on this board.

Yes, you are right,  it is used internally for test purposes.
I will remove it.

Best regards
Shengjiu Wang

>

