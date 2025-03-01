Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5DFC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 11:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQmFQtir3Lbrtem2QPcwGaN1+PGoL3/O4P0o6KWpzYg=; b=Mh0X0ijspS7wLDkfCcSTZF8crG
	rGZWQZqgac8ffq+6JFRvZ2t6zD6v7UjdXg77WBF7x7Lty3hWD5PhtTLBaTecSiiW1VlA5Gn4ozMgo
	Faq8VbUUuiyj0w3fdjbaqeFyXQQXfjm0FEoKoDcyoxBUB/fT5wLKJb1PRbXazFxa2bhKXXVhUz4tE
	TC82MMGBfDWsNT5eZAFdLYF9tLWIDMqS8ylhZq/JQjESv7ToYsoeHbpEU3bwDUiKeYz50n+LMp9Wn
	3xQmIryqFFROCpEnRshVpOCXiQ3419tW2cw3Pa5Zi8EbtBfwhu801dUPRtnp2hhPDooDjS90V1Ojt
	VP6ox2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKoe-0000000DpES-2pag;
	Sat, 01 Mar 2025 11:15:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKko-0000000DoGa-1TqN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 11:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB5285C2765;
	Sat,  1 Mar 2025 11:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A370C4CEDD;
	Sat,  1 Mar 2025 11:11:31 +0000 (UTC)
Date: Sat, 1 Mar 2025 11:11:28 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <robh@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/7] arm64/boot: Enable EL2 requirements for
 FEAT_PMUv3p9
Message-ID: <Z8LrYBD7WHjOnJgT@arm.com>
References: <20250203050828.1049370-1-anshuman.khandual@arm.com>
 <20250301075849.GA28249@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301075849.GA28249@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_031134_435731_22FE74A7 
X-CRM114-Status: GOOD (  21.95  )
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

On Sat, Mar 01, 2025 at 07:58:50AM +0000, Will Deacon wrote:
> On Mon, Feb 03, 2025 at 10:38:21AM +0530, Anshuman Khandual wrote:
> > This series adds fine grained trap control in EL2 required for FEAT_PMUv3p9
> > registers like PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 which are already
> > being used in the kernel. This is required to prevent their EL1 access trap
> > into EL2.
> > 
> > PMZR_EL0 register trap control i.e HDFGWTR2_EL2.nPMZR_EL0 remains unchanged
> > for now as it does not get accessed in the kernel, and there is no plan for
> > its access from user space.
> > 
> > I have taken the liberty to pick up all the review tags for patches related
> > to tools sysreg update from the KVM FGT2 V2 patch series posted earlier.
> > 
> > https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandual@arm.com/
> > 
> > Rob had earler mentioned about FEAT_FGT2 based trap control requirement for
> > FEAT_PMUv3p9 registers that are currently being used in kernel. The context
> > can be found here.
> > 
> > https://lore.kernel.org/all/20241216234251.GA629562-robh@kernel.org/
> > 
> > This series is based on v6.14-rc1
> > 
> > Changes in V2:
> > 
> > - Rebased on v6.14-rc1
> > - Updated tools sysreg patches with latest DDI0601 2024-12 definitions
> > - Updated document version as DDI0601 2024-12 in all commit messages
> > - Added latest tags from Rob Herring for the last patch
> 
> I know these have been applied already but, fwiw, patches 1-6 look correct
> when compared against the .xml:
> 
> Acked-by: Will Deacon <will@kernel.org>

Thanks Will.

> I presume Catalin will drop/replace the last patch.

I dropped it already, I'll queue the new one.

-- 
Catalin

