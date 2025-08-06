Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4AAC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=g9PQ/sp6KKPyStekp1Uy2DsIXXCH8jL99vsXOTuF8n4=; b=txTfTJOY1a1orC
	UcBoACXjjACRTQrnBT1QRc9W9ycHIBiVTd5/WSSU8+tTdF14G3hNoNgQhUpUtsKXRw2Zt5Da+c9Vj
	uYZeIUIJ3Jxdr+pS+65bgAHGKHwb8wnLRYUV8M8JN7ywLnODuQts+/GanorvZb2GUy+L2JWzsmuC6
	b2DnnYsUl5wt73Fmzw9Zk8CUPlKF6XFFF21d4yIzJOrRN6Uv4b6bZVdIrcXlyhQLQmGvcGWJbiHdJ
	r31pZdzxqM1k3LSf5jvS89X3537Fi25oNZous1nwvtcgcgLdcgIr5Av8wd4OekT+310vvDM9FlR4n
	UZrcESDYBvgnBrFZlgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiyH-0000000G5IO-2hhO;
	Wed, 06 Aug 2025 18:34:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujig1-0000000G2ZR-0K8g;
	Wed, 06 Aug 2025 18:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=g9PQ/sp6KKPyStekp1Uy2DsIXXCH8jL99vsXOTuF8n4=; b=kMdzp+S4TvoKx2ptalIODKhCdt
	Vt//HBXqlWT46PkDSj6z+tLX6Tde54SENnQWhUvOKCgEoNY6vuwNjAP4VpdHj1YXvSUP3bIE7Yqia
	mHAI247nNSMqN0+NKXd7F3vf1tUskRU2bA+68WanELpTrm8BD457HJY8SapqLYeHM34DN6azLSmDa
	bZtbLEOA2M6TKTh5r3A63wD4KmmVopb5RC+v6of3YdqbS/smQMehmsUKqQylA0354Z8oPicCjlvbN
	rd1JnpPWmyzQvDh3yMF823vdCKtXxPX8mXgfdmx5VcOk9fCapXXigZ+xLHkwxtA2vT7eZYIDVl6xK
	TmRZ2gNg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujify-0000000EMnv-0PPP;
	Wed, 06 Aug 2025 18:15:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB27C440F7;
	Wed,  6 Aug 2025 18:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9517DC4CEE7;
	Wed,  6 Aug 2025 18:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754504141;
	bh=YenbEi95ht30tqGvYsUcW/iuqIr6ntv4AaPCVyIWjKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Kh1E9NLODFAYRkV2jJl5UxGQfHDp/VYvJz9snIu0KlC0BLt45MtiIGlWUlg8Qh62u
	 6v3Ytq11UOaCtwfAYSaWFqGSlrL54FeA8j2dPXj95qsvG72tuD1RdmR6PUI0XPLdcz
	 asbLfqDGi1KMwYVQf4lzcGSH18It7/7cqgn9XFkSwbTMtUXpL7Gt8nxItWVsfE/u7R
	 zI5TskldXNQ02Jlin6O7hiv1H2umRdvwTYjzLTQ9plWAsLTGunj3/ALSlp0XLY1UgR
	 joRyNNz3NntvTIXKqzZevfDiMhwmLD3t1SdydA7AAnU0eZ6fpFpNRD0foYPuLIFn3c
	 Rzf/Upj23IbKw==
Date: Wed, 6 Aug 2025 13:15:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] PCI: brcmstb: Add panic/die handler to driver
Message-ID: <20250806181540.GA8692@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613220843.698227-3-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_191546_432720_4A3CD9A1 
X-CRM114-Status: GOOD (  13.29  )
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

On Fri, Jun 13, 2025 at 06:08:43PM -0400, Jim Quinlan wrote:
> Whereas most PCIe HW returns 0xffffffff on illegal accesses and the like,
> by default Broadcom's STB PCIe controller effects an abort.  Some SoCs --
> 7216 and its descendants -- have new HW that identifies error details.

What's the long term plan for this?  This abort is a huge problem that
we're seeing across arm64 platforms.  Forcing a panic and reboot for
every uncorrectable error is pretty hard to deal with.

Is there a plan to someday recover from these aborts?  Or change the
hardware so it can at least be configured to return ~0 data after
logging the error in the hardware registers?

> This simple handler determines if the PCIe controller was the cause of the
> abort and if so, prints out diagnostic info.  Unfortunately, an abort still
> occurs.
> 
> Care is taken to read the error registers only when the PCIe bridge is
> active and the PCIe registers are acceptable.  Otherwise, a "die" event
> caused by something other than the PCIe could cause an abort if the PCIe
> "die" handler tried to access registers when the bridge is off.

Checking whether the bridge is active is a "mostly-works" situation
since it's always racy.

> Example error output:
>   brcm-pcie 8b20000.pcie: Error: Mem Acc: 32bit, Read, @0x38000000
>   brcm-pcie 8b20000.pcie:  Type: TO=0 Abt=0 UnspReq=1 AccDsble=0 BadAddr=0

