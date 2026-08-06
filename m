Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6B7C5620A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq6flyfzd4bdwnbjtjvmyFpLtE3ryk+Zs3DvD7iNvRQ=; b=mJ7/ufCkszMOL5gMKlmiHdaAqk
	C3OfWLtyRJZCS2biOKmafP7RvELgnyjSfzG414EiY0+ETwkGm9NgZtbVqWD/Omh4ST1byrW+291mw
	hohvC8ES8jy1O0KyKuujRwrjKOzB76lWq5CjuwXuJqYaGXADNXnzxgNi2y7EVRBf0CCjL47oSuf3V
	lAzxkFdj8MsR1dpii0DFOVZftGhso6sdhxJlASKIJOjuXlSHrQo5b4JS/U/NBzccdFDgXoKosDn1N
	CIaoFFspslswrrHt4B4NiCi4iUpIyQB9FfpctmnzEqefTcWTPM9MIp4+rg6vjBDfbyJpdQLZ5w4A7
	tezOwOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvN3-00000005YCp-43kQ;
	Thu, 06 Aug 2026 10:30:41 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvN0-00000005YBy-2hQ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786012230; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=Eq6flyfzd4bdwnbjtjvmyFpLtE3ryk+Zs3DvD7iNvRQ=;
	b=QZYvWJIuunSp8EdrzDjPhjBVJHBDneqFqKF47jrCNjvNN9/lCb7Kg9i/P8OsAiHziXvFfVAvx2P6aNHJzhKcAsjBI+mdJ7drD4v2MaaWaoEEdwlCfkBvLrigQnGwBDVprJ1yH4l+trLJf6r13LZ6Uz6Fj6MdaGBDcukw2yB9ums=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X8TiMfa_1786012228;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X8TiMfa_1786012228 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 18:30:29 +0800
Date: Thu, 6 Aug 2026 18:30:28 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Oliver Upton <oupton@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 05/14] KVM: arm64: Set PSTATE.EXLOCK when entering an
 exception
Message-ID: <cftn7d77lbuaby6hkkkxvcryl2ktnpkbda75dmnqhy2k7gcb6m@f7sy5flqka5d>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
 <20260803-arm64-gcs-v18-5-fd8c40f5ad88@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-arm64-gcs-v18-5-fd8c40f5ad88@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033038_851564_DF94718E 
X-CRM114-Status: GOOD (  16.10  )
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

On Mon, Aug 03, 2026 at 11:56:50PM +0800, Mark Brown wrote:
> As per DDI 0487 R_WTXBY we need to manage PSTATE.EXLOCK when entering an
> exception, when the exception is entered from a lower EL the bit is cleared
> while if entering from the same EL it is set to GCSCR_ELx.EXLOCKEN.
> Implement this behaviour in enter_exception64().
...
> +static unsigned long compute_exlock(struct kvm_vcpu *vcpu,
> +				    unsigned long mode,
> +				    unsigned long target_mode)
> +{
> +	u64 gcscr;
> +
> +	if (!kvm_has_gcs(kern_hyp_va(vcpu->kvm)))
> +		return 0;
> +
> +	/* GCS can't be enabled for 32 bit */
> +	if (mode & PSR_MODE32_BIT)
> +		return 0;
> +
> +	/* When taking an exception to a higher EL EXLOCK is cleared. */
> +	if ((mode | PSR_MODE_THREAD_BIT) != target_mode)
> +		return 0;

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

> +
> +	/*
> +	 * When taking an exception to the same EL EXLOCK is set to
> +	 * the effective value of GCSR_ELx.EXLOCKEN.
> +	 */
> +	if (is_hyp_ctxt(vcpu))
> +		gcscr = __vcpu_read_sys_reg(vcpu, GCSCR_EL2);
> +	else
> +		gcscr = __vcpu_read_sys_reg(vcpu, GCSCR_EL1);
> +
> +	if (gcscr & GCSCR_ELx_EXLOCKEN)
> +		return PSR_EXLOCK_BIT;
> +
> +	return 0;
> +}
> +
>  /*
>   * This performs the exception entry at a given EL (@target_mode), stashing PC
>   * and PSTATE into ELR and SPSR respectively, and compute the new PC/PSTATE.
> @@ -154,6 +186,11 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  	// PSTATE.BTYPE is set to zero upon any exception to AArch64
>  	// See ARM DDI 0487E.a, pages D1-2293 to D1-2294.
>
> +	// PSTATE.EXLOCK is set to 0 upon any exception to a higher
> +	// EL, or to GCSCR_ELx.EXLOCKEN for an exception to the same
> +	// exception level.  See ARM DDI 0487 R_WTXBY.
> +	new |= compute_exlock(vcpu, mode, target_mode);
> +
>  	new |= PSR_D_BIT;
>  	new |= PSR_A_BIT;
>  	new |= PSR_I_BIT;
>
> --
> 2.47.3
>

