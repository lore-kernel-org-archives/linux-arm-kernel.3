Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED1CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bk7//rWuTD78HYkajsV0L9vfMvb5OaSe80887owTp8c=; b=q7z9iiSjHqU8bGEhhLLOLhnEs6
	osCsBxp83tDJ5fEUcbbaMr/A+kJW6yqaAXFmSWkTRd/Seot4SHs5WpH25xgEF58csrINoYzz2xPNT
	0Mtx4/MtEzW7lIvv7I4Bqxwhmko16OWMUoxevl8HZwLjvLQ8F4lB/A/WS33tnzo+V7Sm8Q7/xOdiX
	hlDJ9NRXoMWDjaWD8LfazW1iQAOUlxMnXQnWXb24c2uZBnEEI3SivWk0VJa43Sw5CcAHnMbySyFWf
	/u5xybtvR5BPyM2wTdH0nCYVsJA6cGSzpXvSTyNa74mclqZezcie1RBryusyH41I/Bw0VoYaisaGY
	Kl5I7GYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIova-00000007HLJ-3f2l;
	Tue, 11 Nov 2025 14:00:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIovX-00000007HKa-20pS;
	Tue, 11 Nov 2025 14:00:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 317F343B0B;
	Tue, 11 Nov 2025 14:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F89C116D0;
	Tue, 11 Nov 2025 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762869654;
	bh=f2fo/lMwwwTFs05IRMmwp7u2nd3gJMMvyXczqFBKzc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOszoN0EVkDNaWiWT/dOfBVBREwWsaVPDEGgezj7eMzfFJ9X1OoM3t/4ldDkESoI0
	 9vdP4ZBbU1P0o79MbD0CLokJBT4Sh1gjMWlCF/3sNJGOfaaoIbYpd8VN5GaP3Cl5Q0
	 1cjXs4XF7MgSNYKXDpDh0yI7t0wMSXlR06GHCXg2gK0YRozBI/hDD2+SeeAJZM9Yud
	 8qLnNKy86+Ne+HzRkTrRuaYLfL142/T49KYaGGKIbIog7L81ls5n9iI5bT3/GM1LMG
	 JfZomoFK8p5IRHGgHnQELr0Sggxf4YmETL8BhtOim0JVGLBiJNjcLl1ksNgX+rZV1+
	 iIcsfjVsSbScQ==
Date: Tue, 11 Nov 2025 19:30:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?B?V2lsY3p577+9P3NraQ==?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Lin <shawn.lin@rock-chips.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
Message-ID: <admktutwz6542najyyo5vlrci5euqlxnwueaqxixxy7pruqoe5@6qbbejnn5gpb>
References: <20251111105100.869997-8-cassel@kernel.org>
 <aRMZS3EUYx189Xup@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRMZS3EUYx189Xup@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_060055_539797_AD2DB0E0 
X-CRM114-Status: GOOD (  18.98  )
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

On Tue, Nov 11, 2025 at 12:08:59PM +0100, Lukas Wunner wrote:
> On Tue, Nov 11, 2025 at 11:51:00AM +0100, Niklas Cassel wrote:
> > Revert all patches related to pcie-designware Root Complex Link Up IRQ
> > support.
> > 
> > While this fake hotplugging was a nice idea, it has shown that this feature
> > does not handle PCIe switches correctly:
> [...]
> > During the initial scan, PCI core doesn't see the switch and since the Root
> > Port is not hot plug capable, the secondary bus number gets assigned as the
> > subordinate bus number. This means, the PCI core assumes that only one bus
> > will appear behind the Root Port since the Root Port is not hot plug
> > capable.
> > 
> > This works perfectly fine for PCIe endpoints connected to the Root Port,
> > since they don't extend the bus. However, if a PCIe switch is connected,
> > then there is a problem when the downstream busses starts showing up and
> > the PCI core doesn't extend the subordinate bus number after initial scan
> > during boot.
> 
> In principle it is possible to set the is_hotplug_bridge flag on the
> bridge to force allocation of more buses.  We've already got a quirk
> to set the flag on a Conventional PCI bridge whose hotplug capability
> cannot be discovered otherwise (see quirk_hotplug_bridge() in
> drivers/pci/quirks.c).

But here, the bridges are not hotplug capable at all. They do not support the
PCI Hot-Plug Specification. So setting the flag would be incorrect.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

