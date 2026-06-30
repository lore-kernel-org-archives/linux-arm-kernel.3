Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41569C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 22:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9TcR4Yz6DpFSlXvr+yDzPu4H7AnM/KEd+rjjy7XQeg=; b=pVWXcOQ4LDj8o+HwNFMv0r4m+n
	OCyz4FyN2bouZkDTPzMvnuF8E1rN56m1qLpfu8UY1xBIx9LfqYutu7MYlQYKBVpjlgjyUSpfSKHEe
	oQE+5nFWu2uuQKhUP9UgXXqSFTXoc+/4taFjyFUFEDr7KBO8GZex/1x/EduF6V1tJEintKJhtqmqL
	Z05pe04l1VhFM+wvIqOem089qyT10DXxK+2TE9uifUs4DczeMPyR8+vdNKqG65H13yU3siB4na4L0
	9Erm5T/IMkN1J7tA9riUeGh/6PpTh6hcbtuzMJt3WNlJ146eSUOm9afKNpCOt01Vgict7CoKvFYJ0
	Z2Im7XCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wehGX-00000000KM8-2fRu;
	Tue, 30 Jun 2026 22:49:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wehGW-00000000KLp-0WwW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 22:49:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AA6F6001D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026F01F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782859755;
	bh=O9TcR4Yz6DpFSlXvr+yDzPu4H7AnM/KEd+rjjy7XQeg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HC8t2jQ2/HGMqmkqGMzFl4agsKy36QdWakSf8PPuxWHKx/LWRDvUvaYTa7ldTAeVm
	 KcX3Ym/2XwS3JOQwCAziybbvSw3M+ktL8Ct5qmJ0JLjJGWyg6KmNMmU9Z2kUGIvxHJ
	 wQmWxA5AB2J4G6PEMEcofVUbIHHvE3L9RpUBLGiobdy5TZ0+vhFV5jzSJNYR2mpsn+
	 wJhKTADsJdCEdKj5HcdFBrAGEqoqdxD0hGYXDUuyV7q7uBHXLd77ALaWcmvoDj6kgR
	 6Tti3Wr6L3Y59cuJjLRBe97EWNYIomRnk56RspIubjCnSf1rGwtEloNeZxJLPfHMl/
	 wDOvz71FDM+sA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso3560137e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 15:49:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RohQjQI3/PrPY0YFWjzQmwLMB4ORBLANr1hQbDNEqX7ctGQuT/NbOPM8mczm89D2VZxWfLzs0tj2OLwytj3iaqG@lists.infradead.org
X-Gm-Message-State: AOJu0YzS50y09zx125OQifgSURKoE8AHP/7E4UzttyWk3jEl8FdWs8ZM
	dH1RirQzKB+lBB0iB0nWMc9fQiZ6vdF6RbG8D4wgSJfR2gr0JDdrMDKiipJceHNzjfeiPvRU6e5
	EwhPjOy0sUeSXpp70lMJ6bTBsZqKz6+Y=
X-Received: by 2002:ac2:4282:0:b0:5ae:b8b6:9e0f with SMTP id
 2adb3069b0e04-5aec10c64eamr420721e87.49.1782859753827; Tue, 30 Jun 2026
 15:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260629123349.134224-1-xieyuanbin1@huawei.com>
In-Reply-To: <20260629123349.134224-1-xieyuanbin1@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:49:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLmB-rC3ejO1xMF+UVdknajZAO9=U_UUP4UxWi7dh8zwSQ@mail.gmail.com>
X-Gm-Features: AVVi8CfsNtv33yTJavEkZjfKItNx0ahdwl6_AjkyQ9VJvpvjz0AXqCxApaI8BTc
Message-ID: <CAD++jLmB-rC3ejO1xMF+UVdknajZAO9=U_UUP4UxWi7dh8zwSQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: enable interrupts when unhandled user faults are triggered
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	rostedt@goodmis.org, rmk+kernel@armlinux.org.uk, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com, lilinjie8@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jun 29, 2026 at 2:34=E2=80=AFPM Xie Yuanbin <xieyuanbin1@huawei.com=
> wrote:

> PREEMPT_RT requires interrupts to be enabled when sending signals.
>
> When do_DataAbort()/do_PrefetchAbort() triggers unhandled user faults,
> that is `inf->fn()` return a non-zero value, and the interrupts are not
> enabled within the hook function, force_sig_fault() will be called
> with interrupts disabled.
>
> This can be triggered by user programs executing the bkpt instruction,
> with kernel config CONFIG_PERF_EVENTS=3Dn.
>
> Enable interrupts in do_DataAbort()/do_PrefetchAbort() when unhandled
> user faults are triggered to fix the issue.
>
> Fixes: c6e61c06d606 ("ARM: 9463/1: Allow to enable RT")
>

Skip blank line.

> Suggested-by: Russell King <linux@armlinux.org.uk>
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>

I had something like this in my (currently put on ice) generic entry
patch series:
https://lore.kernel.org/linux-arm-kernel/20250225-arm-generic-entry-v5-30-2=
f02313653e5@linaro.org/

This goes in that direction so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

