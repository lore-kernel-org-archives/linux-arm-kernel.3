Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D76EF48C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 03:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9rVs9tfdzKqfLiEuYfz6qxedHCDF85xV49xx0uKo3k=; b=3jeZ1yVNrZjW7e72/tz9pVVKl3
	utOeGzCxhAr1Io3PIp7bBh6km1jeB54/AySeRLeRZjc1ILIDmOfPpfFWlPvg+tsUmPhZCvZ4VW6yD
	J1WKXeujg6pM3AQjQy15RA8NIYXzIAkEC9KnL28CbLISHxNeRlXA4p49s15KFbZx7+N4+rnc+f9Rx
	VCaZde/eFChEzfeOwYDEPJedBeRzlirgP/mlIAIuX+azejiupwohZnyh/+opgzEcOjP834iyc7U0d
	cTqZ1nRJPOo2fSE2fLSwM/7m4Map29QOwIxH8vkF0T4cWrYca0hnkyRW1L6c9IVuQ35eTBYFqhJXH
	pavv+T0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjfZ-00000002tmp-3Otd;
	Fri, 13 Feb 2026 03:16:37 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjfV-00000002tmQ-4BFv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 03:16:35 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1270adc5121so876276c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 19:16:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770952592; cv=none;
        d=google.com; s=arc-20240605;
        b=LWWzNwzzP6gaimpkfh5U++23hIJYxTJ8AoiWVOq9/tBC5e2Z4zn13laqKI5rsCpbqI
         xHnph5ZC78Q0z84O0cZ/cfrCwWsrKZruc6vIH6l6qRN2PaWRo2t011kK/IAniKIU/Ghd
         4Xv0gwMmb2JPPGF1hLI3ky/cp/1DTsMYXL5jZstgohllq0VXoWLC6BJLohjQyblX/+m0
         jxNw8Lp7fbsIg9aMzviSmsLz+xEEgw2fye0adSA84TaM3BV/vRbZNwPH5QB/LBd6qytI
         +Odwq9vYORMd8Ew5NGxDc0HyQwPLcLqPDQ6vgtVkdEoPoF59fyoRA+8DukN1fcekbrRx
         YyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A9rVs9tfdzKqfLiEuYfz6qxedHCDF85xV49xx0uKo3k=;
        fh=q2yz83z149l4fh+ysgsCAt1mbw8oxarR0der+bipRns=;
        b=i/Fp0CwbUiE+RmM6m9HSi4qxFcfBPrpidxWNoKxR5XDTSA8SMejfMvMvGp1C+vK/EA
         /b903adBv+yDiwrHLbQzjyiDKY0ywR2Ha74GNlGuJvtMi2PWsXXYbriGM4vYFefV2Hgs
         3psb516TmAUm0xOfn4IHe5YfwFPvhW7+7eVJV79TajBu1JZq3jQEsxXWrHYu9xqo2lok
         lMj7v97S7aWetfrM0WIvcMr9xhXOgbwc1mHpS+37rUNYKUokdW7DkrrbHbyBHkKIilyR
         p7CbcKSbhgEinfLnHKZOCKvTqf/J5Dx3cUKJeTzizqKvEnYJAhglMbkixvMgMv15bHAE
         CUXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770952592; x=1771557392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9rVs9tfdzKqfLiEuYfz6qxedHCDF85xV49xx0uKo3k=;
        b=ee2qvrqr5DPE3tvQyOv8gOjWEfVFAlFE6/N8zuQ/gmZSJahIcTUiRXEmdaUQ0CCSLh
         n7PsqsW86Pgr8YSb93W2hIkt3O+SzBpltYOYQTwqJp4AiHvLrDBp4DvrR2hLSdECLBGe
         ckNIh3UbJ1yj/EU7Ag216liA9ORtMIXPQWmbQFdOEcf4Jio6qw+Ubzn6F7YsfIbShgYB
         XE6Bx1hFGVcewlYdc6yxD2B3JwLzwDJExhYepIROgvGoIZgT3nA9WiAINCPta1dPmLBi
         m7J6NWfDe1xDd5nzlFOIuiYNN9HFgtG1nACbOvExH6ZiqMm5Yp7ZdDBZRzl+bOJmJzqn
         BtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770952592; x=1771557392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A9rVs9tfdzKqfLiEuYfz6qxedHCDF85xV49xx0uKo3k=;
        b=l0n3sMjGtZZ1TSAh/wT25UT98b8umC6mm6dPxlTkGuI3EMo7mgFTbn4GK+/Xh6g/lE
         v+9xYNsIIgifqq6nCicHrbO4+ohiNrqXUIu0DEs6NWIbpBzeDBtsoi1zwm4rjwQNcxZi
         P2Jh7lGaBuTc2nALJa/uQ7jPBzRJYP1hAY4Qhlo27ghB0jPaDZHbJgteamL7JtRg2tqv
         vWnUbBi7exQmBzcQs0hKEaE2IxSatbGPqhxr46Zp8i9F9U1g6bHYbym6IuU/oa23EhES
         6QTsbHexK93frtODvEkTiDichAXmpIGF/yFgGpaSDt2mOJ8mDuP1A0Zly3btjzNcv1ES
         vbUw==
X-Forwarded-Encrypted: i=1; AJvYcCWoWYXUWOqXw4aOaiXAP4KBJCTVfCgp1zpkrJoOKBXrtN4T44yNPhc9rS0Y9jCWvIXrT4KH9F9/rK2ouOYL87q7@lists.infradead.org
X-Gm-Message-State: AOJu0YzSMOB7dTUTuDo6taOJ++CTWiiyyfoOTZ+UZ6yhC9wj01QBQRzC
	3d04dWRpPqC0/mGr9FE+pr5TOroK9T7pcIriEfZqkkJj4tD9//Oy2UJcLodypKxAc7BcsLSEjpI
	GsuOlqk/QFpukGQ9rqmYcVcz9j4Mzus4=
X-Gm-Gg: AZuq6aJIA4WufHv6t91HgXYHHNAG2d2RNwVfkdBnrAj5oZXtW8MfHHkqYo7FaZVXhFw
	Sdn46DqI8j5FD9BnZtJy82JJHs3QrIsypac31U5WTEanqp0dgMYLQDWj8c4E2h6IZERSCzqjmDe
	w0lFosX55+3gQWSW2Radai0mvqtpvi7gFBZFIy+O5TS6koVO1IF6vX4l3K/JgOGPJKDSHkOms8k
	8DVI8WEfImKpnZX3OtRh6sE8Nt4oeHMUPLn5rH+npiUhTOTJDdvBCIHl1U2hZDuHMzsrPKVZe/Y
	u8CZLtgMCKI3x3+w4r8HVh/Ki5iuD+U6Gn2Z0Z5f+FSRNvqtjSlWtuP/73g3h5NO8PDxxTFwp50
	TG1NyrPzc2BYIQJIKonlqSR2N1I0=
X-Received: by 2002:a05:7022:a91:b0:119:e56b:98ba with SMTP id
 a92af1059eb24-1273ae7fc16mr135317c88.33.1770952592138; Thu, 12 Feb 2026
 19:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
 <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com> <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
 <20260212174718.7daccb70@kemnade.info> <719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
 <20260212231907.6120a2e2@kemnade.info>
In-Reply-To: <20260212231907.6120a2e2@kemnade.info>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 12 Feb 2026 21:16:05 -0600
X-Gm-Features: AZwV_Qh971-afroyUXRtMyj8ruGTY0KPplbW-K5wj0BVh1d4xjPlxLEG3ejv_GE
Message-ID: <CAOCHtYicmeSzH5Q2_qTwAZw3s+__JRwUrXvz01+KCsJJHAznUw@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
To: Andreas Kemnade <andreas@kemnade.info>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, "Kory Maincent (TI)" <kory.maincent@bootlin.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Louis Chauvet <louis.chauvet@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_191634_045065_527AF4B4 
X-CRM114-Status: GOOD (  27.78  )
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

On Thu, Feb 12, 2026 at 4:19=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Thu, 12 Feb 2026 17:55:43 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>
> > > Am 12.02.2026 um 17:47 schrieb Andreas Kemnade <andreas@kemnade.info>=
:
> > >
> > > On Thu, 12 Feb 2026 16:49:43 +0100
> > > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> > >
> > >>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI) <kory.maincent@bo=
otlin.com>:
> > >>>
> > >>> Allow overlays to be applied to any DTB. This adds around ~40% to t=
he
> > >>> total size of the DTB files on average.
> > >>
> > >> Is this unconditionally enabled or can it be turned off by some CONF=
IG? We have
> > >> our own defconfig so I would not worry if if is enabled in omap2plus=
_defconfig
> > >> and disabled in ours.
> > >>
> > >> We have several devices where the boot loader can't handle overlays =
(never touch
> > >> a working boot-loader :) So this seems to only contribute to build a=
nd load time
> > >> without benefit.
> > >>
> > > As long as you do not add overlays, the bootloader does not care. I w=
ould
> > > like to simply carry around the 1-bit mmc overlay for one broken boar=
d.
> > > That would help me. So I think there is a benefit but nobody forces
> > > you to use it.
> >
> > Well, it does not force to use the really good feature, but it forces t=
o add
> > ~40% more file size and some more compile time, if I understand it corr=
ectly.
> >
> Compile time, hardly measurable even if you just do make dtbs.
>
> Size on disk:
> a) if it lives around in a /boot partitions with kernels and initrams in =
it,
>    then we are around 1% more space needed.
>
> b) if it has separate partitions maybe on some mtd: Looking around: GTA04
>    has quite some headroom left. Usage is still <50% even with symbols
>    enabled.
>
> But on the other no one else seems to enable that besides for devices wit=
h
> open expansion boards carrying "hats". So overall, should we really be th=
e
> exception?

Do we want to maybe transition like TI did for k3?

Start with board specific DTC_FLAGS flags for specific boards:

and then just enabling overlays by default :
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/a=
rch/arm64/boot/dts/ti/Makefile?id=3Dbca4146b1f66dbca07591bfd6ad695c699b5a09=
3

If we do board-specific, all the "Beagle" related items can be auto
enabled `-@`..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

