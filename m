Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ABEC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYtH+wRxVOhZLnwB1WM+hIqFRb3BrobNCM8pJ9zIA9s=; b=PZvjXhzPUm+GDvXWlEkc0chfJH
	d351gOh+MpzU9/kK4UfBBUl1WgINlNH5Ssx/mR3qwupLb0qIkY6wIuJFJzlLRTZf6MQYMV3qMsYiM
	kI/sS3BfYIqitmy8WVEruk3fuvMtESrX0XJpBoDhHtwzW3rm3dhRoeZBQfANGE4NTbzwZnUITQY00
	lj0jYqLdhKDikgBBIOcu975bClO7zLiqKBb9NtvM8uS50cgQupRzZcwr5ARJk2eVjx9uwyO1u+5Vi
	YHJaXrF6LEp+4WnsqoWw66tYJKyuo1jvjbJKHeaTE63WbTxLBBoQBJz1YqRJiOC9KZTozZfbFTpfV
	VhMI7yWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0DPY-00000006p6k-0WlY;
	Sat, 29 Aug 2026 07:23:32 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0DPU-00000006p67-37EJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 07:23:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787988198; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tJqcXP5cEuGwgKK9JoY3t51J5cSU9gGzc1QQb2J4uQ4k9M7WAgIZloewEcnL3mvpOe
    3fXlK9SE8AhYCuz7ojq1ujYXdLTN7fRBpM+bGVqj4vfKsRhj2aL4Hd3rWmDPbk5sb7um
    2gSsePru6O3IC8oA66Bl32FOgP3X9fCPOarhmGm0+x+Q/Z62E2ZLa+dGED+o1sTnofXd
    Xb48tcpeSYrAj6AV4175pQiYN4/U8cFFbu3335YaRQPWZ/JkumSDY8EAOLMyFll2Xfya
    H1PRS1p3bmh4HuOEqaAAF3WAyGRrhUcBs4v7cHYDTTPJ2kMfcZStaHk0h4KdiQLp4yoM
    0yUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1787988198;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kYtH+wRxVOhZLnwB1WM+hIqFRb3BrobNCM8pJ9zIA9s=;
    b=WKMbyHxf5juS+DPeCCR3ogOod+r/LoiACTjZ9I+DSb/2NBFthJRfUu6u1clEcz9VQi
    gPBj1C8Osb+ndgz2lEKfFWgDeDEzs0AJHYnvi7nNqKN1rwHdzGGVDv14mDS0G4Y9iPqM
    llyL6UeHHX+J8O47gX2dURPQEGFBzM2cla5XbpvrFooicA39S7amCL16nuDZtkPX71xM
    Sm+BUTIl+WJ4vSDuL2JMLyjMI6LXM42pJ8WDzuvqhXIQwV+u8l2d2+65b44BgIdz0vKR
    Zexjdnu/6AezIwh/jdS13CfARnRkPOC4aJ/9xM+Nc4GETUtJJpvX7pCrfyalg6CwsBKo
    J0Pg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1787988198;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kYtH+wRxVOhZLnwB1WM+hIqFRb3BrobNCM8pJ9zIA9s=;
    b=YLCVCBgghJYUDaMOV7y9JIanNirGCG2HFKvn+iTUlHA+kbDdLWqIZWzDOSRWTog4Wh
    HKmoFPmVVNtjcN+z9vavJVXxWn9/Zl6teZg9Ja6drgkFC/xp3yqMCpsjqDOgCmCc4v7C
    SCc1FG1Oay1E/N1wMuwfZi1Y+8Gou3ugdAW/DKgVcwWY6vdD7zs7OWyvvyxR2jUCijZe
    a2FTqsL8du4Gzln4omXQCciH+lMZ7owznZOOjxQJMnbiwjSq+0XkPDssS954PAGVtfj7
    blGHnvua/HByU3f7b+a6O+Rbip9LFm9q5J/yA1bnHud0r8rUAJHEKuoY43YbEwAy/PCp
    iNOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1787988198;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kYtH+wRxVOhZLnwB1WM+hIqFRb3BrobNCM8pJ9zIA9s=;
    b=zkLX4wkpT4Hzpfs5b11g36ZZmB96n5m9SG0+DEKFupDRCAiH9r5G/b9HJUA71JUkCk
    h9zAmNjh34EiGTyI3TAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ35oHnciHbXHlF5ifeYAaJBD8ww1UKCkkgME="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.2 AUTH)
    with ESMTPSA id Qfefb327T7NHu2k
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 29 Aug 2026 09:23:17 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Register
 clocksource/event only for am654
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20260828230445.3c2510b9@kemnade.info>
Date: Sat, 29 Aug 2026 09:23:06 +0200
Cc: Andreas Kemnade <andreas@kemnade.info>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E27F05E3-DE4F-4C77-95E3-1701B3410E93@goldelico.com>
References: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>
 <20260828230445.3c2510b9@kemnade.info>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_002329_040656_6548DEE7 
X-CRM114-Status: GOOD (  11.16  )
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


> Am 28.08.2026 um 23:04 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Fri, 28 Aug 2026 20:47:45 +0200
> "Markus Schneider-Pargmann (TI)" <msp@baylibre.com> wrote:
>=20
>> Registering clocksource/clockevent for the older platforms breaks
>> booting them. The older platforms have their own implementation in =
early
>> boot that is used to register clocksource/clockevent in
>> timer-ti-dm-systimer.c.
>>=20
>> With am654, the timer is much more complex with more dependencies so
>> doing this in early boot with the other driver is very difficult and
>> gets ugly. Instead it is implemented in the platform driver for =
am654.
>> However the old platforms may not register clocksource/clockevent in
>> this driver as that would break the boot.
>>=20
>> Add a system_timer_capable flag that is only set for am654-timer that
>> gates the clocksource/clockevent registration.
>>=20
>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Closes: =
https://lore.kernel.org/r/2013A99A-0502-4128-ACFA-B04886224393@goldelico.c=
om
>> Fixes: b8eeeca55456 ("clocksource/drivers/timer-ti-dm: Add =
clocksource support")
>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>=20
> Tested-by: Andreas Kemnade <andreas@kemnade.info> # OMAP3 GTA04

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # OMAP3 OpenPandora

BR and thanks,
Nikolaus

PS: I would suggest that patches for omap-dm-timer are also routed to =
linux-omap@vger.kernel.org=

