Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFF6D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHxMvjmHeLuvFpkAzdRAX3YAUaEt7mxZ79bySuiEqcc=; b=elf8HwdrcLh3grLekMs6sAEzdO
	d6EhVXzhGhvngs/6eEZsrNQOGmcPWdB7Bj3ROBQWG7R6zIPXnoy+s1CMPVdep4dRiXvNPgeQoo+ql
	jrulUM4YnICigZ70zIF5zYJoLzMkrIjoPs5rdM1wKR+7mxFanLDtBsmI6Q/bytelXdSNK0gesFw26
	Q6UsF5NDfoPx7ZjhvC3hY+DDxI/vuIJ08fpG+v2CA0TC1x06+X5xT97GX9CHW27GANJvgsX2kpeF/
	e13AYvoTTLkYx+q3GMbM64ghpEk6Hgdo8e79Wq8RHCkgGQKi3T8E+iuy58XDE2xo8Yvo9/jJnk2EB
	pV56UmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1wC-00000000hn8-3Vut;
	Fri, 28 Nov 2025 17:07:16 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1w9-00000000hmg-3C5v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:07:15 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so3535572a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 09:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764349631; x=1764954431; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dHxMvjmHeLuvFpkAzdRAX3YAUaEt7mxZ79bySuiEqcc=;
        b=EXo/Q501KsPxgBwto+qV2FQdcXm6OSKKZYmEqhTBCod545k7mH4rWux0QihV5IiG6+
         1MJ/0E8hn0Ln7BRzqCueftjUUE10KPHt9OJpLDI2S9xY4pTz9kJhWkmsqlEUNSD7R+7s
         T4aQ8r43uv8Wtmb8YPkG65z0jn+A0MTw9nPjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764349631; x=1764954431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHxMvjmHeLuvFpkAzdRAX3YAUaEt7mxZ79bySuiEqcc=;
        b=WDaE+DdpavKSQRRpDesCERQXppvdMQzQqrVlg9ovJbaO8CYVbCEFwG3RtjvssImskA
         y4obh85YzqX86d06hBoJyQhQ3ZBJNpmsOXk3w5Dp3mfqFG4n7cP99z9fZQbjYx3tU93P
         EAhTKdLA3VW8xBbWJrokWSB8j7J692ZIN2Ckb0skzZBVIJo2x+nYPXTb/a9ZkB0demjB
         UEKKXFdc7aFIIkjZYhC9V2srRUMpWlVBXB9FXIBzdw2FnnyY8f3qGjMfbT2D+/MGSGmJ
         hTltslXMtXXevEfFBu5Iesm6LX7XQ+iOCppYp1Mv7cZgZVrNHTWet5GPIntYwKGBpfyt
         4aXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgIf+vKWa/kcXDJljzuvEsyeDTHppBjLLIQ66KZYG0FlTAnQ23vpSyBTzhhbfgXttPrPv1mtf5XwyfQ8NpPfHE@lists.infradead.org
X-Gm-Message-State: AOJu0YzM5WZuhcYsBX/6tsho2ercucqmIculxRVFrdOq2aUapHBT6Q2l
	7cZ8U9OkNaRPW+4/r/e//3AtGyh5oxo2BKNGC2H4c7+LbBNZBBqO+vvza8EQDnFxURE2R8sQTkA
	xo+P7pOA=
X-Gm-Gg: ASbGncsf80nqXJiFCY1R2HU08+dxdF2Pp1zCeev19HCaeouqkzQCdzaMVQXCBuGNNG1
	hv0yKF1sW4rEDX6UhZgMvJeDJFP3v6K3u6i9q7GVqil3AVpdkVKrHnItgbQXaNtPigli9WDqa+2
	AeqfwSkoD2bOzslq+BcY1YKQJWBWEl4MSh7hNQ0pOQqLuIZX9WuIjyWDQ6uvDzfVXNR2atc5KsS
	Lh+21CrxpkONZThrnN4RfCnni0XCzeqGEhspAEJ9XHEQiK9c+rUge/9R5ICpvFC3XWm9toSwcC5
	uH4iIGeP/RoanYRiY5rgZJFomRzIr8499cfICnMHny4YPoU8ff3Da0+5sS83pwNY8bqXrjSyznn
	PT/+38JzD8jYxmVSAhiKustXzydWMC+04evpUptI+NADgmdm/bJ6HN0MxWAzV78gLXXmu3OOHgk
	kZ1jPhFjTjcORkdx/yVCXwgGRJ8gu6jXcBS8xZQTGuafM9GpmtVaJfX68I9rgm
X-Google-Smtp-Source: AGHT+IEBFbde8jfzjGb8n4SWNKolI3EaebW6poXVoi7vtX/+fHSuMXINx+wvZTyn/oiTcFx2AJNLEA==
X-Received: by 2002:a05:6402:42c7:b0:63e:b49:c9c3 with SMTP id 4fb4d7f45d1cf-64555cf83f3mr26106942a12.31.1764349631218;
        Fri, 28 Nov 2025 09:07:11 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d5dsm4793226a12.12.2025.11.28.09.07.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 09:07:07 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so3872825a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 09:07:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXshwtrXLvWMTUy2udxZyPEM1WXLBcmF3SYvrUUumcdPRozrtk2SyHHcTo/9gCL44ErlYY1MWk5e5wNub35D2Xt@lists.infradead.org
X-Received: by 2002:a05:6402:2708:b0:63b:f0b3:76cf with SMTP id
 4fb4d7f45d1cf-64555b85bb5mr26149888a12.2.1764349626340; Fri, 28 Nov 2025
 09:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com> <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
 <aSgut4QcBsbXDEo9@shell.armlinux.org.uk>
In-Reply-To: <aSgut4QcBsbXDEo9@shell.armlinux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Nov 2025 09:06:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
X-Gm-Features: AWmQ_bmE-6XAFAPa0-eSPLJJDbgRImzhoDMUlnAscfmarz6vBK22IDNiLQ8b6yM
Message-ID: <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Zizhi Wo <wozizhi@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, jack@suse.com, brauner@kernel.org, hch@lst.de, 
	akpm@linux-foundation.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, yangerkun@huawei.com, 
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com, xieyuanbin1@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_090713_949369_70FAA5F3 
X-CRM114-Status: GOOD (  20.94  )
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

On Thu, 27 Nov 2025 at 02:58, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Ha!
>
> As said elsewhere, it looks like 32-bit ARM has been missing updates to
> the fault handler since pre-git history - this was modelled in the dim
> and distant i386 handling, and it just hasn't kept up.

I actually have this dim memory of having seen something along these
lines before, and I just had never realized how it could happen,
because that call to do_page_fault() in do_translation_fault()
visually *looks* like the only call-site, and so that

        if (addr < TASK_SIZE)
                return do_page_fault(addr, fsr, regs);

looks like it does everything correctly. That "do_page_fault()"
function is static to the arch/arm/mm/fault.c file, and that's the
only place that appears to call it.

The operative word being "appears".

Becuse I had never before realized that that fault.c then also does that

  #include "fsr-2level.c"

and then that do_page_fault() function is exposed through those
fsr_info[] operation arrays.

Anyway, I don't think that the ARM fault handling is all *that* bad.
Sure, it might be worth double-checking, but it *has* been converted
to the generic accounting helpers a few years ago and to the stack
growing fixes.

I think the fix here may be as simple as this trivial patch:

  diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
  index 2bc828a1940c..27024ec2d46d 100644
  --- a/arch/arm/mm/fault.c
  +++ b/arch/arm/mm/fault.c
  @@ -277,6 +277,10 @@ do_page_fault(unsigned long addr, ...
        if (interrupts_enabled(regs))
                local_irq_enable();

  +     /* non-user address faults never have context */
  +     if (addr >= TASK_SIZE)
  +             goto no_context;
  +
        /*
         * If we're in an interrupt or have no user
         * context, we must not take the fault..

but I really haven't thought much about it.

> I'm debating whether an entire rewrite would be appropriate

I don't think it's necessarily all that big of a deal. Yeah, this is
old code, and yeah, it could probably be cleaned up a bit, but at the
same time, "old and crusty" also means "fairly well tested". This
whole fault on a kernel address is a fairly unusual case, and as
mentioned, I *think* the above fix is sufficient.

Zizhi Wo - can you confirm that that patch (whitespace-damaged, but
simple enough to just do manually) fixes things for your test-case?

           Linus

