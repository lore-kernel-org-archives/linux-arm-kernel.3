Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9B1D0C5F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/fMOoodbMzbwIVhNycuTPYQFdigoQOM3R/xwLCJOkg=; b=STmuYkWgbUDGcg2JYt91fMsn7u
	7N5c8oR8v1mH1OSTS4v4yLGkj+87CNn3ZCacgXNDqb4DWd/VkwNzUtQnlGostEUiZu0vEUPRRwXTr
	hwET76DPN8OYjc8gVB8FuvPKoBQ7SEZ0SxF+2cgg/dSwIU0+kHbj/56khMkDBcZ4Bf5LoI/+pt1Jo
	4it4hl4eLjgJOGdXC4Ox67ZafukOEB3r6bTAFn+g371Aznrgg8rAYJwuolg+rDcNJzMtgu0nkO/sh
	EjYRS/wY+F0RZVEjOa3dKiJaEJHBL821TPqa8Gc81PE5ToGTyiXl7LC6goc/0xP7sKQ4PAZx7ykTW
	TxvjpLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Gf4-00000003B9l-3z4R;
	Fri, 25 Oct 2024 09:31:14 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FOu-00000002w53-3Lck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:10:31 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb5111747cso17304231fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 01:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729843826; x=1730448626; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/fMOoodbMzbwIVhNycuTPYQFdigoQOM3R/xwLCJOkg=;
        b=W44qtvErFb62lUoCro3pu0r/lvRvmYxMsmR24lD6Tq49gC35QpEXxxp89XJ9ql/xaj
         a3iM2mWbEFk8KeDkPMulUpOs6qe6D4QgqY/kzXNXxcvF4sXR8gj8MOKEsRHkhPCMNW3g
         VuCM9sQSIjG6meoG6u75lJO4/WiPc3CANARMczfFMQWkO5JRb0kB1z8QGsaPuqVvRAFm
         m/UAvpRkqTZ1eJc3U97vSc4jaQwzpEOZyckTx69weqpqSKTSK651sbk8SWnwQ5YATg6o
         nhEO+eXR8E0tmwoZPmWJBqKUs0W73qsRwUZbuCi8t7Ja93ZrzzyKWb0jP21663J+pEr3
         DavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843826; x=1730448626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/fMOoodbMzbwIVhNycuTPYQFdigoQOM3R/xwLCJOkg=;
        b=GB/UmBj/Q+fbynon2Zsgr3iomj/L3UVnc9pvCxgZwXQamsP7bkE1PR9Y47Ugmh0uxP
         0diIxWcCl984F2NQEu+NwlxFRn+/sxptpwkb4/YCSyhgQR4irjTN4z6oTQglcqPnN+za
         DLY92WTkr2sBNMe3VEmtgoqqMNEYgAakIAsEf8yhYRuyCIvoJxktAe2a8peZJT5frRAP
         2GeEoAUFNuyHUYWYH4xtYmrY03oVzGXuN1v0upIB/LMYBMtenaCXcE5Eeqy11uoZvrU9
         k22V1CSfxvNbiemWwoqY3MDIWp5cot5f2xRCiBoVlYNKvl9GcOuW/c0ZqCIDn8S7U4Ci
         Sokg==
X-Forwarded-Encrypted: i=1; AJvYcCU4JCknEgNEK6whtLec+rkEOXdS9Th586aZvlbBE1IskHAV/miOhX8IIufSdwNMCal96caTKvnPQaAx95LUId+E@lists.infradead.org
X-Gm-Message-State: AOJu0YzisPB88LxmacgbACZRkHfl954s4C8kBG6pdhImNDuYP+uWR0P/
	hLzdzM7VX3lw1ZkrOJ0qGtEdQ0Mdd+/VgFMEMKWSy8BB/UMwLrayYzAxt61Zm5A=
X-Google-Smtp-Source: AGHT+IFbMHt8LG7ynfMpwb1jF4aZ4NwAbHonDNawD4VDZMCWmBcTP0Lt3O+sjbBuFgQju/DrJheDFw==
X-Received: by 2002:a05:651c:198c:b0:2fc:97a8:48f9 with SMTP id 38308e7fff4ca-2fc9d35a491mr51172391fa.19.1729843826415;
        Fri, 25 Oct 2024 01:10:26 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f6e47sm10446295e9.38.2024.10.25.01.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:10:25 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:10:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	"jdelvare@suse.com" <jdelvare@suse.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v1 0/2] Enable WDT reload feature
Message-ID: <6hkiqbgqkpdlr5f27drs7vcee7pb2uahek4zz5pd5ndativk53@42otb625deil>
References: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
 <nm4ckxv6swajr6hnqlkq5uoo6ncjzlg6yfxroftat6dubiefyi@xbhi4dvqacxm>
 <ea1be8af-0948-46b1-a1f4-fe572861cde4@roeck-us.net>
 <OSQPR06MB72529E67E67D0D07E59AF1C08B4F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="irgwyxo4ns45vjjz"
Content-Disposition: inline
In-Reply-To: <OSQPR06MB72529E67E67D0D07E59AF1C08B4F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_011029_063275_7DBACAB7 
X-CRM114-Status: GOOD (  30.54  )
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


--irgwyxo4ns45vjjz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] Enable WDT reload feature
MIME-Version: 1.0

Hello Billy,

On Fri, Oct 25, 2024 at 02:00:39AM +0000, Billy Tsai wrote:
> > On 10/24/24 08:40, Uwe Kleine-K=C3=B6nig wrote:
> > > On Thu, Oct 24, 2024 at 03:15:46PM +0800, Billy Tsai wrote:
> > >> Aspeed PWM controller has the WDT reload feature, which changes the =
duty
> > >> cycle to a preprogrammed value after a WDT/EXTRST#.
> > >>
> > >> Billy Tsai (2):
> > >>    hwmon: (aspeed-g6-pwm-tacho): Extend the #pwm-cells to 4
> > >>    hwmon: (aspeed-g6-pwm-tacho): Support the WDT reload
> > >
> > > Huh, I'm not convinced that extending #pwm-cells for that feature is a
> > > good idea. Unless I'm missing something none of the other supported P=
WM
> > > chips can do that, so I hesitate to change a standard for it. I sugge=
st
> > > to make this a separate property instead.
>
> Using a separate property to enable this feature is a straightforward
> method, but I don=E2=80=99t understand why extending #pwm-cells isn=E2=80=
=99t a good
> idea in my situation. The feature =E2=80=98WDT reload=E2=80=99 can be set=
 for
> individual PWM channels, and the PWM subsystem has the of_xlate
> callback hook, which allows each driver to define its arguments for
> the PWM consumer. I=E2=80=99m unsure if I misunderstood this callback usa=
ge,
> as I couldn=E2=80=99t find examples. If my understanding is correct, this
> method is better for adding our specific feature, rather than using
> child nodes or separate properties to indicate which PWM channel
> should enable this feature with the corresponding duty cycle values. I
> think using separate properties to achieve this feature would be quite
> cumbersome.
> As I know the arguments for this usage are as follows:
> First: PWM channel index
> Second: PWM period in ns
> Third: PWM polarity
> Therefore, I extended our feature to a fourth argument to avoid any confu=
sion regarding usage and added the description in our yaml file.
>=20
> If my thinking is incorrect or doesn=E2=80=99t make sense, please let me =
know.

It might make sense if your bubble only contains that single PWM
hardware. However if you extend the pwm cells semantic for your PWM to
mean "period if the PWM watchdog triggers", i can hardly refuse the next
developer who wants to extend for "period of the secondary output pin of
the PWM" or a step counter or some property that defines how the duty
cycle is modulated over time. And should the next one also use the 4th
u32 for his purpose, or should we consider it reserved now for your
purpose such that the duty_cycle modulation goes into the 7th cell?

Today the bindings are (well nearly) used in the same way for all
hardwares and I want to keep it that way. If your PWM has a special
feature, give it a speaking name that the occasional dts reader has a
chance to understand without reading HW docs or dt bindings.

Best regards
Uwe

--irgwyxo4ns45vjjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcbUm0ACgkQj4D7WH0S
/k669AgAm/vnBOGdRCsvDuzdHkwBbJUkiJHDGNT3nBEs43lY8F0I4G3bDEdGMfgj
Z1EBM6cL0h4BPVxR4vaUd/R8xTuRMkgU5EZy5ic0U+j3KozA6bnYqXuBfUy1VCjL
emUvBEdX7dN2TS2lWnNh/yRpy2IDNYkOEU2ffBGjX1s9xQtVHhtY2yUt3/t7cJwG
HBaMhXhaZD2eUNuhuT5zxW8GA8yiF048vzqIfbBnh7bCqfY7i9XcLQKKcYpOdZ8E
BJ3DF5SRcAv56F0PfkA25qr15QRvzUOt64dNKSVL38Cn7LH4joP2/UtdvjqWlCQm
ytZRxFf+CRo6WHEyCrs0X3asdsChAQ==
=4H4I
-----END PGP SIGNATURE-----

--irgwyxo4ns45vjjz--

