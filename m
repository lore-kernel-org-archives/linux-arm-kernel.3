Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58181D41D51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Mdlml7mvRhIQJi3P6mBQ2xYrATvlG8Nv7RbYSprPig=; b=dV+XQBSUkUJ08ZTRztQv3ayeC2
	UtwtVBM7jRyxPuJJI6yZaD0fyIoqv+BVBibxn3LFDapGpzHZvU91tX+fubfgGdsoInc2Pvc9NvBWz
	VHW2aQ0yoHUg0m+n5wHgrfgiXpQdoqbTtml7OPrLDuEtKd5Bxve+S0wbm+tBqdwvgyXU9B3D/EaNE
	EkYt5wSmyxHY4vieVfrfYJpWnSkSGDCc5n9mjkaC5aUyRTnLlb39yu+HKz4S1S1Z+5okpi5YbUY6Z
	p6x/RMauuJHAdU4Fdl2ZcOcsXoiSL0VkoTwY6kl5vNu4FFDWffUqP1yX3BF4bMKVJkSeDccDVxmNJ
	/YOuQ3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr5G-00000003bkz-3wYU;
	Tue, 12 Nov 2024 13:37:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqwD-00000003Yub-3ZFS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:28:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so50119665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 05:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731418087; x=1732022887; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Mdlml7mvRhIQJi3P6mBQ2xYrATvlG8Nv7RbYSprPig=;
        b=g9lS0rwYD+F4+hqYVBHq6PJSax+PSSQCD0SL1VF+dZVAr2g3v9VB3vv3y+0077lQhQ
         R9ghl4G2qLhV97Aqi5x65a5kjyohyD5PQn7hASMkAJUjEX/Ozxyi1FWqQe7DiBVZ70mK
         dap8A0oNEYBDXsSZnPb8dsSUTKMIQAHdJayUGkig+zJ0soU3ltfUm2SwmJYpgBg0ULTz
         mh9MZxEah7CbjKe/LkJ6rV7K00m1JoJI07drQ5x18Xaz0xAzxLYITFFI2ni2Zxeqs2Pq
         Q+CCAQ12DQuE+vnwgYP5bsi501oPQ6k/ZJDUGWOrAsMJuT91phsXG+BTn8idNqtNn6Vu
         FpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418087; x=1732022887;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Mdlml7mvRhIQJi3P6mBQ2xYrATvlG8Nv7RbYSprPig=;
        b=Uz70XtXVJoAyPQm/Beurt2R0GggfyCNy7jko7GozcpKEU6L4maqQz2pYEwWn/vXQOt
         fnYTdxji8Gx/9PlH6FUL8hktN5Q8R/174Cmy2QMuGPgGgthZeHbpFvli7LicCBwKaQ71
         Z9lN3jdrYXWn+SiLTh+mulMVYdJ7MHSalsoAQuDCwkgUFPFbcGpAUKnEfY3NAfPPxo9r
         khnYw5QI59fDFF0Zdk9V3XpNXTXA8p4agVSTXfPrNbQRtj6naBfzaCztGn2Z96xWbTNC
         3hpiGRxaW+4xgS9nUvYHI+ckn6SKJuKjGTvNXFX6C02gKCdbRnbESPmjug/IiubnxRyT
         2V2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjqkbrsgfr/eyLI/gJcBBtWG7XeZJKLpQnHH2DXNZ5kXignQPyREYGYzIxeX2TDiUA12hcpxJBXnDIdDjkZK/l@lists.infradead.org
X-Gm-Message-State: AOJu0YweH+LvmC/IXfr2tIB0zU55pbxxbzx79mGXnWWmNfAbqcz7obtO
	zlGncIeI1WbDTYX8xj6xoqac31zwcRT0rlk5Pt/iys3OVDkekJIx
X-Google-Smtp-Source: AGHT+IHuvmoh+csNe9X8YH1ZqOMhN/s/he+IW0zhFR4Gzg9kg6wzwqnVueAlLrzOkJEZhu46mUzUQA==
X-Received: by 2002:a05:600c:4141:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-432cc533103mr25180105e9.24.1731418087081;
        Tue, 12 Nov 2024 05:28:07 -0800 (PST)
Received: from ?IPv6:2001:a61:34c9:ea01:14b4:7ed9:5135:9381? ([2001:a61:34c9:ea01:14b4:7ed9:5135:9381])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed987d95sm15591027f8f.44.2024.11.12.05.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:28:06 -0800 (PST)
Message-ID: <2a4e69f3ac4fb6cb131735d3cb598223b71bc90b.camel@gmail.com>
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, Aren <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <trabarni@gmail.com>, Ondrej Jirman
 <megi@xff.cz>, linux-iio@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
 phone-devel@vger.kernel.org
Date: Tue, 12 Nov 2024 14:28:05 +0100
In-Reply-To: <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
References: <20241102195037.3013934-3-aren@peacevolution.org>
	 <20241102195037.3013934-11-aren@peacevolution.org>
	 <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
	 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
	 <ZzEPACoblmcQD9yu@surfacebook.localdomain>
	 <xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
	 <ZzHSE9Nrf4YySJrq@smile.fi.intel.com>
	 <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_052809_915260_FFEE7742 
X-CRM114-Status: GOOD (  29.17  )
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

On Tue, 2024-11-12 at 11:15 +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Andy, hello Aren,
>=20
> On Mon, Nov 11, 2024 at 11:44:51AM +0200, Andy Shevchenko wrote:
> > On Sun, Nov 10, 2024 at 04:34:30PM -0500, Aren wrote:
> > > On Sun, Nov 10, 2024 at 09:52:32PM +0200, Andy Shevchenko wrote:
> > > > Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
> >=20
> > You can do it differently
> >=20
> > #define
> > STK3310_REGFIELD(name)							\
> > do
> > {										\
> > 	data->reg_##name
> > =3D							\
> > 		devm_regmap_field_alloc(dev, regmap,
> > stk3310_reg_field_##name);	\
> > 	if (IS_ERR(data-
> > >reg_##name))						\
> > 		return dev_err_probe(dev, PTR_ERR(data-
> > >reg_##name),		\
> > 				=C2=A0=C2=A0=C2=A0=C2=A0 "reg field alloc
> > failed.\n");		\
> > } while (0)
> >=20
> > > #define STK3310_REGFIELD(name)
> > > ({						\
> > > 	data->reg_##name =3D devm_regmap_field_alloc(dev,
> > > regmap,			\
> > > 						=C2=A0=C2=A0
> > > stk3310_reg_field_##name);=C2=A0=C2=A0 \
> > > 	if (IS_ERR(data-
> > > >reg_##name))						\
> > > 		return dev_err_probe(dev, PTR_ERR(data-
> > > >reg_##name),		\
> > > 				=C2=A0=C2=A0=C2=A0=C2=A0 "reg field alloc
> > > failed\n");		\
> > > })
> >=20
> > I am against unneeded use of GNU extensions.
> >=20
> > > > > replacing "do { } while (0)" with "({ })" and deindenting could m=
ake
> > > > > enough room to clean this up the formatting of this macro though.
> > > >=20
> > > > do {} while (0) is C standard, ({}) is not.
> > >=20
> > > ({ }) is used throughout the kernel, and is documented as such[1]. I
> > > don't see a reason to avoid it, if it helps readability.
> >=20
> > I don't see how it makes things better here, and not everybody is famil=
iar with
> > the concept even if it's used in the kernel here and there. Also if a t=
ool is
> > being used in one case it doesn't mean it's suitable for another.
>=20
> Just to throw in my subjective view here: I don't expect anyone with
> some base level knowledge of C will have doubts about the semantics of
> ({ ... }) and compared to that I find do { ... } while (0) less optimal,
> because it's more verbose and when spotting the "do {" part, the
> semantic only gets clear when you also see the "while (0)". Having said
> that I also dislike the "do" starting on column 0, IMHO the RHS of the
> #define should be intended.
>=20
> So if you ask me, this is not an unneeded use of an extension. The
> extension is used to improve readabilty and I blame the C standard to
> not support this syntax.
>=20
> While I'm in critics mode: I consider hiding a return in a macro bad
> style.
>=20

Not commenting on the debate between using the extension or not but I total=
ly agree
with Uwe about hiding the return in the macro.

- Nuno S=C3=A1
>=20


