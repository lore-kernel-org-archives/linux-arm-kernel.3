Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E54C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvnBzrUj32T7w5eGUMAO+51I2zUKuMf1Xzrvgv6Di7Y=; b=mZQ/xWj6egBrYLq6/VC4tJD8eV
	m8lGuayvR/YRbVozRLESM9T4nUFJXNR2DJiPDBos1ZyV0e/92UA0/jKUCw8AodlRLqopma6H28NBa
	wCd3n3zgx4RNcewD+1TYPdPEvymNkJ6e9U+w1n0TIXsHzzvADYmBtmxwDD5VaHrZNZPSkHoFCypNp
	jgbgX5pxtrExtRvLuojoHWfzaUvOMox1HHBdiEQbaF3xL17ILTGCCnvY3rFGlzcAOPm5wwTF1GlFn
	GP+Ep0yFimtEd4Y0nhvo7kOpczNC6MeUh8NPazO0jAFF10XJs3L3Axo4OD2LH7zvbb/QVrBuKrx5d
	s6p4zkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mjb-0000000A6LG-1esL;
	Tue, 29 Apr 2025 15:18:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mEw-0000000A0LH-2YAe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F32AB61567;
	Tue, 29 Apr 2025 14:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EDDC4CEE3;
	Tue, 29 Apr 2025 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745938037;
	bh=YrCTaP+tcbajXC6/b7SoFDFq5t/KwEus2QAmCVIBrgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbR1oFYPepr21AnMku8sxgvGJfsYYvl+fDZNSEjow+OM+SmnawdmzUYE6W503cQt8
	 XZjoDeTObvh5TG7hYoRM1I4oxZUxAxaTjfJA1NwXoiMeZJwrf/fC8leQincBNcved7
	 yP3NDUoYMLwFAh5F3o0o/MmxYtdPTDBBlEL8y7zs5hklYuV8BGzfckSbcG6qogpMVa
	 iHNbiGVS1X/EN75MQp6WlLOtNog52OasZ3jLYJwKOIQwiFOyOzy6I+tG5h5xKDRO4X
	 McRfIe8Isa3OaUzcWQOArxt0gUukeKzFVYMnyDILtjyd401Es3kKvyAzdQPPtMEkqS
	 cP6smDLj3VjUA==
Date: Tue, 29 Apr 2025 15:47:10 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	yangyicong@hisilicon.com, tangchengchang@huawei.com,
	broonie@kernel.org
Subject: Re: [PATCH v2 1/6] arm64: Provide basic EL2 setup for FEAT_{LS64,
 LS64_V} usage at EL0/1
Message-ID: <20250429144710.GA26174@willie-the-truck>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-2-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331094320.35226-2-yangyicong@huawei.com>
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

On Mon, Mar 31, 2025 at 05:43:15PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Instructions introduced by FEAT_{LS64, LS64_V} is controlled by
> HCRX_EL2.{EnALS, EnASR}. Configure all of these to allow usage
> at EL0/1.
> 
> This doesn't mean these instructions are always available in
> EL0/1 if provided. The hypervisor still have the control at
> runtime.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/arm64/include/asm/el2_setup.h | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index ebceaae3c749..0259941602c4 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -57,9 +57,19 @@
>          /* Enable GCS if supported */
>  	mrs_s	x1, SYS_ID_AA64PFR1_EL1
>  	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
> -	cbz	x1, .Lset_hcrx_\@
> +	cbz	x1, .Lskip_gcs_hcrx_\@
>  	orr	x0, x0, #HCRX_EL2_GCSEn
>  
> +.Lskip_gcs_hcrx_\@:
> +	/* Enable LS64, LS64_V if supported */
> +	mrs_s	x1, SYS_ID_AA64ISAR1_EL1
> +	ubfx	x1, x1, #ID_AA64ISAR1_EL1_LS64_SHIFT, #4
> +	cbz	x1, .Lset_hcrx_\@
> +	orr	x0, x0, #HCRX_EL2_EnALS
> +	cmp	x1, #ID_AA64ISAR1_EL1_LS64_LS64_V
> +	b.lt	.Lset_hcrx_\@
> +	orr	x0, x0, #HCRX_EL2_EnASR

How do these HCRX settings survive a world-switch to and from a KVM
guest? AFAICT, the trap deactivation path there restores HCRX_HOST_FLAGS
when returning to the host. That would mean that the GCS code is broken
too, unless I'm missing something :/

Will

