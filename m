Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BFEC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exKpYh4WljVRCZ4GxhxRk1b91JUVBFTqbXqZ+Czym2U=; b=tLWJ6Ywrfd14qqWgI3UTjdf1QZ
	1V0IZnPyGUPhn+9xiYtii95sj2XisFyQDtALwE5XhDp9DQTr9bsa+fBracIZ0Eedn9CzSfjhg5pm1
	qpZ22rmUYA9QqlPlY9OfSInvHHtHTMUGc/284lpK2+UOET4XwKdXfffYmZfEznspKSJ6jRyMqHw9i
	QgCPhTXLgRpE5XIO2ZUp5awwCMQu6Qjz9VZqgUVcM28NrV8KaP5oqp1Uic1RV46TTcEs4CPyF64A7
	5M1+yXW+KhTILUg2TeLgFORoKqT//UuWcjpjDKvdfhSFdE/DAwi8luVZDg/Ks7tvvuR0E7yjKTiBI
	arbUaF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuiO-00000005dnn-2gGj;
	Fri, 28 Aug 2026 11:25:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuiM-00000005dnJ-1eOg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 11:25:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEE451595;
	Fri, 28 Aug 2026 04:25:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A31D3F7D8;
	Fri, 28 Aug 2026 04:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787916340; bh=G4NNTqXUUlllGRV82KBeaeI9jVQh6puFB8yXhyo25yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ing26+oIP/P8N81Cz0AeBYfSEGQrRytcer4hynY8HTK1RARADq78fljn8zIaS5qon
	 v74nbv0UxIr4G9H3syTtgYa3CbckU3o7cgpF2bNV73rjyb0KqdNe7U6Us3DwZrbZYi
	 eSYgG5SkYnO/uh5cMN0f89dZRDWjJa8XvCzhTm7Y=
Date: Fri, 28 Aug 2026 12:25:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v5] arm64: Don't read GMID_EL1 when MTE is disabled
Message-ID: <apFwJ-HHukM7XLCD@arm.com>
References: <20260827185937.1369099-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827185937.1369099-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_042542_554160_4CBDA096 
X-CRM114-Status: GOOD (  11.90  )
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

On Thu, Aug 27, 2026 at 07:59:37PM +0100, Fuad Tabba wrote:
> +bool gmid_el1_accessible(const struct cpuinfo_arm64 *info)
> +{
> +	const struct arm64_ftr_bits *ftrp;
> +	s64 mte, ovr;
> +	u64 ftr_mask;
> +
> +	/* No ID register reflects CONFIG_ARM64_MTE. */
> +	if (!IS_ENABLED(CONFIG_ARM64_MTE))
> +		return false;
> +
> +	for (ftrp = ftr_id_aa64pfr1; ftrp->width; ftrp++) {
> +		if (ftrp->shift == ID_AA64PFR1_EL1_MTE_SHIFT)
> +			break;
> +	}
> +
> +	ftr_mask = arm64_ftr_mask(ftrp);
> +	mte = arm64_ftr_value(ftrp, info->reg_id_aa64pfr1);
> +
> +	/* The boot CPU runs before init_cpu_ftr_reg() strips unsafe overrides. */
> +	if ((id_aa64pfr1_override.mask & ftr_mask) == ftr_mask) {
> +		ovr = arm64_ftr_value(ftrp, id_aa64pfr1_override.val);
> +		mte = arm64_ftr_safe_value(ftrp, ovr, mte);
> +	}

This works. Or we could cut a few lines and just do
cpuid_feature_extract_unsigned_field() for mte and ovr and do a
hard-coded min(mte, ovr) as we now it's lower-safe. I don't have a
strong opinion either way, so for this patch:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

