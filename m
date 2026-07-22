Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE375C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awrVTQ1VekJ4Xb6s/ONNNBSESRBX7h9MN6iG9XhSyGo=; b=zJ99JShoutAawtCML8gpAdV4c6
	8CyzLolg55+RjTGLGpRXh/NMzhL/A82niAo1DqJOJg18V/kt0O01o+4KBVvsij5w+cvqm5s17zCyf
	I/n3HR8azIngAB6HnUrhER9QmVIPNZLhGWhk67cYo7GyJrjDmqmRMJqsryRrvC7DqJ/brQaWIJFRR
	18N/cQW62v8v3DzfQ5ec9WT3a0M4KzUUb4EROUsE46d06SPJ3jXGMJzt00mOE7yFhFXOcdhUt6tID
	G1MUG51uxGYZpGkbqjlExuOC920Ys5zr0eG6n0KTKCwP6syNKjMALt1I8FQ3Fmd7/z87q5yI8KKgK
	AWz9D9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXP5-0000000BxFo-3avS;
	Wed, 22 Jul 2026 13:54:31 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXP3-0000000BxEi-13m0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:54:30 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c1600d040e4so931433866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784728467; cv=none;
        d=google.com; s=arc-20260327;
        b=XTcCstWkTPhiI8Y233Hgls14WgBx5fte5xZsIOn5ZY/dBkMFuJOfLgY1eK492NqJm0
         Pp2JD2DlZxNOg63jjGsLxOtDbpeXRne0hBFsWu83kCIYoWQkkeDmPGFw0p/mZmQ5Bq+W
         2wGUNzHO67vuN109YK+UMF3zUFBaj3BvErYCog2Pq1bc6qqvVmwnj5E2ZhtpkJzuMxSq
         zG62mm4mEw4HYvnozbXho6/1VPPU4oCd+CSWaNmPEdESD3mAiALpqCg1Q20cFnEjmFRl
         3PAaA5F7RKPBolv9rW7cXlfZ3VgU9f+aJWM1cxNSgkDwqrN44DMqYLDgBlz3rwHSqP95
         YfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=awrVTQ1VekJ4Xb6s/ONNNBSESRBX7h9MN6iG9XhSyGo=;
        fh=5R5xT0NDj62buIJ3eLaW0e/cK0Z4QdBw2aRucK4+r9g=;
        b=DxX8FVVWR9JpFj+vTicsQh3sKUARICaAtioBqwztNk9XILfTwG3AhwZzZufAVcNW+I
         TAAK7IXrNYxLPwGnTt4dYAQv+yU8flgKmx9GVpFNT7AJF87yxEAKjVJ7wgbIvezAXLfW
         PxnQI/Rb8hsUGQrKfow+szkOv4ipuPemm2k6Usamukl9MhtE/wUWGd82x1ere6do9u/S
         OGmRxZFyNJpReuDXkjib36h+GZqIYE8r2beaqkYiD0riVHtj13qd78mZZTkzhv3P24MX
         PCuaynNDVUFBW0gJDkvAIJtGan3ItiHL4v0wyUU6K7tY1ryU0HAVUtCfnEH06AOEr7Om
         42Jg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784728467; x=1785333267; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=awrVTQ1VekJ4Xb6s/ONNNBSESRBX7h9MN6iG9XhSyGo=;
        b=YJQStS5etQFoxNNUtOH8pQ9jeZKZ4uelfOUaykZ1Co/4hcWUjefWscRx2HioaKJe2O
         7JI1164riIDbZQQfvrVNIWNXfg26K0JKkp9CkTjXXOv0shtw7YdQSx4JMGjXNzaLcxjq
         MHfBq98zhs4jC9RdAxqGLH/Ss+d6R4JAdit84wCXt3mb++BVwDrhhdS0+8h9RM/3tE6Q
         OSREw+bPS6KkT01XcNu1zs1Q/h5QNlAJIV8dzoajh00GUho3/sx66v2H6PSCBcX7VrnE
         sCnJqFHkfx+cTQ9l7Id7s9bHsYksa/uNHS5HcUFno+e75uS4SllTgbZiRBf014J3DUFW
         IGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728467; x=1785333267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awrVTQ1VekJ4Xb6s/ONNNBSESRBX7h9MN6iG9XhSyGo=;
        b=dyXFXiEdfAFqbhnLaIAhkZ3ApSMUl6hZ8QC+msjYEUO064hxGIgk1Z428iGm9Fr42V
         JzXiK9Q9zdVzLvcETUjkQW2+PUDa0LqSwUZzykaSrKSwgEPET+jksV1ORWoou5w7dHP5
         MWOUS0+qa59jSWPuPDjeBQdDV0Ln9hjpdUdBmJ7pSJ+HjNUQ1gbXghF1nY+Cqew2Wus5
         VmfO6ARLPlp3OR9I64xPEpFKcwjBZhghxW3Pf7gf3EELA3cXoWs0swHDV84lWkrFh/o0
         KzGUdF4m5fBahUReC2t+1FWBVVAqZ7nFRmMeXLbDFjigX9dFjbHuX7JU0fP8V2l0WteR
         SQnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAnEqt9/aAd7SSA1F9YrLQBH8lJDAj0fwEYp/UZIOd64WMTL14PJv4siXwwcYG4jULv7/6ljfHU01f9szShxO5@lists.infradead.org
X-Gm-Message-State: AOJu0YxzaOP4NAMm64rpLmoEf7k3bq88+8rsJtunWPYOQt2O6brZslR9
	v+hYhaTbr8bOymoHVqt6KXTXOwFJ5ISETnXBaxus0+CVR6JGK5g4M1KYaB0Rst+izU21Muxql5Q
	izLz9hWBhn4QgGP4By+clQirk7KGHwtm2OnArZFgLCQ==
X-Gm-Gg: AR+sD13isY99P6ZVsUtm9MrhxcU5a7QlNGFBcJjhIqGgIxVKmXh49wrZ+9dKRnJ0lFm
	zTDS+VB5/0Pu4E48D3JbAPliork2Sh/I38Vk7TgIESJ8D8xa5Ns/cNIqz0bL0SDmMbECpqkNH9d
	erQo55FBEnWXCWeJR74Xn2MjlrmgvTQMVMWZ7vRUO7VxPBWdTGfpBPnlhGaHj6KErQvk/zPdrCt
	G28w93gBm/r78W6ZZM6aGzlp6MwQwNWyypOLKh1piqFUtDE0D6up0i2MIH+K6pvJAlftzCoi/P/
	at7Jn3xwPY7DQ3rKqw==
X-Received: by 2002:a17:907:a684:b0:c16:aee0:5422 with SMTP id
 a640c23a62f3a-c1c30a69e59mr189324266b.6.1784728467074; Wed, 22 Jul 2026
 06:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
 <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de> <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
 <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de> <amDC9ZfBAD2xbhqa@venus>
In-Reply-To: <amDC9ZfBAD2xbhqa@venus>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Jul 2026 17:54:15 +0400
X-Gm-Features: AUfX_mzETQep4O3vKsGAnWDqzknYtAlD9NY9GlA6VK-u5lN0h7PUcE9Fa-TFX_4
Message-ID: <CAKTNdwFEEd2LF0F2E2yR5jPfYB4sh-NaYyXn2GTFwCpACaqAfw@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, 
	Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>, 
	Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_065429_316762_15670979 
X-CRM114-Status: GOOD (  30.78  )
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

Hi Sebastian,

On Wed, Jul 22, 2026 at 5:44=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hello Alexey,
>
> On Wed, Jul 22, 2026 at 02:59:25PM +0200, Quentin Schulz wrote:
> > On 7/22/26 1:00 PM, Alexey Charkov wrote:
> > > On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.schul=
z@cherry.de> wrote:
> > > > On 7/21/26 9:17 PM, Alexey Charkov wrote:
> > > > > Not adding Cc stable, because while this fixes a real bug it's no=
t a
> > > > > regression, as the issue was introduced in the same commit that a=
dded the
> > > > > RK3576/RK3588 support.
> > > >
> > > > I don't think this is a valid reason :)
> > >
> > > I believe Linus frowns upon changes like "it never worked, but we've
> > > fixed it now" being submitted as fixes. It's been broken for years,
> > > and since nobody complained yet, going via the normal development pat=
h
> > > (i.e. -next) seems perfectly fine to me.
> >
> > My bet is because of the Fixes: it'll get backported anyway even
> > if you don't put Cc: stable. In any case, I don't care too much :)
>
> FWIW you are mixing up things. Linus does not handle the stable
> kernels. He does the release candidates and the initial version of
> every kernel release. The stable releases are handled by the stable
> maintainers. Linus only said, that he does not want to get these
> kind of fixes during late -rc phase. That makes sense considering
> fixes also have a chance of introducing regressions.
>
> But if patches end up in a pull request for an -rc kernel or in the
> pull request for the next merge window depends on the maintainer
> applying the patch (i.e. Heiko). The maintainer can queue a patch
> with all those tags into the normal for-next queue targeting the
> following merge window. This results in the patch being in
> linux-next for a while, then being added to the master branch during
> a merge window and then being added to the stable trees (as stable
> only picks patches that are in mainline).
>
> The maintainer can also merge a patch to the queue for -rc kernels
> without the Cc stable. That is exactly what happens for a regression
> from a normal patch in the merge window, since the affected patch
> wouldn't be in any stable kernel.
>
> TLDR: The Cc stable tag has nothing to do with Linus.

Indeed, I made a logical leap here. In my view, however, this patch
doesn't need to go into 7.2 fixes (it wasn't broken during the 7.2
merge window), nor necessarily into stable backports (no-one seems to
have used the affected PLL rates in older kernels, so there is nothing
to fix for them either).

However, it will become relevant for driving arbitrary display clocks
for DP video output because several display modes (and consequently,
PLL rates) I needed for those monitors I tested require new table
entries with negative PLL coefficients. Those would be 7.3+ material
anyway.

Best regards,
Alexey

