Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923AFC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:References:In-Reply-To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ke+GY1jiOWdQZMpOocTRJf+Tv1Bcwwp4aeT2me2amC4=; b=S7jMyZb+nNJolzZ1a3s4b2dDqD
	Z2/q5RVp8X5zRi6I2D810mY1YsGm+7sM1v6YZzZ5iadvqcQ9HA2zjC3x3xCt55+Hgz75o1h3OI63y
	3h8eLoROq7x5eVSmj0W8R791LiorSMi3plDjOzwgtC6EkHT0hv0XDfbwzsVhO3nvXWAN6YCn8l7Ov
	RLftiK/IoKUYtZjF9UcRuLLN9KpAPyG9Uax9YBkcpkYO+krBhOVtK8qdb9oFA9kxhMMQ5GU7NTPcP
	H6riaoCosWGqGbE/8cBaGX2DCWO/0aTtUHm1OTpRw4qWvBhjDcSA0ssSLPiPhd9btp7YvDgGOiivw
	bY9vzxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl424-000000045br-1oyZ;
	Sat, 18 Jul 2026 12:20:40 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl421-000000045bU-2tcm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 12:20:38 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6611669cd16so5283450d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 05:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784377236; cv=none;
        d=google.com; s=arc-20260327;
        b=W5sWFnHFNjkUZn1QYZb1Xx4isyPjmQITwplwYbDHonB4sl/BAq26U9IQJY9aJ1HJAy
         KxXdveY8M4DCXwOluIWElyxV7ePZpyn4/dPgmNqH/gMXBZjDKITQMsMfdYa48HRLkhsV
         Sb1qQuDKTtpOI6CLQOsNOQ8GS5QCQNMrDpaiQKpbPgmukBDoOaKYMaszm8P3pIJvZ5Ha
         Ic5OnksObsM06U4JHrOcaiRwiyXAX/mhUZtptQGr66vqALBsnDkxU6TCqF3cZaSTiYtt
         HVdQrjDppS1ChtAorCHSqXu+KCsYJFmkXV6HvjVzLovgRbXvzDaV4fBMCr3a2clErTpL
         ZtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=ke+GY1jiOWdQZMpOocTRJf+Tv1Bcwwp4aeT2me2amC4=;
        fh=ZjJnU7OwuPrN+pC0XGZ1y5bT4K6OtIihU/E8VqKvmAM=;
        b=nxdV/hVcxUPnxghuPW5xTKqltoGtsf2gMNyR9nC+OAYyhU9VmpS8lrgcwfNj0qAvjn
         fEVCQicg70rkNhya8mi+KG43SgpCodB7bGnhAlm33r5AdJaaaG0YnpiasWafLuEz0B27
         gOBI8UEYfix+9CD2KV9Ocv2qjoHK3xvgaKQlw49Lws3zATMMHVfMWb3MRwDC1LUuqRKG
         xEMaIPDyhTkPTAYi6mv9X7IUmWHKAlsn7WyCmEv5S7y+QI4AZKomnS3+JIKc+7IrFuVh
         6QXxgzhrIW3xdWeBk9jzwD7GhB6yyYRyk8yBa2b15aslQ8og3kqTVwV8QlEYx9nz6En2
         EP0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784377236; x=1784982036; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke+GY1jiOWdQZMpOocTRJf+Tv1Bcwwp4aeT2me2amC4=;
        b=eSTaPW8tnHGbKbdd656AFRR27C7WphpydDpPsN+CWRF1gGjIQ1PoDVLt+tmwYTOFxJ
         erf6DLXsQI+PW+0EC/jVoGKctN4uxF5Crbi4rttsIr3BYNTrSC74Qe5ACa6WGTt6Bu+i
         nGAPTZy7G5IIkVPaz2GBtPr/SoCguQPwSyFuaT90rEq+yHVlTHkIllchN8wwXPn4gVHB
         oyUOp2468oU1It8dqauYyDoZu4GCi7LuuVO0UZok89Y5s2fWWOzFVNDhyNsTAVEIF/ss
         f8frufNDsoXdn8T0M1LPPBtQWFiSkAo1bs2EaB7e71UcC7J2mJfx2ApFc+pFLTX5Z9cs
         2brA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784377236; x=1784982036;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ke+GY1jiOWdQZMpOocTRJf+Tv1Bcwwp4aeT2me2amC4=;
        b=LelSm+8UKYDBl+Lh29bGqniQcOeO+tz9OVsmKPoAIoda+xC+2fdMRguK30XQUcV+az
         OdjAfLcEog3NLmMZvSF/aOgp6NjZ2rma8jYm/coPfKQ68je8IQar2j7S94IiKjKhCOLm
         3NkQgVsB3a5TDb8fHyvInVXqFe1tBt3uw/gq1l6nVCnYmFmqu3Til5dMooeoiwu+FH0v
         pwuaykvsFLmvT6Ks/K5uFL7Ev+kRkFuQhnY4j284RIozRKfyAuibeQChfOucqGHHfPrX
         7vqUSPRjzFseNjEZBbS8Et6zGbp5bGZ3L84/VfbUxfIhmAxtUdxHLe2YHCfWHqDonSn7
         6taA==
X-Forwarded-Encrypted: i=1; AHgh+RraovoHk7mJ/D8L9xJWltfdOBUnCFil73iIs70hNUJ+xIPdGEMGI+SI6NaI2JIaNd/E1OX3YglPjfB6M5iwOKCp@lists.infradead.org
X-Gm-Message-State: AOJu0YyLuRZCES0nWmdDHh1hUsq5+H1o+HOKmrx2vUxzuRk1xzu2g284
	XHiUY5xWd1DZ9fjTwn2KXy9dLI3+JElNOOYou76BxWJQC7AxfPc1/FMvVv9o2hZyfEJszVs6cCL
	vSZ8MYgBa5o57Z5G5Lft104uU4xmCBNJOyRFg
X-Gm-Gg: AfdE7cn+QfAf9qa2HQcEGHNOyIa1I747bTca5GRpAs47wBx74iw7mpm+T7PGgSdQ1YE
	hyo9oJu0o+7EcyBw5qZcV96Nm9X0qc3DX+MiFNdcotsncAMgJudfQ8q0HdIaSv5ViSTGqoqFk+9
	souFot9i7LXS/xXSSn3VbsSKMFqfYOh2DmVJd6D/kyEKTlU+Zrxd61YJg9VI9NZhL/Co18Axy+I
	QV/bvF/N5Nd1hVFXjpA3F7RdN8k0yu8bUs98snaFIE8c2A19se2ByqUVqMsXw==
X-Received: by 2002:a05:690e:480e:b0:668:430b:ab1d with SMTP id
 956f58d0204a3-668430bbbfemr989322d50.0.1784377236000; Sat, 18 Jul 2026
 05:20:36 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 18 Jul 2026 05:20:35 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 18 Jul 2026 05:20:35 -0700
In-Reply-To: <2026071710-flanked-espresso-5b06@gregkh>
References: <20260625085800.4505-1-alhouseenyousef@gmail.com> <2026071710-flanked-espresso-5b06@gregkh>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Sat, 18 Jul 2026 05:20:35 -0700
X-Gm-Features: AUfX_my_CLZcQTnxCSNQPQdrKE0Mg9vD8lv3MDR5D6uAfcrOntLLLnpOP4XfKEU
Message-ID: <CAMuQ4bWX3MR6JGt8CNcnWE95z=ZyFk7A7G+99z5Z0Qu=XHMj7w@mail.gmail.com>
Subject: Re: [PATCH] char: mem: keep arch range checks overflow-safe
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de, linux@armlinux.org.uk, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_052037_734083_B799AE57 
X-CRM114-Status: GOOD (  11.97  )
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

Yes, agreed. The ARM and SH fixes should be folded into the original
generic char/mem change rather than sent separately. I'll resend them
together as a single v2.

Thanks,
Yousef

On Fri, 17 Jul 2026 16:17:25 +0200, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Jun 25, 2026 at 10:58:00AM +0200, Yousef Alhouseen wrote:
> > The generic /dev/mem physical range check now avoids validating
> > addr + size directly, but ARM and SH provide their own
> > valid_phys_addr_range() implementations with the same wrapped-addition
> > pattern.
> >
> > Use subtraction-based upper-bound checks in those overrides as well. Also
> > make the ARM mmap pfn check avoid overflowing the pfn plus page-count
> > expression.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> > ---
> > arch/arm/mm/mmap.c | 9 +++++++--
> > arch/sh/mm/mmap.c | 4 +++-
> > 2 files changed, 10 insertions(+), 3 deletions(-)
>
> This should be part of the char/mem patch, right?
>
> thanks,
>
> greg k-h

