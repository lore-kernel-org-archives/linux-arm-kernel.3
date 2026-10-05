Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85ACCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OT4fTCBzl6ea0tdPBPkwmD3TW36PNhwwmU38PY2NoAw=; b=38h1Z/ULDAoSjRsPSwQ8JplBr9
	F8my4523cBmEKqlSjQItaG7clcFkwN/vBUiqKIlkbKPmDW5Na/aYeKMWiZNMfSuNStseLh/iXTfla
	zaZktv6Zd7zSANcfLQ7Brp3qeekFuEivVji7I3SfJJl8ghMk5HSy4D3YGook6od7Qu2FmDevgqw9x
	nUDSuxGgxqvAh2bDFW+mbKla1H6iRY+3xhRr7P46FFq78XrTmQV1zEKHigodCqLbD8kqYYy4HWi06
	0sfs0kfh4nFo6k0asPs5FJzT2akAA7XJ6TYJNFGOqb+zfvvuEEq9qHLT+1Slmhn6n/HpHzyEaYi+x
	MjK+RYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeFJ-0000000FuI9-1U6c;
	Mon, 05 Oct 2026 08:40:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeFI-0000000FuI2-2g3J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:40:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CF8A4092E;
	Mon,  5 Oct 2026 08:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424981F000FF;
	Mon,  5 Oct 2026 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791189628;
	bh=OT4fTCBzl6ea0tdPBPkwmD3TW36PNhwwmU38PY2NoAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e6+39s7dojdpn57bOln9SdDj77kq3GXuRYOEc4Gm39fJlu+B2J/ZduPGUzr2efObT
	 ZJCz5CLam8qehPkkIiHWC9jzLo3mbRxMAiB0RJeUV+4ZL9MYllSjQTLYPwROymbka+
	 /A9UrZ086Z+ROMSV2wwSGb42pHPwLLGNQN42B+Q2AyiweuXbm6yNToUbPIVFDfWnrZ
	 5pUNCRKMbaMq/gwluzf4zY6NOH6phd+zrdxfjBwHun7aTaj8N3zCnHhNq/l8/qwmkJ
	 /shnVG5aWIu8LPx3Ht11qTeruxeOAxBd60wsX7qutlSBYYeZohg7Ka92o6+vKGC4QD
	 d1dHjZyOZkTqw==
Date: Mon, 5 Oct 2026 01:40:17 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-efi@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [RFC 00/12] arm64: Add support for TLBI domains
Message-ID: <asNicWUtP4v1ti19@kernel.org>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
 <87mrsu3gql.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mrsu3gql.wl-maz@kernel.org>
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

Hey,

On Sat, Oct 03, 2026 at 05:12:50PM +0100, Marc Zyngier wrote:
> Hi Kristina,
> 
> On Thu, 01 Oct 2026 12:06:43 +0100,
> Kristina Martšenko <kristina.martsenko@arm.com> wrote:
> 
> [...]
> 
> >   * It's also possible to use TLBI domains to limit a KVM guest's TLB
> >     invalidations to CPUs where the guest has run. I'll try to include that in
> >     the next version. This series only disables domains for guests.
> 
> My take on this is that just like MPAM, it makes little sense to
> expose this to guests. As long as the L0 hypervisor has the means that
> to scope TLBIs to the relevant domains (subset of CPUs to start with,
> but hopefully SMMUs eventually), we're good.

Err... I think TLBID is quite useful in a VM and unlike MPAM should
actually be virtualizable.

Think of a case where a VM spans multiple chiplets, the VMM will likely
affine vCPU threads to a particular chiplet and present a virtual
topology to the guest. If those underlying chiplets map to TLBI domains
then it seems beneficial to expose virtual domains to the guest.

Even for VMs that fit within a single domain, you'll still need VMM
participation to scope the virtual domain correctly and affine the vCPU
threads appropriately.

I don't think this needs to happen as part of the initial enablement, no
issues with hiding the feature for now. We can revisit the topic later
how the feature is expected to work for KVM.

Thanks,
Oliver

