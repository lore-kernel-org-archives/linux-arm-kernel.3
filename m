Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CD3CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SS1JqwRjjqdsFLQmT2MfY6LOSC4xZZFVHZciuXtnvM=; b=RLDtsC7Db8KjjgxmCqqdkAzsC6
	fNDYuQrUOPf1r5OU13DqcEyGJCUPSb5MqaPJXC1r/hiYSE/PObc3TQrnH6m68XsoEl6hGdmfe+3WC
	NR5D5lutqCS3qUU8T3H7WOF3AFb0d8nubel2HCumj+UQvIFkpSzE1rb84RgZjdhN7jJ5JDhT9vThb
	lXD2XMjhkyTxUFBRt1VmCCmdnSt/P0qWTVaiwapPtF8aaGlcWfwkviCn8A7xQsPL6b12BnzgGGwlF
	Qdby24RPtBSdKlypAyHiEqYC6q870ECiR6KPqBYo21f662zeR7VnPjrxxM1Hmx/kE/3Ov7p4VcFoR
	nhHZr1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLIL-0000000APMi-30eA;
	Tue, 19 Aug 2025 12:18:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJWp-0000000A7hU-3a9e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:25:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0CF81BD0;
	Tue, 19 Aug 2025 03:25:08 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C0B33F63F;
	Tue, 19 Aug 2025 03:25:15 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:24:34 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 3/6] KVM: arm64: Ignore HCR_EL2.FIEN set by L1 guest's
 EL2
Message-ID: <20250819102434.GA3736290@e124191.cambridge.arm.com>
References: <20250817202158.395078-1-maz@kernel.org>
 <20250817202158.395078-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817202158.395078-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_032519_943578_13A5A250 
X-CRM114-Status: GOOD (  18.52  )
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

On Sun, Aug 17, 2025 at 09:21:55PM +0100, Marc Zyngier wrote:
> An EL2 guest can set HCR_EL2.FIEN, which gives access to the RASv1p1
> fault injection mechanism. This would allow an EL1 guest to inject
> error records into the system, which does sound like a terrible idea.
> 
> Prevent this situation by added FIEN to the list of bits we silently
> exclude from being inserted into the host configuration.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/hyp/vhe/switch.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index e482181c66322..0998ad4a25524 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -43,8 +43,11 @@ DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
>   *
>   * - API/APK: they are already accounted for by vcpu_load(), and can
>   *   only take effect across a load/put cycle (such as ERET)
> + *
> + * - FIEN: no way we let a guest have access to the RAS "Common Fault
> + *   Injection" thing, whatever that does
>   */
> -#define NV_HCR_GUEST_EXCLUDE	(HCR_TGE | HCR_API | HCR_APK)
> +#define NV_HCR_GUEST_EXCLUDE	(HCR_TGE | HCR_API | HCR_APK | HCR_FIEN)
>  
>  static u64 __compute_hcr(struct kvm_vcpu *vcpu)
>  {
> -- 
> 2.39.2
> 

