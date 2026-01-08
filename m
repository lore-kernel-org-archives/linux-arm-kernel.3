Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008A7D185CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVxapQmd61w0lGQX8mp2HL79WDJS07jG7jMdrPDktlc=; b=1wK+xtWyOLCRI49KutnsMDSCjo
	Z3+WGkrJ5GHXWeDdCXMTglW0J2+HRvsR2BWVZi2bTNgcG2gMCOpd5+k9cwr0N9Uog9FjsUF9ZXuzQ
	EAMKpMQuRH5s1snl2FlNitUyLFMpGxQN6NkuJzQdpM+IrA727h02JD/EZ2FaidsWHlRnf1MlOIrJn
	8c6o/cZkpOtR+hnpoTxWtS/BJWPxM40nN8vYQ9Zl5UBfQn0sI9L2B8+ADMr0thTd9K9JpKpsJpmCf
	mjio+uIb8u+ZXUqflZGs1+6KM+sMJBkpWoEfqt5aMgTyQXlwkNxVdBA7ZPK3hmqBqtcEiW/nGYMC+
	tNj1Exhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnz6-0000000GoV1-0Rql;
	Thu, 08 Jan 2026 11:15:20 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnz3-0000000GoTt-2ybg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 11:15:18 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so4313525a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 03:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767870915; x=1768475715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVxapQmd61w0lGQX8mp2HL79WDJS07jG7jMdrPDktlc=;
        b=Auztp6JSIjUdFd/pkS75dH5fnvL4K7KnDFG0LnCH0Kt5YKXLwzQ990WIcaF0X73FI3
         ytr5UzEF4nH3ukMzeoKuwj84oUk29Tlt+lxqZqHWduZRCQksPoMhaowa4NtZGBAmflnC
         rMG62jHbLk9+66whFMfqdSTrswEAviKAtbp4SuxufUW4ldTLAyUNDJvfCa/IVMIFoyy9
         3+Zy9KVdBuQrBnM/Ug2c88ZDs+N/3fSr2r+BDltiSw1qcW1o0Nrt24lP8PcEYHyfXr4R
         lD5jKjjIOFWsbDDxpYhRZ2wzuxnQ6Jm5GtMggd4GxOJ4lxIRzY2eh6j6vY65QUgMu5rY
         J6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870915; x=1768475715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVxapQmd61w0lGQX8mp2HL79WDJS07jG7jMdrPDktlc=;
        b=I2LLp7waI7wgrZRHTJYcxQ789Z1NmrUkbX1sbQ2gav9MPXrQBEHx7qRj72mHy4ZJzm
         duWv4SW9gQ+gMRqor+ufbey1+5epN05wwHGubQBx1+XmLCQr6LNC5knlCLi1ufxNHhZT
         K3f8qiyPDBFUPNjE8FMs4mbufmWJp61yNZti3vgrunh1n5wq9IG/YuMowLXMgMn10lgu
         sLyi4Ux3/ye5bP4DbHVo4TqjG9iXJFsGNbx0w8zqsyLHccEDQ//VslKBMarvtX/Ng1v6
         5mTlZYacNBD5gVRPIa/R3/C7+pA6MbdKoLBCuXW03jHHL956nXo7oldw0cVft3smV71i
         VJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVc6Nhys/LxeWWGkvydHvgfQPiFFwu4cjCtboGQPZidYV06/1fb37u/K6XLzCUCcpRo2thJVPL7vmKKFoqbOW/i@lists.infradead.org
X-Gm-Message-State: AOJu0YzKO1HxNwR44VndBCB+FO5Od0ZJg4EEmDK/tBQI/Jubx5TJFPbk
	DwQqRxrfStCBJ8wgZrmXr+4LkOc3RSHVp/WwE1bi4rsn5Gv1ays5nIhVKgOqXj/peZRH1m/r9pp
	dSdHRMDIKg5E8TySo03xxbz+9OA18c6BPPfJFS5WU5w==
X-Gm-Gg: AY/fxX4XwK26hJlpcS24YKm8J5vTEWiSBnT19J//dfuHNB2P4GuUY+H+3p+CMJaIaCy
	FpY8rSMonbStd0XR1rkyrIWOaKetXmX2hQDAY4qlzIpY/76XLwmGDNABfNB46lcpVd5cRNEvULq
	lKgn8EV+YB8crdpUWmDM4iC6/gW+Cw0F99ZBn2qvJzFo7UD/TeNlrT5OyoHW5x/LI4PfajPM/sc
	i660a36lOyrNT+U3Um1Tq4Bjc4eFxS1EwoXmHzG+NJ8y4RMoGHbswyssVR189bTOBd7bt/XFg9b
	ybGBDGsunpO3earJc9Iwoy3vaEEuaUzMV7kiD6Mf
X-Google-Smtp-Source: AGHT+IFHAB9Bnp3BB8dMREjQr967gPMG/GGiiGg+amrvJbHn1bFL3BwFrjMhvQJAqE/QddIsZ2qSyWC9FuhApQ/ThSM=
X-Received: by 2002:a05:6402:5201:b0:641:966d:82ba with SMTP id
 4fb4d7f45d1cf-65097dcc536mr4334588a12.1.1767870914919; Thu, 08 Jan 2026
 03:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
 <CGME20251222103019eucas1p2c60f033dc02adfef360b4fc69bd4021b@eucas1p2.samsung.com>
 <20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org> <8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com>
 <0c09a8c461db5a09e75de4587eef38bffbccf2d2.camel@linaro.org>
In-Reply-To: <0c09a8c461db5a09e75de4587eef38bffbccf2d2.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 Jan 2026 11:15:02 +0000
X-Gm-Features: AQt7F2p5pHWMrlun-9cdijxvvGGa-DUdgXn5dVr-tLvbHmhtbwNPLLjbUDUSQBE
Message-ID: <CADrjBPr6QBbmF9tQP0czRm30d688VtT1g1=tw=bwfYYzKPrPPg@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_031517_773711_93DDB65C 
X-CRM114-Status: GOOD (  15.28  )
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

Hi Andr=C3=A9 & Marek,

On Thu, 8 Jan 2026 at 10:55, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi Marek,
>
> On Thu, 2026-01-08 at 00:59 +0100, Marek Szyprowski wrote:
> > > @@ -334,10 +456,20 @@ void samsung_clk_extended_sleep_init(void __iom=
em *reg_base,
> > >     * samsung_cmu_register_clocks() - Register all clocks provided in=
 CMU object
> > >     * @ctx: Clock provider object
> > >     * @cmu: CMU object with clocks to register
> > > + * @np:  CMU device tree node
> > >     */
> > >    void __init samsung_cmu_register_clocks(struct samsung_clk_provide=
r *ctx,
> > > -                                   const struct samsung_cmu_info *cm=
u)
> > > +                                   const struct samsung_cmu_info *cm=
u,
> > > +                                   struct device_node *np)
> > >    {
> > > +   if (samsung_is_auto_capable(np) && cmu->auto_clock_gate)
> > > +           ctx->auto_clock_gate =3D cmu->auto_clock_gate;
> >
> > Do we need to issue "incorrect res size for automatic clocks" warning
> > for every legacy Exynos based board? The check above should be in
> > reverse order:
> >
> > if (cmu->auto_clock_gates && amsung_is_auto_capable(np))
> >       ctx->auto_clock_gate =3D cmu->auto_clock_gate;
>
> Good suggestion. I have one or two cleanups anyway, I'll add that as well=
.
>
> Thanks for spotting this!

Ok great thanks Andr=C3=A9 and Marek!

Peter

