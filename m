Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DD1E7DF08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGLSQGBxItX/p5vDeLcxHCTPSeYQPRqcWlnQBJSqWY0=; b=pu3Lkk1cC7GgzElyG5S1c0ZrQW
	WOg/fi88EpklgzwotaCl3ZAUaE8rv9WH+Wa1+RmPtwoLQEXEAwbdpw2SvIA7W28XPinxQ8GN4buB+
	MIkuSwFC66ZV4NMmcQXjEd0EhBQqzJZj8lhwOKR7gkHcaki4UTnnOYavWGqmtA+HBWNr7qJrR47TJ
	wQsCxXHD7s5xR5Ku35igpxbxQMKXqf9DwhW4RVTp1YXXxsUZoiEagLG3zCF2WOzflLXn/KWwB/qbl
	d7HJmZ2hR8HdpURFFWbPlC0MZ+K2rwdz2PCdpzsPQiUfxYS0nzh8mhPaY3R946KzqRdDeHODLU5IT
	IwJ7CUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxAW-00000005K7r-2vBr;
	Mon, 02 Feb 2026 16:52:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxAV-00000005K7N-2U66
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Feb 2026 16:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QGLSQGBxItX/p5vDeLcxHCTPSeYQPRqcWlnQBJSqWY0=; b=onY5147C5u9Oan07bna4HEHOCG
	6gomz8U9twcLn4L/6TrUjS8azGVumGGWFaoURpavZ8SUp634g6DMHUFhbgjoDRz7lrIka34lpUDbn
	xku3x8doMUtLolCOzCgm1oGGoawdPPQftWhPeTzGqkFyYW6W7j2bPb21Tt5g21p/x9nIlOoAlLeGe
	OfmOpYzxvJU0noJKUtMW0rHk1ZHnSZP2f6/WhEL7wmmD2MY+r+1KPpFc9MWqQ9aDO4zdzs7Te+PIK
	sx0/L+k4qGTN/TCv2HgU00q/5fWBy/RP25qUXjPsHlMYcTw+QN3eaA3S8bBrLVoNoIv6s75bwbAQY
	XnXuh57A==;
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxAS-0000000EsSj-2qnJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 16:52:54 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-658d4059b79so6937728a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 08:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770051169; x=1770655969; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGLSQGBxItX/p5vDeLcxHCTPSeYQPRqcWlnQBJSqWY0=;
        b=WDnzuC5/dOXgk7nNrh3IFA9PTK0V10lbhOF2z4Clmjur7h07uoFkpb9m3juG0cUqrB
         zAXvVwHglyec9uZOy7Ep+PL14DJ74/WChOpkeRlomgQrsatdnsFQoAIpkWHtIbmlU9Bo
         NTOr9wggs4sZJ6O1M9wXpMzAib+ZTCeD4n8lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770051169; x=1770655969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QGLSQGBxItX/p5vDeLcxHCTPSeYQPRqcWlnQBJSqWY0=;
        b=waVT9mvfyWORzSsoLLfGBNKTmWJ3Yyaku+cXrAMTSxBIupXXypJkZ/MsufjmrkbUWF
         rtiuMDpoh/oc/8g6+mrPv9hdFBZA4H1cIPveXxq8qOxHhJQw4LYw5NSGY8FkzmwvkZj4
         GOaNasulxFq7XazmnaigTY8qh1jcsYJIW8EEYK2r5CD1S3vr/9AQWc1jF7LZtcVdIsMO
         8xHmgZKyekGs24e6bROBBoVqFdhqVkSIAQPvRpPTNjUTR0xV232NdNo1hqzmAdETsmSR
         /QR6rXtrInp5Qffm3aSIg+RkrB9UHjjYFOI1a8ys+G8jMeW0lMKxpt/mvDTB0bWiJK2V
         gmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5NGizibO2uK2+a8c5tJkpY9two6ePj67653T9fBqFCCFUzUiVEPmstoDEYY8II5O+MEBH7sjDhs07H92gbVOB@lists.infradead.org
X-Gm-Message-State: AOJu0YyNim/aOgBgDwzTkGd1XPGlxSKRY9TKqf7VWVbWxlUfs1DOYjkZ
	t8vQlp4+jDTKRrA+r3neXEZSfokNKCEq/CCvvpn8e76M3wTDMprETqUowceyp7V0v+1WeVnN8ZX
	krm8OaPVx
X-Gm-Gg: AZuq6aL1GR7e4/9JFlNaeQ0yNGKgBLrPrO0mPKYnmcP+PCSfLRU0FThqqTgxsLd+esD
	jq7Le0pLMvP/U6woW3JyTr1K8ThYznn2AKxNulshMYglC40jt6Zo6wADF1tQsRp2eZEKUWuM5fP
	XcXOXtWm2CvomBYSfNY41yBI9MTqjkU49PhbiwI6NBcvB55YQV2qD30x3XanctJkXn1nmtY8ULa
	SJYbT6rX/LqwPmVsREnnPhJJwTB7SIdYklRnvadklsMlNqn5UQpbjfYHrJYC6S5QWniSilJJNvZ
	ysz+XytDkq6bc9zqApzq5JZurgL0szJHNtSOf1tvyHdZaWJi1P4M7r4sXH+PwTjjnOH8d7Lc64T
	eaxtkv9LA3mkrWYDVKvYbVyiMbdtFe8DYm6WjmFir0aKN9fMpcpyWRWqkcicOlWOUXZmR9G/Unq
	MKOs1ieQb0WYMnytcH4M4yP6kW8uoEU1rFjQzmLinHd7AMJPo9hA==
X-Received: by 2002:a17:906:7316:b0:b73:4d06:bc8 with SMTP id a640c23a62f3a-b8dff7a1b9amr720720866b.53.1770051169047;
        Mon, 02 Feb 2026 08:52:49 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc69ebsm905729266b.20.2026.02.02.08.52.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 08:52:47 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso43079965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 08:52:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWU3p4j0qeqnhRdlhWEDizgz5jFePPalU6P3ARQHNBfUV57tVmWwXrARFn/Mlf5ZRX3Neg1H0FV6iRCxcZX1G4D@lists.infradead.org
X-Received: by 2002:a05:600c:8b12:b0:47d:5e02:14e5 with SMTP id
 5b1f17b1804b1-482db44e7f7mr158073105e9.5.1770051167405; Mon, 02 Feb 2026
 08:52:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769191673.git.robin.murphy@arm.com> <a00a59dcef3693efb02a8ee942848fbeaeaf05ba.1769191673.git.robin.murphy@arm.com>
 <CAD=FV=ViHWqjMGfYFgHBNRY-ex2vZjMaYoYLJb=vcUfPQRb9FA@mail.gmail.com>
In-Reply-To: <CAD=FV=ViHWqjMGfYFgHBNRY-ex2vZjMaYoYLJb=vcUfPQRb9FA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Feb 2026 08:52:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UKL5mSr3b_0eBuYZ04RFjFLAG1ZRw=JC5wtPy=t7+7wA@mail.gmail.com>
X-Gm-Features: AZwV_Qg8mOHmFnRAdN4OmDJbt-Yo140VuLppfyIQONLjHwqHVTpsMUgdZpTJYuk
Message-ID: <CAD=FV=UKL5mSr3b_0eBuYZ04RFjFLAG1ZRw=JC5wtPy=t7+7wA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/panel-edp: Move FriendlyELEC HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
	sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_165252_783263_D24DFA68 
X-CRM114-Status: GOOD (  19.04  )
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

On Sat, Jan 24, 2026 at 3:52=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Jan 23, 2026 at 11:22=E2=80=AFAM Robin Murphy <robin.murphy@arm.c=
om> wrote:
> >
> > FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
> > LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
> > to the eDP driver, also resolving the warning about the missing bpc
> > value in the process.
> >
> > The unfortunate combination of HPD not being wired up and the RK3399 eD=
P
> > controller's behaviour seems to result in the EDID not being readable
> > over DP-AUX without probing the panel first, thus the hard-coded mode i=
s
> > still needed to get things going.
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> > v2: Clarify issue with the generic binding
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
> >  2 files changed, 26 insertions(+), 25 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll plan to apply patches #1 and #2 in ~1 week to drm-misc-next if
> there are no other comments. If someone else wants to beat me to it,
> though, I'm also OK w/ that.

Pushed patches to drm-misc-next:

[2/4] drm/panel-edp: Move FriendlyELEC HD702E
      commit: 5c323ea948ff0f9e50418119cbbb3d94f2bd6a96

