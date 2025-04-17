Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5534C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 05:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kprK0lvULNRRtrBb0B3NMMimLQuxvy9ogMHPfRsi3y0=; b=yMjnPM/nOjaNKNWoBfMCqk2P3m
	hDeRfwXVmuqsm583WaM5Ef0YAmgVygItlVjin4IxCWbVcgSwFBy9TI5HNAI5y3tD0WkWhY33K6gXm
	pgDgdmxhImQk5Q1f5SGIL1eTuElVCONE10Biv/0zzkH1cCAZnEybJuyREN6RvKHmWI2Xe8HrC51Uf
	E88VgP5LNj7/l7a5T878kkQjypt96qaeFJiXFhcjq1HOVfCZOzd/hQnEFrYBXCFvMbsYjdz9EEvdo
	/Mm519j4hJoBIKQl7KzF9/meX5poBzx5ZFMXBoOYZPvv/968YztUWG1ogUebYkp14v6BhY5XRq+TP
	XxIph5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IET-0000000Bplg-1gfP;
	Thu, 17 Apr 2025 05:56:17 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ICc-0000000BpRi-2193
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 05:54:23 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c7913bab2cso32915085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 22:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744869260; x=1745474060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kprK0lvULNRRtrBb0B3NMMimLQuxvy9ogMHPfRsi3y0=;
        b=Sjdl5vNHPo+M+EiVwMe68aX2cdS41koBjkdHulNUP7YBy1z9ZoycF3JJupnY1uZdiE
         F3e7CI0MOEKEVawCNFhfaCpzf9xMVvJLCLLayZrNlE7o5Qi72BS4dFp4R1l+wN/HG9c9
         z/1FfIj7lKbtqVxVtkrOYDbEabYUhpctJLcO87klBuTeSs/7jRfBPwCd3YIOAH3WPk4I
         R0PzZRaTO680iw1VQa9iESHV7zEij0tqJp7F1rPoin15sbXTEP96py0iAehgpipLDEnb
         vfV8Wlt+Ywxgy5qDyDALqQl5eHKJmy5RJsnNm6q4keh72+eRAWVpfu7m53m3xkbjh5AX
         LhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744869260; x=1745474060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kprK0lvULNRRtrBb0B3NMMimLQuxvy9ogMHPfRsi3y0=;
        b=LCDKilKF5TNWpyGeVBNcFxXJxGaCBYBC54acW5pdLcUCgEyLsjZ79LDOcehW86mJSF
         WI3CRcXWnKbhxHpmJ3UcYHUCth0OZRoFIp2PyWpiZAgkIzc1IBcXQvkbxMH+8txnK2dH
         azRxcklkgpPQzNgQwrMiTlIuQLX+ax3FwvFDhfVHr0g4gyB6FrKQVUzyYWJgtfHslSpf
         7m/JkQSOBdbdlhgnS7JF0pN/sXFYO5s9TP6Njrb2T/m/hITkSYI1YiE+VVnwjA9A8L4E
         6F1425g3ebZGks4mJm/TMw2PVTRxIhlnDJqFT1bL8A7vQgQ+OHNLiEu+NPjmmKEMlv+R
         0cqA==
X-Forwarded-Encrypted: i=1; AJvYcCWld+UnMOxnwcwDKCLxzHYKwG2H4QQtLyc4g4j5o1FZIZ68e459Yy72pHRZnbEQWqX6Gkc4whfPB3rGB6Xg1qT8@lists.infradead.org
X-Gm-Message-State: AOJu0YxsOGM4EbxDNbFy89W23bue7d5WNbRh7eLok3nXqGTI2m3ANmKd
	RRIEXr+Vs6kcQIha65oGzFGGk5F5FOIirPKslO40Ittb77p6/P4ivHZU7wcsOIoOSmLhSKgj/AQ
	x63W5TRWKL9cAoehb6W8jhEisjtE=
X-Gm-Gg: ASbGncvJZxvFKd5svwaulHRws2qfTd8pgx54FqVzAe6miJtG1IPyYcypASs9uG7/I+T
	n0nQ8HeRqJCZnWprkmllgtHZ4LLWY8TnnOojDvuHxhH+uMbeGemzMhafX72xZpNpMEpu+5KUVY7
	CdgIYurU73bn/kRm4mFPOryvT/rrEIbGxIOXr29smJHyG4oG2Q8B50voU=
X-Google-Smtp-Source: AGHT+IEnx6E+7Cu6lljiUQFeBdgwuD5UZtC9iurhJ50vZO4BYyoWmDW8Pd/wlyU1Nx7Pubvo+CQRG+bGBvTyZ549gPE=
X-Received: by 2002:a05:620a:2894:b0:7c5:9a1b:4f22 with SMTP id
 af79cd13be357-7c919083ed8mr715313285a.56.1744869260062; Wed, 16 Apr 2025
 22:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-10-f9af689cdfc2@gmail.com> <209070b3-4758-416e-a408-480b2a8e4fbc@kernel.org>
In-Reply-To: <209070b3-4758-416e-a408-480b2a8e4fbc@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 09:54:15 +0400
X-Gm-Features: ATxdqUFzP7BBKqFL0s0OmGzLfog0caQx_klZzGoU6YsUX4cKgbYRNzTdifkZ0Bo
Message-ID: <CABjd4YxrqxAx9RpMcEtxoJm17BHMNUjD90EA9oHdGF8OoYTHiw@mail.gmail.com>
Subject: Re: [PATCH 10/13] ARM: dts: vt8500: Use generic compatibles for EHCI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_225422_522293_A7EC5EE3 
X-CRM114-Status: GOOD (  21.68  )
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

On Thu, Apr 17, 2025 at 9:34=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/04/2025 10:21, Alexey Charkov wrote:
> > VIA/WonderMedia SoCs don't have anything special about their EHCI
> > controllers: in fact, vendor provided kernels just use the
>
> It does not have to do anything special - dedicated compatible properly
> describes the hardware.

My thinking was along the lines of "if the IP block is generic without
vendor-specific changes, then I'd rather describe it using the generic
compatible". But point taken, will drop this patch and extend the EHCI
binding instead.

> > generic PCI driver by emulating a virtual PCI bus with fixed MMIO
>
> PCI? But this is USB.

Yes, it is a pure platform USB EHCI controller. But the way the vendor
approached its enablement in their kernels was to code up a virtual
PCI bus with statically defined BARs which the common kernel code then
picked up and enumerated this platform EHCI controller as a PCI device
using the generic PCI EHCI controller driver. That was before the
mainline EHCI driver got support for platform devices, so apparently
they thought it's easier to do the virtual-PCI hack instead of
properly binding a platform device.

My point was that the hardware block has only ever been enabled with
generic EHCI code, so it must be indeed generic. There are no docs
available on this part, so various vendor code dumps and manual poking
are the only sources of information about the hardware.

> > mappings just to bind the existing driver as-is. So switch to the
> > generic compatible to save further additions to bindings.
> >
> > Note that these devices have only ever supported appended-DTB boot,
> > so changing the compatible should not affect any existing users.
>
> And other users of the DTS?
>
> I don't see benefits in this patch.

No problem, I will drop it and update the binding schema to include
the vendor-specific compatible instead.

Best regards,
Alexey

