Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F36C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VX7v5KznOGst/S32zIq13isYK9aQbcFUdNYlBguUuc0=; b=r4i4S19PbdwG94hlUztj2MBeGR
	K+QT/Sd9bYqnLpKLSPS3gYUJoXEafNUy0+1MRcF5yhmSkEHeQtRjy8vDK9Um+J/p4TKjBrQ+hFVWS
	jlRmhCBd2+OafiGnJw9EGIyfM+xc5KC+gSwGn7GBCV2KNoFtYHQDlgH1VEWu035NmyveeTJn3vYcp
	u/Jy/FnuxsIjn3gsTCKqWMUTUrilv0ldIrfdVZnSVCIAZBqOkR514ZAoADnAQ4mBfN8h0KstsoqXJ
	/Gws6gVdjmk6rNblkE9u2Xh/eL4Fjdp/HhoBcx8PWms3jog+qTQLLAQKTiKoCYjU+up+EpUht6ipd
	v0DqZf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvWy-0000000EFwA-3XDL;
	Wed, 15 Jul 2026 09:03:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvWx-0000000EFw0-2joo;
	Wed, 15 Jul 2026 09:03:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B29A43B69;
	Wed, 15 Jul 2026 09:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110871F000E9;
	Wed, 15 Jul 2026 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106230;
	bh=VX7v5KznOGst/S32zIq13isYK9aQbcFUdNYlBguUuc0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Mp9b9tA1KsQJcysDV5RgBKBMJTWV+8PyD1YK/DtL5YbfSJnfI2mdI68YW8UhLCZsN
	 yHzbUs5VcVEC4mFb+D2l+PtQWybslLwNtVqM7ljXGi8kYsmMs56+Ijv0vyr+iRpsC8
	 vOP7qSTE8VGiPtNWfpzA4RhaYAMQMF0cuxho3kGHt/9zuP7emOkG0JxyBE2dIs4Zzj
	 i7WyuimjZqPZ6UkZO9oPeX19hsIGSbz06E13ot/gmtLrxK24748nIGVEqQI+cbKF/d
	 Sm4O626cWSzvQEDbEtTWkY9c4yJvyd4TGLZfKBAuRRkw7ohLEo2/kz0DKlHbUrG8lY
	 ZgWrFIC1PQf0w==
From: Thomas Gleixner <tglx@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
In-Reply-To: <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
 <87wluwoe1c.ffs@fw13>
 <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
Date: Wed, 15 Jul 2026 11:03:47 +0200
Message-ID: <87tsq0oc98.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Wed, Jul 15 2026 at 10:43, Thomas Wei=C3=9Fschuh wrote:
> On Wed, Jul 15, 2026 at 10:25:19AM +0200, Thomas Gleixner wrote:
>> and then you can just unconditionally set clocksource::vdso_clock_mode
>> in all drivers.
>>=20
>> No?
>
> It will weaken the sanity check in __clocksouce_register_scale() if
> CONFIG_GENERIC_GETTIMEOFDAY=3Dn. I am not sure what that sanity check
> is supposed to protect against, so I left it as is.
> If we can weaken the check, or maybe even remove it,
> I'm all for your simpler aproach.

The sanity check is there to catch random numbers being assigned. I
does not weaken when it's actually unused :)


