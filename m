Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF3BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bY0OwgPal6QlPB3ty/eOUhetwtY4hZxNYf6/eJ0Xpq8=; b=q9MjusgAEo+OeOigfHQBqJhKYE
	T/7Oq20GXH6y8e6hRPVD+wCx8W0A7Rd8ukgpAaDiwFsWTIFFVVlQ6AxtfyvodJ4AE4UnAonOMm7TS
	+60B3g3md/R30LeZlppUDB3ai07kdk1OCSD3nswZmzN6reRDY7mCfiJhi9mjUgLHccRJfC1i2v/RL
	0FoZlRgfWCKfMBRLhevEz9z9mlt4da2MoslYxtO0fUVC2v2b3Xjdf+Z0pZ6tjV0PHXFfEdDBisCZ1
	1h7wGjQkuCkSyUnSIcJEzc3EZ3B4d7L+ljEZehe5Lmglu0hqEGIgan3RSE/xaAGALuVIinEmZr81+
	Or2hG6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx1E-00000005uls-2X8Y;
	Fri, 28 Aug 2026 13:53:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx1D-00000005ulR-3vcN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:53:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E1FA601FD;
	Fri, 28 Aug 2026 13:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE68C1F00A3A;
	Fri, 28 Aug 2026 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925198;
	bh=bY0OwgPal6QlPB3ty/eOUhetwtY4hZxNYf6/eJ0Xpq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mUdx5SgeR+7kSaRoPuUgUMnVzm3fhdg8NQ2Oc/VCXSJlKo5B7Wyha57FemARc7g8d
	 WTfbjGIC5T7No8nZ87o8kDxcYBgyTAVwXqNVsz1NtzKKe0+8fSsGvDehx90Bpp27/0
	 uChQ1BehxD/grIKjBUQyZsiWgpahoj+eTh9xm9yBejCwehPpYC8EobjdvW8MH9lu5Q
	 ruvT5o5In58HuJXKLZ2Xfz/wfc3U9A2QNSkIKe340Eq2MCR7+YEep1JNdWu7i+fg4g
	 9DN9W6MKDKi5/SrBXb/0sck0/UoWaMoUNCPnybd0pWCpArGhVcH6ZoZfkKMSmSc+vG
	 DVGwM9NCFrugw==
Date: Fri, 28 Aug 2026 14:53:13 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v4 2/2] arm64: Don't read GMID_EL1 when MTE is disabled
Message-ID: <apGSye1_M737mITN@willie-the-truck>
References: <20260825164219.3347229-1-fuad.tabba@linux.dev>
 <20260825164219.3347229-3-fuad.tabba@linux.dev>
 <apA0A-bqLVBcmdSv@willie-the-truck>
 <apFn5JihFkRoqX06@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apFn5JihFkRoqX06@arm.com>
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

On Fri, Aug 28, 2026 at 11:50:12AM +0100, Catalin Marinas wrote:
> On Thu, Aug 27, 2026 at 01:56:35PM +0100, Will Deacon wrote:
> > On Tue, Aug 25, 2026 at 05:42:19PM +0100, Fuad Tabba wrote:
> > > +/* No ID register reflects CONFIG_ARM64_MTE. */
> > > +static inline bool gmid_el1_accessible(void)
> > > +{
> > > +	if (!IS_ENABLED(CONFIG_ARM64_MTE))
> > > +		return false;
> > > +
> > > +	return id_aa64pfr1_mte(__read_sysreg_by_encoding(SYS_ID_AA64PFR1_EL1));
> > 
> > I'm planning to internalise __read_sysreg_by_encoding() into cpufeature.c
> > so I'd prefer to avoid adding another user of it, if possible. In this case,
> > __cpuinfo_store_cpu() has already read the thing, so all it needs is the
> > override logic (but see below).
> 
> That's a valid point.
> 
> > > @@ -502,7 +502,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
> > >  	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
> > >  	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
> > >  
> > > -	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
> > > +	if (gmid_el1_accessible())
> > >  		info->reg_gmid = read_cpuid(GMID_EL1);
> > 
> > I'm not sure this is safe. For the boot CPU, __cpuinfo_store_cpu() is
> > called before init_cpu_features(), so the arm64_ftr_regs[] array hasn't
> > been sorted and we can't call get_arm64_ftr_reg() reliably.
> 
> We no longer sort this array at boot-time, we just check that it's
> pre-sorted.

Fair enough, but I still don't think we should access it until we've
checked that.

> > In fact, it
> > doesn't even look like the overrides will have been processed.
> 
> init_feature_override() runs from early_map_kernel() but yes,
> init_cpu_ftr_reg() hasn't been called yet to vet the override. Suzuki's
> patch was adding extra checks in __read_sysreg_by_encoding() but if we
> drop that patch (and function eventually), better not to rely on it.

Right, and we have to be really careful here with things like the new
"nohaft" override because otherwise we could accidentally end up
thinking we have hardware dirty on CPUs that don't have it. In other
words, it's not just about people passing bonkers settings on the cmdline.

> So I don't think we have a correctness issue here but I don't mind v5
> either. I'll go and check.

Thanks.

Will

