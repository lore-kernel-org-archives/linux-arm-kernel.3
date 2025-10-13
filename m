Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF17CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5ir6e1ly7uyYMLlaJ5GUbqIWgqprqQSkOVcsXR2tCo=; b=yK3hUuW4CjRYtaIxfPdwznsx6/
	U1RNyjE72RteEdbAQMwusfZCnzcUBtGdKkegPSh4b1lasbsdLwfLnPU0FBjOmUzBbm7f+tZF36vd0
	zQ2MKQ+tVT8s5ZJlWtd3Xm9fiikLrncHVFw2fzBymKQUepGUKAj5r0ggeoUYvsLuit63CpID7U/xX
	7SESwAusTLjnUUP7VQLQ+XuuVK0wojvwLNmpwapebbMJsw5E7DgaON03X6Of3NuJcS9nVr9/C5Npy
	hf/6QaydIB5503YYl3ifID98X/J62zTF2tI4BPukRWUCUdw84+kAq0VKnpUHoBYePnsQA4f24dccL
	PkFve58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HXa-0000000D6wA-0CIH;
	Mon, 13 Oct 2025 12:20:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HXX-0000000D6ud-0NCE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 12:20:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DA97113E;
	Mon, 13 Oct 2025 05:20:23 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A4993F738;
	Mon, 13 Oct 2025 05:20:30 -0700 (PDT)
Message-ID: <25a19af8-2026-45b6-8d0f-42c371c8ff95@arm.com>
Date: Mon, 13 Oct 2025 13:20:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: selftests: Sync ID_AA64PFR1, MPIDR, CLIDR in
 guest
To: Zenghui Yu <zenghui.yu@linux.dev>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com
References: <20251012154352.61133-1-zenghui.yu@linux.dev>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251012154352.61133-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_052035_172872_B7F5DA0A 
X-CRM114-Status: GOOD (  12.46  )
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

Hi Zenghui,

On 10/12/25 16:43, Zenghui Yu wrote:
> We forgot to sync several registers (ID_AA64PFR1, MPIDR, CLIDR) in guest to
> make sure that the guest had seen the written value.
> 
> Add them to the list.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index 8ff1e853f7f8..5e24f77868b5 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -249,11 +249,14 @@ static void guest_code(void)
>  	GUEST_REG_SYNC(SYS_ID_AA64ISAR2_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64ISAR3_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64PFR0_EL1);
> +	GUEST_REG_SYNC(SYS_ID_AA64PFR1_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64MMFR0_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64MMFR1_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64MMFR3_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
> +	GUEST_REG_SYNC(SYS_MPIDR_EL1);
> +	GUEST_REG_SYNC(SYS_CLIDR_EL1);

Why did you choose this position in the list for these 2?

>  	GUEST_REG_SYNC(SYS_CTR_EL0);
>  	GUEST_REG_SYNC(SYS_MIDR_EL1);
>  	GUEST_REG_SYNC(SYS_REVIDR_EL1);

Looks good to me.

Reviewed-By: Ben Horgan <ben.horgan@arm.com>
Thanks,

Ben


