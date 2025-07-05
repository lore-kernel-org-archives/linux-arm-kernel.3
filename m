Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7170C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7gL8dYOn6HntTdoNOII9WcyvTWhgCfl9lUbpV4BSls=; b=e4Kro1LRhrVJUmN7Cgoe06h70k
	XBjDygEo/iX3E7FIulypLmKTBpnxuAKEECZR6OYWs2NSqnQzCzL2CO+c8diSBJDqMt28hUvgCtgLo
	W5ATJeRHOBeBiIjy3nXKbwwazsqRFmBbEelpawU8SmRiDtok7COGY9IV6LMZMq8slnzIK1dwMbLXL
	q0r0Rcaas1DMkUgI5cT4/VB7VZhy7hU5dGWRKpnSu8wXuN6qvXz1SYE4V9I00RrXyHqbPLA72S0Z+
	Viieti9V3nEyqmSHQtXe4dQklQ8lpR/sdWlI4AjeQ/ubtkduQZ6gvAQxq0uF584HorIyIdQLoENJA
	Vcvb1Dnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXzlA-0000000GNiF-0F49;
	Sat, 05 Jul 2025 10:04:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXzio-0000000GNDc-3s8L;
	Sat, 05 Jul 2025 10:02:16 +0000
Date: Sat, 5 Jul 2025 12:02:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751709733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7gL8dYOn6HntTdoNOII9WcyvTWhgCfl9lUbpV4BSls=;
	b=QryWv1kobeUtwnxLuKJ37S6P8dABaWh9TKOGc6zMPDghXt2id9g6pM+FYsMis+ZKJBTVnj
	dlnc4u4f0GfCPVtSF6CbPb8KTJ8TBAw6gTF8p7KtEjpgbZfG/Tp238Kt2oVG/JiK4Yv86d
	TmK8kxBOghlbVe7uwkQvgmpIZn1AeKVkyRDP1L1qDIwY+BB6JWJJGMCn4E86xhKLJLfqIZ
	2rHlzbD3g/DlC3hbV2SaFJ2hywtVHkcbGf7F7HvL6X4DZPT5+w7iWsEv258XUOom/m6Av1
	sDJJaJgZmk27zMD1f/rKLs3Mr2NJu0tT+SUkxrBrdJJ7iMCZz1C2qtat2oJVrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751709733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7gL8dYOn6HntTdoNOII9WcyvTWhgCfl9lUbpV4BSls=;
	b=rNYWzMQyLXhzp3rk6oAdNJ4riQJleM33X757xJJVV0sKCPdsOXDWifHu++6mf5hqn28UWl
	IO/D0kVyNb7D4FAQ==
From: Nam Cao <namcao@linutronix.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 14/16] PCI: hv: Switch to msi_create_parent_irq_domain()
Message-ID: <20250705100211.8Lcszko3@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
 <024f0122314198fe0a42fef01af53e8953a687ec.1750858083.git.namcao@linutronix.de>
 <SN6PR02MB41571145B5ECA505CDA6BD90D44DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250705094655.sEu3KWbJ@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705094655.sEu3KWbJ@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_030215_100263_719F40A4 
X-CRM114-Status: GOOD (  11.85  )
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

On Sat, Jul 05, 2025 at 11:46:59AM +0200, Nam Cao wrote:
> On Sat, Jul 05, 2025 at 03:51:48AM +0000, Michael Kelley wrote:
> > From: Nam Cao <namcao@linutronix.de> Sent: Thursday, June 26, 2025 7:48 AM
> > > 
> > > Move away from the legacy MSI domain setup, switch to use
> > > msi_create_parent_irq_domain().
> > 
> > With the additional tweak to this patch that you supplied separately,
> > everything in my testing on both x86 and arm64 seems to work OK. So
> > that's all good.
>
> Thanks so much for examining the patch,

Btw, you probably would also be interested in
https://lore.kernel.org/lkml/cover.1751277765.git.namcao@linutronix.de/

which does a similar conversion for the other hyperv driver.

Nam

