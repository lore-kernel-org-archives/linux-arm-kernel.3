Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC7ACD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1rkmuWuJXVzNvn1+c174indnosmtT4pQFumhbjNtd8=; b=vOoLX3Cj9f0CST8yirIgudcVdZ
	pL7U3pjp56JctJcxHDZVlqb94oLizg9vSlKIx+62PBH3CQXxVtqCCYtCV5B6SvMYn9S8feo6nygpe
	3MJ+JQCsk5N1AwNkFdukYtttdCS0hsNLCJHVKqjFMfjd07l7zNwqs+zu9w/urdHYSR6t8wErtVa5I
	VVF3MBj5XUe02Cpzpxw6NVjkbx7pQm9oaak8oinlSGPL417ymiE/UIVnidxTS4f/I+twrNAEgrq+K
	k9ioQvwtf+glAEncQ7f/ZyORnmh82Qh0ez7SxZi07bfaET/QOlpL+kw4iKFhTK7qkIpszwEUZEDFy
	J1NIjhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrky-0000000HWNf-3Z1C;
	Wed, 17 Jun 2026 15:00:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrkv-0000000HWMj-3i4d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 15:00:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso44698885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781708439; x=1782313239; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1rkmuWuJXVzNvn1+c174indnosmtT4pQFumhbjNtd8=;
        b=W5eCGl1aWDHfP5NSdho2L8k1UnJU8lUB8UqirswzAWL0URY85evpWBAcVTWGav0vGN
         Nv6E9NuWORVXTecbHqgdM94Ykqk8gX19Q5A7WhzYHiNGa+hRQ2EhnISiLP867AZXVv0p
         Jk38RQwESzKdcx2S7flHLeyU8R0a6yosYQxVNyZyCYNTI+pNYLUQhiTHWBa69QyPUy5q
         aZmJBD6y1hPqLoSVvkRua2IOQH9rj+utiDl5eWwDOdlLxYU6Di8sAGBJvcsvWdmWngcM
         2g6ZFBbRqpeiSCRjr6Pv0RqtRhpzQUvwTCgiUaPepjvu8yIbqq7jLi77AywNnj1R+vPu
         i68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708439; x=1782313239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1rkmuWuJXVzNvn1+c174indnosmtT4pQFumhbjNtd8=;
        b=iSf1XTxptGIQ3Xg5uJHHwX6gOLL8fMhmuayQHl8dADpA3m073dRl05lgA8IU3yA9CN
         /7CMXQzaHfiKvmVapSVFFduKF2Mdqd5u6R8i3Ay9Ns5qx/VC4SauSSM6co3L6VUHNuOT
         Ba3S47cpS0P6AglRotzZxoEYlC0n5XCLTULThcRWwXfwuT1DNc/rg1AwFwuNCYkC8iQa
         ghRksJLLnBWBwU6o9g2xf6AloZCSvpWGVD2R0t+T9Bn/NA3wSqqalk3QU4nyVMjiMQfC
         QwwX+S2Ja7TcYZuep0QrcgsYM408OR1kSu0yjtla8qI8kM/034z5N8jaCy1ldsvMpreu
         8o7A==
X-Forwarded-Encrypted: i=1; AFNElJ9KBR15FvsG1KTaO4QoekeRr44h/iIRBsKqEAMoNHh+O5Jey2HqlxshvqEKyqJ0mIoNdpz+KTww2ZtkSTNecOpb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw11qninSlT4zmZNKDMAtuZw58oI4ZMogPMgolbslfyJVfrYnBj
	vi9ru6eZo2q+ZeT5G4fC43EAVz36YJhIvtvsm3KXCkmksL5gn+RMX222RCSHTeTMmPY=
X-Gm-Gg: Acq92OHtbF8e2oS6unxVXiZGzbBRDa3RNiU2pN0489Wsx1giJqTaEYNbUsa9QUyZnsL
	joq5j8eQzP4fsPnZXWfssQHReW5FtBfCyMqF5znTDH+ZYDbOdciwk7cyB+y1vVqgeTGkbu6qRKZ
	w7Wbj+wHzFD1Hm1/cQ2KosxuSzbNbEkYCr7WBRNn0Fi93MhEe+GsOxF16bqlveulyts7cH/BJfB
	P5D+CLDo3uJoSI3MnV9kk0dTZnXIrMTrsfQwTFQ0b+72uJ4aAb1BevQv3g230GSNm9kFaOsTZUw
	H/TlrZnU4Exp2g6IiktfUjMSCBspLTtsSUAj/hs6YENfFfkn+KCtpuAewPopHWU3vFiUhrRr90Q
	irwkzSqeM9H988FqCVvR31Va9uHQr8+xM7ynPnWntG1+LxDbHaYAyvFhJBmXQRxA8YNe0F76bxo
	WbBccVxBiNmWSawKD65aKH/71Bjg==
X-Received: by 2002:a05:600c:19cf:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-492333e8d65mr67062435e9.6.1781708437706;
        Wed, 17 Jun 2026 08:00:37 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619fb12edbsm17636664f8f.17.2026.06.17.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:37 -0700 (PDT)
Date: Wed, 17 Jun 2026 17:00:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] printk: deprecate boot_delay in favour of
 printk_delay
Message-ID: <ajK2kpLbvpiKkKBI@pathway.suse.cz>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-2-c34c187142a6@thegoodpenguin.co.uk>
 <aibMr16r55xE26rU@pathway.suse.cz>
 <CALqELGzTH8cTLVgX9CXuf_LFLgC97_yfqYJVHzU9ghPuev7SNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALqELGzTH8cTLVgX9CXuf_LFLgC97_yfqYJVHzU9ghPuev7SNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_080041_965685_8D1114BE 
X-CRM114-Status: GOOD (  28.89  )
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

On Sun 2026-06-14 12:45:44, Andrew Murray wrote:
> On Mon, 8 Jun 2026 at 15:07, Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Mon 2026-06-01 00:17:38, Andrew Murray wrote:
> > > The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> > > are two distinct mechanisms for providing similar functionality which add a
> > > delay prior to each printed printk message.
> > >
> > > boot_delay provides a kernel parameter for delaying printk output from
> > > kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> > > configurable only via sysctl and thus is only used post boot.
> > >
> > > Let's deprecate the boot_delay feature in favour of printk_delay. In order
> > > to preserve functionality, we'll also extend printk_delay such that it can
> > > additionally configured via a kernel parameter.
> >
> > > --- a/kernel/printk/printk.c
> > > +++ b/kernel/printk/printk.c
> > > @@ -1339,11 +1327,34 @@ static void boot_delay_msec(int level)
> > >       }
> > >  }
> > >  #else
> > > -static inline void boot_delay_msec(int level)
> > > +static inline void __init printk_delay_calculate(void)
> > > +{
> > > +}
> > > +
> > > +static inline void early_boot_delay_msec(void)
> > >  {
> >
> > It would be nice to print a warning that the early boot delay
> > does not work, something like:
> >
> >         pr_warn_once("Early boot delay does not work without CONFIG_GENERIC_CALIBRATE_DELAY enabled.\n");
> >
> > >  }
> > >  #endif
> > >
> > > +static int __init printk_delay_setup(char *str)
> > > +{
> > > +     get_option(&str, &printk_delay_msec);
> > > +     if (printk_delay_msec > 10 * 1000)
> > > +             printk_delay_msec = 0;
> >
> > Sashiko AI warns that this code accepts negative values.
> > It might cause long delays, see
> > https://sashiko.dev/#/patchset/20260601-deprecate_boot_delay-v1-0-c34c187142a6%40thegoodpenguin.co.uk
> >
> > The problem has already been there even before. But it would be nice
> > to fix it.
> 
> Thanks for pointing out Sashiko, I hadn't seen its review on my
> patches. Are authors expected to get emails from it, as I didn't?

Sashiko is able to send mails but it is opt-in.

It might create too much noise because it has false positives, it
keeps reporting minor or nice-to-fix problems which will "never"
get fixed. Also it is not predictable so that you could not reliably
check the patchset before sending.

Anyway, I thought about enabling this for printk-related patches
because Sashiko also gives a lot of useful feedback. And it is easier
to discuss it as reply to a mail. But AFAIK, it can be done only
per-mailing list. And printk does not have any dedicated mailing list.

So, I "always" search for the feedback at https://sashiko.dev/

Best Regards,
Petr

