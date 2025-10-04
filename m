Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE58ECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Oct 2025 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkUHHW/8YstHHualb/SiYorZ1DiF4W6i84iViR0FPpY=; b=b2cRsNqp+9B3H58rrIzFMg+cI2
	sVpA6XHWdQrSeVMw6tmkVl5/RbPIKlMizxcxEfhtiudTtmGZhWZKgm4NMXgwACTEEQWJVUVHga/f6
	AmMzy4ea/SCrjmV/fSHYPAtuDLCbfMXtfzj6NZtGJWI6Kzit8vwHx95x3/n3QPC63NyxiXS7gOik1
	iYPhMuX9ItSkjQBmLvZrGQEJzVLAbtkDCDl0xwBqShFTIgjDigNXNpftW0K94QGhCxe35wML0E9aS
	frw6JSTkJQOs7DFGKS8mLeIU7GKcN/e5v7R104y6Or4Jps64Qgj9F04imaQwb4PhZdRKWgJMifSrS
	2kyculLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58P0-0000000Dyew-3L3S;
	Sat, 04 Oct 2025 19:58:46 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58Oy-0000000Dye6-0H31
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Oct 2025 19:58:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so2938730a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Oct 2025 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759607923; x=1760212723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkUHHW/8YstHHualb/SiYorZ1DiF4W6i84iViR0FPpY=;
        b=gnR/pb/o9qml+BGSlJ3AoQW85thNze1YuuKQ2A2JKFg7RFbpeWpPLTJsIi+ByOVj/g
         88RBrZTAjNHnjZ8ZJTxgNS198DjsDEMA1vWHaOgIqHBt2M270s9nCYDjv8jlyFIvwwjT
         bIOJxJbZ5h1fLK0w+mUjNK7dff3V3qWP+Yrrv8scpYVMEHdcZtGObS9D4PxJ4Rj5rPec
         wcJmPAwGnkuUsVVPpP64qd17GMHpAVWNs8nRm47luWj122NyMrxsaPe0R1DSrhhDWr36
         NdrNlCjmEeVAS+nEIzuexwJqib+cCPOwgD2N/Uen7X0It5W8eFjLEjRrN8fqQbPrZT1k
         OisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759607923; x=1760212723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkUHHW/8YstHHualb/SiYorZ1DiF4W6i84iViR0FPpY=;
        b=C2AJCiset5EAcaySbe38ndsPd2sAljkyR/oTRh+VAXTj1RJdHRocZIPhdFJs4XKbY4
         UivzCmMhWoziZpJbS/Uzbj8ONMcUu5rLzK+eU2Lwjs3lsJxuubUEIZMCWJLMuqI1UQSv
         Mn4Af7p8JPgaE+hQ1AMuzazxSAG4YA4rtFEjFlo8bOngV+5mnCFcd6peJMa6p//1q8eN
         JpMqpIRXGoIezmXQSQuxsMQZVaLrgOOdGd72b7xBnM+pUd+7MMdQQJsEOXct1ipqM5LU
         4vcE4xZwN0chYCkF12aSUleWpqPbPspxj1iCmSUvYvtEEvQXMddUTXrYuTiwZOSNFwIh
         M9iA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1vWFH3bCrardHN7HizqoD4WO2dPXP7vNCUyJHdOrk/VUMM7fAxhuw8wOWzHOhRTs6jzhFISexvEhej4e9WO3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw307zSA0DSsKezts5ZlrY4QYP1EN+xX+EZXhveYIConHySqSUN
	TBuxatWqtfQz50K2tr2K/f+IdP/P9VjMfZvYGL9VpAzK//FdsLb4I8EMmEgNGD68Hj9fLBR8F0G
	D5UZ+7KnA7aOviWoumgwBNQ37/SMzs7w=
X-Gm-Gg: ASbGncvSrQTjcCLLIKstFhsnMTaHqNZqEx12bYBmKHuuF6kaDlur+NVzH9jDkzmtGRQ
	ICahjDNgYw3DwaCYhMCTNMMFTBb6GaLoqCOH8Ch57umA6IJzN7yQiUwiikdaggv+E+29lp/LACU
	0WOga1W6KhoOHGgpBOoHZ5br80f8pOA6fXRGZPJty47jgx9Sd69mq8lSXGp5FWIDpIt4BjVeAGx
	+wg7tCZkyEjAiFLmsWqtz5v4N+ygQxirzlxpekmobACVxhwVBIlc74n7RU7ueYSibChnYR2zOA=
X-Google-Smtp-Source: AGHT+IHIlqoFMv9csx8XRng4syXVJftJT6zd7u5YxyOumBwLOTKBWwzcxLH9Rhpq2ydFsn3WZaZHOCkzeoZW36Gl4Kk=
X-Received: by 2002:a17:902:d483:b0:264:567b:dd92 with SMTP id
 d9443c01a7336-28e9a664e7cmr89943225ad.52.1759607923096; Sat, 04 Oct 2025
 12:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250927125006.824293-1-christianshewitt@gmail.com>
 <20250927125006.824293-2-christianshewitt@gmail.com> <CAFBinCDQc=2xrKbGunSKJjLhGd0bCGN+3oYd_bg0ySs+WHxZjA@mail.gmail.com>
 <6B97C24A-A1C0-46F9-BC74-3E7D2119B6D6@gmail.com>
In-Reply-To: <6B97C24A-A1C0-46F9-BC74-3E7D2119B6D6@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 21:58:32 +0200
X-Gm-Features: AS18NWCb80TyhWmdif5KiXRRfxefpRACPUKw21AL9syFqt4EGgXmS0JSw7hcZh4
Message-ID: <CAFBinCBrG0xZ6sWwZYtB2k_giZoOKjB_AmtbidVtyhib=UzDfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Tanix
 TX9 Pro
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_125844_107487_A11EB1F2 
X-CRM114-Status: GOOD (  18.97  )
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

On Mon, Sep 29, 2025 at 1:43=E2=80=AFAM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> > On 29 Sep 2025, at 1:12=E2=80=AFam, Martin Blumenstingl <martin.blumens=
tingl@googlemail.com> wrote:
> >
> > Hi Christian,
> >
> > thank you for the patch!
> >
> > On Sat, Sep 27, 2025 at 2:50=E2=80=AFPM Christian Hewitt
> > <christianshewitt@gmail.com> wrote:
> > [...]
> >> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts
> >> @@ -0,0 +1,90 @@
> >> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +/*
> >> + * Copyright (c) 2016 Endless Computers, Inc.
> >> + * Author: Carlo Caione <carlo@endlessm.com>
> > Is Carlo really the author?
>
> He=E2=80=99s the author of the original device tree that 95%
> of the content for this one is taken from; as is the
> case for most older Amlogic hardware. The decision
> on which bits to copy and paste was all mine, but I=E2=80=99m
> not  sure that skill deserves too much credit :)
I just wasn't sure whether it was a left-over or on purpose.

> I can resend with my own name (or mine appended) if
> that would be preferred?
I'll ultimately leave it up to Neil. Maybe if he wants your name in
too, he can just append it when applying?

