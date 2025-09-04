Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D91CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EghQiz4fNiRlJcfHUyDaJ9colM5Al8GK6C22CPulc8=; b=DyVZ/8QVlMYLleaPnQtbQ8Cxdj
	t6LBJf8I4AYHDTQ27/j8Tw/ckrNg5NdfKvQtD2v+yk2tMi7XUPU3s1l1kDQOrgw5bu4hoySLgsFKu
	9pLz2PL6qeCQjWoP5E5qlJo4IoGS9i/DVSraf6oBclIGuRSvTHrHn8KVfR+O0quuL4GKs39V2HT+n
	mKwGnwvea/xaOh9E4fP1JNEBouBXNNYDLrJsks6gNb/7ehdD2ftbwtPqu9Zv8YNWJz/Zd6AKdIzjj
	pU8inuc47lWLemIqRD8eaoX83Kn+XiwQ9XqkG51GfC6Vc9Q7GLmGOYDamUIZo+BeJe4kn9EFD+jZT
	fZKNIRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5aa-0000000AKLh-21ir;
	Thu, 04 Sep 2025 08:45:04 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4sg-0000000A3MV-2ZU0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:59:44 +0000
Date: Wed, 3 Sep 2025 23:55:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756972777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4EghQiz4fNiRlJcfHUyDaJ9colM5Al8GK6C22CPulc8=;
	b=jmZk3j5d2GrS8ZZp0HJVIXAZU3gPfu+kv2H8ziDQYobWptCllCEC1sbizguIYhV08h9vUW
	7rgI1rW7GbmYGW6tIKtgy1veeuNqesfJlKRlfV2Kx8RdKCF37tgQzhpT5s8DWwc0JIcahp
	8ciyoUk/UmV3Q+XyZHFn7B4wiBWfU2A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: VHE: Initialize PMSCR_EL1
Message-ID: <aLk3xLd8ylxP63hH@linux.dev>
References: <20250902130833.338216-1-alexandru.elisei@arm.com>
 <20250902130833.338216-2-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902130833.338216-2-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_005943_083349_ABE71DAA 
X-CRM114-Status: GOOD (  14.72  )
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

On Tue, Sep 02, 2025 at 02:08:32PM +0100, Alexandru Elisei wrote:
> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
> index 381382c19fe4..e7ce0d5a622d 100644
> --- a/arch/arm64/kvm/debug.c
> +++ b/arch/arm64/kvm/debug.c
> @@ -74,13 +74,19 @@ void kvm_init_host_debug_data(void)
>  	*host_data_ptr(debug_brps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
>  	*host_data_ptr(debug_wrps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0);
>  
> +	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
> +	    !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P)) {
> +		if (has_vhe()) {
> +			/* Clear E{0,1}SPE, which reset to UNKNOWN values. */
> +			write_sysreg_el1(0, SYS_PMSCR);
> +		} else {
> +			host_data_set_flag(HAS_SPE);
> +		}
> +	}
> +

nit: While this is correct, from a code organization perspective it
doesn't belong here. The rest of this function is concerned with probing
hardware state and initializing the corresponding host data.

I prefer Marc's suggestion which could be wrapped up in a function called
'kvm_debug_init_vhe()' or similar.

Thanks,
Oliver

