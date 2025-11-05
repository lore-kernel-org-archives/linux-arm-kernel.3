Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC22CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLaE+coW8iQvWs9DFaPWmc1/BtPrNgQSYqVTfqyMrC4=; b=fdXCrV+14LinwCgx5+CcFSshd4
	4V0Dqm7lHnA1sdCqlci2mTR5PjUUudQYM0/DNC3kkLdQYamPh2gmmERQFwAfjndr4hcUw7qyhk0an
	LNF8EQDV0I3U/FPqqBuQyhvj50NiNK1vZl6pSfPymY+U0a5354GHNJd6lUQe8DZjooJumrZfzguh2
	iCGJUTnrn+9tiM3lApcBreBTRqONLUAbjiD1i27bk7N2bFW9FT32utMYBb71qzLuQdyjs5Buh//oZ
	GrGIvYq07spf4LwQLiKNIcq2IpN5Qqc7j3qHwO8MGCoG9106xYiaBPXG9I7qYOE/Nv6nDBWYPnwRs
	nRBWtrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGakR-0000000DTGE-1pzW;
	Wed, 05 Nov 2025 10:28:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGakP-0000000DTFg-0AAO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 10:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C31044074;
	Wed,  5 Nov 2025 10:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271F4C4CEF8;
	Wed,  5 Nov 2025 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762338491;
	bh=sATlqbfCMquHAhiGt98UAjhO81tc66fm/b5s3xZ+bT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aVk2cw91xb3rYUDPFcGEtjuOOgvOL7LPdFKi9Ek3C8A3pJKShz5NSz1ygG7990U70
	 5MKPxs/CwWggCZ4NBUoVASSOYENYZskX4+KO9mC8L1RewpnSZj56X8WFBZDNFPpUfy
	 YCNph4JFxwP9Up1f+JrWSvK82fQiSY22vGOxTCP6iLTvLpbHlddw5Nn4D6qLqZDe18
	 A0Oj6TSleOyym73rw53E1sx7OYY8l/oHNN3z842GkfoKpnsiK0i2CxbV/gyf2DmldO
	 cFy/IYkMMWOVXppMcDDu5pu2Fn3ak95UF3m2BmecxYlu57lWhbPod+Xmu+3QfoThOH
	 18Og5nj9EJS4w==
Date: Wed, 5 Nov 2025 11:28:04 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, chester62515@gmail.com,
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com,
	bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <aQsmtKsTEmf7e7Sd@ryzen>
References: <20251022174309.1180931-4-vincent.guittot@linaro.org>
 <20251022190402.GA1262472@bhelgaas>
 <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_022813_094058_FB9BAB6B 
X-CRM114-Status: GOOD (  15.59  )
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

On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > +     dw_pcie_dbi_ro_wr_en(pci);
> > > +
> > > +     val = dw_pcie_readl_dbi(pci, PCIE_PORT_FORCE);
> > > +     val |= PORT_FORCE_DO_DESKEW_FOR_SRIS;
> > > +     dw_pcie_writel_dbi(pci, PCIE_PORT_FORCE, val);
> > > +
> > > +     /*
> > > +      * Set max payload supported, 256 bytes and
> > > +      * relaxed ordering.
> > > +      */
> > > +     val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> > > +     val &= ~(PCI_EXP_DEVCTL_RELAX_EN |
> > > +              PCI_EXP_DEVCTL_PAYLOAD |
> > > +              PCI_EXP_DEVCTL_READRQ);
> > > +     val |= PCI_EXP_DEVCTL_RELAX_EN |
> > > +            PCI_EXP_DEVCTL_PAYLOAD_256B |
> > > +            PCI_EXP_DEVCTL_READRQ_256B;
> > > +     dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
> >
> > MPS and relaxed ordering should be configured by the PCI core.  Is
> > there some s32g-specific restriction about these?
> 
> I will check with the team why they did that

Most likely, the reason is that, the PCI core does not set the MPS to the
maximum supported MPS for the root port.

So without that change, the port will use use 128B instead of 256B.

I assume that you should be able to drop (at least the MPS part) if this
change gets accepted:
https://lore.kernel.org/linux-pci/20251104165125.174168-1-18255117159@163.com/


Kind regards,
Niklas

