Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964A5CC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiw+Ywg3q4SDdbjvYQdD/LzLrfhjbZnHMXz+5Y1tQXI=; b=iPcRxR0Jz3V1OjA7YVcZk7j+2O
	Y9H67kqeuWpFxN2nunmzQLiREYBoAcmWRwbsQFH5R7P+9QCkmVYKx+akcc9PuzPkXSHAozRWF6/Eu
	pP5yFrXxYipsk3GpheIdi3pXdxH/aCJ4jusCfa3mxrtPnToDtMIINtwwL07EIUuuREJNZmP9+3zJE
	9vntz5hY2s244bD3IiEQzSUMfeEBkIN32ED6C8W/cMkZ8R1uwS1Ngu5eKMkFAfwmWw+2Cv7zttqUB
	cbZdxKvklUOZEBe4aqe2L8UvS75qu+3KwX9+swd9mSvWFwl8h/659yPhM0o3N9Fa1fqID2FkwpIBj
	yDo8rkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL1R-00000000BRx-1rkv;
	Thu, 15 Oct 2026 12:57:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL1O-00000000BPy-0L7c
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 12:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oiw+Ywg3q4SDdbjvYQdD/LzLrfhjbZnHMXz+5Y1tQXI=; b=H5q5EDHgbFjNkLLByIYgRmbGkn
	7fNmkqzwxuSDd85HEQJ6EH806a2vEt+ftSy25Elx31JPqHVY9muZ83BVOwmRr0dQ/yfbGbiW6iuvS
	YiJ/WEQ/dX1mXtO5v2p4kWb6sRWHRPGZRhTPfzpNSnxrcb/diOwtkI5fcSZ26vZjfl7MbOhvbCNh4
	OUT5d37J1pJITqQUYLZ6OXLHpIv5EnthPdecMnuLDrMh6y7R7pMiYiHuZnw84zcCmS2kBBxQy38ua
	mGBZuAoOJegTg07Xjd+FwBXbgzDMSd/fdskYf59OywELM+nXOKyjMf+UMq2zya00HFQiMBL2S4gfV
	B6seTODw==;
Received: from out-99.mta1.migadu.com ([95.215.58.99] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHL1J-00000000Nvh-2xgG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:57:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uGgOTqoXN8cnMYnIr0hBIol3IrBC3WkVwqukxqDL3aM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792069036; v=1; x=1792673836;
 b=ilDjPIiXt1iyGqGkqvHL5Yhnpd57tgsq7uQp3cSdvbZ9dCKIx7dCqm/9D2zgxEu/n+05U9/V
 BuA03TmTjsluEhfLaVg1sbryIcYNdx7tqb+xr2Dhmz04lCkwCNgXZl8uwDysVOKZGW98oTYwAoM
 sEWEIQ9S0yRa20pK8DzTIIh4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 860c7ff0ce382135;
	Thu, 15 Oct 2026 12:57:15 +0000
X-Mizu-Trace-ID: 860c7ff0ce382135
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 2/7] KVM: arm64: Move OUTSIDE_GUEST_MODE publication past context being saved
Date: Thu, 15 Oct 2026 13:57:13 +0100
Message-Id: <20261015125713.2650696-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261015100539.1011760-3-maz@kernel.org>
References: <20261015100539.1011760-3-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_135718_799963_7CBCFDC9 
X-CRM114-Status: GOOD (  11.45  )
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

On Thu, 15 Oct 2026 11:05:34 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> However, code that uses OUTSIDE_GUEST_MODE as a synchronisation point
> relies on the vcpu state to have been written back to the in-memory
> structures. Clearly, this is not what is happening

nit: missing full stop.

[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> @@ -1390,6 +1389,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>
>  		kvm_arch_vcpu_ctxsync_fp(vcpu);
>
> +		/*
> +		 * All the state has been synchronised, let advertise
> +		 * we're outside of the guest.
> +		 */
> +		smp_store_release(&vcpu->mode, OUTSIDE_GUEST_MODE);

nit: could this say the vgic state rather than all the state? In pKVM,
a non-protected guest's context comes back later, in
handle_exit_pkvm_state() or on demand, and with VHE the EL1 sysregs
stay on the CPU until vcpu_put(). Also "let's advertise".

Cheers,
/fuad

