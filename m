Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F5CCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l32CwL6RPdOm0EOwrBJy8YAfpk95iBBbK/6pVfpnLNs=; b=YOJbCGanheiaNtRZPRQDO7YR4N
	mvKuDpD16YAZEAIVXQTBCalM47NBTe43C+WZigXHgjjbL3Mwkt+frfqwy0aZtm1wI4iUvPFTkQC9j
	iH2g51eYwIZOeBdSkK9x4b97yWWmfcpAtkFPwT+xTrMuUmdyjQH5siMEPFNS55bJISBoJanTT1EY9
	uBvIiwuLGhf6GyUO84y2wuD0Tu4U9bGF52FTiMgH8s4z05T/MgVI63PfQrUNpyKkDPAUZ35kbWGGU
	utAFgWEk4KxmiaOsP614z3swLVHgKTvfwuc6HSZFRF2oPTP4GEl5cviV9JCktJfeGpntmhlbM5z4v
	miig30Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJD1-00000009cwJ-33xv;
	Thu, 01 Oct 2026 16:00:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJCq-00000009ctn-3ABb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:00:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FEC4497;
	Thu,  1 Oct 2026 09:00:20 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3D223F86F;
	Thu,  1 Oct 2026 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790870423; bh=0anjATVLl2lFF6xlG/CGUPt6vidLI3eT3YTi5MQ///E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3xWRSBQWtIqgglyOJmaSWMX/UDPwmvoExYNxIE0ePHLzqcWUzcwVZv1byOMMam6F
	 BlWIyCHOtKna0FkFlcn0tMPdzXPBFB0xm9fjDAkBMrZWqxVeLGRUfe2Xt/5+PchBwC
	 uoDb3hZ+SDpHJdALdRv8yXyTynyk3G2mqkOJJY5w=
Date: Thu, 1 Oct 2026 17:00:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <tabba@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
	Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: mpam: Document when to set arm64.nompam
Message-ID: <ar6Dj_frEGFBGWY8@arm.com>
References: <20260908145622.2828319-1-fuad.tabba@linux.dev>
 <CA+EHjTy6+JpcdwuP3wnxK9n2iR0REM7nFgxkLaS8RAOST4KY5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTy6+JpcdwuP3wnxK9n2iR0REM7nFgxkLaS8RAOST4KY5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090026_739205_4DB4B4E3 
X-CRM114-Status: GOOD (  18.27  )
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

On Mon, Sep 28, 2026 at 07:56:14AM +0100, Fuad Tabba wrote:
> On Tue, 8 Sept 2026 at 15:56, Fuad Tabba <fuad.tabba@linux.dev> wrote:
> > arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> > finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> > firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> > left unwritten, at reset values that are UNKNOWN, and KVM still hides
> > MPAM from the guest but no longer enables the traps that stop a guest
> > from using it. KVM never saves or restores MPAM0_EL1, MPAM1_EL1 and
> > MPAMSM_EL1, so what one guest writes reaches the next guest and the
> > host. Nor can the kernel make the EL2 writes unconditionally: they trap
> > to EL3 on the firmware the option exists for, and TRAPLOWER cannot be
> > read below EL3.
> >
> > Say so in mpam.rst, and add the rule and a pointer to the
> > kernel-parameters entry.
> 
> Gentle ping on this one; it has Ben's and Bradley's R-b. I think it
> still stands regardless of the other cpufeature work going on now.
> Anything else needed for it to go in?

Normally I expect a pull request from Ben or James but they rarely send
one in time ;). I'll apply it directly.

-- 
Catalin

