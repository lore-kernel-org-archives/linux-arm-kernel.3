Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FDCCA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMdVmFlU6LYwgavWx4TLB5/FyI1q6mdp7tce8URgStc=; b=loabYH/YC83G91kuYIFJGapT90
	q0U5z1NZMr2/OijnpOqlMut+9h0lS8HlGEc8IHXGywXQ17wA30lo5BB/0kj5F8FI1g/hLESOFm8Zk
	G9Kmpv5UWYAlUoL6vOgJeOhl3B3Yj3R9Me0WEgu8HA3CpIHBc11Hump8cswZollJGM6M5Zl3G01Qs
	974x/8pRWTuRqP5DPla+r9/8KARqQasnQRwLM/aZ2RRSW5M6ESvxcRtvytngOEIkltktrMe5+Xgav
	sYQVVLGInexhTZrMwx3f1pjqoDnprwrOUYW90ZZztJI40oo1ww93JYaIMkQYE82Xq60GwJWUf0brC
	8x39b9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnqV-00000004Pl9-2xYL;
	Thu, 08 Oct 2026 13:07:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnqU-00000004Pki-1fTg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 13:07:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3652F601DB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 13:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48231F00893
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791464856;
	bh=AMdVmFlU6LYwgavWx4TLB5/FyI1q6mdp7tce8URgStc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fe4dGY8yxNTjXnYOrABGJ87oRC2NUkNmgz5RCcrDiL+qaUxknisUy/2JxcJBOYycu
	 PyKnl5AfHgFPfnNfrBz+1bkmLLVZzpdAn1f1SQWKkLcnvUxfe9OdGBO8H8Ii/2LKlq
	 g9jOmg6GqMbiDfNq3wZc4IBv/F4O0G87nC74GQ9yu11mYb+HbhXDwijVM8gePB7+In
	 WxD23+pwOGXPJhcpSM1UaLQLV8jU0SwbRYFwoJdoYNbuufNYwXh+DZK0xeFfFbfc7I
	 PDYtoeDy/6do5k2/J6cYQjhtfiWLFJVTUQ0bU24ynhi428g9wC8xaHqk8dL+27O4W8
	 wsgD8sbsu5vmg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so2556836e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:07:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxNRYzzmbY2Mg1UnvB4NzC1bzxrAS14Nrc4vTJZcDAtYTRKMNGsQxCy1lhCZ7mxnLfqN5dTlG3Uy+XTZRLVOPd0@lists.infradead.org
X-Gm-Message-State: AFq9FYLh/pkw8kAqmmxZv95rDp0gOfe1JONJMqOhHO1YQ/TgwEHjd6AR
	OrTabFuak4TDzRJHksfT0lR+UzBYUfrlvbmP9JJJOUCaKYzCCFOFirRj4GPImldXvQ3iCWp5/X9
	Oi2/IW5Bm6vINhzerMii+K5vlPf/5xEU=
X-Received: by 2002:a05:6512:4023:b0:5ba:429b:c5bf with SMTP id
 2adb3069b0e04-5bcd0736ea8mr1945906e87.51.1791464855540; Thu, 08 Oct 2026
 06:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <0C8AEB5636132B0C+20261008113732.581825-1-liudalin@kylinsec.com.cn>
 <20261008115913bfd12cb4@mail.local>
In-Reply-To: <20261008115913bfd12cb4@mail.local>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 15:07:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLkshbEFS0-H__3AFJiRMeS0hA5F8PoqUjB7kyG_cvRkTw@mail.gmail.com>
X-Gm-Features: AclHuK9kaR_Kf0jFHcJeAlcfmC3e3ti8r1xCTi6blXcRAoYHPTBq140hETtS8v4
Message-ID: <CAD++jLkshbEFS0-H__3AFJiRMeS0hA5F8PoqUjB7kyG_cvRkTw@mail.gmail.com>
Subject: Re: [PATCH] rtc: ftrtc010: fix negative offset handling and smatch warning
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liu Dalin <liudalin@kylinsec.com.cn>, Dan Carpenter <error27@gmail.com>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Deng Yingchao <dengyingchao@kylinsec.com.cn>, Qin Yungao <qinyungao@kylinsec.com.cn>, 
	Luo Qiu <luoqiu@kylinsec.com.cn>
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

On Thu, Oct 8, 2026 at 1:59=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 08/10/2026 19:37:32+0800, Liu Dalin wrote:

> > A prior attempted to fix the 32-bit arithmetic overflow by turning
> > the implicit u32-to-timeu64_t cast into an explicit one. However,
> > all calculations still happen in u32, inheriting the existing
> > negative offset sign-extension bug, and the explicit cast triggers
> > smatch "cast after binop" warning.
> >
>
> AI is lying to you, offset will never ever be negative.

This looks like something that warrants a clause in:
https://github.com/masoncl/review-prompts/tree/main/kernel/subsystem
in a new rtc.md

I added a file for gpio after some insane review ideas
from Sashiko, hopefully it takes effect.

Yours,
Linus Walleij

