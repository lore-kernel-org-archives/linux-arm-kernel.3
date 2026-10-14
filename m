Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A0EC3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UosP9kkTOML1KxzD7EFqS7558a32ne/l8IFRfCNRGiI=; b=wa1Dz+XIEfI5C7Ukkc999WsxHe
	bNIsxVzKo6UApbtktali61dSWvEp7+4nqwDIXIGkCizIfTRc1FDVJhLNwRBxWzPytNhsBG4gZLHj4
	IayeZPoFuaj2YQ7GXKUxXgRgzK2rml9egco8+FlYOr4jD40ZnU1Qgi9ZWfL1Y3Upy4QavcO3P1ARN
	izBG2IQRHwwDhVesZEWpgttKDCbZyLLkelxL2Jv8CIdCZKgBE6k2dBDOKmlNvcW07GlZmDRu1dVHr
	2UyPgryhHukdokiTcpiEkD2YSjVg3DB3BNraMshXyW50hlG3fAvBgzpt0lwKXyDXpyxqvk6p6y8zc
	HAqodoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2Yt-0000000G4M6-0N6p;
	Wed, 14 Oct 2026 17:14:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2Yr-0000000G4Lw-2FZX;
	Wed, 14 Oct 2026 17:14:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CB6A4022A;
	Wed, 14 Oct 2026 17:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C69C1F000C4;
	Wed, 14 Oct 2026 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791998081;
	bh=UosP9kkTOML1KxzD7EFqS7558a32ne/l8IFRfCNRGiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KFXwJ7/ehAnJv2ToopZ+B2JhcwuPBVgwHg5Dyk/uBfrcUGwdKvwkcf/6cYQD8uGFq
	 Svifn6lX8osqJc1EIsr+B8HROp85/HpYh9wvwpVfBJmv2/upLNGzta4iWJzlYjUtun
	 GXjxcrMi0p89AHznPmXBAXOro2wsXG04asxdomZeUS4mZ4pjBeY8gmxMUI1RpU/DcJ
	 rg0c5YKSl5/SmcDsLYaGG1lMBqN1ZiKiR5kA9kZNFNrnE3Q3/0Vtbn/WhNdaQG0f3I
	 9dBXbHJZHi0nAr7oh11Di3B3eEiwO6Wa9DENGIfD9gFxVIKFQHYuM3ePcbqMCnzw+g
	 lzrDCJRTd65gg==
Date: Wed, 14 Oct 2026 22:44:32 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 00/13] PCI: brcmstb: Stop using chip numbers for
 conditions
Message-ID: <as-4akoLT9L2c086@debian>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <179197952602.38040.4438252459530233972.b4-ty@b4>
 <CA+-6iNwE935j4wn4BWxs+t1qh3iRtWb0xNjZ-hRS0j-tkLx8=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNwE935j4wn4BWxs+t1qh3iRtWb0xNjZ-hRS0j-tkLx8=w@mail.gmail.com>
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

On Wed, Oct 14, 2026 at 10:45:32AM -0400, Jim Quinlan wrote:
> On Wed, Oct 14, 2026 at 8:05 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> >
> > On Fri, 11 Sep 2026 19:35:25 -0400, Jim Quinlan wrote:
> > > PCI: brcmstb: Stop using chip numbers for conditions
> > >
> > > Much of the brcmstb PCIe driver code does (essentially) this:
> > >
> > >         if (pcie->chip == 0x1234 || pcie->chip == 0x5678) {
> > >                 /* ... */
> > >         }
> > >
> > > [...]
> >
> > Applied, thanks!
> 
> Hi Manivannan,
> 
> I apologize for not submitting a V2 promptly -- I thought that only
> Sashiko was waiting for me :-).
> I have a V2 series, where 10 V1 commits are unchanged, 3 are modified,
> and 5 are new.
> Shall I submit the changed/new commits in a new series since you have
> applied V1?
> 

Yeah, please do!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

