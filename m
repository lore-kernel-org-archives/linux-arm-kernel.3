Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C91C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpowxPIs9WsIvTj4/MuMW1Y5/GmzHzBIUQWzh9qqtsQ=; b=G6Xb9j6iHQzsz3HzUa4mvrRpQR
	qH3lFQbNzApjerfs+KI7/MqE8jm+L0z8OaAB2oXD+ICwdKxXJpRyvZBpMyLTWDoubVIe7QqOO9cse
	3I/ccOlXGBEShdp9xvXKQ1e3NxAlKFItSGIs2LzQall+8rdFrv517UBZHNAr948H7Lp1OLoUL7wHv
	hKNrYQMYcgZgopn5FFyw41tPXasx2SKRlYO0RTNXkWTv46Xoo8S3mf7wazHZHHKqlLn/D9CVYTELP
	fvj0odsF2HJCQ+yxSRA88ThGxxDrOt6i41wUzKPhPHNeuaoQqHbALdL30MVheBBRgVZ8FtD52zQpY
	gSdFnQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir6U-00000006kPL-0hrY;
	Thu, 22 Jan 2026 09:35:50 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir6R-00000006kOs-1zX8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:35:48 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-65807a2012fso1301885a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 01:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769074545; cv=none;
        d=google.com; s=arc-20240605;
        b=SX80U0YNTj5be3ntm/3DXiEU8xt1KuHZ2unHeVzuHPFRprPj5JvidbTxs6An+oCFF+
         SKzMznknTh9QrCpgkcZKXnvkiUxe6kmPJ3tKcqHVobuOHVk6+3XC3Q+F6IJsS7DmOygQ
         Txe3KiTWJqXJhwctTzxRXOlBpKizovJbH1PJtFspuqXmzwzU/TrCgeknOGT0UzQgwlag
         HUGc3svMFs7gKmI27rS7DBtTTO/Oua+jyx9Hxsy3zN/aWE225hOLc11HaqGhSREPSFL5
         F8dQwK7FvTQ4Q3q/09+v/OC9OhZ8Jf+00lXAI7poeUe5MhyeHhmg9P83yDSRFxkrbU8j
         kdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CpowxPIs9WsIvTj4/MuMW1Y5/GmzHzBIUQWzh9qqtsQ=;
        fh=HJorDDJNUoKjuWa0LmVjjGU6fsXYihmWv81JcK2ISig=;
        b=dLKc4Ti01UZWL3vtDkYv6WdyDbJBM64fZdbNTwFOADXnEiXR5gJb6+7YGu4K5S1V+g
         7cY/E3zcZloZ4NwQPsIgiRTbWlZp1AdOJ5w8G+WEQrRveANx6k9GvNzIehVVOKmHbGeq
         jaXLHWg7xWIUNNsYNJcwTUW88e+P++q1AwtSiA5493u/SMD+0Ycennjc4RKiYTlEhf5h
         iNoMu1IE5aVO3MV6zAdavZ/lzHsKWyn0T2UT/qZ5mPw3lk2PXkBWhoUi038yrHWmfP/V
         TuPmX9MtEZdAIIc9NXVXXFiEkLs/d4sjjN1JC8nRyxsU1sGcNLy5HbsCEJbr0s47nWb2
         JPRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1769074545; x=1769679345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpowxPIs9WsIvTj4/MuMW1Y5/GmzHzBIUQWzh9qqtsQ=;
        b=hBu5VS9NcQZCzeDAAVv4NqRhCybXQUiHZbCr/4/ET6zeT+qsIOvBbNBfNuwMb1AYmz
         DgLLmPlnyTBwnv7kqk2Xl9G8Idwj3CrnUB8tD/NfLbwcnQ5s84MO9bi9yDAD2fnK95PV
         TQm6MTKkx8yA195SvyCZ3Yank3qt7JTYzQ8nYBIOADTvyzbo/A0gFljJJsP9HbvelCRC
         XNPfORTPffXF0er0NUtrVdlE7hcFmspPJN9XTwTJG5s0eLJRZ/8KYvliI/YLucoc6fZM
         jN4K13TW3J1CXrObp8Cpy+lA54UEDrO1w5WpN0a9ZoFCf/vf3qNtts1jrgBgghCuOp8R
         o1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074545; x=1769679345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CpowxPIs9WsIvTj4/MuMW1Y5/GmzHzBIUQWzh9qqtsQ=;
        b=LHXIB0zpPWMsX+iQvVVwiizXtjtGAhW3gLGn7QJZxrdbOV5mVq0yuWDrLqxHWh96zs
         95wQYjnhkI7CIWs1gy2qh2r0RDhlkhVI7lz++2Au0dAYi/iZ6S3KWXc7l3ogD8rG079n
         wq2nJULbOcj3LAF4Han4IaipLG7j56a1f0IPQoB/kqE/kHBpyJ6ofgB2dmM8+8M4tfpy
         2xt3mkpnGjZqHbO0jEOGBao2SW5bmdKFyxmmthHonb0ZrFEtTdPPA9C1SPLG+RQQIqk/
         R8LHOBsQcPV7dRbn9Y8FHOKJpQTKobgeC3QKjM/u0jkvv4+B9HgeL+OmU90PiOUMTdlI
         n4qw==
X-Forwarded-Encrypted: i=1; AJvYcCUstJOIYMaiZVQvqIwBJXi1f7KGmm1HUF8y5helno8aqOODzvGOUZlwmofwgc2V38ElKb8gcrKjz22SXQRLKSBN@lists.infradead.org
X-Gm-Message-State: AOJu0YzOrVwJo7BxPA+DrYY3KcH3yHgbx9TLeDlFuMEexg+ccwoaTWjP
	vcwAxs4hWfIMhJEWJ8Zl+rBIFYvZWLbrR4qal4YukUmdRJFa6Dem61KoEv8wOpse023IcReQpTn
	slYli+R3XYc/q06D7xkU+cuID4bcHPKq0uuDAnJpZ7Q==
X-Gm-Gg: AZuq6aIQ8XoHGrmDwjyDn8V3oHOBrl/inUbJKsa8/AJo/IEzVNOCBd8IeRbDJ4dngZD
	4gdDoUTKtryt5Z8njLuPsolkNZ6PX9ZmlP7I8iDwXhV8YzTNnXrKMa0FRZcQLjOywurGs+cb+nJ
	IhMZitOtcymdB7X8wti+a1/4/U4PlbgBNQUe52+lgWZ1SKfGxAjPnVtJ4C0wY2Z3PU6gB6vAcau
	JXc3etMsUWQYjqWPJRpiJOayQVcgfXwdFD+kTdU42n1UNF72iXYG6CSWlS/9rKlEYxXlp9ufVpD
	6s7Ai/rC93Ogk1C2snh6bP4nc7ukz0MIsnmlugHRNdMMZald7fADWzAgIlIbqg==
X-Received: by 2002:a05:6402:f02:b0:658:1304:b68b with SMTP id
 4fb4d7f45d1cf-6581304b771mr3388171a12.15.1769074544348; Thu, 22 Jan 2026
 01:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20260115114021.111324-1-robert.marko@sartura.hr>
 <20260115114021.111324-7-robert.marko@sartura.hr> <CAD++jLmitNVhWmUf9BBqLR2_WsAR7V-+ykVJsLK3MuOSUKQF0A@mail.gmail.com>
In-Reply-To: <CAD++jLmitNVhWmUf9BBqLR2_WsAR7V-+ykVJsLK3MuOSUKQF0A@mail.gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 22 Jan 2026 10:35:33 +0100
X-Gm-Features: AZwV_QgGcZewelkI3QjoxNf_Rdp39oV_bH_54mEjrqvn-sBMKJLuqze3gq5di5o
Message-ID: <CA+HBbNEw_9FNOFxx8Mo63Aq49MxWvvuQ4Sc75mXFYpwtMmETiw@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
To: Linus Walleij <linusw@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, richard.genoud@bootlin.com, 
	radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org, 
	richardcochran@gmail.com, horatiu.vultur@microchip.com, 
	Ryan.Wanner@microchip.com, tudor.ambarus@linaro.org, 
	kavyasree.kotagiri@microchip.com, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, luka.perkov@sartura.hr, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_013547_545817_5B16ECCB 
X-CRM114-Status: GOOD (  12.25  )
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

On Wed, Jan 21, 2026 at 1:44=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Robert,
>
> On Thu, Jan 15, 2026 at 12:41=E2=80=AFPM Robert Marko <robert.marko@sartu=
ra.hr> wrote:
>
> > Document LAN969x compatibles for SGPIO.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>
> Should I just merge this one patch to the pinctrl tree?

That would be great as other bindings are slowly being picked into
their respective trees.

Regards,
Robert
> Looks good to me.
>
> Yours,
> Linus Walleij



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

