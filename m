Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0437BC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBOhBVWA2iJlN/jrlTTjbw0KVjEZC6FA+Ov+Aj8ZBxo=; b=OxYAs8rbwTiErgAMc+LEhYhudH
	7nb6FKuRY10b5c6Oq9DyajP9YCC+Jqy+1HFFl/fAXblCbKT+zjT+6V/hhf6iFa2P5lfkcUOcVZdPZ
	eXAdyelnMCdCuTqd6tlVywkt8rV2lqiBlMNbXn+KfoMadR1Hnmdg8qdHd2xA3+3y14nuZa6jDtclE
	tlz30/3SG3RypdyCrkhzOJ27hOYhAanUQWkaOUrKSe1x4iff3uZ5kKdEi/F54LHYaQyS0dYcF16EP
	JmH+uyl5DQ/pfDoNphGpLvQHqMQoiDbYD1Xx+OF3sE95UnWbbsSV5oIPGBr7NSkuNzOUEP7xUlO2+
	uaWw+S3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4o9-00000001H5D-3OuP;
	Thu, 07 Aug 2025 17:53:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4la-00000001GqT-3rwy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 17:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C97A545BE8;
	Thu,  7 Aug 2025 17:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE72C4CEEB;
	Thu,  7 Aug 2025 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754589061;
	bh=TVtbE9kVJdMS2hhy+Qd4ctRjeI4jf6YH6bnt9QQv+rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcJ1w67zQ3hkBcXpfn9hT64Dv+mNegPMjPBOfjeCZdr97PvQTnC+3hGuaCvttgiS5
	 nvckqJuQE2UfnQIWROUiu9gpH3kzrRymSK0g4reXzzEo3w4Vj9IpDj2skQN7HWIBjm
	 c1GG4oqePnI2Zl2f3gp0h/Lo3gtqaJRn3dJgAIqybANnLVpqpTiiIpMWFX84q2rw+3
	 XgV1zKPcgscXM9dWWA5r7fUmj+l32acTytAaCJJzKd+a6secrHImxk1LqEO+BgKs/a
	 F8I384W5gcl/uz99ywXsx80EM7ROEnDJ0aK/jI1/F+fy6ruYlTpTlsDCz2QOGW/AaO
	 OjMhkP1QII2mg==
Date: Thu, 7 Aug 2025 10:50:59 -0700
From: Drew Fustini <fustini@kernel.org>
To: James Morse <james.morse@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com, bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com, baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
Subject: Re: [RFC PATCH 13/36] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
Message-ID: <aJTng8R9eJmGR6/W@x1>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-14-james.morse@arm.com>
 <aIIiazUK4S_G6loe@arm.com>
 <6a77726d-1881-4590-8021-623c877bb5d7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a77726d-1881-4590-8021-623c877bb5d7@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_105103_012793_C759995D 
X-CRM114-Status: GOOD (  29.22  )
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

On Wed, Aug 06, 2025 at 07:04:09PM +0100, James Morse wrote:
> Hi Catalin,
> 
> On 24/07/2025 13:09, Catalin Marinas wrote:
> > On Fri, Jul 11, 2025 at 06:36:25PM +0000, James Morse wrote:
> >> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
> >> only be accessible from those CPUs, and they may not be online.
> >> Touching the hardware early is pointless as MPAM can't be used until
> >> the system-wide common values for num_partid and num_pmg have been
> >> discovered.
> >>
> >> Start with driver probe/remove and mapping the MSC.
> 
> >>  arch/arm64/Kconfig                          |   1 +
> >>  drivers/platform/arm64/Kconfig              |   1 +
> >>  drivers/platform/arm64/Makefile             |   1 +
> >>  drivers/platform/arm64/mpam/Kconfig         |  10 +
> >>  drivers/platform/arm64/mpam/Makefile        |   4 +
> >>  drivers/platform/arm64/mpam/mpam_devices.c  | 336 ++++++++++++++++++++
> >>  drivers/platform/arm64/mpam/mpam_internal.h |  62 ++++
> >>  7 files changed, 415 insertions(+)
> >>  create mode 100644 drivers/platform/arm64/mpam/Kconfig
> >>  create mode 100644 drivers/platform/arm64/mpam/Makefile
> >>  create mode 100644 drivers/platform/arm64/mpam/mpam_devices.c
> >>  create mode 100644 drivers/platform/arm64/mpam/mpam_internal.h
> 
> > Bikeshedding: why not drivers/resctrl to match fs/resctrl? We wouldn't
> > need the previous patch either to move the arm64 platform drivers.
> 
> Initially because I don't see any other architecture having an MMIO interface to this
> stuff, and didn't want a 'top level' driver directory for a single driver. But, re-reading
> RISC-Vs CBQRI[0] it turns out that theirs is memory mapped...

Yeah, all the cpus (e.g. harts) can access all the registers of the QoS
controllers per the CBQRI spec [1].

The memory map for the example SoC in the proof-of-concept [2]:

  Base addr  Size
  0x4820000  4KB  Cluster 0 L2 cache controller
  0x4821000  4KB  Cluster 1 L2 cache controller
  0x4828000  4KB  Memory controller 0
  0x4829000  4KB  Memory controller 1
  0X482a000  4KB  Memory controller 2
  0X482b000  4KB  Shared LLC cache controller

> > I'm not an expert on resctrl but the MPAM code looks more like a backend
> > for the resctrl support, so it makes more sense to do as we did for
> > other drivers like irqchip, iommu.
> 
> Only because there are many irqchip or iommu. I'm not a fan of drivers/mpam, but
> drivers/resctrl would suit RISC-V too. (I'll check with Drew)

I think that is reasonable. In the proof-of-concept, I had the following
structure, but I think there is a lot of room for improvement. 

arch/riscv/kernel/qos/qos_resctrl.c
 Implementation of the register interface described in the CBQRI spec
 along with the resctrl implementation. I should probably break this up
 into separate files for the CBQRI operations and the resctrl interface.

drivers/soc/foobar/foobar_cbqri_cache.c
  DT-based driver for SoC cache controller that implements CBQRI

drivers/soc/foobar/foobar_cbqri_memory.c
  DT-based driver for SoC memory controller that implements CBQRI

With all the great upstream progress, I've been meaning to rebase the
RISC-V CBQRI support and post an RFC as its been a really long time.
There is no public silicon yet that implements CBQRI but I think the
possibility is getting closer. I've also been working on integrating
ACPI support [3] using the new RQSC table, and I've been meaning to post
an RFC for that too.

Thanks,
Drew

[1] https://github.com/riscv-non-isa/riscv-cbqri/releases/download/v1.0/riscv-cbqri.pdf
[2] https://lore.kernel.org/linux-riscv/20230419111111.477118-1-dfustini@baylibre.com/
[3] https://lf-rise.atlassian.net/wiki/spaces/HOME/pages/433291272/ACPI+RQSC+Proof+of+Concept

