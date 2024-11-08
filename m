Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A13D64071
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=o3GmnO+sdxpxkWyzxkZySK1Anbr8T70yB22RZlofMuA=; b=qexwRbQUdOQt8k30J78eJtyQlG
	btVrMln/pUFFtDLXkwiTYLafogyKzM5fnf2gCnKyAZqFS0Qc1+LreymlbnncSF3iEz3X6xao4jjwD
	G5hGKm5oB9C0G4Xt/YjDTlrG62L8QV1StIPWw3LKoiTFQYbUtC3JbydzhorSMpVJ8YEcKiHwrFDog
	sVK6ksAgr5knYazDWcuRKNZXoJogSJeO15SpM98VSADl7c5yGquauoW06yOsBhIOuyCMAF8LLLekk
	jYAJlhtvkIz0Xx3J0o+QmqLtbzS67c9QxQ4sDwHJI3wVcebsrLbYVG/VmO6kr5/Ea5x/U4uk3QqDy
	nTarHfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SVI-0000000BKf1-1eOy;
	Fri, 08 Nov 2024 17:10:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9S9j-0000000BIDl-3TSe;
	Fri, 08 Nov 2024 16:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54FAEA4412B;
	Fri,  8 Nov 2024 16:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A047C4CECD;
	Fri,  8 Nov 2024 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731084498;
	bh=bnVD4rkav0ZeJAD/SxnELzRm/Vojs5RiuAQetQRIYCs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qk/tmd9mcQG4lWwgAX57d6FU5ML7M9ZoN4zGzHdNSiH9DpKLUdKRJoWcwIewIFViD
	 zoIOt0nEWdYBLLSrffXGrmVcv8wJkPiRRzawF36VcF08hSeXPVGQfxw4v6STCdJ2hM
	 ZV/eEG71LZcbRn1Zda2sJEvqo7/h9dR6GSmlAqTyzCvkpIyJ+nRYYTqp5sTTE1FGv0
	 fVRXvXmSMzYX3RQzm+izX291G1oVTc4pI20yChu3CJj1MlwiJOtDeOPsmfaRo4QX5V
	 MenF1ypuQgWslaNy2mXmI5zbbN5cidSS3GIYDxIIruqbjaVMFzsVAm8vMid4yA+WlE
	 O16mBfgm6azwQ==
Date: Fri, 8 Nov 2024 10:48:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "lorenzo@kernel.org" <lorenzo@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <20241108164817.GA1665283@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <547216d36f8eaa313690ff8b52407ae46b8e9c40.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_084819_968044_9CE1631A 
X-CRM114-Status: GOOD (  17.02  )
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

On Fri, Nov 08, 2024 at 02:51:15AM +0000, Jianjun Wang (王建军) wrote:
> On Thu, 2024-11-07 at 10:21 -0600, Bjorn Helgaas wrote:
> > On Thu, Nov 07, 2024 at 05:08:55PM +0100, Lorenzo Bianconi wrote:
> > > > On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> > > > > In order to make the code more readable, move phy and mac
> > > > > reset lines assert/de-assert configuration in .power_up
> > > > > callback (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
> > > 
> > > ...
> > > > Is there a requirement that the PHY and MAC reset ordering be
> > > > different for EN7581 vs other chips?
> > > > 
> > > > EN7581:
> > > > 
> > > >   assert PHY reset
> > > >   assert MAC reset
> > > >   power on PHY
> > > >   deassert PHY reset
> > > >   deassert MAC reset
> > > > 
> > > > others:
> > > > 
> > > >   assert PHY reset
> > > >   assert MAC reset
> > > >   deassert PHY reset
> > > >   power on PHY
> > > >   deassert MAC reset
> > > > 
> > > > Is there one order that would work for both?
> > > 
> > > EN7581 requires to run phy_init()/phy_power_on() before deassert
> > > PHY reset lines.
> > 
> > And the other chips require the PHY power-on to be *after*
> > deasserting PHY reset?
> 
> For MediaTek's chips, the reset will clear all register values and
> reset the hardware state. Therefore, we can only initialize and
> power-on the MAC and PHY after deasserting their resets.

OK, it sounds like you're saying the Airoha EN7581 is not a MediaTek
chip and does require a different ordering of PHY reset deassert and
PHY power-on:

  - EN7581 requires PHY power-on before PHY reset deassert,

  - other chips require PHY reset deassert before PHY power-on.

That's fine and probably worth a short comment in
mtk_pcie_en7581_power_up(), e.g., "Unlike the MediaTek controllers,
the Airoha EN7581 requires PHY power-on before PHY reset deassert".

Bjorn

