Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A03C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=; b=dd3CFUQ2s3dhRjkltrIh1olKot
	N/7S5hkqpZyqK7ouBOOV7kokmPrtQ6kZ53CPGdM2N+nInADKOt2G3Orc4I2avwFKh9IiJJUYddrw3
	MoePxmHLz7KS6EjYnnrZXuUM8t/M/8JijcwlHgIhCWbcdqc8P2V9KhPs3T+4MUb8XGuUcjDcA9hZB
	Us57szCIADG1C1yUif45UAKBCHTL0058D2QVM/dWObUTF/DLjXbjeTR1ka1z2ycEIIFd89SviXTck
	ezIdi4TsOicJWNQ3NIN2CjEx/h3PTkCmMQAN3sBWnCBfxh5ibmm7/lbIjkAZt36W0Jb8CNi4a9hzb
	S7hLNzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcrL-00000009Rb5-0JuF;
	Wed, 19 Aug 2026 09:45:23 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcrJ-00000009RZN-0HZa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:45:22 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-836ce5d6e85so14269907b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 02:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132717; x=1787737517;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
        b=UVpYKnvcH9/1npz1kMo7YLJG34Sc+mcg6Bv/Ur5BkmZj+YZXmXjl88TxZlqbM3FC95
         P1J3UOQc+vDCoOj/WdLo5FwqXOOec3o0EoaNpHTYv8l3Wx9EZLrS3/aeV89fDfXdoVs8
         p+T1hGd7QWmaQIjBIqoFIG3U6/6xzTYoPisQvBn/rCxK0Gsm1dK/EgdEIDKIXTAeUE1O
         YorfiTwJTOb4V6Ab9hzdWE7dOCXaxUwS+WeqW2SCn4Hsyp3ZS5pHiQyjGZC/VmdaYFi6
         PuJ4UBtuMelWldLESEa4lOqG9ILcS1+36Aqr1cC9eU6JGOZzmDq0YGh5Ct8Y1OG8NI7y
         SBUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpurvxvjh7ZB6k+15jS9EjedWXf2qRRlWHaM3Fl+eMev0knMkZVZzBp0jNtdWg0NEi9ClbksqI32dL08jFkbiZB@lists.infradead.org
X-Gm-Message-State: AFuF++nWSG4/YbDOH+sGrbYA2V+ReBkIg/rVUoD5SOZhYCMKRPOsELRs
	z0SW9yC6HRze0erbRVoKBsrHOFipMhb3U3TEIWHrSKdt0ViqfmULCt9i6sDWdwClzBM=
X-Gm-Gg: AR+sD13HX5dWWBlHhEIH7sfpDrrDXSVeaah1rkIrNEm0isqKLnZB5QiShf6rd71WnM7
	jzen0RG6OIgzOzmwkaZp3SgExXxV8c4eyZllrxyYEFhf27CgdHua7mb25Jy0agK5wP/Ws15KSeQ
	6s0cnwzfNmhyUz0ZqDAxcPCwNuB6gj1aVJeyC3xq1F0co/yr8TLdTJFFKftQ2rkCB5Jn/H84uZu
	Bgs2wZoOmN3IbpgKr9nTetJEiDYuLoC8isjNY/PMn+lahIKbYUNNvDHD/O6PyvEaVqHU7AUB7nB
	VBMf+bSFiFcbh3K34rCi9S3RVjKxOE4fISfW+fL8HsKWpSLwEFjIb7cpoRez4xkfV0x8EbZKE22
	/mq2uT/JIV1lhqZ7FfKsV+18NCMW+Wm8ExEpoNTNBB4tXrGWH8sMe4zFNkXrh/o5aPOAT+6AHNK
	Q2cUbPEtQvSAUFu3mbcOtGhiXe6qJwqwNoe/h0kacCkA3YN4PZ2oD/MC9RKMJFzNV8vMcTWTsIF
	yy5dkelkwA0Sfmj67RMVnvflA==
X-Received: by 2002:a05:690c:6f0d:b0:81d:5155:213b with SMTP id 00721157ae682-844df7448f4mr16355117b3.14.1787132717031;
        Wed, 19 Aug 2026 02:45:17 -0700 (PDT)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com. [74.125.224.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84512a4ba95sm5754767b3.16.2026.08.19.02.45.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:45:16 -0700 (PDT)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66c70d73210so1150268d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 02:45:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpUXbhpMe1bbKKAUbJC9+t9XodvceqdrklwccFdVKI/uapbnkdOjJYwwZ75gG+AF9iWZkMBTzFKSiB9bKKi1sN9@lists.infradead.org
X-Received: by 2002:a67:e04e:0:b0:777:ffe0:a10b with SMTP id
 ada2fe7eead31-777ffe0a6b7mr539021137.4.1787132346344; Wed, 19 Aug 2026
 02:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260818125012.468092-1-tzimmermann@suse.de> <20260818125012.468092-2-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 11:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uwr-MWNK1wEAyEr8Z9JNVhxk4jrnSNE7dazUpWIvLo30uHHQJP967oerw
Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_024521_198233_A10B6F10 
X-CRM114-Status: GOOD (  26.69  )
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

Hi Thomas,

On Tue, 18 Aug 2026 at 15:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
> allocates them for us. Avoids the kmalloc later on. Also allows for
> using sizeof() to get the number of bytes in each array. Access the
> arrays once with memset, so that the physical pages are available on
> a panic.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>  #define WINDOW_BITS 12
>  #define MEM_LEVEL 4
>
> -static char *qrbuf1;
> -static char *qrbuf2;
> +static u8 qrbuf1[QR_BUFFER1_SIZE];
> +static u8 qrbuf2[QR_BUFFER2_SIZE];

I am not a big fan of increasing kernel size like this.
You may run (faster) into boot loader limitations.

>  static struct z_stream_s stream;
>
>  static void __init drm_panic_qr_init(void)
>  {
> -       qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
> -       qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
> +       /* best-effort allocation; can be NULL */
>         stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>                                    GFP_KERNEL);

<ironic>Why not use a static array for this, too?</ironic>

> +
> +       /* touch memory so that pages are there in the case of a panic */
> +       memset(qrbuf1, 0, sizeof(qrbuf1));
> +       memset(qrbuf2, 0, sizeof(qrbuf2));

Please clarify "there"?
In cache? Not all systems have sufficient data cache, so it may be
evicted at any time.
In RAM? AFAIK kernel and module memory is not demand-paged.
In TLB? Like cache, it may be evicted at any time.

So IMHO this is futile.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

