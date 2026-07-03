Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE05C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9L0/uB6Gsh2WFeSkmmU3h8J0rHkOmOpn4iPX3EYXWqE=; b=E0LNiYYx8/MGbTvTJScPjBzGhw
	FIioL3DnhHBy7Xcqi/LflgN/vqWvNoAo41W6ijX4m+QFXypsv4ZysMreSaqoBCMDtHpU4rgcRsnBl
	WRvBHMh9WFcDRLEDx2xv2/jUdFaFsQcWfLQxUM/UN8AXlhW9lF1ra1GL7PcxyL3ZwRdvKtEE8YQxS
	1WyrxApHGATn9qGlEt4Hg2YwbF+4rphY4jQSOzOp4edpIFYpQuA7ImxCsdi0L8U7ySI4LGfSvQWRJ
	H+Ooyq/TBSe/YME8Zjp98ZF1YodC9DoOn+X2593TnH6E2NnOlKYyzuggaU9H8h09ctOYADlwXN8Nw
	41oCoM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdmm-000000074L5-4BKQ;
	Fri, 03 Jul 2026 13:18:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdml-000000074Kr-481V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:18:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65184439DF
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 13:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489D81F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783084707;
	bh=9L0/uB6Gsh2WFeSkmmU3h8J0rHkOmOpn4iPX3EYXWqE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YRosel6DL0wuQ3cHV1RuS0LWqVF+wHgTey96RxdDguwdPWjCPEmcEVNg+3lzchLpF
	 zJCz1r0N408OKfSTBpp7ZdSs+pf2uYqFlvo2dUnXNsc0Byhdc5f+aYJfBDo1iNWHFu
	 OulZtD74u1SUNB8QRx6Cnt1C8tT9+cnei7CZCFl4mnrsJfK714jaFqEwg/LVjFvK5G
	 Ntg1aPssH7xYyguGcG04IeAkND81Ssy/v6w5yMIlarZYEDMoyoDy4s6+A7xbpEYTC3
	 FwSD46lNWA/TMorv7nj4uXce+jiAewdndoZqXVCtpZ+SwvgwJOcY0AFbpeRwguulRi
	 C6mUoCr4o8sIg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b14a7e53aso5518711fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 06:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpJFHu3X0AqtCm/wKGXtV7xl9kjA7+iyPF1DIxdvscWYmh0AEL7WubAxdawJhm2KsLEOjSo4on5Ce7dI1xGea76@lists.infradead.org
X-Gm-Message-State: AOJu0YwNoYUoTXgab/NuyqvUhDIkeyqiQOyXzzhcflSg1QzEMp4eIwEm
	yOwtCTdph1h3Z87xQ3geSqc//JpTozm7m8/e/73IDjhtaQd4UfcihuAW0OIshzeDDBhrDwIHvKN
	RgRsMmr1JvsHQ0LH5hyYLcjUehlG1wUXnW4wek80+KA==
X-Received: by 2002:a2e:a907:0:b0:39b:100e:a582 with SMTP id
 38308e7fff4ca-39b34102a63mr21058111fa.38.1783084706034; Fri, 03 Jul 2026
 06:18:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:18:25 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:18:24 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5HMVaERvte8YJDJ0fq0zoMvO7-7caAGQhsAB-9sUHoGtQ@mail.gmail.com>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-4-wenst@chromium.org>
 <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com> <CAGXv+5HMVaERvte8YJDJ0fq0zoMvO7-7caAGQhsAB-9sUHoGtQ@mail.gmail.com>
Date: Fri, 3 Jul 2026 08:18:24 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdO-9qd2-YqaCusAtYB1qqGezs5vzAdaf+Jrxv+namYng@mail.gmail.com>
X-Gm-Features: AVVi8CdQC2c9zpmPe432u2VDpFaMO7YKToWQLqvYb4D_WqYuh_dkKQK1wPiDll4
Message-ID: <CAMRc=MdO-9qd2-YqaCusAtYB1qqGezs5vzAdaf+Jrxv+namYng@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 3 Jul 2026 14:17:19 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Fri, Jul 3, 2026 at 8:07=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>>
>> On Fri, 3 Jul 2026 13:03:04 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
>> > The power sequencing consumer API already does power on state tracking
>> > internally. Expose the state to consumers through pwrseq_power_is_on()
>> > so that they don't have to reimplement it locally.
>> >
>>
>> They wouldn't be able to do it as the field is private to pwrseq core an=
yway.
>
> Which is why a helper is added? Note this is returning the requested stat=
e
> on the consumer side, not the actual state.
>
>> In what situation would consumers need this? Typically you know what sta=
te the
>> handle is in if you control it.
>
> Mostly just to avoid extra tracking in the USB port device. For the hub's
> port power feature flag, the hub driver actually queries the hub for the
> current state; no in-kernel tracking is involved, i.e. the consumer doesn=
't
> actually know what state it is currently in.
>

Fair enough, thanks.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

