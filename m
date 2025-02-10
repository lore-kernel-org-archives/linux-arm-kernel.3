Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0A8C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVl3EUiEdR+2nH8WWZkP4Nhw+7rNyWyQ5wQqq3ShzRs=; b=M4L7jPZKD9CsufN5dV56M1O307
	fxOOrATtCoSp66qq5W790bPBUjRvjN5MVnQBApFbqdCkR7O1DxFoe0vt+gAzm8/VEtriFEfVWdtkD
	6qOrdA+FNZw5Q5SYFgFyKePdc2Bup7oAIC1tsLprtXNxVQGv5+RkfSiGUNeukNVFWF7TKOKsOF3mY
	VpbRKykETHwIITTrafM59jOSHNTcXM2p1RhHVQvOLjXhhgtx76N4QuWhsENetxgI6kbq3H2GR5WOy
	iJq6s7CdKbPaC7KFmz3qKuA9JreODOF+pEIAKgxNXDnPOR0UO6FWTGxMRkTaBPn8sw/6VifyqAkoJ
	rHoqhV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjF-0000000HMs0-0H6k;
	Mon, 10 Feb 2025 12:17:33 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thSGi-0000000HIZN-1ciR;
	Mon, 10 Feb 2025 11:48:05 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab7a6758b7fso311605166b.3;
        Mon, 10 Feb 2025 03:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739188083; x=1739792883; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HVl3EUiEdR+2nH8WWZkP4Nhw+7rNyWyQ5wQqq3ShzRs=;
        b=cHs44EUD+l5ppDbqnUH4huSqUkovCpcNu88Aym2fvI9R3y0iKzF8rkwwd2MrZ5LcAw
         4GfpkwlfkVIvVT4H9X7EOeLA6wRE/JKs+w2+oHLJciIartLi1rsXXikjHzO5w/n5Mp/j
         evHVv5Crw7+KGbNF9GiQfFr2fk/KHJwLEewbMAEJg7a8v9u5YDmXvO7gvyLYudF9k9xh
         rhepPPQuSxakLNQgRdwUMkfs5BUts0korBH7tA7VagIcB9TxnawuL7sZRydioT5PnIFI
         PZ7SSi6x/kyOwL5d1cU9KBc8peO1aY5tuEGNTtX507uib1GmVOKp4AX7wgQZIArfI/j+
         xDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739188083; x=1739792883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HVl3EUiEdR+2nH8WWZkP4Nhw+7rNyWyQ5wQqq3ShzRs=;
        b=I7yWvCh6StAYUSmJYYePxKDrO9av6wsokenoNBezl6CwToDxJnr/36qLiv3xnZT7Kv
         idiR9vT3DBOoxocPQ5AZmeVrqHUxgBgCuyzBKdjVcv+swDDEatxqjlNO4J9j8bRnCTe7
         vNt/G7PDPWQ9jnmy21NrJ8uJnl03d7eURnzeV1KMDbLAU6/hRk2JXbEAgQsu46fRWrFH
         nVJudf5bEQl/Ha7DUEVxCp/b3HR3ky+KVHUPHyUnNgnJt/dr4EvJXQau6E2FRXjYUzuM
         IJWid2nargYcq9733/EnHZXYec+6N0dg7FEjam0cEpOAk/B+2MTf9OkGwM+lMseNNtM7
         ji3w==
X-Forwarded-Encrypted: i=1; AJvYcCULptQVZ+cmt7lsZJBOQc4XOs1V2mGRO9Pimee/YxKmZ2Z0+dAiEbV7FR16vSBqHzstKlxrCMxxCgTSnx36AcDo@lists.infradead.org, AJvYcCWxFRmJm4Wd7cIoOnzFSmgdPPpOnitzpFHj+s2TPQW+gjq113IksPgvWwue5/ahR4l00FQb+NlBXzTi5lQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj7dXTiKfksVmddWe8HzNCQijyrck3PRy2YGdN7oUVPwNgEMYP
	vBUBYIqDaxlYm46ZtpNSCIojgeTMy5hn+vgXROsYFVBOCTXEa6Kf
X-Gm-Gg: ASbGncv3Qh8xijdIlLWXgLPsOQbhQ+i8B9cJAZXwxboVpcswXolbn0DOP11hVO86dOW
	pOtnHTEeGsEme/gNjRppNI5DRuV2ArIo1zoD5zIXNBooMjlyQxOr+IXZ/8575fyfwM8UEeCAqOb
	f4iaU76uTbRGVkOKeufO08ay4z0N4M1qDDvr3uIiYZgbrBmBjSSXhHqscRzV0iDUq003alcIRPG
	TIsj68pkFpFYfI9T90EWGbebZGpXLHpJyjmQ6jI3cpPYuLgnp1Fr+s/bK+lp7brfJ4CwDzm0YYb
	k9JGw0mDls9Hjh+eaND/ZaHYVsF8NPJh
X-Google-Smtp-Source: AGHT+IGY3dILn6ts/Eq3QIZU6ECVgNuSbLxMNRT8V0H+TQxvFHnWdoPp+ST/buUvAjzzmdL3OQMGTA==
X-Received: by 2002:a17:907:9719:b0:aae:8841:2bba with SMTP id a640c23a62f3a-ab789b84353mr1350942666b.22.1739188082366;
        Mon, 10 Feb 2025 03:48:02 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bc28c58csm252975066b.135.2025.02.10.03.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:48:01 -0800 (PST)
Message-ID: <e17ef70f7536bd1bf0b4d0f7258f91cffac76a20.camel@gmail.com>
Subject: Re: [PATCH 08/10] riscv/arm64: dts: cv18xx: Add sysctl and reset
 nodes
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org, Sebastian
 Reichel <sre@kernel.org>,  Arnd Bergmann	 <arnd@arndb.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>
Date: Mon, 10 Feb 2025 12:47:59 +0100
In-Reply-To: <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
	 <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_034804_427447_91EC5EFF 
X-CRM114-Status: GOOD (  17.83  )
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

Thanks for quick feedback Inochi!

On Mon, 2025-02-10 at 13:13 +0800, Inochi Amaoto wrote:
> On Sun, Feb 09, 2025 at 11:06:33PM +0100, Alexander Sverdlin wrote:
> > Add reset controller node and required sysctl nodes.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 16 +++++++++++++=
+++
> > =C2=A0 1 file changed, 16 insertions(+)
> >=20
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv=
/boot/dts/sophgo/cv18xx-periph.dtsi
> > index 53834b0658b2..d793b6db4ed1 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > @@ -309,5 +309,21 @@ dmac: dma-controller@4330000 {
> > =C2=A0=C2=A0			snps,data-width =3D <4>;
> > =C2=A0=C2=A0			status =3D "disabled";
> > =C2=A0=C2=A0		};
> > +
>=20
> > +		rtcsys_ctrl: syscon@5025000 {
> > +			compatible =3D "sophgo,cv1800-rtcsys-ctrl", "syscon";
> > +			reg =3D <0x05025000 0x1000>;
> > +		};
> > +
> > +		rtcsys_core: syscon@5026000 {
> > +			compatible =3D "sophgo,cv1800-rtcsys-core", "syscon";
> > +			reg =3D <0x05026000 0x1000>;
> > +		};
> > +
> > +		soc-reset {
> > +			compatible =3D "sophgo,cv1800-reset";
> > +			sophgo,rtcsys-ctrl =3D <&rtcsys_ctrl>;
> > +			sophgo,rtcsys-core =3D <&rtcsys_core>;
> > +		};
>=20
> I think these node is not suitable for riscv. It should use SBI SRST
> extension to restart.

Independent from the particular form, or its correctness, this is still HW
description, right? It would be a "policy" for the kernel configuration, if
the particular build would rely on the FW or a kernel driver to reboot.

In other words, the HW block remains in place, no matter if it's controlled
by a kernel module or a FW. What the point in hiding it from the RiscV part
of DT, keeping on ARM64 side only?

--=20
Alexander Sverdlin.


