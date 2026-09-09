Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AA0C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/GozqjNS+nZPh3bi2McJn9aAUjQnsCr44GxKeRYmsw=; b=Jc1RoZ3G4BXMSx3FtdF/7ULld7
	uZXdnH7dpRmS8soIaMN2IxziBKbVH7x8K/DG20Ojob3cCInnFlIOIvjqpRyDhGUVSblAxf8lmhz0i
	i0PnKopzxr/GV8F5oaHxSRdjhPrDsnVoBPYFzUIsLjyJa8122bibC6ENXqFFe9Db1f8lZdAAxCpfv
	dHHYfsgKPDy440nuy0uQ1tz9Jt1mgB1lDf3es1n0jBaKITu122wLR1fwjnkozSXaxHU5Qv73tCRKC
	Pht8aRp56AjNSgfG1iJAFBT3/F4liU84upZIaOD3aupSu5GgYWxaJMeF6Gw3X/MTgdFBcs5s2VZYc
	+76P1wzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LRj-0000000CNap-2XDX;
	Wed, 09 Sep 2026 16:46:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LRh-0000000CNa9-2ENA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:46:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B001576;
	Wed,  9 Sep 2026 09:46:44 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B4E13F7B4;
	Wed,  9 Sep 2026 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788972408; bh=4TndDloq+AItaLXnNBU8qh1Mw2UhLyfnZXaiWE4jPS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V1AFUPNbuhEBKiobjWPCp0b95i41n6A+WoUJXxXvM++FWfL4/j3EOHDrJGD+SPn3c
	 20IMLCfCHD+cyIdQz7CdP9HkJfcWRYNjApsYOoa8Xt0TTcnmYISnSwqro8mN85mAdJ
	 QC80g7Yd0j9M/g9UPcA6bRQiiAJ/2suPHIZKPp34=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [PATCH v20 10/14] KVM: selftests: arm64: Add GCS registers to get-reg-list
Date: Wed,  9 Sep 2026 17:46:43 +0100
Message-ID: <aqGNc5zg0iRWNU_j@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-10-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-10-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_094649_659630_E824A34B 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, Sep 01, 2026 at 10:47:08PM +0100, Mark Brown wrote:
> GCS adds new registers GCSCR_ELx, GCSCRE0_EL1 and GCSPR_ELx. Add
> these to those validated by get-reg-list.
> 
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/kvm/arm64/get-reg-list.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
> index 533994687b5d..5c1469153b6c 100644
> --- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
> @@ -42,6 +42,12 @@ struct feature_id_reg {
>  static struct feature_id_reg feat_id_regs[] = {
>  	REG_FEAT(TCR2_EL1,	ID_AA64MMFR3_EL1, TCRX, IMP),
>  	REG_FEAT(TCR2_EL2,	ID_AA64MMFR3_EL1, TCRX, IMP),
> +	REG_FEAT(GCSPR_EL0,	ID_AA64PFR1_EL1, GCS, IMP),
> +	REG_FEAT(GCSPR_EL1,	ID_AA64PFR1_EL1, GCS, IMP),
> +	REG_FEAT(GCSPR_EL2,	ID_AA64PFR1_EL1, GCS, IMP),
> +	REG_FEAT(GCSCRE0_EL1,	ID_AA64PFR1_EL1, GCS, IMP),
> +	REG_FEAT(GCSCR_EL1,	ID_AA64PFR1_EL1, GCS, IMP),
> +	REG_FEAT(GCSCR_EL2,	ID_AA64PFR1_EL1, GCS, IMP),
>  	REG_FEAT(PIRE0_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
>  	REG_FEAT(PIRE0_EL2,	ID_AA64MMFR3_EL1, S1PIE, IMP),
>  	REG_FEAT(PIR_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
> @@ -503,6 +509,9 @@ static __u64 base_regs[] = {
>  	ARM64_SYS_REG(3, 0, 2, 0, 1),	/* TTBR1_EL1 */
>  	ARM64_SYS_REG(3, 0, 2, 0, 2),	/* TCR_EL1 */
>  	ARM64_SYS_REG(3, 0, 2, 0, 3),	/* TCR2_EL1 */
> +	ARM64_SYS_REG(3, 0, 2, 5, 0),	/* GCSCR_EL1 */
> +	ARM64_SYS_REG(3, 0, 2, 5, 1),	/* GCSPR_EL1 */
> +	ARM64_SYS_REG(3, 0, 2, 5, 2),	/* GCSCRE0_EL1 */
>  	ARM64_SYS_REG(3, 0, 5, 1, 0),	/* AFSR0_EL1 */
>  	ARM64_SYS_REG(3, 0, 5, 1, 1),	/* AFSR1_EL1 */
>  	ARM64_SYS_REG(3, 0, 5, 2, 0),	/* ESR_EL1 */
> @@ -519,6 +528,7 @@ static __u64 base_regs[] = {
>  	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
>  	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
>  	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
> +	ARM64_SYS_REG(3, 3, 2, 5, 1),	/* GCSPR_EL0 */
>  	ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
>  	ARM64_SYS_REG(3, 3, 13, 0, 2),	/* TPIDR_EL0 */
>  	ARM64_SYS_REG(3, 3, 13, 0, 3),	/* TPIDRRO_EL0 */
> @@ -740,6 +750,8 @@ static __u64 el2_regs[] = {
>  	SYS_REG(VTTBR_EL2),
>  	SYS_REG(VTCR_EL2),
>  	SYS_REG(VNCR_EL2),
> +	SYS_REG(GCSPR_EL2),
> +	SYS_REG(GCSCR_EL2),
>  	SYS_REG(HDFGRTR2_EL2),
>  	SYS_REG(HDFGWTR2_EL2),
>  	SYS_REG(HFGRTR2_EL2),
> 

Checked the IDs, everything seems correct.

Thanks!
Leo

