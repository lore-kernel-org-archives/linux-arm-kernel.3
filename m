Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A77C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=; b=N1gENrA6LyoFP2v3m8K0gE057w
	oCo4bW2so9xmnDrRJKSPClkqhmLAG1+r/RmcERfGOX1A/4/Ri7FTA6dCmFV+VIgge+c843eAhmaRb
	WPr6HjKTEhdBgsds2T063vKW73wmFrDp1Tzlm20CORmlBDDBn6JVNnvVFUdPdjoyHHlGM/Hh2/a3I
	65PwseqpBbJKyByWaLtpziprjIaLrnFgqVMY2EbtLUBfgDxtC2YSJcybfPPxEx7t2M7ZRECKO6UkP
	JEB7KgqW041D0e2bAAd4sDb4JjvZFO9ThFrKoj6wsXwzORH7dgoKwA/PIzBFrvPX2MSqpmN5l2xQX
	/h68NTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSPP-0000000BGkQ-2FPm;
	Wed, 22 Jul 2026 08:34:31 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSPM-0000000BGiE-0Os6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:34:30 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-81ee6b2da98so62441817b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784709267; cv=none;
        d=google.com; s=arc-20260327;
        b=PGFOh2XO1FR6slqoBLC909//l5x/Npe2r+f1jyWcLh61hDCIX2ms8FiOlMAd+V4+et
         3Vs6G/JMBhuPFysvoOhpLEV2fLtQHX3iXT7cM62aL15oqpd07JBIn9vtiuq10JfKpdAu
         Pxf67ZuEpkwl5ClbCW2Rtu08YDu+qLHveeMO2Bw1Vcp/1uYFmIZ14KQjsBfp3Ufs5Tyx
         n0mSYoHMlj65IyHS/CDVPY7Z4H3JTC6HKdNE7sHX1k/5qrZKRKUtD4hBs/d/T4o3Agqj
         t9RJr2pMZwL0vbc+q7Fd1V3wYpNkcFrT/JwykHllyUBeKplTmri6o+AvU8as7xYmO2wY
         tSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        fh=pMcoJlQuRT41e1jar7qoE3qzZ1YEH5StULql7NbKv5I=;
        b=Zd2NuaaqAGZgfr+F29uGrH3VdrhEty9QZIszTfoJiwVJ8ONkUlTrojQ1jiovJlu2zF
         o/Y7t1JDGcCIWsAd8ZQue+IOz55wbYA4iOEeJX68lfiIepDbgUFStFBhj1Bh8unUpUKq
         f3baZLlJFbTdnT4rsGvOEytZsv3WEwzSX6XuHF3EibYxXLfB2vqwmpItEYBGrkgOjIaf
         uWlPEGf/EwTTlHJhkUR3WDiHE70xYggMtfHCk5Kxn+/OpTgSaWtK50V9+PnHnQvmnouH
         mPYgHRC7UFFyII2gEy2tQk+TP8vsTLoYKG6eOCkveZ5t7vJIT6D9TCeg0Ah255KTQeev
         EQfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784709267; x=1785314067; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        b=Ln4XIcr+YTJjIoG9XQKSJnhhBR0mzrDhDyaCJAJqWubqZHEoN/numh3VjB2dsAtOSe
         CC2ch5F++K1mMrB49qJty5FY7K5xdZdewDNu0/Y74yhf1x4fpMl+Q+iRQx/zujw3nbWX
         2VOHMyegnTgDeTIawnVfXE0MPKEkcTGUiTUOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709267; x=1785314067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        b=Jri9Af+vH+zEB5fVHrIX/w+b4pBsleE3qyAykkc2BbEwXV2vU7qlNoGHWMJIRUsmXO
         qj26E3reptdbKI/G7q86XvezRREvS7l7rAFeglknCIEc2wHWzY7O9vMCQ/AWsS1xV2zY
         c5ubr5B4qZjysowsx3L9YqHlSYPRgvSraxL491nDEm7HVPAV/TtDqWmvE6eFY9ogbqgl
         +Qi/zEnaZ9BVKt64ZEFik/zfsU5JHyJIOPKPQOw/eUqksNSNtYKGjyDdHov3jP/+kLXw
         6vnXqgXKcs4PBggvMIADv6OIWj6dbJl3W9eJ8c0E/A6m2oyU7bD9sC60G0SXwoLLMWLH
         pMTQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQnfwljAB9QRyrTqoOyznDlRV2w4+eYXSPDVTXEZlEx0TDZe7/8i0CGznnI62uBWtznKSEFE/EyTTwK1TwGN1n@lists.infradead.org
X-Gm-Message-State: AOJu0YxJz2emrXFZTrvMcV2NVEQkZ28f8SUmZm32Kl071K/WffimvBIK
	EyVJHQBWRbevChb1CqVGkcB5zJNLC9uN4Zo03gCKgeHW0Duc+QK+t6uaQKUPUoVm9zxxGzkyh5i
	b+/oge8M61HTzULzCojh2wC5QlKJ25N/V3mDoZ5qA
X-Gm-Gg: AR+sD13lnZp77Oievf3dj+Nm5MqfN9aeNCk9rTT5TrsZNcj6LyKdVqapMx9v3Zn6QCV
	kpLtUzP7GNg79S3iOQfygtA2eIQXpe78C2vMca4WuHkpqUDO+GIPnMejUPUWdIoRahlAWVNtOe7
	qDX6gNCNYBjHgz44HfqISsVZALR16tR1y+DlcgZXY2zLl25rkWrIB/p2ok2uWiiMwsc4cs1egZ6
	W/bdBWZXdd+0SS2ByFqB47uvy13xpvWWp4u9ChpCkqd1sxiyxUYVFnE23vwMLojx/2ASE8Xm5MF
	MDoHaEQfXDi7emU2
X-Received: by 2002:a05:690c:c453:b0:81e:bf0e:55da with SMTP id
 00721157ae682-81ef260c885mr66446937b3.48.1784709266701; Wed, 22 Jul 2026
 01:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-7-wenst@chromium.org>
 <al9IwVR7Whw2DiXU@ashevche-desk.local>
In-Reply-To: <al9IwVR7Whw2DiXU@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 16:34:15 +0800
X-Gm-Features: AUfX_myMObbdQM6Uou8RDo9wMrLkt0Z3Ce7LljI10q7k1rjjaXzvygc1Ey8OWtE
Message-ID: <CAGXv+5EkcASZ__Cyp4PnwemPd2xAe+WL-ics9jqHLuxWjWyT7w@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] i2c: of-prober: Defer regulator_disable() on
 successful probe in simple helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_013428_179434_AC334D1E 
X-CRM114-Status: GOOD (  30.94  )
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

On Tue, Jul 21, 2026 at 6:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:20PM +0800, Chen-Yu Tsai wrote:
> > When a I2C component is found, it's device node is immediately enabled.
> > This triggers device creation and driver binding. The prober will hold
> > the regulator enable reference across this part. If the driver probes
> > synchronously, then it happens within this window. On the other hand,
> > if the driver probes asynchronously, there is high chance that it
> > happens after the prober's cleanup function was called, in which case
> > the regulator would have been disabled when the driver's probe function
> > is called. This would then require the driver to wait 100 ms for the
> > hardware to reinitialize, even if the probe function was just a split
> > second late and the regulator was disabled a few milliseconds ago.
> >
> > Recently, some of the drivers for the component that are targeted by th=
e
> > I2C OF component prober gained the ability to skip waiting for hardware
> > initialization if the regulator was left enabled. This happens when the
> > PMIC has them on by default, or if the component prober left them on
> > after probing the component.
> >
> > Wait a bit of time before dropping the enable refcount on our end so
> > that the actual driver has the opportunity to catch and increase the
> > refcount on their end. The 100 ms delay was arbitrarily chosen.
>
> ...
>
> > +     /*
> > +      * Wait a bit of time for async drivers to probe and increase the
> > +      * regulator enable count. This allows the drivers to check and
> > +      * skip waiting for re-initialization.
> > +      */
> > +     if (defer_disable) {
> > +             dev_dbg(dev, "Deferring regulator disable\n");
> > +             msleep(100);
>
> How was this value chosen?

I just chose an arbitrary round value.

If both the prober and the driver for the probed device (trackpad in
this example) are builtin, the time between enabling the node and the
driver asynchronously probing is between 5 ms and 30 ms, but could
also see outliers exceeding 100 ms.

If you're worried the value won't suit every user, I could make it a
parameter of the simple helpers? And the user itself could be made to
probe asynchronously to not block the main code path.


ChenYu

