Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D30AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fanFXWsUztsJ2NJhb2Z8QNHyJkVcz0wrb3Qo5YXkw+0=; b=bnU3PXj5wwxoMGOItwktSEvKZm
	Zklhau5Kq0wJj9ssijT2HTgE42LgV+qaiTFTlCOtn3nzftS4nOfawvD3EazzMRalrjx8TT11uGSm4
	Not1EIC43wGDWBJmwTOJUTaYpTPbOLgFmuyyUSG85rITOsH7yLqpUYPUATbsNYTHpJyT+w23O36FL
	rg1hVvww57Yp8upmI9TRoVTRo4Pg5sbi8EAFJdUOKrNb0HkgJJBTnLNIFUvAIO4arQM4ZNi2p3y+S
	fa8wTkR7f/47NkI2Fp6KCw2esFpUTQas6jcj0oaKqCuNiw0P2k9Mf0U+7zivSRmrw15mKiyM6lrza
	E/PAxJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8gx-00000004KEn-2Vf6;
	Mon, 16 Jun 2025 12:11:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7oY-00000004AjQ-1gh8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:15:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7087E150C;
	Mon, 16 Jun 2025 04:15:14 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 102C73F673;
	Mon, 16 Jun 2025 04:15:34 -0700 (PDT)
Message-ID: <55346820-fbca-4b23-824e-89483601bf61@arm.com>
Date: Mon, 16 Jun 2025 12:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: realm: Add support for encrypted data from
 firmware
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, steven.price@arm.com, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250613111153.1548928-1-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_041546_499663_4F1359F5 
X-CRM114-Status: GOOD (  13.13  )
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

A branch with the patches is also available here:

git@git.gitlab.arm.com:linux-arm/linux-cca.git  cca-guest/coco-secret/v1


Suzuki


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


