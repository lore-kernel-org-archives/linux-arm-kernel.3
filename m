Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C963FD32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeBVO2GdRfYXq00Svo2kHoFq/10dwtalChSI8IIjQwk=; b=yP3YRwgZbESsZlV/A3t4Xn0t3w
	eXSl8RQPugTZmZCWkoQSeyrCu2YyqTx/Ikcw8zQIwxDroVbMdAbcolPMW0muToIDgbZAKmBvBKOaV
	Ey7F8ZEP6bbGInVuBaC9mRZLZ6XeJh35d8xZ60PNxnYSXDMHEcjd31+Zt67aEV4owEHjKDIVMNLHH
	pbmSVSSDHU1k3bH7NrtAhMOQV4ro2nbrIbU+axCvRLczBpJG/sncceMKjL3CU2gbDAxnpCEfxlJ60
	0XukBMwFVPEamL+jSBAYV3XeamMcA0mhBFJZLgqbM3pgwkRk3QPz6gtz0wKbIdDmspzJBHUi0sCBx
	OdCLWc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqNk-00000003SUo-3Wnp;
	Tue, 12 Nov 2024 12:52:33 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqLv-00000003SBS-3s4R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 12:50:42 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so57429171fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 04:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731415838; x=1732020638; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeBVO2GdRfYXq00Svo2kHoFq/10dwtalChSI8IIjQwk=;
        b=a9999fQGLbAYA1nKNWCHD0/lNwMgFZ0V6qzHHR97Y548drGGccMaCUL9+UQjs4fGpE
         mES9sC5QPpwQ57Cg5/dR58+fgPgQhpIkTCRTiApaYMTJBF/48SBcsJhHDpDf+Pbl1GJy
         JN/MbeZOqGSUExnrB8PAUyKh24JYmVjLwMyoO8dw99eLF3OA0JrgLx10/EMq0X2obTRz
         014lG/PEBcAI/6WW0vzEu2AvCbwE8UsFg1bbWAoR1vO2bqKUFtTzWu8ImYR5m/CSUEDk
         c9XglEzUS0OrxtxcUZOSms3Yr9y05hRXBHoaEMOJ3LUrvi+q3lRTdMPNoJoFuhRygENT
         28CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731415838; x=1732020638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeBVO2GdRfYXq00Svo2kHoFq/10dwtalChSI8IIjQwk=;
        b=AlRTFxFZKt4/A6+kovFXqPrBYguBw/URG3O453AG59DE6uv2DFVevdgdJ3rrCTh+Fv
         pUnt2o1f5JZtj6Gu8/zxikVwaXx0WLIGYF6YYT2GY4HrY90gDGKZ/Op9oVn7rreEPEQb
         YuURTntxKxvFsZbchgZVTmqUrSh5sALzKbgNpVGiRzfnNmH6dnBarpH9LpvZ2CeSQZIa
         NJcJEZwhrar7tsZ5zGU0q+1tGOsXABGvevHRZKHY6Wh0UcpMzAsnfmnvNqcoUU/Pl0wb
         yx5khQ8l5QlBDZ8jMDCSmBSR8A9Sfx/bZMCYoP1zUQYsY20EMOl9990JL3scHBawyOsc
         YGfg==
X-Forwarded-Encrypted: i=1; AJvYcCWDq4K1JAIcdQA9i3lpo7D/TsxeYMV9s7vFVPXC8ygCMi7hz1VWjrsVfsjIf8kcjHVIojwWuZ0I4m7y4WCn3pv1@lists.infradead.org
X-Gm-Message-State: AOJu0YzDvPqsmGx4Lbu4ugNgPIiLsAkgKwbB8002Mh5H6VIfKKtopxB6
	8zWpi8VYqXDjyyBZso2jvfolENZvIKfHp45v3WBJjgnfi/DnqPKs2FZgeowPQOXR+gSJS5+765y
	djnOH2u/I26IvzS4o/ErdXAHtPOCwUUPY7PoL5Q==
X-Google-Smtp-Source: AGHT+IHO77pCoCjWkW3UGcaVkG+6FA9QyXrg8cZvhES5N7tCaKkkDgEAed2uIgWOEd1zU7CLBorSuTYdULgmPsy61b0=
X-Received: by 2002:a05:651c:2109:b0:2fb:6110:c5cb with SMTP id
 38308e7fff4ca-2ff202ac51cmr71186881fa.34.1731415837857; Tue, 12 Nov 2024
 04:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-5-ye.zhang@rock-chips.com> <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
 <ZzMwh2GMP-bE7aLO@smile.fi.intel.com>
In-Reply-To: <ZzMwh2GMP-bE7aLO@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 13:50:26 +0100
Message-ID: <CAMRc=MePqsQatxNy7p5c3sE4z8RepjjLeFgpppKgEctCU3jAUw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request irq
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_045040_192420_A95759E4 
X-CRM114-Status: GOOD (  18.87  )
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

On Tue, Nov 12, 2024 at 11:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 12, 2024 at 09:48:06AM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 12, 2024 at 2:54=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.c=
om> wrote:
> > >
> > > Since the GPIO can only generate interrupts when its direction is set=
 to
> > > input, it is set to input before requesting the interrupt resources.
>
> ...
>
> > This looks like a fix to me, do you want it sent for stable? If so,
> > please add the Fixes tag and put it first in the series.
>
> Independently on the resolution on this, can the first three be applied t=
o
> for-next? I think they are valuable from the documentation perspective as
> it adds the explanation of the version register bit fields.
>
> The last one seems to me independent (code wise, meaning no potential
> conflicts) to the rest and may be applied to for-current later on.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

There's another issue I see with this patch. It effectively changes
the pin's direction behind the back of the GPIOLIB. If a GPIO is
requested, its direction set to output and another orthogonal user
requests the same pin as input, we'll never update the FLAG_IS_OUT
value and I don't think any subsequent behavior can be considered
defined.

I applied the first 3 patches as they look alright.

Bart

