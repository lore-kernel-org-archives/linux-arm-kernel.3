Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4E8C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fa3OBjqCP7oOjWw46jqBWcKs242Jjg9PE8aOMe0GnYQ=; b=A4bKTmse3yQUhvu4yKAxWj9A5t
	6Z+vRKb2m7RrWnHzIzoTxsvGak73V2InGTjri+7Dcjf4Ue2e/1TCMmG72C/wgbslZNmCgkBMO6GqT
	lyz68TxPrQRwda7Z+ypZLW4UROdQyxJlAWAj9Bng/WBgvP9jmGlDCnpu+R0VxfBBBKQ1d6FjreUjm
	zqwYdw3Nubpxvf4wBobQ3sbeFKcng6pFTah4g1WGHyV9Yl6gqfzTkD1Qt2JfdzB4guYPoJk1IwpdM
	B1Ft+SaTmwGU4Zh6rQdBXQnrCklRwEijjVA8R+jMTpNqTrdC8ZGZ17QMAc85Yi/wZYeNvZEpt0Nzp
	wY+4i8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuAI-00000005blS-2fe3;
	Fri, 28 Aug 2026 10:50:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuAF-00000005bkt-2phC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 10:50:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA2C71595;
	Fri, 28 Aug 2026 03:50:18 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F05453F85F;
	Fri, 28 Aug 2026 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787914222; bh=HZfwVBpv4wxsbtGEupJ6THrOaSzncjo27eGuLcBbZ3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZ8V4gjvEaZKWWC4ivOCqNwgHmxnpR/KY2xHffOcOqh42/zM2ZY9GvdcMAcPrbUsK
	 w4ITCbpWeewkvuRNDNlx+hJecUq0UTkB9mDupmXOJvxiaoMXLLoyy/ln7rQC1oXSPv
	 jCIn+UprzLVTOu9a5mtuveimihQc1Dr5ynoW8woo=
Date: Fri, 28 Aug 2026 11:50:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v4 2/2] arm64: Don't read GMID_EL1 when MTE is disabled
Message-ID: <apFn5JihFkRoqX06@arm.com>
References: <20260825164219.3347229-1-fuad.tabba@linux.dev>
 <20260825164219.3347229-3-fuad.tabba@linux.dev>
 <apA0A-bqLVBcmdSv@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apA0A-bqLVBcmdSv@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_035027_758655_5DB8465D 
X-CRM114-Status: GOOD (  21.49  )
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
> > +/* No ID register reflects CONFIG_ARM64_MTE. */
> > +static inline bool gmid_el1_accessible(void)
> > +{
> > +	if (!IS_ENABLED(CONFIG_ARM64_MTE))
> > +		return false;
> > +
> > +	return id_aa64pfr1_mte(__read_sysreg_by_encoding(SYS_ID_AA64PFR1_EL1));
> 
> I'm planning to internalise __read_sysreg_by_encoding() into cpufeature.c
> so I'd prefer to avoid adding another user of it, if possible. In this case,
> __cpuinfo_store_cpu() has already read the thing, so all it needs is the
> override logic (but see below).

That's a valid point.

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
> been sorted and we can't call get_arm64_ftr_reg() reliably.

We no longer sort this array at boot-time, we just check that it's
pre-sorted.

> In fact, it
> doesn't even look like the overrides will have been processed.

init_feature_override() runs from early_map_kernel() but yes,
init_cpu_ftr_reg() hasn't been called yet to vet the override. Suzuki's
patch was adding extra checks in __read_sysreg_by_encoding() but if we
drop that patch (and function eventually), better not to rely on it.

So I don't think we have a correctness issue here but I don't mind v5
either. I'll go and check.

-- 
Catalin

