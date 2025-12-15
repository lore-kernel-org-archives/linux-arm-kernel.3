Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2E9D5B862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 18:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgNHGQuNqJYS8SDNw0YQDcQ0j9dj4XHzKQA/e9DbvTI=; b=n3Rc36VtHd/+DaKR8z3xsZtNTZ
	J2wKzYRMm5c/0R7NiTueX1rA9gvsNe0d1z6OkUecI9g09Lfu5VB7Tgy5q9NpUaJaPqRnwVwzUJYDV
	gvFs9lY+0Ls/Bo53WUYhYZcrHidNgHyla+MFjqj1yuKj1s0FkMs4mBct8HS5EV/a2NiD2j4sP3CNk
	SmWBjZsP22wKeJIq+e3X1jdrlM3nKgLOz5EYFT2UmSngcEe57kPH1vd/Dr+M3pyiAJ121v46NL7Mk
	/PNtI9TVzf+nAwNNDMCdFkZh4y4WbiFnamBAHK4OZ3CxwHGOusNsegnYZ7+6aS544sFHV+OvYYeP/
	bjkHkzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVD7I-000000047Rp-2ADY;
	Mon, 15 Dec 2025 18:16:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVD7F-000000047Qq-06UB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 18:16:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42e2d5e119fso1732266f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 10:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765822571; x=1766427371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgNHGQuNqJYS8SDNw0YQDcQ0j9dj4XHzKQA/e9DbvTI=;
        b=WE2QQakDIx1e5qZVLlecHn+E/pdxhios8CZfoACrMZD98EjDh+3K/40kyxvtnVVqMY
         E3kE/SGqYOwMKZm2ZGZ8q0Jr30ZJvnwUACn3JLpq5jUvGxgnlA3o41SrtySp/9Bbxuoy
         xTUkNHzyFciMcZu+UmoBvGWVKA4K3zcmufv91CA8mki93ZCOt9/ptlrqmgyTq76YQoJB
         i5820UcWvgDsSxASUdTnOruTm30klVX7z7T5oykNdRjp9y8958YLvHahRjqPZUKsnK/G
         8I//7ytINic42THdWR9eU+ry9bkCK/yaVd7O59VVThzeZ7s209FmoOs+gNXaRl1B/xhZ
         LgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765822571; x=1766427371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mgNHGQuNqJYS8SDNw0YQDcQ0j9dj4XHzKQA/e9DbvTI=;
        b=lx+biyHIcCKboYYpLQe+EydRLHWG0iIZzQUpkOOgM/ItHwlEck6iy1pw+W6CErM7XQ
         Cx2p0w6c3yydtrw+/qiLyfYprM7CGsNehatuWYhYBOXY7Wom6RxMd9SEVL8KJt9SSH8I
         2zPvy1vExufX36fA2Cj9z4twSioyAZIx6lcxGx/EM2CD7UHKuv9EbJj7AEgsSRK9ONBF
         QvcgMOVhw4yyXl+HRwUKi6YQO/4qkvSnEogUykaJjEdsqRTbF/LTaKQxNU0R2wv1y+dR
         hcVO2U5Jlqt2MBvkIqumaMYfyHEK5wFYtOuA+iLFuxBF25BBWGFa1XZj2XMY6ERoYcKb
         JoNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6/+OdyaLc5FUOeUrZS7jjqRWi25+bx3XbMMLjTEJ4l9g5n5MWQeBeCdzpC8EC/08Q8B8XISU853Iyj3O636S7@lists.infradead.org
X-Gm-Message-State: AOJu0YzyV68bWRzD3SH/zTYhS0abmxEKYCQiWfApNbDYZ45dM9u9NMRe
	Wcs4/+AdV+HRvqJwJUQCn2Ds+idbzJMnRgB7nU8D/kpahBbnuDOxmk/5
X-Gm-Gg: AY/fxX5nPN6Dw0uuc8G3w9hbDOiSIEOTAizMGxvnbDrGtrsuGRGAtVfd9xm1snGggh3
	617TUYOjaIzDlWxQeYPldI2wrqBsihGd7qCF2h6hFk//yYBKQazTGNg7z3+ARUUuaghmCM3uFei
	espw3814jDrpayhkGWGSPnJ9rphUjRy1pRREfoZvn7oFpOw/SbiijdLnyMRzIB+kaEoSVFzdk+c
	/HXSuo5QxhWPxXwBJXto6nAhljv9FpnaiYC3WohKUqPyNhDGoJrXrVXFrfBAvT9nRF5OZlP7YzZ
	jpwp6eJgLrf9UWhdksRjhO/YUZmfAUp7zXQ/w+EDY0Dw3KdbwsFfds7+6AX3r8lT1kVj+Xg3Mbj
	G5bRWGw0wRpH05tnd6QpLBNqHsQX6f5vWeiMO99cZH6KGx72akGx4F8C5eQ/m+8h8gPJRR9NF0A
	LVJMma20HRJuRGmvWmp557G74vR994FT3/oUoBOJVXYeuHOSuFKSN1ojZMQH0vGN0=
X-Google-Smtp-Source: AGHT+IHyDJpQHBms/ienI8KAmWZu5MhqukBnjyYtenMu2CYLWW1CjFUhtTLo4yMnCvX9Pd/MmTJfXQ==
X-Received: by 2002:a5d:6643:0:b0:42f:bad9:20c9 with SMTP id ffacd0b85a97d-42fbad92628mr9345753f8f.19.1765822570360;
        Mon, 15 Dec 2025 10:16:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f9339d86sm11129355f8f.29.2025.12.15.10.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 10:16:10 -0800 (PST)
Date: Mon, 15 Dec 2025 18:16:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Daniel
 Stone <daniels@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v4 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
Message-ID: <20251215181605.29f6afcc@pumpkin>
In-Reply-To: <CAPj87rMeJWLm9J=7kMrEvbpzVOMiQc-TThSNE-Gfac7nhUB3bw@mail.gmail.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
	<20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
	<20251211223822.6eeabb4d@pumpkin>
	<14738785.uLZWGnKmhe@workhorse>
	<CAPj87rMeJWLm9J=7kMrEvbpzVOMiQc-TThSNE-Gfac7nhUB3bw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_101613_089673_A7BF5D62 
X-CRM114-Status: GOOD (  27.57  )
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

On Mon, 15 Dec 2025 17:55:13 +0000
Daniel Stone <daniel@fooishbar.org> wrote:

> Hi,
> 
> On Fri, 12 Dec 2025 at 12:46, Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> > On Thursday, 11 December 2025 23:38:22 Central European Standard Time David Laight wrote:  
> > > Except that all the systems with PANIC_ON_WARN set will panic.
> > > I believe that is somewhere over 90% of systems.  
> >
> > I also like making up statistics. Warning here is the correct move
> > in my opinion because this warning being triggered indicates a bug
> > in the kernel code, and with PANIC_ON_WARN the user explicitly says
> > they would rather panic in such a case than treat it as an abnormal
> > condition that is recoverable.
> >
> > The reason why this condition ever occurring should be treated as an
> > abnormal condition is because the DRM subsystem should guarantee we
> > don't get a framebuffer of a format we didn't explicitly declare
> > support for in the first place. So this condition being hit either
> > means drm_universal_plane_init is broken, or the array of formats
> > that's passed to it is out of sync with the conversion code, which
> > is also a bug. Or someone managed to thoroughly hose DRM's internal
> > kernel-side data structures, which is precisely the kind of thing
> > PANIC_ON_WARN users want to abort for.  
> 
> Yes, that's exactly it. We make all kinds of load-bearing assumptions
> everywhere: that PM code won't pass in a NULL struct device pointer to
> the resume handler, that our driver callbacks won't get called whilst
> the device is runtime-suspended, etc. We could try to handle every
> single one of those with if (clk == NULL) return 0; /* ??? */, or we
> could not.
> 
> If you'd like, we could just delete every one of these checks and
> replace them with comments, explaining what we assume the invariants
> to be, and wait for an OOPS due to dereferencing invalid pointers. But
> the MISRA style of 'handling' every possible impossible case is not
> tractable.

Especially since it is often easier to debug the NULL pointer reference
that the work out why a BUG_ON(!ptr) happened.
(In the former case you should have the contents of all the registers
making it easier to backtrack to where the NULL came from.)

	David

> 
> Cheers,
> Daniel


