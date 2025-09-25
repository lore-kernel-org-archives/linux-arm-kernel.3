Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47140CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VG4axCfxY2VruLkFskd43MY3X29CZllfJGqxG9KijI=; b=SQUx+GJVx5pjZxywCaglmNbG3c
	SEvtREkoEzmAVNFThcYj1u8WsRqUDlbiaxZhkz18ydrNx+UqFZ6FMIgZTLtlNzbQP6C8TNRXyZSF0
	WXK0XPeAkz6EHbZ+tRLI1aZtGW8ifSZYjqllitjV0J75nLQO+t9FqrWYLoQ9DpwPqmdiJsu/toO0k
	qjUDgOqG9JmOn01h5b6Y+FfWMLUBV9g5knXvtu6QOcr/3OfKfotK2y7lUVxQfVYuYZtcLSwWkNa3y
	rb39MEiAr4Wl0+5kPMf9WWtwRAgY/+l4XJz2/BORNODVu3bO1uAnc5LccNKJVCXitdswEeSjs2mWg
	+FYV2mNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1luF-00000009M2f-3CcL;
	Thu, 25 Sep 2025 13:21:07 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1luC-00000009Lzz-1zsQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:21:05 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71d603b60cbso10406977b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 06:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758806463; x=1759411263; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4VG4axCfxY2VruLkFskd43MY3X29CZllfJGqxG9KijI=;
        b=qDw+vylPIy2wPj0AIhraZiXmSZxwC2bbCMjtMGDxO5WYZT5hNmTDB5baOeLDjA3YYv
         aqBznl9/up2THubE9tSSQpMnCwdwFliVAokGKQvMT0cmxSo7o7b3iD43SWAuQowrx98K
         roZ2nvY4WBDVP6LaEp5mVD7zshj0+vOZ4WEapMiTsIUHQJKoOV1ZF4YcFMndigMymzn2
         dk5jFYdWzEYXKsBAASb22ij6i/jIdJwCctNpv9NF8rUAT1M6jR7S0day+NGbJUCxoJsy
         1YyBQ7qYInwE/+JfsbCwGogMEZj5J+fc+6GGWxsCKHzK6u0AkCSiLMiGX1H55nBDGBFx
         gYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758806463; x=1759411263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VG4axCfxY2VruLkFskd43MY3X29CZllfJGqxG9KijI=;
        b=FE1chZHiwdz5dZze5YvA64g/32y5nmCjXRCcUsyw7NUDuiHAcooPwlw+Lfk9tmN6k4
         39093hBMzWoRo2lO1dcO0Bh9hDP0wTeOFPkBB5MOeKUuqJbbgGq7CQRrH3tFq3ROhvG9
         NXNLF+iBw+qLnbHy3P+/yvik3OvW1OkC+sv8pzBBd7drA9pYBX5kyYzEr9di9NDTwh6w
         oHC8jq8ZQAbtbTZ1ycX0LqJ4VROwZkrVn90pLSHmsPXNFOWcGBuAMJ+Ls36ReYmPg+56
         Jk1QsIOs25Tp4JouNpRFdac3VWiRgt+xLAxRxeKLbOklOjc09SmKHZpdsUBk9gRzViDc
         UJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw/AhrpQJu0MFQj4qXxvwYzFzkB4YKySzYo7OQd+RmH9EhGllvUoBkiFgURdK0trChCjKHn9q/ZKWtIq8xCwVM@lists.infradead.org
X-Gm-Message-State: AOJu0YwsU1T1BTFyEXd+cfQlbKUCYeICdDE+JgVJi7buiTBD2YXNAGD9
	OnTrKrJM6KUP3VuwPiAgNm3XpIVp+Tg9JpyB2QHBbJqw3Y6Yx0XswD5qaR61dNxV7tUXXromMQa
	wfvh4Col3nsaojlk/jgoN+Qpuj06WQE5X+bGwvwxgEQ==
X-Gm-Gg: ASbGncu7BceCTcHtWibT27uiulWsuhveWcSgXSsvM2Ryq0SA2ySGIVZc/riapHIPpSl
	Xa/ar9ht0o/TXRp2yJYm2OIqvcUIYRj5i6WLgro2zhJZPwROrCCquj8lRQL+xKluOBf46Cu4CLv
	hdgL9EELS26BX02JlvkO2aLPKXSgu7AEhIqOA3CQj0koRnuL+iGNCGj7j8rReIgA/phHs1Iy/jP
	hUYCYc0
X-Google-Smtp-Source: AGHT+IGZF84EGEcJ4wcONA3NS9+OZ2xh3iimMrOT8Psj642ZRdZzPsML4L6NnKLHVd29XW7oN/nkEmvMCvQcCrnK/Q4=
X-Received: by 2002:a05:690e:1583:10b0:636:bd92:b253 with SMTP id
 956f58d0204a3-636bd92b7b2mr527783d50.53.1758806463094; Thu, 25 Sep 2025
 06:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250925115924.188257-1-ulf.hansson@linaro.org> <55b41549-f5c4-4e83-ac1e-11dd068b1f5f@ideasonboard.com>
In-Reply-To: <55b41549-f5c4-4e83-ac1e-11dd068b1f5f@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Sep 2025 15:20:27 +0200
X-Gm-Features: AS18NWDgHhaPpJ-kJEdm5ZBKa_hqeUvNyG8N7Cy2NJLVKY_w8Ixa57gUB_BvF98
Message-ID: <CAPDyKFr3sXU4nXmQTH3+hfVN2P6nFVXRBPUgTPng1-j4m8+r6g@mail.gmail.com>
Subject: Re: [PATCH] driver core: fw_devlink: Don't warn in fw_devlink_dev_sync_state()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Saravana Kannan <saravanak@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_062104_522474_88705236 
X-CRM114-Status: GOOD (  31.81  )
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

On Thu, 25 Sept 2025 at 14:08, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
>
>
> On 25/09/2025 14:59, Ulf Hansson wrote:
> > Due to the wider deployment of the ->sync_state() support, for PM domains
> > for example, we are receiving reports about the messages that are being
> > logged in fw_devlink_dev_sync_state(). In particular as they are at the
> > warning level, which doesn't seem correct.
> >
> > Even if it certainly is useful to know that the ->sync_state() condition
> > could not be met, there may be nothing wrong with it. For example, a driver
> > may be built as module and are still waiting to be initialized/probed.
> >
> > Ideally these messages should be at the debug level, but since the
> > ->sync_state() feature is under an ongoing deployment and the prints
> > provides valuable information, let's move to the info level for now.
> >
> > Cc: Saravana Kannan <saravanak@google.com>
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reported-by: Sebin Francis <sebin.francis@ti.com>
> > Reported-by: Diederik de Haas <didi.debian@cknow.org>
> > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/base/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index d22d6b23e758..97eab79c2f3b 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -1784,7 +1784,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
> >               return 0;
> >
> >       if (fw_devlink_sync_state == FW_DEVLINK_SYNC_STATE_STRICT) {
> > -             dev_warn(sup, "sync_state() pending due to %s\n",
> > +             dev_info(sup, "sync_state() pending due to %s\n",
> >                        dev_name(link->consumer));
> >               return 0;
> >       }
> > @@ -1792,7 +1792,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
> >       if (!list_empty(&sup->links.defer_sync))
> >               return 0;
> >
> > -     dev_warn(sup, "Timed out. Forcing sync_state()\n");
> > +     dev_info(sup, "Timed out. Forcing sync_state()\n");
>
> I have no issue with this, but I also think that while the pending print
> above could well be dev_dbg, this one is perhaps a bit more warning-ish.
> It may be harmless to get the time-out, but it would be better not to
> time-out (i.e. everything was already sync_stated, or startup scripts
> handled forcing the sync state).

I agree. Perhaps we should consider moving the above "sync_state()
pending.." to dev_dbg at some later point, then we should probably
keep the "Timed out..." print at dev_info().

Anyway, I don't think using dev_warn makes sense, at least for
configurations with CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT being set.

>
> >       sup->state_synced = true;
> >       get_device(sup);
> >       list_add_tail(&sup->links.defer_sync, data);
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
>  Tomi
>

Thanks for reviewing!

Kind regards
Uffe

