Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BFECD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOT5MTEYP2VQ8u5u+7KQbLwcVHJ/p6qpOrVUi3vksxk=; b=1A8tKFG/Q7L94xZ2oDh7QWFuZv
	qzJe1hIuQG7CnGiwwip98frdp3C0khWWIgo1B2E0QjGVliPMp1gh/JQerU8GxY9CACyfvfp/UG7Nx
	gpmnbf23tLSDml46TuLxGDfvuAaEo+SENiHjO2gvFyOR8sKJ+FjkQ+4ndoukQC4a3B/ayIaCUXINK
	c6W97vxFulXr0tV2dVn7a1LyAVx+QIEpkVeRK45hKoxyO/k+ZAVX/eZ9JCLA7x9yC33tTaqB1BmBx
	sPx0fi43nw290Wr+q87WTJ9sfYJMq7NHNX66gm0V8TxYFcHNSMaIIUnbPeLMVhXXBpd7xfHIpIZie
	nAP+vXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc73-00000009Az4-3yRF;
	Thu, 11 Jun 2026 09:54:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc72-00000009Ayi-2wmH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:54:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 127F6445F0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEBD1F00899
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171652;
	bh=mOT5MTEYP2VQ8u5u+7KQbLwcVHJ/p6qpOrVUi3vksxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SIckxKSINwjGIf7l4T48fg1y2kmk9x7aEC+/vGu0UF9A6Qh9B5bMyY9IOylsXovbK
	 AnmkAZlYagD1zEJB4COF0YvBXJJGf64I+kXSqJohVUAf6j87qkGpG9XR6Sd7vunu7Y
	 5X+rWk8RW00CJWYV5E2XmJx6JfJGmIIPJo0jDxVuyLlKnPm1dC8UK1p1Yk94UblqPd
	 /R8K1+y0N9RL4Ct26NWRBikXg3w5u3LDTzFaK4CR5AJ0gpi4SpekAMN/q7LJh4/1S5
	 BOXL+zOgqkRYwSvAWIfSRFyXLIVS5s7Lrs7T5NqC5wTOWCTBew1UAaexNNbp5khd+2
	 CNvaweCw+DWYw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39661f81eacso7680701fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:54:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98LSuA6z1vrGQQ5x4UlUAhRhj9y63PKFgy30U48utI0J7qy5Dn/QPyx5QtK2iZ72vFET19l558MX1suJYBy3Ex@lists.infradead.org
X-Gm-Message-State: AOJu0YyPXOfyhFF6Fg4K5HtFvIg8bgS84ldrZ05cyQqs77hU/9YU6mxG
	StKrHRDJJkKZplBFlUdAhiYNgGrumbzRF5LNatuzFTWOIM6KjqQNMHnxQL+jLjt8cSTSOWq+8Z2
	wEumruyOiINzmRl7126zPcGUm3yaGtt68Jyh71i/8RA==
X-Received: by 2002:a05:651c:210f:b0:393:cbfb:6f1c with SMTP id
 38308e7fff4ca-3991a4754d2mr4407831fa.14.1781171650553; Thu, 11 Jun 2026
 02:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260610153329.937833-1-v@baodeep.com>
In-Reply-To: <20260610153329.937833-1-v@baodeep.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 11 Jun 2026 11:53:58 +0200
X-Gmail-Original-Message-ID: <CAMRc=MercPNLWJd7JkGKQh85wwK+58KGqUgAKAYZhXvkC1Nu8g@mail.gmail.com>
X-Gm-Features: AVVi8CcwekiXclIHT_cfijbWQy4UuN-Z1t4Dxk2kC1U7yH7ZQNm0xbbc-JVeInw
Message-ID: <CAMRc=MercPNLWJd7JkGKQh85wwK+58KGqUgAKAYZhXvkC1Nu8g@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
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

On Wed, Jun 10, 2026 at 5:41=E2=80=AFPM Viacheslav Bocharov <v@baodeep.com>=
 wrote:
>
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
>

Why am I seeing three versions of this in my inbox? Which one should I revi=
ew?

Bartosz

