Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BF7D12675
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u974lUXvRv6etq/8pbQkXrUsWQ/HwedC4B64gdg+Fz8=; b=Im5zx1E9etPYJ1dirCeHdNDFhL
	b9vspMdJ4Q+AdfHXsHuZBfVfOuUv8oRyrN634Ip4tkTA/eXW5+f01dUdM86Rt/NnTTT1mWjWs9qbb
	8SSeLeYfJnpkBrdiJO2pR4kk2E6oWPWzQe+BZAwXsuaaDXuFfK6JH7eZh4k43ATnwvbLnaaz+6FIj
	5HSla9QG9w0ItUgYafRiQyGeM1u78czHoPDEvTpXgPsFvS5tgNFzlVntNV/RwaeCC15Cd5FlWERr4
	m54Hry0wFGzQafbJlAaM6EJmDLt8Cf7T4P1+NIjCEK4H1wRwFmrfFXsudcAohoozke68PNl0u76kX
	9p9dwrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYSO-00000005s7T-2nEI;
	Tue, 02 Dec 2025 22:02:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYSK-00000005s74-2aC8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:02:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso10800544a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764712959; x=1765317759; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u974lUXvRv6etq/8pbQkXrUsWQ/HwedC4B64gdg+Fz8=;
        b=lxeWj9FpGAFb/dFxsavyM7L685o8SRFEJkL1Yb9g8H2M2RLby2LEFiEuyJTVglhnQD
         L4bUliJjznoPEvXZbf0AcQOWelZyd8a08Q8uLeqPSyF00RTbYYQbpsbgmWsT0PBJ9tZh
         WoYN57p+cdRVVxsedp75tLf2ycLAoWxMENfII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764712959; x=1765317759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u974lUXvRv6etq/8pbQkXrUsWQ/HwedC4B64gdg+Fz8=;
        b=X3fg5fMdWyJ8ySZwUs+UQYczi5AFv16PkC1j/8PRrMym3/gRHeTTIppubMG/adG9lp
         zX9nLThvmeyBT3cgHQVs2ufwSXhi+F0jG4RR9GVVwtG5if7qF0KZILV3ed2SX8yc7rKv
         r1hmYA89fFmLXzgNRYD6AtyaK1DDup4v4FlwkoJggbpKHuXRMMeo523tPiBUwxFQMPiv
         H4Nfc7fSjn4s+oDbV2QTWP2Qlyo1DrUEXGzdllBdB0vCz/Y9LqMssgbwJRLNMncJtrC8
         buk8Bjv0CfoBj+zCdyBgkFgK+MAqz+L+jQqubZ5KeHeyjq499XgpRlZl9DHPDgTROJUq
         rOcg==
X-Forwarded-Encrypted: i=1; AJvYcCUWkOTZZw5hQ43ZawnLHhYjsqJNpLaK7snbTus/IF6MVJuDx8xmarMOKjJp7i4K89ULYz3S4wZL2zWxHEJn9/sY@lists.infradead.org
X-Gm-Message-State: AOJu0YyXOKWwEAKe37wBfv76MZfi4BPHfBHxS83BZeq6UdeLN43efeli
	8d5l4k7i/PEJIBKy1JaKUQFnAo40YXkvFs8KW4X6ZsMel9JizuJKUp9WlmhhCBJ2Ne0vsMTI27/
	hJDIIha7r
X-Gm-Gg: ASbGncsE43M/B1cFilpcqRSkXiA+wRTX3/VIEEtzMcT/i0WEa2V2V9bIuZy9C/RlgfH
	Rl2MuJDZ24v63PZX89uc0TdN3KJJmC3RorkIcppLcqbR3WhwzqvAp3ak04ai0sT+l6czBsvbwjZ
	VmrdI0flSjBbJ2O+y4tz6+M+TuiWSo/Ukb4tQxBrERBTxgFSAYAE+ycThyl//N5qPAjRUufw8FU
	lWmfzknD+/7LRV69/4GE11zew99aw21Zg7H5SowkHhtHc/kPUzjknT9ctXzvcuXq8z+Mhl9bIlR
	wvsO56oX3g6CTsrSSFQb+BgQr7kxHjnfxqqeQvwO8It43R/6JDSFvj4zL06pBF7jL7m0n8in/og
	twBNjNBqyILyLeuYGbCkvJ/bvrZeaaykCnPEfc62mzevL6yqEWFEiYMDSIyqq06FXIIrB/z77Im
	9rJK2qicZcPSH3ngpm4Qt/H+MB6srvdoMnhcfii2CROq4+lPadnQ==
X-Google-Smtp-Source: AGHT+IFJiaAczFrtGoIMmyCdwL46fMuoWHAyZ9XZgvYu+nibybE6wvZi5cHNOMzYgMz9U3dm0DaqjA==
X-Received: by 2002:a05:6402:1e8a:b0:63c:690d:6a46 with SMTP id 4fb4d7f45d1cf-6455445989cmr40860102a12.13.1764712958809;
        Tue, 02 Dec 2025 14:02:38 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035c3bsm16300925a12.19.2025.12.02.14.02.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:02:38 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so2454323f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+7pd11tq72D8lKecGc9DAs4P8F82lVLEHZ93Ou+j6lAr3ZZjewOsB4Wt7mHnHv3ZQF4usFlTjMpa9SGN392Zn@lists.infradead.org
X-Received: by 2002:a05:6000:1448:b0:42b:3090:2683 with SMTP id
 ffacd0b85a97d-42cc1d23070mr45380932f8f.53.1764712956453; Tue, 02 Dec 2025
 14:02:36 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com> <CAL_Jsq+uVyGzi+TniwJQEOFDm=L9=S-aLWfvyDmY-GQD5iAEOA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+uVyGzi+TniwJQEOFDm=L9=S-aLWfvyDmY-GQD5iAEOA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:02:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vn1z0chJZ=q3NZ3mKYu5v=YnuCBWUyStHMtD8NmY+C5A@mail.gmail.com>
X-Gm-Features: AWmQ_bktU_7WzMXkSb0jNKYTqaWWW-X2pb9d9w7tIirVWuCJkv8u5Cj9FxSuwAw
Message-ID: <CAD=FV=Vn1z0chJZ=q3NZ3mKYu5v=YnuCBWUyStHMtD8NmY+C5A@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140246_812895_E6C265A2 
X-CRM114-Status: GOOD (  23.01  )
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

On Mon, Dec 1, 2025 at 5:07=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> I would be interested in some experiments around making this change
> with existing DTs. Take a board DT and add the overlay boilerplate
> (that may be nothing more than add '/plugin/') and remove the SoC
> include. Does that apply to a compiled SoC DTB and is the result the
> same as before?
>
> Think of it as moving from building C code using a #include of every
> .c file to build a single .o to linking multiple individual .o files.
> No one would argue the former is better.

I suspect it would work some of the time, but it wouldn't be
guaranteed. In the very least, the base SoC "dtb" would fail to
validate because it would be missing a documented top-level
compatible. :-P ...but if we ignore that, I'd imagine these things
could break:

1. If a SoC is relying on a "label" that's provided by the boards, it
could break.

2. If any of the boards "delete" things from the SoC, it could break.

3. Board files could have been relying on the "bindings" #includes in
the base SoC file.

I guess the first two things are much more common between all of the
"dtsi" files included to make up a board than they are between the
main SoC "dtsi" file and the others, and the third one is "easily"
fixed.

OK, so I did a quick experiment and quickly found an example of #2.
Take a look at "sc7180-acer-aspire1.dts" and you'll find:

/delete-node/ &tz_mem;
/delete-node/ &ipa_fw_mem;

Those delete nodes from the SoC tree.

I also found an example of #3. sc7180-trogdor.dtsi refers to
"GCC_MSS_CFG_AHB_CLK", but it doesn't include
"dt-bindings/clock/qcom,gcc-sc7180.h".


All of the above could be fixed, but it stops being a "quick"
experiment. ;-) Essentially, if people weren't trying to follow the
rules of the overlay-to-base boundary it's likely they've crossed
them, as in the above case. :-P

If continuing the above experiment would help convince someone, I
could certainly continue it. I guess I just don't have too much of a
doubt that it could be made to work OK. I think it would be _less_
efficient overall to ship full DTBs generated like that because we'll
have compiled the base device tree with "-@". The only way to become
more efficient would be to actually ship the base DTB + overlays.

-Doug

