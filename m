Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566D5C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUdwWMmdYpRWctOElE23L2fIeNE3afrw4G+RZhKXn0o=; b=37IXFjIEunlRx0OXpkoLLdKMUG
	3l8WJpR9T4wJ+429/7KCKJVVbisQ9pl8wLMuKHf1fOP0fKhhlso2+eEzJ1HsRFA0/Gn8AY75dF7eH
	FjIIVrAtM7cOSs2Pi8e65xNFCHcAUjTT+ZtiZoYdquJw6KgwqHqnng9H0mzZj09SJyZ3xkFzYUW4x
	x1IYKd0TMjcaVpTnTCL6Myze9C058tcZ4RESE/fW+qZYLGvl2W4xMH7GJ8y3jE+uqjSeS6xYU/arL
	lo1zyG1qVpSw4LjdmLvD/UGvHEUnkHxv7R6tWOUvb1zMgmLZxREWZAUErgQeiLOTnTdWbh5CE7y31
	o+KzbK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKPs-0000000Do3r-0eoS;
	Wed, 28 May 2025 17:18:12 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKNi-0000000Dnrn-47ZB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 17:16:00 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so592a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 10:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748452556; x=1749057356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUdwWMmdYpRWctOElE23L2fIeNE3afrw4G+RZhKXn0o=;
        b=ZcPJdE5HMQT/vdsXp2/R9h5/1QHGdGCM+sxB6vMHqH5ToYsqHObzpDUIz1kQ4cee69
         SpC1kijIM/eNdtT29M0YHP+MJ8hPvQeJAITz7I25XyIkqG1G5na+aUDllWoPC1oJ2Bsh
         WMW5XyIjzkS7hCDD7iL9b3u9jtOLW96Ftr+2/R8bqn7TS5kqdQ2yb/cniII8xplNPye1
         afFyqWPyrnUGRa5t8xOiSo7EtnhqNiNcopqDL96Fi8q7Mm9daBs3Qe1JhGzHR/UoTe2d
         pbOj2aou7qR4bDYV2eimL5yF5VCZG58o1Jm3VblJd4Rkg6XhmwdwIypbZUagj9oMEuf4
         s+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748452556; x=1749057356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUdwWMmdYpRWctOElE23L2fIeNE3afrw4G+RZhKXn0o=;
        b=BXlQDuLAMHB8HXcxjcqG5hcSnxc4wJam+nE8svQEeIKRd9zZvnFyjFMgj8t4B6cJTN
         pLMiSG+ZneTWALoVEzZqM1HR0uNEn6f0vBomBLElJpYIOWCUIkGK8zDWugmFZ5MJ1JpJ
         qTRjsRaaawkX1dBlmC5TI/uAq0xu+5ZoGBpBb+0TgjhebOKGQgbO4Y/CiWe+2r2BPs4q
         Cm6aE/lrXjW6086pDfPSRXcfxMK6+E2dFEHR6j9M4aYv7bnNzjnYFdNe+O0nGIda5awc
         cBdBLSQA8SzlMoU6ICngg66Fl4/ZAAEt/dRCMEUwFQwqIiclOKdnGWR4M8DRjHjBpdql
         Xhuw==
X-Forwarded-Encrypted: i=1; AJvYcCWMMU9BA/fU+VJUt6X0phv34kkgte9FuuxER9YcoDd0qBK+oelQ3vCEDnSIHIACx9pIF/aFLKGFutq8QEo9Z5JM@lists.infradead.org
X-Gm-Message-State: AOJu0YwHFyrGTYv/8TPnR3J8udCRg5Vc/t74HK4RHvntqCGoliPBJUiL
	pqUXUGXWyTTer0K5/j8azNKq2y6MwfeQGaLZ74ZF63MV4aF6PwjIUQNjrv89yqvdSQlh8WGcUu0
	NWrkAglLYhD1VLB6M3s1Wn2p8bBSfUmLXM9KGzTvF
X-Gm-Gg: ASbGncu2sf1qIv/LscSbxkYJT0zXhVOs1N63Ufy+JvQwEu/CQdiXfkxVLMPGF4mQzZP
	VYCwDGXumkRoCn9mH5lQW+XWud0VtgoOg+x98MsdmUPOL6WxMAEpRkbgKexP6ZeS8VmwbiDiqsW
	wVPi7VDsXILL78W2WV+R2Z6Pg0/T2kqOu4sOri6+EIUE2z/elhlfDf0PfKkjidlQmCj8LTnwU=
X-Google-Smtp-Source: AGHT+IEt7PzAIkfFsXWZlxFmSgQSVYAlHTzvWz749ZmQ/S1uJVlMVoEN7SLnaEY1BBFoG5gmWjLgKZ2VITWWPkBMzQE=
X-Received: by 2002:a05:6402:14e:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-60518dd2ce6mr131981a12.7.1748452556188; Wed, 28 May 2025
 10:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <202505281024.f42beaa7-lkp@intel.com> <20250528061427.GA42911@sol> <202505280937.6802F0F210@keescook>
In-Reply-To: <202505280937.6802F0F210@keescook>
From: Jann Horn <jannh@google.com>
Date: Wed, 28 May 2025 19:15:18 +0200
X-Gm-Features: AX0GCFtG0eJUnIASULD2nwd-Zdd6sAxsHjSny6-oy6ySySzZaKEp0fZyIUqXpLw
Message-ID: <CAG48ez3i37DYjM+SjBjC-VKQOiJs7-YVdLEQ7aqXQwxWs-rS9Q@mail.gmail.com>
Subject: Re: [linus:master] [crypto] 40b9969796: UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c
To: Kees Cook <kees@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	linux-hardening@vger.kernel.org, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_101559_021644_D5F217E6 
X-CRM114-Status: GOOD (  26.29  )
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

On Wed, May 28, 2025 at 6:46=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Tue, May 27, 2025 at 11:14:27PM -0700, Eric Biggers wrote:
> > If this new sanitizer is going to move forward, is there any sort of pl=
an or
> > guide for how to update code to be compatible with it?  Specifically co=
nsidering
> > common situations where unsigned wraparound (which is defined behavior =
in C) can
> > be intentionally relied on, like calculating the distance from the next=
 N-byte
> > boundary.  What are the best practices now?
>
> Hi, yes, this is still under development. I tried to make it hard to
> enable accidentally (not via COMPILE_TEST, not UBSAN-default, etc), but
> we (still) don't have a way to disable configs for randconfigs. :(
>
> We're hoping to see Clang 21 with the more versatile Overflow Behavior Ty=
pes:
> https://discourse.llvm.org/t/rfc-v2-clang-introduce-overflowbehaviortypes=
-for-wrapping-and-non-wrapping-arithmetic/86507
>
> and our current testing is showing many fewer false positives. (Having
> run syzkaller for weeks now.)
>
> > Documentation/dev-tools/ubsan.rst says nothing about this and only ment=
ions
> > "undefined behavior", which this is not.
>
> Right -- this will get extensive documentation before we move it out of
> its development phase.
>
> I'm not sure how to enforce "don't enable this unless you're developing
> the Overflow Behavior Types" with current Kconfig, given the randconfig
> gap... I have some memory of Arnd doing something special with his
> randconfigs to avoid these kinds of things, but I can't find it now.

You could depend on CONFIG_BROKEN, the canonical "if you enable this
and stuff breaks, it's your fault" flag?

Or if you want something even more explicit, maybe something like this
would do the job, so that you have to set an environment variable for
the kernel build to unlock the feature? (To be clear, I'm not fluent
in kconfig, and this is almost certainly a terribly convoluted way of
writing this - if you like the idea you should figure out the proper
syntax.)

config VERY_BROKEN
  def_bool $(success,sh -c 'echo $ENABLE_VERY_BROKEN_STUFF | grep "^y$"')

config FOO
  depends on VERY_BROKEN

