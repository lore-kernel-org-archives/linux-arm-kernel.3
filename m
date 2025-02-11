Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92F8C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0gUrFkOMyKNFnFh3bFOpTeSy2QBMxAkVbnFWdeqIiU=; b=lqjpuODHYWXa1eyaTFgjfTUk5p
	/7Ewl/W9/gkKfRaCw/QYl9N4EuTtpuMdlJmwHmqoWpwHBsRDzWjaf2r0WsgK2Ka6BlBFr0MroMFlk
	MXdnp8rqQlMbBb2aq0ho0Lc3VxqoM6O4Dn1bhkqoWmFJPMt24c57fH3myk6KMWbDm3tsGbIP5IMIz
	2bqSppYkOOAUEhrehnT5UeLzGiaP74UtQtAWMLlFNH6RERM1Vd7WB2lriHk4xtZZ4xCNyKA1UTPZs
	ac4dGl0l/qv7+BLi93JACKy/h9BQmUkeO9eNrfkxOKJFRq1uShJ4NXjlLxen+U2deb+/sJ29VXFW7
	xnBzvaZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnSm-00000003LVI-15Vg;
	Tue, 11 Feb 2025 10:25:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmLR-000000038Ec-2isg;
	Tue, 11 Feb 2025 09:14:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2732313f8f.3;
        Tue, 11 Feb 2025 01:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739265256; x=1739870056; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e0gUrFkOMyKNFnFh3bFOpTeSy2QBMxAkVbnFWdeqIiU=;
        b=BO3xvbljcmVws9a5PGgVKmKsgeyfunvutKM/hg9pJ9UYNlPzYqP6Z/8qmmhRWS3Unf
         +HEvW9H6nFjibi+YhVTErqvn2jMsd89WmLSgeX/2TcwQLVQt0jxS/2kZvhu/wlVmiwcp
         Rwy1ltYzGta5iWYT/XjjGhhEIMSbaYYGrQntX5o0eF5sJGeDC5M4Jx+W61ZsJybaNUR8
         8ID2FzTY2J3S48FJllo0SyvBEK6Y3OyLoEvzje6tHYIdAu5FXoC2dAUlFnxOP0eMTAsZ
         87ArmYhcAhbLKBp9fmLJraxtVyzt8qDSKtpgWuTYeMCu3y/h1YsklhTjZgwSCF/U3A/q
         E14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265256; x=1739870056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e0gUrFkOMyKNFnFh3bFOpTeSy2QBMxAkVbnFWdeqIiU=;
        b=gABgo6pW6DuwyFHPPd33D6KDDoY8nuC8Szoj6sLecSJCkcdmB9RVadRoLMnyomK5Pu
         Pw2Buge2JwiVubP4auF/Xc+FiJ6XFZLfQ7y0wsJ09X/+t4GEvOeIjEk3WJmwbhcpsCci
         zMzxKBmJ+PEYsk2YEHCt/fFu6CnB6Zr9bjvi+KZRSoCUcPrMiHUSsdK3TJtfnpM7ah/6
         lShqQdpekka3ECDhy2XyZ4VqI6ErtgTJLXhJn6UBQH68LtpHIILMewlX41s46EPXhGu/
         jG+0xTQuZNz97mGIrO22hnuQIUvHVVtj6tr1m7f4opM4f0zxnUOkWIJkWkrZUmnxeu9T
         6DQg==
X-Forwarded-Encrypted: i=1; AJvYcCUqM7RWalURlCg/navqoaWZCFewS3QND4XbNl/AiG+sMdy3Mee7r+RfXqVJ9DOQNpGBLiG6DfW3L7RWvlY=@lists.infradead.org, AJvYcCWK09a9XL7BL4FttCLwCYqGKAkYxtsqmhyjT/FKQDc9m+aRfb//cReFajy97lnr0GS/iqEeCoD/7Z2IqrjPi0Zd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmi9JqDnh529RCdOBHVctPY1TfoA6ROoPW7jUeAu3ci+6jbMaS
	zw/1dbqO28VqJ92ihKs7hb/XHvbUMefvoYIxvHGXnIkn4nd/67QF
X-Gm-Gg: ASbGnctj36hpNdNY8YJLZnIXCybsw3Otrg6ARnTcJumXjstY0ElM65i5n7qxtjAP+TL
	gmQaDl/kvi1rw9GnnPde0kg/4JW0GWe9lLcyICA5J6E7HwnfLECrBrZOOdOAFAOubUBF7nMF8am
	V94H1i/jJi5FzPv5lqlFEVKzVfnUCpf/7GB9yp09VjmAxSoXdh22kUnSjdMxeg8rztFk/G7Hi0U
	Xy858SLSf8L1SmN6Iw+JqYN1X0I/v3FC9YYLxuto9e7BAfN1EnCkQnIrddCCAT051vbGksj/k90
	ex/LJ/V462cj6n7mnJoUxe9bxwSntxQU
X-Google-Smtp-Source: AGHT+IGkTdyt5H6COEXxIblCp8Mkz8zw3aq7BTC3oTMMt/aizs2mFlO0xMqbkPV5ncYfNxXdId9zEA==
X-Received: by 2002:a05:6000:1ac9:b0:38d:da79:c27 with SMTP id ffacd0b85a97d-38dda790d9fmr7107010f8f.2.1739265255326;
        Tue, 11 Feb 2025 01:14:15 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd1af07sm14477397f8f.15.2025.02.11.01.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:14:14 -0800 (PST)
Message-ID: <bfe6a1cecdbeb6606cc69e851135033fb42ddd8d.camel@gmail.com>
Subject: Re: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core
 and peripheral parts
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Date: Tue, 11 Feb 2025 10:14:11 +0100
In-Reply-To: <3f548621-6f66-41ee-a23f-ae4a8345061a@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
	 <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
	 <7fa3501bd59697e65ab1387e25cb815180c3378c.camel@gmail.com>
	 <3f548621-6f66-41ee-a23f-ae4a8345061a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_011417_716763_0B1FA0E9 
X-CRM114-Status: GOOD (  15.58  )
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

Hi Krzysztof!

On Tue, 2025-02-11 at 09:08 +0100, Krzysztof Kozlowski wrote:
> > > > +/ {
> > > > +	osc: oscillator {
> > > > +		compatible =3D "fixed-clock";
> > >=20
> > > I really doubt that external oscillator is a peripheral. This is eith=
er
> > > part of board or the SoC.
> >=20
> > This is actually a problem of the original cv18xx.dtsi [1]. Do you thin=
k
> > I need to fix it as part of my series? This would touch all the pure
> > RiscV boards (using CV18xx SoCs, not SG200x SoCs), which I could avoid
> > otherwise.
>=20
> You are moving the node out of cv18xx.dtsi, so you can move it to final
> place for example. But I do not insist, because I also do not know the
> final (truly correct) place - don't know the hardware here.

Fortunately, problem disappeared by itself in v2 [1], now I don't touch it =
any longer
and only move CPU and int controller into corresponding SoCs, so the oscill=
ator
falls into "could be coded as a fixed-clock in the SoC DTSI" cathegory of t=
he
coding style.

Link: https://lore.kernel.org/soc/20250210220951.1248533-2-alexander.sverdl=
in@gmail.com/

--=20
Alexander Sverdlin.


