Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87D6CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xhofByKOJZBUxzzCwJz7ILtLFgJS+emxFXnUeLfugk=; b=w+nEGbHkLjrsqFlhJBTnHfiuWN
	xCFVPxLEpN1LoazojLV5UAQxu1A4QXyiwjumgj/MfLlRiElThxOtSKfCNkxTW/m6SJx0XtridFddz
	0mrfJPRBhPf+bPM2wAdJfRUFKKp6ZvYPNerWu3UZ9XGh/HBfDL2gujtmRMLXmHebbaXxkgbljcGF3
	ewLOSMBXoJI8Kxk9RpnTLFO6D7qEzPp3uQbc/5deOxKeIEECUSfCQ821w7F8Vk2SNw6SLvDxg2j4Y
	lj/F2nWZdkeyn8ThEEfolXuWAJ83GYMKrF8jRCLMbCBskp3idT37ZO3fjd2nyV05RIowxLkUFwirZ
	hITaFZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwejA-00000002R0X-3wUl;
	Thu, 11 Sep 2025 10:40:32 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwej8-00000002Qz0-2ovQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 10:40:32 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-33c9efd65eeso5286691fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757587228; x=1758192028; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xhofByKOJZBUxzzCwJz7ILtLFgJS+emxFXnUeLfugk=;
        b=QJRg9xzdVilT1dfiJckhAQ9reblDCUgjpqssa7tWSFWCvDjE3mmU43a5Ms/1JHW4sb
         DaZ3rMpuNz0LRuLnSUpERKuGkrEvIoN5P91Mh1BGb0UY/irZMRk653p7rECIF/csSfOm
         TpBcvxrYQBhLNPCnovhHeJ3ZIm13XDLhABgJXnwHbeiVR7Iuwdc27suuFVmBEO1J67bj
         I/2PxGpZKBuIJRxmqzP3fXK0TOsvSdWQK7wsXdipyKRx55iBVZkmUhVJ8uVMtXYLKQ9H
         ZbcDp9oPiTDYsEf/gQ0InuKS1AYNEwcmUdOx4SgbldCG26XyLKBuF+pKsOlbhif8vaqB
         oW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757587228; x=1758192028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xhofByKOJZBUxzzCwJz7ILtLFgJS+emxFXnUeLfugk=;
        b=dBMeruHW3dTUZ/cV+HOK30gqji9aUMNqQA7x7tylEIHSjzqNlnZulMj4nCMYFcikvm
         Uq6UsvNrud0dWBSxl1QFJ9DkwEEaMOd1Q+pmEp3ZPPe8HPjejVDig+HfccV+IwvujWiS
         7c0QI+nIjdAbBg5qnu/p576oqLJbQE2CT5D3Ni6TKYwwhr5mDHh6Upwtfh88QLd7j8a5
         vZnp4G72fflpG4xAQU5vAs13m7VeGMwHNoOgYo9OXAitDTg2HOoGnaQwxhAwgQ1kCR6C
         LTz2l02S6MR0PpzGMLbcDlwGch6BguJXTGR6p1ENfJ3rHs50514OJNF4q31KurCw4uLM
         BFLg==
X-Forwarded-Encrypted: i=1; AJvYcCVivwcnpTesDJZ7QCBl+yLqLOp74y0mOhUH/qSEFLteFdmE3G0simI7DEEp73HcYe6DYZLqd61Udk5+66IdjDb9@lists.infradead.org
X-Gm-Message-State: AOJu0YyP9XdcUhtDRx/8glzHHEbU0YaaK6XwkwGVilVmpKRooT7PbL5j
	j7nXQ7FnF8I712FnXZ15VLJ+bL5tpELxYjwqOX/a8rORy0ADVtc47sN7xRlz3PyU7DOTO41mdB0
	D2rp5VwPckVx3E6zFC/oDLGBeLP+MzraO5GYzKPdaFQ==
X-Gm-Gg: ASbGncsplbo3yHh6r8vJlKN8IIEDM9fl5MBtidNI2VOcZzwRHJ6HQcILEGWX+7Z0YXG
	10dhVJar18BRsMyyaQeAiPbU7LLNpt8264Yx5UjSFfdN9OcGE4j6ApRpbKFi1TCI5mfIA2uHj1Y
	DW8ju1lCAkQ2HRru/q7omuqdls+tpVkYF6ukAB3quwbvFyIsZ1hz63doeO6v2KUrSia/8gEpoDx
	1cBVV2+qLbm5UlkpV605MQ3gw5xSyFtTavO1Kk=
X-Google-Smtp-Source: AGHT+IGPBV7ZUshYcZ++bfkHR8WoSLgks047FDwY5y0u82+iY8L6qmzhXMDwyO2eqt5HUBKGwgQk4xCTnYrT4A3qljM=
X-Received: by 2002:a2e:be1d:0:b0:338:166:6b87 with SMTP id
 38308e7fff4ca-33b5edc397bmr47551441fa.35.1757587228237; Thu, 11 Sep 2025
 03:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250904130516.72266-1-brgl@bgdev.pl> <20250911103147.GI9224@google.com>
In-Reply-To: <20250911103147.GI9224@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 12:40:16 +0200
X-Gm-Features: Ac12FXzJUv-DtTTwMxm9Tw3SjH4bJmVAMD-5PcnaHNxBA2feO9XIwHgckN9WRfU
Message-ID: <CAMRc=MfcSkwr+EL2E2wshuNvTLpWXsftLwX6uA_Y5Wmok-ojyQ@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between the MFD and GPIO trees for v6.18-rc1
To: Lee Jones <lee@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_034030_963466_076DA9A6 
X-CRM114-Status: GOOD (  21.35  )
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

On Thu, Sep 11, 2025 at 12:31=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 04 Sep 2025, Bartosz Golaszewski wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Lee,
> >
> > Please pull the following MFD changes that depend on commits I already
> > have in the GPIO tree for the next merge window.
> >
> > Thanks,
> > Bartosz
> >
> > The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15=
d585:
> >
> >   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpi=
o/mfd-stmpe-for-v6.18-rc1
> >
> > for you to fetch changes up to df6a44003953fb23ad67f82d299e439e7ff7150a=
:
> >
> >   mfd: stmpe: Allow building as module (2025-09-04 15:00:53 +0200)
> >
> > ----------------------------------------------------------------
> > Immutable branch between the MFD and GPIO trees for v6.18-rc1
> >
> > Allow building the MFD STMPE driver as module.
> >
> > ----------------------------------------------------------------
> > Alexander Stein (1):
> >       mfd: stmpe: Allow building as module
> >
> >  drivers/mfd/Kconfig | 10 +++++-----
> >  drivers/mfd/stmpe.c |  6 ++++++
> >  2 files changed, 11 insertions(+), 5 deletions(-)
>
> Pulled, thanks.
>

Now, on a second glance: this won't fix the linux-next situation
though, right? You would need the gpio patch as well in your tree
which is the prerequisite but I can no longer put it in an immutable
branch as it was literally the first patch I applied for this cycle
and I've merged several other branches into my tree since then. I
think this PR doesn't make much sense on my part. :(

Unless there's a conflict you should probably just ignore it.

Bartosz

