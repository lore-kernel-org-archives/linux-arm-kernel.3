Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18A6CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPKwAyL9UdPz2i3tqzNIzvOjss5rG+rqIGyHJh5GmGE=; b=nzyn+aI224Df5QUpDhXCxLWLBH
	5dfCYesLTofaaxqva5TkSZPywkQ+gkHpVZLcmXMUGCjXtfnoVtKkKqLy3Gbu5w0HqWfctttDL/cQO
	fAO7KjBbHDfg3Z4nOZ9MDvPNGH/vcarbnSotH6+Zg6/XJvCscA5d9EO7zAL4Gcb69tknh9FDwGdV+
	lbtU3db4kUiqlCdizIq9NmiXH4sYUciTrxiacyXgrOHvNh2WQPr5pQvNkh5uVuRrthYqut429EDCk
	JQqpmNLYy0qLa+LC0m7mLtkLkWsv4uUErEXUh+9LVonnUAJmqALp5+jlWz6C5ik/CtIy2YZ5UUaBT
	ao2n+lPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut27v-0000000BxRP-3rwA;
	Mon, 01 Sep 2025 10:51:07 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut17g-0000000BnwW-2GOJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:46:49 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-544aeeb296aso779955e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 02:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720007; x=1757324807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPKwAyL9UdPz2i3tqzNIzvOjss5rG+rqIGyHJh5GmGE=;
        b=edHVIuCCMVpo7tWrFt66TUJSBywXvttVtffD4oHUN9d6sX7aJLdFGV7vHGhyXD4Klq
         XHpW29GWSimGSx7AgCiK9fhIzTwX4FOTsXM0u4ZYWJ7/1wMPMzeveQVwd8vsIPuKxDwe
         XdQiKQNKxL8coce80DWhTVB0H/G5ehnRhctTL0RVO8H8PI2DkeoM3wanCjgo2MVfsKzc
         vmBrgLAY4mFcyp0Vjr6yKW8zkIBIRtlYR9/9n1/j5TVbCUbJVqEsKH0Xi5UI+I9bC5x4
         pOnWgViNMydIV57lp5ybwgXXQ4TJx0wyi7WWfpK7i/uFNrVmrxMwhrC44oV9uzRT7SHM
         btXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFjVMQxbsH4zWzy+/jqoB4rpovKpcINKbmRgUsmDQRjrtLx4WTTXO5IwaO4DiKkykTN9hY9/G3yV4C8hHWvUSZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1rsPv2RhINIBN/r7nIAkth4S+62N3L63xHTtbQCicuwaEWHv3
	QPEM6zxyAqgz5RQZfd6QwycYXTDxYcvwVfr5DVhxNTgE/Vtp7rsXpm9fRhKjPfqg
X-Gm-Gg: ASbGncuP0jcrO+vAU2PIRccHd1d1Cl0TLcROUaSIcr6URrr5JolTacX+Ml0M2xRklTN
	856OutMojgmaX4kEu1Yg5cMVcqhqNNqA6KFnjZIope2a0tES4TimgDJjgWy62vkW/F4hWCIuJit
	S71sft2gf4Xm8+VpiRHtPWGvdpCJCwudTJ/H7Hs6fXKV44OOVULbkz4IaTw5642zBnEU7VbZHQZ
	EUn0zIk30mPvfHnSUSrk5eqThuEUUF0sc8YzAZps/gM7MJeMLogZCTUdY5WeMKTLYVXMxILOXI+
	s/GzH2XRHwLP77oyoFDySn86hPn/x8wvVoN8d9E+Bl6rkRcejnA4FcxerW1cDiVkOItH8r0kyxo
	gIHy0rHNQjW2RjubpSbhttKbZhrniRxNP8htfB5BLmD8J0CfmDtltqRXu0eXemfWMHhsUNH5H1d
	8=
X-Google-Smtp-Source: AGHT+IFWbQXfaZZ+WLD64Y7ou3S4wWQtjeLFMfJYoOOJq18Ag4zhlkIGU2spNy2uk3rnVU21SHVWXw==
X-Received: by 2002:a05:6122:2219:b0:531:2906:7525 with SMTP id 71dfb90a1353d-544a01c856bmr1903570e0c.6.1756720007017;
        Mon, 01 Sep 2025 02:46:47 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544912c7125sm4178167e0c.5.2025.09.01.02.46.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:46:46 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-53b1736eae2so3052153e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 02:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlWtVoyORj+upABLddDBssPkGvtHxKUhBYGrUnW7mUfCz5+Zwf1Puksl6yeKIL1MZ5jAPmBRlbPCbp7/J65ip0@lists.infradead.org
X-Received: by 2002:a05:6122:2219:b0:531:2906:7525 with SMTP id
 71dfb90a1353d-544a01c856bmr1903553e0c.6.1756720005789; Mon, 01 Sep 2025
 02:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1> <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev> <aK2gE0CysSWisFwB@x1>
In-Reply-To: <aK2gE0CysSWisFwB@x1>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 11:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
X-Gm-Features: Ac12FXySlzljzJBVQIh8T5D4LvHlbiTfXVHCTZ-xPjSYu4UAWotdvWAobnJMb5k
Message-ID: <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after resume
To: Brian Masney <bmasney@redhat.com>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com, sboyd@kernel.org, 
	geert+renesas@glider.be, linux@armlinux.org.uk, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_024648_578051_64494A83 
X-CRM114-Status: GOOD (  42.72  )
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

Hi Brian,

On Tue, 26 Aug 2025 at 13:52, Brian Masney <bmasney@redhat.com> wrote:
> On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
> > On 8/25/25 20:05, Brian Masney wrote:
> > > On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> > > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > This series disables clocks that remain unused after resume.
> > > > This is necessary when the resume process is done with the help of the
> > > > bootloader, as the bootloader enables various clocks when returning from
> > > > resume.
> > > >
> > > > On the RZ/G3S SoC (where this series was tested), the bootloader enables
> > > > the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> > > > 1 is unused) and the clocks for a serial IP (unused by Linux).
> > > >
> > > > Testing was done on the RZ/G3S SMARC Carrier II board.
> > >
> > > Do you think that other boards would also benefit from this change? If
> > > so, what do you think about putting the call to register_pm_notifier()
> > > inside an __init block in clk.c so that this same change doesn't have to
> > > be implemented across various clk drivers?
> >
> > Yes, that was my other approach I was thinking about. I wanted to see how
> > other people consider this version.
> >
> > > Alternatively, if this is board specific, could this be fixed in the
> > > boot loader so that the clock that's not used by Linus is properly shut
> > > down on resume?
> >
> > As a result of your request I did some more investigations on my side, I can
> > say that, yes, in theory that could be also handled by bootloader.
> >
> > I can drop this and try to do it in bootloader, if any. Please let me know
> > if you still consider this (or the variant that implements it in a generic
> > way) necessary.
>
> Personally I would go the route of fixing this in the bootloader for
> this particular platform.
>
> If this issue affects other platforms, particularly across multiple
> SoC vendors, then I think it would be worthwhile to have a discussion
> about adding this functionality to the clk core.

How would the bootloader know which clocks are not used by Linux?
And why to offload this to the bootloader for resume, but not for boot?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

