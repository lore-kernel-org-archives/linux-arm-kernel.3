Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F655C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxpoZU1+ViuCyFKnGdl6fiCEtgxKttcJsAKKnxTkilw=; b=neg3QTfK7yDuyGhbsqTJ5zIIwo
	z8nrb4zs5pubvKljaNnSmrBdVz2EqGZ2OwAoyadosnVjE7GvdqywWizinHU900uKdGSAsyacKN0I6
	HapCLUFg/5wCheqrtHV0OlK/QRXTBENRTleB487nJ/PlMm+tObrp34/CV1eG2sV4O+cE/OmzJsy5N
	AJ0uIjKBz3TOy+fVlHhbVuQg9jwsN5ht8hvPb83oRv5s4RTgpgezewgXq7zMrRv2DYKY+Cnptqr2p
	sQ7oBvhUKMu4Oq6TXSloG9v2pJFYHa0CTyAMuKMaB918QUfEDXFHg/7I40sqlbN+JcHLDPQVKX5t2
	mYq5rOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vBs-0000000FyKi-2JKd;
	Fri, 11 Sep 2026 06:56:52 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vBo-0000000FyJr-42bF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:56:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=n/zW6ua6iRxPfzI3xP333LOtc/IcOKkvTFV9pMi3dFM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789109805; v=1; x=1789714605;
 b=U4MGc5h66DBYcqoi4LeBRQDlhyr72bn4JjaEM2mzTOi87Ib9zDxdIUfOJCk9Gt2vKpHCoxpP
 CDL6w2IlhS/UtnWN8qvmtE1BMj03yF5QhPRXFI4W2bY4l3+RmVlp9W4DTVqP847tSkMxSBZfPHf
 5hix71FB1VWDa/xJT0tEo5lU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cdc2a9a0f22d82e6;
	Fri, 11 Sep 2026 06:56:45 +0000
X-Mizu-Trace-ID: cdc2a9a0f22d82e6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so2493e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 23:56:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBLDjig3jQgYjbLJUQC9OFNWwRAkZQvc12KqSLEtva+eTpStOTNduIh8dkYdiJN/vdbxrLyZ3szJzMn28jRRFX@lists.infradead.org
X-Gm-Message-State: AFuF++mOq5OdAlPzRWwuB8l4R8McwUHJ2p4+iKXkZJqaNI40DtOyi1ok
	jpSCvue9lDMXDKnWoOcZCpKBKLeXdILgRf8EiuK4FAMRGjUTI5J0HWvE7TdmngpCClRxj0AuGTS
	NEl5Jpi7X39MxBFUDFpMJd5bHOoWcGFEl/zCvB+oo
X-Received: by 2002:a05:6512:2507:b0:5b8:9e63:dfb4 with SMTP id
 2adb3069b0e04-5b8a06787b3mr101329e87.14.1789109800794; Thu, 10 Sep 2026
 23:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260909063156.89636-1-kmehltretter@gmail.com>
 <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com> <20260910190528.4483-1-kmehltretter@gmail.com>
In-Reply-To: <20260910190528.4483-1-kmehltretter@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 11 Sep 2026 07:56:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw5-7688CEkUXNZ5rxQ=JPVdedTZwnx-ivdAoQefuc+fA@mail.gmail.com>
X-Gm-Features: AcwNN1V9j7elh0f_x24Ka1uap6RiGRbBErx8XKNzFJ08kBvwcJMrIK8GbJ0IEdU
Message-ID: <CA+EHjTw5-7688CEkUXNZ5rxQ=JPVdedTZwnx-ivdAoQefuc+fA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_235649_283746_049A0508 
X-CRM114-Status: GOOD (  17.29  )
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

On Thu, 10 Sept 2026 at 20:05, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> kvm_get_vtcr() takes a parameter named phys_shift, but its kernel-doc
> describes phys_shfit. This leaves the real parameter undescribed and
> adds an excess parameter description to the generated documentation.
>
> Correct the spelling and describe phys_shift as the IPA size in bits.
> The value written to VTCR_EL2.T0SZ is 64 - phys_shift, rather than
> phys_shift itself.
>
> Fixes: bcb25a2b86b4 ("KVM: arm64: Refactor kvm_arm_setup_stage2()")
> Suggested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
> ---
> Changes in v2:
> - Describe phys_shift as the IPA size in bits (Fuad).
>
>  arch/arm64/include/asm/kvm_pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 41a8687938eb..20d12da3d28e 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -532,7 +532,7 @@ u64 kvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
>   * kvm_get_vtcr() - Helper to construct VTCR_EL2
>   * @mmfr0:     Sanitized value of SYS_ID_AA64MMFR0_EL1 register.
>   * @mmfr1:     Sanitized value of SYS_ID_AA64MMFR1_EL1 register.
> - * @phys_shfit:        Value to set in VTCR_EL2.T0SZ.
> + * @phys_shift:        IPA size, in bits.
>   *
>   * The VTCR value is common across all the physical CPUs on the system.
>   * We use system wide sanitised values to fill in different fields,
>
> base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
> --
> 2.53.0

