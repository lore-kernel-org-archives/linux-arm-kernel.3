Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC93E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=p1Kkoignyrr80sETDjSCu3E4vA6Ej0aacljRgloDpT4=; b=O3lWjulZ+IgocnjdA4NK9Izywa
	Ml9UpSjOzrLHhCkm+9kgv/6AOVNo5xT+iRWraYcqmJzFiy7Y7EtsTIY8cPIyzbMQrR2SyGffA8Prh
	Qiy1nrB4TsrIAgB/G+CvGlZUlxw9+GEp1ZONbwx/+LbkbQSWtxOONP8Q6SKB7LCZdvbkjQlgh98At
	ZYQhV86Gio/6V0uV/YPHNUUghGlO5dS8LjGPi7ug+ZXz6LYKDIjHUNyEphKAvZIYy59sTZuj75F5i
	3uVq4Vr/dUnsbNM7ODUtXP/koDPzGWP3LJjqbpZ0A6sRZk9vNGJ6ruReBp2y+wnsmP+x7I0qixS+F
	O79M2EMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIkQ-00000006VTJ-0FN3;
	Tue, 07 Jan 2025 23:12:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIfo-00000006UXy-2K1d;
	Tue, 07 Jan 2025 23:07:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F08B95C0FD3;
	Tue,  7 Jan 2025 23:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99020C4CEDF;
	Tue,  7 Jan 2025 23:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736291263;
	bh=qCOsJ/wKHOi3SAkDBRYfIUDYbFC/ozgvyeH4knr/FXA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Lbv4lvYyU3hdnUYszWRuxX22YRUZGI6KXGwtAZ0QayGT7PHOTKKa0IPoqG2EmSchl
	 3Pk0IAVh3ynu5a8qsvbVQP++4PaPE443CgJi9TVTTWGQzlKlrGgvo4osLY/vyk+2Ae
	 s5krWEJBDP+TCUCS1YTlph1APAIQQ61PXi4BCdyPtzWJzAvC2Uta6zK6MzxXxwCr6C
	 EAPGePwBBXgrMCetp9aLHjjMHQgqLXnt1AGjcrr9nInknI5OvElB86o160HIRO2cA/
	 Tngd46xXYTVXCCH2EcaYrvWGXqVztxxk+xxl5jSodUU/D0RvS8VeWoGF49vYkMeQVg
	 1mvrlRa1FVllA==
Date: Tue, 7 Jan 2025 17:07:42 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Xavier Chang =?utf-8?B?KOW8teeNu+aWhyk=?= <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 3/5] PCI: mediatek-gen3: Disable ASPM L0s
Message-ID: <20250107230742.GA189563@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a48feae-f55f-4df8-b165-84c1cb2f6658@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_150744_640329_D65073BA 
X-CRM114-Status: GOOD (  23.50  )
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

On Tue, Jan 07, 2025 at 12:44:43PM +0100, AngeloGioacchino Del Regno wrote:
> Il 07/01/25 03:18, Jianjun Wang (王建军) ha scritto:
> > On Fri, 2025-01-03 at 10:16 +0100, AngeloGioacchino Del Regno wrote:
> > > Il 03/01/25 07:00, Jianjun Wang ha scritto:
> > > > Disable ASPM L0s support because it does not significantly save
> > > > power
> > > > but impacts performance.
> > > 
> > > That may be a good idea but, without numbers to support your
> > > statement, it's a bit
> > > difficult to say.
> > > 
> > > How much power does ASPM L0s save on MediaTek SoCs, in microwatts?
> > > How is the performance impacted, and on which specific device(s) on
> > > the PCIe bus?
> > 
> > It's hard to tell the exact number because it is difficult to measure,
> > and the number of entries into the L0s state may vary even in the same
> > test scenario.
> > 
> > However, we have encountered some compatibility issues when connected
> > with some PCIe EPs, and disabling the L0s can fix it. I think disabling
> > L0s might be the better way, since we usually use L1ss for power-saving
> > when the link is idle.
> 
> To actually decide, we should know what's actually broken, then.
> 
> Is the MediaTek controller broken, or is the device broken?
> So, is it a MTK quirk, or a device quirk?
> 
> If the problem is actually device-related, then this should be handled as
> a device-specific quirk, as not just MediaTek platforms would be affected
> by compatibility issues.
> 
> If the MediaTek PCIe controller is at fault, instead, I agree about just
> disabling L0s at the controller level - but then this shall be mentioned
> in the commit message, and should have a Fixes tag as well.

100% agreed, sorry for repeating what you just said before I finished
reading the thread!

Bjorn

