Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71785C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81HmvwHeiUSGmL4dZb3PXIm6QmppJrUMFGfEmXnv22o=; b=qH77wLnPtbUfQWPz4/uaVm/649
	gAHK4rRulpnpyQ8y1ISSTpFuIjS1HblANKx8jlvUsfjHJHCSqhrw/dk5fRCdijYlr7kgzSIwJmgBV
	f1R4YWyuKDHaND7/gaUMBgtTcsfJ2aW22F4anosAupBA5m0DsBLlCu2ZeygAoszfO2ajc9FAmfypy
	/c6TKx6/A16FIrQwBSwKtjQNOaU7XMn3gbCNNs8y4CzXn6hLnCz1n/WP7ZUfN1VCLjUEKOnZhzPLF
	mTlp7bQU0ZKoQpIu4QT3g4845zdCMkjdwyTYM1lQDBIgyz+8zPZJWKMig0h3PYBRkdREqPhBvxOF6
	gr6tjFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLdM-0000000BmSC-0Zgg;
	Thu, 03 Jul 2025 15:13:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJxz-0000000BURZ-16fK;
	Thu, 03 Jul 2025 13:27:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751549225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=81HmvwHeiUSGmL4dZb3PXIm6QmppJrUMFGfEmXnv22o=;
	b=uMJoD7xyJM4mpWpwx8uMkF61D3OSN7oknYYGpiM0XpxjAGlSQvf0htdfvIiG4r3WneeMP7
	Iwx1xMt5aW5GeNFBIL0350ThYSJ5LQM/YLRnBt48879KJ2A37O82tISh6pIK8BLjtnamr/
	rD94AjqQGVuFCVR2tJkO8l7Q/B0kt2v0fYdEV+lEx7VkqnVpIycWHJu6bE0M/ZHrjWOQIn
	m/sf/quPagJMSw0dZVkdD47v/DqaTXVg71kmM2kQbiOw13Zmgc6UvLAOJFCVPGASfpyoX+
	3Fohow0L/hJmKlIo/c5A9GOoaqoJAWjEHx8tO55Nkv/4O9hFvtb943kFp3zjkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751549225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=81HmvwHeiUSGmL4dZb3PXIm6QmppJrUMFGfEmXnv22o=;
	b=UMsmDlmo/89Km8xvhCIeKLe46rLrXMtkmUwJpQ03b0vjvL81Vo7JWNr+Fqtj9RRiktPFYy
	vOYoRbBu4vYfvyAQ==
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Karthikeyan
 Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, "K . Y . Srinivasan"
 <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>, Jim
 Quinlan <jim2101024@gmail.com>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Marek Vasut
 <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michal.simek@amd.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Nirmal Patel
 <nirmal.patel@linux.intel.com>, Jonathan Derrick
 <jonathan.derrick@linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 10/16] PCI: xilinx-xdma: Switch to
 msi_create_parent_irq_domain()
In-Reply-To: <b4620dc1808f217a69d0ae50700ffa12ffd657eb.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
 <b4620dc1808f217a69d0ae50700ffa12ffd657eb.1750858083.git.namcao@linutronix.de>
Date: Thu, 03 Jul 2025 15:27:04 +0200
Message-ID: <87ldp5v1zr.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_062707_445941_5CB1DBED 
X-CRM114-Status: UNSURE (   5.20  )
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

On Thu, Jun 26 2025 at 16:48, Nam Cao wrote:

> Move away from the legacy MSI domain setup, switch to use
> msi_create_parent_irq_domain().
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

