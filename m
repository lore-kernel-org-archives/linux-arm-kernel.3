Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0600EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9yGTD2yu84mlddSkREi20uhDyFHI2hi1pRd4d7s9yk=; b=yEAy7L+pEoiyKjvKT76JibSU0O
	GIoNrOkIXF8913qdfRLySdMsGUrJ4xmABZsOgqYT9YhvtIh9qTu1u7AafuPKZT2K0hESGz02Xgc5v
	6gkpnB/Di1vq3SV/+McUhVuMKb0zelRiKLaA7Rnw6OeMa5GeoYh/L+v9LdkAfrd3RrJiH2n/lEigi
	Bnu7afvJHi309Fv0BzhFTv7+zL7KuKu6ncG+T8TJfNlXyNdllJnc734JGVgqG9+WxwuuocuzrKHr/
	yhjJ7BOD1k0zzLG6D2yuprk3fyRZCf4uVxx5LyzhqRQsDkbbVWKfugx3XoH3VucAvJEPjwdsXV2x1
	fcKLMpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVao-0000000Fu8Y-0v4Y;
	Thu, 16 Jan 2025 19:31:50 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVZX-0000000Ftmg-1Ndh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:30:32 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e46ac799015so1887349276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 11:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737055830; x=1737660630; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K9yGTD2yu84mlddSkREi20uhDyFHI2hi1pRd4d7s9yk=;
        b=KQqfDx/XubzYFTTFxmo2Cb7OLbbHJ11qmcGDqIO/yzCP9/oY0lvaQnFgJZyogJq5cZ
         ygcnmcnncHC9uQiqGuZ7w+Djdu67zZw+SRHyIFZhfjyZG5u5pd1GH6pd3mF91+E5QXxq
         Nx1peCXAV/OPKzdTh6drANso6x+xwoZfC/fXU/r19eHhxmtxC7ZHrejUpFEcBifbtHET
         eG30k3qBaoga7d/RSYWB3mda+CZ3lAFa9Q9EkKwxIJsdmlkVnFf6lUC2L8AsBF1CjWJw
         lHV/wn0CPMjYG1nCnWpIozUAv703mZxG8t53dsE0/7B8olWhUVUwPFOWbPJYdur3ExmS
         W8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737055830; x=1737660630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9yGTD2yu84mlddSkREi20uhDyFHI2hi1pRd4d7s9yk=;
        b=iq6WNdPNa4S6g+pdA+pnbFVX/vUm8FjARFgEqrDFLJ9CbpDCNKcaVBhIai6NsBasSF
         5mUyV8VgKTfBlAhQBoN0NyLfW+n6IZyecFt3+FkkNbsZrFwNdGAxHtbnzqF3jXcOvuQE
         8sW9bfLwP9LrTSrAUE3WAqvckjtO9LGKEidUPhbQdC8ko+v1XdWu2YcwlQ87vpJuUt3M
         mF2x6r9GkqjcbLmririb9JdqMZO4R94/P8E+BR2HVhjlfj/KDf4fqQjEnnUEdo3hZP+8
         0qsTvs1knk4yrxHO1DPyQHbJSyBj0L3eKKIrwOW50rHIaJZ3gHrWobSKi/E/gNg3PNu8
         d8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMhYSLCaK6ybfpgYEfo2SJRQHw5nhDa/Gz3Hvw5EwBR9y8iZN2Zphvnh55PIlo7wcwz0NymTe3mNGe9iNKmlyj@lists.infradead.org
X-Gm-Message-State: AOJu0YzCyBLL+qlBWNUdlM0BjGxl7aj6owQ/ROHTCYXZbt4YmxTSS+ph
	fpRW81U2QSE39YC7FMGPHec+kT/71YgyzAjqZHtSDR+mNbZE8pocCYDczg0VS2hKavLH0qhu9CU
	jKM6xyF+aaupsP16t4oBs2T9KPSZo8gYSjjUX8g==
X-Gm-Gg: ASbGncsBru5ZCImLnCFiQlFAHs8OMkTXsWgmfp5VT9GXV+EgGsY0f81QFnC4Cew1HZ4
	4aPau44EEg7josP4Vx69+jXul0/+1HAn79A5R5p4BTd1lACYtpXCCiMfcv46LRCOmem1jFA==
X-Google-Smtp-Source: AGHT+IFXG849W4uNWpc4bFNrizPOkptByt52u9hfJ+BJR1wUhWUYNlnui+HfcnnpuS0n6WGsOedCv9P+RnA/p78YhBw=
X-Received: by 2002:a05:690c:113:b0:6ee:4ce9:b33e with SMTP id
 00721157ae682-6f5312252eamr304823777b3.12.1737055830258; Thu, 16 Jan 2025
 11:30:30 -0800 (PST)
MIME-Version: 1.0
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <974a3030-0531-4c4d-9769-af752ae4898d@gmx.net>
In-Reply-To: <974a3030-0531-4c4d-9769-af752ae4898d@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 19:30:12 +0000
X-Gm-Features: AbW1kvb0Im_xVBsOKkzTFauIDT67Sx1H5TzizuoNDn6oj7mq0-uOqt38-I9PFmk
Message-ID: <CAPY8ntAP2EhXsVDRgK9723feWrS5M9z5=vgN4SjuAmAF3wQNGw@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk: bcm: rpi: Add additional clocks for 2712.
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_113031_588404_2E02C1E9 
X-CRM114-Status: GOOD (  22.19  )
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

Hi Stefan

On Thu, 16 Jan 2025 at 19:11, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Dave,
>
> Am 16.01.25 um 17:24 schrieb Dave Stevenson:
> > These patches were Acked by Stephen as patches 30-34 of
> > https://lore.kernel.org/all/20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com/
> > with v2 at
> > https://lore.kernel.org/all/20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com/
> >
> > I'm a newbie on kernel processes and where the patches should be merged.
> >
> > I'd asked Stephen on the v1 thread as to what needed to happen to get
> > them merged, and he asked me to resend the clk patches for the next merge
> > window.
> > I must confess to it having slipped my mind, but resending them now to
> > hopefully be merged in time.
> from my understanding, not all of these patches are specific to BCM2712
> (Raspberry Pi 5).
>
> Could you please clarify (no need to send a new version)?

You're right that they aren't all specific to 2712.

The patches were all part of the series adding 2712 DRM support, and I
didn't check the details of exactly what was changed in each when
writing this cover letter. Sorry.

  Dave

> Best regards
> >
> > Thanks.
> >    Dave
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > Dom Cobley (3):
> >        clk: bcm: rpi: Add ISP to exported clocks
> >        clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
> >        clk: bcm: rpi: Enable minimize for all firmware clocks
> >
> > Maxime Ripard (2):
> >        clk: bcm: rpi: Create helper to retrieve private data
> >        clk: bcm: rpi: Add disp clock
> >
> >   drivers/clk/bcm/clk-raspberrypi.c          | 33 ++++++++++++++++++++++--------
> >   include/soc/bcm2835/raspberrypi-firmware.h |  1 +
> >   2 files changed, 25 insertions(+), 9 deletions(-)
> > ---
> > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > change-id: 20250115-bcm2712-clk-updates-98a47f32116d
> >
> > Best regards,
>

