Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3536C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 19:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TC4Zrs0RXqB1dUPW23QEFn3OTq38f66De7spKPbcIQ=; b=ef20dpyKAnMvUoIpAY1TXoVjnw
	fG64oCfez9Vv+UXEkuGghe/wyJ6N5fmfjAqPdX7KTJ7bUSrjqMe4+6H3QdBYixlFmhC27R5iLya5M
	HFsUkI22gMfWzo5NM4Ns6VLvxlnG+0tWbuxv+GM3m4Ym5KwwjORxO8RPuf0L1XENfuBQas/hwHeO7
	0IK9fBG5OJze/ZvWcpHJILJsHkPhQT9vm/Lz53ibWKtTKPCX0ywnt3+xINhQsL3rYcv1STXX25Ajq
	egc/HKlJeWm5Uqmo04+NucdckqWVZOlk4jAduCCmS+wyp1BaAV2mtUV1rIebUShwrYyPcRKNHV2v6
	VXLJ42pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58mo-0000000Ak8w-0X6H;
	Wed, 16 Apr 2025 19:51:06 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58kw-0000000Ajvg-0FTL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 19:49:11 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54b0d638e86so45598e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744832948; x=1745437748; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TC4Zrs0RXqB1dUPW23QEFn3OTq38f66De7spKPbcIQ=;
        b=o/SRNKo83WVXiZKGNTsoBg0FSzWL9A9G1l27q22MbfqG1aIa26a0sCETOyftNOJ+0Z
         Af+BXfZBGRI+tHKsXVhbqLnz0fUJ9U4YCBJilFgPCNHUK3fXXwhDM42vB++jwN4t7sQ7
         Tc+ZhJ2p/je58T1DxBEKtKVoHN7EUuKaWbvqnTCkvxt8EHmOC3U3H+APf6LP0DHKtdz4
         Wjz01AIIHt3nte4D7kRUqme2jqSEMKqIFM/bVwAN+E2Z8bbkhPUfzFYvXaT/QCji4Lpg
         AqNc9+PGii1X/3iHlV5hrBr8KFuKlYqGlK0AnVLJOtXS/js39LeNn1Oca8wo3AeRQxDL
         OLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744832948; x=1745437748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TC4Zrs0RXqB1dUPW23QEFn3OTq38f66De7spKPbcIQ=;
        b=mybCeHHrk/8FL7fHEwIQa1R/Y/lPi9Q2VHXlguJkzzv5QwAQT/U8L80v47jqaiEwi9
         4IVV/esGeeeQAnbYq1FbKXoyp6+4DRXAhM3gg9ezf7jbOA/qzuCFbvwKpB2yUKQmHjcT
         cDfk+kq6jncsxqKY3VT862aVZ8O5aWv8zAm+59JzUZx98gzijPU2RnS794YRL380Ebsz
         XvS6Av6ofde/4FN60gw84zqesaH3jhrxLHleOmXyDKgcViI0Af+FF5KQsgLvia0cZo9Q
         6KxTYbalSPzZIVufu8I1DNUjXLuQ99BwQymeWn9HvNsyfX353Hb6NRlup+lRI4yaZ6Ch
         MTSA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Q66FZFg99vDwrT2mkh+JEUA/Gn5suSFCUUMbSV+hxvUOv/z+DgZfBo9saAzIG+fOpMrtp9L5bWYzySM1YDrX@lists.infradead.org
X-Gm-Message-State: AOJu0YwP8cqIheRPgRqCCEpA8Tl2bhSJSWzvHOsiPF0ZRtlSpFbRwxwO
	CrPbymb/BTSU06XejNlozHcyd4IWNnADCkYfsn5DuER86nR+rQPvLHO0Ikox16K9owEZWB2YrQj
	fP+YUD0qSmp+xNpaZsoTXfY7RX2HPgVO15Ns=
X-Gm-Gg: ASbGncuQQsQ6eKWrcInZ+nQc038svxH+sPf3bUuMm2rdL7dUELB/4wg+Jghs8U8a3Zy
	yqckRlCPs3m+6FmDwDzBgu9pSKkPD28dv5xXlaFAKcbmiCbaT/t3/lKT4xV8YutgWNtHGxIJNih
	Nqonpw//P0+vwC2KGOwtAjJGgSV5CeVFG+pglbD8qo7uKpUU1ZRm0=
X-Google-Smtp-Source: AGHT+IENZff/EwFgqH5CaojFFud4BOKJc5fnWdYHR640ZJfapthbsLkQ3339oAJkdcXWdGqjdKbkWAeQlGaLeHlHPtI=
X-Received: by 2002:a05:6512:686:b0:54a:cc25:dbe9 with SMTP id
 2adb3069b0e04-54d64aa9f25mr1006781e87.26.1744832947769; Wed, 16 Apr 2025
 12:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com> <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com> <Z_-0nX3Z-DLPjL_j@mai.linaro.org>
In-Reply-To: <Z_-0nX3Z-DLPjL_j@mai.linaro.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 12:48:56 -0700
X-Gm-Features: ATxdqUGIHpJvogsXv77cbd-uWZLFBRe1FimucafM0Ov8s0XThKAvFusqPM44Q1k
Message-ID: <CANDhNCr5n+HtHQEqCq0ZxbvX-nC3u9ewJ1_fj0h1gFQZ3nB8iA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_124910_106470_F553C9A0 
X-CRM114-Status: GOOD (  58.18  )
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

On Wed, Apr 16, 2025 at 6:46=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> > On Tue, Apr 15, 2025 at 9:50=E2=80=AFAM Daniel Lezcano
> > <daniel.lezcano@linaro.org> wrote:
> > > I have some concerns about this kind of changes:
> > >
> > >   * the core code may not be prepared for that, so loading / unloadin=
g
> > > the modules with active timers may result into some issues
> >
> > That's a fair concern, but permanent modules (which are loaded but not
> > unloaded) shouldn't suffer this issue. I recognize having modules be
> > fully unloadable is generally cleaner and preferred, but I also see
> > the benefit of allowing permanent modules to be one-way loaded so a
> > generic/distro kernel shared between lots of different platforms
> > doesn't need to be bloated with drivers that aren't used everywhere.
> > Obviously any single driver doesn't make a huge difference, but all
> > the small drivers together does add up.
>
> Yes, I agree.
>
> So the whole clockevent / clocksource drivers policy would have to be mak=
ing
> impossible to unload a module once it is loaded.
>
> Do you have any ideas how to ensure that the converted drivers follow thi=
s
> rule without putting more burden on the maintainer?

Permanent modules just don't have a module_exit() hook, so that is
pretty easy to look for.
Obviously, I don't want to add more burden to the maintainership.

From a given clockevent driver (or maybe a function pointer), we could
check on the registration by calling __module_address(addr) [thanks to
Sami Tolvanen for pointing that function out to me] on one of the
function pointers provided, and check that there isn't a module->exit
pointer.

For clocksources we already have an owner pointer in the clocksource
struct that the driver is supposed to set if it's a module, but
clocksources already handle the get/puts needed to prevent modules
unloading under us.

> > > * the timekeeping may do jump in the past [if and] when switching the
> > > clocksource
> >
> > ? It shouldn't. We've had tests in kselftest that switch between
> > clocksources checking for inconsistencies for awhile, so if such a
> > jump occurred it would be considered a bug.
>
> But in the context of modules, the current clocksource counter is running=
 but
> what about the clocksource's counter related to the module which will be
> started when the driver is loaded and then switches to the new clocksourc=
e. Is
> it possible in this case there is a time drift between the clocksource wh=
ich
> was started at boot time and the one started later when the module is loa=
ded ?

The clocksource code already has support for modules, and will do the
module_get and call enable hooks before switching to the new
clocksource. So the clocksource from the module has to be functioning
and running before timekeeping switches to using it.

By drift, its true changing clocksources can change the underlying
crystal so NTP has to begin again to determine any long-term frequency
adjustment needed, but we signal that properly.  And there should be
no time inconsistency during the switch as we accumulate everything
from the current clocksource and read a new base value from the new
clocksource. If there is, it's a bug.

> > >  * the GKI approach is to have an update for the 'mainline' kernel an=
d
> > > let the different SoC vendors deal with their drivers. I'm afraid thi=
s
> > > will prevent driver fixes to be carry on upstream because they will s=
tay
> > > in the OoT kernels
> >
> > I'm not sure I understand this point?  Could you expand on it a bit?
> > While I very much can understand concerns and potential downsides of
> > the GKI approach, I'm not sure how that applies to the submission
> > here, as the benefit would apply to classic distro kernels as much as
> > GKI.
>
> Ok let's consider my comment as out of the technical aspects of the chang=
es. I
> can clarify it but it does not enter into consideration for the module
> conversion. It is an overall feeling about the direction of all in module=
s for
> GKI policy. I'm a little worried about changes not carried on mainline be=
cause
> it is no longer an obstacle to keep OoT drivers. The core kernel is mainl=
ine
> but the drivers can be vendor provided as module. I understand it is alre=
ady
> the case but the time framework is the base brick of the system, so there=
 is
> the risk a platform is supported with less than the minimum functionality=
.

So separately from this patch submission, I agree that the GKI
approach does not enforce vendor participation upstream. But there is
no rule *anywhere* that makes folks participate, and with the old
vendor trees it was definitely worse.

The GKI does result in vendors having a common interest in the
*actual* common portions of the kernel to be working well, so we can
make sure things like bug fixes, etc are submitted upstream first.
That is a clear benefit over separate vendor trees, but it's not a
magic tool to get everyone submitting all of their code upstream.

Trying to cajole upstream participation via barriers (not supporting
modular drivers upstream to try to enforce vendors submit patches to
add built in drivers for support) won't really work because they will
just be enabled as modules anyway out of tree. And it's hard to argue
against, as there isn't really a technical benefit to the GKI
requiring lots of SoC specific hardware support be built in.  So it
only ends up being another reason to not bother with upstream.

<Sorry, I'm getting a bit soap-boxy here>
I personally think the best tool we have to improve participation and
collaboration with the community is to do what we can to make it a
positive/beneficial/worthwhile experience. Every time I've submitted
patches and had bugs pointed out or fixes suggested, is a huge value
to me, and I have tremendous appreciation for folks sharing their
knowledge and expertise. And every time a patch I send gets merged or
a bug I reported ends up being fixed, there is a real sense of pride
in the contribution made to such an important project. Then, to get to
a point of a maintainership, and to be able to consider these amazing
influential developers as (relative)peers feels like such a career
accomplishment!  As an individual, those moments feel awesome and
motivate me over and over to want to reach out and share patches or
issues or thoughts.

And yes, there are organizations that focus more on how to exploit the
community for their benefit without contributing, and I get the
protective reaction that maintainers have to that. But I also know
there is *a lot* of amazing expertise inside the heads of
*individuals* who don't participate because they don't feel the "us vs
them" combative interactions are worth it. I think we/the community
are missing out, and those folks are the ones we should be trying to
welcome and include in order to build up our community.

Maintainers and the community need to keep high technical standards
and make the right long term choices, and developers won't agree all
the time on what those are, and I think that's all fine! But I think
if we want to grow the community and have more participation (as well
as growing folks into maintainers), I think we'll have more success
focusing on the honey than the vinegar.

thanks
-john

