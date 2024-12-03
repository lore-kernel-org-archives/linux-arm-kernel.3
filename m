Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3709DE6C61C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDzhkdVcFV5lOZrUJRvMePllPZt/Enh71cIAJllVtck=; b=2b5pETO2gRRnDdH/niuPwi+JtE
	bCF4hu6paKOPw5FkzXY5fgV6HrzOPc9d/fJ3KzzEX1gS/cAqgW+roiXtJfPcfa9/sY9Mdjg2UWGwH
	q4bC64pnbNoTCeW7Ew4ou3JV2dNz+Z/GSvvK38KCG+V/HWUi9ISCq8yommYokj0lk5X0TeLNtGm4Q
	zuOa46mml2fW7qcveS2mU/CQ9ajfnOlEmDdgSnz1I3jKZtxRACewYvsFi3D3Otpk0r550SA1XwTNJ
	/+8+/PWD9pCv1HtesinU01YLuXVuth44ctPb1iHbnGF4ibEnwY7PfpEst+WivMaC9kZoxCAsWF9z6
	cona8DCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOjQ-00000008m4U-1fD0;
	Tue, 03 Dec 2024 08:58:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOiQ-00000008lth-27YR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 08:57:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D53FA40FA1;
	Tue,  3 Dec 2024 08:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6F5C4CECF;
	Tue,  3 Dec 2024 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733216225;
	bh=0Qzv51MkIatri7wWVvDxcxEpWmDckOYDk+YOddo1wwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CStbDS7BtJXtekiov7tzrSHKMniB/oAV1H9D/NIg5Poa79PrExyK89xllTMTWIpGR
	 x/flAiwNsGPm+07acVAjNRKorzOvZpMMhzSsLy5XcTYsv4NK1OjC1/ZYWH8Au5K4dC
	 BJuQ41zfMN3mCxe6TM8bNck7yp9Eu9VVJNyZemIc4pQx1iWCLRwM6FGVLuVtWRxiMu
	 qVw10nzwDMCXf7UdTxgptRgTE6eKObsV1ENT/TlB/N9DMMeCwrgWOORELFbNjR+t5V
	 g1JblwM43JCM/iCmMjw0lBElBGIKlCdHHKQ4Tb/LBSavBTNI1RIwXBFIUXUyGrtUlk
	 nM1F4VhcIMA1g==
Date: Tue, 3 Dec 2024 10:56:52 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	catalin.marinas@arm.com, hch@lst.de, thuth@redhat.com,
	will@kernel.org
Subject: Re: [PATCH] arm64: patching: avoid early page_to_phys()
Message-ID: <Z07H1Gkzp-6fMlY-@kernel.org>
References: <20241202170359.1475019-1-mark.rutland@arm.com>
 <Z03tNWwlOz3Iil9J@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z03tNWwlOz3Iil9J@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_005706_609455_630818AE 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon, Dec 02, 2024 at 05:45:11PM +0000, Mark Rutland wrote:
> Looks like I messed up my text editing and left some bonus words...
> 
> On Mon, Dec 02, 2024 at 05:03:59PM +0000, Mark Rutland wrote:
> > When arm64 is configured with CONFIG_DEBUG_VIRTUAL=y, a warning is
> > printed from the patching code because patch_map(), e.g.
> 
> That was meant to say:
> 
> | When arm64 is configured with CONFIG_DEBUG_VIRTUAL=y, a warning is
> | printed from the patching code, e.g.
> 
> [...]
> 
> > For historical reasons, the structure of patch_map() is more complicated
> > than necessary and can be simplified. For kernel image addresses it's
> > sufficient to use __pa_symbol() directly without converting this to a
> > page address and back. Aside from kernel image addresses, all executable
> > code should be allocated from execmem (where all allocations will fall
> > within the vmalloc area), and the vmalloc area), and so there's no need
> > for the fallback case when case when CONFIG_EXECMEM=n.
> 
> That last sentence should have been:
> 
> | Aside from kernel image addresses, all executable code should be
> | allocated from execmem (where all allocations will fall within the
> | vmalloc area), and so there's no need for the fallback case when case
> | when CONFIG_EXECMEM=n.

Still an extra "case when" ;-)
 
> I can spin a v2 with those fixed if necessary.
> 
> Mark.

-- 
Sincerely yours,
Mike.

