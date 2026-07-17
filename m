Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22C0C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvqX1BcEi2ll08wPBPPLJIyQRF13ih/MJcl5l+I3Gbk=; b=W39mtImfxg4QBzMMiMFSAbezOP
	vm8AE+nFwGAoXdrHQvB/fzWZILPH07IuiOSe2Wn1EWt4mIYf6lwcG1N9dxRpSFKKIS/zqebugnPDe
	BDB1RF/aYXdOzwiEBkQio8Nrxi1/6cQZfDll9rLouYN4Hf76/AnmsGizAyEqnW3cQcuTtmjFG+WAB
	DydKMa9HduL2IM7cgLSUKCKWI903xtxH5FEjO+Kpw+RFbpFUXBswNzLMbXYVwpj0C9sDBoNWGK7ek
	B/I5oXDAx6k47LiFp3ZzZv6Y93NYKntLivsiqVJwmsvwcdhiN/NJMr8rn6QyveZ0MuyBI1jrqwZ6o
	mgAnUb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeae-00000001mzF-1yER;
	Fri, 17 Jul 2026 09:10:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeab-00000001myT-1hik
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:10:38 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-476d8e647e9so6949008f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 02:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784279435; x=1784884235; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GvqX1BcEi2ll08wPBPPLJIyQRF13ih/MJcl5l+I3Gbk=;
        b=KlMOuQ6mLGOwfANqy3X7oPqJo3WPrXD72aJcSV5eXBhtXpI/Ckukn1ZCAVi/vR8cHX
         tOi7dJ2lSOjnwBhV0fAScmAgLN6cWyTZId/e2UyBC2EYnwZsNEvLl+x1TlGFvMsYgzaW
         vPboQlRf6Z34I7Z1VEBQfoaxiKqu3HxtjkujUhjiCoP/1RH/GdiECQDDR6d+Fo3h8pb4
         tXaF1mpQgfxyxtzF0RFFpeIscVvcUM1FJpCy+R9wcwJ4mHRO79jYVHNn3g7NXUBUIgFU
         leoGyxlBq0iSgrgCvl7G1F81llaZW/eoKsc0fJ+6Re8kVuIedDJVPGbSJoNVPrwy3NLz
         TQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784279435; x=1784884235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvqX1BcEi2ll08wPBPPLJIyQRF13ih/MJcl5l+I3Gbk=;
        b=Q+RaVfQ4gSXUdM+PkIZMfKaOj/B8IIJwKu2YQ61aYOB3XwjKhr7o/177jnvYU4vqe7
         qwZDdpHC9KuwriAOTi8bkuM3SYg6G5TOpg8+fLoGZKZ0NjjbWL9bLBpDnhcjnj7oVpmi
         bbT5HQO9e6qKkQx4/OMsvtAZfLgUN9X1l6KvsJEpIYj0qC6XBDUGFHJnJuQSo6u9JkTd
         EFN2QM/DZXMqw/+QwZlsUUO9n2hno+hXsOurNyvC7PoerDhAAlBmUUBE6Y1LWoqs0jKp
         x5ZDT6eQZkN7peethH6nRZVJZfdpeY/xcs5n1IBYBF4glJCbw44HLRs3h0Dt5WiuFHCV
         NEHg==
X-Forwarded-Encrypted: i=1; AHgh+Rq09gU2aFoxQRF3xaoYon9Ex7qPduoQ6aOSxexYdJJ7SCKWNLqcALJsGgmLAUYtz+DeQlfrp8bUb81DWmvJgv0C@lists.infradead.org
X-Gm-Message-State: AOJu0YyvBSx8LmZCpVY7BYD9ADVwAX5SUVZ1NG0xB3M01l+RNoXgRsaJ
	PduCaYNb4oqHBqsEwmFH+JAkxZvx/RcyfK5bzrX4x/rOKl/FHdwTUbmG77HqkqB0+FY=
X-Gm-Gg: AfdE7ckvRpj+LaXPtiiGtjLPKX0xU9KuD3YAg0Dl2ItHu4wr0Q8/mdAjqeCSbW9otyT
	Oi9rBcWi/Y6X+xvcFzrkC0ReA2eo21L28lmPHrj4MSUFv2A27+kyFZMCXQRCP7fSqCAYtCD8WhF
	84zWWZkFkZsLnz5bKcpoR5i2OWAwi2RoHoBCzMfZNr3tME8EFhQKFCnsTn/sS1gBWgSJQ9b1CNY
	08I0VTvL5+cdXhUCRq2rr8rXQCeqPmKh2AUFFnTAYLykpeUSRqZsOBwSh5bPjMq1hj/hdTLA42N
	Czg6uNZ8ZgG1dlh4VXirL+L10Nlvf0MS3/00NQuNxAViJpvZPvYDbBDkJ+VNLQjy6Z6dCTKgFB3
	BcNdsoc985jYiPQ2A0iGTvH/hPPBaf3CqJCnolr0AINVBcAPqhKPVxqg11ziVefTXv6ReAoNKIk
	BBJIUI
X-Received: by 2002:a05:6000:41c2:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-47f62316912mr2385289f8f.25.1784279435367;
        Fri, 17 Jul 2026 02:10:35 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e519f4sm2116892f8f.14.2026.07.17.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:10:34 -0700 (PDT)
Date: Fri, 17 Jul 2026 11:10:32 +0200
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 6/6] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
Message-ID: <alnxiCmOWrdV5YjW@pathway.suse.cz>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
 <20260712-printkcleanup-v3-6-574547b8f71b@thegoodpenguin.co.uk>
 <20260714175131.1edfc880@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714175131.1edfc880@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_021037_456885_9FC26C39 
X-CRM114-Status: GOOD (  18.61  )
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

On Tue 2026-07-14 17:51:31, Steven Rostedt wrote:
> On Sun, 12 Jul 2026 11:20:37 +0100
> Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 2884103b93bca7b76cd3a93946276074cf62d0a1..1118feda87b1b04543b1da0bd52c090b1fddaeac 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -650,11 +650,19 @@ Kernel parameters
> >  			See Documentation/block/cmdline-partition.rst
> >  
> >  	boot_delay=	[KNL,EARLY]
> > -			Milliseconds to delay each printk during boot.
> > -			Only works if GENERIC_CALIBRATE_DELAY is enabled,
> > -			and you may also have to specify "lpj=".  Boot_delay
> > -			values larger than 10 seconds (10000) are assumed
> > -			erroneous and ignored.
> > +			Milliseconds to delay each printk during and post boot.
> > +			Boot time delays only work if GENERIC_CALIBRATE_DELAY
> > +			is enabled.
> > +
> > +			Once booted the delay can be removed or adjusted via
> > +			the printk_delay sysctl.
> > +
> > +			Please note that you may also have to specify "lpj=".
> > +			Boot_delay values larger than 10 seconds (10000) are
> > +			assumed erroneous and ignored.
> > +
> > +			This will soon be deprecated, please use printk_delay
> > +			instead.
> >  			Format: integer
> >  
> >  	bootconfig	[KNL,EARLY]
> > @@ -5468,6 +5476,19 @@ Kernel parameters
> >  	printk.time=	Show timing data prefixed to each printk message line
> >  			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
> >  
> > +	printk_delay=	[KNL,EARLY]
> > +			Milliseconds to delay each printk during and post boot.
> > +			Boot time delays only work if GENERIC_CALIBRATE_DELAY
> > +			is enabled.
> > +
> > +			Once booted the delay can be removed or adjusted via
> > +			the printk_delay sysctl.
> > +
> > +			Please note that you may also have to specify "lpj=".
> > +			printk_delay values larger than 10 seconds (10000) are
> > +			assumed erroneous and ignored.
> > +			Format: integer
> > +
> 
> The two parameters descriptions are identical. They should show something
> different. Is it just that the "boot_delay" name is getting deprecated?

Good point. We could remove all the details from the boot_delay
comment. Instead, we could say that it an obsolete alias to
printk_delay, will soon be drecated, ...

Best Regards,
Petr

