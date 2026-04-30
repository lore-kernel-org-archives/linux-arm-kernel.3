Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C25FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8V+koq3Lkj3wDoBaklA0Xj48HW7uARBNgY6EDlMDXlI=; b=hh4EtZVYXnegEzVT2MayBUEUDx
	nZvF3B03XFoHkM0Z9eujs/1TUFHE19Vr8rsyzV01FRWydp/aFDaXMOBVutCa7g8bGUSf6/eh2f42Q
	yO6BXy/DE6IHbIZ4z4VETdd2D6GYcrYlKjn8SDq3gImKQiWWVTMbaPRwkmK2TNX9a9wbraHANcsOP
	xPgYhPKYfRomNpkVfYDOXloPHs4mk9dYPa4jJKAuRUyP8j0NrOJDHKgXPMuBvmwVnIthI+GN0Ln0g
	VHDeYPIGjDWUSNcNXDPJ5lDugGVozzh5ImWFb6WN699kdscuVi77a54vmacKb/gmucADuF4izQdzq
	bFjV0n0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOjW-00000005Ctc-3flS;
	Thu, 30 Apr 2026 10:35:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOjU-00000005CtD-3i5M
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 10:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8V+koq3Lkj3wDoBaklA0Xj48HW7uARBNgY6EDlMDXlI=; b=UfbZali4VSDipXlnf4i+VUblWX
	wJXIGJKdaNkITRFJgyze10kKO8IKn+/M6LhQ2Yd2Vah2eBCnLZ7+i9bfah4iheLyV2wFBrjFpxuBS
	aKAmY4wEqqdVWqnd5ud41wp5M8PuEvlLEGQtzsLMwErKQwQtpNJKvjzLAYFBkVLOsaSnbmaLTnFoB
	McpiGsJ2uYE2xdZwIkAZvj5SpTUF9IyxFItjkoviSHwB0rKIxOXNuPSRtCXkGGkkHdSrjpQun7aar
	bWB+YK1yo0yH4WDS7fcoR70FOhEF3Ee53a9AqosroeXp3XB1kC7igCEOOhjfbFcGKLCFZGq1OtqgO
	rekVzQFg==;
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOjS-000000078TL-0IvT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 10:34:59 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so87006241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 03:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777545296; x=1778150096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8V+koq3Lkj3wDoBaklA0Xj48HW7uARBNgY6EDlMDXlI=;
        b=ZAzfziA8SjSRjlVdaIJtiU/ph+GBqi5iitVptsF9Fm8K1SqsTfc7okplYz3Im7iUMk
         3yHyRJhTgFDFMuhCG/4gH+QDjbl3GfshIiytb6IncdmsIGJQ0DKU5XGrm7MF+GqkpCdR
         jKvlCWk1dUxNx21xBc1zQF2jNUjU37A6WqMGe5wWhW/WbMnTl49vwcm8gQMcBXim1mNu
         /XccABQuEgqdhdpbmLxQJaRg+fcgvKaSlRe2wzaAPwL25qJZ4CLPBlwM2HbgAECmF1iq
         61mMHPP5MKZNVWpmB3vu6fD3ny2T7NEFW/+OYCzB3ZICilFHtzAdppvI+B/yRvUSpxSA
         reQA==
X-Forwarded-Encrypted: i=1; AFNElJ9rHQbhw0bpyePpsqIbKRJIAwIo91+WdxHTuaMVx2ZwroYOcZLUTX1wOjCXehsR2cluNIiYvyOoaeDuO43reQCH@lists.infradead.org
X-Gm-Message-State: AOJu0YwR40o+Xqdsv/7MlCueUvguVV6iDOlcYZxQhYF5wE61T3b15ZcO
	of4CKhry04qe5LfClr02huDoIe+Jvic7ZipJ44GDi9bpJHb7wIt3eeECL7dec00mja8=
X-Gm-Gg: AeBDieuTKHUkqio2zQEBuELSbqANKgWJsyusATYi34BLZfH+TIQ+iOUCD5RJVl0H4iq
	6VDSnKFMrn68XSmruxXjP0saqW103NGVrazrMOCdj4JAj0qjp8nhtXtIy61FCIn3QTmzOkShDc1
	/6ZpkMdeWdcGw+4kCIKp1cDhy9TSh7EGxLu/GVAH9q2KZQNGCmBMkOt6S+DDIIKeiX2VXOBvAPl
	2UvqZQ6uZ9l9uUL/sYr1E38u8XrZhOqPVEn0+3XXSjqsuaYFxIAz2mcIsLuzoIFiaSW0C5LWuTA
	QGcwa92pCgtdo2HdIVF4G57TrMrDjLkkC/sbRo5d2kKcfDOH9Jv6VjH1CNF1EzbeoRUXQMK0cXg
	+jGfCtD8pvlviE5JxgmOWst9IlLD4rUTyXPsVBXgJRGSQdhHQiX7qBISlgjzs9ucQI5rNLbWg6W
	SvWRFB1pNUecRhlhi80vXPrRlhMw0D1D8sJuZ/3ZOmLbzpAOx9KLdwxa9PN2M7jezPRK4a+uM=
X-Received: by 2002:a05:6102:2c8d:b0:605:25a4:97fe with SMTP id ada2fe7eead31-62ad466e8a5mr922411137.21.1777545295647;
        Thu, 30 Apr 2026 03:34:55 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6298433531bsm2575794137.9.2026.04.30.03.34.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:34:55 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-61316792e42so461199137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 03:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8w1OosIj5Dbuw8FmH0fsVD9uCOEDP1gHEHVr4dRsmjXKCd9kLJsEPtFbUmHqgD2yq6hfa6RRtnvzBqsUkrL1io@lists.infradead.org
X-Received: by 2002:a05:6102:8007:b0:605:42a8:940f with SMTP id
 ada2fe7eead31-62ad52baa51mr975391137.31.1777545294613; Thu, 30 Apr 2026
 03:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775205358.git.geert+renesas@glider.be> <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
 <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
In-Reply-To: <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 12:34:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
X-Gm-Features: AVHnY4L33oPAm_CAAO0Uaw-sYvBE0zPN2_ObN8TXsWUvlHnMnI4J9wpUyxDMPnk
Message-ID: <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: quirk: Improve quirk range parsing
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Marek Vasut <marek.vasut@mailbox.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_113458_215159_468D0DD8 
X-CRM114-Status: GOOD (  25.25  )
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

Hi Sudeep,

On Thu, 30 Apr 2026 at 12:17, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Fri, Apr 03, 2026 at 10:41:29AM +0200, Geert Uytterhoeven wrote:
> > When a range contains only an end ("-X"), the number string is parsed
> > twice, as both "sep == first" and "sep != last" are true.  Fix this by
> > dropping the superfluous number parsing for "sep == first".
> >
> > This does have a harmless functional impact for the unbounded range:
> > "-" is now accepted, while it was rejected before.
>
> Supporting "-" is good but I think the ret is uninitialised in that case
> as sep, first and last are all equal. If you agree, I can patch up by
> initialising ret to 0. Let me know if I am missing any other case where
> it is not good to have ret initialised to 0.

My bad, ret should indeed be preinitialized to zero.
Thanks for fixing!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

