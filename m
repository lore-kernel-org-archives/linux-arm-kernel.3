Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204EDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ia05Dy3uQ/gRZOLFPemqHNn0WHoDGbaEiHy+YeY8YXk=; b=jS0j49AHgfRMXrXdkcF1gFwbGX
	R6ToCcAkog/+sRaaUWLNcCldAHyIJOXFbY1e43cmCYvg8P3jUEoQCpcvWVcUx1N3uGw5Oge83Pdlv
	53xvrXhaAM3tXiaA6QIUCL7/SaogrsVkHKp5iRb5D2cscx9ZGnVYDupcq5jwtsNSa2EfjZz7eXb2Z
	LtgT2nSTyqMrKqrpfCUbVSqqbkBAi6G0hTtfkNNH66wNtRMn1kl1RpoSV3OBHW1vCMWEFXoNSRRlA
	y8RIk9l8B60DL70R5pCtP9a4zIQVOQZ7t39VElj9vCTEbN7wkW8zmlz9PwpasqV+xdYaZlN5EqzKy
	K6yb+9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeqy-00000005JLA-23bj;
	Fri, 20 Dec 2024 15:23:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOepq-00000005J9h-0WQI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 15:22:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9616F5C64E0;
	Fri, 20 Dec 2024 15:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4A0C4CECD;
	Fri, 20 Dec 2024 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734708156;
	bh=j2tJIhgZCShTTOYqg9XpihN9VAJNSxV05b/5OS6t4Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gVZqckSRuHHZPADNhNgxX/ip1g2O/8G4SklaRvFxPeq+z4xMMDEmJckXmZPeHzWqJ
	 GSjgFT7vtJj5eS6FvEroeOHbpiHewaVPdwQWOATnYJu2fqFfCXBinI1PkuuVrndP1N
	 pO6fzZD2rOcYySRFsYWCzo84n1I6rHmjH08ilbr1/WtycRBaBAg1cavB4FAIynNory
	 tfQwrCT6TbpEDzP2RABn16IxH4YLdaA2bYesC+qb6S1Bt1KaUInf4+NgKgmuTLXDLG
	 qjgaQGA7oe1qNsb0E5KecLGyp7aHYRo31OTytEojjZahb9E/8gLMHyHZOd7HntLgAT
	 OrMhwL0511Qzw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOepl-005gxw-Qt;
	Fri, 20 Dec 2024 15:22:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: oliver.upton@linux.dev,
	james.clark@linaro.org,
	will@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	qperret@google.com,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v5 00/17] KVM: arm64: Rework guest VM fixed feature handling and trapping in pKVM
Date: Fri, 20 Dec 2024 15:22:30 +0000
Message-Id: <173470804652.1394795.5150120931608048707.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
References: <20241216105057.579031-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, oliver.upton@linux.dev, james.clark@linaro.org, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com, kristina.martsenko@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_072238_249033_B7560020 
X-CRM114-Status: GOOD (  12.83  )
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

On Mon, 16 Dec 2024 10:50:40 +0000, Fuad Tabba wrote:
> Changes from v4:
> - (Oliver) Add assertion in kvm_init_pvm_id_regs() that vm_table
>   lock is held.
> - (Quentin) Carve out patches that fix RAS and that remove the
>   feature KVM_ARM_VCPU_POWER_OFF from original patches, for clarity.
> - (Quentin) Add a patch that refactors existing code to use
>   kvm_vcpu_has_feature() instead of __vcpu_has_feature().
> - (Quentin) Fixes to commit messages.
> 
> [...]

Applied to next, thanks!

There was a number of conflicts applying this to -rc3, and then
some more with Quentin's series. Please check kvmarm/next to make
sure that I did the right thing.

[01/17] KVM: arm64: Consolidate allowed and restricted VM feature checks
        commit: 2589dbd72797a4163dd998b05c4663ff98bd0771
[02/17] KVM: arm64: Group setting traps for protected VMs by control register
        commit: f50758260bfff393f2a800469b37c45a7ef50376
[03/17] KVM: arm64: Move checking protected vcpu features to a separate function
        commit: 1fea164ccf19750c5bea688afd9122eb84eb3a72
[04/17] KVM: arm64: Remove KVM_ARM_VCPU_POWER_OFF from protected VMs allowed features in pKVM
        commit: 27f5cf8ad5224033a711aef3fde90b60c9a8d7d5
[05/17] KVM: arm64: Use KVM extension checks for allowed protected VM capabilities
        commit: a3163dca4817e9a30b154a14c793641e39a00592
[06/17] KVM: arm64: Initialize feature id registers for protected VMs
        commit: 7ba5b8f80475e48b486f095ee9fb67dc9f9d02df
[07/17] KVM: arm64: Fix RAS trapping in pKVM for protected VMs
        commit: 9df9186f8df513dc9bf9f95f68525c7ebc941bcd
[08/17] KVM: arm64: Set protected VM traps based on its view of feature registers
        commit: 0401f7e76d707741d2562f4988743cc5daf445e4
[09/17] KVM: arm64: Rework specifying restricted features for protected VMs
        commit: 3d7ff00700d1a4d0c8f092f2c1bf67553a8c7c4c
[10/17] KVM: arm64: Remove fixed_config.h header
        commit: 81403c8d04e1d85209cdb0e0ce32aa0019620c65
[11/17] KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
        commit: 092e7b2c3b1a5591bbabc358f3b709dfa2289b91
[12/17] KVM: arm64: Calculate cptr_el2 traps on activating traps
        commit: 2fd5b4b0e7b440602455b79977bfa64dea101e6c
[13/17] KVM: arm64: Refactor kvm_reset_cptr_el2()
        commit: 8f7df795b2da0564b22a03c4aceec90bfc5e1b1b
[14/17] KVM: arm64: Fix the value of the CPTR_EL2 RES1 bitmask for nVHE
        commit: 1eccad35c9268f1ad4be3d72d37167a58c0ac2db
[15/17] KVM: arm64: Remove PtrAuth guest vcpu flag
        commit: c5c1763596660fcd77a1190b3bd78bbe24bcfd6a
[16/17] KVM: arm64: Convert the SVE guest vcpu flag to a vm flag
        commit: 41d6028e28bd474298ff10409c292ec46cf43a90
[17/17] KVM: arm64: Use kvm_vcpu_has_feature() directly for struct kvm
        commit: aac64ad36955268d65375c32415d5bcf1bd1dd47

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



