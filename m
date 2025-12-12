Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA0ED4415B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 10:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piKeicldVFohFnPgSVyUwsQHuUt89125myGk5tf25V8=; b=l6EV+9SjCc+ODmkRPkZIT5v4zr
	BQo+ILxe41wbFft9PmMqXrbXmfce52zTDpEVeOim+oMzMWZdH12npbhh7UEEztC5m5F6iyvC2LoZX
	FuzA5Z2wF2FcQoog9p1GobXuNrFDL/qSdJFBMiaV6yZKpMovn1JZPQFh4Xh383RMetGwNIBQhVg9N
	VbpWia0L9r2Ez96Se6xPEl+lBLdhpwuejjFBCLr4H+tigsSqiJfeyRrGvs0lSKDOaCzEajCWgNmnF
	fgE8Geb2oW8bv3oMzA14i6BP0ZDQCbfKQUdmUIaA5BDIEuJTg3ZCXc2kK6g/MEhP+kjFmS4BRndAq
	NlDx9SxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU05O-00000000Pgp-0cSy;
	Fri, 12 Dec 2025 10:09:18 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU05L-00000000PgD-3M3B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 10:09:16 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b7370698a8eso134894966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 02:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765534153; x=1766138953; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piKeicldVFohFnPgSVyUwsQHuUt89125myGk5tf25V8=;
        b=ERkaNVhB0pMu/bVUR4CEtK7d8L874CeTn/DHCfsODhYMKtYaPZGLLb8j1mZPhVuka2
         nfbv1lI62SeS2gLUoSXamaCUcx09LT3iYy2Ih/BzWwyqoxZ5ECXl13xQS+l3wjPw6h8v
         3dhpf9hn4ij3nThdy/f0TElj//K8hFJuq9iWoi5kJQfQKt8jQygczweavh46k5kh/D/I
         zWKKBqEHj88Fofw0cbcANjfs4sSesYFhDijhZdwAYzle6PtRvAUkSSWuQioc2k5zxT2K
         EpR3K/RlGIFx0/Z3yQmafBDpKqaFz+0E9G062aEZCHTyvReCNauyF75b2XMpgXBAUn0+
         CfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765534153; x=1766138953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=piKeicldVFohFnPgSVyUwsQHuUt89125myGk5tf25V8=;
        b=km/6tkzK+quRqpE0Dtu1aGNOQ1o446OsI2Y6CQfEjSxRGAWicOtzcz9uVphy003g2V
         ekIZOoZE90hFkmZDJlmjNcTsDlirVVPNNcZgl/TQFaNF9gKifeCfRLTR/gvg//pV8rvr
         IeyeYsCJxpc36X5jUQA1PbeetDcSVUN4WrzAEJ1Yo9EVZrECaqh/yssz9vpNhWUAQ1V5
         Ei5IIT0nZXlndlLs/Vh4+G7f43VQIy25YNw2jfPG82yt7c2DwTc428P/npuQGGjFTtCz
         4Zr3nuky2TJQkYc42q4MQsZS0B4eHJJZ3VIZ6SehR3V4Dn124+y8Mg+3aMgdsBoqIVth
         EToQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV4SrZkdmAqm/QpvImjHklUQ34IEaTPAK/t//yVDJm5HYB3bFfU5NAY9wb3oDOBDwCvn2QTH/Op+xQHKAHrVmh@lists.infradead.org
X-Gm-Message-State: AOJu0YwwBCuyTmqXdunQWQ8ZjVWMi3cyXmsQEc+HjF2Dd4bCiGAMsvvI
	HGL4nGMKwPMcF9PmpHdWfoHwlfAOuuQQJSkkXXbY2/9cGcwDvObzJ3VmMrqS6KNo+6R0Hk1UyGh
	Aw3kZdaVgNjecmo9Dthwlyr2fBaTzZE4+K4Y0NGIQeQ==
X-Gm-Gg: AY/fxX7JhpfeJNMxVGzXfDSiKKIVC2jZi4LGSu8O2NTVVVj9pgYo3DeFrSJRmUn4Wj6
	QLqaylDasrNmaM5oS4Rn+beS8mMAKgz4/nMjJM1xP0R3La7Z4Rc7MZv/PCWyoAXjvrj4nBJIa9d
	3rwSPsy32sL7cPx9aN0eX3xv7oIZerH+fOuSU433PDlYUVSEx0z6ij1+Knf7yAz//FgQ/4PM/7x
	gfJ6Tkpx2KZBog01bmulSNrsLqKCqz508m2HwAvc0v6HprDg/j31ei7wpnYKDc76Rv5Suw=
X-Google-Smtp-Source: AGHT+IGu9UDsKSPu1wQCEy9ZSntpZSOo/9V+U0kQrHcNkQAxG5oPTpTaMv6wXo2k7lZ0/X2pNnXrjg4sARyaZrNmc5Q=
X-Received: by 2002:a17:906:f5a9:b0:b76:8077:4eaa with SMTP id
 a640c23a62f3a-b7d23618a6dmr134378366b.6.1765534153256; Fri, 12 Dec 2025
 02:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr> <20251203-duly-leotard-86b83bd840c6@spud>
 <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com> <20251208-absolute-diploma-6575729ab43f@spud>
In-Reply-To: <20251208-absolute-diploma-6575729ab43f@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 12 Dec 2025 11:09:01 +0100
X-Gm-Features: AQt7F2qi9N_ckMGJFgowBcvF34rbB96zRSF2oUqF51CXmoKh0Qd3rJ2sqP-K-eQ
Message-ID: <CA+HBbNHuYCq9oV4ZjWGjwnJM=oz-O85p_tqB+UnTBmivzDoowg@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_020915_860669_AEAD994E 
X-CRM114-Status: GOOD (  21.70  )
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

On Mon, Dec 8, 2025 at 6:10=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Dec 08, 2025 at 11:30:28AM +0100, Robert Marko wrote:
> > On Wed, Dec 3, 2025 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> > > > Microchip LAN969x is a series of multi-port, multi-gigabit switches=
 based
> > > > on ARMv8 Cortex-A53 CPU.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > >  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++=
++++
> > >
> > > This should not be in a unique file, put it in with the other microch=
ip
> > > arm devices please. Also, the wildcard in the compatible is not
> > > permitted, only way it'd make sense is if these are different binning=
s
> > > of the same silicon. If that's the case, you need to explain why,
> > > because compatibles are meant to be soc-specific.
> >
> > Hi Conor,
> > The issue is that there is no unique place for Microchip SoC-s,
> > LAN966x series is in the AT91 bindings
> > while SparX-5 has its own bindings file.
> >
> > What would you suggest in this case?
>
> Ideally, arm/atmel-at91.yaml and arm/microchip,sparx5.yaml would just
> become arm/microchip.yaml. The axi@600000000 thing in the sparx5 file
> looks pointless and can be deleted IMO.

Ok, I merged them all in one generic microchip.yaml binding, but I noticed =
that
arm/atmel-at91.yaml is licensed under GPL-2.0 while arm/microchip,sparx5.ya=
ml
is dual-licensed as its preferred for bindings.

Is that going to be an issue?

Regards,
Robert
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

