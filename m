Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE09FED9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cOeHyx0nOYJTL0IxwB+5sdVf5CQ8cq4pS7rVALpQCs=; b=1aH3LOw1gMVpVgSMSrSgGo98Zu
	rnZ8eIsC4nm2nDB7D9vKm8SGw/9Bcd2w55NJSzObRAXqOJGdOEilkmREvLavAfasi5Z70r6CiIT8C
	aR+sdMEXnb3lUM1f9960k5G+HzOa/+W++DzA2m2QW4P8t/RGrjn+SesRaFb0DanxTlV9g/9eiMeey
	bWCoPi+Kzmrfl38xZl0EU88y5JF5XeoJJaDpeDkvasOD+OmL9XHtfRcswSoP7O561sMM4I1yZuUT+
	UxQdODUU17/0BaoyTyErzZCnwDWf8BhUU8WCZ/vf/sTYeVQeawVRVyVMwlWWEblMbpke+H/qzRGe5
	loEy6pCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ycd-00000006zC1-28PV;
	Tue, 17 Mar 2026 17:54:27 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ycb-00000006zBc-34BB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:54:26 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fb02H1BPZzHnGfG;
	Wed, 18 Mar 2026 01:53:59 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 2155240572;
	Wed, 18 Mar 2026 01:54:19 +0800 (CST)
Received: from localhost (10.48.149.62) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Mar
 2026 17:54:18 +0000
Date: Tue, 17 Mar 2026 17:54:17 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Fuad Tabba <tabba@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, "KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64"
	<linux-arm-kernel@lists.infradead.org>, KERNEL VIRTUAL MACHINE FOR ARM64
 KVM/arm64 <kvmarm@lists.linux.dev>, "open list"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/10] KVM: arm64: Use guard(spinlock) in psci.c
Message-ID: <20260317175417.0000201b@huawei.com>
In-Reply-To: <20260316-tabba-el2_guard-v1-8-456875a2c6db@google.com>
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
	<20260316-tabba-el2_guard-v1-8-456875a2c6db@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.149.62]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_105425_922164_F8777245 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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

On Mon, 16 Mar 2026 17:35:29 +0000
Fuad Tabba <tabba@google.com> wrote:

> Migrate manual spin_lock() and spin_unlock() calls managing
> the vcpu->arch.mp_state_lock to use the guard(spinlock) macro.
> 
> This eliminates manual unlock calls on return paths and simplifies
> error handling during PSCI calls by replacing unlock goto labels
> with direct returns.
> 
> Change-Id: Iaf72da18b18aaec8edff91bc30379bed9dd04b2b
> Signed-off-by: Fuad Tabba <tabba@google.com>


> @@ -176,9 +172,8 @@ static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type, u64 flags)
>  	 * re-initialized.
>  	 */
>  	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
> -		spin_lock(&tmp->arch.mp_state_lock);
> -		WRITE_ONCE(tmp->arch.mp_state.mp_state, KVM_MP_STATE_STOPPED);
> -		spin_unlock(&tmp->arch.mp_state_lock);
> +		scoped_guard(spinlock, &tmp->arch.mp_state_lock)
No benefit over guard() and causes more churn.

> +			WRITE_ONCE(tmp->arch.mp_state.mp_state, KVM_MP_STATE_STOPPED);
>  	}
>  	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
>  
> 


