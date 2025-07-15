Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34C4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaOChWUNRKzVe+X4GW98eQLGNRW55y8WDZFeORkO8Uo=; b=0UBw+SyaHgObj7WEiU0//0PGZ3
	50IpyO+fDa7wNwG5O78tKWPEpqkN6OdtwTHitX7Mw9pn2jv/eLeC60MlVsntH9tZ10eAQv0TBbvbB
	Su//VTRunPAMnbcdCvkBvN75MWqqZzbjtmDGwG+Gs+PbUoUQOd331oH+2m3hZtNVzQ+tLUdNImYik
	CCi2PX7p9BdPuBe5S7xiC48VMIKgMF+d/BjBfj8twERc55g4W6bNMkm0iM6zY4rR52gO58LzxH22W
	ZvvaWXmHqRB/Vn76FKtJYmouO4mzR3KCipzvSP52qnXxhzGLqlKzX2yjYl+dxQAbJJFRcoHEXjuu8
	+EggM2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiSU-00000005jzD-2P1q;
	Tue, 15 Jul 2025 16:24:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh6u-00000005UL2-2kdA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Jul 2025 14:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xaOChWUNRKzVe+X4GW98eQLGNRW55y8WDZFeORkO8Uo=; b=Fzk81WDCFjazfGo20JWDWDbxlJ
	vCmrHmGeT9swIoIWz+ZsxkFDYlYQG1vxSFl2zgaAyK6B+L5rJlMdEfkWjuATOW85fxlQ64FCp+Gly
	za75WGnqYtodjBF14lH5D8eamau/AQqHCRNdw1b8C30INI0UsCvm98e/YPw8hWKgyVhEkj1NPpN0g
	Qfwv8awcT0U3ritsuENBYgxY+I4IN6wVOPXmcRtwZ9NA6GRg9iv6NQ2k3V6rVvp44KtzPcyYBXycu
	5lAFIDsgoRBbuDzjI5FV9vUYfT8qqm4YWaHUg5KGa+s4kqoQWppzNuWYnh8RDZAePQlPLPgtp6RtM
	mZCkvI2g==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh6r-00000009toX-0ZfZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 607765C3FAC;
	Tue, 15 Jul 2025 14:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8229CC4CEE3;
	Tue, 15 Jul 2025 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752591496;
	bh=M8+MSuTAKSrCgCVtMy/iUPaoVEAQznYtaWQLPB0t2Qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbN/F0/Pqumr8sUD4Sgs6iDjiBGLpx6+InkYoibQ1Xjk1kQDqVCzIH4x6LtLvsW/7
	 uPOr+mQoTAUS8ctQeLMifJNy63G/leF4fhpN3Hl+vxQ+uDlMLryK0sl8BM8/Avv4U7
	 gwmeScnXtnO/mFBm7u+5m1yosjoBhb0NFPMLrN+85avZOftDCal/LzpKmINjixYdzB
	 5jbqE+EMGaqD57fBF3e4cRADtmZ4y966WXCmwz3vnUmo5p0aVodZ0LU/0XzZyogJAR
	 aZeQbmeHZzwQMo/dAUHlzGh1iupSjPUt37KHqGVXVhOSf5wZ2lVgbDm3PeDQlwSXQz
	 ctHZXgvimQGGw==
Date: Tue, 15 Jul 2025 15:58:11 +0100
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	sami.mujawar@arm.com, aneesh.kumar@kernel.org, steven.price@arm.com,
	linux-kernel@vger.kernel.org, sudeep.holla@arm.com
Subject: Re: [PATCH 3/3] arm64: acpi: Enable ACPI CCEL support
Message-ID: <aHZsgzNYwfCljX-G@willie-the-truck>
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-4-suzuki.poulose@arm.com>
 <aHZeCKNyDeZEsuCt@willie-the-truck>
 <bf56dab4-8a11-4e91-b330-2a8126c94acc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf56dab4-8a11-4e91-b330-2a8126c94acc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_155821_492191_8E37E4E3 
X-CRM114-Status: GOOD (  23.51  )
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

On Tue, Jul 15, 2025 at 03:38:41PM +0100, Suzuki K Poulose wrote:
> On 15/07/2025 14:56, Will Deacon wrote:
> > On Fri, Jun 13, 2025 at 12:11:53PM +0100, Suzuki K Poulose wrote:
> > > ACPI CCEL memory area is reported as Non-Volatile storage area. Map it as
> > > PAGE_KERNEL.
> > 
> > It would be helpful to have a citation for that. I've tried digging it
> > out of the ACPI spec, but that pointed me to the Intel TDX site and I
> > got lost in whitepapers :/
> > 
> 
> https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#cc-event-log-acpi-table

Thanks, but I still can't spot where it specifies the memory attributes.
I think we should be able to refer to that as justification for ignoring
the attributes specified by EFI.

> > > Cc: Sami Mujawar <sami.mujawar@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> > > Cc: Steven Price <steven.price@arm.com>
> > > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > >   arch/arm64/kernel/acpi.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> > > index b9a66fc146c9..f52439d411a0 100644
> > > --- a/arch/arm64/kernel/acpi.c
> > > +++ b/arch/arm64/kernel/acpi.c
> > > @@ -356,6 +356,11 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> > >   			prot = PAGE_KERNEL_RO;
> > >   			break;
> > > +		case EFI_ACPI_MEMORY_NVS:
> > > +			/* Non-volatile storage, required for CCEL */
> > > +			prot = PAGE_KERNEL;
> > 
> > By "storage" you just mean memory, right?
> 
> Yep, it is just memory. I will drop the "NV storage" and simply mention,
> CCEL.

Thanks. Also, why don't we check against memblock_is_map_memory() for
this, like we do for all the other types apart from
EFI_RUNTIME_SERVICES_CODE?

Will

