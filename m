Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93100C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Vb0tK4uQ8x9F7U1umV0BM5+HYCiAFR0WZbXykqHva0=; b=o27P1gi2uoMGvG+Gu+DfeOLzcm
	71m3b3tmMCn1flPoP/Q6m2RfqXn6NuF0DaE0dcGvsxLkiqj5DxuXEwmDmj05hlSC5V6F3s5RESCFF
	536ojEy2o4RAzLEgBG6pNJI8fmKOEvOH4+Pu7xGKRocGu+Nvu8rY2D5hE2g+UbmFfos6Kx7bBU+yW
	9v+/avKX6CN8k6jmHyhEW3OVmS6/Fe3QQ50m+jqpJl+caPTT+Jhql7bcqn+OOKGe8pory4s5LQM3i
	NPtHgkrPd3dut2JJvMlTtGd7V1Uj15BlpOyU0iokw/AAy05/Cu2syfqNE/Mk3+B0iJA4biKV54p9L
	SFSJdg9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwglP-00000009uK5-41LX;
	Wed, 19 Aug 2026 13:55:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwglN-00000009uJk-3JmD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 13:55:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19A4F14BF;
	Wed, 19 Aug 2026 06:55:24 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFD673F763;
	Wed, 19 Aug 2026 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787147727; bh=UuEKHUn7xr7WabqbuM3/XgJTz2Viqf/N0nxnnC3djV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WEii9Sm6ptsXldQBo3H7icR9c5y/Ww/U0WGgnltI09o1uRCn/3MaKwh+KBr83JDBe
	 4xl5gYp+vubiL6q55Aaaajcsk/pGksWdp5Ca73IFFbI8/akhxPDnD8EbX9g+JhHfPu
	 u+/pVIcUI2guZhZCGmbS1oDlEgMHk9q09jsSuMR4=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 02/14] KVM: arm64: Fix FGT mapping for HFGITR_EL2.nGCSEPP
Date: Wed, 19 Aug 2026 14:55:23 +0100
Message-ID: <aoW1ywZGCvJaYQqN@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812-arm64-gcs-v19-2-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org> <20260812-arm64-gcs-v19-2-9105afd828ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_065529_874184_27C86576 
X-CRM114-Status: GOOD (  18.66  )
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

On Wed, Aug 12, 2026 at 08:12:01PM +0100, Mark Brown wrote:
> The encoding to trap mapping currently maps a FGT on OP_GCSPOPX to
> HFGITR_EL2.nGCSEPP but as per DDI0601 2026-06 this FGT controls trapping
> of GCSPUSHX and GCSPOPCX, and not the separate GCSPOPX instruction.
> Update the mapping to reflect the architecture.

That information seems to match the one in Arm ARM version M.c.
nGCSEPP, bit [59]
	When FEAT_GCS is implemented:
	Trap execution of any of the following AArch64 instructions at EL1 to EL2:
		• GCSPUSHX.
		• GCSPOPCX.

It looks like GCSPOPX can fault if the record is not a valid entry, but 
there seems to be no trap register bit for that.

Thanks!
Leo, 


> 
> Fixes: 863ac38984a82 ("KVM: arm64: Add missing HFGITR_EL2 FGT entries to nested virt")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kvm/emulate-nested.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 3c82f392845d..b32742d9dd73 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -1432,7 +1432,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
>  	SR_FGT(OP_AT_S1E1A, 		HFGITR, ATS1E1A, 1),
>  	SR_FGT(OP_COSP_RCTX, 		HFGITR, COSPRCTX, 1),
>  	SR_FGT(OP_GCSPUSHX, 		HFGITR, nGCSEPP, 0),
> -	SR_FGT(OP_GCSPOPX, 		HFGITR, nGCSEPP, 0),
> +	SR_FGT(OP_GCSPOPCX, 		HFGITR, nGCSEPP, 0),
>  	SR_FGT(OP_GCSPUSHM, 		HFGITR, nGCSPUSHM_EL1, 0),
>  	SR_FGT(OP_BRB_IALL, 		HFGITR, nBRBIALL, 0),
>  	SR_FGT(OP_BRB_INJ, 		HFGITR, nBRBINJ, 0),
> 
> -- 
> 2.47.3
> 

