Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A83FEA83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/d227tN7do1JSmsHAQNKTs0yUvoqksEIgK5FnXWPbw=; b=ZD09ZbMuJXpQa0Uisl7DvrSzYR
	9vaFcG/fJbDZnvxi5xEj6KX2tmZ7JUilKvQHMb33OXUXTGM+nqDUQZ10fv30Gwbf08h298K9Do8dj
	prPw5jc5Weun4k3aX/xXzAslbTQ/1CY8pLzooGdnstkmBNoGrcxW42CMTOwmz6xB30j+XE1Fmb3Uz
	IsIVQ5R8RX4mz4vK7b+tu6JW9l3XNyyuU9L9WQyoTq/HxPRbtnBWhYYeONxbz/hVgEjI5SCNiwZ8+
	cmCgVrSqtDdeMHWYyA0BpAwvJbbnNUX2YrgWijN0WGwm7hA/7UVUxVgAXGCHchfGDrUQa75+JhYrR
	5KUVgkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LPc-000000038cm-356D;
	Wed, 25 Mar 2026 10:24:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LPZ-000000038c4-3Ksv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:24:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C2DA4004E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 10:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8CCC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434268;
	bh=DQWAjarmAEIR12f+N5kRbQsMdjqbb6LUni3iSD57BnA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bEQrkKEzQxDGG2rRmwMwwzN1PH2pUmPqRZOMb7514c+kC5R2sVannMWLpgjySJZVe
	 mbV+bE/TRHqs/ehwzg20kGw9dIaKov4LyqKeOg0JDwDgW84Bk2zOWCJ1thteWuIOKm
	 pTPqPAOOCcooBmPBydv03XO29dmd9KDMaPDzA9ew2sjRhNnTsRP0TnNTwZy88n83Z4
	 cuY6nJP5L7IN/VFyC6ZCF+m8vEywUbh4PWv31+bbtWma0mkO9TK79+f4Jf0FBzGmtc
	 dVefH9QRJYh1T75xstMx0JOCKh6AZjLbU93SSPNR2iI/no0EE4DyOjTxgZclmdErBM
	 DNK+jKKaLi7Bg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38bf85e4810so17909491fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 03:24:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDfWiogb6JYTXvXpYZQsjDYiZmEgMco21HFhQQ09deh5V0u6VsJjtVRKTxY8kp65lV+RoL55RqjYWy4AoXbLCP@lists.infradead.org
X-Gm-Message-State: AOJu0YyfPTIA8G/WdOCqgIsGBj4fCWfJKxG30OLDzMOlxWtbJ3bvZdJM
	qkU3Bq3wmNljI5IgUGrdSpN47ZInO7F5w8xkyyWUIVurzbmB3qnmrzUWQfca+KLAl3z3NPj30El
	0tRAerUYtKsJmNvwN0IncU+Wl+hSFmw5o0POI2tUZ+A==
X-Received: by 2002:a05:651c:1582:b0:38b:f0f0:e3cd with SMTP id
 38308e7fff4ca-38c4320ca56mr8033351fa.36.1774434267149; Wed, 25 Mar 2026
 03:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774283146.git.dan.carpenter@linaro.org> <CAD++jL=mz5jOLkq6GA6ZWzfGfFnVOLTCoXKOd38YHj2UZaZ9ww@mail.gmail.com>
In-Reply-To: <CAD++jL=mz5jOLkq6GA6ZWzfGfFnVOLTCoXKOd38YHj2UZaZ9ww@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 25 Mar 2026 11:24:13 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me2pyUshFZeXqWU0DF2eTkNjNvVDUP3LL9DO0ZfMOPJDA@mail.gmail.com>
X-Gm-Features: AaiRm50nqwnVr1AXzgZWPax30PNVL9bQfMa7oruOnr447gPeYYgO3Xx86_ZMZ5g
Message-ID: <CAMRc=Me2pyUshFZeXqWU0DF2eTkNjNvVDUP3LL9DO0ZfMOPJDA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: introduce a GPIO driver for SCMI
To: Linus Walleij <linusw@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_032429_870543_F1D92CA7 
X-CRM114-Status: GOOD (  16.46  )
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

On Tue, Mar 24, 2026 at 2:11=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Mar 23, 2026 at 8:01=E2=80=AFPM Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
>
> > This basically abandons my earlier attempts and goes back to Takahiro
> > Akashi's driver.  Here is the link to Takahiro's patchset:
> >
> > https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@lin=
aro.org/
> >
> > v6: Fix a build error when CONFIG_PINCONF is disabled
> >     Fix the dt-binding subject and my email address
> >     Use pinconf_to_config_packed() instead of PIN_CONF_PACKED()
>
> v6 applied to this immutable branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
log/?h=3Dib-scmi-pinctrl-gpio
>
> Then merged into my devel branch for next.
>
> Bartosz, you might want to pull it in!
>
> Dan: thanks for your efforts to fix up the remaining hurdles and
> bringing this to completion! Sometimes the last few % of work are
> the hardest.
>
> Also thanks to Takahiro for this idea: it worked out just like you
> imagined.
>

Pulled, thanks!

Bart

