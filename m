Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F20C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfBlx6Su5IrNrWTwuvKm1AACwg1ryPnRlXyNWRIQY6o=; b=qLLgWMrkB1KQbtD/krUm8gYv7H
	NQoF+SlbtUTCnTC4eEw5QyRXpyA8cAem890Y9bDd56KWIGJbEf2WBNR/yZNUkBEr9g6RkotZu1ebP
	HaVJuC064Lf6FBdM3vpQ05WsZZ0afxst91GpKb0FxYTTKlq4Y4O7jJyMK16nlEeyYeTOqzncn0Rre
	DwtZ1bRy/xXmBP5BP9z7jNOLzY9rTnTRT/3v+h7A6rDUd+w2xOTSUP3IDWF4zZf4zEEkWIjGO5Aim
	C81kXewyoa2xtjHz2Aqs+in2hpWvwDyb2HT0KRyz/oiLT3Dzni4BHTx8J41RIRARqXjVSVg+XaQ9z
	+Enp1SSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXk-0000000Cqhm-0SZO;
	Thu, 03 Jul 2025 23:40:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRrK-0000000Cek8-44Xc;
	Thu, 03 Jul 2025 21:52:48 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751579565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfBlx6Su5IrNrWTwuvKm1AACwg1ryPnRlXyNWRIQY6o=;
	b=l+1wDbtmX5AiOOWEeigcXFhl+t2sTg0fHkUt5qJoqkmSBNRCXEXQXzn4U5Tm2LI/yu7c+U
	XexkvkxZYhwEUaXRifilsiQeAjeM2ZcyBFPslBQh/AV+WCSzGorg9LkFwMExhRslqoeJp8
	O3dT3G9x99c0XqaiDsAIS5SCBB3zcBoQ4ZtaDMeBh+GO2sdqsONGleQB7K5wJUK2ix2SdA
	pRNnB0TQhRJN1mxyeb26CSM92iZW/xIh8UNMII619fFwRx60DDGvjqTEba9PaRXgLHtKm+
	n4fqWlSrHoXXxoPVXsBoDFJrYc0cdF1A8M9zD2YEUQhO1GtDiAu1hYXdx1ojSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751579565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfBlx6Su5IrNrWTwuvKm1AACwg1ryPnRlXyNWRIQY6o=;
	b=dWJYNReIOQ2eB8r/KfLfgDmz4t7V9E3h7DMRPjyZluvj3HLgsHSM3z8I7W5OY/BD31GY2L
	+Lnnu56yF4QvHoDA==
To: Nam Cao <namcao@linutronix.de>, Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Karthikeyan Mitran
 <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?utf-8?Q?Roh=C3=A1?=
 =?utf-8?Q?r?=
 <pali@kernel.org>, "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan
 <jim2101024@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Marek
 Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michal.simek@amd.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Nirmal Patel
 <nirmal.patel@linux.intel.com>, Jonathan Derrick
 <jonathan.derrick@linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org"
 <linux-rpi-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 14/16] PCI: hv: Switch to msi_create_parent_irq_domain()
In-Reply-To: <20250703210056.sDzAytHT@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
 <024f0122314198fe0a42fef01af53e8953a687ec.1750858083.git.namcao@linutronix.de>
 <SN6PR02MB4157A6F9B2ABD3C69CE5B521D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87cyaht595.ffs@tglx>
 <SN6PR02MB41576745C28D8F49081B8E77D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250703210056.sDzAytHT@linutronix.de>
Date: Thu, 03 Jul 2025 23:52:44 +0200
Message-ID: <87qzyxrlg3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_145247_152672_10E46B73 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 03 2025 at 23:00, Nam Cao wrote:
> On Thu, Jul 03, 2025 at 08:15:07PM +0000, Michael Kelley wrote:
>> which is in netdev/net-next.
>
> I need some guidance here. If I make it apply cleanly to linux-next, it
> won't apply to pci tree.
>
> I saw this type of conflict being resolved during merging to Linus's tree.
> Shouldn't we do the same for this case?

There are many ways to skin a cat. See my other reply.

