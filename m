Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA5EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2ty42UaDUqlMkiP5xE2a1tdArjdzwbm7ssbtaWE4oU=; b=Er59FrD2y5ccuFrwGSklVZgG90
	bmc+oQe6FAcxx76Qtbzc5fBp8Umryye5zLaVDkQvT8saX36s8yjMscrYmM4nbwAs5nbHqBO8QwGy0
	Dz62QoTvKOEmoIqthRQdYTiVB4pDwvm3l+Qgz7ZinJjtz/wYoLqzwwAy+ri5EDXQbATwVBHGzgdSk
	U3ITZmLTpB+LOVPltzwcnMTnZQBbWTh/biFZ/ocILL4TGw3ZI+OItEyhmwquYwPYaMcMXUyUzsSVy
	Elu/evQQlDFMqRXUGsk8bjClKU63B/xnYOFaqAFd0upKREd9fu0nv7JitwJz+W+JaWrDDzKHnO2+t
	ntxVanKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYi6D-00000001yYZ-0fRf;
	Mon, 07 Jul 2025 09:25:21 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhPQ-00000001sRb-0m6x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:41:09 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55516abe02cso2930570e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751877666; x=1752482466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2ty42UaDUqlMkiP5xE2a1tdArjdzwbm7ssbtaWE4oU=;
        b=YwJXq7K7R2iCJoFg6r6qxVB7ifZcKwA85ox9zi5XTZmLC9r/NaP9T12DsnciL7qxHr
         tUxh7caajfoPIgV06vJZIahYWvv6kLn2FzYHtPTZQ+N9+EF8c3DOb/8MAElPnq9g0lVd
         +dr5TkQvzRmZZJssy4vwZeTs6EHJpcxUJkhRLu/DM810XAaBsLcQ7Ki5tbnohECSLpgW
         TCg3+BmJRAnpqY/+l2Hsl288Zjj1DmO7yv+5vvO0WgoFZgvDmb03efTEHfTVdf1hy9iD
         J+LQSBNlYPjIcw5OaVUrgwb3NDCSfen3aXuefIps4FDBMPs9Wm0w1bdONHR2Qvr6Qyg3
         OKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751877666; x=1752482466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2ty42UaDUqlMkiP5xE2a1tdArjdzwbm7ssbtaWE4oU=;
        b=jB39BUHjPCOZJsuHD8ipsy3ygs4nUxfsxMn9nJPI9NZrAdFwkPZsmJOereV05aNw8v
         DN7OhgBoQcRA9vefsOJ0/TvbR2bdqosL+JEaIJiqtvAt87qGFy+I3y5uCfjlLirkmTMS
         s8GD6PgocWHmE7UJQs7yTmM/gWeQl5dZp4AA+xrtSfRd0PzQ3WkWYABi9nooh+4DWY0i
         jrz5HPKXZRtSmnkKn6gTXtDQHM3MQqVdYZdtMWlZLM9XztCcOR8h9jjg4jRjpzY0ptUB
         E+52VKMsriCYzqzwFCkW2X2QIKly2gdcegtTOHFRaTkDhVEhFu9JL8FQUzjfKXjq6o38
         6cbA==
X-Forwarded-Encrypted: i=1; AJvYcCVwwaD9eohknFpFuFP/JvgSbM+yyRC2S9KKZfFto1HHQFXU57m2x04u36YISCe2xuw3JS5q7SqemfVh2VhDDZfL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo5iB7IIgQEKbjQg7z1Oa24hHoOSagPzwdxAcGLNdKIbUS6mNa
	NWz+j2vxDyqTD7oahScfgJP7VR56aFgkR+/WhWONWrT9L18GPp9TapZu1DneYPVL4ez+XeBVh9c
	39j+Adp4nD4NASCuZJl/wiXb2Rq03WFpKtPUm5qF5OA==
X-Gm-Gg: ASbGncuDx+4zBEVKgFh6/AMgL1Su0fDzV5AXxgkTaw+wGtZ32wpKeSONNSiwehQJfkP
	PEaPLE3OwnTA9GjE/KP3fqHTKD5aWHtTLWUPrMmH87k3RfmbNRPx3L4haldHbWe0ikYx+1Uz8Ut
	1n3pYQR4XH35j95NBfjvkr0NBgKzyPWDiJZ2ZjFvWXpK/HtcvoY5EX0WrjVwu7ycI8tMFgFbCdx
	SI=
X-Google-Smtp-Source: AGHT+IEBQJMgjjxGPUxNMZyf6ChFNk5EekGKfeAHU3z/3d2roa2tlgeHgq/aGpK6K+cYyFTqaK6iHRGTmDCxnni6ogY=
X-Received: by 2002:a05:6512:b24:b0:554:f82f:181a with SMTP id
 2adb3069b0e04-55658402866mr3009050e87.2.1751877666314; Mon, 07 Jul 2025
 01:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
 <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu> <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
 <f527c6a8-faf2-45b8-81f5-03def802e485@csgroup.eu>
In-Reply-To: <f527c6a8-faf2-45b8-81f5-03def802e485@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Jul 2025 10:40:55 +0200
X-Gm-Features: Ac12FXzfvvERymQK11WeRhKmee48-1A3WRn820qRFk7sl4RxseqyIge4xppkQTw
Message-ID: <CAMRc=McCu=VdHAEaYwdD5OLTy9MrFO=Mqq-drU1Dnr=-KfJHJw@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_014108_222552_F564ADF8 
X-CRM114-Status: GOOD (  21.77  )
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

On Mon, Jun 23, 2025 at 12:05=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 23/06/2025 =C3=A0 11:55, Bartosz Golaszewski a =C3=A9crit :
> > On Mon, Jun 23, 2025 at 11:54=E2=80=AFAM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >> Hi,
> >>
> >>
> >> Le 23/06/2025 =C3=A0 09:33, Bartosz Golaszewski a =C3=A9crit :
> >>> On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
> >>>>
> >>>> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that ret=
urn
> >>>> values") added new line setter callbacks to struct gpio_chip. They a=
llow
> >>>> to indicate failures to callers. We're in the process of converting =
all
> >>>> GPIO controllers to using them before removing the old ones. This se=
ries
> >>>> converts all GPIO chips implemented under drivers/soc/.
> >>>>
> >>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>> ---
> >>>> Bartosz Golaszewski (2):
> >>>>         soc: fsl: qe: use new GPIO line value setter callbacks
> >>>>         soc: renesas: pwc-rzv2m: use new GPIO line value setter call=
backs
> >>>>
> >>>>    drivers/soc/fsl/qe/gpio.c       | 6 ++++--
> >>>>    drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
> >>>>    2 files changed, 9 insertions(+), 5 deletions(-)
> >>>> ---
> >>>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >>>> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>
> >>>
> >>> I see Geert queued patch 2/2, who would take patch 1/2?
> >>
> >>
> >> It is in my pipe for v6.17 but if someone else wants to take it I can
> >> Ack it instead.
> >>
> >> Christophe
> >
> > No, that's alright, I just didn't get any notification nor is it in
> > linux-next yet.
>
> Don't worry, it is not lost, see
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D&submitt=
er=3D&state=3D&q=3D&archive=3D&delegate=3D61610

Hi,

This is still not in linux-next and the status on patchwork didn't
change. This will be the last remaining patch not under drivers/gpio/
that's needed to complete this rework by the next cycle. Would you
mind just Acking it and I can take it through the GPIO tree?

Bart

