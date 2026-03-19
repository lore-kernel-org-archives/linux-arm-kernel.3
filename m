Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B635C1075290
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zL/2+nC1pt2yK9os/cDSownjGgGlQCInSM2J/Abjd1A=; b=S74/llHCBsUxDkrJOQ09QgY/CC
	jo9cPDvTkkyQqI7Qx7AzkO/k2KQIbYjsdcAAp6dW0MouywOxeKa3kUU0lsHGdx+ErWPZ5Ay9H/ZWA
	dbvMu6Zdr2O7lsoIt2BWR30GQYvUx51EQbTUQKUBcz+nXX9eKB4TdJr7CdnMJLBKk3EjcOz9WYD9x
	8PQU3BK2wNnSjvf9wiRoVENHh295wb8ptv6UXn530g8DhbvtgCsKZWkiMMKb1nM94GPiYIk2ADDI8
	Ho4auIjwkTr/C349Ib06v+kHyhX6H/IXYXR3NayVeYKtpwrn7C3K2tw+db3TLwUnZDfRMV/BS2ydB
	awUOrHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AMv-0000000ANwX-0uoQ;
	Thu, 19 Mar 2026 10:12:45 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AMs-0000000ANw7-2AEZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:12:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zL/2+nC1pt2yK9os/cDSownjGgGlQCInSM2J/Abjd1A=;
	b=kaQtoDyQgL8zwwRTe7UtyLV1VIEdHhi8GRYlnFMy4Qf4sab0lDmc8pgAFRuUJ6LsyfYurp/Dk
	vLcbEZcR87lAhU91bHA+wlysubWF2L8Gll0MjrA4ox3FPfDsXwTImonW9elnWLqV7vhBFIwJMtc
	OHKdPAuIRnpAquKhTc2/spI=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fc1cj2R84z1P6gQ;
	Thu, 19 Mar 2026 18:08:53 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fc1hS2qwyzHnH7b;
	Thu, 19 Mar 2026 18:12:08 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id A99B440589;
	Thu, 19 Mar 2026 18:12:31 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Mar
 2026 10:12:30 +0000
Date: Thu, 19 Mar 2026 10:12:29 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v6 03/39] KVM: arm64: Return early from
 kvm_finalize_sys_regs() if guest has run
Message-ID: <20260319101229.000040f2@huawei.com>
In-Reply-To: <20260317113949.2548118-4-sascha.bischoff@arm.com>
References: <20260317113949.2548118-1-sascha.bischoff@arm.com>
	<20260317113949.2548118-4-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_031242_759773_0F9E62A5 
X-CRM114-Status: GOOD (  17.55  )
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

On Tue, 17 Mar 2026 11:40:44 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> If the guest has already run, we have no business finalizing the
> system register state - it is too late. Therefore, check early and
> bail if the VM has already run.
Given it isn't in the scope below, might be worth calling out that
this is skipping kvm_init_nv_sysregs()  So on non NV setups isn't
changing anything but on those it's indeed skipping setup of system
registers.

Seems correct to me, but is this a fix?  So should it have a fixes tag?


> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/sys_regs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 0acd10e50aaba..42c84b7900ff5 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5659,11 +5659,14 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
>  
>  	guard(mutex)(&kvm->arch.config_lock);
>  
> +	if (kvm_vm_has_ran_once(kvm))
> +		return 0;
> +
>  	/*
>  	 * This hacks into the ID registers, so only perform it when the
>  	 * first vcpu runs, or the kvm_set_vm_id_reg() helper will scream.
>  	 */
> -	if (!irqchip_in_kernel(kvm) && !kvm_vm_has_ran_once(kvm)) {
> +	if (!irqchip_in_kernel(kvm)) {
>  		u64 val;
>  
>  		val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1) & ~ID_AA64PFR0_EL1_GIC;


