Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C607FC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J405qXIsAkaaQ6HHUqff/iiQgjpmkZvb1eF2OKZ5QAQ=; b=bRtRC3VBiCot1WnoRVXqWx0g+1
	i0mCGwvA6Nc9ob96j9G+VlPic5elUiVNjjWkXRysAUWDSWYNrd0zRNOWt9IAB2EIrcHwPTBsXtN50
	bv3t023zr28L4GloGKJlk1zZCVLdNjB4XUJa9Jp4IBeeP2FjlcbvzJNAfzOkRsaKQiLQZBS/7261L
	wo/C42ul1szoGohtIEyGm2Q+U7rXB/HVvxdlkaSqvfbJToipGQqpq2SstdWqsBfWnJuhjN9b0RQ1N
	mCDHM4sRJhkfcn08ixmJWQP59nT0127fHEDmnUlT8rCM0yDbeg79FJNklfopkOLhTuYAj0YZ+DSw4
	WjO3KPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzsC-0000000Flma-3Ofu;
	Fri, 13 Jun 2025 08:34:52 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzpv-0000000FldS-2XhR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 08:32:32 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-87ed1c2b487so96351241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749803550; x=1750408350; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J405qXIsAkaaQ6HHUqff/iiQgjpmkZvb1eF2OKZ5QAQ=;
        b=bnIQej5kG8LafOZkXW+c7usvba3urV+GDx24ah1PHI3Ep2pUVuYdgLnGPwEFbN3SWu
         hJl00OOct3rCE5xo/wiwmk6kZcXe8Qn2zj4wmPYlLPu0p9wfLk2FPiM44r0NoWvIoyHm
         Bnz0ZfF43Xu0FCr3U5cqQ1m4ZdVl8fabTJGYd4qgJvsx5j+dqznm+uXHY5RxFFyIexpz
         IbLgJE47MuBh/9+FrAHdSVD/oxCakFezyHXWOwKiN8a5KMAI/Kyop7dh350KGjDm6lgJ
         +kmuuV2vxtfHHlHsviO2VOBSUy0OqH16ZZg4kIzmEDb3sLMT7uHGVNFzAPF2HtR/w3R6
         xbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803550; x=1750408350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J405qXIsAkaaQ6HHUqff/iiQgjpmkZvb1eF2OKZ5QAQ=;
        b=XXsuJvuLbOOKZNGwDn6UQjsMZ2PrNGXgQ7L40K7pZ4TmX2RwGK/MRa3Y93pnBKpSbq
         mEMcCmU9b2SqimEcQeixS+NjZkTnEcPL5hqFaZZ4/yCB/4PmUHAUnZlkq435ptcqc7oI
         hwVkyZcJEiuzKayRpfsIeBOnELS2BZeO+KmaHB64HNIme6Ms7YT+JsUpNigjgaA3nU+z
         FGW2vs/zRuElqMVd4QS1xNIqlUiVjmdqCXYP4/69M0rmDLDZrTbPVfQ3VzHtTvW8akNk
         44OQpbSTBQN9F56kewAqRkaYzI7sXUFsG+wk6Vs79QFjL3De6GBvRzXrykPQcwcxgF5v
         W4HA==
X-Forwarded-Encrypted: i=1; AJvYcCWPDCqJ0HjKNncBaN2FZUO0rGm4DPqk9/BIFZ52KTxmiOsopnIL91kUuyr7yNRzSNwaqVo1QuzfsLgk7P3WT3Bf@lists.infradead.org
X-Gm-Message-State: AOJu0YyRW+GHishR5toYJ6TPef165/YkAXkkf7j4XAdBI67qviXGwKZu
	MFMjin2vZWhbp3bje2iPW0OQHxg84PGSicsJzWxaaD5/bL5Xxw6nZs3wt4tcSqNW3KoYRJUPWV6
	BwA3UiCP0MYq3tzIvijFx2GRb+xtP0Nmo3yENN8ptfQ==
X-Gm-Gg: ASbGnct43ckfQCjxbboDKjjBLYi0uQHNNsRYX31gg4YTRxWd9alC6RfPKZ4bKxY0EqP
	xZ2w/TlJy6zlu+VDqGn1momvqBu4H3cCYElkiCGGLAw4gkj90RYf26qwun/TkjbPwFhohFhTDgi
	BRTUH7LPpASjW0G8u8dqstRp2TTVSXBPLobb51gQud7/M=
X-Google-Smtp-Source: AGHT+IGjfqmGHZ++E68u9IYFbwPPPlA9C6cYjkbz7TN8o82wVreUeiUObDw9xsR+IrjHsi6gsVp6xiPba2TUT9U8KZw=
X-Received: by 2002:a05:6102:38cc:b0:4e5:a0c9:3579 with SMTP id
 ada2fe7eead31-4e7e39d8353mr404443137.4.1749803550411; Fri, 13 Jun 2025
 01:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
 <20250606-pispbe-mainline-split-jobs-handling-v6-v7-2-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-2-46169f0622b7@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 13 Jun 2025 09:31:56 +0100
X-Gm-Features: AX0GCFsyTraf_uRc2iDgE2HwWNjYCrPi2Mep05YPCt_X0Mktt-KufxERnc7iduU
Message-ID: <CAEmqJPod6cKh2z1f4qFatcAdQ7m1GoBNQrYVESHb1UehNv1c6A@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] media: pisp_be: Remove config validation from schedule()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_013231_693059_F9364B4C 
X-CRM114-Status: GOOD (  28.81  )
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

Hi Jacopo,

Thank you for this patch.

On Fri, 6 Jun 2025 at 11:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> The config parameters buffer is already validated in
> pisp_be_validate_config() at .buf_prepare() time.
>
> However some of the same validations are also performed at
> pispbe_schedule() time. In particular the function checks that:
>
> 1) config.num_tiles is valid
> 2) At least one of the BAYER or RGB input is enabled
>
> The input config validation is already performed in
> pisp_be_validate_config() and while job.hw_enables is modified by
> pispbe_xlate_addrs(), the function only resets the input masks if
>
> - there is no input buffer available, but pispbe_prepare_job() fails
>   before calling pispbe_xlate_addrs() in this case
> - bayer_enable is 0, but in this case rgb_enable is valid as guaranteed
>   by pisp_be_validate_config()
> - only outputs are reset in rgb_enable
>
> For this reasons there is no need to repeat the check at
> pispbe_schedule() time.
>
> The num_tiles validation can be moved to pisp_be_validate_config() as
> well. As num_tiles is a u32 it can'be be < 0, so change the sanity
> check accordingly.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 25 ++++++----------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index b1449245f394..92c452891d6c 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -588,24 +588,6 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
>         pispbe->hw_busy = true;
>         spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>
> -       if (job.config->num_tiles <= 0 ||
> -           job.config->num_tiles > PISP_BACK_END_NUM_TILES ||
> -           !((job.hw_enables.bayer_enables | job.hw_enables.rgb_enables) &
> -             PISP_BE_BAYER_ENABLE_INPUT)) {
> -               /*
> -                * Bad job. We can't let it proceed as it could lock up
> -                * the hardware, or worse!
> -                *
> -                * For now, just force num_tiles to 0, which causes the
> -                * H/W to do something bizarre but survivable. It
> -                * increments (started,done) counters by more than 1,
> -                * but we seem to survive...
> -                */
> -               dev_dbg(pispbe->dev, "Bad job: invalid number of tiles: %u\n",
> -                       job.config->num_tiles);
> -               job.config->num_tiles = 0;
> -       }
> -
>         pispbe_queue_job(pispbe, &job);
>
>         return;
> @@ -703,6 +685,13 @@ static int pisp_be_validate_config(struct pispbe_dev *pispbe,
>                 return -EIO;
>         }
>
> +       if (config->num_tiles == 0 ||
> +           config->num_tiles > PISP_BACK_END_NUM_TILES) {
> +               dev_dbg(dev, "%s: Invalid number of tiles: %d\n", __func__,
> +                       config->num_tiles);
> +               return -EINVAL;
> +       }
> +
>         /* Ensure output config strides and buffer sizes match the V4L2 formats. */
>         fmt = &pispbe->node[TDN_OUTPUT_NODE].format;
>         if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {
>
> --
> 2.49.0
>

