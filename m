Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110B3C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5QDWkO2mZIUqFyZfWARuefSQbIGKebt4uDjmqBxFCM=; b=v/TSECUNquhO/uqaDy9rHuuVax
	SK+yWgXsxTws/Q//WWKxU8wsU1oEZo0dYqOqhWEUB9I00a5fJRkoErsN8iU41tgmO3u7DkwXnbU2Q
	S+Itra9tTUugBvCFr3I3wLRFTqLcXhQb+i+SM3aYvQr8durtivu60fyqTAFSeadwjsVv7bASszGAQ
	UQiF6JM9FtIDSv8XZVZWKq54018XKhEAdNQW2mKGIyy+yyrwroQhNiB3z9lwV5VLp/5ziCxBXlLN0
	Y5SVJ6NOTgHYkHKDdkvthaGNPAb75In0fx2UECc//+wYMXonXhgIM/YEPQB/MRNov454+jO8TXXLz
	5uJZ+yDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnafI-00000006vi3-25sx;
	Thu, 27 Feb 2025 09:58:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaNF-00000006tI3-3Zes
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:40:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f1e8efe84so238177f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740649207; x=1741254007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5QDWkO2mZIUqFyZfWARuefSQbIGKebt4uDjmqBxFCM=;
        b=ivpYjZ2/DxZ+TSKe/KLtHdpwdTqkswLMk5voKjXXT+ucViED5O5kaHiVATm4VwSNF3
         JYeKLGj8EQj0suAhZ5VnV2Y1aVOIAibQWyqcSuUTbbPUPnx6MOPBgEr+7h822Z4i9L0K
         +e2yvrFstJ0fTj/2BTvXspfJUxKh2kqhzfYvIIh000RK8rzD9lqvwZlT7fwUxzx9Z2SJ
         nPvz7W4XEUgLAvyg5oFh4a0q8Ppvr5A2sG/t909qCYFE5hMWEKuYURtMxPTRlVSt1MJP
         7fUT9SWMvqTum30NIj0hXAc+0CVjl6sgxzhihezfAi9LVDICTfb+t9wmkOsftEKWj0cJ
         pURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740649207; x=1741254007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5QDWkO2mZIUqFyZfWARuefSQbIGKebt4uDjmqBxFCM=;
        b=Af5Hye6kOl3+ChI3sJ8SXRm7V+8SZKogyXBRUmNNvBOn7ysO+H4jmCrDMZAr0AUdOx
         CNyeMfe1izphPGgE0fuTUvpAuAJEOoj3+XxRaEX5oLuGO56mLOhyPdFe6/AXagAkqrHt
         AUFmcCXRhIBZKMGmcxbnHEwM+Lj6HtdKLzWGk8R9sM5TgzXfrl0uix85r8fkSEQrhcHP
         LYqeFcJbsgPLOFEu7W4+gATVerR2j5r6HMaqMmocdU0+LdTz9bMgII3gA7URoOZ4PQu0
         b/Wuw656eZvJijy3h0CqMK8jmUQtPznJHBMo8/1v5O1qVAYXDuIU3CSXcJUCDxnEKbqZ
         l9iA==
X-Forwarded-Encrypted: i=1; AJvYcCWs6hjxMLOEQB0Q21hHRrDn1vCA5ldGwO7AFVbAUD3jLO/PLCVWkL9G81PaoOOahNdoFfESjsEb0k7nfel/ORwi@lists.infradead.org
X-Gm-Message-State: AOJu0YxLsMUg9CUBrIuTLvh8mvaN4EpwrgyBchUAqRem0mzLcVuLBPR3
	4GqUd/0c0/2DumOn8semaphabpWUaLYyR6nu6XS29vnqfTv68WavOgI/85/Pn0NTqLk0ZLNE2kx
	az8uU/9yGEM4tiTp1NJcJU7Ydm/M=
X-Gm-Gg: ASbGnctpkHHahFtKOiPjKvRGKT9H50ksn5NxMQMRecMVagXC7tqVoYV/wbVQs3ApPiE
	GkpEG+x4egwL1gt0tgHX3FVuBnB0Z1/roXjzQjVXAg2ubbhRjRanRR9TiGdFn6tfk8z777KfeOK
	tyGGvPwjqg
X-Google-Smtp-Source: AGHT+IHVxpKqJjF6Oy3UiSsoNMUk3O6YtCQmwyuh/+RElalPL6ZKmZpdr7GUuDOpP7wb1pIYfzRVat/b4jfY+6rXg4Q=
X-Received: by 2002:adf:ed4c:0:b0:38f:476f:e176 with SMTP id
 ffacd0b85a97d-38f6ec63868mr17667271f8f.31.1740649207536; Thu, 27 Feb 2025
 01:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20250225143638.1989755-1-regis.dargent@gmail.com>
 <20250225143638.1989755-2-regis.dargent@gmail.com> <2547277e-d9c0-4138-abaa-7afbff1ba3ca@roeck-us.net>
In-Reply-To: <2547277e-d9c0-4138-abaa-7afbff1ba3ca@roeck-us.net>
From: =?UTF-8?Q?R=C3=A9gis_DARGENT?= <regis.dargent@gmail.com>
Date: Thu, 27 Feb 2025 10:39:56 +0100
X-Gm-Features: AQ5f1JrSA6DaEhL-Nslpn5PJiSZvOfwBqv4VOqRh3wNZ-79IdfFHdRc-00phYLw
Message-ID: <CANarb_ci_vgBMU4XejMwOwxKjGVccfMuweUQA7JwbNzWZqotuw@mail.gmail.com>
Subject: Re: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled
 after probe
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_014009_895863_ABBFD0DD 
X-CRM114-Status: GOOD (  27.20  )
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

Le mar. 25 f=C3=A9vr. 2025 =C3=A0 22:51, Guenter Roeck <linux@roeck-us.net>=
 a =C3=A9crit :
>
> On 2/25/25 06:36, Regis Dargent wrote:
> > If the watchdog is already running during probe, let it run on, read it=
s
> > configured timeout, and set its status so that it is correctly handled =
by the
> > kernel.
> >
> > Signed-off-by: Regis Dargent <regis.dargent@gmail.com>
> >
> > --
> >
> > Changelog v1..v2:
> > - add sunxi_wdt_read_timeout function
> > - add signed-off-by tag
> >
> > Changelog v2..v3:
> > - WDIOF_SETTIMEOUT was set twice, and other code cleanup
> > ---
> >   drivers/watchdog/sunxi_wdt.c | 45 ++++++++++++++++++++++++++++++++++-=
-
> >   1 file changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.=
c
> > index b85354a99582..d509dbcb77ce 100644
> > --- a/drivers/watchdog/sunxi_wdt.c
> > +++ b/drivers/watchdog/sunxi_wdt.c
> > @@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_de=
vice *wdt_dev,
> >               timeout++;
> >
> >       sunxi_wdt->wdt_dev.timeout =3D timeout;
> > +     sunxi_wdt->wdt_dev.max_hw_heartbeat_ms =3D 0;
> >
> >       reg =3D readl(wdt_base + regs->wdt_mode);
> >       reg &=3D ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
> > @@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_d=
evice *wdt_dev,
> >       return 0;
> >   }
> >
> > +static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
> > +{
> > +     struct sunxi_wdt_dev *sunxi_wdt =3D watchdog_get_drvdata(wdt_dev)=
;
> > +     void __iomem *wdt_base =3D sunxi_wdt->wdt_base;
> > +     const struct sunxi_wdt_reg *regs =3D sunxi_wdt->wdt_regs;
> > +     int i;
> > +     u32 reg;
> > +
> > +     reg =3D readl(wdt_base + regs->wdt_mode);
> > +     reg >>=3D regs->wdt_timeout_shift;
> > +     reg &=3D WDT_TIMEOUT_MASK;
> > +
> > +     /* Start at 0 which actually means 0.5s */
> > +     for (i =3D 0; (i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] !=3D r=
eg); i++)
>
> Unnecessary (). On top of that, its complexity is unnecessary.
> The timeout in seconds, except for reg =3D=3D 0, is wdt_timeout_map[reg],
> with values of 0x0c..0x0f undefined. Worse, the above code can access
> beyond the size of wdt_timeout_map[] if reg >=3D 0x0c.

Ok, I prefer parenthesis for (my) readability, but I will remove them.

wdt_timeout_map is not linear, so timeout in seconds is i when
wdt_timeout_map[i] =3D=3D reg, some values of i not corresponding to any
reg value.
reg values of 0x0c and more will end with a timeout of 16s
(i =3D=3D WDT_MAX_TIMEOUT) which will lead to unknown behaviour only
because these values are marked "reserved" in the HW timer documentation.

> > +             ;
> > +     if (i =3D=3D 0) {
> > +             wdt_dev->timeout =3D 1;
> > +             wdt_dev->max_hw_heartbeat_ms =3D 500;
>
> This is an unacceptable API abuse. max_hw_heartbeat_ms, if set,
> should be 16000, not 500. You could set the timeout to 1 second instead.

sorry about that, my comprehension of the documentation on
min/max_hw_heartbeat_ms suggested that they define the time window during
which the HW timer must receive a heartbeat or it will reset.
0-'timeout' defines the time window for the userspace point of view,
meaning that if 'timeout' > max_hw_heartbeat_ms, extra heartbeats must be
sent to HW timer so that the reset can occur only after 'timeout' seconds.

Just to be clear, setting max_hw_heartbeat_ms to the maximum HW possible
value (here 16000ms) means that one cannot use sub-second HW timer values,
while all the watchdog API actually handles them well enough (my tests on
the 500ms HW timer worked good).

For this sunxi driver case, this implies that instead of just reading the
current timeout value from the HW timer (if it was enabled before the
kernel start), I also have to reconfigure the HW timer (to 1sec) if its
timeout is less than a second (the 0 register value).

> Guenter
>

