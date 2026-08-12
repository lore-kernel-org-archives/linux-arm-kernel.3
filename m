Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96402C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 04:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=; b=nJ1BY2KUqlDcRKwFJdf78zsQSt
	QPNKrWZQr3l39riCac1es563VqkYwUIclJ7eWe6ShqSHmMO20+N0hIF8bQvy38S9RygbSEs3uPAUc
	lUz3Wn1OUJbs3CffR0FwpZj9MbfDaAf8q7Yo7LxHEAsGIAT3J7BTXpXEnbl0Haz2i2LgTdIRAXjOG
	IdD7SnwD6uXfobddbKVIxIQshL9vW5d7y3xavUcpsne1hOXcSa8K3UEE+u8G8ViPzyuknZ/K+g5xh
	NFvjebkBvOMs+8AtFs2WsXOKPNLwj7GFi/4eRNVM+P3g36pf4or7HndB9T3XRka0v584lkKVV5/T2
	ksZdkhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0kw-0000000FPHO-0bgX;
	Wed, 12 Aug 2026 04:39:58 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0ks-0000000FPGd-46uq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 04:39:56 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-455ca262ccbso319182fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 21:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786509594; cv=none;
        d=google.com; s=arc-20260327;
        b=mQnlbOX864OosxaHf7uJSueDgMrlDm8FUtWgirEDw7OSV/bqWq5N8+z4+K/PLGAxd6
         GmUVNKdWERP99pyVKbm7iWno1VgG8lDyOuJtHRAhnCXMbHMAzQGxpXd68OPPdbs6mq+p
         9SzdLgS6rhiGRUK4QirBOoA+MU1J18paNTUIeZMW+X1SwcnWiRJqE9+Cu5/Vr9sd2nqM
         RnA3clkU63FUGz54g7GPmbQCbFvpy5MrgTdfPTPe/gYQJqTnGhzGhusSGofCZgRaWSIS
         /W7GHlwR5/MJypq4PrTWIZcbhWGsaXCfSTsLiLaiZCYLJ1pWGuN5/qtYjhFWZT9ZDYt7
         BBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=;
        fh=3vjQGoFr4cliw0aN9TCWKaymyAR8GTBoFqTVZ4YUJzM=;
        b=nnClfe4wB8P/g65snwJqKPvj9+pvdGXPLCDRMyJHpAKpV3kXe6z2fKNhO7/6wt6XYC
         /fx53qwO96VgS3g2zJLBnXUo0mAaiD6Vbus4bpKAL2Df/2squGfm1ybc9NM4J/JdDdmx
         wZPrvXc65uczn6RhZCAiH7EUg3GxGUVBzTz8eLg3oJ0dsu/0KOmtOfcTTovCHtHv3pan
         Q8FsPiiYRxfLBVKtuu9EhttLhXOFZjPqPjS2619pIHlHd8YTVl/JaV8KppojSIQXvGmY
         cEYyamgxCRA7aOWqDiBlfFv5fDkyZI4h1e2XVZGc+czfuqXV1YLzrex7M+2GzpXILokt
         qF3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786509594; x=1787114394; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=;
        b=Iup0tSiz9+wfJSEVRQdeBRVC9XX1egfRngUJEofTm95UGhO8gvkO19ZLKtmbRCEId2
         ixvKcKbZSS6iDCvHoasCZUoZPfl3o5OrfaLdJpYTzRKeVbm6RIQ1LCJE70Wg9rWtYfTC
         ZivLYf8ybyDsbLhrRrF99T0+HFBe8j7PxhEsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786509594; x=1787114394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=;
        b=i93cm6x3zf8ysIWe6uLR0uemYk8V22GHhCMUvMt6kuCAxedzplHLDisaoJthFdiNVt
         oGdU3Q44HtXjg1KW3SVkSnR5rbcH7OoJzGc9Xth/11zYOZW+D0nD0et5rhRGNwZrRNM6
         ZVzAJ9QAcbmQfoqiPYDhTFqePm7q3GLCCTv7RbbT0VnMy1XauhgpeTDO+kJWZZnYIscS
         RToIu2vFeILkif4XtJXU7IAIS5yZEQok5lEPEeSZJxT9iY6sVx5lG/7m2gce1xGUgomR
         MlP3gb/j11G4xbYtit0CjRCZxLRnWqFf9H+OqcZ1+rIYrWXtzir5LTeso+KkDuDWRPj2
         /tig==
X-Forwarded-Encrypted: i=1; AHgh+Rp2r/MWbJfypwJJDMAymsMmsQrUxH/kTJccqG9tz4FBU/jU4CY3/bm9kecD7dgDo6p0ZHoOKNM+bZqZrA8n9VBs@lists.infradead.org
X-Gm-Message-State: AOJu0YyAawviGOFSe+7/ABVSjI/d6d+snJnJKwpteF45vO/Ix9wqUte1
	VSmH7I9xz+43TvJIIZ+2S7kbHAtUG4cS1rI8QUTSW1Wjdcyo4EYOyZWl0AjQXHiBiRTJSGFixsD
	3uOmgK13fy4DQ2rRSY9IKwlbpFtWaWcUE6QY9VQiq
X-Gm-Gg: AR+sD10jbOjXxUPpQ+CaxShcjJckS9cmMFYlwjr7wCNnCsPi2pShc99iIlEUCyPNWhC
	6B8WOSwmvR72714ZTAMhKy92a+Gjhe9/Px9DebKcq6a62tcmSCz1xUw0Vt+FaceJecYAzy9ALCw
	PYr+SeNE9eXgfvUxzbSznPZupNjU4RGoQe/WbzMIkw8vWU7HDYLwvgdRkmm5lpYqBu904sUXuVf
	Jz4Oq5fGqw0muSY9u/gn9ebR7W6b8aHU2aTF1i7G2lYQzK1f27Ghnwf60gBwubNg/y4sqBH1StK
	cLcfSgWRRjhvtCTL5wyfN6zMOEPCWeggEQK1TV92AxouBd583X8wyGk90JccNnH5Rgom5svjglp
	s9y0tkQA=
X-Received: by 2002:a05:6808:2f13:b0:495:d7ec:b6be with SMTP id
 5614622812f47-4b210ca8dc6mr1833103b6e.18.1786509593853; Tue, 11 Aug 2026
 21:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260811122011.3539250-1-wenst@chromium.org> <20260811122011.3539250-2-wenst@chromium.org>
 <99ad23ba-f8f2-404b-960e-1c22a20c9ac4@sirena.org.uk>
In-Reply-To: <99ad23ba-f8f2-404b-960e-1c22a20c9ac4@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 12 Aug 2026 12:39:42 +0800
X-Gm-Features: AUfX_myPgwTrMoDWlXxd7K4JTdOxXQP71DAA9qzbfq1hbTylwiYJcqKiFEh4if4
Message-ID: <CAGXv+5EeEQM6O8Vb8e8fGjRzMe1icmz=cPm3GoKLxvEO=weVcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] regulator: core: Add "enable and wait" functions
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_213955_058743_65D2D047 
X-CRM114-Status: GOOD (  20.91  )
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

On Tue, Aug 11, 2026 at 8:43=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Aug 11, 2026 at 08:20:01PM +0800, Chen-Yu Tsai wrote:
> > In device power sequencing and initialization use cases, it is common
> > for the driver to enable the regulator and then wait for a certain
> > period of time to pass before continuing.
>
> Please don't bury core changes for subsystems in the middle of random
> other serieses, this is the first time I've seen this.  :(

Sorry, that is entirely my fault. I was using an old v1 recipient list
on the previous two versions and that list didn't include you.

> > One case in particular is not optimized yet: a regulator left on either
> > by hardware reset default or by the bootloader, but does not have the
> > "regulator-boot-on" property set. As the enable timestamp only gets
> > updated when enabled by a consumer or by the core, the first enablement
> > always needs to wait.
>
> Just take a timestamp during registration if the regulator is enabled,
> we check if it's enabled anyway so we may as well take that as the last
> time the enable happened.

Yeah, I just haven't figured out where exactly in regulator_register() to
put it. I think it should be after the supplies are resolved, so maybe
I could do this in the "final setup" part in regulator_resolve_supply()?


Thanks
ChenYu

