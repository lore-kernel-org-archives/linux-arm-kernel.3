Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A635DCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6uac0xj8a+6k+KJ/TLozw+bMuDmR0K+Bzcv/b4RoLw=; b=COFkN1KnIvSgxAW57pUvjsC+Fu
	KIJTlQFdDLkhQS0lwVbruzEFA6xNJOD6fbYWfDT5qGbHn/LZ8ODh9vL+hW+513ggtucomRLaS+lko
	opDr229MFUahh+Xad+2XUUevjoi0zn32acRDeCleRAVlJHcEyJJRV0rztjz0WEfFMRuXSSuUFGgYJ
	lZs5/H5wRyIxXMMHITnvCf+B0aGJEeMhQe9Ri0w66Dpy3JUj7TTUwse9wzYhjfZcxamXBzJiLedZc
	h++nmWBv2JB5z7MuaEt9tWVosqRd7BNmQ9MbSgPrrJK0j7gkWvUI9pSf/b8wpKGCpvLa6RR8Ph7EJ
	9y5yQ9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbh2-0000000AuQ5-3GAQ;
	Thu, 13 Nov 2025 18:05:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbgz-0000000AuPd-3xcJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:05:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so1943904a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 10:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763057107; x=1763661907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6uac0xj8a+6k+KJ/TLozw+bMuDmR0K+Bzcv/b4RoLw=;
        b=P0w1NTnCKWh4Hp0rMJZ9dIygB2NWDvyORcD/q76MYuTj5SmkUFGmB52iEY2fQxCubT
         pmymp+P8jBikipLs9F5lKNeO5bVx92MRF8EA8TZzc4grrdgxz33v0PDujO7tUzhtOP4n
         nes0TsicXKgSvcgtwhLxROFCroRIFo8KRWips=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763057107; x=1763661907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6uac0xj8a+6k+KJ/TLozw+bMuDmR0K+Bzcv/b4RoLw=;
        b=Gfa30iDtM8Z6iP8P5qPQ4VdQYAr+P5xr4OerIUqVZSl3gWtwRFbd+UarmmaYNsi4Re
         +qpakaHdjhu4bhZzrnRf9J+VIne0Ew4zQO7r+0XzWjy/HzEFGw2SJ+c+buTH+yiqbOWR
         tg8nUTByUBA0fM93CahHZjGA5WK2jQH67nR4Fl4KjJdXopIbTVdV47YQ9THuBYWdSR9a
         +OAs0uVii1sAfYWPr401Hv60bSD8bFQJj16Zg6123xgU93jPhYNJQaKuNt4MLPGhRYrL
         dCVtnV8E11NoQiJ8AsnZ6Qp14cRUB0rHesxckmweFfsdV3lHj8JeU6fw5wApsWuTnY4c
         9HiA==
X-Forwarded-Encrypted: i=1; AJvYcCW4aaLfmJChGqk1ivxegDOlHqlW/rmCIwg6n99xFqgABSAy8Sqq6la+3b0hw/KwRDysaMW0nKbCABdXAs0c1re6@lists.infradead.org
X-Gm-Message-State: AOJu0YzpHK+WDY1iLi8AoeegRxrmX0a8woE752Tt/slIV34NXu9VLvCD
	cSf3ho3+esD7RkYb3RauMRr1wyuK5L+/dzrL9MOWFqQiWIWBcjuJK+8343DRg7+BdTriIEO0PRz
	74XTJWWx9
X-Gm-Gg: ASbGnctfCzxcZemq1DuA3JV3GZGhiiw909N/WEFgv0zCLeWZ1BG9YfQsYntMXHalpMG
	wSJjN7J7k5Zsea3R1Ew+EuHtk/8ScRZCXX/jJVCkubyq9LHZwA5PRw0K0Mhff5n5X6ernBf+DTq
	+U3JiQVNYLBQTFnea5GxszYG60JV/L+lQi8Yd8QQid5w76A3V1uKy5USF9aavS2n7ruLZUe/HLz
	I934M4trpW5/1GYdsIJR99LLep9v/zeebojg65E3JqmoPKcBuw7DGgQnpRGAZPL1mMLCMqpBvbr
	xaju8W9dqYbGgQdsvzSG4UBtUtGdNjU7MwgpJ6ghA32Kvql8wElQ9lgW4udU8yiptxMMlNVX1hG
	WD4eZl4cZgeg9h8nrq0k9//nwhxkHYoUs4/oBMkcNa3Z4MDlVOGo+UFreOJJDFZtmmSZ3F4TfxJ
	mZmnMRw0M3mzI1VIyX9HxrmZmwewb7nGnlnTNKRuafQKqIQ55HHdfe3tCJfWddx5zlG1h6atE=
X-Google-Smtp-Source: AGHT+IEtFLVwkAvl651blFShcRjUH2y7BXsAMbf4W01NG5xO6RFIA20WAfFowS1bRaEJDGPxEEfG7w==
X-Received: by 2002:a05:6402:3546:b0:641:4b82:10c9 with SMTP id 4fb4d7f45d1cf-64350e9ed31mr166017a12.27.1763057106710;
        Thu, 13 Nov 2025 10:05:06 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b28b0sm1926858a12.30.2025.11.13.10.05.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:05:05 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so724056f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 10:05:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9jhMKq0asY7Z795qVdL49QP+od/qWt2Qqg252f2u4QBSiQFUo2g16yy+Lev+qX1NDrWB8LgJ2HT6QwDVW6vN/@lists.infradead.org
X-Received: by 2002:a05:6000:1863:b0:42b:3023:66a9 with SMTP id
 ffacd0b85a97d-42b59367802mr289626f8f.22.1763057105007; Thu, 13 Nov 2025
 10:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org> <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
 <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org> <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
 <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org> <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
 <abb77afe-c285-46ba-88ac-08574bd67712@kernel.org>
In-Reply-To: <abb77afe-c285-46ba-88ac-08574bd67712@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 10:04:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
X-Gm-Features: AWmQ_bm88XdKzAi5IStwbrVdXDDrbTXMC9ViB_9-mq5L9vr4mmyrArKaiYvTgn4
Message-ID: <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_100510_029912_7535A839 
X-CRM114-Status: GOOD (  30.79  )
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

Hi,


On Thu, Nov 13, 2025 at 9:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> >>> Yes, the complexity of just "hooking up" the components on an SoC is
> >>> an order of magnitude harder than a Raspberry Pi, but it's still just
> >>> hooking it up to external components. In both cases, we are modeling
> >>> the core "brains" (the part that contains the processor) as the DTB
> >>> and everything else just "hooks up" to interfaces.
> >>
> >> You mix the topics, so I don't follow. I speak here about bindings - y=
ou
> >> cannot have the that compatible alone, because it is incomplete, just
> >> like compatible for "transistor" is not correct in that context. You
> >> speak what could or could be DTB, different topic.
> >
> > A "SoC" is "complete". It has a processor that can run instructions.
>
> Then show me executing any piece of software, which is the consumer of
> the bindings, and runs on the SoC without the rest of the hardware system=
.

Show me something that runs on a Raspberry Pi (the models that don't
have eMMC) that runs without hooking up power and plugging in an SD
card. :-P


> > In any case, maybe we can approach this a different way that I alluded
> > to in one of my other posts. Can we just call the SoC thing something
> > different and make everyone happy?
> >
> > 1. Rename the SoC file to lga-b0.dtf (device tree fragment) and
> > _REMOVE_ the top-level compatible. Problem solved--we're not adding a
> > top-level compatible.
> >
> > 2. Add a special node at the top level of the "dtf" file describing it
> > (so someone could figure it's useful for). Like:
> >
> > fragment-info {
> >   compatible =3D "google,soc-id";
> >   google,product-id =3D <0x5>;
> >   google,major-rev =3D <0x1>;
> >   google,minor-rev =3D <0x0>;
> >   google,package-mode =3D <0x0>;
> > };
> >
> > 3. We can compile the "dtf" file using existing tools into a "dtfb".
> > This looks just like a "dtb" but has no top-level compatible but
> > instead has "fragment-info".
> >
> > Now we're not violating any spec because we're not adding any
> > top-level compatible.
>
> Didn't you just describe an overlay or DTSI file?

Sure, you can look at it that way. ...and since you're happy with
"dtsi" files I assume you're happy with my "device tree fragment"
files, right?

The difference here is:

* A "dtf" file must be able to compile (with dtc) on its own. Contrast
with a "dtsi" file could rely on labels that are provided by the file
including it.

* A "dtf" file needs to have "/dts-v1/;" at the top, unlike a "dtsi" file.

* Kernel (or other OS) build rules will be happy compiling a "dtf"
file. This is in contrast with a "dtsi" file.

* A "dtf" file is _intended_ to be compiled and hooked up to an
overlay. This means it will always be compiled with "-@".

* We can document the requirement that a "dtf" file needs to live
together with the overlays that it will be combined with to make
complete device trees. This means that there is no need to set a new
ABI boundary here and we can be flexible with what labels are exported
by the "dtf" file.


If that all sounds reasonable, I'll get working on it right away.

-Doug

