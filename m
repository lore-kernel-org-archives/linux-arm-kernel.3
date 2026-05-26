Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBBCCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqpmKJN6rMCxkYh0T8ViH8fmOM1NoUNjeL1srAf/24M=; b=rf+Y9FXy22DpgO/3GP7xVqt5p7
	2EgQCdwocu1Y9cfas+bfKgXneNIWQmONQuZ6YIBcQ3gxV0ykAniebjkDM/tKsdEvdyTnZrvwvIZMI
	XSRVHicMOGZh3bdnILdKrLPeZr/r3HzNopkvyWeiJK3uCpqLYAykAVUpY4wjHL63JdwXy10pI5eQ2
	MiPnl3ApJ7KbxlSfLpaPNObvTEBUEcz5rzOWDGjHva96ivO8y/ED96hHmX3GR1AgzcYrdSuDIqRxI
	ndNAWbjyB4HwGNFUDaGFSq8+c9KGaS/JEsWAZTrNZJzen0ziDoiFVrmln57/UP3b4IgzyVx21IdUi
	oAZujmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRs2O-000000025JE-3LWT;
	Tue, 26 May 2026 13:41:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRs2M-000000025Ib-2iBI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:41:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34B25169C;
	Tue, 26 May 2026 06:41:32 -0700 (PDT)
Received: from [10.1.28.159] (e121487-lin.cambridge.arm.com [10.1.28.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DBF83F7D8;
	Tue, 26 May 2026 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779802897; bh=zovRuUMtML0sEnA6OEq5GlsauZ6Wk0t5c37ktbnESOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fd+j7S0DnwqIIR3oGp8IZBXpKBXuqYiDZ1+02zrvCb+PwUuoqdUJ11xfpGDIu6whV
	 YygeT/jiUDhO5CZnY2G9WmxNTUN1Bwj6am3so7Crxw4ciDM/TtrW9hmY30MmQRxPcu
	 Q16Fzxl4N0kha+sU0F1RMPpx8hWrqafsxlVOzAs0=
Message-ID: <b87810db-a221-46c1-abf1-a0444fc8bd02@arm.com>
Date: Tue, 26 May 2026 14:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/39] KVM: arm64: gic-v5: Support SPI injection
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Cc: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Timothy Hayes <Timothy.Hayes@arm.com>
References: <20260521144846.1899475-1-sascha.bischoff@arm.com>
 <20260521144846.1899475-30-sascha.bischoff@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260521144846.1899475-30-sascha.bischoff@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_064138_735402_79C638A3 
X-CRM114-Status: GOOD (  10.88  )
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

Hi Sascha,

On 5/21/26 15:59, Sascha Bischoff wrote:
>  	/* SPIs */
> -	if (intid >= VGIC_NR_PRIVATE_IRQS &&
> -	    intid < (kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS)) {
> -		intid = array_index_nospec(intid, kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS);
> -		return &kvm->arch.vgic.spis[intid - VGIC_NR_PRIVATE_IRQS];
> +	if (__irq_is_spi(type, intid)) {
> +		switch (type) {
> +		case KVM_DEV_TYPE_ARM_VGIC_V5:
> +			intid = vgic_v5_get_hwirq_id(intid);
> +
> +			if (intid >= kvm->arch.vgic.nr_spis)
> +				return NULL;
> +
> +			intid = array_index_nospec(intid, kvm->arch.vgic.nr_spis);
> +			return &kvm->arch.vgic.spis[intid];
> +		default:
> +			u32 max_intid = kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS;
> +
> +			if (intid < max_intid) {
> +				intid = array_index_nospec(intid, max_intid);
> +				return &kvm->arch.vgic.spis[intid - VGIC_NR_PRIVATE_IRQS];
> +			}
> +		}
>  	}

Just quick update to save everybody's time. That hunk causes my build fail with:

arch/arm64/kvm/vgic/vgic.c: In function 'vgic_get_irq':
arch/arm64/kvm/vgic/vgic.c:103:4: error: a label can only be part of a statement and a declaration is not a statement
  103 |    u32 max_intid = kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS;
      |    ^~~
make[4]: *** [scripts/Makefile.build:289: arch/arm64/kvm/vgic/vgic.o] Error 1
make[3]: *** [scripts/Makefile.build:548: arch/arm64/kvm] Error 2
make[2]: *** [scripts/Makefile.build:548: arch/arm64] Error 2

Obvious fix-up would be wrap default case into curly braces.

Cheers
Vladimir


