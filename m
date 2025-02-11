Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC55C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C23Gwwkn7m1Wdwav9p34gnuQqrDiAzm3UcBEGEmFUh0=; b=RzUxQWTK0B7+qc+sVJgYYRM1xa
	yryNExtfk4U3EQyHoFNjJT88uqXltU4UgSMuCOAopkx6deK/BKNXaqPOwQmV8aa3tIItGm35NMsnK
	v3eZWKliboAHQzGyQCPhD5S9wm11Y2gej/TTbR2HEdeU7N4O5TpJt4WOUxWUuDtNqni2C4D1eXjQP
	Fq7Ss8LWppsDu80JueNBU2WG7Tl8p1tMroXDClpN2axqRjQUGrFFfLz6xH5kC1KwDtF3eRAu2PhuX
	l+hszpTDH59o2jXeAA7Lrm7riOMl8K+drChOan58gLzzobDvPYXY54A4JyLxepPz5REBU4t97Plhq
	1kiQcpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsTq-00000004M04-0D7S;
	Tue, 11 Feb 2025 15:47:22 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsSN-00000004LO3-3RcW;
	Tue, 11 Feb 2025 15:45:53 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 50D1635353;
	Tue, 11 Feb 2025 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739280628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C23Gwwkn7m1Wdwav9p34gnuQqrDiAzm3UcBEGEmFUh0=;
	b=F2unZw7G8aguyoj/n2LjlG1oaHG8LPWWa8jgBjJqM+RuaqrhZi5VGv2xCXiiT5Ss/Ml0Ts
	O54ks37bGh0wkaiAw3eTUAgIgG1G2dKdjKXED/toW8ns+VQ/dseMTWyJeNBt3sXTu+NqV4
	J4qyIilZuZMQmGQIi4NFAZN02Xdh3/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739280628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C23Gwwkn7m1Wdwav9p34gnuQqrDiAzm3UcBEGEmFUh0=;
	b=/E8DrGDJ7w/U26RXWQV2J3Hir2AvbD69OWCrorjvdSGGAw4xZ3mRwhBthVYARewb5EkM7E
	LXQRKZkVENd0zEBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739280628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C23Gwwkn7m1Wdwav9p34gnuQqrDiAzm3UcBEGEmFUh0=;
	b=F2unZw7G8aguyoj/n2LjlG1oaHG8LPWWa8jgBjJqM+RuaqrhZi5VGv2xCXiiT5Ss/Ml0Ts
	O54ks37bGh0wkaiAw3eTUAgIgG1G2dKdjKXED/toW8ns+VQ/dseMTWyJeNBt3sXTu+NqV4
	J4qyIilZuZMQmGQIi4NFAZN02Xdh3/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739280628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C23Gwwkn7m1Wdwav9p34gnuQqrDiAzm3UcBEGEmFUh0=;
	b=/E8DrGDJ7w/U26RXWQV2J3Hir2AvbD69OWCrorjvdSGGAw4xZ3mRwhBthVYARewb5EkM7E
	LXQRKZkVENd0zEBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BC6613AA6;
	Tue, 11 Feb 2025 13:30:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rjLlC/NQq2exOQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 11 Feb 2025 13:30:27 +0000
Message-ID: <a74f5917-af94-42a1-9a7a-dd449d34dbfc@suse.de>
Date: Tue, 11 Feb 2025 15:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 00/11] Add PCIe support for bcm2712
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250120130119.671119-1-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,broadcom.com,gmail.com,linux.com,pengutronix.de,suse.com,raspberrypi.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074552_020414_47749C38 
X-CRM114-Status: GOOD (  19.42  )
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

Hi Bjorn,

Do I need to send a new version with the collected Acked/Reviewed tags?

Thanks,
~Stan

On 1/20/25 3:01 PM, Stanimir Varbanov wrote:
> Here is v5 of the series which aims to add support for PCIe on bcm2712 SoC
> used by RPi5. Previous v4 can be found at [1].
> 
> Based the series on linux-next because of vc4 gpu node in bcm2712.dtsi.
> 
> v4 -> v5 changes include:
>  - Addressed comments to interrupt-controller driver. (Thomas)
>  - Fixed DTB warnings  broadcom/bcm2712-rpi-5-b.dtb.
>  - New patch in the series to fix missing of_node_put.
>  - New patch to make a softdep to a MIP MSI-X driver.
>  - Dropped the patch which adds MSI-X support in pcie-brcmstb driver,
>    and instead use DT dma-ranges to pass the needed information. (Jim)
> 
> For more detailed info check patches.
> 
> Comments are welcome!
> ~Stan
> 
> [1] https://patchwork.kernel.org/project/linux-pci/cover/20241025124515.14066-1-svarbanov@suse.de/
> 
> Stanimir Varbanov (11):
>   dt-bindings: interrupt-controller: Add bcm2712 MSI-X DT bindings
>   dt-bindings: PCI: brcmstb: Update bindings for PCIe on bcm2712
>   irqchip: Add Broadcom bcm2712 MSI-X interrupt controller
>   PCI: brcmstb: Reuse config structure
>   PCI: brcmstb: Expand inbound window size up to 64GB
>   PCI: brcmstb: Add bcm2712 support
>   PCI: brcmstb: Adjust PHY PLL setup to use a 54MHz input refclk
>   PCI: brcmstb: Adding a softdep to MIP MSI-X driver
>   PCI: brcmstb: Fix for missing of_node_put
>   arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
>   arm64: dts: broadcom: bcm2712-rpi-5-b: Enable PCIe DT nodes
> 
>  .../brcm,bcm2712-msix.yaml                    |  60 ++++
>  .../bindings/pci/brcm,stb-pcie.yaml           |   6 +-
>  .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |   8 +
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 147 +++++++++
>  drivers/irqchip/Kconfig                       |  16 +
>  drivers/irqchip/Makefile                      |   1 +
>  drivers/irqchip/irq-bcm2712-mip.c             | 292 ++++++++++++++++++
>  drivers/pci/controller/pcie-brcmstb.c         | 147 ++++++---
>  8 files changed, 632 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2712-msix.yaml
>  create mode 100644 drivers/irqchip/irq-bcm2712-mip.c
> 


