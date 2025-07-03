Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C19EC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuSfHDCBdrHLll9p6MJyRsE2HoBAkIn29Et99Ze6jio=; b=DD8Qyd7qic4eiFkQWT0db3AAN8
	YlwoZHhewi4vRYJx/UWQF2y5E+V+Y5M1aMjKbfiyw8cmPRtcP+nQmlZK78CFrr3o//GlTqn/jzZWa
	ZQh2GYMMkrpZFqwmYNtuJcNTFuuC7GWn/zA3lczmLfW9Od12J9y5UJNJna/b96+wx5AwACS8UjuNt
	CdgAci5g7QMriDr7UfXm7qZYLMipsixxGD4q9leE3XiVmhXB2I3UY58TH5Y2bkaz6fWqgX6YcUopv
	OdmcQ++BOyF6C+idF9E0GsKm4De7Xq8mpfNOxLjoaGvUTkzNvxuwavzTVx9d7dRTo4JCVJcakI6x6
	11DY35hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXj-0000000CqhK-039Q;
	Thu, 03 Jul 2025 23:40:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRNK-0000000Cbkp-2sQT;
	Thu, 03 Jul 2025 21:21:48 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751577705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IuSfHDCBdrHLll9p6MJyRsE2HoBAkIn29Et99Ze6jio=;
	b=IYFrFYQO1tfIhbWjskMeQI3itoJRVBQPFIp4KWK/W9o2gLiFMGY1NsFToYDsjlvCKSiKHo
	H2S4Qu1mRNSIt3K3en8Fh1k0EUCNuiIQJaqguEEqYDN0eXSMkVU4zsEn5aS0o20XQrSoUf
	VVyJfxNZz6//D3xUnzWPRP/Dp/prbUDboTms9jp+MIO+uSt89tu1tJp9LJtuC14NEgOaQN
	1yGyOAagwpTVosMu3JunoyyswO9/WeIV2NloYE8HhIgb3bCR/Fimti4aZo4pCwA3LLOMjb
	hZ4JjzeQKhS3AD3KbXyzmYIuJREaDa0ph/YnxVF60rigy3hMwNijBHtxkTXxoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751577705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IuSfHDCBdrHLll9p6MJyRsE2HoBAkIn29Et99Ze6jio=;
	b=bWaXK53cGighMH1SvpiRBNIK5QAIv7RA0O/M2RZwhs34n1vzCdNAXb5cYJ922PNXjSOsGq
	qbgroTxaCeSOdKCQ==
To: Michael Kelley <mhklinux@outlook.com>, Nam Cao <namcao@linutronix.de>,
 Marc
 Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Karthikeyan Mitran
 <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?utf-8?Q?Roh=C3=A1r?=
 <pali@kernel.org>, "K
 . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan
 <jim2101024@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Marek Vasut
 <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
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
Subject: RE: [PATCH 14/16] PCI: hv: Switch to msi_create_parent_irq_domain()
In-Reply-To: <SN6PR02MB41576745C28D8F49081B8E77D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <cover.1750858083.git.namcao@linutronix.de>
 <024f0122314198fe0a42fef01af53e8953a687ec.1750858083.git.namcao@linutronix.de>
 <SN6PR02MB4157A6F9B2ABD3C69CE5B521D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87cyaht595.ffs@tglx>
 <SN6PR02MB41576745C28D8F49081B8E77D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
Date: Thu, 03 Jul 2025 23:21:44 +0200
Message-ID: <87zfdlrmvr.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_142146_866610_E6AA0EB2 
X-CRM114-Status: UNSURE (   9.96  )
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

On Thu, Jul 03 2025 at 20:15, Michael Kelley wrote:
> From: Thomas Gleixner <tglx@linutronix.de> Sent: Thursday, July 3, 2025 1:00 PM
>> Does it conflict against the PCI tree?
>
> There's no conflict in the "next" or "for-linus" tags in
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/.
>
> The conflict is with Patch 2 of this series:
>
> https://lore.kernel.org/linux-hyperv/1749650984-9193-1-git-send-email-shradhagupta@linux.microsoft.com/
>
> which is in netdev/net-next.

That's a trivial one. There are two ways to handle it:

  1) Take it through the PCI tree and provide a conflict resolution for
     linux-next and later for Linus as reference.

  2) Route it through the net-next tree with an updated patch.

As there are no further dependencies (aside of the missing export which
is needed anyway) it's obvious to pick #2 as it creates the least
headaches. Assumed that the PCI folks have no objections.

Michael, as you have resolved the conflict already, can you please
either take care of it yourself or provide the resolution here as
reference for Nam?

Thanks,

        tglx

