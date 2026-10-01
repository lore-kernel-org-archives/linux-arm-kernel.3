Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D027CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53qEhBkxOk8Rhw/laCIFBAvn8/m0XtPcvZMYs9C6rlQ=; b=hVTwFcMTDCnyFtAf9uMZvF5KU5
	JZG88PmJ3QiUbFvYqUJeV8auw7wd2Kh5lciliP/fBp/Kkgz4saWoWBhBmJUzwVhXtImayqs1M46lm
	I+VR8fFS6W+WUgBadvhQnI2QInoWcn1H8QvFyHUAixFEUZJYHeFbzcacnm4QH5i6PPsgfXFpb3Vyv
	RbjKto5tWq70Yc1b7HfPsjPOZ9xTE+MIt4Ob9w15oEEWUFS+07rIwWatYJ8W2pd92SOmSuPVswowr
	Ib8+XmmswIrwAZX4rM17L0ZhjE+qDqE2INQPCIJDYul8UWq2q9AkzCrg2zbJOerhWQE33HwIHaytO
	X8K9PxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJoG-00000009jx6-0YaJ;
	Thu, 01 Oct 2026 16:39:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJoE-00000009jw4-32KV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:39:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9FDC60A58;
	Thu,  1 Oct 2026 16:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407411F000FF;
	Thu,  1 Oct 2026 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790872741;
	bh=53qEhBkxOk8Rhw/laCIFBAvn8/m0XtPcvZMYs9C6rlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ih38u32lPiJYlaJAURPfglfqwPvJJxhtf5w7W7gSfONpcFZzZDJYU6r4nW3CPdmEU
	 GqoXWL8her2J6bcMV8UXzEiEVVlsBpoLP5nByHKacD7wwS26XFQKugqsRKZIFEwVmj
	 JA+xslQaQC1Nbjjt8qzVnPE2bfC9L+z40rHufLphSQVcnGSMrFZtVtthpS5tyd+gFo
	 eNHHwIYCTZloAMKT8sbG25on4W+Cqebz7aZblobreWAHexQC7WiPCBQrziapwvFRGu
	 kjQHnrb96C9aAAslyi6KvHaZlrD9RoddsdxJZtn4H/ENIux8KW4XPqPPetdjdy2xW7
	 KfyM51MqwEu/g==
Date: Thu, 1 Oct 2026 17:38:54 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 12/15] KVM: selftests: arm64: Add GCS to set_id_regs
Message-ID: <ar6MIFW2vfM893yd@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-12-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-12-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:22PM +0100, Mark Brown wrote:
> Now that GCS is configurable via the ID registers update set_id_regs to
> cover ID_AA64PFR1_EL1.GCS.

Should maybe also mention adding the GCS-without-S1PIE test?

>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Looks obviously correct (TM) to me too so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index cb5e6358c59c..9db8516748cc 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -154,6 +154,7 @@ static const struct reg_ftr_bits ftr_id_aa64pfr0_el1[] = {
>
>  static const struct reg_ftr_bits ftr_id_aa64pfr1_el1[] = {
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, DF2, 0),
> +	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, GCS, 0),
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, CSV2_frac, 0),
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, SSBS, ID_AA64PFR1_EL1_SSBS_NI),
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, BT, 0),
> @@ -818,6 +819,12 @@ struct reg_ftr_val {
>  	  .mask = r ## _ ## f ## _MASK,				\
>  	  .val = (r ## _ ## f ## _ ## v  << r ## _ ## f ## _SHIFT) }
>
> +static const struct reg_ftr_val gcs_no_s1pie[] = {
> +	REG_FTR_VAL(ID_AA64PFR1_EL1, GCS, IMP),
> +	REG_FTR_VAL(ID_AA64MMFR3_EL1, S1PIE, NI),
> +	{ }
> +};
> +
>  static const struct reg_ftr_val s1pie_no_tcr2[] = {
>  	REG_FTR_VAL(ID_AA64MMFR3_EL1, TCRX, NI),
>  	REG_FTR_VAL(ID_AA64MMFR3_EL1, S1PIE, IMP),
> @@ -836,6 +843,7 @@ struct ftr_config {
>  };
>
>  static const struct ftr_config invalid_configs[] = {
> +	{ .name = "GCS without S1PIE", .regs = gcs_no_s1pie },
>  	{ .name = "S1PIE without TCRX", .regs = s1pie_no_tcr2 },
>  	{ .name = "S1POE without TCRX", .regs = s1poe_no_tcr2 },
>  };
>
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

