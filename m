Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6475C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgxsuIMDDXARhsRWgLrILUs/XsyS+TZEtoBBb/RsYm0=; b=yi1g2ICn8q1tfCrz4Y0YdQJy+9
	pz+WpTAVpqpvfrnLl7Agd4R1udF0ZKWtxIuwLPZnx/rItMQIs28BjlxD0BUYCORacWkV+BBwxaLyI
	ER8xYpCVlqT1llC5U2Raiv4TdLmXJSj+ZYquLpucKq+uMP02fOhTwetoocU0++GuNoleQSp/RBjAG
	mJXUALuITsuJ6BMdiBU6LGIhR476mPfC2pjfD9MnzN18m6sSek508gJL58GkoNWcy9e13xh3C/IOm
	tnVfIR6+OQnBdCYEOeT9wHoxBENwRgnbhLhQv5uEIp1hkKGrlInb6fLLzRpmy6mIlUifEvnKPFSNj
	bb3x5rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSZS-0000000Ck9f-42ON;
	Thu, 03 Jul 2025 22:38:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQ5s-0000000CP3y-01A8;
	Thu, 03 Jul 2025 19:59:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751572775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zgxsuIMDDXARhsRWgLrILUs/XsyS+TZEtoBBb/RsYm0=;
	b=FEw4D24yX86GGy1rTWJ6zgH6Tlp5yOHO2h19VrQVJd4soMjXNtcLFhCIhBmDcIfo3afyMj
	GH127yUbXDNuBwtaRHEi3ZdZq1EtVgrFX538bhU2DxEWijBcrYdtsbcPrHNXmmJo9oigK2
	p8tlXD9sQkkbAEVYgixGuE4g/C1C8SERxleQFZ6JK4QAYdSnvoCipiRlj9XG1+zgC+PcYi
	P1+WPyUM/DcSNaeacoqIXzqO0l/JuCUlWJVgJtqJD9sBqQW82ryw/C9BjBZLTQ2Ex85h76
	JpECmRlt2nY9d/HdGO8XKDQWVUSZHBMUUcyw4iSOA9qF3eLPWuCRcbf7lfETnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751572775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zgxsuIMDDXARhsRWgLrILUs/XsyS+TZEtoBBb/RsYm0=;
	b=gcOi8AamD60gBuSLM6+XBj7cc6BNGHuWvnQ0nejzuIxbahpVhbP1ZuQex8HvkFndFkmXZR
	hOi5o2qE1taW8LDw==
To: Michael Kelley <mhklinux@outlook.com>, Nam Cao <namcao@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
In-Reply-To: <SN6PR02MB4157A6F9B2ABD3C69CE5B521D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <cover.1750858083.git.namcao@linutronix.de>
 <024f0122314198fe0a42fef01af53e8953a687ec.1750858083.git.namcao@linutronix.de>
 <SN6PR02MB4157A6F9B2ABD3C69CE5B521D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
Date: Thu, 03 Jul 2025 21:59:34 +0200
Message-ID: <87cyaht595.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_125940_184641_28275323 
X-CRM114-Status: GOOD (  16.96  )
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

On Thu, Jul 03 2025 at 17:41, Michael Kelley wrote:
> From: Nam Cao <namcao@linutronix.de> Sent: Thursday, June 26, 2025 7:48 AM
>> 
>> Move away from the legacy MSI domain setup, switch to use
>> msi_create_parent_irq_domain().
>
> From a build standpoint, this patch does not apply cleanly to
> linux-next20250630. See also an issue below where a needed irq
> function isn't exported.

Does it conflict against the PCI tree?

> At runtime, I've done basic smoke testing on an x86 VM in the Azure
> cloud that has a Mellanox NIC VF and two NVMe devices as PCI devices.
> So far everything looks good. But I'm still doing additional testing, and
> I want to also test on an ARM64 VM. Please give me another day or two
> to be completely satisfied.

Sure.
>> +static void hv_pcie_domain_free(struct irq_domain *d, unsigned int virq, unsigned int nr_irqs)
>> +{
>> +	struct msi_domain_info *info = d->host_data;
>> +
>> +	for (int i = 0; i < nr_irqs; i++)
>> +		hv_msi_free(d, info, virq + i);
>> +
>> +	irq_domain_free_irqs_top(d, virq, nr_irqs);
>
> This code can be built as a module, so irq_domain_free_irqs_top() needs to be
> exported, which it currently is not.

Nam, can you please create a seperate patch, which exports this and take
care of the conflict?

Thanks,

        tglx

