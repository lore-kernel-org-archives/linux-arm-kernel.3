Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3271D0C5F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBpUL2K11YBUFELLMPn7J24EDYIInyskb6BQJNfarC8=; b=RD6n4J4vJ1mOCI1mdlOQFk7z6+
	1Gr9UeLtv1+aQbWT0OSRkYFCCVPmlyfb1bvM3Pu39Zi+QrCQWAquvSSMtCNmanboit30FbARau1j7
	gTNVH/PmnyBskrdgvUrFEYygmnvsoydhiwf90wAOAbSgQIYkJIRx4uhqvvDPqS8zE/QBg5WdklGzn
	UjvbZ28jX7AL1+oVCXvROX+ZZcGf/6ZxjRwmy/VfEukmoDztaTY0A/6yWa0bbnUqET3gGw+rzYhDR
	vHATlX7+7PmbkxJm5Sl9ZnqXSZL61fDxEJ6sPUBS7oilF/0ijKFNbkm1h+FwTQvo1ujn5R0k1llEf
	496WMung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HSg-00000003Lkh-0nv7;
	Fri, 25 Oct 2024 10:22:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HQ1-00000003LSC-3t7O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:19:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d41894a32so1418991f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729851584; x=1730456384; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rBpUL2K11YBUFELLMPn7J24EDYIInyskb6BQJNfarC8=;
        b=h6Z/ptPyW/vjfthjaIGknFmCTcEs2ukfNN1m+WrUMpabwl0uQxupPxQnm2249gsBDx
         fkzjQOkJkaL91lmRBi1KdiFNrTkPnoEMVtfyeL5lOF4u+mwNo9es3ORc+u71DPDNgutL
         N5g5hnqlV6VVsW16KGq2ij78PmpC64+sPE4qrfmCoU+eApVTL3KuP9hi+XbcKvq3j7lx
         WTjut+PEGLlblsmLnvKmg7lZ00zim8HSl5iRoTpGIHlLBh84lN1ZpSNRAds3hlQV4Qys
         SnisZdMf0PFtVPVA/Ohc8vRHBjy6FRgv2AqxgxYYlQUTumQTzD1PLjGzDLAdA94MLZFq
         Rxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729851584; x=1730456384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBpUL2K11YBUFELLMPn7J24EDYIInyskb6BQJNfarC8=;
        b=C4qiMFdEz0NBfnJI6+Pr6Q4SmPblBrjU//felZO4Zwnklo+wujWLzr0m2rK7RMysvk
         NUsI5/TLYusAg5cwev1JehGhe8Z+z5tZQ+368YSn/aLOhyq2rwjK+1QI7tnWOLN58Qmw
         f3T0g1c9RHyDqcMbjfjbdkw1hsy/dbAQeM0xfRkT9TFevf+nLwvXMseyugghN9YcX3be
         4k41QOSl158JCC5wvMXEa+ivi0Q6W0Y2V6ir60cFzT4JoZ624Zw08kFwDWswucY2m7Hn
         aJ6fkxT/mxHgz1tkZwbaB4Ouj6+3H2fSOjIVCh9eiKKjkKHbeKvUBHI69WX4bHNUeX0d
         wNeg==
X-Forwarded-Encrypted: i=1; AJvYcCXy7m/56hvImTp4gQpi/12MZ1g6fgiZg1tLtZfrFv2z+sVLzURWvcZKhoiASWaqnFmCV/tQe0VhewX+Ix4LmWLv@lists.infradead.org
X-Gm-Message-State: AOJu0YxvEccGq/bQRLIOaihXtqj5Ytfa8V6OqXon0HnL0pFO8snzB5jV
	hPGJKbKYtdRjIsX3S4ThWOnb4uTAydZjcbfFT+LcAaBwK6AraCKN+It4q5wzmKQ=
X-Google-Smtp-Source: AGHT+IEpRucuYPggIRzYn2XOQ7y/jTfvJj1wJmmqoHqungWwIwNJArQ6uCMDVCocpBpGNsacy/BKpg==
X-Received: by 2002:adf:e602:0:b0:37d:43a8:dee0 with SMTP id ffacd0b85a97d-3803ac7d59bmr3967804f8f.17.1729851582645;
        Fri, 25 Oct 2024 03:19:42 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b46bffsm1132208f8f.46.2024.10.25.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:19:42 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:19:40 +0200
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
Message-ID: <ugont5utr7rwjfonm34fmafimree434orgqas4lknmbo6aep2s@ugkkuizosqhj>
References: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
 <nm4ckxv6swajr6hnqlkq5uoo6ncjzlg6yfxroftat6dubiefyi@xbhi4dvqacxm>
 <ea1be8af-0948-46b1-a1f4-fe572861cde4@roeck-us.net>
 <OSQPR06MB72529E67E67D0D07E59AF1C08B4F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <6hkiqbgqkpdlr5f27drs7vcee7pb2uahek4zz5pd5ndativk53@42otb625deil>
 <OSQPR06MB72521C20B39B1469B5C6DCBC8B4F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wivfejt2eayn7ufp"
Content-Disposition: inline
In-Reply-To: <OSQPR06MB72521C20B39B1469B5C6DCBC8B4F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_031945_997150_C006B023 
X-CRM114-Status: GOOD (  49.59  )
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


--wivfejt2eayn7ufp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] Enable WDT reload feature
MIME-Version: 1.0

Hello Billy,

On Fri, Oct 25, 2024 at 09:37:53AM +0000, Billy Tsai wrote:
> > > > On 10/24/24 08:40, Uwe Kleine-K=C3=B6nig wrote:
> > > > > On Thu, Oct 24, 2024 at 03:15:46PM +0800, Billy Tsai wrote:
> > > > >> Aspeed PWM controller has the WDT reload feature, which changes =
the duty
> > > > >> cycle to a preprogrammed value after a WDT/EXTRST#.
> > > > >>
> > > > >> Billy Tsai (2):
> > > > >>    hwmon: (aspeed-g6-pwm-tacho): Extend the #pwm-cells to 4
> > > > >>    hwmon: (aspeed-g6-pwm-tacho): Support the WDT reload
> > > > >
> > > > > Huh, I'm not convinced that extending #pwm-cells for that feature=
 is a
> > > > > good idea. Unless I'm missing something none of the other support=
ed PWM
> > > > > chips can do that, so I hesitate to change a standard for it. I s=
uggest
> > > > > to make this a separate property instead.
> > >
> > > Using a separate property to enable this feature is a straightforward
> > > method, but I don=E2=80=99t understand why extending #pwm-cells isn=
=E2=80=99t a good
> > > idea in my situation. The feature =E2=80=98WDT reload=E2=80=99 can be=
 set for
> > > individual PWM channels, and the PWM subsystem has the of_xlate
> > > callback hook, which allows each driver to define its arguments for
> > > the PWM consumer. I=E2=80=99m unsure if I misunderstood this callback=
 usage,
> > > as I couldn=E2=80=99t find examples. If my understanding is correct, =
this
> > > method is better for adding our specific feature, rather than using
> > > child nodes or separate properties to indicate which PWM channel
> > > should enable this feature with the corresponding duty cycle values. I
> > > think using separate properties to achieve this feature would be quite
> > > cumbersome.
> > > As I know the arguments for this usage are as follows:
> > > First: PWM channel index
> > > Second: PWM period in ns
> > > Third: PWM polarity
> > > Therefore, I extended our feature to a fourth argument to avoid any c=
onfusion regarding usage and added the description in our yaml file.
> > >
> > > If my thinking is incorrect or doesn=E2=80=99t make sense, please let=
 me know.
>=20
> > It might make sense if your bubble only contains that single PWM
> > hardware. However if you extend the pwm cells semantic for your PWM to
> > mean "period if the PWM watchdog triggers", i can hardly refuse the next
> > developer who wants to extend for "period of the secondary output pin of
> > the PWM" or a step counter or some property that defines how the duty
> > cycle is modulated over time. And should the next one also use the 4th
> > u32 for his purpose, or should we consider it reserved now for your
> > purpose such that the duty_cycle modulation goes into the 7th cell?
>=20
> In my view, the order of arguments=E2=80=94such as PWM number, PWM period=
 in ns, and PWM polarity=E2=80=94is just
> a convention for PWM consumers to follow. Even if another driver doesn=E2=
=80=99t adhere strictly to this
> rule, it shouldn=E2=80=99t be considered an error if the YAML file docume=
nts the usage of each argument.

And it's a good idea to follow known conventions. There must be a good
reason to deviate because each deviation adds burden to the developers
making use of that device. And to patch authors, patch reviewers and
maintainers.

So I'd not say, extending pwm cells is an error. But it's an action
where the advantages don't outweight the disadvantages.

> For example, some PWM controllers set #pwm-cells to 1, where the first ar=
gument isn=E2=80=99t necessarily
> the PWM number. In google,cros-ec-pwm.yaml, it=E2=80=99s treated as the P=
WM index, while in marvell,pxa-pwm.yaml,
> it represents the period in ns.

Agreed. That is historic ballast that cannot be changed without breaking
dt compatibility. New drivers are supposed to use #pwm-cells =3D <3> with
the known semantics.

And if I would design the pwm references today, I'd just mandate
#pwm-cells =3D <1>; and don't specify a default period and flags in the
reference which I think don't really belong there.

> If users want to work with these PWM controllers, they should confirm the=
 purpose of each argument from the
> YAML file, rather than assuming the PWM driver follows a conventional arg=
ument order.

Yes they should. However doing surprising stuff cannot be excused by
documenting it and then pointing to that documentation.

> If the YAML file doesn=E2=80=99t specify details, it can be treated as
> described in pwm.yaml, which is fine. However, if there are any
> differences, I think recording them in their own YAML file is
> sufficient (Like google,cros-ec-pwm.yaml and  marvell,pxa-pwm.yaml).
>=20
> > Today the bindings are (well nearly) used in the same way for all
> > hardwares and I want to keep it that way. If your PWM has a special
> > feature, give it a speaking name that the occasional dts reader has a
> > chance to understand without reading HW docs or dt bindings.
>=20
> Using another DTS property to achieve this isn=E2=80=99t as elegant as ut=
ilizing PWM arguments, which will only
> be applied when the PWM consumer uses it. This is another reason I want t=
o extend the PWM cells semantic.

It seems elegance is subjective as I don't agree.

Best regards
Uwe

--wivfejt2eayn7ufp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcbcLoACgkQj4D7WH0S
/k5PIgf8DvAJswdKoKhqa0pXx9qPc8T33mvVsjlO5tR9bQ76xKfxuTHrOUW8DxnG
i4TjzmCH4tvC0QuRVhgodbiB3+t0PEXoRPd1guBYWAgHEVjKH0V04BPKjreFmdbI
DAr2ERc1OmVC53O9vFqJ8CILaWNpz7NwF/GfiCVKPtv569+4TcakSIuARoNWxMCA
dRhG0lRjiYQ5NQC3fOS+DuhFcTdM5gQxP/L71SKA2CktrBHXgS6z8b8bU4muuNT1
13RpkMBrXFmIuU+BRIk09gxG9LdlyE9fUaPE3TiPuo4Lh4E4abz4tmTIBoAPr13Q
+G7QE8xQb8p4ZFg2IAp4kSP0E1KTaQ==
=z2Vk
-----END PGP SIGNATURE-----

--wivfejt2eayn7ufp--

