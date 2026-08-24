Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFA3C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9k6rsVugii8EldIM+liTdiDInblrdlEJ5qzcfjbqtE=; b=ab6Ccx74pAihCL6yv91ACi5UJ0
	ludPwAMXUPvKuRf3xkzNiTm80ICfyu2cTE8vf5CBL8Mv1kgPXWRCPy0VIVFu54rhH4VYdMV3urzB0
	MfwZEQUskQ/FZ56qZg7fyoQZ84ZZOm4mraE1icGOMkhldNVVBrGScrxneAzQl0z9hiSrT6c92Y5z9
	e55JzvFkvmYSSiwV6i8NVlZ3grPbRb4AGpHka3RntpHPWAGdLRafLws8hzNQRmcEq6jonYqDXK4F0
	ovpVZ/JmY8ceHc5yztD5FuWPSeRjeab7AeNrkTWDszzNe20rmZC2tEGJROTKVXmI4GAoFhTmNwLQ/
	Rx6/+UVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX01-0000000GyWu-0Cnl;
	Mon, 24 Aug 2026 15:54:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWzx-0000000GyWV-14Tt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:54:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97EDA4020F;
	Mon, 24 Aug 2026 15:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8433B1F000E9;
	Mon, 24 Aug 2026 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787586848;
	bh=/9k6rsVugii8EldIM+liTdiDInblrdlEJ5qzcfjbqtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i34Sn+YZq8PcxLC+hvz4ODhBULqEE+xdp1P8tmuwrvivsHtQaY2PEAj3pHbk2k8te
	 CP/zTT3p1WTNMMHLRDizZmHRhgt5zhKIv8d+N0sTbH7yw5f4lCpuA9KTCW36UuhKhm
	 50RQeoVxfz7XB8TI2fhCGe2IzmxthYm2BSEVNqf/O6DYUCgASWomJ1KCZOCZY0JmVg
	 +hjHuOagZJ52EgDl0a4oPLDnGqL9tjMjCRlzomM2UhLi2SSJV9l+fihu73XwwJxZeT
	 Qy4Jls5988PnIkRWV12AMXZ0wrV+v3X0Nh7LWfDeaIgtDWmJBgz7+UBGw5o4noY2rx
	 egZ4USfZ5E4kQ==
Date: Mon, 24 Aug 2026 16:54:03 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Defer the GMID_EL1 read to
 {init,update}_cpu_features()
Message-ID: <aoxpG13UZfKJ2Rfu@willie-the-truck>
References: <20260824071004.504894-1-fuad.tabba@linux.dev>
 <aoxCk5lFQv6lFwHQ@willie-the-truck>
 <CA+EHjTy6Xh=eNg22fBdjPzZOZitzvcDX2L5zbSUFCsX1n6XobQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTy6Xh=eNg22fBdjPzZOZitzvcDX2L5zbSUFCsX1n6XobQ@mail.gmail.com>
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
> 
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

I still don't understand why you have system_supports_mte() here. If
the CPU has MTE, the CONFIG option is enabled and the cmdline override
isn't set, we can read GMID just fine on this CPU, regardless of the
system capabilities.

> If you agree, I'll respin with that.

I can't tell who's calling gmid_el1_accessible() so it's hard to tell
whether I agree or not. May as well send a v3 though, so we can see what
you have in mind!

Will

