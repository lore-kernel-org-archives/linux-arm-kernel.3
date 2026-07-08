Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6AFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6o/0oz9zzNfbXHaSSbGqw9HJrGj0kr4qZrqpo2nmLDc=; b=PMKy1KwIgKBXsImGDuJDpKCO3n
	GSmdff9rrCgSghQFnj0wJPYUVjxGCyPFh4GrwgqBDg+sRZxG3zE9WpTelYVWSegD/ip47g37PCGDh
	OLEsOjEvSGQ2TXAEldbx/l/0gKSCmvbTfXzg1pmHmM0lYws80Cu02JHJZy/5GHhcrgAbmDxGwtOSa
	Yao7WI4it+3ou7L+zL27CIO9uaUVyENJ2/XXQ3/+hj2Vdr2v4uHy8sDHGwobQlwQTDPbl/de0lQUk
	MuIraH7tDw8fgnSICsEiCdcjr6LJcka8psyaolkO3jC8LZFrm8gvF8U4271Ba+CpyOCjM0e0RFcVm
	0g4Vc+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTmB-0000000HQTn-2kRc;
	Wed, 08 Jul 2026 15:01:27 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTm7-0000000HQRt-2sVZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:01:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4759b4f0897so508513f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783522882; x=1784127682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6o/0oz9zzNfbXHaSSbGqw9HJrGj0kr4qZrqpo2nmLDc=;
        b=bXpc0rmtAOoRIsNAu9m9z1oHDHrPoODjLQ/jd8aVwLdcGb6KqYR1y3gve9l6uG1OmC
         7rpDK43r32lLdF2TJq/8VMyhCMuqLvr/+sDL4YZiaCI8tOXOd3/xFfO0g+dsu6V7+RcT
         f8raFMVpXi+YvTJ41R+uq06AQlWazlpOmL1qLtNk4m4JDQ9w/Bd6kXXc+4j12QSZRofQ
         ZPfU6KvKCS2by5WuVv1AvVODmEs8DkNzO50ApDrJCHYHcHtgdyEuhGnyxTBVP0ejKZmj
         ZF9cZGHddoQx6CymYIReEMU3YZq+KvpOHY7IPMJ4V3bWbau22txhgENYaYCRi1sjHDdn
         +o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522882; x=1784127682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6o/0oz9zzNfbXHaSSbGqw9HJrGj0kr4qZrqpo2nmLDc=;
        b=oaNtF+QKPrQXwW0h6YZ3IHTpSFvU/42HB4ZoSNRDx9zgT/N5AMUY9/C7Kzm5np2TuI
         dDaeOeg2ChHj5A8HNWotHVBe/U0+qZJbro1H1HRwSjuTwk8Md6HkU6ypKelKY/1fJ6SC
         Mnlo6XowiQhhTYGFp4kOFP2zSgRLeSqFXmym3V9qPiF39CNyIvlJ3JFYYUq0JpEDWXsS
         jex90QD2Z8yf8Hmzbx1bdAS+wItcVq9Nkvy51qzok259rHRA3XgZAHsveOmwthijABx5
         TMEG7nFeI3Mtxc8dt6Xr6Kha9YM6txKw/1fgLGiIXzgnIgYKM3dcXPdiaNQbHd4z/xB0
         w9cg==
X-Forwarded-Encrypted: i=1; AHgh+Roq66ut2g4y0MKzTpvS9nMcgxHO5NRAmOVvVvpEmM6a7Dx1ukcd9hLjxyQ0Rk1Q4o23coZ8DRY/onej881evbRm@lists.infradead.org
X-Gm-Message-State: AOJu0YxkymIq2Vp0kpanhtazqOOEOG9WGW284mN/gj+EEwXUOVbcFf9u
	MrJ0RPtV9MTI3k97ZbGtml1dkmi8S6A2VwCPffakQCtxbHNIOunPFCKrbdsD28ozxHI=
X-Gm-Gg: AfdE7ckhuc+hXDeSwvQgejz6JA/vQas9tHyoArZHS6O91YFWYr7ymx4hLhNhfPQPh0S
	QcGMdWs1PgWt7tvLZ+aZNVSYsE5tzZKMZRzyZ3q8TOiBcsGLZPrXeg3jOac6nxOJu74ZeySYMhP
	RtcYjbPCL+K5zYzSyPt48uoyUtkXJQkB+7S+PQ9DWDWUJJv5W+w65Qy//NAv2E1Fx5aCS74nv+Z
	fGC/xnnEG/pVSc3Ya4YYQ4BuBI7EArUOYWBoTVClGstVmmH1GzpOsu6cU6LileUJqwIZhV2sIdp
	d0GDUg5Sqyg4aaoDWIRPA+MIRTiTzva6GmUvFs0u+9DU/G9NaiZbBDsF8HbJm/fPfiLuhCZpKkx
	sG75EmLZum/Ze7jZojD7IZRPFKDixGVcWyPZUgtUixFEIQYrk4VAGf3uxxq+Kij+bFgR8nXbUDi
	y9e3Fp4z0s17uLmh0=
X-Received: by 2002:a05:6000:455c:b0:47d:f43d:8947 with SMTP id ffacd0b85a97d-47df43d8a02mr1010322f8f.47.1783522881817;
        Wed, 08 Jul 2026 08:01:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm39225385f8f.31.2026.07.08.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:01:21 -0700 (PDT)
Date: Wed, 8 Jul 2026 17:01:19 +0200
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 2/4] printk: deprecate boot_delay in favour of
 printk_delay
Message-ID: <ak5mPxUdp2pzCMt5@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_080123_800788_09A48527 
X-CRM114-Status: GOOD (  19.41  )
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

On Tue 2026-06-30 17:35:58, Andrew Murray wrote:
> The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> are two distinct mechanisms for providing similar functionality which add a
> delay prior to each printed printk message.
> 
> boot_delay provides a kernel parameter for delaying printk output from
> kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> configurable only via sysctl and thus is only used post boot.
> 
> Let's deprecate the boot_delay feature in favour of printk_delay. In order
> to preserve functionality, we'll also extend printk_delay such that it can
> additionally configured via an early kernel parameter.
> 
> Behavior change:
> 
> The delay enabled by both "boot_delay" and "printk_delay" continues
> working even in SYSTEM_RUNNING state. It must be explicitly stopped
> by setting printk_delay=0 via sysctl.
> 
> The delay is skipped when the message is suppressed in all system
> states. It used to skipped only for the boot_delay.
> 
> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Note that Sashiko AI warns about possible problems with negative
printk_delay values, see
https://sashiko.dev/#/patchset/20260630-deprecate_boot_delay-v2-0-f9883d36aa4b%40thegoodpenguin.co.uk

But they should be handled in both the early parameter
and sysctl interface by the "10 * 1000" and "&ten_thousand"
limits.

The only potential problem might be a warning about possible
"sign" mismatch from the compiler. But I do not see any
even with make W=2.

Best Regards,
Petr

