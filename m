Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADFDC02183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=farCSn9nIwDEYesATkrLZqDi4SS6wrr0tkHz+ajWl3c=; b=NlQjxBILNt3PazOHGWSTC+TLIV
	F+xeUYCfTXg7dq5ziTHUDL9qCjBBq8r0bVWWdGJacsYfIKqvETaGnjhi9AHKrOy+PuiIz4MJ7sBJH
	kyS9ojysG+UlFHCsSHJG80a6hF1JpBMjSSJtzAW/EEZ9ljKbI6LHclkvJS7z4vT6xcpmDwfWrnSgz
	lXkNyXRxamWX4J/HXmoEiVz6E2Tajg3d3aK1QUcNroEeizjtAjdsJ+/E24bF1oWF3BKFoYW9h6i+/
	LqPEcCD6c3opxTD3wjSA2po+brEN/+YDPwnOao1XVuEuf4Qci8mPtk3Lx+rs32y7kc/NpbuhP+kQU
	w76bI+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTH1-00000003mZ3-3Ktz;
	Sun, 19 Jan 2025 11:15:23 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTFi-00000003mQg-3yrS;
	Sun, 19 Jan 2025 11:14:04 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso8405495a12.0;
        Sun, 19 Jan 2025 03:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737285240; x=1737890040; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=farCSn9nIwDEYesATkrLZqDi4SS6wrr0tkHz+ajWl3c=;
        b=M1+BAB0yMlBy2U+xv7F5G3hm0OixXavM8RP0YXCtgWU7gz+nZtmeUVpuuOzh4S+kLq
         1Ti4nrihV8IOoz/wBNf0dp6nHWj+ZQuWhRj8NzlmkQUN/qiyYUSr7qqImgZNOQrb/w4d
         tXTA2Z8s27sINSkUFG4+UyOwB6LUPrWZOgksHTX+vVAqubXC2fZ/Ehh6lgO4N+eNaFBf
         WRMZXtciIVaMhHEStQTRg6CRxkPmTi9P7K/6CzZHijDQQM5mdXeBlq6dh9hKxG++02Fs
         nsfwALIG6g6nb+KE1AEZKy2qZ1kkGGs6a0tshEvamF3Ikl6aVYdWTtJR34OJajNTB5Pf
         I4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737285240; x=1737890040;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=farCSn9nIwDEYesATkrLZqDi4SS6wrr0tkHz+ajWl3c=;
        b=e7uCE9vkTxIF1BBXq3Zx3duzZ4FOgQRkUdGOvHxYSX86fC0ypQ4xwS9KN5yDaYYrjp
         9w4WPrWQp3+3sBkQBpN1lKjakpLjPIjXta1dvPASHVhyMXbH6uqScHXteLt5LDcX8f1L
         f1qwwqbm/ZnDHXS/kiMGDNI1MeQn+sVT2ADG5EVa5iq0Ta+qwfdlabpRgk/ssa1D2C16
         VBqwccD9Un1pqYsArmf5NwVSDGrQyr20O0Ic2DqY+/oe/2JPRtsgVtIcKAo3AuNvVbLc
         tE+2a1HFpiiR1Fp0iG+1Lzj1D0SgMapURahOmWJVsvL1T9Cc3m+ktuIibmjSo1HLvvH6
         xl+g==
X-Forwarded-Encrypted: i=1; AJvYcCUniuc0YjJTv0WrjIJYIDYaBFDomstTPrxDiab1FtqaHujUQI3JICeFrXAZ/sR5En/UyR1RCqwuTV81HvgkJmLJ@lists.infradead.org, AJvYcCXYz5pVNkl8HY3nd6EsSFSS9YXg8bmAVAgFgBAAIVgmjxHK+i8+520/WFDPKIqnbNSC75CIRX7OwzHYqk0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPp3lohL2K6SORD9YTcLgJRplcCoAWL7oXzC0u70M2oyj0E6RT
	IyTXYv140PBN+eM4It/Uyd3kCcaZog+6AgE3Z4X1BDaXS2WeaAJY
X-Gm-Gg: ASbGncv530Vjn7DQudr8TlhFi1Ny+i1N87R46FSv0rHY155FSYUhxzCbGEFGsftBfGM
	SF565VSd71Y7M+TV9GGxNU5AnDN5C+VpEITi+ZvBux6QkToZrYQ/WxEYlT5Ycnn8H2qm3AvL8EV
	JY0MHRWiw9JvCqhf1urqFMKRM5fuULR1DnF2ScqYQ1RQ/8g0EFaNH2F9klW1++hg4tV/8R4zjCP
	QqfrFsPg/+gdWc1TqISommCZgvzHC4yVuvcNZ3wNcm38rpjodHlalGphidPP75/ovz3Y1NRjntB
	ZBiCMl5F6BqxQQ==
X-Google-Smtp-Source: AGHT+IEoTFLC8iiNkEfMuvLuAjGsOcPoNsCUGkRVkaCTnkI/9FAsHLtodq8RJ0LSASHuxw87IeFMAg==
X-Received: by 2002:a17:907:9405:b0:aa5:53d4:8876 with SMTP id a640c23a62f3a-ab36e406c75mr1277119466b.20.1737285240156;
        Sun, 19 Jan 2025 03:14:00 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c63b5fsm475163466b.32.2025.01.19.03.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 03:13:59 -0800 (PST)
Message-ID: <acc25734b7d89b04c19ad50981e3a82a7737dac8.camel@gmail.com>
Subject: Re: [PATCH RFC] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Sun, 19 Jan 2025 12:10:58 +0100
In-Reply-To: <20250113-aftermost-whole-18401dc54137@spud>
References: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
	 <20250113-aftermost-whole-18401dc54137@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_031402_987828_980EA6A3 
X-CRM114-Status: GOOD (  16.41  )
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

Thanks for your hints, Conor!

On Mon, 2025-01-13 at 17:37 +0000, Conor Dooley wrote:
> > What are your thoughts?
> >=20
> > =C2=A0arch/arm64/boot/dts/sophgo/sg2000.dtsi | 164 ++++++++++++++++++++=
+++++
> > =C2=A01 file changed, 164 insertions(+)
> > =C2=A0create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> >=20
> > diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/d=
ts/sophgo/sg2000.dtsi
> > new file mode 100644
> > index 000000000000..96afd342bde5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> > @@ -0,0 +1,164 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include "../../../../riscv/boot/dts/sophgo/cv18xx.dtsi"
> > +#include "../../../../riscv/boot/dts/sophgo/cv181x.dtsi"
>=20
> FWIW, this can just be #include <riscv/sophgo/<whatever>, /should/ be a
> symlink for that, as there is for arm64. At the very least, I did see a
> patch adding that link in the past. Check out what the RZ/Five is doing
> (that's the riscv renesas chip) for an example of how this already has
> been done - I think it's doing what your "Alternatively I can..."
> paragraph describes.

That's exactly what I needed!

--=20
Alexander Sverdlin.


