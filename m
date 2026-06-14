Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E38CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QYGK68tYn6kO+42tzFsfF/PI7vOCoxlnLOyNd19xSA=; b=SjxcK9PKp7SQ2DPwcXbARrxtyy
	yqpFuz0RIoEtdCx/gmATQSiCPK7GKCjoO32gOm03w0tS0PjiA58wn35tIEnIOYhkHwfPda1Bc1Bsn
	/pLQ58RuN9zKuuPez/2sQ5CGbY+lvdEhxFtCPHA0YR8JfgU3kcE/jeGkEIm1/qxjd7ebWgxXg0pYa
	M2qh5+3Uiyr6POUWnzxW1aw08E3qgCOWrU193ALusjTuJtFgxRRrGZQbqbwTuTF8JKm+21455um4J
	PjNBObuo5ppTDSnTNl33UFudW/5V1pGi+hMGIUC1/1rQXj5K+VYvztPYMIbpYIzS2H9RSAz1dTZeP
	F+PbxGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjDr-0000000CvC3-3ZZI;
	Sun, 14 Jun 2026 11:41:51 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjDo-0000000CvB9-3zSc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 11:41:50 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4865e953031so2764105b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 04:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781437307; cv=none;
        d=google.com; s=arc-20240605;
        b=e6r7NuCODYcjwz7QMAj66WyXcN6bA3ZnkPSbYrThEj2td30V62GOUdNopkxKnQCyNx
         FFBvJM3eGXM/A1FohpubehP3yFyIySLvIp0GR2f0yJ6jW7g3Lc9cNSbBTEe+69S08aOH
         hWk1SP2tnSDAAAfSHgZjeNrryofJY2uCBTqQhDGhxrHQkj52ehQ4tmBAXas1QuIxoQK3
         Ia02UguRO+I1Qx11rSn+04yAgYM5sbJo4lyD+AAOS4jRTsHfcVotcgAB2mJP+p4GA0OY
         jl27BNSkDolTApias//VAIEscGBJnqw5tIztpV/aDxIFZYWO+0E3QNS8akZIb7P1Fv3H
         JSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+QYGK68tYn6kO+42tzFsfF/PI7vOCoxlnLOyNd19xSA=;
        fh=uJit100GWJIC5Y6I5hHUYOtpcS2io9LiCy9pkUoGaYk=;
        b=eIuLTUsFnmsAvuN30L2aUVvt33dpfRPUhvOK5C/Ng+cQXzL8PIwlmGafHhZNJs/8tD
         co1JPCnDJIJh0NXBN94b0tC1tJVwdkPvcIoUxapAiNM1JPydQSF1PG8v0xMcztvP0Zeo
         gN26DOWkGefOlwvjqM14/TmctMyRNBwSnFzkblM3qeHl3idapoZBw0dFvHAMsUSpHlal
         Zw30SnUr+qFmqXqqg268RjmondglocW8/efgVQFlM51H/XNXPnxsrNWGKgffreTnomZ6
         0VPMMmVMJon15LdYlsKpNCIZs1J2gLGnhlYx2hcP4biwfCU1kFLMuO7V5+weQxtyOgu+
         gx+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1781437307; x=1782042107; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+QYGK68tYn6kO+42tzFsfF/PI7vOCoxlnLOyNd19xSA=;
        b=oTn4tfxqNVQFRQWLyQgXTZAStyfKjKfzIHOCsF7NDYPT0rWFxqXUEC76IsSU5e3ymS
         uqTiO9Hz4TYKYGXW3JXSi+VSyImzwfQmW0mqRhLyXFDuBsUj48X5J4CWBpctzK9dFwo9
         2fJy5lKcM8+FtwZRRQGGPFnC4n7EVSHFbj1yQJRJqxK4MG26vjn31UZVt1uYAYuPwYm9
         8u8zyZqrkuckno4/ePdqQ87nnnrnihWUlFZbqlmoarxsbPl86vl6ELsCCz6gEiVYHNWZ
         3LLecqb9D7HE+24s2QZGKqzXfIBHv9PVMB51UMP1O2VISlDJscLk28WHnwsEQP9kQBVM
         kbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781437307; x=1782042107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QYGK68tYn6kO+42tzFsfF/PI7vOCoxlnLOyNd19xSA=;
        b=YmKjc7/oFYS/D30uZsgJdTbr/+UQF1J+hu2qCBsYMbETvBgV0VHFh1+A5lh3Lw49aU
         vFv1iJaoRUtHMkdEkxeZlEOnCSmrptmudnPLNUHR+yxBWZTX1tTkrEmx2cC7kPfp6ZgT
         3byG7cSbrt3y7yJhNaE3DaAM2g7jIy34wHu2cGgf/WbWm4qis66My+6wY7kCLKBrHQ2E
         Lb0rfTNi5sOHl/0HG6IJQuu0O4HRyTHuK0qITWTzIgdT968npewwZzWQJ+OELAOOyT25
         Qxv+2amsBbibcrDV4yTTGOdmRag8DdBeetis+5vvrL5wSkNRXbUrOMbZ5yx70NkwYrPb
         7tEg==
X-Forwarded-Encrypted: i=1; AFNElJ+vS+kcuSdsv+KBd05KiI/+N1TbNIgEYH9sxFIFc5XEHAgS/R5ZYj3wLWgz0XzDS3v7B5+SoMa3cBHyfb1qBp7F@lists.infradead.org
X-Gm-Message-State: AOJu0YwfhdEuB5N+kVY2mGf56L81NxBnLj2+K97wOTxiDVlqNyfrZUNk
	Cm0d+IxmycBtMLGAtThcQd85a/JdkPnewCbWmLSLond6lJPL3vJOy4nRrGvI+Pu3gv8GQ0zxC1j
	oHevcOqWxT2Pn/G1Awd5LZaw0+tpHyJhgaDSj1b9CroOo1wDIYlc9
X-Gm-Gg: Acq92OEZvhhWpDDUHJMQ5HQn8WThFSPPZbHCuVPd4j9LgVvsghmuk8caBOrqVgXekXk
	gWwJBou9GD34E+Y6YGWCpa6ECMWKvSA0o7cwSTM16h98dvDN3c3tVafzHS6T4l58q+TPJXRW0AV
	GYEyQOdo2T3a1BWvlXHhsw2R/sDlFnShoEs+wVCH8MpmI+kRZVs1kgzxthQkz1j+qRQigUmtZjx
	Ag+GSUGE5xUYMhHxcj+LK/rmqC3jHfl5aiwfHUMXk4Z+PEbJfLq6GU67i2LImatZaNrqaEbrXJh
	2fQuTjOcVCYqGEM4+6jTTwUCntJoR6HrTq7ulf3xqbGmXBs+roHIsFb2BJ3L0O3pBKBv4Rsjji1
	9nTOQQ5tAywzx4lF2t0qd6loWinWftkciNPiYRrh3oepCxB98dA==
X-Received: by 2002:a05:6808:5146:b0:485:4f07:eefc with SMTP id
 5614622812f47-4872de6bf08mr6368667b6e.15.1781437307489; Sun, 14 Jun 2026
 04:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-1-c34c187142a6@thegoodpenguin.co.uk> <aibCBGjVk4yqtYyT@pathway.suse.cz>
In-Reply-To: <aibCBGjVk4yqtYyT@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 14 Jun 2026 12:41:36 +0100
X-Gm-Features: AVVi8CeTwM4IEIAOmwN1jpA0UXhc3pxjWDCeUhdF0IP9jBqM1u8l5Way85027k8
Message-ID: <CALqELGy7nET5bRhq-0tf2pWgK7h_f0uyrsj9BAwGMH-tmf8AAg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] printk: remove BOOT_PRINTK_DELAY config option
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
X-CRM114-CacheID: sfid-20260614_044149_250338_5A98FEF5 
X-CRM114-Status: GOOD (  17.61  )
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

On Mon, 8 Jun 2026 at 14:22, Petr Mladek <pmladek@suse.com> wrote:
>
> On Mon 2026-06-01 00:17:37, Andrew Murray wrote:
> > The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> > are two distinct mechanisms for providing similar functionality which add a
> > delay prior to each printed printk message.
> >
> > In preparation of combining them into a single configurable feature, let's
> > first remove the kconfig option BOOT_PRINTK_DELAY.
> >
> > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
>
> The option allowed to reduce a bit the vmlinux size when people were
> not interested into the functionality. I am not sure if it is worth
> it though. I am personally fine with this change.

I hadn't considered that need.

I'm happy to add this back in, but it would only make sense if this
option covered both boot_delay and printk_delay. That would change the
meaning of this existing Kconfig option, and would also allow the
removal of the printk_delay sysctl, I'm not sure if userspace assumes
this will always be there (probably not).

I'll leave this as is, unless there are objections.

Thanks,

Andrew Murray

>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Best Regards,
> Petr

