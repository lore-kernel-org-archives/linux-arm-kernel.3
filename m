Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60FFD41C31
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 10:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VFf/Xc2nlS+yNT+I41QxsowbM1i+EaeG4ziE6m3Pdg=; b=yaN1riqYF3BqrVpL7WXqkOGLmB
	CnyFs8+BljmcnVvKO/GJmt3l7jAyONIQM5tdjpLKp+AMYDTb5DBQ0kAdionNwIhk3pZYYvGSit+Z9
	WSdc4saG2nI13d9c/jAYpsFR6KFZt0YcQ2NomuI+AsNwD97paYk1VkBhdOET2tcchyINy5wggI8C/
	YlZXxnZmdzyPLgvvF9DA6WqoYih8CtX9kBbpXWKkf0YAyu8hRgbjOwhQAmDylawEKjMH3BlU5mw2h
	aGvK6ihGZkNkCLnhffyqbdJzI9F5xyrKrtEF/EGGTKJPmrLg5Sz/PGjsQet+UhHwj2CovZaXAAaPp
	Kahm9jkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAin-00000006T1j-3iYK;
	Wed, 13 Nov 2024 10:35:37 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAYD-00000006QvI-1Cnw;
	Wed, 13 Nov 2024 10:24:42 +0000
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-211a4682fcaso21867145ad.2;
        Wed, 13 Nov 2024 02:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731493480; x=1732098280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VFf/Xc2nlS+yNT+I41QxsowbM1i+EaeG4ziE6m3Pdg=;
        b=WmPWaXs5YJGIq+m6A2AHspFoY3Qoci80nXeBdJ96HOmkXVDo9a9tagQdqWNL1BCj6Q
         AAR+gaGWSU+Ir77A87lXl0U73kVSsuEvn1NS9Kb2EaVTLimGFj4e9ACtchqcD93Q4h4/
         wrETgNpPu7Ss/Ulk/z1Z9+DGcCx6IRWf7k/8VP8alg+aNxZ+zNvWu41poI9UH88w8J5F
         HAAdtRvaY1Z4TPtjur6K5Xm3JpGouEGnF7nUNMGixm5eP1C+bGwdfb6XgJywH+tTJ5Xt
         mNHnyqqxxQvr45TVeL7Skl0KXvGXUN/F6bM/ObOyZhpTZeoiQKuOyhd0wublQpXGzZgf
         dCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9Cof4kmNhe/FihBO8xq/iP8VV1gjrdY3d/Vu+xUXs8s8sV4UnLcLvVaJcic6VPRJs/9td+awZQ9FvD+h9TNf@lists.infradead.org, AJvYcCVor9Uz5bAhH+NSSSexn+Frxy1LlgvJYdRxAiMoxGj5XhNtM/OD5ZJ3TWutsSFPZ9jCApo6n0HIJYjiVgR8hqU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYioRLycAIl/0QcTznBOHcsHT6oY4KQJvKJOpzBOjjw+55UvZ9
	EDkaxhAFubJRXeujJpsnHBlL2O3f4K3LitHd99ok6nW2XQ5tdCATcXIGYPNl
X-Google-Smtp-Source: AGHT+IGSECJ2rMpEiePoumLaiy6PEO05W+J2+Ji5a24UEPvreyuQK40KdAa2LZiLyRcgNv8DDtTNng==
X-Received: by 2002:a17:903:6cd:b0:211:898:7cf0 with SMTP id d9443c01a7336-211834e6c07mr180355875ad.12.1731493480199;
        Wed, 13 Nov 2024 02:24:40 -0800 (PST)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com. [209.85.210.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e49bcbsm107587125ad.161.2024.11.13.02.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 02:24:39 -0800 (PST)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-720c286bcd6so6044842b3a.3;
        Wed, 13 Nov 2024 02:24:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqYc/qNJIgt3HQ7B7utOKyGShg2kKM8oT8XxPRmkm85zOLAkW5pxEbZ+GgjZoYXSA683r6V7+2mxrupxTw6wZ3@lists.infradead.org, AJvYcCXhn0V1v6ZDf7AQ2xI2qasE2AWtYN1uE34fuZ/6rIxYsEn4Ix3qSSRNnALRwXEd2XtAsSLrtyOMJ1lWYis51ME=@lists.infradead.org
X-Received: by 2002:a05:6a00:14d3:b0:71e:659:f2e7 with SMTP id
 d2e1a72fcca58-724132a1a87mr26548820b3a.8.1731493479293; Wed, 13 Nov 2024
 02:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20241111181807.13211-1-tszucs@linux.com> <20241111181807.13211-4-tszucs@linux.com>
 <4ba81dfa-f276-4e05-b46b-92f50dbcfcc4@kwiboo.se> <CA+GksrJLpeU8x-kjR1Ng3ySf+giiufCsJuBssng9qoX1PjAunA@mail.gmail.com>
 <9330ebb370780c001fd2aaee49aec9e8@manjaro.org> <CA+GksrJjDPve29Vh7ZFhM+JFp058xmXZAPeuLuFth7v=JeiH2w@mail.gmail.com>
 <0eb19e4daf2cdf3d4a04935876c3d3b0@manjaro.org>
In-Reply-To: <0eb19e4daf2cdf3d4a04935876c3d3b0@manjaro.org>
From: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
Date: Wed, 13 Nov 2024 11:24:28 +0100
X-Gmail-Original-Message-ID: <CA+Gksr+E-tZe4sKVNa8zpATwdTW_DiOQxOf_Jujf5SURzhSPSg@mail.gmail.com>
Message-ID: <CA+Gksr+E-tZe4sKVNa8zpATwdTW_DiOQxOf_Jujf5SURzhSPSg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable UART8 on rock-3b
To: Dragan Simic <dsimic@manjaro.org>
Cc: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_022441_348760_7683B199 
X-CRM114-Status: GOOD (  30.18  )
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

Hi Dragan,

On Wed, Nov 13, 2024 at 12:25=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Tamas,
>
> On 2024-11-12 22:04, Tam=C3=A1s Sz=C5=B1cs wrote:
> > On Tue, Nov 12, 2024 at 4:07=E2=80=AFPM Dragan Simic <dsimic@manjaro.or=
g>
> > wrote:
> >> Please correct me if I'm wrong, but isn't this UART supposed to be
> >> used for the Bluetooth part of an SDIO WiFi + Bluetooth module, in
> >> form of a non-standard M.2 module that Radxa sells?
> >
> > UART8 is supposed to be used for any radio module connected to the M2E
> > connector.
> > It will typically be responsible for Bluetooth or BLE but it could be
> > 802.15.4 or whatever. In any case, all wanting to use it will need the
> > uart8 node enabled.
>
> I see, but I'm still guessing what's the actual use of enabling the
> UART8 when it will remain pretty much useless without the additional
> DT configuration, such as in the WiFi+Bluetooth DT overlay that Jonas
> sent a bit earlier?

The actual use is device enablement.

>
> I think that the UART8 should be enabled together with something that
> actually makes use of it, which in this case unfortunately cannot be
> automatically detected and configured, so it belongs to a DT overlay.
> I'll get back to this in my next response.

I agree, bluetooth blocks dedicated to specific modules should belong
to DT overlays.

>
> >> With that in mind, I see very little sense in just enabling the UART,
> >> without defining the entire Bluetooth interface, which AFAIK produces
> >
> > Defining a bluetooth node would hardwire idiosyncrasies of a given
> > radio module's Bluetooth core. Sure you could add a sleep clock, all
> > kind of sideband signals for wakeups, reset, power down, etc. But hey,
> > some will use them, some won't. I think it's undesirable and
> > unnecessary. You can hciattach from here and most will work just like
> > that. Tighter integration or anything special, module specific on top
> > should be handled individially, on a case-by-case basis. This is a dev
> > board after all. I say trick of all trades.
> >
> >> nasty looking error messages in the kernel log when there's actually
> >> nothing connected to the UART.
> >
> > My dmesg is clean as a whistle
> > root@rock-3b:~# dmesg | grep -E 'fe6c0000|ttyS0'
> > [    0.344818] fe6c0000.serial: ttyS0 at MMIO 0xfe6c0000 (irq =3D 26,
> > base_baud =3D 1500000) is a 16550A
> > What kind of nasty errors do you recall?
>
> Those would be the kernel error messages produced with the Bluetooth
> DT configuration in place, but with no SDIO module installed.

These are the kernel messages related to UART8 with the uart8 DT node
enabled and an SDIO module installed.

