Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD920C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIFiXKgJG2XKRy+o1u2g6Qxx0mQnxL5XqP06hJfSS0E=; b=cVreQw4mJvAdVAZ0KiRBAijHjx
	TQIgOi7WL05bjt1HNFILGTj5iwPnUTfJUL5BwEqat6qcCi8DZJvvb2NK3VHXvrx+QLJHJe+LBMB22
	+sUnqwYou+fQWWPDeERAeCje3ihswGZ76U8DC/IiBEtSt7MQ7kejiA5I7eVU8LHZmmrQ/i6E2y/GR
	mnVPZfk3Uy+OZJIcSW550WGukW88PdYxFM0ZZVuoRFJKga1bvU7sNLFwttp1uZ0vT3pAshT8b4gpc
	zYrAYmJq1+L7pK8rzEZX3sYVzi0/V+LJNPLXcgjnG81XoQz4R4rwRt2AB28QGi8JmqpRWOSrJLSfV
	lHd+HOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgl7U-0000000CrqT-0b57;
	Mon, 06 Jul 2026 15:20:28 +0000
Received: from mail-24431.protonmail.ch ([109.224.244.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgl7N-0000000CrpZ-31xj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783351218; x=1783610418;
	bh=rIFiXKgJG2XKRy+o1u2g6Qxx0mQnxL5XqP06hJfSS0E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Qei4MXzcKMJwwNEOI731xkYuF2W7PHEJgOEIwbtEgz8RNiQ5KeUOSFk/sGMB/rTbY
	 Uv8SeO1vR2VXKtgttCU9D0hf/DxcinmYOj5Afcnmm7nl0simcKURY0Ux0ufUASaHfX
	 hLwoCH0NMAJaHxUDxmxmw3UgoV+hYP7JFTR7ZTYNsoCR9n/vdGA+UZXeU46FqN2e/3
	 5azWBMY5toraKBQMrztzRyjLQ1JDGFxH6k/NvtubQIl/ljAAUB5pVKDT3OO64GqODE
	 Eyl8q3j49UwVWZ5oo1sA1Bs4hlaD2JsaHzpbky23oy6u1S96qSAp7iflThavCYzGOc
	 zwGYFMafz3cyQ==
Date: Mon, 06 Jul 2026 15:20:13 +0000
To: Marc Zyngier <maz@kernel.org>
From: John <therealgraysky@proton.me>
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Ivan T. Ivanov" <iivanov@suse.de>, Stefan Wahren <wahrenst@gmx.net>, Andrea della Porta <andrea.porta@suse.com>, Peter Robinson <pbrobinson@gmail.com>, Stanimir Varbanov <svarbanov@suse.de>, =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Gregor Herburger <gregor.herburger@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [REGRESSION] Raspberry Pi 5 (BCM2712) hangs at boot since d87773de9efe  (arm_arch_timer: default to EL2 virtual timer under VHE)
Message-ID: <vUQ4-RaOlZaTlasD0DLGmWOWcVLQXYYK_yid3Tsqeyi53CPsTCpOvXSGZiz0RAyxsxCzWTXOe4zK8rzOLdtDXiVu-xBjp2VkPz9JRj9QUWA=@proton.me>
In-Reply-To: <86h5mcp4em.wl-maz@kernel.org>
References: <oTZ1wsFlcf4l8zMuD8DYCCvff35nVbFn7gTb5_vrUPSJtjVBSTmGti8S3KnbVdVWJEzP1QRbWma6UYYXyi6v2J0fl61khniPROEhsdxMIz8=@proton.me> <86h5mcp4em.wl-maz@kernel.org>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: e1080b9fb59b30b23eb8c6815ad35f5a40805572
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_082021_912175_778D4FCE 
X-CRM114-Status: GOOD (  17.96  )
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

On Monday, July 6th, 2026 at 10:40 AM, Marc Zyngier <maz@kernel.org> wrote:

> On Mon, 06 Jul 2026 15:13:27 +0100,
> John <therealgraysky@proton.me> wrote:
> >
> > Since commit d87773de9efe ("clocksource/drivers/arm_arch_timer: Default=
 to EL2 virtual timer when running VHE"), the Raspberry Pi 5 (BCM2712, arm6=
4) hangs during boot on v7.2-rc1 and later. Reverting that commit on top of=
 v7.2-rc2 boots reliably. Found by bisection.
> >
> > Environment: - Raspberry Pi 5 Model B, arm64, device-tree boot (no ACPI=
) - CPUs start at EL2 with VHE - Mainline v7.2-rc1 and v7.2-rc2
> >
> > Symptom: - Silent hang early in driver probe; no panic or oops. Boot ba=
nner shows
> >   "arch_timer: cp15 timer running at 54.00MHz (hyp-virt)". The first bl=
ocking, timer-backed wait during probe never returns because the EL2 virtua=
l timer's interrupt is not delivered on this SoC, so clockevents are dead. =
The softlockup/hung-task detectors can't fire either, since they depend on =
the same dead timer.
> >
>=20
> Is that a guess? Or do you know something we don't? Or worse, is this
> report entirely AI generated?

Hi Marc - I'm not a programmer, but I can use git. I performed the bisect, =
and verification steps by hand. I am convinced the bisect is correct based =
on the restoration of booting.

My RPi5B freezes when booting into d87773de9e and reverting it gives a clea=
n boot.

I used Opus to analyze the result of the bisect in concert with the logs I =
captured from the serial console. I also used it to summarize everything in=
to a concise bug report. I can't vouch for the accuracy of the interpretati=
on, but I can confirm the problematic commit and restoration of function.


> Again, how do you know it isn't functional? Could it be, for example,
> that the firmware has not configured the interrupt correctly?

I cannot. In the future, when I use these tools, I will scope the ask to ju=
st factual content, rather than allowing them to speculate.

> A proposed fix has been posted at [1]. Until we hear from the
> implementer about the state of the HW, it is difficult to do anything.
>=20
> =09M.
>=20
> [1] https://lore.kernel.org/all/878q898ulx.wl-maz@kernel.org/

Thank you for linking that! I applied it on top of 7.2-rc2 (with d87773de9e=
fe intact) and got a clean boot.

