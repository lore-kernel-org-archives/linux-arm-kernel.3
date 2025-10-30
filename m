Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACC5CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ycPp8pZgEFoeQMpyGYzVQ4IFRsCoJ2aRuKd6SDWpxA=; b=StvG0CJLHh/USEczh4PWNlYHid
	8zMaNRv3so4Bx80go48EneXDAYpVBVlAl3eQKF4b7bPK7Lb5gr40OePMG2BSj4rUPu+sRa05/UAzI
	e7Z69yuMtXJbJANm9kII4ozOXio2HWzpEyQEgppgyhNJlIexYQyy7J/1P3EwAiQrJW4WWJ37KCxfI
	Jl2CcwFAXT+FUzTzWNi0YwRBv3yx9fXOfnNQh6I/4nGUb8iQuU9KCn0MY5Kn3d7QSSx3rdJL6u/gD
	vpUGExRXy34EMf6BjMzc4cTw9d+sk4YGOKlQdb/Ey+WnntWZgC2NwZNOrC//bDYIKBXAW8ThycfAH
	IP/JFNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUZQ-00000004Nnp-0QPs;
	Thu, 30 Oct 2025 15:28:12 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUZM-00000004NmM-00rl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:28:09 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-7849c889ac8so43449807b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761838086; x=1762442886; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ycPp8pZgEFoeQMpyGYzVQ4IFRsCoJ2aRuKd6SDWpxA=;
        b=X6Xup6sZIPJpdVMErA82XSQx475/wQAPpvohQ1HzkUtpublPSi86IKhPq3B4K4omun
         XOirF5Nz7yWUMDRwcMdZHBf9Tt/Vf4AdhVz1LmeirKorPZ0hnp+kK+yaYUlV4Z+jSl2v
         WhyZZCS2CtUiVV1agGbONF0GUmGvrSkMIw2xGtOlXuvGQikGkIaK0b8MXgUFruQR5imc
         mYjo1qcTrDMjW6Mudmkf/UWN4AOEsy4etux+0pCZuN4ozKSpWQ/3OdVwfbV5VQaQrTdT
         JbpF3uyyUVDO/6j/+CutUHMxtglChdSxel+x3Hi9D4peOaLL9Sh2rMs97S4lPvZ1FZmM
         zUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761838086; x=1762442886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ycPp8pZgEFoeQMpyGYzVQ4IFRsCoJ2aRuKd6SDWpxA=;
        b=d5i974URsHyC9fC9iEJ2mG3I2PMivpDwKx9bPmKN4zEnMpNNkHEEG4Qo4dfL5DPeLX
         K4aLbKThIlZ8ZDImCmISviADRK9FkXTSM73i/PVwuIpkpmmXBH4Xv8DhpkG5K8/Hxf49
         Fp6NAI4nkddLFAeDzQZC77YU5xrwHV6IxnZJh9IqffprV8PZPIPAB91bsZhNRLzHgq66
         PxUa2VEd0VJosmwxi6FfZmRAXHAdRqRpAVvnbPoorSbrJTPS8q8PixAhDc+L3W5CsJ8k
         lDva1WjEZwM9VjlbUr4PiiiF4QjMVC84Nh15//uNVUcJtLGuD0UFKqHMvyLlPXKaTXNT
         Mp4w==
X-Forwarded-Encrypted: i=1; AJvYcCVtZo2Gzbf7/CuNlowzFVNpidNV28JjxatBbsxPOCBVDNlDK1zyA6JFeQFi8wKVuT3fbRh2M8WlfhWu49mRT0NN@lists.infradead.org
X-Gm-Message-State: AOJu0YxofByji6t1TM6riUCzPd3q0VGQ4Yv1VMEFRajbGCuA7HyqYXqd
	RRcFwH6uGAh8eEBJ0YXKo4RrVywTIG3W9f3r6xpxRijFypMCpvXeCjtw/4uq8CbbRjGOBwC5xF/
	m4feFyXClhBuHcdTVbU4qg4xzXB8tEZiWOSr+HBwKoA==
X-Gm-Gg: ASbGnctC5Q5La10vbSa1hAchqeieLoLBXNn9kmYO3MazPTqx7FxIc488NC9dEQpP2ql
	T1ZzYPcM4S+whyMU7/FLHm1Uo4NxXPilO6SPvSCZ7AMqzOUUs+T7pxhrSaCKvr7EaRMO009lCL4
	K7LdPoOoRRdj5qZo6Fv+hkLKhKWpN6mybB3Fq0tHTg7eQXAlu5mKGoPl2NtjpsuLSR0pooVgCMR
	uqoTnf6STZUyD5Zcmx1zYGDVeYlv+CcKjpp+BjKEVFW+bLHzr/O8GPT+jsoaA==
X-Google-Smtp-Source: AGHT+IE7cHjINSkLMQTgzs6w+5tGJD0Nm4hSDWwJhVubSFRkYHz6tUwfvq/JjfaEUpptZLodo7e/iRO8bn4zeLZcNk8=
X-Received: by 2002:a05:690c:c34a:b0:730:8858:827 with SMTP id
 00721157ae682-78638e15c6cmr28491297b3.19.1761838086224; Thu, 30 Oct 2025
 08:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250917063233.1270-1-svarbanov@suse.de> <CAPDyKFpus05RAkYAoG7zjyvgAJiuXwRt3=z-JB5Kb7mo0AK4vw@mail.gmail.com>
 <c379087c-1702-44b7-a890-beb5b77d794b@broadcom.com>
In-Reply-To: <c379087c-1702-44b7-a890-beb5b77d794b@broadcom.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 30 Oct 2025 16:27:30 +0100
X-Gm-Features: AWmQ_bnaXJddKoSJGHltKVC2FCgxq7fO5V7a69ZXCIkr6_3dvFmm3LKqD_YY314
Message-ID: <CAPDyKFowo7+-C4YLLw4XoWz4fU3ykEP1UVEEneCJXBuDjGTStw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add watchdog support for bcm2712
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>, 
	Willow Cunningham <willow.e.cunningham@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Saenz Julienne <nsaenz@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_082808_042142_7269E08D 
X-CRM114-Status: GOOD (  20.86  )
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

On Sun, 26 Oct 2025 at 21:23, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
>
>
> On 10/13/2025 4:08 AM, Ulf Hansson wrote:
> > On Wed, 17 Sept 2025 at 08:33, Stanimir Varbanov <svarbanov@suse.de> wrote:
> >>
> >> Hello,
> >>
> >> The following patch-set aims to:
> >>
> >>   * allow probe of bcm2835-wdt watchdog driver for bcm2712.
> >>   * prepare bcm2835-power driver for enabling of v3d for bcm2712.
> >>
> >>   - patch 1/4 is preparing bcm2835-power driver to be able to
> >> control GRAFX_V3D pm-domain. This is a prerequisite for the follow-up
> >> patch-set which will add a v3d DT node for bcm2712 (RPi5).
> >>
> >>   - patches 2/4 and 3/4 are adding bcm2712-pm compatible in MFD driver
> >> and update the dt-bindings accordingly.
> >>
> >>   - patch 4/4 is adding a watchdog DT node for bcm2712.
> >>
> >> Comments are welcome!
> >
> > This looks good to me!
>
> How do you want to proceed with merging those patches? I would assume
> you would take patches 1-3 and I would take patch 4.

Yep, that works for me. Awaiting a new version of the series to get
the comments on DT patch addressed.

Kind regards
Uffe

