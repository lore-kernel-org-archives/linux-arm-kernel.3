Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06CCC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TRg4LaK6NixUNgoD8Z3iZoWX9CdGYyQqUDBLKmNPXk=; b=RWKtsuw8xKsBahjCZ8BcJoGadI
	7qT3H6epAM0q1y4c5zT4R4Y1QHo2mQjxg5saFctkR5b+Q2vhKbbfD3zjgsx0x46PkOM+O7ogguPqY
	nfDTmjkiBCEkqHwJoieKrEmIJjNgEaOYj+VQMxJ4hjdw40lj4JZuWfVlfSLtctWfeQfwB6y/hr2KS
	mqi5uCuUKHEwCJfzZB53+XAF5lg9etAaUVy8p/Q6vAIp5zQLSdTcOSX1r0svH7uU9vml/elYb7Q4P
	GZAIgKigpL9l5t97ivOUxBbcQvKfxBmKfkx+rDq1T0zRQ3Af1BLjWTja7Qzdyk1sIywyN6LFJTFZs
	rJGwB4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n13-0000000F70U-0FXT;
	Wed, 02 Sep 2026 15:36:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n11-0000000F6z1-2UJF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:36:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D921A600D0;
	Wed,  2 Sep 2026 15:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238F41F000E9;
	Wed,  2 Sep 2026 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788363402;
	bh=0TRg4LaK6NixUNgoD8Z3iZoWX9CdGYyQqUDBLKmNPXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QylaVxbS+g9l7ebe4a++AKnZ7Td4NBUuMdPvjTFp71Ro/u9oq4XmG80tBfvB5R16e
	 wwPqI72LaEihtmsNBa+JDs5DtTmV5odePW0x9H3Wj1njJIbYp20wZCNDBCk+rnyVsO
	 7c3GRPzwAJk6LLn+FsYtv3Ozel3KIUI7M0eqEnGfDSBTJYfIYFNZLiAWJotJJCQ5Fk
	 ISAc6FEIbmOILKgQQ9zYdtsybx2Qtetazj2A7Sb1bc5Eo73rdeVAXYcI+crC7BEGRD
	 hOd0sphSFBOUeasdXUkcRB60lVCCfr9D33oGtjcGsSkGeRqgLnlhSfEqB1BtlIg4or
	 bA8frFpvi3XkQ==
Date: Wed, 2 Sep 2026 17:36:24 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michal Gorlas <michal.gorlas@9elements.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
Message-ID: <gayg4xafgxcog7f7jy2i2e3wctds3do2ytttgv74f3y6ed7qtg@mr3xfxugjfeh>
References: <20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com>
 <178835947957.88571.7553170178358028044.b4-ty@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178835947957.88571.7553170178358028044.b4-ty@b4>
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

On Wed, Sep 02, 2026 at 04:31:19PM +0200, Manivannan Sadhasivam wrote:
> 
> On Thu, 27 Aug 2026 18:51:00 +0200, Michal Gorlas wrote:
> > Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
> > states for devicetree platforms"), ASPM states are force enabled
> > on all devicetree platforms. This causes PCI devices on some i.MX SoCs
> > (for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
> > though CLKREQ# is not supported (and consequently supports-clkreq is
> > not set in pcie controller node of their DT), which causes the device to
> > never wake up from L1.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is supported
>       commit: 94420d27973f567e5c10b631115ea8b9abc0172e
> 

I dropped this patch now as I completely missed that this patch incorrectly
assumed that ASPM L1 is controlled by the 'supports-clkreq' property. This
property is supposed to be used only for ASPM L1ss where REFCLK would be cut
off.

As Krishna explained in v3 [1], you should use 'aspm,no-l1' property in DT and
use it to disable ASPM L1.

- Mani

[1] https://lore.kernel.org/linux-pci/aabc3dbd-3e5b-4272-807f-f0743606e25a@oss.qualcomm.com/

-- 
மணிவண்ணன் சதாசிவம்

