Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385D2C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hu5Iz+I8ahzmm2xeTBBWdzh9bN8uU9cXvAqP7Uxh4YA=; b=TCbShIQdcalQGApiUs95Zq8I2E
	ks5VuXv09nw38HVkDQ+4hasEOSnNnuE3HDxyLfTBjJ8G/X4n92GEDJ4qeVPSzYEqzmzuiePgJ/ORy
	sS7HMSh2aZMiE1uUtnkyPmOZoEhRV31hnviXsVaH8gdFtNCeS0fW2XOXuSM//T3b6NOdcZpHOrrmA
	2yBid/U78+k8ucPVjPrB1bcJq0ASb4Z3UXXcfA4IbCdKqxR9IW7vOhRwTj3sQB0jehZiHlzDuMfFR
	qcifi6PHMVpgUHwP++2QTRT0tJL83g9aip1JJ7NgsVZXa7Y7zkacFfFADUtIwdaXL8JyqyUGMsg4i
	zD8R01LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGUD-00000002DA1-2UMN;
	Mon, 27 Jul 2026 08:14:57 +0000
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGUA-00000002D8i-1Rq3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785140094; x=1816676094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P7OnimFYQWkAalEgzraoPxXsrblUmypJNwaTPMgMFwo=;
  b=SFK3R4/jqIUSVX0UI1pTQCdyYH8rjp10h8OQN8wfr8p5aFRBRd9qFOmp
   mEa7MUSfxvcHFzz8F+Y8r+YyoatrsVfGugK7WmbcN0dUb/2pxR3X7kkr6
   +MNqR3DBJ3OkoCZwbDl5GrcaC+oSVb6oc6CQCHumVpqt8wFrRDDOdb83L
   WKt6iP4rTvJm3EYzeKFLBOS7IJ6Sy+REpb6AYrX0IdJeXcvX2IvuBdNX5
   DkWLrq3Tiw8YfHvzvK3AJrb2Ye/pJRi12YFAbC5vM+brGJuiPdERvPcqN
   3uIDMsJZmCVL+O6Vnnll7jkrCp5B32iPgLZsj3arsR99BXOdKUVVyHvDQ
   A==;
X-CSE-ConnectionGUID: Rbox6lMnTiS6uAJzEeg8fA==
X-CSE-MsgGUID: LXEVlFXYS7qwckjlC1lYfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="248712694"
X-IronPort-AV: E=Sophos;i="6.25,188,1779116400"; 
   d="scan'208";a="248712694"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 17:14:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 35573C015B6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 08:14:50 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DE6151800245
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 08:14:49 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.156.208])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with SMTP id 9D98B829EFA;
	Mon, 27 Jul 2026 08:14:41 +0000 (UTC)
Date: Mon, 27 Jul 2026 17:14:33 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v15 14/37] KVM: arm64: CCA: Handle realm enter/exit
Message-ID: <amcOp7tpRCkI29vt@FCCLS0092175.localdomain>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-15-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715142841.80544-15-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_011454_982157_93ECAE2B 
X-CRM114-Status: GOOD (  30.22  )
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

Hi Steven, I have a comment about rec_exit_sys_reg() below.

On 07/15 15:28, Steven Price wrote:
> Entering a realm is done using a SMC call to the RMM. On exit the
> exit-codes need to be handled slightly differently to the normal KVM
> path so define our own functions for realm enter/exit and hook them
> in if the guest is a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
> Changes since v13:
>  * The RMM is now required to provide an ESR value with the correct
>    information to emulate MMIO, so we no longer need to hardcode 0s in
>    rec_exit_sys_reg().
>  * The PSCI changes mean that there is a potential race when turning on
>    a VCPU which can cause a RMI_ERROR_REC return. Exit to user space
>    with -EAGAIN in this case.
> Changes since v12:
>  * Call guest_state_{enter,exit}_irqoff() around rmi_rec_enter().
>  * Add handling of the IRQ exception case where IRQs need to be briefly
>    enabled before exiting guest timing.
> Changes since v8:
>  * Introduce kvm_rec_pre_enter() called before entering an atomic
>    section to handle operations that might require memory allocation
>    (specifically completing a RIPAS change introduced in a later patch).
>  * Updates to align with upstream changes to hpfar_el2 which now (ab)uses
>    HPFAR_EL2_NS as a valid flag.
>  * Fix exit reason when racing with PSCI shutdown to return
>    KVM_EXIT_SHUTDOWN rather than KVM_EXIT_UNKNOWN.
> Changes since v7:
>  * A return of 0 from kvm_handle_sys_reg() doesn't mean the register has
>    been read (although that can never happen in the current code). Tidy
>    up the condition to handle any future refactoring.
> Changes since v6:
>  * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>    vcpu to the error.
>  * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>    this exit type.
>  * Split code handling a RIPAS change triggered by the guest to the
>    following patch.
> Changes since v5:
>  * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>    change on next entry rather than immediately on the exit. This allows
>    the VMM to 'reject' a RIPAS change by refusing to continue
>    scheduling.
> Changes since v4:
>  * Rename handle_rme_exit() to handle_rec_exit()
>  * Move the loop to copy registers into the REC enter structure from the
>    to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>    where the handler exits to user space and user space wants to modify
>    the GPRS.
>  * Some code rearrangement in rec_exit_ripas_change().
> Changes since v2:
>  * realm_set_ipa_state() now provides an output parameter for the
>    top_iap that was changed. Use this to signal the VMM with the correct
>    range that has been transitioned.
>  * Adapt to previous patch changes.
> ---
>
> [...]
>
> +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	unsigned long esr = kvm_vcpu_get_esr(vcpu);
> +	int rt = kvm_vcpu_sys_get_rt(vcpu);
> +	bool is_write = (esr & ESR_ELx_SYS64_ISS_DIR_MASK) == ESR_ELx_SYS64_ISS_DIR_WRITE;
> +	int ret;
> +
> +	if (is_write)
> +		vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[rt]);

When rt is 31 (XZR), does exit.gprs[rt] trigger an out-of-bounds read
since REC_RUN_GPRS is 31? Although the padding after the gprs means this
OOB may not cause any practical issue, would it make sense to skip the
access when rt is 31?

if (is_write && rt != 31)
    vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[rt]);

> +
> +	ret = kvm_handle_sys_reg(vcpu);
> +	if (!is_write)
> +		rec->run->enter.gprs[rt] = vcpu_get_reg(vcpu, rt);

The same applies here:

if (!is_write && rt != 31)
    rec->run->enter.gprs[rt] = vcpu_get_reg(vcpu, rt);

> +
> +	return ret;
> +}

