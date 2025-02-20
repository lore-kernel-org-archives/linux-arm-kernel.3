Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AD6C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sY+NBIYy2gT0zvxaoVTjE3mqscsqAzDhfABvZ+XFdRg=; b=elmYAaZ/uuAVMqcKWNx+s3pLfl
	eWUt9GExkHuLiwQMLA7JGCTe28bthka5PAv3hmtNf+wzLSfdanqWZ5GQLbjYX48clGIhxSeq6lSkv
	sXMVlUIxBiPeT1J/mlO+kFtqMi61gBxZnY9GwURoS8TRUGfyzaoElE/iS/9N2uZZ/dD1FUtQDdWqg
	+9m96UWEFrCFfCNsLMevcxtCwyga9TiKGH6dPBK7S9gJd9XLqvUCg8wdkbl2PiWev6BfiEpJoJv1T
	pQn0qowQQdVxruYQ1jI4lJZj0A7hrb4tw7aEeYojwd1HGAVgQQOIEVvDgNLhSQfGx3hPIwjhI9YA8
	RctFclgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7F0-00000001E2S-0p9h;
	Thu, 20 Feb 2025 14:09:26 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7AK-00000001CqP-3UQS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:04:38 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso1084570e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740060274; x=1740665074; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sY+NBIYy2gT0zvxaoVTjE3mqscsqAzDhfABvZ+XFdRg=;
        b=uwOioSBqhV9FX34juSCEla4V1dM1CMOMI1OKCtXkHXUhK9uW4NoXHnyUdzvl9/hpyy
         sv1G/79gOmvwnTjlBgQE23mZ3XrxUJnQa9QiDn8uKxxsH7O5/F1GBrWt67Vq69nQAuHK
         Ng7NddudwM8uCwhcSbxYGKwmfbuF79LuV6nXcV5pRO8HdIc31f+gr0ho+XFXlsulW6aS
         2RgFJFRr5ZeV6EtIzKNl0U8AeZZ0gQK1iKwxtriaIZVG8KGu3qAsCth+Mz32HEDPJ7eq
         /y5eXnl7ktZ3D4IQOylS+t3sZHVuj/ms9Ng4GK+DW8nsrKXLaT5vfMYXEaPEwn/p5eMh
         ztSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740060274; x=1740665074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sY+NBIYy2gT0zvxaoVTjE3mqscsqAzDhfABvZ+XFdRg=;
        b=lg/CkV7GwF/kMgJBTH/JfPVL/u0KGGgOMglVCHr6O7OBquvBpm8srS/mZ+IDm8pyE8
         J8eHu4mMP1hibC8ipo0mSNpLxlcY3dClCRVlZ5k4Wzr6xpS/aFYUOzxtFNo66zsKndNv
         peSu4mOfkZPNI+V6D93GIUrRTI5BKYwq0Tc9t7dg4w8N+nFLb02uSoo116bf1dQOFnz8
         sLa+1KUKNPD7ZB7nBgyz1U68XVFDvfvG0ASaE8axy2m8VjrsaQVu4scbMN3Vp87hCM8+
         cQ9cMFAyTw7Em/MFOy2d9+8hSx1Ywx9LsiUvQ9S04+0qidtK02OLfggSFUlEWR+BxVON
         nYAA==
X-Forwarded-Encrypted: i=1; AJvYcCWiVktHxXYmWwBrCy102rg/0Lq7P7otjGjE6SpesS8lV+J9FvleiO7HcENxiMlkJOjpzEyqz52iFhMHNXIE0EfA@lists.infradead.org
X-Gm-Message-State: AOJu0YwXVB+G/R7JLTtihqgMWHy5v+wZm/15/1qes1b0nIsGhDITg7lk
	CQRYknCLSd6IlRNkymK3/jKuGqBu5eONB7BV6SL6WK+l4JJeDF4gBUn3W+anaAdP/bsYxClcQ30
	QWTICuA2I4YtApw5FyMn4pSmzTO613/rV+enhkA==
X-Gm-Gg: ASbGncsog5KCUqNEDPl+XCBnyZCjFbhbMJhmfnO7KXNdoRUy9Nhdx767YMpbz/T1KP5
	ascuYLfjqRhnj//3ttywNRFMSag7305xuKHbRhW9OyCncx/b+xrWbzJ6CiBAyABUYXPorF7je
X-Google-Smtp-Source: AGHT+IGJwZJ+HnwUiO5AZPnqLuBn5q7vQJN93vatOpb00wYq/6/uLggOK7k4mc6rL8mIKuVW88nuIEu1nK2DEGYr7YE=
X-Received: by 2002:a05:6512:688:b0:545:6f1:9494 with SMTP id
 2adb3069b0e04-5452fe6fbe0mr7094057e87.35.1740060273484; Thu, 20 Feb 2025
 06:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
 <20250214010325.GA12626@strace.io> <CACRpkdZJYFUhmPg3EWJeU42fzJMzWm7Sgn3XfELB2-PSCf6Ssw@mail.gmail.com>
 <20250214110508.GA19194@strace.io>
In-Reply-To: <20250214110508.GA19194@strace.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Feb 2025 15:04:22 +0100
X-Gm-Features: AWEUYZmkc4EjePowUwFakXU4c6G7RgBFrQLnwon4iEz2BqS1QCkM5_sbNQssIk8
Message-ID: <CACRpkdbmOiapucnzyd9-x4WJsRBs2pRdcgZ2-AoN3bdkNJaW_A@mail.gmail.com>
Subject: Re: [PATCH v4 00/31] ARM: Switch to generic entry
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	Eugene Syromyatnikov <evgsyr@gmail.com>, Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_060436_875500_0C082A31 
X-CRM114-Status: GOOD (  16.22  )
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

On Fri, Feb 14, 2025 at 12:05=E2=80=AFPM Dmitry V. Levin <ldv@strace.io> wr=
ote:

> > Sure, where can I find this test suite?
>
> It's a part of strace, you can find it e.g. at
> https://github.com/strace/strace
>
> To build and run it one can roughly do
> ./bootstrap && ./configure && make -j`nproc` && make -j`nproc check

make check produces some test failures on v6.14-rc1 on ARM
even before I apply the generic entry:

FAIL: filtering_syscall-syntax.test
FAIL: qual_fault-syscall.test
FAIL: qual_fault.test
FAIL: strace--tips-full.test
FAIL: strace-r.test
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary for strace 6.13.0.27.bbda4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
# TOTAL: 1409
# PASS:  1106
# SKIP:  298
# XFAIL: 0
# FAIL:  5
# XPASS: 0
# ERROR: 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

But I create more fails after my patch set ...
Some have to do with fast syscall restart (I need to look into this).

Then there is the fact that I had to add the  PTRACE_SYSEMU and
PTRACE_SYSEMU_SINGLESTEP as stubs returning -EIO
(modeled after UM) to use generic entry. Do you think this affects
the results?

Is there a way to run a single test? I tried to check the docs but
nothing obvious to me ... I guess I'm not used to this unit-tester.

Yours,
Linus Walleij

