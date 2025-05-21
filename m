Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8357CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MZeJpkU6VblQ7OtI/wGvp2r9/BzM6xHr8FeygAttfY=; b=X52nKneuRoBaJshlFPRMt9AVUP
	a6UsrVQbcP4aKlQlxv7hiYdJmIM/U12XaOLM9Va9GnzJtWY+/oNdo3mI0jJdRWQxe5uLGG2sTKqTu
	dQCixtCsDUneR8MWuDECYRk3tQAJsY4sR76VXwlmT3pQfu/jja+8d8Iu2AN0Q1oySCUiD0UDfreqI
	S04wQOLkg9HlQi1PNlsKsfVKDPcJ4Yh8UAZKh8rOc9acHZtM6J7M5HXnWW1zg+lKYsZzbjFJBU91k
	ZjF3HWpPjb3iim/mDtgMuTDhDl3nuv0WbcFWoIXc72slzR82n/6UwXIHPT39o5JlykNmHRZq2a2QE
	nLqq3H0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhtA-0000000FfUu-1aVU;
	Wed, 21 May 2025 11:45:36 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhpe-0000000FeiM-1D6l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:41:59 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso6509587276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747827717; x=1748432517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MZeJpkU6VblQ7OtI/wGvp2r9/BzM6xHr8FeygAttfY=;
        b=bgTrdBsKkj1Yov3HG96Xiq0JglCACZwwbRx++A8A+paYsvAczGz2+Pp+YPqBXKR+BR
         j94+Bhlt/2ArFo8stHiGhIsDHyJTMfpAxW0mqS+iFRBkA3Kkshlze97QsgmchMWQx4nv
         RC30fuFuPCf8oXQ3cDmuZoXADwy/sq5FkjEgerO4YeqmVzUU0j1Ie9MD8upaHyTPp/AC
         1dghrP1fxoX57fBzoYCpO2FNDTq/G5DR8ODfLPs31nlagScntmLjz5upI9jFOkjGP9gs
         UtEuVqX5OZsv/ot/5OGgx3cUfTEJk598es7bXb6gVXxgXol4bmrPMk3ho7XTZ4dI+aPu
         TugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827717; x=1748432517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MZeJpkU6VblQ7OtI/wGvp2r9/BzM6xHr8FeygAttfY=;
        b=sO7XTkezDzRSAHbtDxGftFMn7PRK7JLlsv3GGHhlOvDOP02R8u0uGKUesc0skZ1h/g
         4jJMYGgkIjOlG8e2fJ7j5A/m7dDCtYgWyTh+6j1c/ti2RFO+Ef1TofWQ/7hD+n7SE1HH
         YUrG8eEGKW9FEX0T+hyMOcRfYcRIwk6Sv8yfoKyPKKMvVAABpLGHn+3n/7iBWYyKRwIL
         DE9mwU5/VY1dJ9p60jjh9LJEoxLEoClUFjg5vsqXFyC6qR7PDJQQlnqfbxvuz8kI6DrB
         cAbR9Pkg9aGM2KAKOwcpSu3mt65GdY214kTLuqPMjUbqVzINCVt42XsSJiGhNJj3eMxS
         PSUg==
X-Forwarded-Encrypted: i=1; AJvYcCXoCp0E1bcqhRp4i1yGCGDysYugS0+nEExHhvaSAKfJnL+BPLeU2hVdRpcB5BqyGAqngofLNs9tfyTNfgaUgFrY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh9db8qkLkl7QZe4XZF1+QqrOI9MV6X0KxDriwGGvVDomiUZrb
	HaDpMz7vx9Fo2dPxwnS6cJLEsw9yXDQucB2KiynPvYsSnMxiV58OplPsEteDKe7gAya1UZ376wN
	i+rSe/xarBxv86XPlHPdds8RbnqJaqFwBrNWXEzYr8g==
X-Gm-Gg: ASbGnctPrDwn3fkmRodS0bOkycJID15xYjR6kPo0eV64f3YH8Yyu80MA2ntUW6ISTmy
	17cVwlxwCNXNEjNIJk4SrzSaxlX7Ip8L/3oFGf9bv45MPkjDh+ICIX2xdGUOaYrowuyCrtQmoPT
	ZmoI72tGtvknlFwbF9GALcUageJho7daftgw==
X-Google-Smtp-Source: AGHT+IEJRa6TVkfzQ58O9FhFkfZAdhxX16+QFG8CIAfdeWEH8fgSALQEibspuxtnsso331LoIjY97FnEoFxQVh+nbuw=
X-Received: by 2002:a05:6902:460d:b0:e79:67c9:b647 with SMTP id
 3f1490d57ef6-e7b69e857dfmr26356893276.16.1747827717440; Wed, 21 May 2025
 04:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <ab0476382e3342161beda94a45ddadb49b026dcd.1747760015.git.robin.murphy@arm.com>
 <6f0a38e596c0727d0de13a29c9224f71bc7d30f1.1747760015.git.robin.murphy@arm.com>
 <2393836.usQuhbGJ8B@phil>
In-Reply-To: <2393836.usQuhbGJ8B@phil>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 May 2025 13:41:21 +0200
X-Gm-Features: AX0GCFtZEPdXq2RFpP8dY62bvQ_oqyF_Bdfij7jDVf1Di2-SOIPajRHFWge-u3o
Message-ID: <CAPDyKFpTaRZqdpwFnC5DgLjJAf1YawJ1L5OVgwfjnfs7iNyUhQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: rockchip: Relax SMCCC dependency
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@arm.com, 
	Robin Murphy <robin.murphy@arm.com>, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_044158_328977_A6A8A6E8 
X-CRM114-Status: GOOD (  14.28  )
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

On Tue, 20 May 2025 at 20:38, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Dienstag, 20. Mai 2025, 19:10:17 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Robin Murphy:
> > Most 32-bit Rockchip platforms do not use PSCI, so having to select
> > ARM_PSCI to satisfy a dependency chain to retain working power domain
> > support is a bit weird and non-obvious. Now that the offending SMCCC AP=
I
> > is properly stubbed out for optional usage, we can relax this again.
> >
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
> Of course this needs patch1 of this series to get applied
> first.
>
> I think for bisectability, doing this directly in patch1 might
> be less dangerous though?
>

If it helps, I can pick both patches via my pmdomain tree, to make
sure patch1 really gets applied prior to patch2.

Mark, Sudeep, Lorenzo do you see any problems with this?

[...]

Kind regards
Uffe

