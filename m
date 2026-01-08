Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BF3D148AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4F2SB9f5d/mNn04/BKllqtDvhQr4G3ijObEiEkrROg=; b=kS9o1HmS2qMiHKu8+2W3RVhDl2
	zNagoeNzDo+kaJmbGLmz+7Bvuxjwu4n1r1BbMLoPwt0kzXhrpUVCZjApWsuxRxL6ke0ZE8jFA53G3
	snmldsJwlJJQXKLgMPHWXsfbJ+9HRfr+WJaRJcLF6k3xLhIesX5RGGrZ3aY6tsRJb6rfCy4Mf8+w6
	oxEHA6mC2qcgi8ja+G9ISQW07u9lkkR2KxAJfUeDnWAGg9BZaoYG7Yxyj6cvhv/i3yNWbgqSdf1iQ
	v52Nwi12MrX+X+3hNsGCoTe60WY6KnBbGMtzbOTfqBvvgZEM+gOQix+gAosXxYoZy1H4pVtVK/nK6
	nHiDC4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjuw-0000000G26p-3TGo;
	Thu, 08 Jan 2026 06:54:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjuu-0000000G25O-0EOR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 06:54:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so4468962a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 22:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855281; x=1768460081; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t4F2SB9f5d/mNn04/BKllqtDvhQr4G3ijObEiEkrROg=;
        b=Wrn99rEKjmoMiom6bUrZ123VVa/KusbSj+ZJ+xtXB4IOBOqGJwOPrvtCfk1uC/Mq07
         euTZUncvrlEizXa9Lgb3EIrwgt8mUIePsAitQ+jkhEQe54czYFH7CNQHkot+B0vsDcAa
         HMn1Hb4Z8IwGQ88JCck3NBVh9KT/Wpe1f42PInTS3HVCL4bA4uUeqQoisLixBNRwjZ8w
         7FJU4hAnXCQb491tr0xoa/O6TMMAQPexV3n2oMQuU99AkymFl/BRXq7VIJpk1kbIWVZL
         P79t9S7gUKKMNl5dl1nPDHHbMB1QaeiqHJq0fmzbBGXivkknbaR+UPpdXxXDYwsrgNUQ
         dvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855281; x=1768460081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4F2SB9f5d/mNn04/BKllqtDvhQr4G3ijObEiEkrROg=;
        b=BpnnU+nlyh4ThxzR5Zoxj0ju5vasEfSHYQu2DjxA+nh79CJnOvmI1HtJnSry2ovCsD
         i5LqbUfNPabZ9UVevv8tiN+acz3PogRS3eAIWUy0NXFWOGmSv6MkHxenuOuj1DoaRrlT
         l0H5B1xjfu4yCDZfsHwdY8ZVVAKWfsTagJCyJgRLrXS1Sd3CSNdAmyMPmZx652ctwa1v
         KTzfHRsBW7yTk2hRtGyMoWwkOdZmMeKtQu0go+FGEhfQsPUp9O2mUuf6inMWXDrvOyK4
         ZDCxTPd/s/dVYZXc5nC5JORelXIaK5coWoGa2uK0J1fjR9Dmdk+sdecBHoT4G0mwHqrx
         FMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYsyegjSrD/DLH3h2ELlWJl1ykhXE5DYj2SeuqXYoUXy+8PYDAjkGytm3w82lPNco4c90tesevM53pl92t+FBn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8uQG8YIt+M2nkC4lzG4Mm+gcnvR2QRt/jS3gV596sUMqGsjF0
	WCl0w39hY2BAPXY5JZPjwGpY6b1grFnxO4jh51gnCW8IIXcjEou5fT9qubDlyIvsN15ZpCZG4ij
	PE9SMUS/uFIua08ezpIT4UXx1RiJtpBo=
X-Gm-Gg: AY/fxX6ZCclS6lHnxLKFikjVmOhcyq/j0jZBoPXuAAw+s5ezLyOYICUNq5ZJlaGEZkk
	RQvXmDsfguyrPiepir6nUGy50bhl+70szOv1kw05u8LL9OEWe6D0EdjPQWLemkFbvri3xVHb9fT
	feM+Jf7pun+EMBDvn4kflvtIiGMgg7u2v6ag6mSjiUrF6UKuNEIR/lMEuu6o53Bq4YnZikUsGSi
	fNQUgoiif7PRgosV0s8dI00QV/96z77npQ9pCFosdYio8IQSfygcMxrzBjq4Y5TrYU=
X-Google-Smtp-Source: AGHT+IGASGpRE5geGPMFFoH+KZfseqKENFRmeBW4XZyTHbSYGX+MpMWOD4bcwRl1hOH7/QKo+S7o0hqO3wHruKhhRKs=
X-Received: by 2002:a17:907:1c82:b0:b83:95ca:589b with SMTP id
 a640c23a62f3a-b8444c4007dmr536411766b.10.1767855281293; Wed, 07 Jan 2026
 22:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <aVkinPvh_jxdh9wm@venus>
In-Reply-To: <aVkinPvh_jxdh9wm@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:24:23 +0530
X-Gm-Features: AQt7F2pq5ftUc3DeChtgdMDzbUbVtPyMHskj6HVuSaMN15yeS4QpeYTTmedIXIo
Message-ID: <CANAwSgS=u3CG_5R21SZ=euEQuqQ=edxZmFp5LhzZN5Lk5ozqXA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Typc fusb302 powerloss issue on Radxa Rock 5b
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_225444_152730_C7F0CC7B 
X-CRM114-Status: GOOD (  32.06  )
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

Hi Sebastian,

Thanks for sharing the details.

On Sat, 3 Jan 2026 at 19:54, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hello Anand,
>
> On Sat, Jan 03, 2026 at 02:01:16PM +0530, Anand Moon wrote:
> > On the Radxa Rock 5B, the system occasionally experiences intermittent
> > hard resets during the boot process. Initially, I suspected a power supply
> > issue, but further investigation points to the Type-C fusb302 module as
> > the cause.
> >
> > Specifically, probing or reloading the fusb302 module triggers a hard reset,
> > which can result in immediate power loss and a reboot.
> >
> > [root@rockpi-5b ~]# rmmod fusb302
> > [root@rockpi-5b ~]# lsmod | grep  fusb302
> > [root@rockpi-5b ~]# modprobe fusb302
> > [root@rockpi-5b ~]# [ 3389.031608][ T7143] typec_fusb302 4-0022: Initiating hard-reset, which might result in machine power-loss.
> > [ 3390.030444][ T7143] typec_fusb302 4-0022: Initiating hard-reset, which might result in machine power-loss.
>
> If you see this message the TypeC port manager (TCPM) state machine
> reached the hard reset error state. A USB-PD hard reset involves
> removing VBUS for a short time, which effectively removes the board
> power on ROCK 5B. Unfortunately the situation is quite complex :)
>
I completely understand this issue,
> > I attempted to trace the issue using ftrace but was unable to
> > pinpoint the root cause. The problem appears to originate either
> > from the I2C controller or the PMIC reset.
>
> I2C and PMIC are not at fault. This is all about USB-PD
> communication itself.
>
> > I have identified a potential workaround involving the I2C SCL debounce settings
> > for the RK3588 and submitted a patch here:
> >
> > [1] https://lore.kernel.org/all/20260103052506.6743-1-linux.amoon@gmail.com/
>
> This is most likely a red herring and just slightly changing timings
> in the USB PD communication.
Yes, but it's related I2C protocol.
>
> > Please note that the submitted changes address a minor aspect but do not fully
> > resolve the underlying issue.
>
> I don't expect any fix from this series regarding your problem. Also
> I suggest having a look at my talk at the Linux Plumbers Conference
> from last month where I discussed this issue :)
>
> slides: https://lpc.events/event/19/contributions/2156/attachments/1784/3861/improving-stability-for-TCPM-using-boards-that-are-not-self-powered.pdf
> video: https://www.youtube.com/watch?v=DmLsePJoH8I
>
It's a great talk. I understood the issue much better

I have understood the previous discussion regarding the reset failure.
In this specific case, the Type-C power is controlled by the USB 3.0 and USB 2.0
host controller power domains, I feel so.

> Something that might be sensible to do on your end is figure out
> *how* the state machine ended up in the error state and check if
> we can avoid it. The related code for that lives in
> drivers/usb/typec/tcpm/tcpm.c and quite complex. I use the
> following two patches to ease debugging:
>
>  * https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/6edc68e3c0ec4c209b5e96b848e17201059ce9ee
>  * https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/8ca8b1d6ee36e80f794bcf351a8b78d5a96daf06
>
> Combined with CONFIG_DYNAMIC_DEBUG=y and booting with the following
> kernel arguments: loglevel=8 tcpm.dyndbg="+p" fusb302.dyndbg="+p"
>
Yep, I have enabled this, but I could not find many details

> Greetings,
>
> -- Sebastian
>
Thanks
-Anand

