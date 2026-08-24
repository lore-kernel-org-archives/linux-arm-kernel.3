Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F82C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpPhACJ/E+7XpzP2QlMsFbTZFZkYuiCZLkbADyHIXK4=; b=Da6Z7Pi+RLZiB1HkOqeztptznd
	pyKHSDQ55Vseq6ntrm+P0VuwlSuCU8UoVSDj3kWbr/bOtex9W9HIRhDhVJSz1oTR6d73T94Xfd3Jp
	NXuYwjJwj7hxxdRTREtajIL368i9NUj4T73LJqf5aNiqDGGr4CecLcE5rpiG6EKaD9PruVzg/THeI
	3ZDwfrqWgFKY6qGrKydljGcCrUfs85Mtx/1luzn0BiUPqDJc6JC5itfdiBNrJPC53VKqrbrgI1axd
	o/Wbf8MTH+A6FL3pvzO4V/XRYFUFg/2LhQpVSfJEVLRRRISOvzK7nP8O+RXtkqT4YolUGkxk9CpBl
	8dHuAQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWfm-0000000Gw2p-1dvg;
	Mon, 24 Aug 2026 15:33:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWfi-0000000Gw2E-1OIz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:33:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7723C1756;
	Mon, 24 Aug 2026 08:33:09 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2E753F7D8;
	Mon, 24 Aug 2026 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787585593; bh=GbLBNOdNjgQai/PHZoJkCa1ZnvdKrjzzqeispktifLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NiNQ7Rd70L0XzIuxmFTQiwO5A/RjIThmPUxIourbxsZQi3qgmFZMUZ5N44Y9XIBXi
	 lONRS5Od8pOIi6qDyRrQ5SqcNumEBXdFG9UEEH1AgKkEKg3AC48DVb3YXEyBX4HaRC
	 tCYqwEs89BHsflcwq9AfGQYs0333A+WfjS78Ond0=
Date: Mon, 24 Aug 2026 16:33:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Defer the GMID_EL1 read to
 {init,update}_cpu_features()
Message-ID: <aoxkNQGmtvr-iV6k@arm.com>
References: <20260824071004.504894-1-fuad.tabba@linux.dev>
 <aoxCk5lFQv6lFwHQ@willie-the-truck>
 <CA+EHjTy6Xh=eNg22fBdjPzZOZitzvcDX2L5zbSUFCsX1n6XobQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTy6Xh=eNg22fBdjPzZOZitzvcDX2L5zbSUFCsX1n6XobQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_083314_453301_062B2A05 
X-CRM114-Status: GOOD (  28.40  )
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

On Mon, Aug 24, 2026 at 04:14:41PM +0100, Fuad Tabba wrote:
> Hi Will,
> 
> On Mon, 24 Aug 2026 at 14:09, Will Deacon <will@kernel.org> wrote:
> 
> > > +     /*
> > > +      * info->reg_gmid deferred to {init,update}_cpu_features because
> > > +      * reading it traps to EL2 when MTE is disabled.
> > > +      */
> >
> > I don't think we should defer this, as I've been actively doing the
> > opposite for parallel CPU onlining (where the ID registers can be read
> > concurrently by incoming CPUs to amortise the cost of a trap) and also
> > for the RNG traps during early boot:
> >
> > https://lore.kernel.org/all/annJ0oDB2HObQC5j@willie-the-truck/
> >
> > If you look at the diff I sent in the thread above (I didn't get a
> > reply), the idea is that __read_sysreg_by_encoding() reads from the ID
> > register values stashed by cpuinfo_store_cpu(). So you could use that
> > to check id_aa64pfr1 before reading gmid, as it will give you the
> > sanitised view.
> 
> I just did, but I don't think it'll work. The thing is,
> __read_sysreg_by_encoding() gives the override-applied local value,
> not the folded sys_val.
> 
> arm64.nomte is a command-line override, so that works. But
> CONFIG_ARM64_MTE=n sets none. Any gate would still need an explicit
> IS_ENABLED(CONFIG_ARM64_MTE).

We need to revive this series:

https://lore.kernel.org/all/20260302115653.1517326-1-maz@kernel.org/

I don't remember where we left it but in principle config off or
override should look similar to the kernel.

There's also the override making an absent feature present. Suzuki has
attempted to fix this in a reply:

https://lore.kernel.org/all/afc5bd00-28ca-413b-b047-ee53589c285d@arm.com/

> That said, I don't have to defer it. I can keep the info->reg_gmid
> read in __cpuinfo_store_cpu() and gate that read on the state that
> arms the trap:
> 
>         static inline bool gmid_el1_accessible(u64 pfr1)
>         {
>                 if (!IS_ENABLED(CONFIG_ARM64_MTE))
>                         return false;
>                 if (system_capabilities_finalized())
>                         return system_supports_mte();
>                 return id_aa64pfr1_mte(pfr1);
>         }
> 
> 
> TID5 is set from system_supports_mte() and only once capabilities are
> finalised, so the local check is still correct before that. Gating on
> system_supports_mte() keeps the different-physical-CPU case you want
> to preserve working: if one re-onlines with MTE while the system view
> has it folded off, the gate stays false and it won't read GMID_EL1.

I think this would be the easiest to backport and we can look at
reworking this infrastructure in the future (Will's proposal, Marc's
override fixes etc.)

-- 
Catalin

