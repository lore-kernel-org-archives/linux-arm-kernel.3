Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E812C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEVtPBkm+IoyOpWd89dXe6eCoqDd0rD0qWlUQ8IixjQ=; b=paBNPc0M0vFmeQ08BfYqSm3ORl
	4eey9MhBw/gTmHbZYUuAqKzr/iw+Ffdoho1T7cBncr6t0vcRWPpf7t7Y6yKjoqBSWxULbTOnkWG+p
	E/xLCyPzZTIiN7IPIuOzMJNkMUXAW2jJbzfQ+608qaIvwiAbI4CDA6+MvlY7V/AKv+ILlAa/clp4z
	r/iFmE2uCtYYhyIbgmOXYtK1n7YBmJP5p8LDSr3QUPCJ0WnNXg1QUil5G0IAZc8HFs3WwXairQzI/
	roiEdC5IdPev2X9AtgeiST0Nv+3QY+tdcy2Z2WjFhT2g5ZFfGBufO1onVRuOB2jYGuOp95ck5wd4r
	uiYvIZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wza1M-000000042Zc-1dBZ;
	Thu, 27 Aug 2026 13:19:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wza1L-000000042ZU-3EyZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 13:19:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36F6D42E8D;
	Thu, 27 Aug 2026 13:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0680D1F000E9;
	Thu, 27 Aug 2026 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787836795;
	bh=CEVtPBkm+IoyOpWd89dXe6eCoqDd0rD0qWlUQ8IixjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c2EhxUu0JLTQ0HxBXS4qWFw8NGFqQFW99MOapNxmO6IEMsC7+noMSrdEjTacc2zl1
	 JDCuoY9mdTdGomEgEEW/fDTOSAS1HZyEl4cDkBO/b70PJAdWA0N0rRZ5U6X1C9wXE/
	 kYR81Gr4SBO26RIAJsfHOAPJPN0gLe+99+S+ilFKyFA3mZ9vDOIHsMTbWXjDDRzt2T
	 5kYPaPsIFBKIS1g/6u9EeYtSzWGfgWfhURqSmPFkCquJTV5e80EUAcsSUfAzd81aWJ
	 ilqtOytoSNzoRP8CA2w90GHdBf2c6PxlBZwq1tqOsCnHWcqPlfcUrfoi13QNH6RPVA
	 mJMVbuUQd3saQ==
Date: Thu, 27 Aug 2026 14:19:49 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v4 2/2] arm64: Don't read GMID_EL1 when MTE is disabled
Message-ID: <apA5dYIPEQbQVJLf@willie-the-truck>
References: <20260825164219.3347229-1-fuad.tabba@linux.dev>
 <20260825164219.3347229-3-fuad.tabba@linux.dev>
 <apA0A-bqLVBcmdSv@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apA0A-bqLVBcmdSv@willie-the-truck>
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

On Thu, Aug 27, 2026 at 01:56:35PM +0100, Will Deacon wrote:
> On Tue, Aug 25, 2026 at 05:42:19PM +0100, Fuad Tabba wrote:
> > diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> > index d50e2a9b066b3..389fca84f106b 100644
> > --- a/arch/arm64/kernel/cpuinfo.c
> > +++ b/arch/arm64/kernel/cpuinfo.c
> > @@ -502,7 +502,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
> >  	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
> >  	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
> >  
> > -	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
> > +	if (gmid_el1_accessible())
> >  		info->reg_gmid = read_cpuid(GMID_EL1);
> 
> I'm not sure this is safe. For the boot CPU, __cpuinfo_store_cpu() is
> called before init_cpu_features(), so the arm64_ftr_regs[] array hasn't
> been sorted and we can't call get_arm64_ftr_reg() reliably. In fact, it
> doesn't even look like the overrides will have been processed.
> 
> So we're in a bit of a chicken-and-egg problem here. Perhaps we need an
> early (__init) function that can apply the override manually to the
> value read from hardware using arm64_ftr_safe_value(). You'll probably
> need something like my old hack [1] to avoid the bsearch though :/

Thinking about this for a few more minutes, perhaps the best option for
a quick fix would be to:

 - Internalise gmid_el1_accessible() in cpufeature.c and take cpuinfo *
   as a parameter

 - It could then refer directly to the ftr reg, along the lines of:

	val = arm64_ftr_safe_value(&ftr_id_aa64pfr1,
				   <value from id_aa64pfr1_override>,
				   <value from cpuinfo>);

 - Then check val before accessing the gmid.

Then we can fix all this properly in the future by moving the override
stuff earlier.

Will

