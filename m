Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486D110854BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqPUDw6RZ7tI/8SbuWaBeZ31o+A7cvn/glmx6dclWwI=; b=k5uEPIoHQSZ++s+eoriynvNSrr
	KM/eFK0rKhfPA3Ho9Y/a/0TYJwTuhUUIo/brEI2GJvAje3Qp9axuKHn1mrBrDhj03WlWORX5TtrxN
	+GED9NVMvj0+ukfGkL3m3xp2VHO0EHemn9FyE/1b+lln9Ao7aPutvZYnJunf0CJT9xOFiIaNPTc8F
	4MW/oDzJNTa6HQGH5vzmu+da8Tba5RRcM/mEcexx3l8gVcpsxcSLPUgpV3r+sIoXQ7u+RHgFkunZf
	Y4LaAIcc9+NI0g2VQKUXZNF3tdiGcz1lvUaLzAxQLsysrl3ShQoXy8Ei+JYOCPhEsKa7lHVPxuwMe
	3T7ERZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mbH-000000084vd-31Ch;
	Wed, 18 Mar 2026 08:49:59 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mbE-000000084uP-3dv5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:49:58 +0000
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50919fc3a14so76103901cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 01:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823795; x=1774428595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqPUDw6RZ7tI/8SbuWaBeZ31o+A7cvn/glmx6dclWwI=;
        b=IiEW5Lb2RkBfnJravCbpgsJMMy+sv4E/F8ncoM8KWGQsD4CS7JPUa4RX9Q7RCOxH43
         d/DWL9L9uWIoWk418rU4EGdYvOgPuXNTVBMgocO05bX4G67Ttq+rd4DJRD+Nelo3uXZa
         RwQr8L1tpPpY8HH75a888Nkl9bMFB8PTOW9EmU/WotN0lb/Ik1k2tNeASvxA2F1nbnsR
         i9QGWM9BTAziS2OyeEaBRHGM8k5UybRFNwTGvTEMAV4tVUagAOZXyCUZfSUbw+zk3BO1
         igjVBprVl+agXlJwTtOLMZyXG75JPfNt5ebg/SK+HgmisETDC8ENe9uzklkDxrElA9gR
         9ceQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHB3YXFTDCle3yyuXX5dbhx0OxrMyaBz6Sg9vrlXSXpfzA+6DNzAzaxOC5wjNxK7ZcGQ/fKaMT/5K/oToQ2sd7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz444G1vRF1XIY4cohvddmvq1lB2Qai6psPsrfYkqO4VVYQV59/
	m5goze5SOOuYhgc2OnJNQiwU/9PopN2fUh/w2vdWjWDkKb2+1+oIWTuvlEczZFEx5wk=
X-Gm-Gg: ATEYQzzSpGY11PcWtG3Y1G3QGj//40BruJetuq8vFmsLuU8yTExiNABNiiPtWC6wu3+
	5fQ1Xi15Egr3KZdg4pi0xra5uMmKz1G++ALEt4bFq3Bno43OTBiCrid0ilZz8ruF7g3aPHd5FdK
	P5VioIIIW2bh75QuVoRLE72hrhyMc+17SDtRb5LoLz8+obvlX8M/g7G6nUFsBw6eS76OU/6uDDj
	W8lW4tswTSgYL2+lm3cgzL/KIL00Lg9+ED8y73CuVF2e/mungRMGKyyXDilYgd2NtAFIkEGX+KQ
	FxjsAnXggUYHj6oQOgs4Wu/4JNyOM2r72zDBZkU9lkSvxfjQi26UJyAGFd1BZei/Mmy8Ghaqc8A
	rtBVGrPXrYRAP0RXEypy1c2kDd8EDJUNQ3T2IXiO9qvwbOqfVdBHKvEK9+xxWzW3AzS4aF8qbPd
	urYqppWWd2NBFU3wAtB6rSYKs5/3QDA4fQBClb+a7ry2ktGmzIvzeK1rnYGQi3a1zg
X-Received: by 2002:ac8:7d14:0:b0:509:3a9b:2b18 with SMTP id d75a77b69052e-50b14745275mr27835511cf.4.1773823795112;
        Wed, 18 Mar 2026 01:49:55 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b134ac5e6sm16483591cf.11.2026.03.18.01.49.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:49:54 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-509046c5c7fso82101481cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 01:49:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOEIwuN46+pHKQKtwBr7IkonHDMe0fukLKRfulMHRKlOkKpD+JvzTOzxenVFReV3sLhWlHYz8ZDl/yjCZKmf4P@lists.infradead.org
X-Received: by 2002:a05:6102:5087:b0:5ff:e39d:9f9b with SMTP id
 ada2fe7eead31-6027d159e7fmr1126209137.16.1773823315107; Wed, 18 Mar 2026
 01:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro> <abkD-VLprcbbEbB1@ashevche-desk.local>
In-Reply-To: <abkD-VLprcbbEbB1@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 09:41:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVX4tfko8iv-EdwO-bBcwCd+cPkb9aP8qJbcM1F4zdz4g@mail.gmail.com>
X-Gm-Features: AaiRm52_MgNfiAr79FL-62Ac0xXnTx-AfzVYThIE_IN0tF6AadQcPRzCkdJNUOc
Message-ID: <CAMuHMdVX4tfko8iv-EdwO-bBcwCd+cPkb9aP8qJbcM1F4zdz4g@mail.gmail.com>
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Douglas Anderson <dianders@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Saravana Kannan <saravanak@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org, driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_014956_915617_8AE3E818 
X-CRM114-Status: GOOD (  29.42  )
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

Hi Andy,

On Tue, 17 Mar 2026 at 08:34, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Mar 17, 2026 at 08:26:53AM +0100, Wolfram Sang wrote:
>
> ...
>
> > Thanks for tackling this issue! I agree it should be fixed, just
> > wondered about one thing:
> >
> > > While flags are often modified while under the "fwnode_link_lock",
> > > this is not universally true.
> >
> > Is it a possibility to use the lock in all code paths instead?
> > Because...
> >
> > >     struct list_head consumers;
> > > -   u8 flags;
> > > +   unsigned long flags;
> >
> > ... this change costs some memory on every system. Maybe it can be
> > avoided?
>
> How much memory does it cost? On most 64-bit architectures is +4 bytes,
> rarely +0 bytes, on m68k it might be +2bytes. On 32-bit it most likely
> +0 bytes. I expect that 64-bit machines will cope with this bump.

On all architectures with natural alignment of pointers and longs,
it won't cost a thing: struct list_head contains pointers, so the
struct must be padded to a multiple of 4 or 8 bytes anyway.
On m68k[*],  it will cost 2 bytes, as the existing padding is just a
single byte.

[*] Iff m68k ever switches to 32-bit alignment, there won't be an
    additional cost due to the change of flags here, but of course
    there would be a cost all over the place.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

