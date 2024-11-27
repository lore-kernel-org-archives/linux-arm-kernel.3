Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C460D6ACE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YVIFse3ZChPt5rxLEsxZQnkg/jV/uGoXgcbdEaGy7I=; b=y/1GKRecPDrpWGBYpVIZnC82W7
	L+9YKF9T5+VJrmSM79Y7mjoZO6d5McK5b8S8xHbhLBXXs+p15yf/8mSYI/TtRJttVqjdZI6j0okdi
	QrbhrHLm5mI/j70/9RF2Wg7zLf/mn8kI8j8+1gMStA/9FN2Qp+g8a3zjcy/SxHv+LK3UQFDVJdXcY
	U7fl7yG59HlGNy0g/crT466sWtp4fBWUmsAsl0IZOVneTM9fgLdQe/hM1DYf0GoaYln94eTdJ0dhN
	TgR7Qcz89vt+xj3jema2+dtgCArVoq7/UkdR/ggjjr/3eO8yU/l+p0m3uhSDUiSGqlVfkPryx3o2X
	KtHNOdTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJIC-0000000DP5b-0JLr;
	Wed, 27 Nov 2024 14:45:24 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJGp-0000000DOsr-3Dh7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 14:44:01 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ffc86948dcso31985441fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 06:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732718638; x=1733323438; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9YVIFse3ZChPt5rxLEsxZQnkg/jV/uGoXgcbdEaGy7I=;
        b=SGt81AGtOsyDyLZhUloQ0cHkH7qYfTTUlK3hM5r/VFNdVserzBiKcsMitAxo6DN6xj
         HNOBrlHy2VB2WASajVvk2l5TwsAlLZnXZIuf8apm81oaAu8grTykrKpElOW/rhX9YHeC
         feZCTjfa9eqT8hAqeKt2SIRJx60J+dUmqgabZOJ/KMzIzHC47KrlMpvsZw/9+8xYrUgd
         5X+RSieV0OizX0ML3KEOKR3kXO2JTa9DVQGkmwwGGzl2OGicKC20U8SQNuC6KTFG+Oh3
         iSRQTp+OZSjgikjxpmn0v1QhbDLI9mHjjGF9UFNMZHY6EGZp4qnbEVERjhJyFhsEPnMe
         maxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732718638; x=1733323438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YVIFse3ZChPt5rxLEsxZQnkg/jV/uGoXgcbdEaGy7I=;
        b=ivRCMJrk4MZVjygXm04nRP0Cato6HtSdbD0x+rnSU/we9xxAmA6NsZtYr/njAAdqIj
         X4qbx3v8Dc7hxzYGtlhnyMrQmMHTN6txmdZpX+9qHyNI6r439Lbuhe7gngu2c5so/mvw
         011ba1EkjW/1huD7ZUHQM/gaEwCfk2HujiFuUpo1qkz64nLWcFOtn40TJ0oUxRo8O/oL
         iI+g6dKNPFKRh1VWHC19YheOUvhrBNKhOPNexQnd7UeHuYa3pc6d3OQRmN2Zjptfzj7X
         DBy3Iy5xbJesPHqll0XLGqT6paS1gFIKA7t2kccTNfOWQlI6WeEmm1kBVmxvFNMedTyn
         lSxA==
X-Forwarded-Encrypted: i=1; AJvYcCX1jX43y/fGHKMSXHdigsASufad85zkidMNO8NLhx6ZQECXtkDhoIGRtR+dZK85QdjKOGDwOQNp7SYqlfr4oVL9@lists.infradead.org
X-Gm-Message-State: AOJu0YzXL3XYjn1hurKobg56J6+xDpyfalGShwUq3qikYdX8rCsFMetf
	IeFgeJh6jggF1g7Itw5bxpkeR/vJjvIO2/PkVSnsopXbwFNwCnVSw1RWrUSpT/IHaNx787Ubi/R
	MQWBP6T0FcfZ0gplNsM7Rp3tAXX33kh1Kof9xCQ==
X-Gm-Gg: ASbGncuBjC9DShC0fpKe82X44q9IS27El23aP47CI9jzNPCFhZyshx0vxg//5vx2tbS
	XNHiiRPIBoo4lHpOeBSB06XaRdFbeTAI=
X-Google-Smtp-Source: AGHT+IGRc+pnEqrVmcTeiSgm588KNdJoqDkUIBr6k6jJMRMMQfn38OBTZLWXgC+yJZqrBBmbWXdkKEpuJmNNp8+huYY=
X-Received: by 2002:a2e:b8c9:0:b0:2ff:8a1b:547f with SMTP id
 38308e7fff4ca-2ffd60201f0mr16551901fa.14.1732718637613; Wed, 27 Nov 2024
 06:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
 <20241122-orthodox-mantis-of-reading-2dcdcf@houat> <13cfb66b-f904-4720-8829-a6d9db85aaa5@broadcom.com>
In-Reply-To: <13cfb66b-f904-4720-8829-a6d9db85aaa5@broadcom.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 27 Nov 2024 14:43:38 +0000
Message-ID: <CAPY8ntD7tf6+PXKdWe8_KjCiPoemR0RQDiaHHndtjutOLGbR1w@mail.gmail.com>
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display hardware
To: Florian Fainelli <florian.fainelli@broadcom.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_064400_065527_1F738418 
X-CRM114-Status: GOOD (  26.30  )
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

On Sun, 24 Nov 2024 at 17:00, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
>
>
> On 11/22/2024 12:06 AM, Maxime Ripard wrote:
> > On Thu, Nov 21, 2024 at 03:37:00PM +0000, Dave Stevenson wrote:
> >> On Wed, 23 Oct 2024 at 17:50, Dave Stevenson
> >> <dave.stevenson@raspberrypi.com> wrote:
> >>>
> >>> This series adds the required DRM, clock, and DT changes
> >>> required to support the display hardware on Pi5.
> >>> There are a couple of minor fixes first before the main patches.
> >>>
> >>> Many of the patches were authored by Maxime whilst working
> >>> for us, however there have been a number of fixes squashed
> >>> into his original patches as issues have been found. I also
> >>> reworked the way UBM allocations are done to avoid double
> >>> buffering of the handles as they are quite a limited resource.
> >>>
> >>> There are 2 variants of the IP. Most Pi5's released to date
> >>> have used the C1 step of the SoC, whilst the 2GB Pi5 released
> >>> in August is using the D0 step, as will other boards in future.
> >>>
> >>> Due to various reasons the register map got reworked between
> >>> the steps, so there is extra code to handle the differences.
> >>> Which step is in use is read out of the hardware, so they
> >>> share a compatible string.
> >>
> >> A gentle ping on the patches for clk-raspberrypi (patches 29-33) and
> >> Broadcom DT (patches 34-36).
> >>
> >> All the DRM and dtbinding ones are reviewed or acked (thank you!).
> >
> > If the bindings and DRM patches are all merged, you can merge these at
> > least.
>
> I will be taking in the DTS patche shortly. Thanks!

Thank you Florian and Stephen.

I messed up and pinged the v1 cover note :( V2 is
https://lore.kernel.org/linux-arm-kernel/20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com/
Thank you Florian for grabbing the correct version anyway, although
there weren't any changes to the DT side anyway.

V2 includes fixing Maxime's comment on "[PATCH 31/37] clk: bcm: rpi:
Allow cpufreq driver to also adjust gpu clocks" that Stephen also
commented on.

Stephen: Sorry, maintaining newbie, particularly for clocks. I see in
linux-clk patchwork they are marked as "Awaiting Upstream". What, if
anything, do I need to do on those?

I've pushed the v2 DRM patches with dtbindings, so the clock changes
are the only ones left.

Thanks again.
  Dave

> --
> Florian
>

