Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCF3CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6bsjRyMlYCGVZWYk2Y60sUCqRedkIR0Vi6kAvx0wUs=; b=yxwXXKtBtZWr2DcPOO264ss3RP
	++zP7tZHX7clBWWg/+fpZJFxvQYXapyt4b4kAPq4d/1Q0I7d0R+FfanEoHUzutFMuHLDn6VWq3/FY
	OW7nyv+YPL3mA4PigWCnMzkO8/u1JdvHFCTtjeVR7tSLX/fP3P3ETuPpo+DalfOlxRbzTFLlEEZFX
	8iXNsYMj45TQrI5OPI2t7VefsuoKYykVm+C690+0PMqrCv7Zs1aX5Mm4t2iwvzLxmpadMvp3xNxCM
	fVWoaTXq65IeWeFvORJX0em6s+cdohNlAKgrJth8LAGOWnDrGiSOo1UNP4I0XBowZ/J7HwWFogU9b
	Gp4sf9cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxr0-0000000ALLp-1Qce;
	Mon, 01 Jun 2026 08:18:34 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxqv-0000000ALKw-0xej
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:18:31 +0000
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-914cf9248ceso724054385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780301908; x=1780906708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6bsjRyMlYCGVZWYk2Y60sUCqRedkIR0Vi6kAvx0wUs=;
        b=rO2bCGNfUwA7wQgbkJyy7YRgIfWcUPYHbCfFQKBm0xXJWwZLyP0oHZpIHAQGVjb9LC
         rlS0iMovCzz/a0W2hYpZud+y2faP9Ke5O5RWgBQth9yC0JJR3Rl+MOuUb4L3NBTd2U/F
         ORwVNGR+FWxCVYSmOyFnwBqQ0dt60rjz4E43gTnqU7NY2+fJ667HOdqM4MAblXfp30nh
         IgWcsnPRaTYAd9isDcxYS/89xzuB+o+VZK7i/RIA65+EYOdxYqgSAaKO6yS/uDvvufeC
         c8smmprT7uyxEbYPXFsFYU+TWy/o/GaRyCXNndx9v4QZu7pOrwG062Aw8jInGtOWt5Fo
         hwug==
X-Gm-Message-State: AOJu0YzIcUN0knT8ZdysY+kQps5r6x9BLysV8FaJ4W0rQl8CO6EgHSnO
	RmznR++pJxTXsXlViA7jq0s8J9p2rSBXZFM9A1RLwqGM1PYXY+rA8o1WoLrpl6J2
X-Gm-Gg: Acq92OEKUs0QPvpacFA38cRCmd0sZCRFZEosJ3Siz1l+QYLSEbZ5nxOzOTD9FnvZ3WK
	6i/vkOFCsWOU16nuNIPj5uSn95XtVGUmth1R1CQcBcY7kC4BqhOqIM6SwLgPrahpjSIDW7jJlDS
	l2PMqfVD3U/nOBfoXKM+jsSAXGrBZjtAN0H3+zuiq7s1GEKbimLWn6FNTQESfeTRFyDyP3vnI3h
	v0RDo2k56hj8V7AzudJoHsF536eUEhvNW5Diyb1NMjgE0rBeO+avTt1zoJCpFw+OLKq8lsqShGa
	0AyqwrpT1E+jQghb2vgmGfarUITgIwDEGRLXg/o6CnrTmZekMel6XinNjZvC7TgRTd1hfMt6xxZ
	D7uY4IDHTfXRjx/tle2rbXanTMzUP3uxjP07i0NUC783xYzwV4sNJBd9/rEV1tbyRFJRSwCuzwY
	INzc+p4SqKqKWUrjWxI1b/ukyPwn5BjqQn4FFYF4NL4B99gzeb4jqfGPVexyd6stIfajBysII=
X-Received: by 2002:a05:620a:3712:b0:913:dcd2:f136 with SMTP id af79cd13be357-9153dcb676cmr1647540285a.59.1780301907844;
        Mon, 01 Jun 2026 01:18:27 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532486089sm954959985a.17.2026.06.01.01.18.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:18:27 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8cbe69b122bso102290726d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:18:27 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-6c67682807bmr3734166137.3.1780301518249; Mon, 01 Jun 2026
 01:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com> <20260529150150.1670604-29-ardb+git@google.com>
In-Reply-To: <20260529150150.1670604-29-ardb+git@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jun 2026 10:11:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXp0qp38vHJTDFMrY-AUDXPSJtc5Dds_qu58FSeS_242w@mail.gmail.com>
X-Gm-Features: AVHnY4I0grL2HGASleAgF6ybT4VX0NqDy8gokQJ4KkNhvH_ouOMg7ryFWIbyvcA
Message-ID: <CAMuHMdXp0qp38vHJTDFMrY-AUDXPSJtc5Dds_qu58FSeS_242w@mail.gmail.com>
Subject: Re: [PATCH v7 12/15] sh: Drop cache flush of the zero page at boot
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_011829_274915_AB704E3A 
X-CRM114-Status: GOOD (  19.95  )
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

On Fri, 29 May 2026 at 17:02, Ard Biesheuvel <ardb+git@google.com> wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> SuperH performs cache maintenance on the zero page during boot,
> presumably because before commit
>
>   6215d9f4470f ("arch, mm: consolidate empty_zero_page")
>
> the zero page did double duty as a boot params region, and was cleared
> separately, as it was not part of BSS. The memset() in question was
> dropped by that commit, but the __flush_wback_region() call remained.
>
> As empty_zero_page[] has been moved to BSS, it can be treated as any
> other BSS memory, and so the cache flush can be dropped.
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

