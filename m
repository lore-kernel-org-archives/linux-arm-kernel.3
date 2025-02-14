Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6B8C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZNRV9U528S3+iv9TAKaeoApmsRbWPwdftxkhJY753I=; b=Bho1mmqgo8R3B2Bw+yOl+ewxfG
	UgpK8P7HzC7f/EXDoNdEbqmMLapLD23ARi95oO/1pwgeACMPYllJC6i01VXGTNEVA8u1ckSY2T4KF
	jR7MtPUlrEJEoLEGcn6SVCMTJ71K4vQ9Kt++U4R2oRgQs38oL/VR3F2dO6AApXZOYbRGsZEqcccG2
	76dKdliXsYdV2VefquqedKwpEMzNNo++9ksm2aFSAIwjUMVCtSSOy1P0YzqnXC29geQHMxjg73FdI
	eU91HljFVCzDuatAM4WX0XziDSrZbtjDQmmLpziHn2w0hZSRfQcOykdO1nJHs+ppvMMR7HHpykixv
	6Yxb5bjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivh6-0000000EztE-0qjB;
	Fri, 14 Feb 2025 13:25:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tivSA-0000000EwbY-17FP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 13:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C556A42A90;
	Fri, 14 Feb 2025 13:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09DAC4CED1;
	Fri, 14 Feb 2025 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739538596;
	bh=Vrd2PQQb0NRk/ZiGaKxhtfp+UzgmaQxFr0hfRHPz/jA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JVLzYB0YjKDsqbGXroz9+cez2JO7fR0RS7SHsaH5eDJmOdVWNfnCKMDRCBar09B5u
	 Yh8mTg8p+foaEAJ0FXtSZS89AGf9nhfuc3XfU+PgiNeOkDNZlmWU2s98a3VYU2x2r2
	 7g8es20LHJwJN/hsCYwYOcGlrWSusrghBjplTpPX3uXkDZp1zfnjoA5ASMTfgjfTbG
	 fchGumDOFK9rj94cLOOvuvOxppNeqC5Vjwi1sAYAAptVvg7bs76EO7PiNLgT3NZa/8
	 FI0KIZcHtjGusptXMZ8OViUe/JkAKIFhMydhW6UwaYjJO0d+oU8baonVXx9c5wsW1k
	 eWJqOrX5yOsbg==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>
Subject: Re: [PATCH v7 07/45] arm64: RME: Define the user ABI
In-Reply-To: <20250213161426.102987-8-steven.price@arm.com>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-8-steven.price@arm.com>
Date: Fri, 14 Feb 2025 18:39:45 +0530
Message-ID: <yq5aldu8wu3q.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_050958_371046_C16C91EA 
X-CRM114-Status: UNSURE (   5.46  )
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

Steven Price <steven.price@arm.com> writes:

....

> +/* Available with KVM_CAP_ARM_RME, only for VMs with KVM_VM_TYPE_ARM_REALM  */
> +struct kvm_arm_rmm_psci_complete {
> +	__u64 target_mpidr;
> +	__u32 psci_status;
> +	__u32 padding[3];
> +};
> +
> +/* FIXME: Update nr (0xd2) when merging */
> +#define KVM_ARM_VCPU_RMM_PSCI_COMPLETE	_IOW(KVMIO, 0xd2, struct kvm_arm_rmm_psci_complete)
> +

This needs an update?

-aneesh

