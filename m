Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12BCCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 20:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiGIGqDPqEAG/fx/GyBcjXyYsr3F4pTYCf0xPL9HStc=; b=Ky//rPv2481ouVzabZEQ7drQrK
	oGDxwrB5SVCoPZgJeIKk+0ESSgJSEGIx5xvmTAjVrJsb7OwIh+rOkRTiKZ5hsHr4lpIW1ZHS4M16C
	bcOJNFjzWSCTxgNj5/RtESwfOBik8dOfRgFzoDMEwERdAp7oDL7TeWJhT6z45BdY0tEWs5faCMpDz
	PWkLhfJnGoTXzUJfjYhJYObA5L7YuinaRlg8zxOQC9GT9C1VpMG2SykwQSWTBQD0coYHCHLNwbRey
	sXxTGwz4YNySXyOWtkHaEWzJkyE/f3LwVngtzI6Z8dibUikkGUL8qQTIzRPtMaHQc6hPm7IBAHK91
	wXWfsufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2yRE-0000000041C-1m1g;
	Sun, 28 Sep 2025 20:56:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2yR8-000000003zr-25gg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 20:56:07 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-28a5b8b12a1so1231505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 13:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759092961; x=1759697761; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiGIGqDPqEAG/fx/GyBcjXyYsr3F4pTYCf0xPL9HStc=;
        b=QL/dHKwQm15FVRx0SFelBFgb9CQ/VEcR+vwWwvJVCd7dIunJQMqVsbJC0n9zeEV6po
         Wpmh082Pi3mpUFzbKgoFFy22DGGKqrZ1qu5Cce0YKFd4Qu7oLU3h3EcO7d4E7kGTsRt7
         LrixPuWclhSkQxXpvUBUgaeKyfAA7L6l1NDf3Yl9JQcNM5BaYc2AoZssnaHuhb/6VYxc
         YxGJpIwJBR7NqitsxYGu69xtkwjFpB/8JFwf4mhrvL7t1u25yHGzJXnG1+59xzO6qq3E
         RqoFNgaDYg/0IoQg6AuFjb5W86MiD1T9BUvONJLCRmoQt6skrxUW3CeekX68C1Iz692Q
         dhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759092961; x=1759697761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiGIGqDPqEAG/fx/GyBcjXyYsr3F4pTYCf0xPL9HStc=;
        b=ETf+eESF61yLnYYAvvpUXywlg7VsYCpqlCFU038DZCEBg7nO1LWqagswk6Rqbkwhvc
         CUToOpm0Qt09O0f7n6pu6IBemrqUVt234wWPK/0uhIOu80cKoHiqJOgEMNBKt6wbvcct
         xCw3BRt3XQt/7DpUrJgu8GWNm5ijSvn7rKmUBWKmV/jzw52WZxxvLYIKojNvsbaSluvw
         yqdqgh3xnJ8PFBwXp+ZfHod3R5u4TbFOluGmaeBtgu0zEJi7uq4GxmwYNTRy7uaIhW3U
         RFyh8eEo48VP3QTmtVQ0sBZS0KPsA+dMkZ7QTMFQOADLixLZhwFkoCj4JAjs4gH09lzR
         aI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUebiZ5a8whgeMHODJlWm10yjSDVQvNtaXRuilQNm0p8rffd4y6wxNmIlZwgF6vSLfzbvs1oIKTGfViZ2Y1qaui@lists.infradead.org
X-Gm-Message-State: AOJu0YzDzumRtGL2a5ZzYlOfyEn6ZGEta+eskmBpd9gl65mXUMuirm4E
	VsUjV9yXM6FlrA3TE2MzWCfeLa2lJXqdL494gMR7xD+eXKW/qWxyLDtXXeRe8pMjp8tptapMDGp
	ISlPOYnK0IOhEvI7EkpPSTPWZjo2j7II=
X-Gm-Gg: ASbGncvPCZd2aN6WuJtyxHeUULgRe9DxzKyHQhW5FLLOVrXI3Z9y5fjPRrkqS+9iFJ+
	plL8BGKAUAqFUto0e+IOV9U0IGZ+PVPIC7pRxZF+hEDqBj+ST79kVmY+l2n7054O4umESRyViuK
	AGFPcCVgmxX5hT1Yn0CstAoXJ5LrAC038F3Ga++8vnD1kAsX7OspZcq7IFklk2mXxf453/J4W9U
	tPoazMddheRBNbB6nyRkG9BXUtSYdZ2yjOdMQcFip2nXKicpoY=
X-Google-Smtp-Source: AGHT+IF7c1Vuxskwry28TIxl0fMtYzqbtx+tBLSfDt71UAkuiIb3LaxfXzXjmqXnRcWpmOVNDKsjmYs5K4EhIxamz+w=
X-Received: by 2002:a17:903:22cc:b0:248:ff5a:b768 with SMTP id
 d9443c01a7336-27ed4a29f9amr152736995ad.10.1759092961471; Sun, 28 Sep 2025
 13:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
 <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com> <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
 <20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com> <1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
 <e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com> <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
In-Reply-To: <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Sep 2025 22:55:50 +0200
X-Gm-Features: AS18NWCJbZWjP8ynFS6Veu9yFpZpvyV0QmDxpZo6qHFoQpkPGQRYQgKjOrmkB50
Message-ID: <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_135602_540626_B809DBCF 
X-CRM114-Status: GOOD (  21.20  )
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

Hello,

On Sun, Sep 28, 2025 at 8:41=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> w=
rote:
>
>
> On 9/28/2025 2:05 PM, Chuan Liu wrote:
> > Hi Jerome & Martin:
> >
> > Sorry for the imprecise description of the glitch-free mux earlier.
> >
> > Recently, while troubleshooting a CPU hang issue caused by glitches,
> > I realized there was a discrepancy from our previous understanding,
> > so I'd like to clarify it here.
[...]
> An example of the clock waveform is shown below:
>
>
>         __    __    __    __    __    __    __    __
> ori:  =E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  =
|__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91
>                    ^
>                    1 * cycle original channel.
>         _   _   _   _   _   _   _   _   _   _   _   _
> new:  =E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=
=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91=
 |_=E2=86=91
>                                        ^
>                                        5 * cycles new channel.
>         __    __                        _   _   _   _
> out:  =E2=86=91  |__=E2=86=91  |______________________=E2=86=91 |_=E2=86=
=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91
>               ^                        ^
>               start switching mux.     switch to new channel.
Thank you for the detailed report!
This is indeed problematic behavior. I guess the result is somewhat
random: depending on load (power draw), silicon lottery (quality),
temperature, voltage supply, ... - one may or may not see crashes
caused by this.

Based on the previous discussion on this topic, my suggestion is to
split the original patch:
- one to add CLK_SET_RATE_GATE where needed (I think the meson8b.c
driver already has this where needed) to actually enable the
glitch-free mux behavior
- another one with the CLK_OPS_PARENT_ENABLE change (meson8b.c would
also need to be updated) to prevent the glitch-free mux from
temporarily outputting an electrical low signal. Jerome also asked to
document the behavior so we don't forget why we set this flag

Both patches should get the proper "Fixes" tags.
I think it would also be great if you could include the waveform
example in at least the commit message as it helps understand the
problem.

Let's also give Jerome some time to comment before you send patches.


Best regards,
Martin

