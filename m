Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7687DCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkuZWiE4qwA3AlHHyYAOQAj4r7NKq77EKJ2Yz3Nylho=; b=FH7mWiZv0Mrh4pVg9/lN8VBtMZ
	FxnOxv/R8WQKB+dcx6D9aOjI8HTzcgys+NMnYla3Cx3k8EuNfKK7ahzD1Ig2pTSFI5oQv8ZE0w0z1
	zd2celuIjpLPWzs57q7VMtX4sYI2Mik3IjjfSiv8+y9Cp8l1MTTgAMl5YBT+3x+HzmLAKxcAoVrWv
	nLjpeYHbwItxOpef0ktCpKrrpRH4agQnjAR4D/10cF/CBAXSlcGHHxB9D21P0k1hS4yABf8yjZUFF
	GlfEQ8fEhnIfRrhU49o1RDIJN5oz4cT7LgI+yZ1LjISN2WEBqKNmC0n9nIQEcj1e0FEzjx5oTXBfC
	/NTLVCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfbi-0000000Bz5P-1CJQ;
	Fri, 02 Oct 2026 15:55:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfbh-0000000Bz51-1fm9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 847F160A8C;
	Fri,  2 Oct 2026 15:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392FD1F000FF;
	Fri,  2 Oct 2026 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790956532;
	bh=pkuZWiE4qwA3AlHHyYAOQAj4r7NKq77EKJ2Yz3Nylho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DMDrC6gW0jVNVl43vTuE5BYV7hMbFMI9Qg9b+KFodnvgGStg9YSOcn+uEpW/FzuZE
	 hmChMav3VuJN/ZzkKsaFpFAl5aXQ2MMRCwWusztLVXx5MkLP7SeysXicPcNSFCug4q
	 tQXpuTdaUTw0rjWRpbWMCC2SPBnpsXRdiEHtrb2I8pXRB8HdCKOLQhLkRqUYERRjLC
	 zOj34Q7pHOsHcJUVKh3QybkZvczzocsr7B/nu+TXFylfKMn9UotVLyDUAMOqfEOyuI
	 9AQUjWD0PLQlvzhZvKRelyx0IAdkMWYGYn0e0FlCDYuUijUrbe/fUZlQjrd1CTSMmx
	 Suak45OaUKmmg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xCfbe-0000000GIMo-0HnW;
	Fri, 02 Oct 2026 15:55:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com
Subject: Re: [PATCH v4 00/18] KVM: arm64: Confine protected VM vCPU state to EL2
Date: Fri,  2 Oct 2026 16:55:26 +0100
Message-ID: <179095643711.351883.2924159912626438826.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001135711.1640520-1-fuad.tabba@linux.dev>
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Thu, 01 Oct 2026 14:56:53 +0100, Fuad Tabba wrote:
> Changes since v3 [1]:
>   - A protected vCPU that EL2 holds powered off reads as
>     KVM_MP_STATE_UNINITIALIZED, in place of a new bool. (Marc)
>   - The marshalling and PSCI patches access the host copy through the
>     vCPU accessors, with every assignment on one line. (Marc)
>   - The PC adjustment pair is kvm_adjust_pc_get()/put() and tests for
>     the hyp vCPU directly. (Marc)
>   - CPU_OFF clears the reset flag before its release of OFF, CPU_ON's
>     relaxed cmpxchg is ordered by its control dependency, and the
>     CPU_ON rollback stores OFF with a release. pkvm_reset_vcpu()
>     carries the CPU_ON/CPU_OFF sequence as a comment and drops its
>     WARN_ON(). (Vincent, Will)
>   - Collected Reviewed-bys.
> 
> [...]

Applied to next, thanks!

[01/18] KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
        commit: 3708f6342f010d66a767b587dc881f18d95ceb3e
[02/18] KVM: arm64: Validate the host vCPU's VM before reading it under pKVM
        commit: cf533b4d3630b229d78ad55567c5db2f365052a2
[03/18] KVM: arm64: Pin the host vCPU before adjusting its PC under pKVM
        commit: a2bb5f5c67a95ac97fcd6859dab51be421cf26fe
[04/18] KVM: arm64: Disable steal time for protected VMs
        commit: a5b0f36a045e0e96f8e2e044403ff8e6464995e1
[05/18] KVM: arm64: Introduce per-EC entry handlers for pKVM
        commit: 66a5e82d2a8d113d5953d04e008447d6b779e03e
[06/18] KVM: arm64: Skip fixed-feature state flush for protected vCPUs
        commit: 06499de8f998e0ec975cb73adde936c12a8a1200
[07/18] KVM: arm64: Add {flush,sync}_hyp_timer_state() primitives
        commit: a8b2a7d0fe9c0eb493542bb1d306b68313e6a828
[08/18] KVM: arm64: Add system register reset framework for protected VMs
        commit: ceaf9e57f88711fa3c7775ee4fea4f6731f1a71c
[09/18] KVM: arm64: Implement HVC handling for protected guests at EL2
        commit: fe40ff87ead5c541ac4b42aa149b98052a1abca1
[10/18] KVM: arm64: Handle PSCI calls for protected VMs at EL2
        commit: 9d4ec80be2eb4745d877c6989f1e59c62a2e4da4
[11/18] KVM: arm64: Restrict KVM_ARM_VCPU_INIT and PSCI version for protected VMs
        commit: 0b7d843ef3bf0a791d9e92c8a85178fe2a5ee9ff
[12/18] KVM: arm64: Prevent host PC adjustments for protected vCPUs
        commit: fc519dabd86b07b7f7e285ce68b2993d370f64d3
[13/18] KVM: arm64: Inject an UNDEF at EL2 for unhandled protected guest exits
        commit: 3cfbad49ededd985555820d97b62a27f92506b52
[14/18] KVM: arm64: Add per-EC entry/exit state marshalling for protected guests
        commit: 872383bd12e116fc79cb4487b1740c84f23c4c23
[15/18] KVM: arm64: Reject host access to protected VM private state
        commit: ad4ebc3decaa19fad2c00868e237561b6ac004c6
[16/18] KVM: arm64: Reject host power-on of a vCPU that EL2 holds powered off
        commit: 25d726dddc237043327aed9a2b51a5b6336bc31a
[17/18] KVM: arm64: Advertise the capabilities that protected VMs support
        commit: 4957c24559e90592cfb60b6d4425296c2a7cd0e0
[18/18] KVM: arm64: Document the protected VM userspace API
        commit: 61ace86519fb830a7b271c2a1037c8db5f2f3333

Given how busy this merge window is, there were plenty of conflicts, most
of them with your own patches. Please have a look at the way I resolved
them and let me know if anything is on the bogus side of wrong...

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



