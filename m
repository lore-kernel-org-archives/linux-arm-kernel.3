Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FAACFC506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsE68aBeWQv7ok/egjq60UEqiYlK9UY9L086weOplk0=; b=DmHDEdIoH/AzPeTMg+kg72SGxV
	XLCqNP5GmcKzYjNrJ6NXCr+++Sl1y8/VCcLFF2IkrkJDYDRU/4c/r6I+rO23HDMyodzc1m/tTORSD
	nVpQomJvVGACde4v/+sAIlj4X+0rqsq2GEZGfnORghhwCLBFK9Fy4oh8l1aHlFjMi76YDqFhF5cNY
	gU+nDqVX6v1bYzDM4XXCXtHiPzqkotWR6cb3m46ty+sbOy075tbjRpp4Kc0fOfFCZr6Bm4cb0OslX
	gyPoCZ3jKZadpcKY+DHocZDzYhNF06OmUAZWP6yX8lgkjohz7+GbDyS/BAUqT94HBgVPg/29vgsaS
	Hr0r4DfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMXrP-00000008xbi-2QMX;
	Fri, 21 Nov 2025 20:36:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMXrM-00000008xZn-1I9e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 20:36:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB7804407A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 20:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76E7C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 20:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763757358;
	bh=meSktXQNs/zDvTr1rLs7LeQfxQysPHSbGkzQDId9XMY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L+zvWL/Nh94FkM1rZrXcBtTOzgK+mkJwTDosBcBijCdV34X53/cdtFJtiuZ0Md/WM
	 GcqhqeRjUC0vm45dWjFBz6XmwGZdDlx/1YsRu2QyrzPY+3hCmTjo6+j5LM3zBib4I4
	 J6tKQx3AUF2IB07P8TFo+IWDzck0Yp3oj5x5qK+1dMshchSxQDW1aIOTW5EmLdVjPD
	 3zqNL5lRPlgjWSvClhgdnUG+fb4P2UmRkId3/JrLTerz93MIgGIWp8gL3/SUNNbMpt
	 Z0A6qD2K62qoXRs1K/9ABvtlMFte9d0O1sWFPTl8RY6sAvXTCprA/RgDr/i7m3fD6z
	 YI+JdDMM/fmQg==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-656de56ce7aso526008eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 12:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVw+6fBAtecGh36//qvH04K5HhxJ8YxDDZ6cSsyPlxrVj4TN8VuRNhLOI8i0hc9/chVOGRRzkB0ybIO8zd9Rb0@lists.infradead.org
X-Gm-Message-State: AOJu0YyTXeL5g02B4gyTGC1ZemIQWzzgnc2MtPF8TZAvnZSbkHW4IkOE
	/Dqz7RPFLDHBoSeTXDvgTA962E4mKTnXBnXQ9r2oCW9/fJYGlDyPQj2j/lEzRBF6ssvPvDH7OF8
	0s5icq7uSC5gr4UQa+ajA9FQTOnbwLRY=
X-Google-Smtp-Source: AGHT+IEGV1wW0AyQ4uV5rOeWs+mu0pohToH8QfmqGgzcM1nDvWFgodvXp8dfzsS7PUq8QlplylLWmLPmTb2ii+XtGZ8=
X-Received: by 2002:a05:6820:4d57:10b0:657:7289:b1dc with SMTP id
 006d021491bc7-65792596028mr1028369eaf.6.1763757357967; Fri, 21 Nov 2025
 12:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
In-Reply-To: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 21 Nov 2025 21:35:47 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmY4Rgl1Z4nj5ks6gNTVnBjHocEaNjk9D0MQSLHqvtZo8fqobTCygtTNLc
Message-ID: <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
Subject: Re: [PATCH RFC RESEND 0/8] thermal: core: Allow setting the parent
 device of thermal zone/cooling devices
To: Armin Wolf <W_Armin@gmx.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Len Brown <lenb@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_123600_408059_3B08BF84 
X-CRM114-Status: GOOD (  28.96  )
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

On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Drivers registering thermal zone/cooling devices are currently unable
> to tell the thermal core what parent device the new thermal zone/
> cooling device should have, potentially causing issues with suspend
> ordering

This is one potential class of problems that may arise, but I would
like to see a real example of this.

As it stands today, thermal_class has no PM callbacks, so there are no
callback execution ordering issues with devices in that class and what
other suspend/resume ordering issues are there?

Also, the suspend and resume of thermal zones is handled via PM
notifiers.  Is there a problem with this?

> and making it impossible for user space applications to
> associate a given thermal zone device with its parent device.

Why does user space need to know the parent of a given cooling device
or thermal zone?

> This patch series aims to fix this issue by extending the functions
> used to register thermal zone/cooling devices to also accept a parent
> device pointer. The first six patches convert all functions used for
> registering cooling devices, while the functions used for registering
> thermal zone devices are converted by the remaining two patches.
>
> I tested this series on various devices containing (among others):
> - ACPI thermal zones
> - ACPI processor devices
> - PCIe cooling devices
> - Intel Wifi card
> - Intel powerclamp
> - Intel TCC cooling

What exactly did you do to test it?

> I also compile-tested the remaining affected drivers, however i would
> still be happy if the relevant maintainers (especially those of the
> mellanox ethernet switch driver) could take a quick glance at the
> code and verify that i am using the correct device as the parent
> device.

I think that the above paragraph is not relevant any more?

> This work is also necessary for extending the ACPI thermal zone driver
> to support the _TZD ACPI object in the future.

I'm still unsure why _TZD support requires the ability to set a
thermal zone parent device.

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Armin Wolf (8):
>       thermal: core: Allow setting the parent device of cooling devices
>       thermal: core: Set parent device in thermal_of_cooling_device_regis=
ter()
>       ACPI: processor: Stop creating "device" sysfs link

That link is not to the cooling devices' parent, but to the ACPI
device object (a struct acpi_device) that corresponds to the parent.
The parent of the cooling device should be the processor device, not
its ACPI companion, so I'm not sure why there would be a conflict.

>       ACPI: fan: Stop creating "device" sysfs link
>       ACPI: video: Stop creating "device" sysfs link

Analogously in the above two cases AFAICS.

The parent of a cooling device should be a "physical" device object,
like a platform device or a PCI device or similar, not a struct
acpi_device (which in fact is not a device even).

>       thermal: core: Set parent device in thermal_cooling_device_register=
()
>       ACPI: thermal: Stop creating "device" sysfs link

And this link is to the struct acpi_device representing the thermal zone it=
self.

>       thermal: core: Allow setting the parent device of thermal zone devi=
ces

I'm not sure if this is a good idea, at least until it is clear what
the role of a thermal zone parent device should be.

