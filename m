Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A661ACA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXNS36CeUPKXmNC/8m878DvTmvUfv9rRTJEnohEfsJ0=; b=oAzO6+D//4nnL71v2+0tFxb442
	0pE8RVWOSAwNSbd9Eg+u1nc9tDCDLFefyWYt9WiZaqOSDIBa5TZQ1JrtlskapCobneuMhl9XH0zAt
	AlmQz8rx356JdIR4RmAM6ltEBy9bH0QpK/DbqIMcnU3hFXljqht8wkKRpYByFRV5ZvR5K9OWpXFjM
	D/6VkWNZuvskhePKW9Gt6YNqt3QWCncjSs2NUuInEv+UYT1Vh/uA65KgXrsIpnmk3T/3chNWO3PPB
	4Gf/0S51rtNHCUvoiMI9Ia/OoADj79J9NMwdGPINQve2ep3v1H+UW+7DMVtY4X2wX01Y94FrXUhdy
	FjtVcyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgY8-0000000GJ3E-0uV4;
	Mon, 05 Oct 2026 11:08:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgY1-0000000GJ20-0FvQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:08:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81EA2152B;
	Mon,  5 Oct 2026 04:07:49 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F9B13F86F;
	Mon,  5 Oct 2026 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791198472; bh=OstHisGp7P6hgz4/0D89NdgTFhwBoAjGYPB++ZUdrsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huznAKYddU0oZFKAUlCcQ1STeT/7wXvr3I03BhqGvib3xpajTRxhfLH9R4n0xbL3S
	 kIEIw7UozOwAKAYis3taxahTMvipmp7uuojl2U657r8N7zaBJ5NTsf4aP8uJ8+p+Rb
	 BYYgwF3ME4VdyiRufVFi72RJCpQxDxT6c94/F8TA=
Date: Mon, 5 Oct 2026 12:07:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-efi@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-mm@kvack.org
Subject: Re: [RFC 00/12] arm64: Add support for TLBI domains
Message-ID: <asOE8NSHH3Jnv7AJ@arm.com>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
 <DLW95E2XWSVT.8W90FW4WG6K8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLW95E2XWSVT.8W90FW4WG6K8@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040757_140812_AFE3913F 
X-CRM114-Status: GOOD (  19.19  )
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

On Sun, Oct 04, 2026 at 02:06:48PM -0400, Zi Yan wrote:
> On Thu Oct 1, 2026 at 7:06 AM EDT, Kristina Martšenko wrote:
> > This series allows the kernel to use TLBI domains. TLBI domains (FEAT_TLBID) is
> > an Arm architecture feature that enables a TLB invalidation to target a subset
> > of CPUs instead of the whole system. It can improve performance on systems with
> > many CPUs. TLBID is not yet part of the Arm Architecture Reference Manual but
> > some of it is described in the latest XML [1].
> >
> > The goal of this series is to send TLBI commands only to the CPUs where a
> > process has run (i.e. where its page tables have been installed). The last
> 
> IIUC, mm_cpumask() is used to store this information on x86 and other
> archs. I see you put this information in tlbid_domains of mm_context_t
> from patch 9, although in the form of tlb id domains. I wonder why not
> make arm64 also update mm_cpumask() like x86 and other archs and derive
> the tlbid domains based on mm_cpumask() and a cpu-to-domain mapping
> (added in patch 7).

One reason is that it's cheaper to compute the tlbi domains at context
switch time (bitmap-and IIRC) than working from mm_cpumask() every time
we do a TLBI.

That said, suggestions for a quick algorithm are welcome. Subject to the
race conditions Will mentioned, we could use the mm_cpumask() for a
quick check if we ever ran on that CPU and avoid recomputing the tlbi
domains.

-- 
Catalin

