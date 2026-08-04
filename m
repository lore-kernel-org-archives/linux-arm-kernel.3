Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F62C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dea4THFr48jtnlZZX7EhhaJ5BcsAaX2rlq8oEbGTUAk=; b=zY1snHT2+gqX05LPwSsv37BBB3
	/UA5l+Y2Hu45TNdw8ek6gyPyohVOVoGbwmneZ94foP1R8E284cymA0vKa06R10Dx8dfaFf2pcECJt
	AYWPtABEaswXbw2PGE4sa1LN7ct99qUDtUX9nQ5vqL2x57IJUzvx+H3/HSYRC+WSD1m5ywSG0jSBO
	Wo8NDH/vDUEUOnClIyyFSmGHruNwFpp3Ck5MppIYk529bMVGWLMLIX7O0Bli0Abx2Qa5wPRqpt351
	3C8sEyHRFJiPEF1pBILLG/HUqk56ImyGPqUazJmYcHQRG3vjJ0WVGjhNd1uLWo1euS4h3RHBAamby
	gAJLWDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFJi-00000001wDv-45Mi;
	Tue, 04 Aug 2026 13:36:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFJg-00000001wDF-3YSD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:36:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE49160A83;
	Tue,  4 Aug 2026 13:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7509A1F000E9;
	Tue,  4 Aug 2026 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785850583;
	bh=Dea4THFr48jtnlZZX7EhhaJ5BcsAaX2rlq8oEbGTUAk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VjQAj0ncxpu4IWoTIW4w+cBw5cvfEASTVME2PUMHKOftPqHktjAJmUuFgewEnw3h4
	 5iV/heJ0Nm1LVPY9AxoAKAbqYwiT0sjNVzBc44c9JCDKfKHyk8iTD/LeUdxKZVZVtZ
	 yc/C+zQjax0fPHXL5QgphM6BM+RPyCwokyaTdIYhVS/nZ7pX/SQJJm00O4QGGFQBaO
	 md6DKGHakfd3Jn+LODutreCHJdP/tSPVGYMLCVCmGbXC8rRszzB323v/i/lQ7Gyxs3
	 cAAZZfStqZQAs9SlTlgcZfIOEmjcBLhajKMZ+UjmJns7jjwzJe4SzWuR2eOQfnj9MJ
	 g34a0hLZOTXsw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 21/45] KVM: arm64: CCA: Handle realm enter/exit
In-Reply-To: <20260803134403.80630-22-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-22-steven.price@arm.com>
Date: Tue, 04 Aug 2026 19:06:11 +0530
Message-ID: <yq5a33wu3t4k.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Steven Price <steven.price@arm.com> writes:
> +
> +	switch (rec->run->exit.exit_reason) {
> +	case RMI_EXIT_SYNC:
> +		/*
> +		 * HPFAR_EL2_NS is hijacked to indicate a valid HPFAR value,
> +		 * see __get_fault_info()
> +		 */
> +		vcpu->arch.fault.hpfar_el2 = rec->run->exit.hpfar | HPFAR_EL2_NS;
> +		rec_exit_sync(vcpu);
> +		return ARM_EXCEPTION_TRAP;
> +	case RMI_EXIT_IRQ:
> +	case RMI_EXIT_FIQ:
> +		return ARM_EXCEPTION_IRQ;
> +	case RMI_EXIT_SERROR:
> +		return ARM_EXCEPTION_EL1_SERROR;
> +	case RMI_EXIT_PSCI:
> +		rec_exit_hvc(vcpu);
> +		kvm_make_request(KVM_REQ_RMI, vcpu);
>

I'm also wondering whether we can move the kvm_make_request() call until
after the PSCI/HOST_CALL handling is complete. I tried a quick hack, but
it did not look particularly clean, since we would end up adding
RMM-specific checks in handle_hvc():

ret = kvm_smccc_call_handler(vcpu);

if (vcpu_is_rec(vcpu) &&
    (vcpu->arch.rec.run->exit.exit_reason == RMI_EXIT_PSCI ||
     vcpu->arch.rec.run->exit.exit_reason == RMI_EXIT_HOST_CALL))
	kvm_make_request(KVM_REQ_RMI, vcpu);

That said, having rec_exit_hvc(vcpu) and kvm_make_request() back-to-back
is also somewhat confusing. Perhaps we could at least add a comment
explaining why the request must always be made here.


> +		return ARM_EXCEPTION_TRAP;
> +	case RMI_EXIT_RIPAS_CHANGE:
> +		rec_exit_hvc(vcpu);
> +		return ARM_EXCEPTION_TRAP;
> +	}
> +
> +	return rec_exit_fatal(vcpu, "Unsupported Realm exit reason",
> +			      rec->run->exit.exit_reason);
> +}

-aneesh

