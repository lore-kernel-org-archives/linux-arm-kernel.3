Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E745C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKP0fSYcRydlhHwC4VSz6cV+PfN3f0BcpYNYU9tHcGI=; b=139SDR3yZ93ezFpbYIkt4t2cYR
	hKSeGIxzCso1VqApjzuB3Qn4Khf2lgy/cyRIhWa7oNsiLE9IG4V96zyvvYgSp9bj3nnUCbQHDK21R
	6rq2yJfN4W9ZSsAptOjmWuqpQRrlkq5OE8E+kJNFGFNaS123d3v1s11nuMDbdQNNZmnJ1tCwe5Cvr
	rmL3Gq5yT8Nhs97JncI3+r/IkpkM2r5gvw1nD5CBUFTz0yHcyH73Y07y68fpGvd+xtk45fDupAWvm
	/p8TByezpCOTZDE/SqJ1+zf84XPDN1iLlLXYiUicw1zJ0qR2dxcYFnni2sTHp9CH8i3l+4ScEPPRt
	dmc91FZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkN9g-00000008DWy-2CtS;
	Tue, 18 Feb 2025 12:56:52 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkN8D-00000008DOm-0KvL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 12:55:22 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e5dd697475dso2166977276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 04:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739883320; x=1740488120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKP0fSYcRydlhHwC4VSz6cV+PfN3f0BcpYNYU9tHcGI=;
        b=azBLacjS8ELK7dWpBzexQQ1q2NPB3QYxzhEgrvBbEd3YC+NaD58rmQy/BlLe+iyhZB
         ULOG/zA4YdidYEwpGxNf+hQdvgbooWnJSZieXfKDSMWLmYtJfW+vKHCWG39rmt4Zmy+M
         ICqldf0LBBnYexw+EGhRKXs2Te/79TN6W5SknGtll3AJ0vg4bg+qYHkebvdhMXqcv1ee
         WdwTqXKyb870yvcaSraNwXFyRoCvEP+k6SWLvaZFJPomIauJ4byzyXtzIcQ9w/q8cWGB
         /o7CPs9Rxko6XdnRUljiN5UEJXjwmz78R2LWrNvgr9m/Kg5BjB257VtdR/ujbOfVjCIP
         OYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883320; x=1740488120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKP0fSYcRydlhHwC4VSz6cV+PfN3f0BcpYNYU9tHcGI=;
        b=UY7PYJ/rPflVVAvaO0WBzLggSP8vb/MlCKId541M3FQooBQyudip79wF3VQrl4TSz9
         UGFPGY2/wZc8YqUqfx8HiuaJrykiS+qOYsIGL0tLpVLqLUuKrWqxzX6JMD2exKYTLmyl
         MM+3javB3+s8An//P/oGgaIGb0/0n4y+VVM2EcrdJY1N1ww0+O0Kao+q2rBmnCP93kUB
         l6XwQtgs5D17JMWKig2BuMQgpV6an208lkJNWU3Hkb9wz+R8lN0fnr9nXWrBh0NN062f
         u0dJCXP4WhLylYpsmfaIXG5OyW3ddiK7uwzW03bKpjNG8QolzsvTEzCD97BiLAaaLVFJ
         Z3mA==
X-Forwarded-Encrypted: i=1; AJvYcCUkL+fLRzePfLokn5bgL38PEphfb3PpopFCwp4/iZGFeSFlGGcaEWrz7xVJKNHzaLxJk1Ckf3CzdOhdphkHUAD5@lists.infradead.org
X-Gm-Message-State: AOJu0YzKrppKw3QtoitUhNv4AuB6d3a15Wt8XrdrK+XQAAhFctZ0rAmH
	xBc8rsJs/R4LTK/62k2Ql9/GNjFLPa7sFm1DFeyz01S93nxjZluikuO/Z9mIx3hGirkE3D4C7B8
	Ix1ytVo2gXG5B7fK3MxhHUzXfJu7+g8vb4jTiGw==
X-Gm-Gg: ASbGncsgO9HZsWARRljp5NZyqiNmLzOwi85VMKBBW9LVcGYrwqmLR2a9FZt4w+VyezO
	iQMby6HECINLfcZBBUuqaHYsbw36L/RXd0XafD1d4gVmU9T7fKMunH7z1Co9hXVAkLhSG1LZjRg
	==
X-Google-Smtp-Source: AGHT+IGqWa+YTDuo/jIeuuse8zv3M2XdO5Dzh8lkFtkue0oKd3y7Sr4YadCsNIUJp3SxZ4H9b90Z6MNHcCka61iZ7fo=
X-Received: by 2002:a05:6902:3387:b0:e5d:b2c4:7cb7 with SMTP id
 3f1490d57ef6-e5dc9047e37mr11320156276.12.1739883319875; Tue, 18 Feb 2025
 04:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20250217140145.117086-1-ulf.hansson@linaro.org> <CAJZ5v0hi=zCuhmVRf2HVRWkR53U7xqxC3oQDs8-JN-cyQ+ZX1w@mail.gmail.com>
In-Reply-To: <CAJZ5v0hi=zCuhmVRf2HVRWkR53U7xqxC3oQDs8-JN-cyQ+ZX1w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Feb 2025 13:54:44 +0100
X-Gm-Features: AWEUYZkPUdp4exJ6jSmob_1efkRW1I1YA2HXT-xMpcoDiySdNuxCrLPd8wp93yY
Message-ID: <CAPDyKFq1w7Ez+6GSKDeCpeQ=Xm4c3U9BMu3G8q+v2MXk1TdwKw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update section for cpuidle-psci
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_045521_135030_6937CC26 
X-CRM114-Status: GOOD (  17.05  )
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

On Tue, 18 Feb 2025 at 13:48, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Feb 17, 2025 at 3:01=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > Add myself as a co-maintainer for the cpuidle-psci driver and the
> > corresponding git-tree, which I am already using for this.
>
> Lorenzo, Sudeep, any objections?
>
> Ulf, do you want me to pick this up?

I can take it via my pmdomain tree, but thanks anyway! Let's also
leave some more time for Sudeep/Lorenzo to comment.

Kind regards
Uffe

>
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  MAINTAINERS | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 25c86f47353d..f2be70dec4ee 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6087,9 +6087,11 @@ F:       include/linux/platform_data/cpuidle-exy=
nos.h
> >  CPUIDLE DRIVER - ARM PSCI
> >  M:     Lorenzo Pieralisi <lpieralisi@kernel.org>
> >  M:     Sudeep Holla <sudeep.holla@arm.com>
> > +M:     Ulf Hansson <ulf.hansson@linaro.org>
> >  L:     linux-pm@vger.kernel.org
> >  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscri=
bers)
> >  S:     Supported
> > +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm=
.git
> >  F:     drivers/cpuidle/cpuidle-psci.c
> >
> >  CPUIDLE DRIVER - ARM PSCI PM DOMAIN
> > --
> > 2.43.0
> >

