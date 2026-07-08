Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5931BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2V4c6FXtAmxv+8d6AOr3BYyTP+hfZgC/AR0Ye5xNZs=; b=IToXZtFj0synJwcaYhAk52OHzF
	M9Pct41Qtozbxzzcnf//3VQBlncwvWfL0STXvGAtHVe0OfxupcR/DsjWKTL/rb+jwKNO23PzY75oS
	5a+Lb3VdERl+Iye5iqdyx+BSHWLjKdTiSpKGgjsGIP3NvnXyB18FP3S3Og45r69rDic9uivWLFlAF
	vMyumxLUVpGThYRoG3G9ybBpbosGV8rMEcLU9SYw4zjXegpE2TrN9YhhjteVnBdQoHpXWlOyyTPin
	4joY930BtASp2+ZdFgDvfdkAOsZGLPT4cMM2+evB9nz+ZmfjgLEwD87pQ9JfJ1mXLhp0z96qAfvjb
	VmvaF4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTtm-0000000HRLD-2Xvt;
	Wed, 08 Jul 2026 15:09:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTtk-0000000HRKF-0SV7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:09:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so8515685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783523353; x=1784128153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2V4c6FXtAmxv+8d6AOr3BYyTP+hfZgC/AR0Ye5xNZs=;
        b=KH0DaG6VgdeYC8wpS9xdYp/hFNNAtMZNmVrJzHDZHnbbL7zW9LQTmt3zFhLn1/mOea
         D/t8BjMQ7sgZfcny1n96NmuGuaoDWc5xHmjktyrmfDWte7YU0ep4n+rX0ktWP9DL3U7Z
         pRme4UZyBT5P3oZLEQH/UwnMzVlovULos99n4tc1gRB0aPXtwX3H1WMqY4jihk1MaiK1
         HRQFwL+JBLMqtRjhJlx3N3ZQxA8dpIWx0GQgBf+N9q1wHbKGYilAu68GTEZWYJpCoGRX
         AXrkYfs8LmRse5b4LWQ6wVdv8VPdhO4Ov3pJkK40+pbQCzNzew9uthujXnuOJbLOPj8M
         P3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523353; x=1784128153;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2V4c6FXtAmxv+8d6AOr3BYyTP+hfZgC/AR0Ye5xNZs=;
        b=sXoUbP1lUwphsjsx0rVVu9vceJ+oQhwtJVnES4z0IosBMnyyCGu1MAhKPEu1IIuKj3
         MxHZTuoDOloOQzAVpQLpF/I34cKhnqlLx6i//1jAsHqCbbCIbF8bOWa8OgxJosXF/RZP
         TgaeJJH7S05HnZs249n2uiD5Zr7GyvXgT8c/fzdVw8pJIb9sZCodho000tMd/ggS8bBY
         Ik//GWufe5JNjzqYNfbKNbaIU5RDTM+z6TRQ2hsCi/1fbBzVME9Eplwl4zfJ3t+9iEim
         mXvjTmz3NDT3sYWIWO61HJgK3G6dfm5qObLlFTFd+Bnu6FPeY9zTQQpeD8FqbFLJ4Xy4
         IqNw==
X-Forwarded-Encrypted: i=1; AHgh+RolGHM4I40eqhme1A1diUbe6rrQuvwRv9UcO5aEGhxrkbHuKYGilJnn2V98X4QbY7t7yTzaKa48+GEW6Ip4/iEI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0NKvcAn4+VyURv2gCe4emvKLn4+e6qKR84LrthtaBx5LykS02
	tfRacFg/psV1w2UHyaGQqwh6Smj6ThAmonkiEvyqwAr2Nmt6YwPnAIU/6HbISndRBaU=
X-Gm-Gg: AfdE7clseo1I0PRT/1iDPznlTuCZhiK0qWdR/2gsPmfK8d2XDrc3SoykPwKlEdyhv9X
	8rouYYU8KoWBvGtMHYJkA0aDqL6i0GvnU3h98+xKsEhvtVWsDutDkcVbzEay8LJKZoz7qdPd31Z
	Qib+VI3TgHeeorG8Fy2paUOAffFrcxIe0Y1noCHuPiWzxCSi7SJtlBDOTmnKvhkEWEu650Qz75F
	d3cbuqu6oWwvEX8wpDZCw4iarI3GsoZdAwPEdCkpycQpJ7sChLMbu2+UntsX9lg2JFD5js403EY
	Td4uALlzmQxF8LmtcX43bRatZYTTnuJ6yBImT3uiQ4iIUMbK32nd4SCLhrIHsEEyLYMS82uK2/1
	qirQYrN6lrSl6Yz10wHXG/bHB62RUnrLC4qsqa9AI6PPe5yZav5rbTpc9FfcNDsqNY1HbgqrJ6x
	baHA4SoEjLYTAAcLA=
X-Received: by 2002:a05:600c:34d3:b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-493e68c699bmr33093525e9.16.1783523353384;
        Wed, 08 Jul 2026 08:09:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5b811sm238538095e9.13.2026.07.08.08.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:09:12 -0700 (PDT)
Date: Wed, 8 Jul 2026 17:09:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Benedikt Spranger <b.spranger@linutronix.de>,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <ak5oFk3Snnt9Wr95@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra>
 <ak0VguIf-PxmbUOS@pathway.suse.cz>
 <87qzldvqpm.fsf@jogness.linutronix.de>
 <ak5eCp5qw9LYrnAH@pathway.suse.cz>
 <87zf01ttve.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zf01ttve.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_080916_190269_E8A6C77D 
X-CRM114-Status: GOOD (  28.44  )
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

On Wed 2026-07-08 16:59:57, John Ogness wrote:
> On 2026-07-08, Petr Mladek <pmladek@suse.com> wrote:
> >> The synchronous mode would rely on the driver being nbcon. I envision
> >> something like this:
> >>
> >> ---- BEGIN SYNC IDEA ----
> >> --- a/kernel/printk/nbcon.c
> >> +++ b/kernel/printk/nbcon.c
> >> @@ -1200,7 +1200,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
> >>  	cookie = console_srcu_read_lock();
> >>  
> >>  	flags = console_srcu_read_flags(con);
> >> -	if (console_is_usable(con, flags, false)) {
> >> +	if (!(flags & CON_SYNC) &&  console_is_usable(con, flags, false)) {
> >
> > The dependency on con->flags means that the sync mode can be entered
> > only in task context where synchronize_srcu() can be called. It might
> > be good enough. But I am afraid that people are creative and would
> > like to have even atomic variant sooner or later.
> 
> You mean it can only be _modified_ in task context. Yes. I expect it is
> either specified as a boot arg or modified via some sysfs interface.

Makes sense.

> > Also it will do the flush in NORMAL_PRIO which is good. But it might
> > fail to get the context ownership when it is blocked, for example,
> > by uart_port_lock() which might be even sleepable context in
> > PREEMPT_RT kernel.
> 
> Indeed. This is the same limitation of the atomic printing in
> general. But I do not think this can be worked around during normal
> operation. Ignoring locks is not an option.

Let's see how it works in practice. But it might work pretty well.

Now, the question is how to move forward. It would be nice to
have the sync mode available before we add this boot/printk_delay
clean up.

Would you have time to prepare and send a patch anytime soon, please?

Or I wonder whether Andrew Murray might try to create a patch
based on your "SYNC IDEA".

Best Regards,
Petr

