Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8283C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcOspRrvRv34l0RIdRro9uMbAPmtUQwp1m1TAhCOtQA=; b=RWdymSF3pMpLR+TsOJcRSsoBrG
	8LtkgOs9Vg+WjA9ooxcHR25e8YE7BQbMY4m1fM0Hcg9C0Fn1TvFdYVfY94H2RijQ0sedZ8vQG8MaF
	2fYEE0RstILEMU2ldlgwand+oboacn+cbWMrZVM7aalR3KWnuVtOs6v1kN4hhZBHokPgE1tF6ELrX
	Vc0zU6vvJb/tJfsbwGGUVKKIN3MstE68vGxM7Zxifqgm72FjlJIhns279+H14SOp2hxPX6Fne1S9i
	08E20BqQSI0BkM/0ziFRRmCrId5ijf40fjai/LGR1ZMLj5ddrwKoixhpNGSjg0+w5smGizU5ZQXaV
	91XjgCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMcl-00000002qoj-1b8y;
	Fri, 08 Aug 2025 12:55:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMPS-00000002pUB-2CYr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 12:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 958FCA55E2F;
	Fri,  8 Aug 2025 12:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2220EC4CEF4;
	Fri,  8 Aug 2025 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754656881;
	bh=zlgu9JSVlseeLyVrq6HQ3TQhoDjjj/5JeROwbBJkVLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxSs+j5ft/UKaggtneb1Y+z4+vN3e+LSz3cz+zbyVrW5boZXsOxE+cbnxfX3HQwT8
	 7PH6nay715b1YnyU66BVfb4FXTAf39zoaj/CmtElLTUmgzMdqRxmtUx7hXZI+nMdTp
	 iu4eMTQDTGR6ZMHSfMx7RFwGKeH84QQPfEXKnNnLPTvUWnhijvSsLDTXX/yf2lFy2y
	 agqiFdLEJWZC21Q84CdXd7ebBcWrNJpH5NazkrF7ca0DJeEYZX0m+CsIqUOTJkM6AI
	 jVsWYUw7BMmc7giBmlVy7AWxXBDM9ssqvVzAPbzsDUyzIzZ3a1LlSFxz0l0xwjg9+e
	 0V5esqtG6Balg==
Date: Fri, 8 Aug 2025 13:41:14 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v9 4/6] KVM: arm64: Mark optional FF-A 1.2 interfaces as
 unsupported
Message-ID: <aJXwan8iMtRBkiPX@willie-the-truck>
References: <20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com>
 <20250730-virtio-msg-ffa-v9-4-7f1b55c8d149@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-virtio-msg-ffa-v9-4-7f1b55c8d149@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_054122_626113_FF60D106 
X-CRM114-Status: GOOD (  13.86  )
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

On Wed, Jul 30, 2025 at 09:15:07PM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> Mark FF-A 1.2 interfaces as unsupported lest they get proxied. Also mark
> FFA_EL3_INTR_HANDLE as unsupported as it is only valid for physical
> instances.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 48183fa78014e420372c4fb5e489519bc652bf53..7fe96fe626d630a9009551e8dec1683617acafbd 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -674,6 +674,13 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_NOTIFICATION_SET:
>  	case FFA_NOTIFICATION_GET:
>  	case FFA_NOTIFICATION_INFO_GET:
> +	/* Optional interfaces added in FF-A 1.2 */
> +	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
> +	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
> +	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
> +	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
> +	/* Unsupported interfaces added in FF-A 1.2 */
> +	case FFA_EL3_INTR_HANDLE:		/* Only valid for secure physical instances */

Shouldn't the secure side be rejecting that one for us, then?

>  		return false;
>  	}

Regardless,

Acked-by: Will Deacon <will@kernel.org>

Will

