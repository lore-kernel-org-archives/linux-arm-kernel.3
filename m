Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCD4C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWx6+5LfwSZhVeVljhX3komuKaSvL/XbY/Ftt9OaBLo=; b=muOn/g+IvRIUfSc83uPyUZOloN
	Kig6WAbRiGvb535giWQF1mnJYEf4in9OtCHEmgf3BBwaNUMZsjzWv+kkTZSAFVGaGMfFFt0qRMoaw
	6f4WHE4R6ZTEDePKmPU4oKV3R0uS/UFoMSDIBm3OAmHsenD5jrkGbFJfhtJ0Hmkzt9WHKlTqOZosl
	FXTpYiqj5SZFkBx2+mVSiNASJuwIJoIw94YpxhjPE/oyuib9dQLFyWYPKzmjAW+Wf7V/KgcPwGigR
	IOSB+FG+axcoDJMejmTY5o33mIgSu48FNzZV+RR/EqPLrSMWX8rc3thGExRdevRxmfjbN/4avVi8r
	CpHNHoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWZg-000000098q3-3hAt;
	Wed, 09 Jul 2025 15:19:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUIu-00000008h0v-2pA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 12:53:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74C22152B;
	Wed,  9 Jul 2025 05:53:28 -0700 (PDT)
Received: from [10.1.32.47] (Suzukis-MBP.cambridge.arm.com [10.1.32.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99A4C3F738;
	Wed,  9 Jul 2025 05:53:38 -0700 (PDT)
Message-ID: <1251d0ab-b0a9-4113-8e92-8f94fe9ee9d6@arm.com>
Date: Wed, 9 Jul 2025 13:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: realm: Add support for encrypted data from
 firmware
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, steven.price@arm.com, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250613111153.1548928-1-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_055340_764280_91EA2972 
X-CRM114-Status: GOOD (  13.05  )
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

On 13/06/2025 12:11, Suzuki K Poulose wrote:
> Confidential compute firmware may provide secret data via reserved memory regions
> (e.g., ACPI CCEL, EFI Coco secret area). These must be ioremap'ed() as encrypted.
> As of now, realm only maps "trusted devices" (RIPAS = RSI_RIPAS_DEV) as encrypted.
> This series adds support for mapping areas that are protected
> (i.e., RIPAS = RSI_RIPAS_RAM) as encrypted. Also, extrapolating that, we can map
> anything that is not RIPAS_EMPTY as protected, as it is guaranteed to be "protected".
> 
> With this in place, we can naturally map any firmware provided area based on the
> RIPAS value. If the firmware provides a shared region (not trusted), it must have
> set the RIPAS accordingly, before placing the data, as the transition is always
> destructive.
> 
> Also enables the EFI Coco secret area support and Confidential Compute Event
> Log (CCEL) for arm64.
> 
> 
> Suzuki K Poulose (3):
>    arm64: realm: ioremap: Allow mapping memory as encrypted
>    arm64: Enable EFI secret area Securityfs support
>    arm64: acpi: Enable ACPI CCEL support
> 
>   arch/arm64/include/asm/io.h          |  6 +++++-
>   arch/arm64/include/asm/rsi.h         |  2 +-
>   arch/arm64/kernel/acpi.c             |  5 +++++
>   arch/arm64/kernel/rsi.c              | 26 ++++++++++++++++++++++----
>   drivers/virt/coco/efi_secret/Kconfig |  2 +-
>   5 files changed, 34 insertions(+), 7 deletions(-)
> 

Gentle ping

Kind regards
Suzuki

