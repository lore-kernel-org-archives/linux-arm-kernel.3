Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249C8CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMm76zmK3ArrseSrDrnVi5kZ0suPc21HeqCjahf5xGU=; b=bRu8FatxiYbc1730fOF/zWwdEL
	4FY3RK261IWXjiNRMuwiv4Qf5TWVK5CfGUg3YVZGJGlLdHtU0xJjHdzMrFGgbwBwcX2Z6wlwxrvYi
	b2YMARCdJOw5UWS2DgbIQtatRGg7tCPc/P4+oZospFGLDQzbAKRjyHAmqk8C8hhy+RqN6xWcvweKQ
	rVICfyeNBxFG34R77ujqTDwar5cn3Qd6P6/gX/8aV4ojugvxoaS5QQ17yx73h6rkqYwQibL7M47ks
	MrbQjCRFAjKOD+ytTKHc1mEZf59+SSd02UsBhwFayca24SJYMdS2dKfbzY9J2+5He+Y8109azSu/r
	TjfPUuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIKT-0000000AtKs-1YRW;
	Mon, 12 Oct 2026 15:52:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIKR-0000000AtKM-0Ddd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:52:44 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso268022866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791820360; x=1792425160; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMm76zmK3ArrseSrDrnVi5kZ0suPc21HeqCjahf5xGU=;
        b=Uxi+drtKi6wtPDVEVdvjuOJ25P6o2c8Gr7pDuxxQzU+Gdk5rNCYK7Be8j72/gXjkyl
         bvuXFNHdcpmsnD6Fo446QH0yJMkTkOKAU27sLIFg5s9n5HyDqpC0NpZDzuCEg0h+4v8K
         q89Rxj5Q6lw1oXp7VvoK99sapHIx0nZx7PfGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820360; x=1792425160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMm76zmK3ArrseSrDrnVi5kZ0suPc21HeqCjahf5xGU=;
        b=0BTCm/rA33jNVi9HmwNxdpHuGehkvY45s0ahEYSSmNPDb4BmC7RBv+YLu24lXqt7c8
         AOK9c28zzsbfTSi3RPGvEotKnSi6pzG4llT49TGMvjaRrg7syDjFxk5UjIkScwmQ6I9+
         rctSFjURyT+EL3khQu3coJofl/qynlMLI7xs82b0nx0dWuZuB/dwOTDo7fF1rPPZJu/E
         NZ76RN0SqHeb7uGmIz+f7SoAvPsGIK2IXczAvGrD9kozQfZ4vGC0d0N0Wby4fRoNX1s8
         s+/W+p7qdt5nZGL9b2+R48afQFR0MQYTAI5ngzhvcPCQLztmyKg8NnvTIoMJpEfO0xL5
         9Y+A==
X-Gm-Message-State: AFq9FYJ1OtODSvv82FxUk4l5W9I4XpkJiDFcbzE8nQyrD/5UofTymTZD
	J/+ve0K2sN+kyqGNavSl7wdPqyyEe4UhdYUv8bAllgH3YbhVX7Vn5q9acGvoqgmFW37jlBj3D7/
	Yfrph6Q==
X-Gm-Gg: AYBFou2gPn545SFPoyytmxzZ9SOAegbRl1/ayFtTtYA/GMSwwuZt1WD8Y87lJi3+/7l
	oa50PBkiHwiDrgGQv4TC4ZX69N4xgA5GKjuzV13LbLlfmhOFvhBN4SlVWRj39ErxO1VjBJuzwxl
	4UXNoG172KVvXk7QdK5DIyXMxnQo42Xw+Bhn50IDxYGrmO4Ml/+nzDmKrHGhRHyYZehpko9zQAH
	YQzUqwkLKcOIbM5vYib+Ck3wB25Jb98qpLieUliCIEPr71T28xbWVmZluzSSVM1JBk4uArJl7yg
	mslYpkTww2NYACdy9SJOKlwjrVEv7gYzgTrEalNoDPDDB2Uw49/8vMEG4C94WPGxcKBlIUIDM5l
	95m6kGJziBb5BN3kcxa+LxJyk7sY/Nl0TlQ7bReiBNhV3wWE/V2Ikz5xW+TkYmoDX/4Md5XfKCH
	ooumgsPsm0kBPAV+m3KRAflJf39gOfL0BUk/ninDawotDUU4JBkRzeVUpfh4TOXhXtPNGogRFlz
	wCgM73pTgfuTwNUcDDIQTPlmMkYG8jqrwWv2is=
X-Received: by 2002:a17:907:9707:b0:c29:45f6:6a1d with SMTP id a640c23a62f3a-c31aa004f05mr993339266b.43.1791820360348;
        Mon, 12 Oct 2026 08:52:40 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9764cc9sm488040566b.10.2026.10.12.08.52.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:52:37 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dc202a60eso647863f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:52:37 -0700 (PDT)
X-Received: by 2002:a05:6000:60c:b0:48d:df08:307c with SMTP id
 ffacd0b85a97d-48ddf083082mr1731696f8f.44.1791820356342; Mon, 12 Oct 2026
 08:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <9099b92c-d456-4dbf-95c7-dcb3f1004066@web.de>
In-Reply-To: <9099b92c-d456-4dbf-95c7-dcb3f1004066@web.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Oct 2026 08:52:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=kLK=p2xmcjP8mENApKNvtyU2L8OvTW1-EZM5+TMk4w@mail.gmail.com>
X-Gm-Features: AclHuK8lwjKGleC0Qe7nH4WggNgPyU5z0A6glLw0RKkKSL75lGBBduv0_ttODd8
Message-ID: <CAD=FV=U=kLK=p2xmcjP8mENApKNvtyU2L8OvTW1-EZM5+TMk4w@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Brian Norris <briannorris@chromium.org>, Joonwon Kang <joonwonkang@google.com>, 
	Lucas Wei <lucaswei@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_085243_142710_9D3B13E5 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Sat, Oct 10, 2026 at 3:15=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/mailbox/goog-mba.c
> > @@ -0,0 +1,567 @@
> =E2=80=A6
> > +static int goog_mba_send_data(struct mbox_chan *chan, void *msg)
> > +{
> =E2=80=A6
> > +             spin_lock_irqsave(&goog_mbox->lock, flags);
> > +             out_of_space =3D payload_words &&
> > +                            (goog_mbox->outstanding_msgs >=3D
> > +                             goog_mbox->msg_buffer_words / payload_wor=
ds);
> > +             spin_unlock_irqrestore(&goog_mbox->lock, flags);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(spinlock_irqsave)(&goog_mbox->lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.3-rc6/source/include/linux/spinlock.h=
#L642-L645

Sure. Once everything is resolved and I'm ready to send out a v2, I'll
make sure to include that change.

-Doug

