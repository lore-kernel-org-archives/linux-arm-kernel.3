Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8274C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qoa+TnZ+eJVmynifYlg3CNbZeNLJM90IDeQADpEz0bE=; b=YVq78uNSsezEvSzingN2MBuW+L
	CzHdKrR/a6OFTIUR/2grz/yf0UFUzmwAKffhwgiI0SDfX4ZFJDMKlSqZI0ft3UkA2tlrx3F1c6yj3
	EPototTPgTzMK60uv3VSNbawbCTnNPVyZ15FVInBKpJGCrLg1oIS0bKI3jNyuD4wWmk/FT3W8KRyp
	ukWF7NtQ+k6l+HKsYJm+10D42z69tll069fdeNw7Y1J8n40gmhDm/km2zSTsfqaK/KiCgDcViHNrC
	aTEW72sDtyRFzjvTXgIwyD76J6EiY8oNXeOpjIDwL/MZ4fol8DsU2q9Vlx0xQP5YuefQSCuoF+xyj
	oLlUHEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdka-000000081M6-2XZV;
	Tue, 14 Jan 2025 10:02:20 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdig-0000000814b-0tCw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:00:23 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e460717039fso7351480276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736848821; x=1737453621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qoa+TnZ+eJVmynifYlg3CNbZeNLJM90IDeQADpEz0bE=;
        b=bvEND86DYQ0l3F+yyiifDVtdQoPRPHMJOOSJJK8RVk2sJmmlivETMVDOPh91/px3W+
         Rf5ivGon+krhYXISCJKDjcWCd/IvnHruZ89dmx+2gIsNZOoAgy+POnH2lupYclk3TYaG
         bm8sTuj96qdwTAMIMtM5A4qJbxZdYOM1yV7xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848821; x=1737453621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qoa+TnZ+eJVmynifYlg3CNbZeNLJM90IDeQADpEz0bE=;
        b=QVy+Z+qriKJ1zTunVHqyDb3CHpBZi2qDIU5YiwY0ecpxNXDiuyf4j84mzwf1YdRp1+
         fABVcnkPOCV5A9vnNewXgF1NEUL9/oS4osIwP7KI1/L1Y/NdUxv+2DctsBMtvswjTkeF
         tjS+u1snbWMG4KRlmGqylAV5quaFKNPGrWgAgoRf3RVyWSInlXYTHd2GGevsdMYTk1QM
         gHa6Hgy/RpCLyFlF9goi1qsfG97iK2ijZsstSZNxyXYZSKUl42478SlR7nCI9N9McmU9
         Ob4hPHUOYrrgNjxZ1UsJX8yqCUQw3GMr5G8z5gBmqTW67wBAnHujgwLKh0D4XM61Xmyo
         p5SA==
X-Forwarded-Encrypted: i=1; AJvYcCUbEWeis9eRTEIqZKp/0yLAR/vPY8fmwUKBu+XvFU5lIGM7XzRLBneg7HiFPH5KeMw7ye0MA/5v/uEDb2XQVpPX@lists.infradead.org
X-Gm-Message-State: AOJu0YwAC/tVTRRBlKTQXixXhnYi6jlb8/jwt3TgTFhlnZAme87Fi9Rd
	UnjBIF0ggwc0p0dQtkffqNZqxDeAUybT9JcaVV3AZrtPlaKKSv8rv7F12G3JBZjuEt3nB9jT4/e
	Ym1dmVfFzmq2stdjXw0SAcSoLLIT+xIuCAYrdkw==
X-Gm-Gg: ASbGncsv/hEQoFYflzGfFGBfMYmNl+X6MwiJtCj8fuY8sGSJHO3WQOBrQh9Cn8JBZu4
	qETbFVT8chB2QXt7LJOOPnFXmHbbBtM2Hj6KC
X-Google-Smtp-Source: AGHT+IHHg2Sovq+Z/vvKo0y9q781hVUrhXP9TC8xIJIu4TiqIQanvvQOUqy3tbZsmXEZ8ARVy4PjE9+PGPJyEEUoEwE=
X-Received: by 2002:a25:53c9:0:b0:e4a:fc25:30cb with SMTP id
 3f1490d57ef6-e54ee2345d5mr13391673276.46.1736848819839; Tue, 14 Jan 2025
 02:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org> <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
In-Reply-To: <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 11:00:09 +0100
X-Gm-Features: AbW1kvb-e25fGlxc4UPaUwDS8MpzQn87D6z9dSdnvOHiAHJ_tEcZc2pAxesQjxU
Message-ID: <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_020022_305977_02790BD5 
X-CRM114-Status: GOOD (  13.47  )
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

On Tue, Jan 14, 2025 at 10:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 14/01/2025 10:36, Dario Binacchi wrote:
> >> Nothing improved here.
> >
> > In my humble opinion, there is nothing to improve. Any modification
> > made causes the tests to fail.
> >
> > $ git grep st,stm32f746-rcc arch/
> > arch/arm/boot/dts/st/stm32f746.dtsi:                    compatible =3D
> > "st,stm32f746-rcc", "st,stm32-rcc";
> > arch/arm/boot/dts/st/stm32f769-disco.dts:       compatible =3D
> > "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
> >
> > Or am I missing something?
>
> How can I know what you are missing if you do not show the code?

Sorry, but I still can't understand. I run multiple tests, trying to
modify things
based on what I understood of your suggestions, but the tests failed
every time.

Could you kindly provide an example of what you'd like me to do?

Thanks and regards,
Dario
>
> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

