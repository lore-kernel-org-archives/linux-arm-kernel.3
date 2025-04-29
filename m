Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9329C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGxAQUr+NpIlKHD+6U3G4YKbFxU2L2WIUi1vJm8xS9M=; b=ukymwonmwSkJlib9S7wX2lexwj
	Nh3PCqEYz9oF2R47Ccq48lC8SVZK5zWatpDIxy3KgQIGaHx2b6gcBdhn34Vy+mCuzK/KHAHwIylwP
	TBeSta70Ny5A+f4SGepLoaBN2DTcmVxwi90ygks+NhxwdI5U4DouMiR1v/OrOFjpZt8sQVEia93/x
	d2KNIH7hbOg3b9S/d9ZCBDYl3VmT7oyVRj3nR/gH1qP1UQLCLopTg4benf4uHiL9SAYGWIFummRMj
	/jBOiNWTr2mYlgxfIOT49qvyUr5riRcfcs4V4PgdO+O5+hTi7SDrZCPvEZ671ONQC9qj9mWeQlTQh
	wpe/LqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9liV-00000009t1T-39YP;
	Tue, 29 Apr 2025 14:13:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kgt-00000009jYN-3vQd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:08:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 985E71515;
	Tue, 29 Apr 2025 06:07:56 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C97793F673;
	Tue, 29 Apr 2025 06:08:01 -0700 (PDT)
Message-ID: <7488567a-804d-4769-8a49-a9170c6ab609@arm.com>
Date: Tue, 29 Apr 2025 14:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/42] KVM: arm64: Handle trapping of FEAT_LS64*
 instructions
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-18-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250426122836.3341523-18-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_060804_020222_73BCD8AD 
X-CRM114-Status: GOOD (  10.33  )
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

Hi Marc,

On 4/26/25 13:28, Marc Zyngier wrote:

> +	/*
> +	 * We only trap for two reasons:
> +	 *
> +	 * - the feature is disabled, and the only outcome is to
> +	 *   generate an UNDEF.
> +	 *
> +	 * - the feature is enabled, but a NV guest wants to trap the
> +	 *   feature used my its L2 guest. We forward the exception in
> +	 *   this case.
Nit: my -> by
> +	 *
> +	 * What we don't expect is to end-up here if the guest is
> +	 * expected be be able to directly use the feature, hence the
> +	 * WARN_ON below.
> +	 */


Thanks,

Ben


