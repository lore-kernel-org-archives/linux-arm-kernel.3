Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A7AE6B240
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcyVnre0jfOXE57f1aZ6yOpuSdrWU3Uetk6AKG4MKck=; b=g8ihpHY9DIZDl8aVSCj4mInFe5
	ovi3Rvpz/duFLnkEzuLzXWCRwlpczxx3DRuu6zmIUIu8CzHWAcLD4zyKx42Kis3/EbvsQ1UEY0mjg
	iWNFYswIFfLjpNuG30KMRfR7T1Lr35hjw6BwpeRRf6XN+L6yjjNULio3uHaNk5kb58RpDKpQYEkHI
	MGNafjHUrEwbL0FgbQVYZMWvRrWDpnsup66uQF4pQn3FFMoBz8BFwbAHYexkWG7EHiAFSSfrt7chH
	Kk1UACJ745KXnjiruqCUpcfgVu7YF4FADl0xmG+BzbbkmJTkXkYty9XYzieQR+O5ZtTojX7REGg4N
	c7g4wFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6pUZ-00000006hK8-0gy1;
	Fri, 01 Nov 2024 11:06:59 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6pSV-00000006gpZ-1mtw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:04:53 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e309d50f194so1786758276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730459090; x=1731063890; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcyVnre0jfOXE57f1aZ6yOpuSdrWU3Uetk6AKG4MKck=;
        b=SVKMJXXfeRYuoiN6w3yDWlRyMjkm2gpn3hTy62y3U+Gt0NHmLLe1wUU+wQd1WYi8qX
         Cl/5EmKOW55iQgX9X6eq5I2Vrr+Dabf1WIG5sqh/158G43vRgMRhMdsBE6B0s7iaRpAt
         owhg+GCONS/F0HSlsR+VsX4mcPGaF1qWmaocI4DH/3Dub41owp8wMVp8SQiRvpife7TU
         q+BhCj1uxIM4Roa9LQE+ixb6N/LobYJRYN7ACbXdeb1Hb95cXxwERy14RKi+/VkW9gDy
         eZcK52yR+RuseOHNuWqw7cLQwxqWFmeehgq4tzSiVGd87AzXbboxdy7ljRmFGjeUW3DM
         ge0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730459090; x=1731063890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcyVnre0jfOXE57f1aZ6yOpuSdrWU3Uetk6AKG4MKck=;
        b=oFNcd5BcEKcYYSZy/eHij/FCdQcZVM1MmgmB7+dwiiXyw/Gd3a1Wk0eYcSOu4EUYI5
         OKgj1NB26aFeewOfQA3SW+Yjgjlskzw65pgcCaCw9v08GejtBihfZmDFwYMoOJodsdf3
         fzDhIcf9fVoBQpIfwcMtxV1moLfhTEYEz85wRd/ni3p/ekxeTkxgAnZjYdpprywCr1z7
         V7sc9XI9RRteSUAXSRrqloTflGqe8iHRWN3HbZxF7rbfb6zynJCwTRE5L+fuSvSN297h
         mcRyIifbqpCG19oUl/hse/5OPAMil0Rd6CtKoA9foVWscUgQOM2uAMNn97mJdoQQF5KV
         hWsg==
X-Forwarded-Encrypted: i=1; AJvYcCWhKUl/NXHig9wqtWhJu4DbxRPpaoKiMLGaAg4ZSEhuCivMaSoQWOYW6LgKE3SPjvWm5eHxU0wmfn00n+4x2b4E@lists.infradead.org
X-Gm-Message-State: AOJu0YwRdfzRxArZIx46hwHjbF2OxP6IsAiaXEZBULhEnouAZUqseJnp
	NlBiZIEiaj2ylnFQwTqGj31Qaf07kS/UX55w4C1l/UssDK5k25McZ6PPOKg9OYsx6XROd8TkAec
	3+KtJKMNQf+gAdW/IryaSn3IWJ+CsQ4Df1P21WKw++lwCx5r1UqE=
X-Google-Smtp-Source: AGHT+IEm0w4Bc6bpa9fFzIh7gFznHA6TyOg1AJUMCvNz0eEXmCXuB9jRIMZyo30oCm1/Jxs53bamqXzVvH4THAHgov4=
X-Received: by 2002:a05:690c:7289:b0:6e5:a78c:5795 with SMTP id
 00721157ae682-6ea3b9a5f4dmr86832957b3.43.1730459089626; Fri, 01 Nov 2024
 04:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240912152538.1.I858c2a0bf83606c8b59ba1ab6944978a398d2ac5@changeid>
 <4920950.GXAFRqVoOG@diego> <CAPDyKFosf_+m9j8YgHa-PsC2SV8+Aou2O6bTbMfzGBpQ2sY8YA@mail.gmail.com>
 <69d06c04-cc8c-4435-a622-33d5dcd1fa24@arm.com> <CAPDyKFoU=AoQqXov_-qFo8xjEbiDAk9mtTtCR9HAYz_gg-bnzQ@mail.gmail.com>
 <eb96b240-f3ee-4057-b016-c746d48cc1b4@rock-chips.com>
In-Reply-To: <eb96b240-f3ee-4057-b016-c746d48cc1b4@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Nov 2024 12:04:13 +0100
Message-ID: <CAPDyKFonhL3JwN1TDrXW-0=VgZowBqTpHsi99GSRmW+aN+4ELQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: rockchip: Keep controller working for card detect
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Robin Murphy <robin.murphy@arm.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_040451_471351_8049F5E1 
X-CRM114-Status: GOOD (  30.11  )
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

On Fri, 1 Nov 2024 at 08:59, Kever Yang <kever.yang@rock-chips.com> wrote:
>
> Hi Ulf, Robin, Heiko,
>
> On 2024/10/7 17:49, Ulf Hansson wrote:
> > On Fri, 4 Oct 2024 at 19:34, Robin Murphy <robin.murphy@arm.com> wrote:
> >> On 02/10/2024 10:55 pm, Ulf Hansson wrote:
> >>> On Sat, 14 Sept 2024 at 13:52, Heiko St=C3=BCbner <heiko@sntech.de> w=
rote:
> >>>> Am Donnerstag, 12. September 2024, 09:26:14 CEST schrieb Kever Yang:
> >>>>> In order to make the SD card hotplug working we need the card detec=
t
> >>>>> function logic inside the controller always working. The runtime PM=
 will
> >>>>> gate the clock and the power domain, which stops controller working=
 when
> >>>>> no data transfer happen.
> >>>>>
> >>>>> So lets skip enable runtime PM when the card needs to detected by t=
he
> >>>>> controller and the card is removable.
> >>>>>
> >>>>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> >>>> So for the change itself this looks good, i.e. it fixes an issue for=
 baords relying
> >>>> on the on-chip-card-detect.
> >>>>
> >>>>
> >>>> But for boards doing that, the controller will be running _all the t=
ime_
> >>>> even if there is never any card inserted.
> >>>>
> >>>> So relying on the on-soc card-detect will effectively increase the p=
ower-
> >>>> consumption of the board - even it it'll never use any sd-card?
> Yes, this is how the controller works, the controller needs the clock to
> make the detect logic work.
> If we use gpio to implement this card-detect, it works because the GPIO
> controller/clock keeps working.

Right. On embedded battery driven platforms it's quite common that
there is some always-on logic (maybe via a PMIC) that helps to take
care of these GPIO irqs.

> For the dw_mmc driver support, we should support both kind of implement
> due to the controller has this function,
> so this patch is for the card-detect implement by the dwmmc controller,
> the controller need to keep working
> - only for sd-card (so not include the "non-removable " device)
> - also not disable rpm when "cd-gpios" is used.
>
> For the power consumption, I believe it will increase, but very very
> small, we can't even monitor the change

Right, that may be perfectly correct on the platform you are using. On
others it may not.

In general, it's a bad idea to keep devices runtime resumed, unless we
really have too. In particular when the are shared power-rails being
managed by a power-domain, for example.

> if we use the normal equipment. The driver should make function works
> first, and then consider the power.
>
> This patch is to make the dwmmc function works without gpio's help in
> dwmmc driver,
>   and has no affect to the gpio option, people still able to use gpio to
> do the cd.
>

I understand and you certainly have a point.

However, it sounds like you think there is a drawback involved to use
MMC_CAP_NEEDS_POLL in this case? In that case, can you please
elaborate why preventing runtime suspend would be better?

[...]

Kind regards
Uffe

