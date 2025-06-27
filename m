Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF7AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMnGvwviEVFlUvuSc5IrOYIGoVikK7rLR8ZR2R2Vb74=; b=T7MHW0bF8KK7UWOyFMizhGWKyx
	zE5sGcsJuOrc9DgJ5jeYqQS4XXvZ0Pt8hyyXglxm0L/BpJ0ptAKaoaivtuUg5QBc9yB5D653YZTpb
	7m0GQBaZawU92K42UxWQwYQ4Zmu07LHBRdBzQYA6OmHGWU9iSSSzNapKLsjDLbawfFraotxsXXcY6
	NtCUYWCdcI5KbiE0lxEgLymYEeRJlPdEiT71GoPVkUILAZTULZBiXAYBhzEt93VQejEe3bGl4WaK6
	wZp1dzOPEJkmEM6ioCWfKRs51/VgvlqdFC1CN6vd0jel3IFAR0DCP84KZU1lPYrk66FxotgybsJmb
	wm7LLPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUxEi-0000000DEQk-40H6;
	Fri, 27 Jun 2025 00:46:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwZs-0000000D9Pj-2m0J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 00:04:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-23636167afeso18126075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 17:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750982664; x=1751587464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMnGvwviEVFlUvuSc5IrOYIGoVikK7rLR8ZR2R2Vb74=;
        b=IA/ZHDhuwBukSFmWk7pR8Pfdz4AosE54inDI1veynR6VDa5ZmWpv3NSs+JUTUe3psq
         Aame9BQiUI2IOST+Gznw+NgL6wzXp9/ZXJynT533voq3Io3bLdnPwq0D9Qer/yhLB5F8
         NtSBVw4y0WlnK0p5yOIYcmS3+wgfyo8jvwYRU2FmFz3aOCvT3tqo3+bRwXXwNB464sSW
         cZomOTZ0ulsRVnboSupuNHHL9ENxrGGrZ6XjKVwpIHPmgmdCT6SPZnf3PGeXKBRQPg2m
         +It8nrrUbLgIhTz0eOZFL5kPvrld1HCmZoFnz9fg7q+dsp73O3x9BTEaMpSLone3+LDo
         PorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750982664; x=1751587464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMnGvwviEVFlUvuSc5IrOYIGoVikK7rLR8ZR2R2Vb74=;
        b=lqe0l/YrXuTzBHVONLMNpfTzleJrdn78hZsclYHxIyzY2wEpUMyvfER/FzMDcdzJxB
         0+OFOWus/fAQy07KmELNWka0s+WQxj/n3Obx7C2qlsRocqmpoFlTtQ6KbszdDyMBT/xf
         0AjArJSJBRR/w+ywtQKON5j5x4XdFGDBGjD9wygtWsnmr3fQa1EJ8uR8WQIZNkzE1enU
         eSxLGCu8D2reHAH1+uMuppulJpqTyXM//KW/4v3FmLW33m9kT7D8dOLgJVk97vpgVYEB
         DWnEyXgnR0+NiquBNVvvF39h5cOTyI0n+auEXQs4FZ0rCiIhm3G8yHmVY8vAWB1c4+RL
         yYMA==
X-Forwarded-Encrypted: i=1; AJvYcCXwsvCVir9rbljfXVATrrGp2IDoj/ntE94NXJHAmoXhmIuVr3214fVSL5YW/K4zldpOHTXv1U0qyACftTAMgq3x@lists.infradead.org
X-Gm-Message-State: AOJu0YxWlra8Jyk3sx/X8Pj1B/myM3POIaEkml3ixgmHnuv3xV0IhsY+
	Sj5UXson5NwXJ7+D6EgyPj1LPL6gDIJQ+PeBG2culVMd5Qrzc1p3LYiTlqLB9n3SQqv3FJCcwMY
	xBRYalVsL3sYynYqE0PjL7iHPVMgakVs=
X-Gm-Gg: ASbGncv9XHHS1o0Q+/yotgaxsba2xAzePx0Oxa9+jKL/fZhTH9FMOy8fQ13D/cYUt85
	/wUg5liY/YjRwit1j1HPj3uJ+y1x50dO46c/Ir5vj5NT/JQzoSi/ekgGe4t8pCUYmYwqEC30HlE
	Gw1hV5Bm8tLsgvIYXA7BIs0yExSnQJ7m4UrxZJvSUEYOR9
X-Google-Smtp-Source: AGHT+IFlddWDto7V2+jazoypW+F1vj2BX8bxx8BPpRAZpczzJKylaofzMNivlk1qo7wzFt/Q3vzyNmQWz/UqPI/9Bpo=
X-Received: by 2002:a17:903:f8d:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-23ac2d86971mr13866665ad.3.1750982663585; Thu, 26 Jun 2025
 17:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com> <e49a3fff-8a50-44aa-aa0c-1ba1bf478eb6@ti.com>
In-Reply-To: <e49a3fff-8a50-44aa-aa0c-1ba1bf478eb6@ti.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 26 Jun 2025 19:03:56 -0500
X-Gm-Features: Ac12FXzvGaKZfG4TDGgxvXq8kIRn9_pX2bPdP2HIh9V69ipXrdVK7EmoJJX0lj8
Message-ID: <CAOCHtYgNfnAK43GBTdN675dFSHrbTJfy_2GbRE88E-0keoChrg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
To: Judith Mendez <jm@ti.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, 
	Marc Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_170424_703119_D92A8F5A 
X-CRM114-Status: GOOD (  15.43  )
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

On Thu, Jun 26, 2025 at 6:23=E2=80=AFPM Judith Mendez <jm@ti.com> wrote:
>
> Hi Kory,
>
> On 6/20/25 3:15 AM, Kory Maincent wrote:
> > SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Gr=
een
> > (BBG). It has minor differences from the BBG, such as a different PMIC,
> > a different Ethernet PHY, and a larger eMMC.
>
> Thanks for the patches.
> I was testing against next and noticed a kernel paging request error:
> https://gist.github.com/jmenti/d861528f98035b07259c29e76e5fae8b
>
> Did you see this by chance?
>
> I will double check that I tested correctly and come back, but was just
> curious to see if this is expected.

The tps65219-regulator.c has a bug, make sure with this board you also
have: https://patchew.org/linux/20250620154541.2713036-1-s-ramamoorthy@ti.c=
om/

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

