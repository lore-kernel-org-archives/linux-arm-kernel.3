Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC4ED6EC1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZURydBRs6THPGEYtxtuXyqkrMfiNHxW6djvEvJyle0=; b=IF5TsrUj6WqSaNk7ZP6BXokyDR
	dmUJe+eFCpKzgbB3m4+gkEjlv9ptCGwvJf0IFgmr7Q0hFlreIYdMt5ZpKLTzqZdoLxqhvpaQm6/xm
	PJA10l6Cezpwwps6MwnCka8tD8+0TOYeaOj35z5hHBqmq+0YaXisU3fVnfwkaooYtszHlvyNyFEk0
	ygdzSlWRyWaYAz5NvYsnoUyqWRcViQtv7ZVecASLiclnnETvxA3QRKkdQCoKKtzilmxVEXjqFpnE8
	w7W1LHzXeAoW5dmgwlvgUv7eIgfLgKUgyTPWivVxIPFmJqWFczM3CrQwBDcIWUE6bgG/zohAe2gnO
	m2PG+lCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJHJ-000000092FU-2Yw1;
	Thu, 18 Dec 2025 19:03:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJHG-000000092F4-2B1u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:03:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso11300035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766084585; x=1766689385; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZURydBRs6THPGEYtxtuXyqkrMfiNHxW6djvEvJyle0=;
        b=O77c3+vn23TDwBM+B7uedLi6G+1Qy4Y9N/VKqMIUP2rRbrHJHh1vsS3htWtWWVFiP+
         d7L5k+r0pgS2Gp8J2GIm2ZFhVqEgWSfjcp+KEk5p/sMlnv9RPSdPNhTaOVAGRLJYsrBG
         /ov3mzcvnHhzFdmjplRkOtJhuEWYitd2EN2LR4XFvjAv1euHQgqqt0NJK9aEsQZf+bxY
         cBGzFHquf6EY73qhIWv/qtDU2MSR2prAJRrTYdHbUJb8/QgrYvyFRhhhnDAUM0S6GhAD
         bHtNtJMM4zRskSKLOQQGa1aTBeRsl3FBzCnjXm7kIsqSGggHi5dQ3UFzv+c9FF4xOCJM
         8xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084585; x=1766689385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UZURydBRs6THPGEYtxtuXyqkrMfiNHxW6djvEvJyle0=;
        b=nbnDa7aohM3/VXuoW5inh53JtwKrXIcjgXOWyS9AwRu51o99aAIHGU+0GdUKw8EuGE
         aL813vARiI2EWYY6TopwWH+K8avGbALexedlH1NFdK6BLnu5j7Pj90hoLuT4q4CM1w5b
         2ngwUl4OlZ0/xhw/uc4MgQ+zqTKqZT2IgIXSo/Yg0PlEO3zyMZxGwasuUYcpyw4C2x3D
         dnXIcghntCO/8nrqtr3ftriWYpWthFCTqhiCfh/ofN7vGx0TD4E1SyZxMLhtyo0jMc2Z
         /NaY9m/4slcX6suA5ZEW26dipLLk7yiSJBd3tR5D3g4x8GTU/NMpqDnCyDnO/XlUcCJU
         AoDw==
X-Forwarded-Encrypted: i=1; AJvYcCXtMKpePNfyr58emidlPWIqY11E7sHOJ1lGFcuOgGjLQoFWpZApw6wQZwskZt7D0X0ao/6FD6bOmP1iKG1PxMnQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd4XoEd0JR4l4IBWLZNIheY8wm3CP4+u4KfxCtu5pHLZ9BXoxE
	D+RLWeHzpvA7PRRiYQKOCEV8j/DlcHepaXfCwgQKw7pkjZ/LAfcmlnJ5qWk1XHJjR5MevWN3Yoj
	5ybMGob430Wu+R6f1u0W5VsMOQ2ROyb/B/dsDUNaZ
X-Gm-Gg: AY/fxX72uUu574eoRkshi+mi/9Anh0uZKa/DUZyhvJ+jiE29v5htUI5j0f0XF68R616
	BVExprqDjmruLmq1GTtoZHG5+LUHDFkoLhUowlQx6ixtFueJh3G800guIMYvmkKQIzjFOPmrts1
	XSP+bcJ0fUYilXHBdbD5PqzShHFlDjbxLuZQsFavKsJHzXvdUr7xwi4ISVqUPTqHmIKAmItBYLe
	V2tI0xSWeCAlCWvB54Ad/4Wjrp25CfNm8CPfD7U4PEywR/aw3BpGbFnb+Z0EwlKUuyg4V77Fanc
	lmQwfSbaiJ6xA1/T1ywO3ghyDzorVjuiTYye
X-Google-Smtp-Source: AGHT+IHjlHQlXH87LizBV98xCNNrE/r6NnWxVA8MyqbsxcZpdW5xdnwO9aFCs2usLY1INPEf7TlgBEyb3iR7vLbl1rw=
X-Received: by 2002:a05:7022:2586:b0:11b:8278:9f3a with SMTP id
 a92af1059eb24-121722a760fmr302395c88.8.1766084584998; Thu, 18 Dec 2025
 11:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
 <2025121728-reliably-crabgrass-2601@gregkh> <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
 <CAD=FV=U63F-wxwKDo9be6_X2P2zp6aTBjNghZRbXX1rn4jFNyg@mail.gmail.com>
 <CA+zupgyG4Nov0=jihSApp_3_0hy6YNZMkfOp6Q4-zmERFm10Ag@mail.gmail.com> <067e0b1f-ffb6-4f38-b4ac-8abdf46518ea@kernel.org>
In-Reply-To: <067e0b1f-ffb6-4f38-b4ac-8abdf46518ea@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Thu, 18 Dec 2025 11:02:28 -0800
X-Gm-Features: AQt7F2rN06AK2QuvXUYDJOc3cWSY2JUStjC0ZUUhHBMZr4GDA95FFHyZwdmt4so
Message-ID: <CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJPhJ16xExgko7Dw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Doug Anderson <dianders@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_110306_567923_999FE6DB 
X-CRM114-Status: GOOD (  36.68  )
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

On Wed, Dec 17, 2025 at 11:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/12/2025 02:34, Roy Luo wrote:
> > On Wed, Dec 17, 2025 at 12:14=E2=80=AFPM Doug Anderson <dianders@google=
.com> wrote:
> >>
> >> Hi,
> >>
> >> On Wed, Dec 17, 2025 at 11:18=E2=80=AFAM Roy Luo <royluo@google.com> w=
rote:
> >>>
> >>> On Wed, Dec 17, 2025 at 5:24=E2=80=AFAM Greg Kroah-Hartman
> >>> <gregkh@linuxfoundation.org> wrote:
> >>>>
> >>>> On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> >>>>> On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
> >>>>> <gregkh@linuxfoundation.org> wrote:
> >>>>>>
> >>>>>> On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> >>>>>>> +config USB_DWC3_GOOGLE
> >>>>>>> +     tristate "Google Platform"
> >>>>>>> +     depends on ARCH_GOOGLE || COMPILE_TEST
> >>>>>>
> >>>>>> There is no ARCH_GOOGLE in the tree now, so how is this supposed t=
o
> >>>>>> work?  Shouldn't tools that check for "invalid config options" tri=
gger
> >>>>>> on this?
> >>>>>>
> >>>>>> thanks,
> >>>>>>
> >>>>>> greg k-h
> >>>>>
> >>>>> Hi Greg,
> >>>>>
> >>>>> The menuconfig looks like the following and it doesn't complain:
> >>>>> | Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
> >>>>> | Type  : unknown
> >>>>> |
> >>>>> | Symbol: PHY_GOOGLE_USB [=3Dy]
> >>>>> | Type  : tristate
> >>>>> | Defined at drivers/phy/Kconfig:104
> >>>>> |     Prompt: Google Tensor SoC USB PHY driver
> >>>>> |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]
> >>>>>
> >>>>> According to Kconfig documentation [1], the unknown symbol
> >>>>> would simply be evaluated as an "n", which is what we want.
> >>>>> "Convert the symbol into an expression. Boolean and tristate
> >>>>> symbols are simply converted into the respective expression
> >>>>> values. All other symbol types result in =E2=80=98n=E2=80=99."
> >>>>>
> >>>>> In a different Kconfig documentation, an environment variable
> >>>>> "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> >>>>> undefined symbols in the "config input", but I can't find one that
> >>>>> catches undefined symbols in the Kconfig tree itself.
> >>>>>
> >>>>> That is, the tool seems to allow this.
> >>>>> However, if this turns out to be a major problem. I think we
> >>>>> can either:
> >>>>> - Remove ARCH_GOOGLE and leave COMPILE_TEST as
> >>>>>   the only dependency. Then add ARCH_GOOGLE back
> >>>>>   later once it's in the tree.
> >>>>
> >>>> Please do this.  I do not want to take patches that purposfully add
> >>>> dependencies on config options that might, or might not, appear in t=
he
> >>>> future.  Please just remove all of the dependancies for now, as they=
 are
> >>>> not needed, right?
> >>>>
> >>>> thanks,
> >>>>
> >>>> greg k-h
> >>>
> >>> Greg,
> >>>
> >>> Yes, we can remove ARCH_GOOGLE for now.
> >>> To clarify, we're not removing all of the dependencies, we still want
> >>> to keep COMPILE_TEST for build tests, right?
> >>> Please let me know if you think otherwise.
> >>
> >> I think you'd just remove all of them. Normally COMPILE_TEST just
> >> allows folks to compile stuff even when they don't want the ARCH. We
> >> can can add ARCH_GOOGLE back in later once the config exists.
> >>
> >> -Doug
> >
> > Doug,
> >
> > Thanks for chiming in. I'm hesitant to remove COMPILE_TEST
> > because Greg specifically requested its inclusion in v7 [1].
>
>
> What? No, that's not what Greg requested. Your COMPILE_TEST in current
> form helps nothing in build testing. It makes absolutely no sense at all.
>
> > Also it seems beneficial to get some build coverage before
> > ARCH_GOOGLE is officially added to the tree.
>
> And COMPILE_TEST like you wrote it does not give you that. Please first
> read how this function works.
>
> > Greg, could you clarify?
>
> Can you first look at Linux kernel sources to see how this is properly
> written?
>
> >
> > [1] https://lore.kernel.org/linux-usb/2025112144-claw-recolor-49c3@greg=
kh/
> >
> > Thanks,
> > Roy
>
>
> Best regards,
> Krzysztof

Greg and Krzysztof,

Thanks for the clarification.

Regards,
Roy

