Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43565C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjzTiVXW2/y+MU8ujdi+EYr76HH3zaimBCpOT0o3bgI=; b=SmuEWCvbJ47g0LV2LQENdmob89
	7vbzKOpv+QxK2zRslDS5kTxhQk24t/3xI+31OXjSij8eDAEoNWjhbusorSJyySt6Un59RzHMp7Yn0
	lW2JWxWO7LPF0XheBlyABWKnnX53/kMQHwmqmwxF2j2PyizwqcixfPahjHXo418INMmyJ4Uf7lkz4
	BQH6a7P+tVYANsgQrmAdHFvYrj6HeVaJuvjX/FQsMofLVIPsdwHDnLx1W/SIuEhvnGR3ogEBgdw49
	7WCbbrP5CKc5wjxY8kaqfRbxHSVCSGyXh+FwbP1HxAVvTc/1p68zPX9ieNDTHoesWlj7YHWnSuIcA
	spIzR59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6Kq-00000006n04-0iC1;
	Thu, 06 Aug 2026 22:13:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6Ko-00000006mz4-2Wpy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 22:13:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6D2640545
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 22:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB291F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 22:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054385;
	bh=vjzTiVXW2/y+MU8ujdi+EYr76HH3zaimBCpOT0o3bgI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hLHo7vAfuR3iX5N3dSh/v5YiHmKofEzbCGMRnW5ZtjHIcnWMSdm/PGkpNgggjnE8o
	 ASNxZzhQ1mGUB4ChfjpQygQo6C54rznb63Nz2Wjd9rNLjMzFrrUJsCT9PebR4yFSaX
	 s0JEmzfQZgPGdSDoegb4zlDyT4KY3TqytVolY1caalzlSmAvBqjFYXWOPSoWJY4+0+
	 tfxiMuT83DM6M94FzDXpH07AxhvLifTlTcapKBUw97Lb17TlwpKrFAQe877W2pZS7K
	 O2/4Osr2CMF124x9Eh46GOTEwv2pRgovVlbdOTYo0wgvqfFtM0ufjq6VKLBhFL99+o
	 nukkIiuEloK0Q==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39fcdaef6e2so12795171fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 15:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjM25quYicF0IG5nk4HiuGPZql+6Na4JUSmwUb1fOYk7eo7ImTrzi7osFH6NktakU3N6SJ2EqfH8cs2jiQSKg5@lists.infradead.org
X-Gm-Message-State: AOJu0YyrO5oZZyzKHcee69s7Zr+9hsWB+lSN6S5NcI5Nh0QlVPW4I703
	8hgCe4Zc74x85JdxkQryOdnG7fhGsolEq/xQQP2KRmONUSLWivC+/zh72UhS6SAjgwIQhPeeLhz
	oZsAqmH9LiwVYJBpde4HrRqoXCekhhyA=
X-Received: by 2002:a05:651c:198f:b0:39b:b6d:59a1 with SMTP id
 38308e7fff4ca-39fbb0622a3mr22304141fa.3.1786054384637; Thu, 06 Aug 2026
 15:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260803141028.710706-1-sjg@chromium.org>
In-Reply-To: <20260803141028.710706-1-sjg@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 00:12:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLn8nZT9a0Qe+wtk+2zJ5tPvHjAq4PDPt18ANWiyJPdXpw@mail.gmail.com>
X-Gm-Features: AUfX_my-q5AZNQnyrDKzTBxgtSjpIToNkuwuVSkTL2dNFQAFVD3IOuhBlGJ6384
Message-ID: <CAD++jLn8nZT9a0Qe+wtk+2zJ5tPvHjAq4PDPt18ANWiyJPdXpw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: rockchip: Two fixes for latent driver bugs
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Vladislav Leonov <vlad@zlab.su>, Jonas Karlman <jonas@kwiboo.se>, Fabio Estevam <festevam@nabladev.com>, 
	Jeffy Chen <jeffy.chen@rock-chips.com>, huang lin <hl@rock-chips.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Simon,

On Mon, Aug 3, 2026 at 4:10=E2=80=AFPM Simon Glass <sjg@chromium.org> wrote=
:

> This series contains two small fixes for pre-existing issues in the
> Rockchip pinctrl driver, found by the sashiko AI review of my RV1106
> series.
>
> The first makes the SoC-data calculation safe when the probe runs
> more than once due to a probe deferral: the pin count currently
> accumulates across runs, shifting every bank's pin base. The second
> aligns the RV1103B drive-type override in the get path with the set
> path, which restricts it to bank 2.
>
> The first fix is tested on a Luckfox Pico Mini B by forcing the
> probe to defer once: without the fix the second probe doubles the
> pin count and no GPIO bank comes up, while with it the values are
> recalculated identically and all banks work. The second is a
> behavioural no-op until drive-strength decoding is added to the get
> path, so it is verified by inspection against the set path.

Patches looks good and the Rockchip maintainers haven't
commented on the other week-old patches yet so I applied
these two patches.

If the maintainers have issues with them I can pull them out.

Yours,
Linus Walleij

