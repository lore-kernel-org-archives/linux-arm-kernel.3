Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 07:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	References:Subject:To:From:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Mime-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tynbRCJNvJhi67ydy0W9gjWps9spqKy6/S2sdJUz3bA=; b=WB2jdADsHPIy1FzennCDqnuSp3
	vfiY8iHelokDVJFFMpNde0WCXW+lHf4MXqWF90CKU7NZgnwP4SMzoNL0/KgK0wIOFjyxzAiKMl5L+
	LJGoN+8Ho4wOh/TNboEGlNp7HgLDONXdEWzPXUI1k8oMGM72o/Bamn0vM7iyDslGal5mpimfhSafD
	L7dUohofKlV2IekB4SSO4EGe83AZPoH83h36z0kck+Y6/BbPusHO2n13ZpQRcHgVyqEzBTPXZpP9k
	ZJYDeLpEWaFPRe4QbMLjMwC/tkBwFTRawb0y0FboEZcPtkChH/QAgsLbD0aDeTHU8pJeHXwOWGsiy
	jvp92CsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5st-0000000AEmN-0IUg;
	Thu, 06 Mar 2025 07:43:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5rH-0000000AEbD-1Bhv;
	Thu, 06 Mar 2025 07:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:References:Subject:To:From:
	Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=tynbRCJNvJhi67ydy0W9gjWps9spqKy6/S2sdJUz3bA=; b=qKVUULZe36WBiiRdZ/SQbipIHr
	WvDiWUadt51HMvTf+SARj9sL/pjD8LG/cB4C2DSNbyAx6JWZYK2DUCCgzLTZh/0s0xrd6AqBPge3y
	rEoSSyFbcKNZ68+TkVx/WlAFWLS7Gx00j4Wcj9VXvmXi/I+ZqsYK32C1M8QbHHAMBjDLXtM74+ICh
	zIrcrBVLrWpeD4WxTF7fk2uoqgL2i160Y1KjJqIKhrmSTQQU8a/rvikPTTU7mz8TyFYdeXpUNBcwO
	dwCCYeYK1LVWXbir+wSnuYjmuea28IkApO89bYCbv8VxkX6WGwpPipoaB9ZToyq+W2/Udhlv7HhWX
	hI41hrxw==;
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5rE-0000000717x-1n1z;
	Thu, 06 Mar 2025 07:41:30 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A0115287;
	Thu,  6 Mar 2025 08:41:17 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Mar 2025 08:41:17 +0100
Message-Id: <D890I4EPARNO.O0VS9VZUL6IR@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <Manikandan.M@microchip.com>, <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
X-Mailer: aerc 0.16.0
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
 <87ikonydym.fsf@bootlin.com>
 <84b1def7-fba7-4f29-a49b-d117efe26d26@microchip.com>
In-Reply-To: <84b1def7-fba7-4f29-a49b-d117efe26d26@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_074128_505475_93102E4E 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, vigneshr@ti.com, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, richard@nod.at, claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Varshini.Rajendran@microchip.com, krzk+dt@kernel.org, pratyush@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> >> From: Varshini Rajendran <varshini.rajendran@microchip.com>
> >>
> >> EUI identifier and the MAC Address of the Ethernet Interface is stored
> >> after the SFDP table of contents starting at address 0x260 in the
> >> QSPI memory.
> >> Register the entire SFDP region read by the spi-nor (nor->sfdp) into t=
he
> >> NVMEM framework and read the MAC Address when requested using the nvme=
m
> >> properties in the DT by the net drivers.
> >>
> >> In kernel the Ethernet MAC address relied on U-Boot env variables or
> >> generated a random address, which posed challenges for boards without
> >> on-board EEPROMs or with multiple Ethernet ports.
> >> This change ensures consistent and reliable MAC address retrieval from=
 QSPI,
> >> benefiting boards like the sama5d29 curiosity and sam9x75 curiosity.
> >=20
> > Do you mean spi-nor have a programmable area in their SFDP table? Isn't
> > this supposed to be a read-only area written once in factory?
> >=20
> The SST26VF064BEUI serial quad flash memory is programmed at the factory=
=20
> with a globally unique address stored in the SFDP vendor
> parameter table and it is permanently write-protected.

Why didn't you mention that this is a vendor table in the commit
message?

Anyway, please write proper support in the core for parsing vendor
tables and exposing them as a nvmem device if needed (and asked to
do so by the driver of course).

-michael

