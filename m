Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3123FC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJCTjoSgVGNP+eZtoW2TGQkKjh5p1ZawJ7zgNjRJc2I=; b=VxPRL5L+VPsJEG2JNOk1uIeE51
	JoW2mPXyTWe549Dkhem5b6RxwkAh9d5IVJ5uuKW6Q26MExycfUsfsp1zoiuxKQw88ylYCePeV6qFM
	pCIOhqeVSER+Kkjn8FOh9IPd8K8EPz6pXxhvW5BGBhmXV/hzBvY9KRuv1wq2lDZwA8anZ7QDLhKdE
	QK8MoYPvfyb/uQbPWIGkq22pW9Q7N2CjQxI5ZXtHJSvDoE4/okMUWStg8YnO3olsRucCDF9dBMvXE
	FA3rczSP6QvGNhebmb/sFMizmle079DR94J4cHg0p98WaufwA9ARVe1fS5UYKMSIniLPI7eMH2+oj
	2zKhtKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCYy-0000000FJ77-1TJS;
	Wed, 14 May 2025 13:54:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBNV-0000000F6vt-2Sck
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 12:38:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B6D06112E;
	Wed, 14 May 2025 12:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DA7C4CEE9;
	Wed, 14 May 2025 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747226308;
	bh=j9+XZ+bw7t14t604iZV2M8SR46RjkO3CFgtXl+uo9fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrvlmqEuESmTorQOh12G23B9NASk8zHZm0Fu3T2+rtz2Umy6xJ77QWqYAiG+gbq1z
	 yhzl7A5w8pwBBbE/TzzFDDamaiw7eJB2qymXZIkTU7lxUWCNgVsGKSBFurX8ldEpIb
	 /vOgPkn8KNS3z8dxQNZRPtgqcgvujO3Q4sb51g6b8IMhLGFk2Y0a0uUNi/ELMNh/w9
	 wgC/i1HmQvy3yuC2VHE9A4WjkEqe06N4Jyh4yeuQm7Ie3mP0BtNmC3+/UeN6V7u1j2
	 Doop+WYWtPpq9Zww1QA1JicExnxi5EUP3gxBv8isveJJ13yaxOqiBBescdp4Zj0787
	 ifNi9jF/WFfkA==
Date: Wed, 14 May 2025 13:38:23 +0100
From: Will Deacon <will@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Radu Rendec <rrendec@redhat.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
Message-ID: <20250514123823.GA10606@willie-the-truck>
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
 <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
 <aCIVec7zl3tIh73h@J2N7QTR9R3>
 <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, May 12, 2025 at 11:56:28AM -0400, Sean Anderson wrote:
> On 5/12/25 11:36, Mark Rutland wrote:
> > On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
> >> On 5/10/25 03:04, Sudeep Holla wrote:
> >> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
> >> >> Cache geometry is exposed through the Cache Size ID register. There is
> >> >> one register for each cache, and they are selected through the Cache
> >> >> Size Selection register. If FEAT_CCIDX is implemented, the layout of
> >> >> CCSIDR changes to allow a larger number of sets and ways.
> >> >> 
> >> > 
> >> > Please refer
> >> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
> >> > 
> >> 
> >> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
> >> | in conjunction with set/way cache maintenance and are not guaranteed to
> >> | represent the actual microarchitectural features of a design.
> >> | 
> >> | The architecture explicitly states:
> >> | 
> >> | | You cannot make any inference about the actual sizes of caches based
> >> | | on these parameters.
> >> 
> >> However, on many cores (A53, A72, and surely others that I haven't
> >> checked) these *do* expose the actual microarchitectural features of the
> >> design. Maybe a whitelist would be suitable.
> > 
> > Then we have to maintain a whitelist forever,
> 
> There's no maintenance involved. The silicon is already fabbed, so it's
> not like it's going to change any time soon.

The list is going to change though and it introduces divergent behaviour
that I'd much rather avoid. The mechanism is there for firmware to
provide the information and it's hardly onerous compared with other
(critical) things that it's tasked to provide such as interrupt routing
and GPIOs.

> > and running an old/distro
> > kernel on new HW won't give you useful values unless you provide
> > equivalent values in DT, in which case the kernel doesn't need to read
> > the registers anyway.
> 
> Conversely (and far more likely IMO), running an old/distro devicetree
> on a new kernel won't give you usefult values. Bootloaders tend not be
> be updated very often (if ever), whereas kernels can (ideally) be
> updated without changing userspace.

Updating the device-tree shouldn't require updating the bootloader.

> > The architecture explcitly tells us not to use the values in this way,
> > and it's possible to place the values into DT when you know they're
> > meaningful.
> 
> Well, maybe we can just use these registers for the hundreds of existing
> devicetrees that lack values.

The fact that the device-tree files tend to omit this information is
quite telling as to how useful it actually is. What would you like to
use it for?

Short of having an immediate functional or performance benefit by
exposing this stuff, I wonder if we could add a kselftest for it
instead?

Will

