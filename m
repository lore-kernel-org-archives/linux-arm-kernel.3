Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824B0C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 03:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTRnNfJzox1g7O08w+tlJMliE38kRw1J1NBEDURVXVA=; b=nkRJB0cx8A8CbDE6CbwqK+eIBX
	M9JeE8Z5Y0TIYVRe2eVGo9QCdVvbgAvpCizGJm2XyAi4pQKuBRc2RNrRP53YIZGdqAzCPRyEer0/5
	at4kaarfc05SvsoQOBDQAfli4GLLcjrGv203na+gGHsDf838J2raaDN/e7Lhhgl0qv4fwP7bVJb2w
	JJb4JFgeDU/ejueyP3e4HeRqvHY4NGpPtA16j0E3HRau8oenWmQi4FyBJ2d7qitOskaX2L15j65nO
	mdDHkirqAuuMme7al7IpxMKtDNcaGAyug7BM7UBzv6LEJNdox0apFxq9XqzAVgKeKNRsPAGqN8baK
	99Pii9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x48xh-0000000Ahvi-1BbA;
	Wed, 09 Sep 2026 03:27:01 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x48xc-0000000AhvB-0JzQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 03:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788924420; x=1820460420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KSyW9PSmayMg2D+RSx0FNS4dlNPtfBwvV/djeGs+FPo=;
  b=QcPmkDUW/l3LLgVDe/qRqiQpyazN6L7Mphe4IR+IvJ2sGZ4tN92TL3Xg
   mebmys2XB8J9DYOMhw7VTrbnBUkCkLZhXIS6xhAkC/Dp/9PsdKXMiJHiN
   I2nVG7kpaQMvoAlKsqBiOnEXt2sNnumB+tHFfdSxFKjscX/c5JbllXkrV
   r9CcBChFCBqYtpETRpjfUJdS140CsEQ2yOMksZqdIfPxEipu5UCElFJbz
   0XIGxaRlpgdwxjdoAzmWD42gFMDbC0EiepPC8W715Gn4ifCNfvWlD0SCD
   FpfB4Z7dfcR91c/4+5wW/vRm7SR0H7Ub9MGOvbBz3FPLBIv6tcHIA5njq
   g==;
X-CSE-ConnectionGUID: +atCFLagRDiNVSs0j6uYiQ==
X-CSE-MsgGUID: ZiOcfzaJSum0qoO+f5hq7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="240598642"
X-IronPort-AV: E=Sophos;i="6.25,270,1779116400"; 
   d="scan'208";a="240598642"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 12:26:57 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ABBDB10000C4
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Sep 2026 03:26:52 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 60CA11C00145
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Sep 2026 03:26:52 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.24.243])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id E82DC1802ED5;
	Wed,  9 Sep 2026 03:26:44 +0000 (UTC)
Date: Wed, 9 Sep 2026 12:26:41 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org
Subject: Re: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
Message-ID: <aqDFcgzXOTWUkPtp@FCCLS0092175.localdomain>
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-7-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908162223.1683432-7-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_202656_703307_3D25530F 
X-CRM114-Status: GOOD (  19.75  )
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

Hi Suzuki,

On 09/08 17:22, Suzuki K Poulose wrote:
> Add an explicit mode to support Arm CCA guests.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  arch/arm64/include/asm/kvm_host.h               | 1 +
>  arch/arm64/kvm/arm.c                            | 5 +++++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd24..1afe3df3b923e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3256,6 +3256,9 @@ Kernel parameters
>  			nested: VHE-based mode with support for nested
>  				virtualization. Requires at least ARMv8.4
>  				hardware (with FEAT_NV2).
> +			rmm: Support for running confidential guests in Realm
> +			     world using RMM, as defined by Arm Confidential
> +			     Compute Architecture (CCA)
>  
>  			Defaults to VHE/nVHE based on hardware support. Setting
>  			mode to "protected" will disable kexec and hibernation
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index b2e99c5cb1cd3..31ae9d8d8e92f 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -69,6 +69,7 @@ enum kvm_mode {
>  	KVM_MODE_DEFAULT,
>  	KVM_MODE_PROTECTED,
>  	KVM_MODE_NV,
> +	KVM_MODE_RMM,
>  	KVM_MODE_NONE,
>  };
>  #ifdef CONFIG_KVM
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 9af3bbb2f8c24..50f0adfadab38 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -3264,6 +3264,11 @@ static int __init early_kvm_mode_cfg(char *arg)
>  		return 0;
>  	}
>  
> +	if (strcmp(arg, "rmm") == 0 && !WARN_ON(!is_kernel_in_hyp_mode())) {
> +		kvm_mode = KVM_MODE_RMM;
> +		return 0;
> +	}

Does this make NV support and CCA Realm VM support mutually exclusive?

Until the v16 series, we could run Realm VMs with:
  'kvm-arm.mode=nested'

As far as the AArch64 architecture is concerned, there does not seem to
be a reason to make them mutually exclusive. I am therefore wondering
whether this restriction is intentional.

Thanks,
Kohei

> +
>  	return -EINVAL;
>  }
>  early_param("kvm-arm.mode", early_kvm_mode_cfg);
> -- 
> 2.43.0
> 

