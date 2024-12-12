Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32523E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIiyY1DojuqYwP8kOfCtRvyI9XPWag4T5+yXbCexAAc=; b=Gf4dNqKnCTPy9dUXXCTlSOd2V9
	rmIsW5HXR98s2sih3M9gpTAkb3j9Iw3H2pBnQY7XojxzoH910bO7xOHnzj5FqBOn9txCzvV9FHDr5
	fWvUr9P+oKfu2pEBqTj8QkI8vgMMZtw/p3NyqJI+0jdpr6xP4+ShM1XK7TiEJ0p4eGf+h8npqn/GS
	lIfwT/O+VGpu7TED9Z7cT3MkS/T713WMBZnWQ3/6flwm2EgNQ9ctOF7hc0/RKe0kPfMLcrgaBsF2a
	asG59ASS1znPdvQYY01huD8Rm0zDDf9gh9OTL9hHU1weIk5dOA243GJ+DhAaTZu1pPAoTVlm+iqhj
	yUmywisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfk3-0000000HXpf-26PR;
	Thu, 12 Dec 2024 09:44:19 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfae-0000000HVsN-2ZbG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:34:37 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-518a861612eso652609e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 01:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733996075; x=1734600875; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vIiyY1DojuqYwP8kOfCtRvyI9XPWag4T5+yXbCexAAc=;
        b=cs1q/Qa9P0cQ21fv/sJz+8BcqvCmvAsEGbNfgYbQA2dRlNHpbH0CKr3nh1u2bVWjXY
         +05Lt/dIUna0OUHSMPaLb4YYBLoC1tVi2D2e50Bq9dFB6q/Z83+XyTkwe9RrK+b4+el9
         wTiG2klKvx31XYUPhMo4BVrKJKW+ZpXy1AU7APvfaFUTZYDA0dVkUBtM6rbEpI5E02rO
         HzvIhrvqwhlKESBws588GcSddgH4COqrk2MP0pnGRrOgLC37NhzeAsiixeyFozN2V/vj
         h6pWvnnj2wP6KFiLXibyMBCLA1sKXabGwAfuldgMFAZ4zZwf662UwLTiQTw2BuoONXs7
         qGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733996075; x=1734600875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIiyY1DojuqYwP8kOfCtRvyI9XPWag4T5+yXbCexAAc=;
        b=bQ74U5li9cwOUw+axmPhxP5QEqzI1qg1GQKwzZqIDUWd452D8/YGudzIDFtPh3WXnO
         C2obCY9Bb5rBscka+7wvDfBDeuIC5pU0qBujroRSgSxBJtRf0JI8kvvivPVbSMfnBcvB
         rTMMHGx1oTwycM7IOYQT1qthW1XtKnSByICPk6mS3vc1+RaXx2iW2wbelAMH2T1yTqD9
         m1lhNkAaodE6NE8W0hAWUJawqfJZGzOBpzyBCbNxBk2A2eaDW9oSODuMolTG5PuQ5DzD
         e0gODQmVXF8Q45RTHWuas4iPRkDp06vSTLOyFt3ILP9xB7qb5fQhKw8gtm17ffazeImH
         n5sw==
X-Forwarded-Encrypted: i=1; AJvYcCW06L3bdnhfVu7z06MYu64AuStyUkYXvDqCYq3uDL7OZ+mF2HEpq0C2QMVWK7DwrZP0mOULqkROC3y0CspXZJEq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk0f9YWR5kwF46DIwFLodHjsqZ5/jLqTeKlRcl49OGMiYoPPkc
	pJWwKO33Qx5kAVeadV29ZqricJVDZyYAu7W2BYySHiH53DE4hvGOFn7LX1IUH1Lmuv/7e/F9gf3
	batYolbAQ5XGxSdXSC/M501wS6nE=
X-Gm-Gg: ASbGnct8DPdYsqLQhGSaUS09/Byb8OUnt9YW0OBT8Ooeiy75TjWOJn3R5L0Szddyb2k
	0k1Pydf3r64Do5WZ5m9qS60B9G9yotd4bevJWiw==
X-Google-Smtp-Source: AGHT+IEZdVuZkfUgdpPT2XxtE4NxJsWzqM3d6A/dsmpnRJSb9HoGfRwCAOhclvChuS+G2XD7aJsNnWUsWJSD7eWoaug=
X-Received: by 2002:a05:6122:914:b0:518:7d3a:dd13 with SMTP id
 71dfb90a1353d-518b5d0e582mr1947522e0c.7.1733996075319; Thu, 12 Dec 2024
 01:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20241211122026.797511-1-karprzy7@gmail.com> <20241211125936.GA23711@pendragon.ideasonboard.com>
In-Reply-To: <20241211125936.GA23711@pendragon.ideasonboard.com>
From: Karol P <karprzy7@gmail.com>
Date: Thu, 12 Dec 2024 10:34:24 +0100
Message-ID: <CAKwoAfqFbZ0rWzYwX+WTJzMUE1K1Es_UtZj6YXwDKqs=HR6f5g@mail.gmail.com>
Subject: Re: [PATCH] drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	michal.simek@amd.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_013436_652398_6E0330B6 
X-CRM114-Status: GOOD (  25.92  )
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

On Wed, 11 Dec 2024 at 13:59, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Karol,
>
> Thank you for the patch.
>
> On Wed, Dec 11, 2024 at 01:20:26PM +0100, Karol Przybylski wrote:
> > This patch fixes a potential integer overflow in the zynqmp_dp_rate_get() function.
> >
> > The issue comes up when the expression drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit arithmetic.
>
> Please wrap your commit message text to 82 columns.
>
> >
> > Now the constant is casted to compatible u64 type.
> >
> > Resolves CID 1636340 and CID 1635811
> >
>
> Does this need a Fixes: tag ? How about 'Cc: stable@vger.kernel.org' to
> get it backported to stable kernels ?

Thanks for the feedback, I'll add it.

>
> > Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 25c5dc61e..55e92344b 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
> >       struct zynqmp_dp *dp = data;
> >
> >       mutex_lock(&dp->lock);
> > -     *val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
> > +     *val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * (u64)10000;
>
> You can also make the integer a 64-bit constant with
>
>         *val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
>
> >       mutex_unlock(&dp->lock);
> >       return 0;
> >  }

It does look better. I will send v2 of this patch.

>
> --
> Regards,
>
> Laurent Pinchart

