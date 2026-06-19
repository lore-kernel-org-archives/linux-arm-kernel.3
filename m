Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C58ACD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIGBVuVVm03R19snYPTC5iI7SwI4WcfAC4ZQNabDd18=; b=u2mYuipZrp6jiMvZsXVynaHFVA
	SZ+kfGRUJWakzceySLo+Lb/tO1FfsBnbnHuKwzkekP3YphLU5cYhLa5ipdgEXdOpwYxUHIFk5VnSF
	9EhvR2PpYcQHrwRTcfmmRIofwkG/lRSUU3Xcw919Jd18Um8vIQQ3GmeHfZ5SX+KBiOKGBsQaD2aaz
	0DSGPGxvkMppWHEXZLNzNxyNptJPQgiyQNXGth5TmMN1JXnmhX1e/w1z2RzcAkGvDfuynWbn5C//E
	YNXOnl8e2t+ywS8OOi1y2hYC6TaJiPhtZrnSteK+mmrcd+y+v3VnkypZosyQ3OfephLGv77tJik06
	l3tNdRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waab9-00000002bIU-0EMT;
	Fri, 19 Jun 2026 14:53:35 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waab3-00000002bHR-36aP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:53:31 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-9159951f05aso243934785a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781880808; x=1782485608; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIGBVuVVm03R19snYPTC5iI7SwI4WcfAC4ZQNabDd18=;
        b=GFVxZXPorjRQ0KLbObPFRL/hcJc9LpZSUmxEMTgNrtDLD1TuKC7y3IezwQQKsdzDbU
         nox02Yw73BXFLCCmoY3DfdmCDQ9DC8oxoxKSNrvGK3pNbY5uf0rEfrah5RFTZiQFJDGm
         UCd5XUAr9Njm+q6GbD626Hm50oCzoEulLPIEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781880808; x=1782485608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XIGBVuVVm03R19snYPTC5iI7SwI4WcfAC4ZQNabDd18=;
        b=MSK0T108i+n5BKOO1hIEEDxSoPPNBe0qyNuPIncI8x0ZxQJcqpCf1J9s3pg48azpr1
         090YsOaSvMLnpQnOmjztoqJtmSV+Pe5Bz7KcsuIf2JevLEZxguRefcBmZdonv8NxtKsh
         FmIKSX6TZ8D/v7ff8qxiib7pKKOK3h6WyTshMCOiUV+fINyS7Q1fmFqMnRhhmtwWPVaj
         P8NRO1a+T2fsYFUvgW6hJBevjxwtdT/CzaNSUYyUOAoLpIw0FflXwT+Z3IL7a0YFnQHK
         pKB110Si2TKxNCe5txnyG+3CYi+DA1hbmcQjd+QhNDUiZp0mIbwR/gkgLIjWFDHUaOzu
         6q5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8x52UO/riWius0w5Y20tbDaU36/js6pmGlxOPBl/6d1eD1fJrvjCxvrP3KVENXXmfkEfxkVBve8TkbDjy/2Fx4@lists.infradead.org
X-Gm-Message-State: AOJu0YxPPZ3aI+0YKg5PlGOTJb/8iELSRBw0wx3B0DDQ+T0Tui6OrIxC
	XhSjg8JPDACDqAB93joyAipyc2UF8DTcunz4NcVsA++VbuJPLyHQ7hbLhXklIKCQuZS9+SZJafK
	lUGSebA==
X-Gm-Gg: AfdE7cl2ojPyD92KE0bt0NSMt0M28lDIG/JSjsBD31Qb23Z+ygKL5L5so9GJbwGWEiX
	sy5mPahWc96O5opidmIUVOt+tnXdVHpNam0JI+9RhMgOD18VBMj5yRTMcgL65JlsTAJyPmd4yyM
	13n1KN1cinktXasQQxaU6oSnSI8ANJZDdpIMBJx3xL7yLcjN1ZyrOxtCpGWvsyjW6XmW1yML6rR
	lndTAtDSdx3wjk0gwtWx6Ey5VaRF990iresfDZhY9y7UOMFv5L2y9iEorm7HVjgPuEooDdDOWBW
	iJMlphUznQZVVmzk3vub4e01hDDQDS7ChSZlr7ssWzLPZyDDr7DDxZCGTl1/06/bjEbPtmoJ+6i
	RqXgRZj3DAoKZ9oO+fgBQF8oUsVxFAUNmksacN9h7baqH0DPhGNVVwldPx1WAYX6cbN2Nsa2/3k
	kO+EjSS9m06AGOKIDzZF3DNI/E8JL/qqmGe9WkP9wUb9cpA1HwibU=
X-Received: by 2002:a05:620a:2552:b0:915:9c4b:fda1 with SMTP id af79cd13be357-920d1af3d2bmr403439985a.21.1781880808220;
        Fri, 19 Jun 2026 07:53:28 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a4e6591asm261246985a.41.2026.06.19.07.53.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:53:27 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51765531803so303471cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8v6imGT8NOYkNa5LhfDTnco6t7V1YZ9W8y1s988Lg0fVSMZtZybn2oxYCcVg770hSJ6I9BV0sIZ6/P2J360H6p@lists.infradead.org
X-Received: by 2002:ac8:5e0d:0:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-519e890ed52mr6854591cf.7.1781880805032; Fri, 19 Jun 2026
 07:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260609121329.1262170-1-senozhatsky@chromium.org>
 <CAGp9LzpBUReZtrTEKgUr-+yvB+3tcs5hw7ziC4WaMRFNa2AYpg@mail.gmail.com>
 <87tsqyirsn.wl-tiwai@suse.de> <CAAFQd5DyDQo9vBH80YYQBW7Bgf64F1m9q44-jhf1cc75XYpftA@mail.gmail.com>
 <87jyruiomq.wl-tiwai@suse.de>
In-Reply-To: <87jyruiomq.wl-tiwai@suse.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 19 Jun 2026 23:53:07 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DDH3LynVPUxS3Wj7xQoUMcOWfxk8cRhXaHyEY-dj5fDA@mail.gmail.com>
X-Gm-Features: AVVi8CcjnxCeHWkLS06U6AojxhWztkixD9Fe53sN6dMUH6hUtZPXwg6RxFcRCjE
Message-ID: <CAAFQd5DDH3LynVPUxS3Wj7xQoUMcOWfxk8cRhXaHyEY-dj5fDA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
To: Takashi Iwai <tiwai@suse.de>
Cc: Sean Wang <sean.wang@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Mark-yw Chen <mark-yw.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_075330_349014_FAEA857D 
X-CRM114-Status: GOOD (  37.59  )
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

On Fri, Jun 19, 2026 at 11:36=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Fri, 19 Jun 2026 16:17:31 +0200,
> Tomasz Figa wrote:
> >
> >
> > On Fri, Jun 19, 2026 at 10:27=E2=80=AFPM Takashi Iwai <tiwai@suse.de> w=
rote:
> > >
> > > On Wed, 10 Jun 2026 08:52:31 +0200,
> > > Sean Wang wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Jun 9, 2026 at 7:19=E2=80=AFAM Sergey Senozhatsky
> > > > <senozhatsky@chromium.org> wrote:
> > > > >
> > > > > Every once in a while we see a hung btmtksdio_flush() task:
> > > > >
> > > > >  INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
> > > > >  __cancel_work_timer+0x3f4/0x460
> > > > >  cancel_work_sync+0x1c/0x2c
> > > > >  btmtksdio_flush+0x2c/0x40
> > > > >  hci_dev_open_sync+0x10c4/0x2190
> > > > >  [..]
> > > > >
> > > > > It all boils down to incorrect time_is_before_jiffies() usage in
> > > > > btmtksdio_txrx_work().  The btmtksdio_txrx_work() loop is expecte=
d
> > > > > to be terminated if running for longer than 5*HZ.  However the
> > > > > timeout check is twisted:  time_is_before_jiffies(old_jiffies + 5=
*HZ)
> > > > > evaluates to true when old_jiffies + 5*HZ is in the past i.e. whe=
n a
> > > > > timeout has occurred.  Using OR with time_is_before_jiffies
> > (txrx_timeout)
> > > > > means that:
> > > > > - before the 5-second timeout: the condition is `int_status || fa=
lse`,
> > > > >   so it loops as long as there are pending interrupts.
> > > > > - after the 5-second timeout: the condition becomes `int_status |=
| true
> > `,
> > > > >   which is always true.
> > > > >
> > > > > When the loop becomes infinite btmtksdio_txrx_work() loop never
> > > > > terminates and never releases the SDIO host.
> > > > >
> > > > > Fix loop termination condition to actually enforce a 5*HZ timeout=
.
> > > > >
> > > > > Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt servi=
ce to
> > work")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > > > ---
> > > > >  drivers/bluetooth/btmtksdio.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/
> > btmtksdio.c
> > > > > index 5b0fab7b89b5..c6f80c419e90 100644
> > > > > --- a/drivers/bluetooth/btmtksdio.c
> > > > > +++ b/drivers/bluetooth/btmtksdio.c
> > > > > @@ -620,7 +620,7 @@ static void btmtksdio_txrx_work(struct work_s=
truct
> > *work)
> > > > >                         if (btmtksdio_rx_packet(bdev, rx_size) < =
0)
> > > > >                                 bdev->hdev->stat.err_rx++;
> > > > >                 }
> > > > > -       } while (int_status || time_is_before_jiffies(txrx_timeou=
t));
> > > > > +       } while (int_status && time_is_after_jiffies(txrx_timeout=
));
> > > >
> > > > yes, loop continues only while there is interrupt work and the time=
out
> > > > deadline is still in the future
> > >
> > > I stumbled on this while backporting to distro kernels, and I wonder
> > > whether this change is correct.
> > >
> > > IIUC, this essentially makes the loop exiting right after the first
> > > cycle; the patch changed from time_is_before_jiffies() to *_after_*()=
,
> > > not only the logical OR to AND, and *_after_*() returns false, so the
> > > whole condition becomes false, too.
> >
> > The intention is for the loop to keep running as long as there is still=
 an
> > interrupt left to handle (int_status !=3D 0) and the timeout has not el=
apsed
> > (jiffies < txrx_timeout).
> >
> > Note that time_is_after_jiffies(x) returns true if x > jiffies (or jiff=
ies <
> > x):
> >
> >     /**
> >      * time_is_after_jiffies - return true if a is after jiffies
> >      * @a: time (unsigned long) to compare to jiffies
> >      *
> >      * Return: %true is time a is after jiffies, otherwise %false.
> >      */
> >     #define time_is_after_jiffies(a) time_before(jiffies, a)
> >
> > Or am I missing something?
>
> Doh, scratch my comment.  It's enough confusing about time_after() vs
> time_is_after_jiffies().  Too hot here to review something today :-<
>
> Sorry for the noise!

Haha, no worries, it got me too! (In our internal discussion with
Sergey) I had to look up the definition and think about it for quite a
while to ensure it was really what we needed. ;)

Best,
Tomasz

