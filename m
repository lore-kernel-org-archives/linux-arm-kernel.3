Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3022D0E6FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgxEQ0f8MNjzesLOK80vetYWR3YMKzv8RvyUGva3XLk=; b=lNk7tzrhrRDnvyOqbcoaqdRUx/
	5dtpTX2sEX1fHz9dJP06eSbILoNvMKCxmRSueeMuAss2pzxOutz1ZH/S40hY+ywuZ9+GkMW6C6xfe
	K2v6tcfOxTeGd/9pXd/+h4v4bfSPffzeoXEQZokA1QNYIOv+QvtfSruvwUsGAza445o7KWrjFcNrT
	bE3k4GDN3n+UxrntFWmfjVn3fb4oYPL6hekSL0EK/X18S9rzeJr1wSA08zToo5zqbz4U2Ma/m7tze
	3S54XPy4PGP738JyRV+P1aLW5wFHftoYNeF/ZOimdPd2zzVvsUETc62sF+XBwmG/axM1lb/lL+Mls
	pGtzKsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNuxm-0000000DVgp-2b2G;
	Tue, 25 Nov 2025 15:28:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNuxj-0000000DVfV-0q7j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 15:28:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 980514E418C2;
	Tue, 25 Nov 2025 15:28:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59A4C606A1;
	Tue, 25 Nov 2025 15:28:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D30E1102F07FE;
	Tue, 25 Nov 2025 16:28:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764084489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HgxEQ0f8MNjzesLOK80vetYWR3YMKzv8RvyUGva3XLk=;
	b=K/Fp02xZ1WhDXcE/vwFa8uDqUxs4cBpya3Uwrcrop9bEq7pfenZOXIQyIXmx2DHkO7Vgru
	QqSq4h0+JFNQ4AA67Sn0cYZHfB1XsjSR1ooUUoj8w1JL9dwGdr5FK/bNugHt3wAJe41uYr
	uAX2fsP/UxHVQy6Cp+qpfCDuelKkDjEso0lEUbKRDvXz3BX5Oo6QQjoSWTQ/RBxJyF4tNg
	aiVyQt7GC6EQJPS67xcwL2bBmQY3GHV8dd9afsLEylbbo+dcisEEf93H8jk/AzarBLOuX9
	3d+Hht7rhKBAo9weo3A/zJ1cvtKmN9Mkk5o3USEarkGCBY+ykGchBqPb5EvKaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 16:28:04 +0100
Message-Id: <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com>
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
Cc: "Kever Yang" <kever.yang@rock-chips.com>, "Minas Harutyunyan"
 <Minas.Harutyunyan@synopsys.com>, "Alan Stern" <stern@rowland.harvard.edu>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "William Wu" <wulf@rock-chips.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com> <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com>
In-Reply-To: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_072815_497141_5299B36A 
X-CRM114-Status: GOOD (  20.47  )
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

Hello Luca,

On Tue Jul 22, 2025 at 10:43 AM CEST, Luca Ceresoli wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
>
> When the OTG USB port is used to power to SoC, configured as peripheral a=
nd

typo: is used to power *the* SoC

> used in gadget mode, there is a disconnection about 6 seconds after the
> gadget is configured and enumerated.
>
> The problem was observed on a Radxa Rock Pi S board, which can only be
> powered by the only USB-C connector. That connector is the only one usabl=
e

"which can only be powered by the only USB-C connector"
double "only" makes it a super exclusive connector!

> in gadget mode. This implies the USB cable is connected from before boot
> and never disconnects while the kernel runs.
>
> The problem happens because of the PHY driver code flow, summarized as:
>
>  * UDC start code (triggered via configfs at any time after boot)
>    -> phy_init
>        -> rockchip_usb2phy_init
>            -> schedule_delayed_work(otg_sm_work [A], 6 sec)
>    -> phy_power_on
>        -> rockchip_usb2phy_power_on
>            -> enable clock
>            -> rockchip_usb2phy_reset
>
>  * Now the gadget interface is up and running.
>
>  * 6 seconds later otg_sm_work starts [A]
>    -> rockchip_usb2phy_otg_sm_work():
>        if (B_IDLE state && VBUS present && ...):
>            schedule_delayed_work(&rport->chg_work [B], 0);
>
>  * immediately the chg_detect_work starts [B]
>    -> rockchip_chg_detect_work():
>        if chg_state is UNDEFINED:
>            if (!rport->suspended):
>                rockchip_usb2phy_power_off() <--- [X]
>
> At [X], the PHY is powered off, causing a disconnection. This quickly
> triggers a new connection and following re-enumeration, but any connectio=
n
> that had been established during the 6 seconds is broken.
>
> The code already checks for !rport->suspended, so add a guard for VBUS as
> well to avoid a disconnection when a cable is connected.

Your commit message was clear but I was missing one key point: what
rport->suspended means. It isn't what I first thought. Instead it means
phy is powered off. Naming is bad but unrelated to your series. Maybe
add a comment to your commit message like the following?

  The code already checks for !rport->suspended (PHY is powered on), ...

> Fixes: 98898f3bc83c ("phy: rockchip-inno-usb2: support otg-port for rk339=
9")
> Closes: https://lore.kernel.org/lkml/20250414185458.7767aabc@booty/
> Co-developed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

I believe there is an issue with your SoB ordering. It is meant to
signal the path's route from author into the kernel tree. In that
sense, it should start with author followed by you as submitter. Then
the maintainer will append its own.

Documentation/process/submitting-patches.rst is semi-explicitly writing
that out:
> Any further SoBs [...] following the author's SoB [...]
https://elixir.bootlin.com/linux/v6.17.9/source/Documentation/process/submi=
tting-patches.rst#L449-L453

One good way to check is that all maintainers always append their SoB
rather than prepend.

With that,

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


