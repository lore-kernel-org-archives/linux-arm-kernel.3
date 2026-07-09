Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C12C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYS2uTBqKgSrer77DXZbILY3qQ1j4rYV+efL09YAvE4=; b=Ycg7LOUROr9TotuyI/6LN7jcEc
	IXyLGYJ64TGf0nzUXg5MeCh5/xmwasvvte8kS56UO12hAmyLVaNonr+8jh6l2U/hlbsEx7FVdGglq
	ONkeg9ma6stJ5/MDO538UFgF6nzsFiEaMbnFReELtNdZKUv+sIQdwCbj9sYnN6d4LUPHlRWldZ/DU
	G06REynS9RX+QAFl0DTkjI0DpRuKsLetU8jJYtk8YTSQk/y0TwlxFqVtvbqGcOssYytY5aLkeKqfm
	9PHWF05HN0fQ7W2Nf6FkKJHxXU170UgrY4QFHqVSStMxsWgmCKWr40Of//w9QRmwtWNZLaB8CwpB2
	piYv2G5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq3o-00000002pNP-1DDj;
	Thu, 09 Jul 2026 14:49:08 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq3l-00000002pML-45Rw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:49:07 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6a190528769so309530eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783608545; cv=none;
        d=google.com; s=arc-20260327;
        b=XY0F2rDyCwMKy3rcKg9YfwMe/6c4YU2pelYO3YeDrrB7XF6gMsVStLXBMv9VD5NuPH
         6Uebsd9YnYxyq6AwZ4r54Anx/QzMbAGqqsIWbKo9n+WuAhqpz3Jr+leSA+PGir/DTZ6Q
         LqWKxHrgijHYWHUvO+TCoCS7YEHFmhWwF2Lf6DNOh9xZBGahOP9PJoyx1hlHn1kZFeTI
         f5S2doIdpW8F6Rvxac4MG6o+SDioCA1FTQZ41VtRtpwS9LRrKattxNP9qq8ATF8+1P9X
         5mQ02zdzTcEpOJa4y4wm4g3bJr7lLed4Fpvs42e9Sb3ZdH46v9gRPUjOmQ8JQ0ULp5e9
         0eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MYS2uTBqKgSrer77DXZbILY3qQ1j4rYV+efL09YAvE4=;
        fh=EHMByh0JW4ZX5x+dfKj/56PU5Lu/IMSDaUGXZR89V1M=;
        b=fy6No0b1JTW/1+DArHtqRXSvo8lyZk5QwOhnbLWo2ZrntzmgRCHhNxaifDB/HUQUfz
         GzB91Xvm/CbB431uqt/PIK+18AVjya5nsGdydd2xpGPZg/7F29maLG3jzHFF9TZExG2V
         CHnSE7P8be2wNpie/tsjOEtB5wxB1sha2J99mwwVI9M3wWgEB+jqOZxrKvxICBHCo8GS
         CPxmQNPVcfQ9XjW33HZbQre109Ojpj/dmlRwkpRN2A4gAYck/C7jHL/TiLcHQcSqujt+
         JpAEMWrqRcln2epHFWdGeRDmB8NzxUdE+sVbyMJmik/z6Ke4Sr4Jk34PqRti7vAC7Tq7
         sFNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783608545; x=1784213345; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYS2uTBqKgSrer77DXZbILY3qQ1j4rYV+efL09YAvE4=;
        b=dRIyewoyrJ/4EfS0UAVh5weXJcEDsbFKNaQ+3o0xYxVnGSIwaF6mCtyzZ1dJbXXeCp
         m7k2Dhl73bXLPA/PE3kzq8fFr8ExDdYZaiqeb15IBmIUXQudAgJ98OyxhQuDRKaPr53u
         KlvELnI7zMXwxsSlbSm1etpVuNvXLoEzclIfuHr9N+B/2qheUYybOVpouUZCqbQEt4CG
         nAEUSFTZcTJukWGZSmtD9t3H5j1p0mnpmF9DemP2+OY4Inz9XLyHZtMLaKvuVfwlAWOL
         9Rz+EuETlSpQf8cfzoO5O3rvZ105LXZ62ZJWelY/LnHnlwdAxUyR0y0l+wtoDeKYeuUz
         xTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608545; x=1784213345;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MYS2uTBqKgSrer77DXZbILY3qQ1j4rYV+efL09YAvE4=;
        b=MIkrFc3q83rPkxDOmI1VheVa56ItWfsUXAUZIse1hAhtDSfziTxJfEOXYXCR26maf/
         3pNJ2FzdBKlBNQCBX9FsFEHFL7l4Ad796zaUgjyZq/sNpRT1dwkEY5OK1TyBjIyuDSsM
         KbOuFBjgG/x2gE7Yz8Vz+xTqRhxexOpXccZHSZ8OfismFGm/frkTZqXjCOEVJwLeQQAd
         zbI4w+c/v1+cYXwf1+Bx1QQXjte5W6Fvo3g9+f+8HtrgN4+sMs+DSdftS5xaAUzp8K3+
         bKPyk7/sxkGSL6emNxqxA2FOhhBdsfw1wUgwGO1p1g8VZwnyRbSysz18glG2s4UDr4kp
         L7kg==
X-Forwarded-Encrypted: i=1; AFNElJ8aMOLUU9ivdows31BeRYFG8IgsrNhwFgtvhb3nuOBYtchN2XLT4t9E7N60TwqBUU5FkGZcJhCSppSLIDM6yCar@lists.infradead.org
X-Gm-Message-State: AOJu0YzYPQlWa8YIVyBw/U8Lk5nHFe1py+rHpM1wV+25KhEDDMZWAcqd
	KZeB6iUFkthGvzPw6ofWn8gMAYDDHTOyg8suXa+8v1imsToAZgo9eXBrmOmqFRtQCXWq0p14P3l
	LLXUoZVqVLZcTkJY1HHYYv8vvspsFGN1hLyL9ae6a0w==
X-Gm-Gg: AfdE7ck4Ynvm7kR6E8gAEyi5TBDHbXo7etcbreBkRP3nFBFw0LctZBMvoT56SKlBofQ
	lV9tBTUd0e5xPTABaw2AoRa46MvqBrNyKIedMCPIANXlRMAiQWrj+eLBkzyx8gbolC7M6Inc7Rl
	tw7DcL2TICdNJRqEdPXp6Iufd7ALPnoH4bnvN4yefJ38O77+XdWqF+YiwOlHgY5B/OgpETLdAyQ
	ARGaRWIQ0wjnxvqmaJwnRkOtO3AqCjA7N+7xNjmtz7Gz4/gylr470Zuh7JTGb78UYh3OvHaZXJX
	MAZQpWFPcw93dXbUBs2NC+NDy+SazVGbedXiM5mvF5+IWv7NZ5JRprYorP7EG3dnRImtKwWMIVZ
	GCqNIFyaNhxBUSPfCWDGty+fFOfc/
X-Received: by 2002:a05:6820:4b91:b0:6a1:87d1:402a with SMTP id
 006d021491bc7-6a36d8db604mr5711492eaf.20.1783608544960; Thu, 09 Jul 2026
 07:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>
 <ak5mPxUdp2pzCMt5@pathway.suse.cz> <CALqELGxjTZAXEp1C1CNO2tLbUpUChZW3DHcNgyhEu4Ma-ct2ow@mail.gmail.com>
 <ak-vqrSr7NLCkGQw@pathway.suse.cz>
In-Reply-To: <ak-vqrSr7NLCkGQw@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 15:48:53 +0100
X-Gm-Features: AUfX_mwJgx6F5Vn2HOCATKNy1ql8ixFyCz9Yy1yVyKHgtQVtX5Yb7ZaDGdYvvFI
Message-ID: <CALqELGyd0UQu2T=odSG6eavnzZ6bmJVd4VKo3oAVTyRpkkSRQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] printk: deprecate boot_delay in favour of printk_delay
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074906_022061_7E1FEF7C 
X-CRM114-Status: GOOD (  25.18  )
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

Hi Petr,

>
> I would change this to sizeof(unsigned int) as well.
>
> >                 .mode           = 0644,
> > -               .proc_handler   = proc_dointvec_minmax,
> > +               .proc_handler   = proc_douintvec_minmax,
> >                 .extra1         = SYSCTL_ZERO,
> >                 .extra2         = (void *)&ten_thousand,
> >         },

OK.


>
> Otherwise, it looks good to me.
>
> > This makes the cast explict, verifies the range before casting
>
> Yup.
>
> > (I guess a range of negative values could result in a postive value
> > within the 10,000 range) and also uses the correct proc_handler.
>
> IMHO, this should not happen. I have never seen int smaller than 4
> bytes. If I count it correctly, positive numbers should be up to 32767.
>
>
> > This has the side effect of not showing the following pr_debug for the
> > lpj calculation when a delay is not set. Though loops_per_msec is only
> > used during boot, so I don't think there is any loss here.
>
> I agree that it should not harm. But please mention this in
> the commit message.

Yes, sure.


>
> >         pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
> >                 "HZ: %d, loops_per_msec: %llu\n",
> >                 printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);
> >
> > Can I keep your Reviewed-By with these changes?
>
> Feel free to keep it. That said, please put at least the change
> of the ctl_table into a separate patch. I would rather put both new
> changes into separate file. It is never a good idea to hide
> such changes in a complex patch which mostly reshuffles an existing
> code.

Yes, that's a fair point.

Thanks,

Andrew Murray


>
> Best Regards,
> Petr

