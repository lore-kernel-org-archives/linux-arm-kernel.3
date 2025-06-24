Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E48C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qt1G4xdHuGWkr7FJJKwWLSBjfU2TU/J1+xFmV3PeoE=; b=4sYvX3IKS304TQm83X9rJNos3K
	CVwR07/E4HnUiZwC2qmh4A4xFhcERI7LunsYV5iiDq1ngM7fdeEoEjxbAyaxiNoMUeAfjZ3OeQLmB
	WNoobfHsZDmrlivUoCwUTmUvh/u1YbTp0vR607dUMXLRBOW8zCPHZNFidFaN1ewtKo/FWRd8o83RR
	xfcbREUU1LC4Dmr1fWAoFyYTm5lQvcbczjuAN2dmlxkIJJr39BtLeOQlxeKqHktTg/EKAKnqw0JLR
	XNBZHYB203dOlFezsR/U0ZPZ8ZJ80iM57L9fdxusJooM9/U8JjF/vCOGnTsb7oJ0nOf9enbaiMx42
	K8JPtPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1gI-00000005Pon-1rpJ;
	Tue, 24 Jun 2025 11:19:14 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0x2-00000005Jao-3bnK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:32:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-748da522e79so2648799b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750761145; x=1751365945; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qt1G4xdHuGWkr7FJJKwWLSBjfU2TU/J1+xFmV3PeoE=;
        b=bOeTYDJpjU0UAyX8MOTViAj0mEAwxBwCKbyHPuzXQ9WN7TxMkMVQBUlIukBSdE0oGC
         Msfhn/UKeKylgTfaKlrli34E33QpUsyMggEMuzf6TP1p/ntYgcbhI9IzqerXx1huIJ2y
         jg9ivf0eb0VyMub8WT82nA3pJDxbiR3Kh8am2ommqfXasyUdTJLBHUec9aoIEch8QLZC
         Vx8buAlP5hAhxu9Bps/ddc01MJ6kyqppDoP18pujlw4LVwW1jsRbxOaZtF0BXB0B5BNd
         LzbtT0C+p+HfuIqUijhWWYXpcfpTTFGXz/sOnPc89NIgqp7x3LBb+/8SfFLLTSb2PYBG
         0zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761145; x=1751365945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qt1G4xdHuGWkr7FJJKwWLSBjfU2TU/J1+xFmV3PeoE=;
        b=QGx8OHXkvKLy+tJVjYoIAUy8M+HmK5+ZFPSbmEFrUeKCs+2fI5xRewNEU5FZNRxTtp
         UkLToS7vm0xuTNbg8ETTsCiWvOCE/TuUQhbzKL8oOxxp4XqBQRdd+i470q/ZYB8TInPH
         v+Jj5qy8dGyaNqoFBSxXn0v9VQd/ezR1LV+apDwujXMP8C/Ez4kMxzV1fnPfcHV5Eb3u
         CWH/LfR5V2foTLixHarChBJkG393qW9uHWmitbX2q6QWtJLQx2K9bLQXsX8HM9HEkmOJ
         iFYF6yahMgtD18tV/eRWHNnOX4vdCCmrgoCBjQoEtmxYSRPrVPbZZ1ocMW2qvh3XH1hj
         Amsg==
X-Forwarded-Encrypted: i=1; AJvYcCXjg2HNGQJZGwn01Ro9czsF+eWZdSU5R3qinnY57OvFxLSqtZP39oyFS0MNDB5Vwg5vjtFexiuOdz2xNeg5n3Wa@lists.infradead.org
X-Gm-Message-State: AOJu0Yy10huxRYnrEpMLRcUiwQx6QoYoL0M4rncXA44H4NsUXKZoe6qD
	7V31yA/l1A5HFXB0W2jmOGlWMc5CisQwkT86F5Q3oPWbpqoeFSFvXKiWogDDD2myAT1uw+TGDyQ
	SCHKXRWzwRWKNtbFvQssMARtDbuaubWopKvQSmA/edw==
X-Gm-Gg: ASbGncswqLRpd0Uadre7SOzyCEl2E5X8f7MjsgMruIj1oy7x14U+JgZL39/G0vHNUWE
	pIdWW/qdElExc7kmifcFla2mLHvdYEpNL6G3UCT3BkeWNxDoPsEB9I13CvhLX2+ODbyEJRcflKs
	ilU0GmM2UNIS4pKJkG/z/ct7XsGd7AUWeR4sNSwNwRL1mArSr75nj4F9jcqMw0ZmKU7iY=
X-Google-Smtp-Source: AGHT+IH4g1PvpyLx7WVlvE2Rf2SzPuo0lTBgVHeaA3gkX79aw74S2PH91wSbnem7obavXSVF9XsoiTDpbAuofP1c8K8=
X-Received: by 2002:a05:6a20:9144:b0:1f5:7f56:a649 with SMTP id
 adf61e73a8af0-22026e92ae5mr23934878637.13.1750761145008; Tue, 24 Jun 2025
 03:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com> <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
In-Reply-To: <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Tue, 24 Jun 2025 18:32:14 +0800
X-Gm-Features: AX0GCFsx2E4YDWQnsy0elvsMGQiKKzms4nqUpfwtdkeIHeCrPd6S9MlAaN8RRsQ
Message-ID: <CA+J-oUvm-3G9GRCzjOd+j8K6iNs1piCFAKBNfwih49iFwiB4pA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] i2c: aspeed: change debug level in irq handler
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andi Shyti <andi.shyti@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_033228_925188_A717976F 
X-CRM114-Status: GOOD (  34.56  )
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

Hi Paul;

Thanks for your reply and sorry for the late reply, I was trying to
figure out why this log occurred,
 it's quite hard to reproduce.

I traced all the master and slave states, and eventually found that
the behavior matches
the description in commit b4cc1cbba519. The issue has already been
fixed in that commit
 it was caused by a state machine bug that led to the interrupt not
being handled correctly.

see: https://github.com/torvalds/linux/commit/b4cc1cbba519

(The state transitions between the master and slave here rely on interrupts=
.
 When the signal waveform is incomplete (such as during power off/on),
it may cause state errors or brief unresponsiveness, resulting in some
log prints.)

On Thu, Jun 19, 2025 at 7:18=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Jian,
>
>
> Thank you for the patch.
>
> Am 18.06.25 um 12:21 schrieb Jian Zhang:
> > In interrupt context, using dev_err() can potentially cause latency
> > or affect system responsiveness due to printing to console.
> >
> > In our scenario, under certain conditions, i2c1 repeatedly printed
> > "irq handled !=3D irq. expected ..." around 20 times within 1 second.
>
> Any idea, why you hit this error at all?
>
> > Each dev_err() log introduced approximately 10ms of blocking time,
> > which delayed the handling of other interrupts =E2=80=94 for example, i=
2c2.
> >
> > At the time, i2c2 was performing a PMBus firmware upgrade. The
> > target device on i2c2 was time-sensitive, and the upgrade protocol
> > was non-retryable. As a result, the delay caused by frequent error
> > logging led to a timeout and ultimately a failed firmware upgrade.
> >
> > Frequent error printing in interrupt context can be dangerous,
> > as it introduces latency and interferes with time-critical tasks.
> > This patch changes the log level from dev_err() to dev_dbg() to
> > reduce potential impact.
>
> Thank you for the patch and the problem description. Hiding an error
> condition behind debug level is also not good, as administrators might
> miss hardware issues. I do not have a solution. Is there something
> similar to WARN_ONCE? Maybe the level should be a warning instead of
> error, because the system is often able to cope with this?
Yeah, I'm a bit unsure as well. Maybe I can use dev_err_ratelimited()?

>
> The code is from 2017, so should be well tested actually, shouldn=E2=80=
=99t it?
>
> > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> > ---
> >   drivers/i2c/busses/i2c-aspeed.c | 18 +++++++++---------
> >   1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-a=
speed.c
> > index 1550d3d552ae..38e23c826f39 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -317,7 +317,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
> >       switch (bus->slave_state) {
> >       case ASPEED_I2C_SLAVE_READ_REQUESTED:
> >               if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
> > -                     dev_err(bus->dev, "Unexpected ACK on read request=
.\n");
> > +                     dev_dbg(bus->dev, "Unexpected ACK on read request=
.\n");
> >               bus->slave_state =3D ASPEED_I2C_SLAVE_READ_PROCESSED;
> >               i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
> >               writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
> > @@ -325,7 +325,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
> >               break;
> >       case ASPEED_I2C_SLAVE_READ_PROCESSED:
> >               if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> > -                     dev_err(bus->dev,
> > +                     dev_dbg(bus->dev,
> >                               "Expected ACK after processed read.\n");
> >                       break;
> >               }
> > @@ -354,7 +354,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
> >               /* Slave was just started. Waiting for the next event. */=
;
> >               break;
> >       default:
> > -             dev_err(bus->dev, "unknown slave_state: %d\n",
> > +             dev_dbg(bus->dev, "unknown slave_state: %d\n",
> >                       bus->slave_state);
> >               bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
> >               break;
> > @@ -459,7 +459,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >
> >       /* We are in an invalid state; reset bus to a known state. */
> >       if (!bus->msgs) {
> > -             dev_err(bus->dev, "bus in unknown state. irq_status: 0x%x=
\n",
> > +             dev_dbg(bus->dev, "bus in unknown state. irq_status: 0x%x=
\n",
> >                       irq_status);
> >               bus->cmd_err =3D -EIO;
> >               if (bus->master_state !=3D ASPEED_I2C_MASTER_STOP &&
> > @@ -523,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >                       irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
> >                       goto error_and_stop;
> >               } else if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_AC=
K))) {
> > -                     dev_err(bus->dev, "slave failed to ACK TX\n");
> > +                     dev_dbg(bus->dev, "slave failed to ACK TX\n");
> >                       goto error_and_stop;
> >               }
> >               irq_handled |=3D ASPEED_I2CD_INTR_TX_ACK;
> > @@ -546,7 +546,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >               fallthrough;
> >       case ASPEED_I2C_MASTER_RX:
> >               if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
> > -                     dev_err(bus->dev, "master failed to RX\n");
> > +                     dev_dbg(bus->dev, "master failed to RX\n");
> >                       goto error_and_stop;
> >               }
> >               irq_handled |=3D ASPEED_I2CD_INTR_RX_DONE;
> > @@ -577,7 +577,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >               goto out_no_complete;
> >       case ASPEED_I2C_MASTER_STOP:
> >               if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP)=
)) {
> > -                     dev_err(bus->dev,
> > +                     dev_dbg(bus->dev,
> >                               "master failed to STOP. irq_status:0x%x\n=
",
> >                               irq_status);
> >                       bus->cmd_err =3D -EIO;
> > @@ -589,7 +589,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >               bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> >               goto out_complete;
> >       case ASPEED_I2C_MASTER_INACTIVE:
> > -             dev_err(bus->dev,
> > +             dev_dbg(bus->dev,
> >                       "master received interrupt 0x%08x, but is inactiv=
e\n",
> >                       irq_status);
> >               bus->cmd_err =3D -EIO;
> > @@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void=
 *dev_id)
> >
> >       irq_remaining &=3D ~irq_handled;
> >       if (irq_remaining)
> > -             dev_err(bus->dev,
> > +             dev_dbg(bus->dev,
> >                       "irq handled !=3D irq. expected 0x%08x, but was 0=
x%08x\n",
> >                       irq_received, irq_handled);
> >
>
>
> Kind regards,
>
> Paul

Jian.

