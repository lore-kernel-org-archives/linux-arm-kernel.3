Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3ACCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weXwqxQBZCGF/DjDGP8L+VzYsjiEKQCKAFEJ897yvck=; b=Mah7gveP5tKscJzgBtyaLw/ci2
	d2yK+39KlfTh2HqzjgPpdwtWLGwxBw8ZaAazIh5kBadB/Z7kbsKjybl87O/k0oMQGTdBi2QVm0lnJ
	R7TT7koW1UtFOT7iBaqQ49aVBujG2TOnAbxktccDl3ChRDKTx7ysO/5y1u5M/qPOtEVyWnv1/CLhe
	1zdfkLML8IF6SD6C/NiwPSk+kU/GVLmC9HW/0q1zZ6E0sZRlPRnKS7AKaIOsAaZQo6Nl4wtiFECVi
	QodnfaA/pBrEGZqicPCjmbs+dZR7C8kr28ei/Bn0fYdlWnwEUXCZCFY2OOWx25GgUqEOfmP3SyY8K
	uA4jvDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkNi-0000000Czdx-3PbF;
	Sun, 14 Jun 2026 12:56:06 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkNg-0000000CzdE-3GKt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 12:56:05 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4864abba33fso1587420b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 05:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781441764; cv=none;
        d=google.com; s=arc-20240605;
        b=UedjW53VXCEyWjGo0Srh3kbinwVGes/SBEITQsq/UGE//iocp2LJxSqLwPiNHdr3ua
         +vGbTfUCZj7Mp5BMq668PX+z8QYT6UP/3LCG4zkmr/hH9KA+RO9k3pfO1zBy/aLKTnxG
         JTast2uel4fSIT8GVa89s6w3GgRoVMt7AnIWOEbGuYMQvMBwUEayUgq7/gTpK/eR3+K9
         nNvWP5ZXLCIBpl3VIXpQXc94tS4a8ydLrM3Pyk7pPXYnCP4IxV4PxPr6ZAbdsFyaYgiW
         bT7hZdg96x4S3jpIrvI6uXp52a8HjSH/LD3CuSfOtBPgsm6Bc6BlT/45R6IpErbqxFL3
         0Rnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=weXwqxQBZCGF/DjDGP8L+VzYsjiEKQCKAFEJ897yvck=;
        fh=qkD3yjlprgmcTu8YrITBxHPz9JfBabfg7Jq74zo0YWw=;
        b=KyIH4zLZxqmwOTjpTPb3g93CH0HestxtvzdXl7ijr5azRXDG7RoHTCeA1Pc4DfKShV
         uJYGGFX49PRsaaZFE8umLjYLfY3h3ulsy9Y730Qlrx7R910brkbEgs7iomo9fSRsLdXS
         T+LdeUvE8lYCiq1GK+ti3WMk9MZiNe9dKLENGVKN+VB7jblDYYv7iuvJ6cGPtKQDFojg
         L8LNICIt1NDOWSeEGcqEgvYKp7hMxex8wRNeCeR3txVZMQUfi5+KtsBoz//JsWNSVN2B
         xEKozZwno8Q2j2W1JICBwbSVjD7l6uZJTWQdRnROCfPuKyl+slxxgc3X798h6yncxZmV
         g/pg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1781441764; x=1782046564; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=weXwqxQBZCGF/DjDGP8L+VzYsjiEKQCKAFEJ897yvck=;
        b=jdOlC9qq4qWPOYDNrshiyyq/osv7xZJlhnz9lvGnnimoJekQd3R31jwSymiATsAZxq
         wHgRwYr7RvblqJ4oIKwVE3corutzafrYo12gteAcASsXuUu1ZgoACmcg/FDp+K2xcaPi
         l2MAhXfPlRQdYzSda4lLgbqz2A5LapnxL7Tvd6zGU/EeHuPsUDK6DNe3kVZHROqkJp7C
         CaQPf5ScXWLP1hglKeAkZCIBSlrBOEbEpZWdsdeAMCG0x6QbYcAv2JMstdIyiej5mb+s
         MAlJ8ZbA4hX/nj6JfvCINnfilXfFx0gPGo1A7cvyTBZRjbr7VCISWYKOSSm+7kM2qQJ/
         +bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781441764; x=1782046564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weXwqxQBZCGF/DjDGP8L+VzYsjiEKQCKAFEJ897yvck=;
        b=qX8RJMSEYspArU1E1FSKJ09AszHAVhMXp7uxITc9h1358SfPl1ZkAZqH1WDFmZnI4M
         Gfef2AkMYT+XC2R1Xt3KNa2XnH3ymSnWxGdn2WtqrkDjO0E3Km1weEuZJvG/lei73UPv
         Jf74SkA7TrxXWpxgLQvSkJGJhWv0hEIkm/Yx68yp0IBww3iHNYJ6w2GiYbKqvI0ZHQGi
         bLgG+DhXpDFXeJMsyGx1VNDwOI8Tdae6RACApab1YiStTuh2VDd5KkUOBjXtYZb3aBir
         o2pRAy9LNzbolnEKN0bOZEagdH8P50+p7xa1mNh7h7czb1Cmkf+Pe+H6+yJk1fvIvN/v
         aQCw==
X-Forwarded-Encrypted: i=1; AFNElJ8scnYjA8hM/sQBQoh6Od7BvTZrkU8cmFzE8HU1qhUZvUsDzkrjT7CdYjvA38R+/CDYpOg/uT+84qRho4dp9bxK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+PiTC3HG+kDVeJB0lh3wEJqxfgkRPMDG5/w6A/2bbMlwaoMWh
	Ejz3AegFtCr0EKDYq/Qaj/jvvmrWehKo+qcsrJ6lKz3M64KyBg1FrJXWcYhfAQhTrlct8GXyLU7
	zhARAdRQ7Z9Efr3wbrRg4wQAdVOrP46Tq/7Y7R5DU3g==
X-Gm-Gg: Acq92OFWrKpStRf+ZiVduqneZD8U2a+f3M41RI1vCe93NbGMu47+1c6ps4TJtlkcrG0
	C9EbqxGE434HL7FNigEOm7sf+nmdgzpLIXB41ATZ+nafpNulQ+C6+17kVcs42HkLxJM2Pf4mRNr
	18U7Dhl58RXruyXf0TYC/wDU/Grlk3+2xwKvHRZR48CylQIdgtWFIEf/9/6Yv+AtQK1cnyrFGZB
	nSh3rP3RfFSIP9ebc+4k3DfYAX7A78nPmO8RUyFq/rPnLfHPi/s0nh58WkFUieO0m7FuKnqCQ93
	2vszyorFSDIn0lUDFXjFPSqgOZOpML4EIKcR8bZjpdvyRlwI/OqeDSUjLRPKrugWnhjAz7qMg30
	8Z7ArTAWD/77hu01vWz/aJJVnvIdzt7Wxv3c82rI=
X-Received: by 2002:a05:6808:3025:b0:486:4b79:12b6 with SMTP id
 5614622812f47-4872dde9912mr5576862b6e.9.1781441763846; Sun, 14 Jun 2026
 05:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-4-c34c187142a6@thegoodpenguin.co.uk> <aibfFQpK0Se-SiaT@pathway.suse.cz>
In-Reply-To: <aibfFQpK0Se-SiaT@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 14 Jun 2026 13:55:51 +0100
X-Gm-Features: AVVi8CcZ8P3gD-g-OZJNOPUE3PVXT5e3I-du7zp9_GgQG2DxRwtKKm-rCROOcqc
Message-ID: <CALqELGz7F0eL9e70OfJLMFLNKDhCG237hr0gG5qo-8pDuEo9Dw@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] Documentation/kernel-parameters: add/update printk_delay/boot_delay
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_055604_841579_9823F4F4 
X-CRM114-Status: GOOD (  12.15  )
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

On Mon, 8 Jun 2026 at 16:26, Petr Mladek <pmladek@suse.com> wrote:
>
> On Mon 2026-06-01 00:17:40, Andrew Murray wrote:
> > boot_delay has been deprecated in favour of an extended printk_delay,
> > let's update kernel-parameters to reflect the addition of printk_delay
> > and the deprecation of boot_delay.
> >
> > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
>
> LGTM:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Best Regards,
> Petr

Thanks for the reviews!

Andrew Murray

