Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D852ACA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 06:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMXP+3HOcHF428TlVrg2cs9+rmnJKLTevmDSSnYryBQ=; b=ITpBTHUsYLuNTR30y6llwbjBts
	vkbs+ucvn0ehMPJ+DzHhlkYe+XKyGvu85PmpVMDxraySyIhgueGZToxCDL+bNi1/pIIAkHUUxWXWO
	LRrfJaJbVSlrBa0M8YVrKc8PsZN7QRh2V4ovEo+FL8LvNz7mOqr5c0yOe8fV5BR+2oZ711c3WH+cG
	Mm70VEz5bnYBYmvbmgmDee6NWEIYTQzv4esruND4LDfwys0JpqWSGmFx98vTa8BnfRpnfWiWBK7xO
	j2/Bzwkxp2r6ol6yIxP9ir9pRoGvag1tsS2IwpdVrvYvGulcVhnapcuy9HoBC8saGmcZDYgHr01zx
	DKOXU0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcD5-0000000Fj30-0mnu;
	Mon, 05 Oct 2026 06:30:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcD3-0000000Fj2k-1ShY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 06:30:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71BE56022B;
	Mon,  5 Oct 2026 06:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E65B1F00893;
	Mon,  5 Oct 2026 06:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791181800;
	bh=NMXP+3HOcHF428TlVrg2cs9+rmnJKLTevmDSSnYryBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gFHs0RI0vQiYN70xLjJK6AIYAhKscdvLrr5shld7PhX2KZychrY1pspfUyGMIyjgR
	 mbkFt9Cb7WMu6rmV0YK7D6FB1RqQpIwcnjbvH/a8zwzdISBXeDxfcPXSds6DBbys25
	 UPDLmNmI5IR8DhAvnAxyD7B0lABLUqOm8rN5+XVq/cKEJprw7em17Xe35a7kBMxQnj
	 2nIkE+qQq91I2LBKt5owi+zYqepp7uqZU1R5dNPMIPeduKfGwHtf9JvyuvaHBtbPLX
	 oSWkiCiwB41mvjZxskSm+7HDZWrGWb6aVcllIiebe2luvrsOd4VQUN7q9UO4HkfmtL
	 EZb5je/2vyG6w==
Date: Mon, 5 Oct 2026 07:29:51 +0100
From: Will Deacon <will@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-efi@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <asND3-Wnb2hiDAop@willie-the-truck>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
 <DLW95E2XWSVT.8W90FW4WG6K8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLW95E2XWSVT.8W90FW4WG6K8@nvidia.com>
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

Historically, maintaining mm_cpumask() was a horrible source of contention
when we looked at it in the past. Maybe that's no longer true, but it
would be good to see some numbers if we want to start keeping that thing
accurate on arm64.

Will

