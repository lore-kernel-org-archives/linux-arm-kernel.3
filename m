Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1DAC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9WgP33HL5G6CRzfmwsVbcpa3fKze55obxLXR9avY9w=; b=fwUTZUFv9Ar9db+JmyOmo6dzay
	EytgGDzXoA59PWEaq4n4LX9MKhPUxnEDubD5V09WZ+6vgCAGFudleEa/jaYtlo8Y0ZayXUVMi/iDd
	enREHF960gahHwxxsUoUa9V+bDtUBNVGmFZgsDbHgj7qS3NbVvOPgb+Xi0IiT0yVEFqnrL5zShU/v
	ZEW4JVNXXcK5rTQzJCYnXUxQ9FI38aM5MtDK5EaTjjW9ix6c7YsF41EVcYp5ZtAMnzcy69+N77Hrf
	pDXxTj6so4xtv7MYiVpad2CKgjUEudjSLC/tonNw12oTKtAhPFmr/49ymvwc6rFbGzyuSTbSWR3/M
	hc9IRhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmT6q-0000000CaXZ-2HAb;
	Mon, 24 Feb 2025 07:42:36 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmT4g-0000000CaHa-0pg8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 07:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1018761177;
	Mon, 24 Feb 2025 07:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE27C4CED6;
	Mon, 24 Feb 2025 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740382821;
	bh=4CyLXJ2S1ic9X6I/59uuXieSdeweNmqD9gOdi7QuBSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZqZcH9auEw6Dli9U1U7g3sQMuWokdauRl5alYlvCJJ042MaEgoyctxTUngyMV0ToL
	 rt3hIcq157CFTnnF5gu+w5OLV0y+NhQOzsAbWbq1FJ93TGPG2QUDV9HESrhqpEnq1i
	 JDTX6DtIWquO4L5ijwZhkmKg+fmy+DhoLt70Uh2LaM9JyN+hlwnfcxvXIeKz1wTd3k
	 qSIJgRtTQTaH3o4nwUdHiERzI3GaL4nF6Q+Zb2IeaKCgNg3z5/xxU+PFxrfXKZTLyp
	 NIoPZp7exYAJVjSpAEGckBykjW/JUBTyULzAkVB6L7qZbjOp8X5rwElt4BhtfnOCbM
	 n33ecCjg3mtqA==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 03/14] KVM: arm64: Mark HCR.EL2.E2H RES0 when
 ID_AA64MMFR1_EL1.VH is zero
In-Reply-To: <20250215173816.3767330-4-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
 <20250215173816.3767330-4-maz@kernel.org>
Date: Mon, 24 Feb 2025 13:09:30 +0530
Message-ID: <yq5aa5abhjv1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Marc Zyngier <maz@kernel.org> writes:

> Enforce HCR_EL2.E2H being RES0 when VHE is disabled, so that we can
> actually rely on that bit never being flipped behind our back.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/nested.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 0c9387d2f5070..ed3add7d32f66 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1034,6 +1034,8 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
>  		res0 |= (HCR_TEA | HCR_TERR);
>  	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, LO, IMP))
>  		res0 |= HCR_TLOR;
> +	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
> +		res0 |= HCR_E2H;
>  	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, IMP))
>  		res1 |= HCR_E2H;
>

Does it make sense to check for E2H0 if MMFR1_EL1.VH == 0 ?
Should the above check be
	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
		res0 |= HCR_E2H;
	else if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, IMP))
 		res1 |= HCR_E2H;



>  	set_sysreg_masks(kvm, HCR_EL2, res0, res1);
> --
> 2.39.2

