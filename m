Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D1ECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 12:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=; b=jGqN0X4tAOpIV12x1sxmPOg6wX
	dl5P00NzquKH7h+rOpau9Ue0HdWo/aJzjUPsfu+jnxANSxh/Y2Ltr9tiKi99G9Tqz8LpKfkll05Xj
	6zivI5VuK4tmrq2PFDiv0z+PhZSqEgD8e3XGBcpmTlxvfLwFJFg2jdmGn9/ClTY0wZ4wTBQEvZ0f6
	3xvjV6ThGPPXnD5O6JtdnQjplbeFkPa0YyGhZeuQ18zf6W6nA7zX8h5/gxQMOr+TF7FXwF4ICAolO
	IOdPjQeCqN6o+2qeOx7WuCF2oJItGDlwj/FOXK/5pX3iNJYiMgBvAFINwbcsyfMqHmhsDEu+kAgAK
	7p7xnIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm9d-0000000Gezr-0OLu;
	Tue, 12 May 2026 12:24:05 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm9a-0000000GezJ-30Rp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 12:24:03 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3922b35e69cso46365921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 05:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778588640; cv=none;
        d=google.com; s=arc-20240605;
        b=bHzlcC1iaRIWeu9GnhH4SaZ4MKZVqNlngUMoTW85hjQl/ZNYV33wLqHbPpsOiHPlH8
         1Ib2WcLg1pWwgBVkldAVte1s0crEp0le0NCkVoWx8kz6M2N9a+aiWkW/KRx7M9CrqTUU
         iIOrtpJbDXnam23i8tQ9tqoZxzZXk9/z2No+avjlw01vP3xnd2odFFeMYMK06CajCqTR
         62xrA8kpU2djA8Ze7mqrfr799dGH0C5qY8xsS6RR000LRLkNNVsOPyC7zF5IIPH6IyEo
         flsBhaXTgQnRrOYr27bABP0DnpbsTB9QEeA0zvfMgQrGIUE4lJEx0yzqzJoj5TPi+xJl
         ckBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=;
        fh=aigGiNdFBLP3UBm8bGQyOdqzBawgRkQdgDyeaDIVNJs=;
        b=hW9CjDT9pYRIYgAE47hQYcnzrgsCgfHZqoPH1YSim+PHHPlUjK6AAkh2oJQZhi/LpT
         eJmgPvYe37nSGk+dT8BQurzZMJMDehtWn6VWl6Ca0cH9gWxYx2xbPWtUmAg6efwtsC9u
         VmDiBvouKjlSfNzb90D8D0f5+MKbT0DVSMNIx4xDKcoxTyI8gBQQm6zHLr7YIvFFALpt
         I/mdwiheOzurgIbWixopYVFeDx9s1mvvX4CrBmxopjA+GPvz9JfTWEvVC86zFVPPRJpn
         1loa7YsOqdnEPUmlxKzgGGO8FtgJIbsFhaRZT7Qyl8A2ncSb1jJ6nOfDwItK3VvOT+2n
         Khyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778588640; x=1779193440; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=;
        b=FOAaJ4ikUTYNgPdd8uCRqdX3NiZc1v1trSj4B0PhMtmD4EihLHTKAmi8cCDTT5Dwiw
         SAjOqOW6qQDiBdGiOuD/JLcB/CJucw/DweFafaJ978EArXx/VbOzdS2mKu3WBgiUIj1Y
         QyFZMM3ug9b+CPH17hpaXuSdaD/FVHnT00J804f+u98wb1eG9IcvrRjH3KxCRAAFEUMO
         mxXVuutLbRGJRaDGRPSs7nGy707oV8MOm+lEkIn8Yit32mgGjaT7JvezTOh1+LM4Ltbg
         OV+xFmsQBUd3ZnyNJ0pfJZe7AYp+T+LBqIMw4ESx5Ul+VMuGtzLrv0AD6e+b3kc/rkxB
         8CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588640; x=1779193440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=;
        b=q+h1krENdA0DV+C1FPD1ZSBm5DBezqBKB2o0GiTxIbB6kyyYmn79RBycDtvfgP7nlR
         LKhAC4Q9ng/U2+cfF2KD1kkWk1CwIMLmFJlaFX6ydj2z8k5ViTuK1oWwl9s8CC3z/X6L
         8aTHr4ub2DV+zBYhUcKxY28z8pB46cS54piol6xd0cPOiHOUCPSZ1fwgHhzyxQWqN+ge
         8d9ML1NuWToMo7IEIhFyXrUgDWOgm++CF8Wb2YTqr2cYor1hf6CvM0Op2+28fkeA2jE7
         p8zrvwKM+h5s27MZ4Xkp2hdWYUaw8iiN31eD6IZPbEWNBLEHWd3Jj3WqtNgnJJ2F8LXm
         iChw==
X-Forwarded-Encrypted: i=1; AFNElJ/qBSM+8S6Rml0pud/k4CGYWunasDIBPIPneUkdDh9deUSSkeDmuuYGo+xgDTWs3/f1mQSgyFqrrcrOdYwaJ7nH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5UJ+LELf9iZ8irEoeTDQYqhEJKxDht1Mv1BKkeVa8sLMZMdSo
	aEtyH3e7RDW/2xPQzH604hTbLZp+liZyMphwEzApeP/BkjsiwucnsPczOj4m3EAoV7VwaRSt9TS
	FvT0a7fs6eEsQIdc62I0j/ghqWpg826E=
X-Gm-Gg: Acq92OGHW1CgfGmOXafGXxjcjf3hz+drYORlNEH53wxUi1Gr4cowpcxlJ7NYLaI1JRP
	yN9zF+WUe5t8tbD2wJ5jXa1Ksp7th4Ac4hfbIfJxzEJcuiIdEafRJnixWTUX9OtLMPa9y2TJr/U
	ya7BfMGaUGqXGqy4hamW9YfNEjCxfmcpGLqHPeM1u0WajaygItjJrPa4WFALIMm7Sq8QRU0zFVV
	6dfL8tirI/rNGiRi7vuWREEyBoWR7ri4akTqiRjqRA5G8ti85zFvfNhTy8QUzXGrEPbw9VtEfev
	5uccORbAK2yTVEV7IchzMtwylMtdvowFsh+da7GGBj94TFsmQYfp2Vlul2o5AwGq1vcfw1jd
X-Received: by 2002:a05:651c:35c6:b0:393:903c:225b with SMTP id
 38308e7fff4ca-3943cc32a2emr8953951fa.31.1778588640195; Tue, 12 May 2026
 05:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com> <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
In-Reply-To: <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 May 2026 09:23:48 -0300
X-Gm-Features: AVHnY4Igm0-o-ifd6S-hgKzaiMJz5oaJeDrrGsoCgjz255blF80xw9vHPNmBKaA
Message-ID: <CAOMZO5Dm8FgzOfyp=6ZuDc=528FiqCPVYF07PjMGVP0Paye6vg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
To: Andrew Lunn <andrew@lunn.ch>, Gary Bisson <bisson.gary@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_052402_778075_1818AB07 
X-CRM114-Status: GOOD (  15.62  )
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

Adding Gary.

On Mon, May 11, 2026 at 7:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> > According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY th=
at
> > is connected to the station management entity via the mechanical interf=
ace
> > defined in 22.6 shall always respond to transactions addressed to PHY
> > Address zero <00000>.
>
> Did you read 22.6? I've not seen a mechanical interface as defined in
> 22.6 for at least 20 years, maybe 30 years.
>
> That cause does not apply in this context.
>
> > -             ethphy: ethernet-phy {
> > +             ethphy: ethernet-phy@0 {
> >                       compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
>
> This could very well break this board. Without a reg value, the core
> will find the first PHY on the bus, at whatever address it is at. If
> you hard code 0, the PHY must be at 0, otherwise it will not be found.

On this board, U-Boot checks for the Ethernet PHY at addresses 4, 5, 6, and=
 7:

https://github.com/u-boot/u-boot/blob/master/board/boundary/nitrogen6x/nitr=
ogen6x.c#L287-L296

In this case, shouldn't U-Boot fix up the Ethernet PHY address accordingly?

Something like mx6cuboxi does:

https://github.com/u-boot/u-boot/blob/master/board/solidrun/mx6cuboxi/mx6cu=
boxi.c#L414-L446

