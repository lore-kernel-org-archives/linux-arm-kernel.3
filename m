Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F98F4384C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 06:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WBIGgQfqXhM97YbaJTI7B6LyiqfGzNm6rs6snpZKzw=; b=js8yEB1xwLV1unALJ7eJu12UTe
	AJB42K9TXUZ/JdC8+BLfcrqO7DiqgXy3tenOXkJFiDCKLuksuSzwxjCg/cd9QiriinzeYR3LBAl+C
	IyuyhATUlyo4qEurJL6zeFnEb5hkEko6qqNGOLw1AR6PiYxfuE3MqOvRhVEQ+JdOV96m1zH/ziuRy
	0c69VJr+mweq40m0wvhZ9aLuatqGBwhnnC4fSXap9UrzhS9EzJFdjH2Cv7QevOpcjJPKLoriI99G2
	vq0oO8kXyafb+KR9tZ3Ru7ff6NeVprm9bnjEh2LAYGSYg4+CBkCAT5ub+P2Z1b4PgmZXbf3Rj+fA0
	gL0KDk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGJW-000000023TT-3WSu;
	Thu, 16 Apr 2026 06:34:58 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGJV-000000023T9-0vRT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 06:34:58 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-651bc8f864fso3269530d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776321296; cv=none;
        d=google.com; s=arc-20240605;
        b=XPr4OdeHfJwxFDZzu6QwiLesHVMS5SSuCtGhnJsi7WFB5a3PIK47GE3CYwbHhxx2UR
         Rcb+xlH0ZDKnn73vcyzZPaQa+9ESGOnCwQM990NTHAaI1hRXMioURUWFeORDx0ACxwz4
         TPqCCYXl5FQLfBu81xZ3D+fyhrwhcPyaS70j/yYGxTA5N2nDqd4d0tEwrtWoILyAg2HV
         epMcyKJ3RkeX9pqD0NB4F7zCbqBkdFRuUgt9Y2O8N0t7pT3W/Y+o/J0A0eGfYHXGzdBc
         WGhjFraolVJvuX9og0R6cW3At9W0pw93/kHcrA/pcRPdsaY4RTlkq/k3mPFYTDRfLVH9
         o8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6WBIGgQfqXhM97YbaJTI7B6LyiqfGzNm6rs6snpZKzw=;
        fh=KuxSaLNfZaADV3fYd/K6s5GvjQUiVELw5xzrXKsGe4M=;
        b=Mel0y7OCNN1GSAlu/YUd1XTjgg99xp5O2s6KzOVz5A36FcQ+V5xMWPfsEZ5v6GWcr9
         gPfZs6bp1OGxcF90kRu/1qP8njO1EyNRzF1AJWLm7pC65+hMoT9t1sx3CPIXsQSgOVtO
         lRj6fN0p1wiZMEugZJ4aaBgmsnjcwrUYzcjC2R97cKWOcDyGGrK9PPib1peUl2RLVRQV
         b3C/LFoilJEpnKeV37XJWvg1LorZbGNfohgzoZsy5Oo5lpqizHt1Hh+wyETGJHoJoCOR
         AfXtis6IpPQ6MpqYIzLqP3MF4pVhgByJfGJxcffcVSnBGvwYDYNJ0J/y++vodaDB+Opj
         wOPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776321296; x=1776926096; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6WBIGgQfqXhM97YbaJTI7B6LyiqfGzNm6rs6snpZKzw=;
        b=WdnTFARtGntB+gin4Dhw6VkKDb+eWaqT4bHxLbHPd8PPeb8kTm2+SJVAyXi4UPhf3U
         jWSXVXAWqtp7w973nILGXXA8Zu2ombU1Mw6MyUSeEWr0EnqWkr3kJUHwybGH2jvCqT5D
         SsSIph8nXc3NUzrvLB0Yrj5tje/wu59yt9p2OiKxU/53Z0DNK0hgXR3ZIvoMwwxGKZ6Z
         6xUaCnXg04GPsHkNrgaEEC86Cec3eQwGuiEZ87CGlHCvQikLjGxvP4YnZkVmvrbrhKYy
         fkzsCwVh3d02E+L0mmQlMJAENs7qKwwpICt44FuyzLjIcnnSZ4fi8eDbnMGARBjdJ5A5
         2mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776321296; x=1776926096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WBIGgQfqXhM97YbaJTI7B6LyiqfGzNm6rs6snpZKzw=;
        b=VVRPdZO6opbG8SBEai06JGRJkFE0tOvuG9di9ep12qiE18iDRXTIdNubYUWWNyaaT6
         cbFn0JaC5fMMX7djWrQaLonMqreKs5cs8afITdKrHEVB19rf/gkjVsr45/oyCwfRZmtu
         0lwhlfqeLi/O7OSiaXSFXrk++Y3IlY/ieqO8BSzSEaj1Cl+G6WD7YP6MFY7zXJBPigTv
         ZSD9/Qfm0SKv+Kr2VXAHaEHuY70QKU61PQYqTeaisN2O8AySxFx2HhWovwB/o5tp3C6P
         8dPYtR88/DC3T//BoB/vdXTZnbg6cZCmupUPM2LVmkNOHjD0GD3jMv39ZBVhW7NUeFon
         6rTw==
X-Forwarded-Encrypted: i=1; AFNElJ8RV5OJdcSfPhPC+FMhQVi17QRH2F9b1Dd+6vQ3nGR8YJ6paY7c87E3JF8ZIAHqBznEgX+XeoTmetxWe4dEmMBk@lists.infradead.org
X-Gm-Message-State: AOJu0YykLZAk+ZYA8DX/Pj5PFlBm6OT7pTH2mduf4V8zS39yXXXE7DHL
	1GZ9CkVYbq8cr1Zx/MIwC73/F75hO9/uaT51t7QCkGUpH15FVvHGM+TC9Q0p+WHkfVTGcIlucpR
	ZzCjNjvsXNDWC3797qDT8G9cqbE3usw8=
X-Gm-Gg: AeBDieugTooYG810zL/TC79Z/TDNz8BE3u2YniYMwCZ+9gg+GUnfdlAHXMyfFmVjhiJ
	+a3utoy/3gb6zWa9bsJ8/9ZqAoRMYekj/M92NqB7i4j10tmKg+KfvWYnli0uTmPMq5oKaROMkc8
	lgcJBaxMOCwWHEkSJxmAeYpjC9mq1wOmi2B1bVL3hmy3A+zYAO3aP1zZuTgvJtMD74sfE+69Pym
	3KleDIU3B9XSPvuBVJ0IXAo534t99Jp4zgU1d0+lN8jT3jkiNp5ilYVP2jFTUUtbMo92r8b6MOB
	yB1MAgk7nt6f5FJxXQ==
X-Received: by 2002:a05:690e:1209:b0:651:d23c:3d70 with SMTP id
 956f58d0204a3-651d23c47afmr12655185d50.16.1776321295868; Wed, 15 Apr 2026
 23:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260415174159.3625777-1-lgs201920130244@gmail.com>
 <ad_WmuauLJ3xDKqh@J2N7QTR9R3> <2026041603-guts-crested-ef76@gregkh>
In-Reply-To: <2026041603-guts-crested-ef76@gregkh>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 14:34:41 +0800
X-Gm-Features: AQROBzCOpZzRmD41Y6QW8paZXFQAYd1mYTjiI8Mq73St9Vcp-8vYTmlQsIfc7_Q
Message-ID: <CANUHTR89FUUFxL-TKxOOAugNFp9oR3dc9Zf87-kEEXSrRWxk5g@mail.gmail.com>
Subject: Re: [PATCH] arm_pmu: acpi: fix reference leak on failed device registration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_233457_270534_2E804E2B 
X-CRM114-Status: GOOD (  46.42  )
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

Hi Mark, Greg,

Thanks for the feedback.

On Thu, 16 Apr 2026 at 12:41, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 15, 2026 at 07:19:06PM +0100, Mark Rutland wrote:
> > Hi,
> >
> > Thanks for the patch, but from a quick skim, I don't think this is the right
> > fix.
> >
> > Greg, I think we might want to rework the core API here; question for
> > you at the end.
> >
> > On Thu, Apr 16, 2026 at 01:41:59AM +0800, Guangshuo Li wrote:
> > > When platform_device_register() fails in arm_acpi_register_pmu_device(),
> > > the embedded struct device in pdev has already been initialized by
> > > device_initialize(), but the failure path only unregisters the GSI and
> > > does not drop the device reference for the current platform device:
> > >
> > >   arm_acpi_register_pmu_device()
> > >     -> platform_device_register(pdev)
> > >        -> device_initialize(&pdev->dev)
> > >        -> setup_pdev_dma_masks(pdev)
> > >        -> platform_device_add(pdev)
> > >
> > > This leads to a reference leak when platform_device_register() fails.
> >
> > AFAICT you're saying that the reference was taken *within*
> > platform_device_register(), and then platform_device_register() itself
> > has failed. I think it's surprising that platform_device_register()
> > doesn't clean that up itself in the case of an error.
> >
> > There are *tonnes* of calls to platform_device_register() throughout the
> > kernel that don't even bother to check the return value, and many that
> > just pass the return onto a caller that can't possibly know to call
> > platform_device_put().
> >
> > Code in the same file as platform_device_register() expects it to clean up
> > after itself, e.g.
> >
> > | int platform_add_devices(struct platform_device **devs, int num)
> > | {
> > |         int i, ret = 0;
> > |
> > |         for (i = 0; i < num; i++) {
> > |                 ret = platform_device_register(devs[i]);
> > |                 if (ret) {
> > |                         while (--i >= 0)
> > |                                 platform_device_unregister(devs[i]);
> > |                         break;
> > |                 }
> > |         }
> > |
> > |         return ret;
> > | }
> >
> > That's been there since the initial git commit, and back then,
> > platform_device_register() didn't mention that callers needed to perform
> > any cleanup.
> >
> > I see a comment was added to platform_device_register() in commit:
> >
> >   67e532a42cf4 ("driver core: platform: document registration-failure requirement")
> >
> > ... and that copied the commend added for device_register() in commit:
> >
> >   5739411acbaa ("Driver core: Clarify device cleanup.")
> >
> > ... but the potential brokenness is so widespread, and the behaviour is
> > so surprising, that I'd argue the real but is that device_register()
> > doesn't clean up in case of error. I don't think it's worth changing
> > this single instance given the prevalance and churn fixing all of that
> > would involve.
> >
> > I think it would be far better to fix the core driver API such that when
> > those functions return an error, they've already cleaned up for
> > themselves.
> >
> > Greg, am I missing some functional reason why we can't rework
> > device_register() and friends to handle cleanup themselves? I appreciate
> > that'll involve churn for some callers, but AFAICT the majority of
> > callers don't have the required cleanup.
>
> Yes, we should fix the platform core code here, this should not be
> required to do everywhere as obviously we all got it wrong.
>
> Guangshuo, can you submit a patch to do that instead and ask for all of
> your other patches to not be applied as well?
>
> thanks,
>
> greg k-h

I agree that fixing this in the platform core makes more sense than
handling it in individual callers.

I'll look into the core code and send a patch for that instead. I'll
also ask for my other related patches not to be applied.

Thanks,
Guangshuo

