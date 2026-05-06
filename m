Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A64CCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJMOv/O1aBiuZmzmoKoUVmuRuzbELseC26dfufZxuYY=; b=Rkbty/LqLZl858bgIFlVAbTMqe
	KpBv8gbu/8jXNI31kivR+yWJULjWfFMJkL+Z9XJWTLY20NDOsiI+5K8WtcXqf1HC/YYWDJWey/Dsr
	FD5zBfdEqNtgE//TIMCdlPXOgaxTPcFVTuTcAwHz2nBhEfOXgsKjQ4SpaclTfv3duH/CLYu1OqGD/
	KobjMlrYJzWe6tLjRvMs83TA9WX+UhDIdRfZyBV29EPgP4X1XLtN2LjW3rl3URIxTo5qjJ6f+kP7o
	VpRTCv2Lmo56M4hI3prARFmAsiv3DAysq8VaNkj3HI0MICflf7sTdWsfZGlaN28zqO9CF3yvE0Pr/
	x676ftjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeu4-00000001TSD-2MKS;
	Wed, 06 May 2026 16:15:16 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeu3-00000001TPa-1WEV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 16:15:15 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-6530287803cso6877499d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 09:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778084113; cv=none;
        d=google.com; s=arc-20240605;
        b=MJ1cEhDritwv/PgprCru1ZOFpnD/4o2ra1fuxsh3x4TWEwF5duW/OuMgahRQUJLaBC
         ElXA3CtwaY+bg4RsBipkpKnRIo3tY+mee9eb8Kyjda6voxH/hy2VEHO8k94XergWN10Q
         g3NZ3FqwUp5HZJhwcXB3Jd2Y/hnlVj80DSHOzj46UXZqk+46YtBCRzrE+WBE9m1+En9/
         j1/njANbDh40B55S6BbTHyUxuMjVbwOKYf64FCF+vXjox5seTCCRLJ+wUq1QZ+I38ElQ
         iiZAqYiCc9s7ytkpef3n3nY1GGYYDvKMjzczwPH8s5ocNWyg70xw8evYghaxJ3JX0Yqa
         GsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJMOv/O1aBiuZmzmoKoUVmuRuzbELseC26dfufZxuYY=;
        fh=qlwXurcfnMmXELSfZfqM1Ewr2Fh7k/9/RyXPUV88Lns=;
        b=ei7ZO2gC7PeBFWJ+DPMuP1y3my1udMuUhg+vW0Jjrs/TguG9kbmJFWASpetdxpXzPS
         g9C/ZczBtPvV2Oq7vuL5kHMLzBGFYz2cJmSPFpJuLTGkzvp5FqaoKYzWs1R4L92JJLKT
         WDK4se6HCKfIyaVbndkthe+IJgLMUMrm50V0IkuiHUEToSMDhTtsK712NXMyr7fWAwx9
         oTyKrIX2wWnjv+3+nB+JZObNTJuDEFgic0IdkOEewLJeLExT1avzJwOT3qpwC/AkJLLD
         Or+ijGHwlW/X1Cnfym1VzuTJ41PDsB78o0mTVSX7+MKis51m3Xupnt2s0CWep53kpnx1
         aqhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778084113; x=1778688913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJMOv/O1aBiuZmzmoKoUVmuRuzbELseC26dfufZxuYY=;
        b=Xm+3lrf5/D/O1BBI/3rtE/8pBAzJdXVVBiyckoYH0F0rcp68lYfkn8ymttW/3sUK9Z
         CohzL2e9dbXTwrsA2tmslt/aI9rDUuXuoak/8mWSEERl8gpmwPdpUhXhIQUkkaZ79Ckw
         pYvgAXICk+EGXvcUARts4eAYJZK/PM4N1gYnqDdQdi6pkwGRjmfTPgsaEzJ1lv7zbOMV
         jm5VnAht32WJ2MdcTfbF7gJf2/76zQ3LO03nzG9v38MSfT+GP+HoxtPVMBBl4lnloS5R
         lCFydWUSkjO6vJ2XWrFc/PDM7H8D5FMwLQ/AYlBVeP7aZOwfnaKO80P4W+QXU4lO6Gi0
         cmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778084113; x=1778688913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJMOv/O1aBiuZmzmoKoUVmuRuzbELseC26dfufZxuYY=;
        b=rBRcGWdG+LqR7SaB5rn7+x5E1IEEUDWYKkIIKCIGQIU2XDihfKhqGOhmXZXiLB9kaT
         ULMhiBfU2dvVWhNoCHUTFDuVkDp6BAloDzuqQhjEgK8Omd9Ig8IDzfv1j7rNRnHbOrzp
         kdhKfpiW8wrMbtJP3GZPhDqZw048A8OJ/FpcCd1N1BbV58iofvB10jEJwZ7JW9D7zBuW
         Lne4LwMcMsj4IniT1jr1Y3YpEN3E3URPh7nzxcuyC8aFPvZW5ue3v/QsV2gqzSaCkQFj
         cDFCgRSBMKGcVWoOfl0AbkN73ER/LTUJ/umuFfVVZutKSYWqgbt3fz2B4E0UMgVBI3ZO
         mO6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/C6DSx0VLTFfZxaj8IIdBl7xkzTvW5tFRKlUV4xIchRCYDQ1q3aLHjxyAso8ybz3+AluUA37psqjO5dCqVnu0T@lists.infradead.org
X-Gm-Message-State: AOJu0YwTz0xdpn+IZa5yp9/1FRDWFxwADzWjiKrFB3ZKrEg8EOsaK9w6
	/ROQZ0R6zfN01z+kha2IWLxXipClLJsO2kZaeCD58+rvNJB0LfyPTfqOsgc53Q6h4X+VxrNJ383
	PmCkNiLam6eUz0BLhCFTFRHpc3LLHbMA=
X-Gm-Gg: AeBDiesE3PGhUBLgnmSQyOhUy6Az5RozdO3qDUNrDndHRdGgwAFBwrIhmgnZL9nI8jv
	b74LJ2qqI+6JmmgEJnoOXStWK8sSQW7j0cIpSjWciVH/9VIP43HUxbkEZV9DhUpEcBrxT7IGNXn
	1sNrKaLzkOIbVv2TdyOkYqvgqT/xqCu3G1S2L36FoFchY/sl4GGB8kQiweA9/NsW7GfZEBDcJyE
	42q2q/Ryp2T/vyfkt3ZS1rq73O8Ak0f/D7oQXDkqG1WVqATjqJ7bvw9aTKg1aQdt/6l6xq8OzkB
	rRrKRpVgmHY8h2T+aDV3
X-Received: by 2002:a05:690e:68d:b0:65c:4a30:305f with SMTP id
 956f58d0204a3-65c799d739amr3244253d50.51.1778084112913; Wed, 06 May 2026
 09:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260504214613.121283-1-m32285159@gmail.com> <20260506165112.4425c378@jic23-huawei>
In-Reply-To: <20260506165112.4425c378@jic23-huawei>
From: Maxwell Doose <m32285159@gmail.com>
Date: Wed, 6 May 2026 11:15:01 -0500
X-Gm-Features: AVHnY4IuSavlIV275gr_U5thFF__q-qs11Ev6DJHLLnKSIdfl8ffZ-u6PNefrPM
Message-ID: <CAKqfh0EMM3n=jZX4f1xJ4Ks+xg4CvSw_1FF13cFbSiCMLh0eVg@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: xilinx-ams: Replace spin_lock() and unlock()
 calls with guard(spinlock*)()
To: Jonathan Cameron <jic23@kernel.org>
Cc: salih.erim@amd.com, conall.ogriofa@amd.com, michal.simek@amd.com, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, "open list:XILINX AMS DRIVER" <linux-iio@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091515_406241_BBB8E0BB 
X-CRM114-Status: GOOD (  17.76  )
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

On Wed, May 6, 2026 at 10:51=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Mon,  4 May 2026 16:46:12 -0500
> Maxwell Doose <m32285159@gmail.com> wrote:
>
> > Include linux/cleanup.h to take advantage of RAII macros.
> >
> > Replace spin_lock() and unlock() calls with their RAII macro
> > counterparts. This will help modernize the code and increase readabilit=
y.
> >
> > Remove "flags" variables where spin_lock_irqsave() has been replaced
> > with guard(spinlock_irqsave)()
> >
> > Signed-off-by: Maxwell Doose <m32285159@gmail.com>
>
> Hi Maxwell
>
> One thing inline.
>
> Thanks,
>
> Jonathan
>
> >  static void ams_enable_channel_sequence(struct iio_dev *indio_dev)
> > @@ -1060,9 +1058,8 @@ static void ams_unmask_worker(struct work_struct =
*work)
> >  {
> >       struct ams *ams =3D container_of(work, struct ams, ams_unmask_wor=
k.work);
> >
> > -     spin_lock_irq(&ams->intr_lock);
> > +     guard(spinlock_irq)(&ams->intr_lock);
>
> This increases the scope to include scheduling delayed work. Seems unwise
> in general and should definitely be mentioned in the commit message.
> Use a scoped_guard() here probably or leave it alone.
>

Will add tonight.

best regards,
max



> >       ams_unmask(ams);
> > -     spin_unlock_irq(&ams->intr_lock);
> >
> >       /* If still pending some alarm re-trigger the timer */
> >       if (ams->current_masked_alarm)
>
>

