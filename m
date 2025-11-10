Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5803CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVFaf8sEXNFtXFfauM+GPT9QQM5aXDcG/Czx3sxbGcU=; b=HzVv8a7xr+TM6aAY2Oc6Uq+2R0
	1aM8w7LwanUwiSo07A6tElreezB64LrzBKbDz6+CpiurA4dPzhKpXUiU5Dk6wwI9uH4ZLMKVEQjHD
	LtEg2/iDfW1v3DyeZ1hjf0YzwWRixD+fA+s4PpiOkiu5G2nUeXk1cVnpQM7I5Uc+BfAFDEptKvMBB
	kDmSvFiLX9R+DaPZnotBisvv1ucZNQEaZ94ilBNvQdMvU+TL0v9jW0yt6DVKt+JXGuUS/AO3MJ3+1
	KpDyk/aTwqbkuFVnbPWalGgWDPr4jWe0W38XChajW3jVKFV8G3qg5DQ8EtuiVF8KH8LkqSI7VWc1x
	SEQpJfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISlJ-00000005ZEp-3AKF;
	Mon, 10 Nov 2025 14:20:53 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISlG-00000005ZDp-37fj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:20:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F0508C108F4;
	Mon, 10 Nov 2025 14:20:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68A04606F5;
	Mon, 10 Nov 2025 14:20:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E61FD1037176A;
	Mon, 10 Nov 2025 15:20:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762784447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qVFaf8sEXNFtXFfauM+GPT9QQM5aXDcG/Czx3sxbGcU=;
	b=qyBPhK5xijkVBYuiiiJ93gWfLswu+waOMsjs3SOjZANMNDIQ7dh6H74pyiv33ltRLImsXY
	L8ykDqoj2g9FFeqf32XNfFN7S8MbWEcZstyw6CchbLqTVxlrzV5Z69IhRZ1TUnJvsW0W5w
	A6wcK2zSRoqE74UM9t+IETbFJk6irUl8F6hc51fOx/+KSdYGntxtgkJvQUz8Fpxhy5Pewb
	GYnafd+rpnIVhnNyvIjIQzX8EU0ix3JMs1Pntz7DZoJYnTiflv0c4yybR1+Wl3cjX1CupL
	u3IdlhKacvYjwzIFrNLY1sJ2WIbOdZSS0+bR6NGdXAt4SB3//6DerOIqB3MI6g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Josua Mayer <josua@solid-run.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rabeeh
 Khoury <rabeeh@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>, Jon Nettleton
 <jon@solid-run.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/2] clk: mvebu: cp110 add CLK_IGNORE_UNUSED to
 pcie_x10, pcie_x11 & pcie_x4
In-Reply-To: <481bf79f-0cec-498f-9827-f4c6dfd6c14e@solid-run.com>
References: <20251030-cn913x-pci-clk-v1-0-e034d5903df1@solid-run.com>
 <20251030-cn913x-pci-clk-v1-2-e034d5903df1@solid-run.com>
 <05d450d8-8df9-490f-ac53-3f45544f1c29@lunn.ch>
 <481bf79f-0cec-498f-9827-f4c6dfd6c14e@solid-run.com>
Date: Mon, 10 Nov 2025 15:20:45 +0100
Message-ID: <87ldkermte.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_062050_933942_F93DC7AF 
X-CRM114-Status: GOOD (  12.37  )
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

Josua Mayer <josua@solid-run.com> writes:

> I missed a colon in the subject line "cp110:",
> should I roll v2 for this?

it is up to the clock maintainer.

>
> Am 30.10.25 um 16:33 schrieb Andrew Lunn:
>> On Thu, Oct 30, 2025 at 04:16:26PM +0100, Josua Mayer wrote:
>>> CP110 based platforms rely on the bootloader for pci port
>>> initialization.
>>> TF-A actively prevents non-uboot re-configuration of pci lanes, and many
>>> boards do not have software control over the pci card reset.
>>>
>>> If a pci port had link at boot-time and the clock is stopped at a later
>>> point, the link fails and can not be recovered.
>>>
>>> PCI controller driver probe - and by extension ownership of a driver for
>>> the pci clocks - may be delayed especially on large modular kernels,
>>> causing the clock core to start disabling unused clocks.
>>>
>>> Add the CLK_IGNORE_UNUSED flag to the three pci port's clocks to ensure
>>> they are not stopped before the pci controller driver has taken
>>> ownership and tested for an existing link.
>>>
>>> This fixes failed pci link detection when controller driver probes late,
>>> e.g. with arm64 defconfig and CONFIG_PHY_MVEBU_CP110_COMPHY=3Dm.
>> Seems like a reasonable compromise, given that TF-A could be classed
>> as broken. This must also prevent suspend/resume powering off PCI
>> devices, and then reconnecting them on resume.
> Currently pcie-armada8k (unlike e.g. pci-imx6) does not currently define
> any dev_pm_ops - so we should be safe from any power-management.
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>


Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


>>
>>     Andrew

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

