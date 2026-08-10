Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B73C5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNphFLM05yBRL8WBm/rrLX217O6iCzF2GGZWAhKPQx8=; b=tShq+54TLnMxTT/qDhhWm3m4ZR
	L6Rson0Od8HuRDEKjyYxCbt8yMMef8M6zlMkEQrMepEbLhHEu/iGu6pYb8RGjtNbkh20qeq8oW71P
	MDx++KVgQY+vm0GEpmC5acwxeheW8BzvK/uXBi74R46AJQv+rLBYJ4m8o6wQLey3VWE50sGkNrKZ4
	DvLdRBalxfnvWqmioG5FZyROMPb83r30v/jo9DFb39RYKtMYpwzHgUj076RenYPAIqkcGH64sW8Kc
	xhXFfryEt6GqGo7l1WvQ2fMSKMBsYbafAPA+Be/MBDGZq8TxAMbgb8D60HPVOkszmT0mA6LKca3ov
	6yMO61Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNkS-0000000BYz6-0fyb;
	Mon, 10 Aug 2026 11:00:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNkR-0000000BYz0-0tnR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:00:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B18B2401B7;
	Mon, 10 Aug 2026 11:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F7D1F00A3A;
	Mon, 10 Aug 2026 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786359650;
	bh=FNphFLM05yBRL8WBm/rrLX217O6iCzF2GGZWAhKPQx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ylca9X/gtVXqX6sXxYQe9AvCIz9T7mKMej/LYPLQwoTchrrXcdQzdcMiqXkYKwvzB
	 7ehAwtZgnXAaFUOwkhhAcWSD/xcNz2J9Z4f5PPP+rIS5B+Dr8efyAALFzowvvdnwDr
	 tZrmElbU8NQGEXtJjlT3y+MfrLmSwXNkgPj83A0xx3+89sGxLu5LJiyjUj/89qIG1+
	 YpMdceUdPn4krDsUP5cglw2G6hryn8v1nukFulprAcIxDXOMiJQaGsZZtUs4EJWpjW
	 oqqODAf7q0Fk60LLLiiHZVzap7TqwhWm171QyU+FqeIuPKTL6Cxj8MemNBz+oZHls+
	 WXv31URfx9AVw==
Date: Mon, 10 Aug 2026 12:00:43 +0100
From: Will Deacon <will@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, willmcvicker@google.com,
	jyescas@google.com
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override
 feature
Message-ID: <anmvW1LkypAGW6Sc@willie-the-truck>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck>
 <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
 <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
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

On Fri, Aug 07, 2026 at 04:25:11PM +0100, Peter Griffin wrote:
> On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 26/07/2026 2:16 pm, Will Deacon wrote:
> > > On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
> > >> These two patches add support for a new "arm,instdata-override" DT property
> > >> that enables the override of the instruction/data attribute of incoming
> > >> traffic to Data by setting the INSTCFG override bits.
> > >>
> > >> It is intended to be specified when the smmu can't guarantee that these
> > >> attributes are provided correctly from the client device.
> > >
> > > This is going to need an in-tree user and a much more detailed
> > > description of what is being worked around before we consider this for
> > > inclusion.
> 
> Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
> yet for Laguna SoC which adds the smmu nodes and this property because
> 1) I want to land the initial SoC/board DT first
> 2) I want agreement on the DT property name. Currently I used
> "arm,instdata-override" which is what downstream used. However, since
> this is intended to work around silicon errata something like
> "google,lga-instcfg-data-override" might be more appropriate?
> 
> For Laguna SoC the first in-tree user of this is the amb_smmu smmu
> instance which is used by the Synopsis dwc3 IP. The Laguna dwc3 glue
> driver is already upstream at drivers/usb/dwc3/dwc3-google.c
> 
> > >
> > > In particular, if a particular client is emitting data reads as
> > > instructions, then a better work around would be to avoid mapping its
> > > domains using IOMMU_NOEXEC. But I can't tell what's going on from the
> > > limited description provided here.
> >
> > Unless it's also emitting the privileged bit and thus falling foul of
> > the implicit Unpriv-W -> Priv-XN rule, but then we also have the means
> > to deal with devices which actually do that themselves (hello pl330...),
> > so that would seemingly only leave the case of some innocent piece of
> > AMBA-interfaced IP which doesn't expect to need special attributes, but
> > the system integrator has gone out of their way to tie the AxPROT bits
> > to some wacky value, which I would put in "erratum workaround" territory.
> >
> 
> You're correct Robin. It is an erratum workaround for the Laguna SoC
> due to some custom usage of the AxPROT bits which differs from the
> standard ARM SMMU handling for Privileged/Unprivileged and
> Instruction/Data transaction attributes. The effect is all
> transactions appear to the SMMU as "Privileged Instruction" accesses.

Ah, so this sounds like what Robin was worried about.

> The software workaround in this series enables the SMMU's INSTCFG
> override feature to ignore the incoming value and treat all SMMU
> transactions as "Data".
> 
> One small clarification: in the cover letter I incorrectly said this
> was set only for some SMMU IP instances, but that is incorrect. It is
> actually set on *all* arm-smmu-v3 IP instances in the Laguna SoC.
> 
> Does the above provide the additional detail you need Will?

So it sounds like using the instcfg override on this hardware still breaks
IOMMU_PRIV and IOMMU_NOEXEC:

  1. If you don't pass IOMMU_PRIV, you still get privileged transactions
  2. If you don't pass IOMMU_NOEXEC, you do not get execute permission

Is that correct?

Perhaps it would be better to override PRIVCFG to force unprivileged,
then reject IOMMU_PRIV and ignore IOMMU_NOEXEC?

Will

