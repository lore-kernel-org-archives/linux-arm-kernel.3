Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42198C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 20:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiIPM4ltNf6XZzPFTxq+rRWafEk/Y3bA28Umn8E7928=; b=PBP47G2lBURQOWvHnMrAibHrHF
	b9u+8f3xS0BXEgRZ/UeVnfBO3ZYLInQyGsWrm1/eeYzc9mPYFjo2HR8FTmzqvdfBzLFiQ4G2+cvFc
	Q8X+21I1OIPBwLNW/D8hqqluj3NW1lTUqMEc56zP20DjfReCCKHYN5qhXkscR+UDLUy41vvS0Ui6c
	Quln75dpzDNbRS0DY2ybGnUEXirQy6VkbuifdgiaQgUWCSQysTRA1MFsfnLA/q4o8F3NeIPFvX2b2
	vfYnwQlGmmVBF2fv0riHPY1o0UQ2qPfh4UVbS8e3YEN883MdUf0RgZcJOy9T/UtThGlOMJCMCbGW+
	M9r+5y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybI8-0000000HMgy-1G1m;
	Mon, 24 Aug 2026 20:29:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybI4-0000000HMgd-3PtL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 20:29:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F0B21BA8;
	Mon, 24 Aug 2026 13:29:03 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D4AD3F7D8;
	Mon, 24 Aug 2026 13:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787603347; bh=kkEoJVrwhvSQohI08+GwUFtwJ2wt4Bh968PHvPB/9Ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DT7qgynbF5QFkVC9xu5uYwXWAp6m9gprdFEoKlio8dN1pDIal/jDyVaw0ViUVto6c
	 RgEShccVTBujpqaM9cv7V87zg7ieEYoNhiTGcR7AR9af1A87YfvKjDe8FMYG8hLdWi
	 RNa0IumFXRhzOKzyH+TRGTKOW+Whd7Y6NJwF8oUg=
Date: Mon, 24 Aug 2026 21:29:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v3] arm64: Don't read GMID_EL1 when MTE is disabled
Message-ID: <aoypji6EJ8zToWvh@arm.com>
References: <20260824184155.2644646-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824184155.2644646-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_132909_089171_49533783 
X-CRM114-Status: GOOD (  13.80  )
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

On Mon, Aug 24, 2026 at 07:41:55PM +0100, Fuad Tabba wrote:
> +/*
> + * Reading GMID_EL1 when the kernel has disabled MTE traps to EL2, and the raw
> + * ID_AA64PFR1_EL1 reflects neither CONFIG_ARM64_MTE nor the cmdline override.
> + */
> +static inline bool gmid_el1_accessible(u64 pfr1)
> +{
> +	if (!IS_ENABLED(CONFIG_ARM64_MTE))
> +		return false;
> +
> +	pfr1 &= ~id_aa64pfr1_override.mask;
> +	pfr1 |= id_aa64pfr1_override.val;
> +
> +	return id_aa64pfr1_mte(pfr1);
> +}

Can this function not use __read_sysreg_by_encoding() directly and not
get an argument at all? We'd get the override from that function rather
than open-coding it here. Eventually, once we get Suzuki's clamping fix,
it also ensures we won't be able to bump the MTE version to unsafe
values (but that's a different fix from this one).

If you are worried about additional trapping of the MRS, we should go
for Will's improvement to always read the cached values in
__read_sysreg_by_encoding().

-- 
Catalin

