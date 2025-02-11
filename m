Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FABC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvlqG2mdUySN91b26Hc4Mi8+p6b99eBWTzCbfUz6Rb0=; b=MxtKzdlxQociFYZA5RcgvT2LPv
	Sm7mgX7kvn77YXKqIckUkcuhWn2dZOKQJI+TOdBdnfwTXFyoBE3YwKcR4MyTmJxdrgDgZGdKH0jNq
	dZlX4PNPTCnp4kIKutb8fGPyhAbAVWWAgpKBC34v/svlI5NlIngIsshO2sSFbOZr8ZPyBVO+cvoDB
	Hte4cQH1CXe29Q2b6p+1mDhpzhyW0vsO+00lL8ApmFVSAZLwmCHd3SdM8ZUNIfcqEEz1CJ0mSOmYE
	DT2smkDma6kQ/aI130tUJc+g+vVyNLuOjgJwa8JFe1OWhuDpqygSGwK31I2tj05KYpnWNVhx0TqP0
	cg6ZNTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thiL4-00000002XVv-3BLj;
	Tue, 11 Feb 2025 04:57:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thiJd-00000002XMy-23Pl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 04:56:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso33549625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 20:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739249768; x=1739854568; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvlqG2mdUySN91b26Hc4Mi8+p6b99eBWTzCbfUz6Rb0=;
        b=Vnl53whZyPEq/sDUavh8a82g7VqFLRZUBQTMzd1fWrGSzp3ZPJMgzG3lrHEOwubADI
         cRR8QWEiifTWltJGCmWfUgB3GHO7SoyJAg2wOxjsJHrrMsqycg5y8yUIVbs2IXLHf6b5
         9UcLE5gEZjgP/y1ttvQcT+7hvwe0PxdCQ8ouuEb3izNZBSIdED12pGvAU9uqzcFJ9E7o
         LrOZjOUDBH4JpQG8yURheyJJ+Z5ERohL1HHfaq9ife0XpJs9rS8sA2xQlF6Bo5DmGojV
         92r8uXcRIdGeT1rTNMQZ34Xo8GYolQ41uuorDjCIZJ8RbjaKrzeHAmezXroS6SEOWJET
         0UCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739249768; x=1739854568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvlqG2mdUySN91b26Hc4Mi8+p6b99eBWTzCbfUz6Rb0=;
        b=WDtbOqqF6Lx/kYCblci698ry2XIWUg9SOr2EteUlNOsjKm3GrMvPedmW9+oSBVc2BE
         EDANBBQhvm+EptXIkDFcJ2fAVApsuJE/BbF9Sc6rmwXAfZlJ550+eVGSm5+L9CscBlZz
         GVs/tki4XOyKcuRV8Rw0QqlpslxH9pTW7yGi+zkm5TrePA5ssnZAgoXIgVL9Ha+BlyVV
         SVUQS7u3P6zXatPfVRI5C4J6gMIUQPIebleHbXXazngpxEDwDbNTDTQ8MKzXHApxPMy9
         oFjn72yQcOEeytSMW9eS2Lhtv3cJE5c9Xp3yxJbLv+ARewU7w9NevJxjwE+9uS+Vwfda
         MaQw==
X-Forwarded-Encrypted: i=1; AJvYcCXualZVJxoXd4jHbIBmsN73fVRFm+MwjNU+LJ8YkA3LToeI7KvgqaEFn29fTTuWjdD6718iBBfOx7b/zUblfBgJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyWXhCj302pDkGDdLndjBOLbbXxrQuEAh4rBRKlKuNl4WOgSrBG
	I+s2lRo1+FwnNdhqegEeoJXS+l4i28GAtOyPk03om235q7Uru0ZdXRTnjRRtwfS+MktCc75ODOU
	cju7dAXE4xyfQk1XayqiR6i6yrzE=
X-Gm-Gg: ASbGncu83El5URq+6lBphwVZ9n4gSVCY4lseel00kpzOwYZFm0Cqa1/XXnGRGWxbHCO
	2e2b5u3HCJPnWIFTDSvyD5aJ9k2HRbKWBPqyUL24gvD5BWjguKE9hTszcP3jjfdwry9dQFnEibu
	UhU8M8jin2HrAKfai1zcj4MMjEs8tl
X-Google-Smtp-Source: AGHT+IHVPH3y5XcET08qxG5mfIoe0bM1mbFDx4OVs43sslrkWwEXHC/aB8TK7KhECghuwskKJMQ5E/+WP1m+09AjE1g=
X-Received: by 2002:a05:600c:1e02:b0:434:9e1d:7626 with SMTP id
 5b1f17b1804b1-439249c02e2mr103937525e9.25.1739249767385; Mon, 10 Feb 2025
 20:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-8-memxor@gmail.com>
 <20250210095607.GH10324@noisy.programming.kicks-ass.net>
In-Reply-To: <20250210095607.GH10324@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 10 Feb 2025 20:55:56 -0800
X-Gm-Features: AWEUYZm_Ui-VlaR__Qfx0UBZP1wEkQULBhyDCk20ZqOu4LAS3ChHbdZQZd4xhLk
Message-ID: <CAADnVQKefT6iQVQ66QTCeRCMs_am4cC3pBt1Ym1fxfeeQVDDWA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 07/26] rqspinlock: Add support for timeouts
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Barret Rhoden <brho@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_205609_567071_C3F03DED 
X-CRM114-Status: GOOD (  14.48  )
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

On Mon, Feb 10, 2025 at 1:56=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Feb 06, 2025 at 02:54:15AM -0800, Kumar Kartikeya Dwivedi wrote:
> > @@ -68,6 +71,44 @@
> >
> >  #include "mcs_spinlock.h"
> >
> > +struct rqspinlock_timeout {
> > +     u64 timeout_end;
> > +     u64 duration;
> > +     u16 spin;
> > +};
> > +
> > +static noinline int check_timeout(struct rqspinlock_timeout *ts)
> > +{
> > +     u64 time =3D ktime_get_mono_fast_ns();
>
> This is only sane if you have a TSC clocksource. If you ever manage to
> hit the HPET fallback, you're *really* sad.

ktime_get_mono_fast_ns() is the best NMI safe time source we're aware of.
perf, rcu, even hardlockup detector are using it.
The clock source can drop to hpet on buggy hw and everything is indeed
sad in that case, but not like we have a choice.
Note that the timeout detection is the last resort.
The logic goes through AA and ABBA detection first.
So timeout means that the locking dependency is quite complex.
Periodically checking "are we spinning too long" via
ktime_get_mono_fast_ns() is what lets us abort the lock.
Maybe I'm missing the concern.
Should we use
__arch_get_hw_counter(VDSO_CLOCKMODE_TSC, NULL) instead ?

