Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B512DC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 21:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ur6AGZnDWX2UGxSjokXvTfNXVZtXnK2EU3b863xIK78=; b=4l2s6tyTtz8eHI
	M09OEIDArcLZ/Va+EdkEt54S2GmBBQJzlF5mrMPJVDUd5NXOxcjjTR9fVn2w7iGpS++H3919ut7/9
	OjC36zo4R7fvdGDdn2+w8FLzlS1g7lrTsqn1O99TwgAl8CIEI8zmWcBGoG4Oc5yOqIWNwz6m4EeBu
	gvnkFG43+fp1PS1v0++cB/+959VWMF8hVhhVa6+20Pm/1Hw1pZwDJk3IUmf1cgu5Akkm2EH2tPPAr
	3rRdz6pzSlrtan/g/mJBQX5cGFrTtwt4pRy3Ujy6+m7ELDkZsgYy/mFToZKuP54In673jy0+tDtQU
	vmiuCGo9CK1dsA8w2BGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxX1y-0000000E4cj-18E7;
	Fri, 21 Aug 2026 21:44:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxX1x-0000000E4cZ-2QoG;
	Fri, 21 Aug 2026 21:44:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96A2243588;
	Fri, 21 Aug 2026 21:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4661F000E9;
	Fri, 21 Aug 2026 21:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787348644;
	bh=ur6AGZnDWX2UGxSjokXvTfNXVZtXnK2EU3b863xIK78=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=UpX0cTfKcOQvUyaHai+MIupaUrdoTzSoi5ClJOEYlaU6cbfnLOyzzm3B12Gvq4Skl
	 DpqUUnna3Zk3yoAKLSGFonLePnaJnKMrDAoHlYe33p8TM4uy0NqGQ2fhCXelz1dcMD
	 fBarXUzpYNp6NjdaI/SWZBRhubaFQ6zODyeZwN6XnhCEKU/Y5VND4qeVQ4KqgN82WE
	 LhYCcKPNEXGIsHVp71o+8C1A8Ft5zcaljZV1CPdk11Os8yXPI0QXh5XyV7Je86acoQ
	 6fQ1/Sit49v/XpuWEIrsvc7kyWr6GunnlnamWjNHCex8B2ySKew5NjZb1PIbcUNkZ1
	 zQvdYUUatmOxw==
Date: Fri, 21 Aug 2026 16:44:03 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support +
 clock
Message-ID: <20260821214403.GA1015524@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821203639.GA4153689-robh@kernel.org>
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

On Fri, Aug 21, 2026 at 03:36:39PM -0500, Rob Herring wrote:
> On Fri, Aug 14, 2026 at 05:36:38PM -0500, Bjorn Helgaas wrote:
> > On Thu, Aug 06, 2026 at 06:53:30PM +0200, Christian Marangi wrote:
> > > This small series introduce support for 2-lanes mode for Airoha AN7581
> > > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > > normally attached to this SoC that require a 2-line PCIe card to
> > > correctly work (and give the proper performance)
> > > ...
> > 
> > > Christian Marangi (2):
> > >   dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
> > >     2-lanes
> > 
> > This is applied on pci/controller/mediatek-gen3:
> > https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=39f758dc5fbd
> > ("dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
> > 2-lanes")
> 
> As reported by 0-day, this introduces a bunch of warnings and I don't 
> see any .dts fixes (plus the need for fixes indicates a ABI change).
> 
> This should be dropped if dts changes aren't going in in the same cycle.

I dropped pci/controller/mediatek-gen3 for now; we can address this
for v7.4:

  26c53c644350 ("PCI: mediatek-gen3: Add 2-lane mode support for Airoha AN7581")
  39f758dc5fbd ("dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document 2-lanes")


