Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355C3C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDVPiT3y/IEBQaw7UV/tz0okFb5sjvyKj7Prqist9Bk=; b=1obrxNeUNMn409BRDp9o1Ac1uG
	SDDKiHp+LaGYgeDvo4oBRgCHzOygTczAZWUTCWxojT4PjQj3J2oYM/Rvj3r94XiRL+qSkM9/drV8V
	1AEULm6NQZEVyhP6YCMi6EcCSRFpySIQGnvVJCo7xj7f8AfmQNGzkmI8oe3sKucWLNOIqdG1c5IWM
	AkAXWA1gZFM0DFHOq705F2s0Ma6GxCq4o+misVNzhDg0YpX2aH9x5VWDxuBMcbX56IlPOX4OxsO4D
	AsWvsDk+IfJbgICWCgv0US3KnyxkSkVNUzjOIlvFGG5EA2y2qQy+q7lPRmjW42vF6962nYArfsy+B
	QB65OYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiFM-00000001zru-2CSd;
	Mon, 07 Jul 2025 09:34:48 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYha9-00000001tkM-0AUl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:52:14 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2ef8dfb3742so418354fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751878332; x=1752483132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDVPiT3y/IEBQaw7UV/tz0okFb5sjvyKj7Prqist9Bk=;
        b=JiWFg3opmSAyhEkNJZFqIlgTfQaAQ2qMLgw/794rErUZTvqeIxAdSvFKUPbIHZJJRu
         v8f+OC8oxhgco41rqT/Q1UfeKwUGehvmR39UsZMjXIOLLpUcgN+e04K51t3IJQR7uAEJ
         +1CUlH3cAjLlmORngQ1mfTpHIMLvVJow9wTAouqVOYTRKiYnI+fvky0opz8RkK5HdXe6
         UPAROR1/MxpwhmCcoPNN9HzFaPNDzWG5AuhlOGKWeR8yo3RSRB8hm+zbL90Ql/8Xrs0/
         SlPuhsSxsSauTbZzfa/vZMq/5mCNbhSCfgRoiBT+GSoOXlBUv8/D5MCBdWr6xsy4cYDi
         SxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751878332; x=1752483132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDVPiT3y/IEBQaw7UV/tz0okFb5sjvyKj7Prqist9Bk=;
        b=AnQCYPJTRele21YNMqZRsbeT9vYPMGQdAcpZbvOfgUJ/MCxRh97TgZ535I6+P2w4qd
         I8KwH575EKD4lt9s1J3vm5zZIL18GxdXRBc1VO0VYW0ZODb5uKyRmlwtKl0xz0rDQcMR
         R1JYd7B0UAIqvRQXGKhz7BzMZk1hhUlnWTwvCu87fItE4AvhimoJ/8e8FgAbbTYw5irG
         a9ebdwPW0KkO5KKm3eH3lszWqknKW+hGRzQ8EQ9mdmGwHG3lfnwQ2jxtk5aF7tdc+FQP
         5FgsT3UdKl9Q2yU9WZDVrpSYS5v+qMQqla5EVKCA6Jg8JnevLxb+X3IIYg+iSqrQYZWO
         a4/g==
X-Forwarded-Encrypted: i=1; AJvYcCUzIZbv5UcNn2uTB7bYMN8zwYm1mLd/hUNs3h9YGiNPzUjAmi9Fm2xZfbGCJCocbFxZwrVqHrfldejd4jax6jRN@lists.infradead.org
X-Gm-Message-State: AOJu0YzDHwQToaKrEF6WTp2Y/Uwl9/L0ZBGgvzcHF/zbFOPTuK9GiFrA
	UrnTPrDPSA0AvMpW6QuG/YRfnYqeuD5naC6Zev/mk/RMhzmcwSQLSix1DBR/WSo+ZTj1Ghxo2Wv
	ygIq48WSaht220nUKulH0y/+UNHCUzRX2k31c2cWlxA==
X-Gm-Gg: ASbGncveMYHyrZDbuFd0fukZu9OMDBt5vXQ043l0HcEmJ3/RRWK41r4LKMo/0Uu8TvZ
	5mqvTykFggDzLM2gngpVe3Xlo2rGnAxvwv/cLppDl60gMZvCHcqjqc1J7lhB8dTU6CJfJvIyrm3
	JP/dp7nKWVg11vLvMkvm/TXRhvNehM9Pl0hU467yQc5U1v
X-Google-Smtp-Source: AGHT+IEj3geuDFpX++SDMrn/ji9XGPECs4W5y0PIqWxFAyffhSBGzwoeTrtt+GXfjptm1UQik2oIQixEFyIbodoYkeE=
X-Received: by 2002:a05:6870:9687:b0:2d9:45b7:8ffc with SMTP id
 586e51a60fabf-2f7afde4ee8mr5416161fac.3.1751878332040; Mon, 07 Jul 2025
 01:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
 <20250523-b4-gs101_max77759_fg-v4-2-b49904e35a34@uclouvain.be>
 <CADrjBPqOMOyHP=aQ1+fg2X58NWRp-=MJBRZfpbEhQsTzaZ9LHw@mail.gmail.com>
 <bc40326f-db40-4657-84a7-152def2ca9e3@uclouvain.be> <CADrjBPo2=FajKA0t7TTMdH6iK_qbWCSJK-hEqh+UWEuzC7wyGQ@mail.gmail.com>
 <2e26f8f534284b280e9d5e8d4ae556a452e93ff5.camel@linaro.org>
In-Reply-To: <2e26f8f534284b280e9d5e8d4ae556a452e93ff5.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 7 Jul 2025 09:52:00 +0100
X-Gm-Features: Ac12FXypfLDLEdnbrTBCEZv832mBaFKGNgc3VgFrnkzOkozoICaCDgwT3JcKDwQ
Message-ID: <CADrjBPr_UY6LDxTqHAszC1nhq+qdV7OC5M2y+z2C2iwOKzqWYw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] power: supply: add support for max77759 fuel gauge
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Thomas Antoine <t.antoine@uclouvain.be>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_015213_097351_BA1D4056 
X-CRM114-Status: GOOD (  29.08  )
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

Hi Andr=C3=A9

On Mon, 7 Jul 2025 at 09:04, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi,
>
> On Mon, 2025-07-07 at 08:16 +0100, Peter Griffin wrote:
> > Hi Thomas,
> >
> > On Tue, 24 Jun 2025 at 16:45, Thomas Antoine <t.antoine@uclouvain.be> w=
rote:
> >
> > > I am unsure about what to do about this initalization, especially for=
 values
> > > which slightly differ from the devicetree. I think for next version, =
I
> > > will have the same parameters be passed in the devicetree like androi=
d.
> >
> > We don't really pass register values like the downstream driver is
> > doing in the device tree. I think you will likely need to add a
> > max77759-gs101-oriole compatible to the driver and then have the
> > application specific values, and m5 gauge model algorithm as static
> > info in the driver applied from the dedicated compatible. It would
> > also be worth checking whether any more of those register values can
> > be represented by the standard power-supply binding properties that
> > already exist.
>
> I believe these are likely battery specific values, and were obtained dur=
ing
> battery characterization by the vendor (or Maxim). They can change (with =
a
> different battery supplier etc, hence I don't think basing this on a
> max77759-gs101-oriole would be correct here.
>
> As we learned from the Pixel 6a battery updates, the same phone may use
> batteries (e.g. from different suppliers).
>
> Either it needs to know about the specific battery model, or the values
> should be passed from DT in some way.

Some of the fg-params values are characterization values like
QResidual, Rcomp0 and others. I hadn't really considered different
batteries for the same phone model. Given that information I think one
would need to investigate in more detail how downstream chooses what
battery it has and what set of values to use.

Thanks,

Peter

