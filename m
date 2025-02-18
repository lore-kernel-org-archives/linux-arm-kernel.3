Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1520C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jwcj/x4k+EgXwtkRklCDv0zVjHCgADziL9Bav+AEoJs=; b=VfnYs8wRnvlY8lgVwQ2Tk890xu
	QzFKj9rZO38VrlL7myIAnXHko7UMcMMdLep2yD2MSuHrfB5LYYQU88PAkQn4xwbU07gWd54UrqVmL
	/kOp+12xur7wCQSCkgHiWpe45lh4ebfjfXznOF4rYAu/PcSx9JQMHo7DiBzvvDYQ1W+GDD/0FAve7
	R+iak7uiaqaofjf3Zde9vWBpW52S8qaShk2vxEmcPBSc2IXHeHJpK/+Q1PnHFSZPAWb6tLNgoag7r
	lzvMtsy49ooHzqYq/vg9SWjCet1NMjyTdVAaW4sX/WCMUE2JHaOdseYaJVfCfllIrTyNAx6msP+YJ
	cO6d2Xkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTls-00000009fzj-0It6;
	Tue, 18 Feb 2025 20:00:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSvW-00000009V6G-3uFS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53171A41592;
	Tue, 18 Feb 2025 19:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90369C4CEE2;
	Tue, 18 Feb 2025 19:06:35 +0000 (UTC)
Date: Tue, 18 Feb 2025 19:06:33 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <robh@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH V2 0/7] arm64/boot: Enable EL2 requirements for
 FEAT_PMUv3p9
Message-ID: <Z7TaOUcjP0kME5ly@arm.com>
References: <20250203050828.1049370-1-anshuman.khandual@arm.com>
 <173990541533.375660.5963781767181928314.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173990541533.375660.5963781767181928314.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_110639_037324_2196A772 
X-CRM114-Status: GOOD (  15.29  )
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

On Tue, Feb 18, 2025 at 07:03:49PM +0000, Catalin Marinas wrote:
> On Mon, 03 Feb 2025 10:38:21 +0530, Anshuman Khandual wrote:
> > This series adds fine grained trap control in EL2 required for FEAT_PMUv3p9
> > registers like PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 which are already
> > being used in the kernel. This is required to prevent their EL1 access trap
> > into EL2.
> > 
> > PMZR_EL0 register trap control i.e HDFGWTR2_EL2.nPMZR_EL0 remains unchanged
> > for now as it does not get accessed in the kernel, and there is no plan for
> > its access from user space.
> > 
> > [...]
> 
> Applied to arm64 (for-next/el2-enable-feat-pmuv3p9), thanks!
> 
> [7/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
>       https://git.kernel.org/arm64/c/f134bbc054ae

"b4 ty" ignored the other patches. I applied the sysreg ones to the
arm64 for-next/sysreg branch in case they need to get pulled into other
trees (e.g. KVM). The above patch is on top of the other sysreg patches.

-- 
Catalin

