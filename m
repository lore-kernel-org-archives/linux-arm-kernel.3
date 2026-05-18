Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20BDCD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7N6f0O1fL7CnMh9vlnmxZC9H0Mq5P8xsNIyAlAW370=; b=GWoKE/VpD6UXOXVxJpTkB0NdYG
	DR5IEI7/CUmgwiRfNifpiDWthqs+5MdzBLU4uU+GL+Jr1uu0t8dRLMLm1LEIG+swrXZt4/KJtbp7o
	BgUKD+LG5W4Jw5ovcuLuVM59xPFWkTzv2yA/jk0PhGgcEhSN33kPehXpw6O5N4wAWuj/Jz00PYY74
	UdUPxshlXIOH+vY26anAS56O8ZbtfdJCG84MIT/A5CjCfCVobrVGhh56g+69E53QRdYGtkpoM76al
	m9UEDN0emnxnf0Jk3fTBy655ilFQeQORdMqOzgu1Y4qq+aD3gJExCHoI/sDeDdTA+yMZI8KcqTcbH
	XNNIitPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzJc-0000000G3Em-0CjU;
	Mon, 18 May 2026 14:51:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzJZ-0000000G3E7-0Net
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:51:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so26739895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779115887; x=1779720687; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7N6f0O1fL7CnMh9vlnmxZC9H0Mq5P8xsNIyAlAW370=;
        b=GbbkoohCLIJtgzOkcMPwy7cHtIUb1ELjBGby2jRG155jS/CoyKg0dF8TeShanhLjLb
         5H3+XuUIpHuVtjzdlFNWVQtTJ5eSGO38Jy1uPRVG8tVxhW4ino/juuvrKS0o0MUCSuRM
         qz2XBM5T68oEsGHPxyd8/kRXQPheqQgpIwjRtYePA1nWn2iX2n5jbfq3/+T9hq16ZPp4
         gpGkkT8qkqo48QkyG5hmthjonnKSFEOmMA2RDQmkdcG+5j/xfnpGvoX6XSE26SvShMIr
         t2jGamKFl6UpacrgVnrmAQ9XAlgyIo4GFuK7cjxA+bK60nOJmY2Ot67iVHkc+cjRoEdJ
         tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779115887; x=1779720687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7N6f0O1fL7CnMh9vlnmxZC9H0Mq5P8xsNIyAlAW370=;
        b=JmtArv/vS1BrV7rfZXvQqMmNWKNEQ+oiFWV6VQ7KobiKRrsM4JZy0hrt8bIan2unC+
         7THsyVpJoiH3vfH+cFHPOmGXYKmMfP2khKmVWgOnygwXp5EqCGByklQMnoYT8JXn5Vp5
         5Ie8l/4yhjMltA5m/cg87ZRAGcHB5+8vVvXMUCA6LLTr8lCrfhBV7Zv8EEeyyBc+9uxJ
         Jmk9E7L5pmdKzjB1Nb4YzxSfF2LfX+3dAIW7w9Gwle6/wxHYFEUkMQVQlX8aoDy/LwcM
         anM0v4PpeUH+Rd/23j0NtCSFbMN9UW8Oo+CNuTD95vDz6sOJ/B6AmF2yn/Ruwo1eZcNj
         0YiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Jg4XeuWzvtHeR+Tz0SybNvziEg/0PdYxDbGXsghh+uXERs2+MKajd6RxOUO58h5575A47zTf0i7rwPwYAHG9O@lists.infradead.org
X-Gm-Message-State: AOJu0Yx52jWcnEzNiur5ubVJ7YgyTUDDpQAZP6ySnmI6APaF/AfuSAUv
	A+X1FoXtM+EWfWEVUm3279B4Y388m1YcRmzyyK2+qzg6iPFOfqgG78Vc
X-Gm-Gg: Acq92OGr5dMIpxSd6+hpTjDvKNq0D53ocK3hT45DGn7xaWw+2G6sRv2xBHRi9yU4+mw
	xzcIzt1g2N5GfaAV7iqhP9/L6paIj5DRYTUlrHwpvsoHqeYECan31uLVI+7BNIEM5RQmd6HneBr
	5PMm+DwDbnNPzi2g5sD60llUiik+0rxavjAK/udX1skQldmdXftfyJvs9FquRm6nW1iRWmiMsVh
	MWYZWxE7C2zQS6weZXVp30NHx6AfFytrMctwYaVJ3M6hyPmAyXIC+svXAw1+Hy8ZgTsKOc1nOJV
	6225zMZ2moNqJESpXUKpaMQjq6fUlwIxmqNItuvyl9yPRg7ApECE+QoQowE+4FQwxAi4U+ojpA/
	bgiPlBgXjqJfgtue66++UpbuavmSN3AVqnUwwtPjEKs589NPux58rhesGqPzq4+LdjZ0WjTBznx
	4wdTyJhyhRV4bBchdc/7LdstFer+g04yn7Z+uslAnRLlqJn5Rza4V9TBSEjuLy8tMTWK4TwgoQ3
	zc=
X-Received: by 2002:a05:600c:698d:b0:48f:e230:2a1c with SMTP id 5b1f17b1804b1-48fe6631158mr246804535e9.31.1779115887039;
        Mon, 18 May 2026 07:51:27 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2a878sm131021135e9.1.2026.05.18.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:51:26 -0700 (PDT)
Message-ID: <22731dae5ed48680bd456a3a5fe5e7086d17a54c.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: wens@kernel.org, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:51:25 +0200
In-Reply-To: <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
	 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
	 <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
	 <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_075129_159701_35849BA8 
X-CRM114-Status: GOOD (  36.45  )
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

Hi Chen-Yu,

On Mon, 2026-05-18 at 22:47 +0800, Chen-Yu Tsai wrote:
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > > > > @@ -0,0 +1,162 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +/*
> > > > > + * Copyright (c) 2025 Arm Ltd.
> > > >=20
> > > > Please put your own copyright here, even if that has been largely c=
opied
> > > > from an existing file.
> > > >=20
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +
> > > > > +#include "sun50i-a100.dtsi"
> > > > > +#include "sun50i-a100-cpu-opp.dtsi"
> > > > > +
> > > > > +/{
> > > > > +=C2=A0=C2=A0 compatible =3D "baijie,helper-a133-core",
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "allwinner,sun50i-a100";
> > > > > +
> > > > > +=C2=A0=C2=A0 aliases {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ser=
ial1 =3D &uart1;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* BT module */
> > > >=20
> > > > Do we really need an alias for the BT UART? And is the BT module
> > > > supported already? Then please add a child node to the UART node.
> > >=20
> > > That's the only thing I can do currently regarding BT: stabilize the
> > > serial enumeration, because UART1 cannot be used for anything else
> > > except BT module, because this is soldered inside "core" module.
> > > We can avoid different tty enumeration, should the support for
> > > BT be implemented in the future...
> > >=20
> > > > Isn't the WiFi/BT module on the SoM? Then please mention and enable=
 MMC1
> > > > here. Provide the child node for the WiFi chip, even if there is no
> > > > upstream support in the kernel for it yet.
> > >=20
> > > So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
> > > has neither upstream driver, nor [upstream] DT bindings. Even github
> > > driver for AIC8800 doesn't seem to use DT, therefore it looks quite
> > > pointless to me at this point to specify anything in the DT for the
> > > chip which doesn't have the bindings idea even theoretically.
> > >=20
> > > Nothing in the current DT shall block any future work on the AW869A
> > > support though and the above "aliases" entry shall even guarantee
> > > unchanged serial enumeration shall such support arise.
> >=20
> > Fair enough for not providing DT nodes for those unsupported chips, but
> > why do we need to force enumeration? For the eventual Bluetooth usage,
> > the driver will find the respective serial interface by just looking at
> > its parent interface. IIUC there is nothing referring to ttyS1
> > explicitly. So we wouldn't really need an alias, would we?
> > I see that some boards do define an alias, but others with Bluetooth
> > don't, which I think is the right thing to do. Which name the kernel
> > comes up with for UART1 shouldn't matter in any way.
>=20
> It does provide a hint for any users enabling more UARTs and adding
> aliases for them that they should number them starting from 2? And
> just stable numbering overall.

that's exactly what I had in mind, as the the status of BT/WiFi might
change in future, we might want to make UART1=3Dtty1 and UART2=3Dtty2
today and this will not change with potentially coming AW869A support.

But that's not an essential feature to me, just nice to have.

--=20
Alexander Sverdlin.

