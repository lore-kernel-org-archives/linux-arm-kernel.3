Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49977C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=; b=QZvNRdjgflk3RcBzeHZUS7iY/G
	TTeg3TzL19uywfyKzTif6JK9jo0nwnc9+7Di0fH6NtAR3LtYosQasmnSOhLfKKgJem7Gu0CUS9ZRx
	ESi1yvZy6g/WqFhysoOjNZtPM5yjh3QqCck73lxanZw+AYwzY6Lo0k0DnD62fZsvP+3oGSXFW+rTc
	e/KG/Qbvs+h5pxjMBncZuDH2/9cLKwBkb/VPf6aEVqrmfL53oxEOsH0DBN3SDVYlUcIjJrQgvXCAO
	i9meYl0xl2YfPtd8dCkghtMXlzS5P1V+Cx61sMi6majj3zHHnWSoOIo4Lkp/NMRnb4nb6/K7aQPYQ
	9bBERkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqves-000000006QZ-1EDU;
	Mon, 03 Aug 2026 16:36:58 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvep-000000006PO-1K4E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:36:56 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-97723f98735so2195606241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785775014; cv=none;
        d=google.com; s=arc-20260327;
        b=RIlivMa1xOcOMo9c2ezfRY7tmhEQufG72zHys0qOvi5599Adc3c9IqfAf0SWFUkUmO
         hP1pOja7J6RQBivAebgrhsejx8zClnANH+Qgo3KER2S9ifvxqSZP00+BSQl/nZ6FfyE0
         a6rcVS5pF0FTHmCT9YupoBstqMfDm9e4nxXWfwsks0toItV135ZctizZ3R1lffqpsBru
         6tl8uo3/IQ1IVeUJxo8anZibwTKgrd4yUF5JEnrep2jCwRJe17/+fNJkZdz8CxpbTsFn
         Cxr6ArqFyM1j5mWmiTzSkE5Bz5MKQdNfqNXoYV/PKMv9NuOaIR0yf72582LdDbDw2klB
         R+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        fh=zWqE5mAFduDC6DpivsVmONYZ7Pmg3jXF/Xh4TWU2Lfg=;
        b=pjPAzjHLZr3hgDPObKjYl+Zej/D8MPzYKwV4A4FMX1EXF4s+Ma3hyyshwy+cXgHGdx
         bMMTY7TFT6U6M9u8UPbo8U348QhdSC7LIrVKe4Ekat7gRnrMwAl5enYEUrzADLQtLqEu
         hp/21UeVdyKNrJckB0bFtZGrajReGJKWTYK2o8FihqRhPYjsSdLtBXojb6L7U2q4IyDq
         8W+bUbDjH8wYaCY30PejGeYn0Z0eUqJ/Kl8VoW+qVg1NCD6T7aG8JO/BX2/+bt0JrW05
         y89iJ+ns4FysCgRl7lg9GLJHhG9U5l4v/aWXBH4ion4v64iJk/gc6VEs/Ts2f/cwnd6n
         eVSA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785775014; x=1786379814; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        b=r43wsFedo26IFN1Oxld01ncWTnbTfJXkiZvkMi7GW0VyoXsYxrsC9tHSvJd62Psiyh
         EJCYb31NtHd5eVWj3Q43m/cGLB8Gj4Q5BWflNHT7apdst3xJ+LIBdes6OrDXshY+ptFO
         Eb0SdFt5LIImZgihOeej4/i4xFfdaZpAJzDMLZNujY26mzIheuYmsOJ+Cw3gB+D+UmkF
         IhUug/kx0sczCGO0JaS1ilxDKxAOW8pngnrN8eNL8y3NaDEJ2QWhBO7SVKk+FU0T8ob1
         pHw5Hhr3U8xGy/eYm9wmBO1fktvp2zkKlmpvVMbPG0U0xMSLCVgCRKRm/pPyfp4ucKUL
         MESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785775014; x=1786379814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        b=TXaMoZY3RUyO62pGF+OsqmYBjyybQEv/hWZPdCcT5JLnZJlN/n4mNxdPbEdWW7KMJK
         2qp4/A5Nw6YlK/DVzPUm2sDZbwJ9FULLw3NusDzzvey46vCgyhQNbGlsEtwSi/fZkEbP
         +MDPWOjnH5C5wKH0zAVmmN9XwqDbhiOuxmNF4hTNP85YBZCuJ++bslraDDxBGBHPeucn
         AawotIjyThL7QOCfgY4tOQJ8UBkbsPHVQ1EtFLKl18v6XBZLZ1EZZGF2ZVXnj7J28327
         qEajAbJrrUT2mBSiIfpvLqnYWYSlA/SJlPDxUMe4VvB+ULnUmeojUiqkkpUF+H5Xx+YE
         SE8A==
X-Forwarded-Encrypted: i=1; AHgh+RqqJ2RBX5JxFxZYkcKymE9NjAhquY1Ral6ZFpiX5rzP6LqN1Kl8v1zJL/9K36t062pNfIQbIr+D3Uxa7K9nJm8T@lists.infradead.org
X-Gm-Message-State: AOJu0YzsCtp5fzyV2SrxlO2+F2T1KDSpKHd8uTwaW7hejicEzOhecSLc
	XHI77HTk81IsV/QL6jevsfTDP3Q3e86p0wJ0PC3weF9XkWycV28pm3w1VY9dTtPQ/QxP99+yl7L
	sEFsgkNpmE6OZZdPXZfIQcCrHr+FX4AU=
X-Gm-Gg: AR+sD13UixEQZjrFwJipLyxmEUjoBjiNZwUYcrtXjRiid9fOzc70o0hxtoTDqjb49Mj
	hAg8jv5a+4UB/pUprUyCuuTkHePOnNohytP8ZZoHfiYDXfckK5Db0/MHYiTQ3KnpFo5qfRuNYcg
	+z1zR9aOgrALnLgJaE+lUjy/kBWtTDlw/VUtD1VjcYTxrdlJO5zSWaHwjsiqhLcIKyyc+LFa9ly
	0kYPx1WA2lcWnv0tBdenZAGxhivVge7t8MJ2PqBJArXWvGjMJI2efTBoZtfZYOX/1lPTNTQHVlS
	KNDKT5qwP1TtvAcDV30QpReQkyG8tqDHvAK2s+9ZRXLJiPp130iF+9Iq/4h7GgK6nmcMv5vb610
	NpQ2QRcoWl8lBYzC3w4GXkBSoBuw4lJwb1DM4UxQ/QhtGOkaOBID4en56WX5y+bIdwSjqGyP2Am
	lB0hQmEy5g2QfQLVMPWdx/7Isy9XNBMXZSC8wIDwdNDO9Avlo=
X-Received: by 2002:a05:6102:41a9:b0:740:2bcd:24d2 with SMTP id
 ada2fe7eead31-75b2245a880mr8777953137.5.1785775013743; Mon, 03 Aug 2026
 09:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org> <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
 <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org> <cd177647-827c-481a-9ac6-5f5a1882f14e@kernel.org>
In-Reply-To: <cd177647-827c-481a-9ac6-5f5a1882f14e@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:36:39 -0600
X-Gm-Features: AUfX_mxf143l7ltuwFHdM8jtybu0jFAqTogB47kH9lIVgz-FaKgqQGV-oPrZGYA
Message-ID: <CADvTj4qby5jow6BkvumZFK6cF8aLCTeQZz39VKEdm59jEtRp8w@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_093655_365647_2BDBC31B 
X-CRM114-Status: GOOD (  16.97  )
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

On Mon, Aug 3, 2026 at 2:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 10:20, Krzysztof Kozlowski wrote:
> >>>> --- /dev/null
> >>>> +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> >>>> @@ -0,0 +1,13 @@
> >>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>> +/*
> >>>> + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> >>>> + */
> >>>> +
> >>>> +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> >>>> +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> >>>> +
> >>>> +#define AC200_IRQ_TVE                        0
> >>>> +#define AC200_IRQ_EPHY                       1
> >>>> +#define AC200_IRQ_RTC                        2
> >>>
> >>> Hardware constants are not really bindings, even though you use them =
in
> >>> the driver.
> >>
> >> Should I do something different for this?
> >
> > I would just drop the defines and the header, because these are fixed
> > hardware numbers.
> >
>
> Hm, unless they are not and you added abstract ID numbers for both DTS
> and drivers? Then this would be fine.

Yeah, these are more abstract ID numbers, they aren't really hardware
constants as the driver translates them.

>
> Best regards,
> Krzysztof

