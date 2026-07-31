Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B91C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqGuhJc0lvZLrjwGWLKB/fYoo0jzM7wM4K/RxlMWzzA=; b=HlGXwDiMlzat071Ca2V9qo+c4C
	BDQ3s3T4NIAMXoFDOYG3aYsD454WQrJ9myFTiyJftfRs15s9OVOgOMLYWklh/wh3ReNTE1kpzbUYl
	Pff1IYpAZG6NN4DegFswL9Ad7nyhVhAChoOS0BQcIupwD3l4FwNVLMyuqcqPtZaNplx5cGOI5A2C4
	mki9TsvHP0OxZ2wArZfOGGuCCHb5h06/qT+UUYtHFTeauUIGEAZKQTtuVOEo7Ua82nWXMkkds4hZj
	j0SB4lf4JBHI2n/AbxcD+lhToXQO7Y7S93KGj3nfgJwRS889KUAFEKApnwxvFZAEYJ3bHS01yUo28
	YlJujjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpujC-0000000Dbt8-1rux;
	Fri, 31 Jul 2026 21:25:14 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpujA-0000000Dbsd-16cZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 21:25:13 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so421501137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 14:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785533111; x=1786137911; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqGuhJc0lvZLrjwGWLKB/fYoo0jzM7wM4K/RxlMWzzA=;
        b=FDoH+FQfUnDUQrv8OO43X9+DSn0fj0yXUJNKW9uFiOlCgDfwS079Pw0ROSI7MV4ITz
         4uxTipg1FATtC22+K0OEI95TnVO65enDr3skD7BWbzMcPF48zNWMnSFPu87B1XsVtA1z
         EbFC5emC6gAASVc9xTlf5u+GkkLvnNeZvJopg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785533111; x=1786137911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqGuhJc0lvZLrjwGWLKB/fYoo0jzM7wM4K/RxlMWzzA=;
        b=pgEOqsuaz2AKt8+iJqAJQuVgLv/ORTsI2Rl2/+k+45stHPcfc+rIhWmMtBy3fJfsf6
         QP8t0yZPlIb89c6qR2/59Ow4qnvRs2ItYrnhqslvL7qBFxlagJZkFmsjkqlpavw1/8gW
         MHmG3YxWBfZQkajj14QnhbOfUjQZxmqntYQiFlGPq31fhTFd8BLWlLA+7+GBdcf+B6GN
         Qucu9b8sEtoVKLAeNoAxQZnfvCdd3VbFavrPG0CgPO57c2jV8opjzutTdcnledfQCdDJ
         M9SsmPND/gghPMb5MOkADGWZQkkUwKx4hCg3FHYcNrnqzyQHqbG05Ni9od7DNdchyDVb
         i3Pw==
X-Forwarded-Encrypted: i=1; AHgh+RrbMCCJMswR32W8J/yORwXrZsBthXkguJ7knsTrOnHgdHzvi2AjKzt6nDS5g9pX1RCNV6GM2ZRy3xPjxS6pcOf2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7XkM9apkY0D94TVBxLOz1xf0430oYJGKSqJa3jP1NXlAKJzR0
	mLJ+HMnGSdzBBLGEBDetyf4r1IdXnAH7ky6+Kd507f9Rzgy7R0t+k8NcMN87qgTl4RUqv8+eej3
	Y/dQ=
X-Gm-Gg: AR+sD13dLsmhHWpwKYQMx44ibT5fIG94/ghXcjYtiqmrFGQvLU7iQDW+CENv1bq6qRd
	evMO2QT92eq0j3XnuGuQ2/L1xl8QoAov0CMtBDZWsuAi2Dq4Qvw0ozy/S2XwB3Lp10cVe5bJsTr
	3+zn9fGCo5kA63SMiOYVc/SE1GtP2uNgK+9tbCx1q3GUOWHdSBUm74ZahmGW7zwiKfALcgIAcS/
	i/EE2ndFejwHnEU/0wb8W+UY/wLgwpWGBHg85AR9Z+TnYVUguu0qZVqQ6XZw07igf8OY3+DVnhm
	5uuEaoQRbLlRv7GHaNntCdEUORJpo9c8Rz6iqgn7RRj5cNiaBkwRE/wxnn20jFTXIne5/cukjXH
	bvsBvjaSreaAqIzx0SaOjd8ylG6ZlaCYh9Yu2QTwoWE3kISuU6nYeZ9LYvAjzALvravXU+Q6fRY
	a/4/pPAt9oIS01V9KXKrff9QfQCKh+aVux+Jx8/78V34wNaqO7u5m3J9JUG9LjLV+/1hJZfbHwu
	rXlmvgb7lyRRaQTuEyGVbCM5bbCfafj70BDovY=
X-Received: by 2002:a05:6102:8088:b0:631:23fa:38d7 with SMTP id ada2fe7eead31-75b23e67239mr1469493137.14.1785533110526;
        Fri, 31 Jul 2026 14:25:10 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977e620270csm1604252241.6.2026.07.31.14.25.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 14:25:09 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-963f63fe025so375962241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 14:25:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro5+tlUqeziAp++1Vqtj96ZTFNcfP+ywY2rHoHtZJorcOj0E2b9Z7dXg1wNgZ8HsL+HVWWuc4369MhDqcMuAWp1@lists.infradead.org
X-Received: by 2002:a05:6102:512a:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-75b23356ad6mr1399686137.11.1785533107796; Fri, 31 Jul 2026
 14:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org> <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
 <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com> <CABb+yY05L30Gt9cmF8Hoz2sGwUc1XocZG3vPoKMwEDfRH4tpKg@mail.gmail.com>
In-Reply-To: <CABb+yY05L30Gt9cmF8Hoz2sGwUc1XocZG3vPoKMwEDfRH4tpKg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jul 2026 14:24:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XC=rqmRqEvamnA1SvJzx=NPsygHTO0tYrot9AViooP5Q@mail.gmail.com>
X-Gm-Features: AUfX_myXjwKEOJ-vL5onxMR_Vg-RLEVjT2kJyhDho-rEogDtoe-tql5rKnrLXoU
Message-ID: <CAD=FV=XC=rqmRqEvamnA1SvJzx=NPsygHTO0tYrot9AViooP5Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_142512_352868_970A41E0 
X-CRM114-Status: GOOD (  20.07  )
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

On Wed, Jul 29, 2026 at 6:27=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> Hi,
>   Replying in one place to the two main points of contention ...
>
> 1) Compatible string :-
>    I too think leaving it too generic is a bit bold ... we often think
> it is final but more often it turns out to not be so. But I also don't
> particularly like the idea of naming it after the SoC because
> controller IPs are usually not tied to a SoC. So giving it a
> controller version specific name should be good. I hope we treat all
> controllers as potentially 3rd reusable blocks rather than a part of
> SoC's identity.

Jassi: How strongly do you feel about the above? It seems like
Krzysztof and Rob both feel strongly that any type of generic
compatible string (including a versioned generic name) is not OK. They
seem to strongly believe it should be named after the first SoC that
was upstreamed that contained the IP block.

Will you object if I send a v2 with "google,lga-mailbox-array" as the
compatible string and no generic?

Personally, I don't think this is worth fighting more about, but if
you feel strongly about it then I guess we need to resolve things
between you and the DT maintainers before I can send a v2?


> 2) Single-channel Controllers vs Multi-channel Controller :-
>   Looking at the description of h/w, especially the separate and
> optional register sets and the fact that we are not talking runtime
> ad-hoc links between two endpoints, I lean towards single-channel
> controllers implementation. That seems like tidier dts+code.

Thanks for your opinion. Unless I hear more thoughts on this, I'd be
inclined to send v2 while keeping one node for each single-channel
mailbox.

Jassi: do you want to review anything else in this series before I
send a v2? ...or I can just send a v2 and we can do further review
there. :-)


-Doug

