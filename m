Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A73CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 19:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DekgsxuMi51WS5zY41eRSoIAsmckrInSkJh0VriOufM=; b=fuD2btfqUGfSyQHvkALAbe0+w8
	fv3THcJqB+HX25PUI3tTlrutIDwAOPoS9gI1Nj0lf/rwtVUKzrEhzd1JmSbk/3yTfMosXS1AtX0GZ
	PykUGkezdF1A4rU7atRJwFPOYA9vJuLvO5fU8utLUph5aE9NsHVoNebdD5DrClOECnRpYB5iBhDTb
	aapFOjdeg6mI+ifVNOkU/2DYCY7buZvBceestCbdhS62OCfflETWLezfrVw9NMfaZaisI59uBb76Q
	LLfUogZDq/P8MS8Kh4x7pcr9yJz/dgpQj0t/5RgLLe21+Wy6g+7HuMpdAP8ClK5ntEu6/fHqD9E63
	chYPt+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPRM-000000091kN-1wjb;
	Sat, 30 May 2026 19:33:48 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPRK-000000091js-0Deh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 19:33:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-68c5eecdd56so1758616a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 12:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780169624; cv=none;
        d=google.com; s=arc-20240605;
        b=DASbMPhjVqWOCDqaDs1ypw+h3t6R0K7KTengPTCFH52sihY+PyyHuOA5jTztHZRSvV
         5RoXcQutkUPCoFYJB1Hhxnrjp28NhLrGjBbTK7ISwcQHtuKDUV9Co5URW/O/avirUHfz
         AiBRxhxlw1DlA2ZRBlzvBx0G1IvAr9A8ImHKBMcNrUAMywfmq6UaMFiJY93XiUm2H1T0
         ELDsFuotpLKTq1lyuC9UMT5t2lpGKbBo+t/YY6wahymrJH2u5fKFJiv57XAwhdoTNCx7
         NHVdvKQTVuzdY5rtlW8LMzw3jhVqRZwFq94fVNBtBauag0s0svfVF+oXTNoU/gzmbIdt
         kF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DekgsxuMi51WS5zY41eRSoIAsmckrInSkJh0VriOufM=;
        fh=wvqI5s7aUTfH33iuuodrQoLyuEQLHlH5KcgmiGnDYSc=;
        b=flrsxV9r1EUmXdCbp46nyh2g0ymUCtspb55JsV9ez9Po5xJ0hh2ZXojweF0s6tYw0S
         pgzVymLWMZ+2SJhhXbUU7OdTxSzVhsIsO3v1PGl8Wi0SqAAqm1I976lSjZX+kIE69JqH
         tr7cdPrVh1hTIn97q2Y2gnhm2PZC7AroeuQIZ9op+0Z+uRaiUvQaOBcfaiNH0FsFYPld
         FOUtCUTMi8kNeNd5oLAR4lhfYiBSwbjLnUWiyAO32+DWr4uTvB9vJRjq9k/f6/+KCpRY
         /RksIFQ20Lye39AKjWNY6Lz8SlIGvW5qsdnh9kAo5ZqFJSqLOqTjuVGzI88aD6lGQ1g9
         vgSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780169624; x=1780774424; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DekgsxuMi51WS5zY41eRSoIAsmckrInSkJh0VriOufM=;
        b=XGZXy3CqCJ74HqjwGC/+8x1aOJYEfEtLDX2sjfmA7NMpxe6v1Sb9lm/wyi4XDFZfNS
         oSHeAl0AdmZD/uYW3iezEhcGZUBhy3Pg/iBmqygMooL24o0JdynDpLbHdv6Ambb0HGHu
         d7l98F8Yj4rq5sVVe9BoBqvElP0TnnkX1rDFbjqB+WSrZjJirkrwz0PAgXlc+0A6PGob
         acs+XOq0v/gYbbafIhtF3h2Ix9WUgyWu8IPNFPB2wWv6ETUEjTerW+diAmZtQPjrygzn
         6WjjoT8wTYbFHdkiMTYorYbNMISnFiv82tigQv5c/NyrsUElRwoMPBu254ZslAi8ipSa
         fmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780169624; x=1780774424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DekgsxuMi51WS5zY41eRSoIAsmckrInSkJh0VriOufM=;
        b=pTjJ2ykl+HFoJ6uI8Wp0Y1Dvuq35F4lCWCtrGwhX2Ga2aHL3iYmAN5Q/PJLUXjlX/D
         mTOishBjYKDeHGIfrigXSYR4jKPoSOb5tNYUB9zv9YU0LOEyaCSCKcCd4kmqJDKm8cW3
         MZai4d+K3GHIIc4Vqtn5XfFSmF+h2QGQHbeepRc0amZNkI0ie/aynPR325bcXrHw2wqQ
         M7Jz+rNpcB8gj/d0sxP6KydYutkA8RwB2xydHy4p2HMZWvcaYTg98eOhDJf8P9QXw21C
         dm17hMo8M8Sv22SWB7vgh4cyc36kfaqpo2wKu9WeFtqn5Ut125n4vie27D9hZVIwO3JM
         YxxA==
X-Forwarded-Encrypted: i=1; AFNElJ86uEihhoKLUOxcrfyd1UiJqlf3XkhQ+C5e+wzzqm+h3xBVK7ApZn4K0weXQdNbQG5RL0IOtqlfeA/Azqu4xxGg@lists.infradead.org
X-Gm-Message-State: AOJu0YyZlcR8kw3pzTs0phKHZYhXwdXVOv8mk7qOovEykftoAmmFYikY
	Ghs0EvaGH2buDerkz6Tk2CsbY4KpVm6Rd4A3ryOx7DZbU487NQ3ZlujdNuM9mHhrp/cvx0iWpSw
	YijYkciD2Xt46zzBNHLnZi1aFRWkto98=
X-Gm-Gg: Acq92OGpNVcQpJFLLr048MDFwz3vX3BPgSZqv99SWlzwN6DfZ9WvwVCsCCgM+cSUBoh
	0hJDpjOx2BRswkcf8ZQwCTUeQFhwzrb6G1lY8KhWNLkVVFmzC2tBddmH6xZ3+E25t8kP7y4EdX8
	6YLubGB0v+EcnGN8dqtQEO5m5NEe7OcqtOJJ3wdCelhOtR2KRCY93xYnlkgQLMPMwC57kZdk9Kv
	GxSL4EfkYkBKBEUXArjCCHpXde6WOLG7MW+ufFzlUNkZm2Q7TT3YexI7khDMA28s4uUarZu0voP
	KUkRbxw5AHfcR9fn4xC5A4CaYwwsoLQH7jXQpdV6F3M+8jAQGmjMQeynOAh9Z5+74KU5t58Lo++
	XP1Od5fLexIy2L6NpUsMiIufnabVjad1RCHunxCKRJH+GTciRh9kdpm09YsfO9nUwelmE
X-Received: by 2002:a05:6402:a50e:b0:676:9c6d:7448 with SMTP id
 4fb4d7f45d1cf-68c8d008593mr1310597a12.22.1780169623588; Sat, 30 May 2026
 12:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260528230616.186792-1-rosenp@gmail.com> <2026053046-bonanza-bobcat-6ed1@gregkh>
In-Reply-To: <2026053046-bonanza-bobcat-6ed1@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 30 May 2026 12:33:32 -0700
X-Gm-Features: AVHnY4K79MARsE55gPXS-mt6AcSVjDoRJ17LhtVUNVWG0hsymJZR1HNJqMyC57E
Message-ID: <CAKxU2N8Nq1hdG-C4xrbpr2OCiQuf-dZRC1GebuPu9PUE1jProA@mail.gmail.com>
Subject: Re: [PATCH] serial: mxs-auart: fix probe error paths and clock handling
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_123346_109876_9A1AAA59 
X-CRM114-Status: GOOD (  20.17  )
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

On Sat, May 30, 2026 at 3:25=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 28, 2026 at 04:06:16PM -0700, Rosen Penev wrote:
> > Sashiko reported three pre-existing bugs in the mxs-auart driver:
> >
> > - For non-ASM9260 variants, mxs_get_clks() obtained the clock but never
> >   prepared/enabled it, leaving register accesses in probe at risk of
> >   faulting if the bootloader had gated the clock.
> > - The error path and remove function used pdev->id instead of
> >   s->port.line to clear the auart_port[] slot.  For DT-probed devices
> >   pdev->id is -1, causing an out-of-bounds write and leaving a dangling
> >   pointer in the array.
>
> This feels like it should be a different patch, and not burried in this
> change, right?
>
> > - The probe error path called iounmap() while the IRQ was still
> >   registered. An interrupt during that window would dereference the
> >   unmapped membase.
> >
> > All of this is a consequence of using mixed devm and non devm. Instead
> > of working around these issues, go full devm so that everything can be
> > cleaned up properly.
>
> Are you sure that devm and irq code is going to work properly?  That's
> always a very tricky code path, was this tested with the hardware to
> ensure it still works on teardown correctly?
Nope. v2 incoming.
>
> thanks,
>
> greg k-h

