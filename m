Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570E8C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5np/oOs1XRUBoFOxmCZiqOi6wfyrbfsGfKYIkl7k7kY=; b=kwZSuLfrQikuznRGBg27SaLnwS
	JBnu8g4uCnN5900/2WOq7DeRYLI97rGeR61y8QCuzE5Li85Ww3Eze89MRkWDfDeMuqjH2PJxVpdkW
	xy77p+qodLfslZWJWz6JikoPvI9uTxacm3zPqqCKlURT/XKjOrB59MLTBuEbXWdxQZtz1Ux488651
	hC1gjeAtUeIaF8c6bWUTG6q8DfpN3XT4kV5OJoYZc4Jva7CuPUluzObHcUrcx63fSgsKFjwyd9okN
	i5nkOekuDo2MTBJFXPahvBapZ5yileQ/8DJUUkWTfB4v4cbOiulLeD2Wne546fditiCD7jepew0IK
	K9o962jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pqp-0000000AZl8-3ZiZ;
	Tue, 29 Apr 2025 18:38:39 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pot-0000000AZeN-3BwB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 18:36:40 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6f0ad74483fso72251196d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 11:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745951798; x=1746556598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5np/oOs1XRUBoFOxmCZiqOi6wfyrbfsGfKYIkl7k7kY=;
        b=3pMRn/RGkI9NU2ywsiBdBMU9KcMwElLv2f/xrmr18srEak4jKe3vlcuy+/yAZv9yyX
         XAFzWR0NCRJRAAy+hWUas6hV03MLJk1KcwcPevYiixYdHABCue5D2tQHWNn6qdBqpcCE
         8ndmZUWJB9HxnS+ut0Ea7wxVJ7xoYgonp7Ncgi6lfXFWp3Arr+tvQRxcYefwvMMqXFJD
         iRBZLrgJGT2DD9x4jw3jLqW+OGtis+kPmCRRoXE4PiUMt4VsBFNaqxPNPtqunqHcNp3h
         Z2jqZabs7n3OWjoPMtWJrJ6uPCY5YY7z/daeLmx/Qbx4bSSZC3W7+6eOii2Y4Vw5eMxs
         4BjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951798; x=1746556598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5np/oOs1XRUBoFOxmCZiqOi6wfyrbfsGfKYIkl7k7kY=;
        b=dLRl3YNG0BIfinje1SkQSbRZZMgUtdIM8wCKPgYc1pMUVoaM/wBhtYH38Y4IMEPMb0
         M1UTcxXt3nH33erO57hKD4hg+CKwnXGLU2+ANwbaOMOnebG+hICg4fpo+TaeR3Mf81Gz
         9vt6oZeg6ddiXdR47AipAH7C2huEjVNeA8GnWfTp4DQknAJ/T+ErWgE5uM4dGYR55Qoa
         mFeAZMGagQhOececw9CLXBtsQnThi7GW5pYwYC0VK+DXQ0I+ITiEAawbJi2WVx2VFfup
         zNFOjexgAizmXX9RobHQQAxAl1SdbYHJr9OGTTSxNstm/f+XkslvZ1V6+2bs3nXn+Sps
         90Yg==
X-Forwarded-Encrypted: i=1; AJvYcCW39IRrVxBZv/apXuKhrGjkiOXbrGfMbPFuvU2JU011DW4ZAczchLwmGeb7/3o/oSjoxJ9l64QQI8YkTExGGpaG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj5fanx2U06xvZK/JkP+M/gTqA0SRw9ZdxqXI7InSesjeO/xTe
	mw50+YwKZBNXRWkC4ecdM48T5S/3Ndhi/gqGPprJUE4sSjbMO166JcYwQBg7fM9s+mEm9wiUF8H
	MauYVDVvnPdbxBf5VUiHngf7bHNVV4tCfFY8=
X-Gm-Gg: ASbGncvCtaUhb4+HiOmYuu3ftoKlrfWjcM4OdJ4ijC6tMwfv6OB3ZFfRbAnCuVASLsm
	CHC6soCYOYsW1Lrg85kID9DEMnhmTXpdK7SwlshcvAvvO73JhkX1nI3eq5W3qRVag06HqVa13ub
	LZsclQ0+d9nlMYKjngMe+06ZhaZNPBX7vwl6J1eP5A3cYzpwJFqfY=
X-Google-Smtp-Source: AGHT+IFF8swP72nG4lQKBlVM5Y1RrJO2sYDULWr9zVQIckdm/edCPUl1Vq4zoRVK9wLWUikcBCkZ3nC58jTFPJYlu/o=
X-Received: by 2002:ad4:5f4a:0:b0:6f2:b094:430e with SMTP id
 6a1803df08f44-6f4fce9ecc5mr8329996d6.25.1745951797459; Tue, 29 Apr 2025
 11:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
 <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>
 <20250428122408.GD551819@e132581.arm.com> <CAJ9a7VjhCRk9BxGvE3ZyyZzq__+A1PpD=oRtFQOcD8BwXKa27Q@mail.gmail.com>
 <20250428130519.GF551819@e132581.arm.com>
In-Reply-To: <20250428130519.GF551819@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Tue, 29 Apr 2025 11:36:25 -0700
X-Gm-Features: ATxdqUHUwAMc9N8ZrnHzAyj9aeZXCcCnhFu4COUKOCLn1Fy0uWz79ytMhmxAXzA
Message-ID: <CALJ9ZPPKozzci07i7cqHckBA47gUodH0gymDwFPpW_MJdKWSbA@mail.gmail.com>
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power state
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_113639_797997_EF50407D 
X-CRM114-Status: GOOD (  27.13  )
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

On Mon, Apr 28, 2025 at 6:05=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Mon, Apr 28, 2025 at 01:55:29PM +0100, Mike Leach wrote:
>
> [...]
>
> > > > The TRBE PM can follow the model of the ETE / ETMv4 and save and
> > > > restore if currently in use.
> > >
> > > If TRBE PM is registered as a seperate PM notifier, a prominent issue=
 is
> > > it cannot promise the depedency between ETE and TRBE when execute CPU
> > > power management.  E.g., when entering CPU idle states, ETE should be
> > > disabled prior to switch off TRBE, otherwise, it might cause lockup
> > > issue in hardware.  If ETE and TRBE register PM notifier separately,
> > > we cannot ensure the sequence between ETE and TRBE, this is why we ne=
ed
> > > to do the operations based on CoreSight paths.
> > >
> >
> > I believe that the architecture requires that if the disabled TRBE
> > cannot receive trace then the ETE should regard the trace as having
> > been output (A1.4 ETE spec). Incorrect sequencing should only result
> > in missing trace, not a core lockup - unless the implementation is not
> > compliant.
>
I tried registering a separate CPU PM notifier for TRBE, but CPU hangs
persisted on Pixel 9, albeit less frequently. After switching to the curren=
t
patch, CPU hangs are no longer observed.

I see the line in ETE spec: While all trace outputs are disabled, the trace
unit considers any generated trace data as having been output.
Maybe the enable/disable order issue only happens on some CPU models
or SOCs?  From Android, I hope the coresight driver can solve this issue.
But I'm not sure if ARM has other suggestions.

> Thanks for clarification, Mike.
>
> I would prefer to stick with the CoreSight path approach, as this will
> help us to resolve the issue in a general way - not just for ETE / TRBE
> case, this would be applicable for other types of links and sinks.
>
In my experience, coresight funnels, ETFs, and ETRs don't lose context
with CPU low power state. So probably don't need to disable the whole
coresight path when entering CPU low power state. In Android, I have
a tight project schedule. So I hope this patch is not blocked by refactors.
And I want to backport the patch to previous Android kernel versions. A
fix before refactor is easier to backport.


> Thanks,
> Leo

