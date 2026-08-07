Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A68FC5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvBLabH+gYeCjXmeaZJWzRhHmO5itOeocUvJaUv2bxI=; b=K5710dUc8kj9dNRCOBogcJE/P2
	mZOm1gVgWpwn5bwtBjRXcamTCYU8jeyfEq3P3jIYkHklWiJ8C+ibQE1KoPbNZF9wwOwobrtu48Ubg
	PoAi/c01PCR+x4c6weL92538y+iDmag1XlrhkZtU8f/SlrREtJ5LcVM49VPvZ+9DFuO7L1fkDPUcR
	b0t3EjZxOS8YR2K20GIEBHRsWm/LNi/76bAlu7/4yBsctYpTGOAqSFTt/KhQMZBsCCJ+F4U37aaSr
	U1hd93+ervICvuAjorq/bjgl2LOPyyjiGCmxiF5Xoo1P1l6GbezP1vhMmDydBoPSSAbnbmZhDoKfd
	yvuD2nqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTLw-00000008pVN-2VFI;
	Fri, 07 Aug 2026 22:47:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTLv-00000008pVH-2Wt8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 22:47:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B43106001A;
	Fri,  7 Aug 2026 22:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445701F000E9;
	Fri,  7 Aug 2026 22:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786142866;
	bh=gvBLabH+gYeCjXmeaZJWzRhHmO5itOeocUvJaUv2bxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G7n/Obi+qKguJL2eOLzNdgfLdfqf4Z5r6c3RtgIH/ZyzX6gq6OcpfnhKYa2BQseMf
	 26y5CXyHWj0QoBuMofdXUvZ6YnWPFXGiHeE8aQoRFtSH/vdrHQhxXBl74YvD5W8LTs
	 sTFZ06J4vMsbS6kZwWhtsSaHeLrOzweQ4SLfb5xsPUbNrKHCUWsh+kdjsHo/3fgt9s
	 U1QabgrAF5nrwMkRWxt6lJBEAiuXauuzPWozhJUA6usmDuJ4yL4vn/pYLkU3nw8MmC
	 XMsoNohyJVsdvyJcnHzBG8BpjyFuMBHS0GtY94w5ImpPGDtfA0ffmQyguR0vtw2hoo
	 vEf+Ka74WBetA==
Date: Fri, 7 Aug 2026 17:47:45 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
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
Message-ID: <20260807224745.GA2180415-robh@kernel.org>
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
> Hi Will & Robin,
> 
> Thank you both for your review feedback.
> 
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

Shrug.

Really, this is why we want SoC specific compatibles so work-arounds can 
be added without DT updates. But we've generally avoided doing that for 
SMMU for whatever reasons. Just make the property clearly sound like a 
mistake, not a feature you might want to use. I'd keep the arm prefix 
just so the next vendor thinks they can't use 'google' and creates the 
same property with their vendor prefix.

Rob

