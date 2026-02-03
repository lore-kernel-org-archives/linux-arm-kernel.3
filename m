Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C07BE83040
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xupDN7U8jo/ur0l8TEPJ5S+Q1LCfr8wdWzFtyWDAYZI=; b=I+jRnnC+KvJnz0R78+v6LEr/lk
	XLX/bbBSnwlIDy7nJdkD32dcicNY2AqHhQMBrlHLp528C7Brl+U+sv/GfSZv13Q7GaT9GgLldBYvA
	ibE1hx07w+8eM60zBcenjrN9kDhFj2ZXLeKcw2QiAYhyVjBFxWutPFWhsKWIf+SFvJAL7xyWsd6L9
	GxGAsyq5cvO3mG79Huo3T5WmK5XhApRKnWHuSihOX3j7FO7rd/iydZxLt8BDcaqEalX6+j5V9Zcib
	yvGedtVib0PkVjGWlXiL8GC6ijO4nSJi9qqqFzIg5BrFvaoHYVnL4PuWOGKAUEgY9LGHFsrFsC+D4
	kDLlTFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6Q7-00000005wA8-2AK4;
	Tue, 03 Feb 2026 02:45:39 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6Q5-00000005w9e-1tBe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 02:45:38 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b885d8f4092so894440366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 18:45:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770086734; cv=none;
        d=google.com; s=arc-20240605;
        b=c43U+mFsb/V5FTm9wfm71czBHlmd9JwIs/1HNIldFas1MUn43gvqZ+3y0yF5bZ1FXT
         GP5ncpth7l+HPBNWeZArAAFIAD7C9UQWtAt5Qn2VssGCutNc1lUxl+BzWvQYLEmPt0yX
         wDMpRzrUvOkZ88S9kXKKDJqz7M8938RpeYsGLC44D5B3CJeK78arbEUyr4gO1kYIpD1Y
         j09XmMKlHscX4iXvHRVOW15xdiO/pZSW/u3MuMq4LiqqFl5qe3JKrrtwFI25JU+lHPho
         RwRIz/kkpVC+t7CdZrsqreKDRF+SkqFyvv1NQSRvYpXNOxdC08tpNfpSdpm7qlH7mngk
         y2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xupDN7U8jo/ur0l8TEPJ5S+Q1LCfr8wdWzFtyWDAYZI=;
        fh=/JeyrS8bU1psPC86XJrtD7HHUWZMCO+At1zHzAkNZQM=;
        b=O+WX8VJLePfU+OYLRGYiwbEpd9aA19cp5QoXmYKih5KBU9AGtXMKZ5coEpMSPtsAQZ
         i3n5TC6AgS23Sv+jK2UvHRYme8IFfP+rcZHZYb3ApYa2tR7r8PHT1j7Mha10cEPYCeXs
         1cektg+5lKjV9ikfqUj9HmhZXPslYNtnWBh6QDtrO352I2BlLHwiEiElBZ2N3XFftgUP
         Igm9fy+GWiCBY2k+VWf8TLBooRQfl36WXhD3uy35H8PHogL6XMews4GBiSZGN4FZYE7N
         MiFMA9A25PIvjbgEil1Dddc+YC73w/lR3WA3FNxb06hn9aRffEabynGznym4ncq+i3N1
         b78A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770086734; x=1770691534; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xupDN7U8jo/ur0l8TEPJ5S+Q1LCfr8wdWzFtyWDAYZI=;
        b=GBxBK5f8v4z2BzOChiH2I4BoBG6HuYiecvTw2ysxwnIv3qzQLWaZfeg/gF7ckygvZz
         qTWuD8PwBJGRqgONp2GHFHVBucByffySvRku+4y4QGrZvy9LUSS8fzbtCDPFGX1xVgDZ
         YvH06l6OOMPNIOegwDYVbumAVx3P+U9l8QRBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770086734; x=1770691534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xupDN7U8jo/ur0l8TEPJ5S+Q1LCfr8wdWzFtyWDAYZI=;
        b=R6c3s2IXevHT4UKabGQiEWuXXhvEN/ZLndWE2mhCF0Pj18f4QG7GYf2jPZRWlOc3PV
         Z9/2Ph87Q0HfUIvCwTeUgv+YuvMm0xa5nGgQiuesIeqtZHv1DAm84J/fqLMx+ZGKBihi
         5dKOL7duBH4AHHSSLYKUBEoQr9KrwSmTEtM5e2qpRuDlbIrENRfTlG1Gf1sI+WM3aFKo
         sPo/VWOs5vwkLtpGU0OAPy8pCPXWaLju/0uNtYoXB8sXbns6yznHNqkFDomy/gg3wEzw
         fIz4o057YLb4O8Y8mP7BCJFqELnDBgvoSd299btsHvUj7jIOHTERC87p6oVL2FNTUSzC
         IgCA==
X-Gm-Message-State: AOJu0YyPkOq1PHhM0cBNeq5s0RIOIvbHjKGBm00Xwj1hsg5XGeZC75Px
	UZWrYoyu9onnfyDI1K01pE/go2h8QXqOd2ceemOdt6bVEgv22VsC4sdL3Mdk8OUGNP0ls+VLFv3
	lzm1qDo9YogO2lrbPXgoWVAZvV7iTi1MA/d+vJrNpZeJkcDIZUiiOVg==
X-Gm-Gg: AZuq6aJybCfhNX2VBLjvl672d5mha75dJEaNDyiD4bbHt94pT4Y1yYdE5S9Xd7AeUyw
	AZsHvMekMgrvTi7bF2QtH1pXrdArFwkbtj6ztXJCDTIQ21JgbKO1yTQM9uL8/2aoEehqBGQYfOI
	ppGqGE/pn0W6S1iTcQ+eLZdHqP0L+UEVHk6jsUOXdsrcASRTM9Dop3GdLv1nxXii79MaPCbENHj
	n9egmRjCL6AdNPUOHkJr7hPIiIsallk0L0AAt+pUjUWfEfluxhUkeC35QoQIQC5TxVGxVkm
X-Received: by 2002:a17:907:c0c:b0:b88:6e10:62c8 with SMTP id
 a640c23a62f3a-b8dff5af6e7mr751989266b.2.1770086734497; Mon, 02 Feb 2026
 18:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20260106162738.2605574-1-sjg@chromium.org>
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 3 Feb 2026 15:45:36 +1300
X-Gm-Features: AZwV_QgnBfiJqJbH-3FGayscL5-1WELwFwvfl8RRJPEzpgV1MUQJt-MGQ4m0cAs
Message-ID: <CAFLszTgQWjewjYHWUhG44em+deNY9xWDFz_YohduWvM=Bd_D5A@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster operations
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, David Sterba <dsterba@suse.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Nicolas Schier <nsc@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_184537_647860_8271FA6A 
X-CRM114-Status: GOOD (  23.89  )
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

Hi,

On Wed, 7 Jan 2026 at 05:27, Simon Glass <sjg@chromium.org> wrote:
>
> This series updates 'make image.fit' to support adding a ramdisk to the
> FIT, provided as a parameter.
>
> It also includes a few performance improvement, so that building a FIT
> from ~450MB of kernel/module/devicetree files only takes a few seconds
> on a modern machine.
>
> For this version I have dropped inclusion of built modules, as there is
> still more discussion to happen in that area.
>
> Changes in v9:
> - Rename the variable to FIT_EXTRA_ARGS
>
> Changes in v8:
> - Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'
>
> Changes in v7:
> - Add a note about the " -> ' change
> - Add a new patch with the MAKE_FIT_FLAGS change
> - Mention xz as well, in the commit message
> - Drop patch 'scripts/make_fit: Provide a way to add built modules'
> - Drop patch 'kbuild: Split out module targets into a variable'
> - Drop patch 'kbuild: Allow adding modules into the FIT ramdisk'
>
> Changes in v6:
> - Drop the load address for ramdisk, as it is not needed
> - Bring back the ramdisk 'compression' property, set to 'none'
>
> Changes in v5:
> - Fix 'use' typo
>
> Changes in v4:
> - Update the commit message
>
> Changes in v3:
> - Move the ramdisk chunk into the correct patch
> - Add a comment at the top of the file about the -r option
> - Count the ramdisk in the total files
> - Update the commit message
>
> Changes in v2:
> - Don't compress the ramdisk as it is already compressed
>
> Simon Glass (6):
>   scripts/make_fit: Speed up operation
>   scripts/make_fit: Support an initial ramdisk
>   scripts/make_fit: Move dtb processing into a function
>   kbuild: Support a FIT_EXTRA_ARGS environment variable
>   scripts/make_fit: Support a few more parallel compressors
>   scripts/make_fit: Compress dtbs in parallel
>
>  scripts/Makefile.lib |   2 +-
>  scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
>  2 files changed, 145 insertions(+), 36 deletions(-)

Can this series be applied, please?

Regards,
Simon

>
> --
> 2.43.0
>
> base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67
> branch: fita9

