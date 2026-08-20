Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8599C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehmlMc2l8m1QEEs25SXGd4qRoiIIzqIj1MYNoMhCHwk=; b=sT0N/HqA2gkp+sCHZXfjNf9XTF
	ojcmQhVb6zfQH+W4xaT7vGCn/C7ht2BMTYUfopmpekLDJhF9FuY9zRaTDxCFKtXtjZNVi6HdE9MWs
	syo2oQNcffybpjeWPMhGk1uOjnkoNavLyFeGsyCeNBRnF1aBfrPhBDNWJWkZJVqd35JkvZMaX+zS2
	xc91u76x8bhXwAt36eXH2sFNcMDtEYPNjaAvspAb4K6vp/hknbA3+FPJVZ3hKqUeffBJQJEbE4hpy
	LTz40DTsn7+aW2/dlsUyOFteDFj6SlOFSGVIGzqsytAhFLwwGvaZeev9s3NQEnrERAQnoWlKKWyEJ
	YHhWBPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4RI-0000000BmOT-33kq;
	Thu, 20 Aug 2026 15:12:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4RG-0000000BmNc-11W2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:12:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso28836655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1787238736; x=1787843536; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ehmlMc2l8m1QEEs25SXGd4qRoiIIzqIj1MYNoMhCHwk=;
        b=r8R9UX7GYg5KB7biG6NRjtIRsq2dlU/bUR2nPfTT5lGSYXjQ+hWI2bYkvN4CBBTAxX
         TBgyqZfyjHkdq6fEJ/Zo2ujEfnE34bQ3PFcn4Jw+zsFxRrhr5VvZD5awjxHvV88UDj3J
         QqpTqS8zSfI5kK4pw14RlgZ0xiKebPiHDiUCWTF5li+ZsccfF/Ruflsu4FGnOH6adWjM
         IZp761PF6SpdQvKWeR+7d+fUMtaQwOfuS+XY77A/R8t4ZS7Ohr5Qb3tahy9x35GzM1KG
         jywByJqvhMID0lHZWAHC4XTun1P8i3peIbhs6WiPrM1DHSPlid/NMT6ZFEGGoVonXXFn
         p4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787238736; x=1787843536;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ehmlMc2l8m1QEEs25SXGd4qRoiIIzqIj1MYNoMhCHwk=;
        b=X0k2L0Se12cjPN1yFih2Mu7HZiqCwjnK2axu3WpZ0oMYXakiPM5J+Vf/pvOYk0ZVMF
         GdYVmJ3rqxU/SdxkL/3XsWc1t4ZyZfC9bObSmSwGBb8zz2UNFZAZekq7GiLIVBYQxgV3
         8sNarzMM08Mw0jDfsc/a3jcVTW+gvxeB98dDLQQJo9p+qEn2Dy1+QuXMta95baWv5rqC
         k1j/HylS0HUpcqWQf332kwaPQumW6P6lgdF2TCsWN+awI1sgdPNAZShyV6NEbYRSaDFj
         Z0PaDeuSZjNfNAYkULgFRxEmtL0EWTjE+jxS6j5nEM0xPl+KdAwdxJjw0DIzq3cnCtaC
         8nKw==
X-Forwarded-Encrypted: i=1; AHgh+RoFX6WXFON/JsGOod/DLxDhWkd1mQQ4tPaF5nM8TAE/3Link/m3Bjm77xhjG3FYQhrjWVvmCZzLi+EXlqQz6GiK@lists.infradead.org
X-Gm-Message-State: AOJu0YwYU5Sr/KecbZr+UFGRi9E3yOwb+as7X+0IWAKv1YJG1bJ2X1bx
	ovTaHu0XBG12gUjfZ4naLbgYTEQrgqTUfqBjiDDjYbpTx+WwYaCu56BOXN1uiEF1nsWx06PXZqv
	u/TitpWg=
X-Gm-Gg: AR+sD10SCIdOtYXPh1/pm8Jz8rd+ni8j8tU7bFsalQmFAzVbjSdbqV3iYTMnJxSDuen
	TQMvVi1IFMWn2axe8K2WM+P16ovbqY6Y5mNYsUbL1PQaaRBIv/hIVcxetJnOML7fmj7e+PEWElW
	gtzejT+nLi7Bb55c68hWM8A0Pm8K6DIRmpSW9xyHAF0tAsvXAlrbTPmRAEJAnonNs7liU/VeLcw
	kGnlEwUachlfnDhU+HpUDWSqAXVoylmSZAq6zxwxIqsKgcV7xIJw/fOQyrUzj+s0BKNpFFIqBNc
	ROibMvYN365kzzSHLpQLYPUJaUTZPd53T7CLqHKe9col3BUNsTwd/fyBbG4TY53ttP8fO4YF7Kf
	9Y8uT0tkeASGBqW9O7tr5AM/6WyJqdwyr1am+aCbuRN1R+3R1WVcWDiQquI5rXMndF5+lIyytxc
	HsRWiVcRXwowNAqvkcvptzb0pdtFH+slyBq2Kv3Uz67OYE6x0TQitSqn/LFclg++lpci0K6/y+Z
	xenH4taZ90=
X-Received: by 2002:a05:600d:8446:10b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-499aa1d0a9fmr189473705e9.9.1787238736286;
        Thu, 20 Aug 2026 08:12:16 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b20bb2b4sm46102495e9.0.2026.08.20.08.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:12:15 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,  xt.hu@cqplus1.com,
  wim@linux-watchdog.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] watchdog: sunplus: fix sp_wdt_restart spin loop and
 timeout
In-Reply-To: <d37eef21-a877-4500-a280-493e98c68701@roeck-us.net> (Guenter
	Roeck's message of "Thu, 20 Aug 2026 06:42:30 -0700")
References: <20260820125304.1583383-1-ag@ffroot.co.za>
	<d37eef21-a877-4500-a280-493e98c68701@roeck-us.net>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Thu, 20 Aug 2026 17:12:11 +0200
Message-ID: <sa6wltkx1v8.fsf@dev-ag>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_081218_385334_CD6CC44D 
X-CRM114-Status: GOOD (  13.40  )
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

Guenter Roeck <linux@roeck-us.net> writes:

> On Thu, Aug 20, 2026 at 02:53:04PM +0200, Andrew Gaylard wrote:
>> sp_wdt_restart() returns immediately after writing WDT_RESUME. The
>> kernel continues executing and the watchdog kthread could pet the
>> watchdog before the short timeout expired, preventing reset.
>
> Is this observed behavior or just an assumption ?

It's an assumption.

>> Add a spin loop so no other CPU can pet the watchdog while waiting for
>> the reset. Set the restart timeout to ~1.5s.
>
> I understand the first part, but why delay the reset by 1.5s ?
> That is a functional change which needs an explanation.

I had a printf there to confirm that it actually reached that point,
so I needed the delay.

-- 
Andrew


