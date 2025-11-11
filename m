Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31183CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeMwXNllT4LhHLeKTaFba9eFWNp9e0Refct3JU/EgW0=; b=y1Lg1ZO1vKuUnsQp7B/SPDRiZP
	tN0yEzjtAlgIKLMnhbgtoOggfl1HgJeuh95m/FRVyrwVu9YRC/n/TYET61r9cctcbS+Fmtf3xi95s
	MTInr+7ws0aMnlsj6Dq43Gp0lUaymb+vDEqCMPLl+4LbXnM72FwPkuDloprFyR3KHu9WDKNdvzQfF
	h7QwBtG51V6BqVQ6nb9kYd9F0wWqpO/FO3qVVTPDjPp2hC8HCeYBSZ1G9WQV/t7r7FzjtY5hsYdRg
	3C98ht0m5ijzKmiXa60jNou+NGehdG6+r04L3e14JjCqMmEGWFJIqF+ItWj0qxzO6JivH0O3Nk1am
	Iqjx+WGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlNy-00000006urr-3Kax;
	Tue, 11 Nov 2025 10:14:02 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlNv-00000006uq0-21he
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:14:01 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-63e16fbdd50so3578453d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762856038; x=1763460838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeMwXNllT4LhHLeKTaFba9eFWNp9e0Refct3JU/EgW0=;
        b=F3yv+T7yM1jZv8zwmlwp9dW/Gs0nS0SLrV5ACFsEnQwjIHCLo6MvGuPW/2kFGF2KGJ
         X/2fiA95dn9ItkheZWNYWtnrBjChl3DOf47cOnPCJyM6EuiG6X0qv1O8mjGZXjxpHSSm
         V6DKfk1DgMpU6R8t8eptxUPh35EDiIKy507hlfhVaIvmVVkUMVGQLjbQWkmviSQaZOHm
         B2iMpY3+DJtcrvGqcBFouKUupAKDnVoTezlkuwVjYENL3wYSYaDipUWZ8TUMvnRDAf/I
         RWQ9f88a7zjPOsabnKHwc2GB9SL+QsGIsPXUUUVM4SBZcSEjWuWvWcmwtqrnihqSrzVd
         2AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856038; x=1763460838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LeMwXNllT4LhHLeKTaFba9eFWNp9e0Refct3JU/EgW0=;
        b=Zilon6Mc+dCWlKuMwGRhgScb/jKzuCQigsA5QSgkD9T2ZQEwOMzvDd+TRPaKocr0no
         0XfCBTecG5FmKXmGUTmvoeDI32Jb9wVFhU8aQkYes6gMc51lo2sWKaptVZbnDx3RnDRt
         zC7p9wIoYy51X6kQNjpMRcP1eex8zJtcBM7ygitlzE9Kl7hyG7VJeAL8igBl/ERo+KzW
         fCWZOnPhDGxpsxWuH1wGcwtfqGHopgGiwJM90ZLzh4YNSR8df4xWivy+uxhuz4Z84+0O
         vF+RTFVCWW+K5wc81MZ8X3htcdwX4/zYedQbw/lkl3ZT/HJ1kzuvx9gsgTHWXnz+ElIt
         EDSw==
X-Forwarded-Encrypted: i=1; AJvYcCXrZ0gXy4cx4w5p5hYMt/Du86sALR2v5R6p7VA6QM1PGBYOPlS9cCkZPtwRoauKspcyEEPbVNf4yZ3SdpYWaJgp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl2ZW23vfBhqZPz7GgDK8Wytg6yPBm5t/YEsYFDGpVXTA5hZB2
	6adD1uwAor8EzzyhQXA9JBxEKt/GKBnjvb3hqgo4sVE+fZYLvdHGxzZgM8cJTYEvYm93+FZ04/6
	LrR0v5BJNNgRKbI2szD3BYZcLMHaMEDGIZaRKhAfejg==
X-Gm-Gg: ASbGncsrnfr6ri3N1JuxDxEim0mlcW6sFXwT/pODVmQBvW08Eb0MYMVJ7mpdceKDB0U
	uMc4PK5Te8J554KnBtzVNgN0vVesUwflYahM/M4c2907O5K67ZmAQAMrMLFwu/N+Li08aKsV85W
	+fhBP0sSTbM7rjlPlPvyNTYzt/eWGmbbSpXy4t6+YkwcYSqtRBHeNtTsHUmYiczv6ecceAx/a8k
	FbJBOGy7rfmoZAfUiZVlSqqMyeS4dFxGIi/fNDvV9Ce7VKruWnU/GPSPWRYibVcqjLmXMQ=
X-Google-Smtp-Source: AGHT+IF9Qzu6zmE2Iio8Nz23xz7uKZaMMjTrJFnhpC9W7T174pmVZm6XJJz8JqOAQn21MLhQ4SKvuQGEPKenwCujUTM=
X-Received: by 2002:a05:690e:dc4:b0:640:db91:33d4 with SMTP id
 956f58d0204a3-640db915617mr7528496d50.26.1762856038239; Tue, 11 Nov 2025
 02:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20251105195007.199229-1-linux@fw-web.de> <20251105195007.199229-2-linux@fw-web.de>
 <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de> <1af7077b-42a3-4efe-a8cb-6117136c8f2a@collabora.com>
 <20251106-strewn-carport-a33a8b812794@spud>
In-Reply-To: <20251106-strewn-carport-a33a8b812794@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:13:43 +0100
X-Gm-Features: AWmQ_blovY8iar-yYYC_DuviA6U5c_hbl8gXmu0oONH393Qf8f6FhAsUxk1NsNQ
Message-ID: <CACRpkdYbcc_0=qwZgLhpTi1NNjkQ88JuOANqTqTfwMrUs_+OfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Conor Dooley <conor@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, frank-w@public-files.de, 
	Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_021359_533448_A6F88892 
X-CRM114-Status: GOOD (  11.34  )
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

On Thu, Nov 6, 2025 at 6:43=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> > > Got error:
> > > said: 550 5.1.1 User does not exist -
> > > <angelogiocchino.delregno@collabora.com> (in reply to RCPT TO command=
)
> > >
> > > maybe this can be fixed while applying?
> > >
> > > regards Frank
> >
> > Eh, have I typoed my own name?
> >
> > So cool. Lol
> >
> > Just in case it's needed:
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> I have a vim macro to a) save my hands typing lots of tags b) make sure
> I don't typo. ;)

Typos happen. Also for me.

A good idea is when you change mail address try to negotiate something
simpler, this is one of the reasons a lot of maintainers have simple
mail addresses such as linusw@kernel.org (which will be my next
mail address the day it is needed).

Yours,
Linus Walleij

