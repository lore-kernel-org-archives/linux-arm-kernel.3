Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9A8C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWVAjD/nEro8uDxMyMVRO2dkiMc7OmlFiyXh9ZGt0bk=; b=069fs5HYjnEMkYYBAAzcgHTuYe
	Ty+PsFcy4yXTsxpU5k4FRjqjZ22RXKg9RtSLAdz/GxKr44LlJ3N+FvYRgJ/JYy9ns3gGRBU/A5Gma
	Nme4+3ebxAQOVk7NjETE4f7Kzlt1xFon6HA7nQ5YwYasZjZyJt6jn8bNBFXM/yRtiBRmoksvBMXCg
	shqxEtfMN5lQ8BF+9lCTn1WDuCaSJW1RFLTVW8MHxJ6btF85ypKU1wO6lrY/MxV/43OA9bwFA3Rwf
	0LaAEXODcFk5599FJQe+wzQJAFjF3yo2RfvGMRxycQlmeGQr0OMVs9Grv9aeoXMVU6cdFcEXLD9ZW
	dHafZEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGB-0000000HWGh-1f1J;
	Thu, 13 Aug 2026 06:49:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGA-0000000HWFn-09lx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:49:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D69E600E2;
	Thu, 13 Aug 2026 06:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCC31F000E9;
	Thu, 13 Aug 2026 06:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603788;
	bh=XWVAjD/nEro8uDxMyMVRO2dkiMc7OmlFiyXh9ZGt0bk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c9H7tZPiIv0XaZ8VTyCmhTfvlP1RT+sRhN81bJHLdSAG9KOKzvLwGoxf+1QXEjgnO
	 iTcKdbyv18HY54kMRIQAt/xItLyLB9RMdG3o5kcuICQktLnUGyvb/3ui5wLMKXhOk6
	 9ukfE3eA8eoQpD5zHPQNU0kNYwA9ACRvvcgNrgJv5g4WUf4vGwv4/3hR9X9uDDcrt/
	 TD4C63VNVaxP8O+a6NboreQrl4pgvUOCKr5tbjhbvRXWhMxEzme33X38NowY4LT5D5
	 T06K8sY3mIaKA61fpBhqm55GltviFjV/+n7jzNEt7KatlclBLGLtog1PsEzsIw3+Jm
	 fXR7kEDriE7Ww==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	stable@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] KVM: arm64: vgic: Reset in_kernel on private IRQ allocation failure
Date: Wed, 12 Aug 2026 23:49:41 -0700
Message-ID: <178660378179.666424.9983630355464884379.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802150845.3485757-1-fuad.tabba@linux.dev>
References: <20260802150845.3485757-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sun, 02 Aug 2026 16:08:45 +0100, Fuad Tabba wrote:
> kvm_vgic_create() sets vgic.in_kernel before allocating the per-vCPU
> private IRQs, but the allocation-failure path resets only vgic_model and
> leaves in_kernel set. As irqchip_in_kernel() is !!in_kernel, the VM is
> left with an in-kernel irqchip but no model, and the -EEXIST guard at the
> top of kvm_vgic_create() rejects every retry, so userspace cannot recover
> from a transient -ENOMEM.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: vgic: Reset in_kernel on private IRQ allocation failure
      https://git.kernel.org/kvmarm/kvmarm/c/43347154e7ab

--
Best,
Oliver

