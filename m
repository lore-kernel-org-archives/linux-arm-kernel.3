Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CAAC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRem6DUXALCMBVMdkPkqunnXTIQihy9/t+dbXKMENhA=; b=RmWprbKA6WJbAuE3U0yBhu7NEk
	nAsBdEh0FNAn+Gsv2qaBICwr3wj+JMdK3lLvUKmFSNZySP0gkEdRy6nwx4nu1se1uKhTOjr6W1Kn9
	WveWFvsQb+dilI7vKL9GHFbofN7sbDaCiNw+3eTHwPkkzmMMVXljFeGbpCARwtwvLJjKeq9gcOQ7f
	kHc6OAB76/SRIqEMpft/vqohtislU8W35u7uAem87XY3GPPIbfttGjo5kwXqAPT8w3j08nGc/Q9xD
	ZagLmpj7TTTv+hT1FYafQ0H2s724IsxVfXUNNc7kpGO4YdgqHq4SFyvJLhdcsvvVeS4oiEDQ+wphn
	/qgEOrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdc9-00000004OyS-0liY;
	Mon, 09 Jun 2025 14:36:41 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdZO-00000004OTx-3nDh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:33:52 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so1176140276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749479629; x=1750084429; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sRem6DUXALCMBVMdkPkqunnXTIQihy9/t+dbXKMENhA=;
        b=BnPc9ByfFtxbnM1du33rwI9s5RFkRqVDMxfWj91P8XJ19zCI8hEtM6TEXd5I95AKfv
         PiWm3ssnzfINp+z2LDC0CSi0mAINOPJah+ZfllVDl1JgqprdqMKlORF6hZTJmCtZqmzS
         xwvmnVlh2aIrZrPc76k0XlEqzSPRi7qt27C/L/3vWlmNhdQi1etWR72hbMKbb+vjIu5t
         gtRZViDEkSyqq6SfgJrPl6eMYtAO4xK+ZtVHZjMFRjM3hrISJUSYuah1kSo3uA3qot7n
         zqUIpmOAuHsu/XS34dUgbS7DGgh4vWxYkmDajNEd9aw8yHM+WLH8MYXKrHCHiW4PWUnx
         AKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479629; x=1750084429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRem6DUXALCMBVMdkPkqunnXTIQihy9/t+dbXKMENhA=;
        b=wupJtozDI5Ik3bO7MDE/EHYIaHBp/BTfaRkRKsBv9Lppt0VVCOdcgyfnrZufdSc4ls
         8aJ7DBL6s4BzaN4gGTX48klZI4A2eqUICpzfFMH7fTK9En2xktUYDmptDWWkNqxI5Mrg
         5ANpq2IPuoC4Lu+JAIOZSzpwxcB+EHhImgCsIFdUTIbkRsmJk+OoGtiF+WwRVhW5n+KS
         U9EydxNjZjOnBa2I4EtRlC1eqDDsPvLs5fe6i1yToWzPl25oIzNbHnudnDSm9GZZH8+4
         6cJdUC8/lc08HuLU4iMrfj2bj01L6OSz5gHwlBed0vKUL5/MD+n27RX/+t+Rf1fM4Fz3
         ijeA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Gz8gIqzWdsCT/aOAi7Wb2IID6bikNoVn8u74PRKBv5SKfW0nkqfVe84DAbPdCgI2Q/h9jqn6PO0sL/kSpeE8@lists.infradead.org
X-Gm-Message-State: AOJu0YyfH2I8l69S98VQ9fasiKnfab6kfI9LInYrbn4CIEO6kk81JHSA
	1PSsH03gXphqaxRlE+PwHE4dDrc2hw9poD6h6o64vo/GW9Wuii4+3tSGU64Eq0H0cmX5mpHh3rx
	ajwCtBeR0JYH6LTGVGAD05OCt/1IrVolI1WknkyvUnQ==
X-Gm-Gg: ASbGncuzPBESfkjVX+EoqSJW8MYZ3cq6Z+YdHvHE8JmQk+/XjwQDSsuXSR/TELQspr7
	7pG0wggTucO/7HcVXeT6c11V0rYg+Wmxwe5Ni3Gz5JTZ+FSdwSzTciWZzHIa6H7ENh4O6GUUyOd
	jYzFN00wiKwieOiUosAjDb/AUYgzw+BJ6wIbaX4IpasDU5a1Du5ZTIPG4OVx5CV44t
X-Google-Smtp-Source: AGHT+IG1XJVR1tbSdYVEWb4FS9GgmPTyeQbC5abWxdU05n6qKza4L8IcMKs32v/CHUtfg34znpezTvSPYt1ejigyCiQ=
X-Received: by 2002:a05:6902:100a:b0:e7d:c56f:a871 with SMTP id
 3f1490d57ef6-e81a21ee9f8mr16917604276.31.1749479629037; Mon, 09 Jun 2025
 07:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org> <20250609003751.GD14545@pendragon.ideasonboard.com>
In-Reply-To: <20250609003751.GD14545@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 9 Jun 2025 15:33:29 +0100
X-Gm-Features: AX0GCFtDywSf6GaR04ACAWb_r7XEMRsKC-bKUld6TILW38C8e_WYvs7YAoWpTFY
Message-ID: <CAPY8ntCnz6nkJSredd-sgMr87=0vuZ0OtfiMoPOfCZisKkzTHg@mail.gmail.com>
Subject: Re: [PATCH] media: bcm2835-unicam: Remove RGB24 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_073351_026280_0400284F 
X-CRM114-Status: GOOD (  33.85  )
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

Hi Laurent & Maxime

On Mon, 9 Jun 2025 at 01:38, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Maxime,
>
> Thank you for the patch.
>
> On Fri, Jun 06, 2025 at 04:53:03PM +0200, Maxime Ripard wrote:
> > The RGB24 V4L2 format is defined as a pixel format with 8 bits per
> > components, with the components being in the red, green, and blue order
> > from left to right.
> >
> > The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
> > RGB888) with blue coming first, then green, then red. So the opposite of
> > what V4L2 means by RGB.
> >
> > Since the hardware cannot reorder the components, this means that when
> > selecting the RGB24 format, you get inverted red and blue components
> > compared to what you'd expect.
> >
> > The driver already supports BGR24, so we can simply remove the RGB24
> > format from the driver.
>
> The only reason I could think of to explain why the driver exposes
> V4L2_PIX_FMT_RGB24 is to support CSI-2 sources that transfer RGB888 data
> with a non-standard order. I don't know what hardware would do that.
> Dave, Naush, do you recall why this pixel format is supported by the
> unicam driver ?

I've lost track of exactly what gets validated along the pipeline.
unicam_video_link_validate [1] looks to ensure that the V4L2 pixel
format and media bus codes match as listed in the table.

tc358743, adv7604, adv7511, and adv748x are all saying they produce
MEDIA_BUS_FMT_RGB888_1X24
ov5640 says it produces MEDIA_BUS_FMT_BGR888_1X24.

Is that an error in the ov5640 driver? If not, then both entries have
to be in the table to support all those drivers.

Looking at alvium-csi2.c and st-mipid02.c, both mappings are included
there (and RBG888 in the case of alvium).
Unicam's hardware doesn't care about the ordering as it just writes
the incoming data to memory, so having all the sensible mappings
between MEDIA_BUS_FMT_* and V4L2_PIX_FMT_* values makes sense.


My initial reaction though is that simply removing the entry won't
solve the problem anyway. You won't get a match between the
MEDIA_BUS_FMT_RGB888_1X24 requested by tc358743 and a supported V4L2
pixel format, so the link_validate will fail.
Swapping either fourcc or code between the two entries would be the
fix I was expecting.

  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/media/platform/broadcom/bcm2835-unicam.c#L2151-L2169

> > Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
> >       /* RGB Formats */
> >               .fourcc         = V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
> >               .code           = MEDIA_BUS_FMT_RGB565_1X16,
> >               .depth          = 16,
> >               .csi_dt         = MIPI_CSI2_DT_RGB565,
> > -     }, {
> > -             .fourcc         = V4L2_PIX_FMT_RGB24, /* rgb */
> > -             .code           = MEDIA_BUS_FMT_RGB888_1X24,
> > -             .depth          = 24,
> > -             .csi_dt         = MIPI_CSI2_DT_RGB888,
> >       }, {
> >               .fourcc         = V4L2_PIX_FMT_BGR24, /* bgr */
> >               .code           = MEDIA_BUS_FMT_BGR888_1X24,
> >               .depth          = 24,
> >               .csi_dt         = MIPI_CSI2_DT_RGB888,
> >
> > ---
> > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad
>
> --
> Regards,
>
> Laurent Pinchart

