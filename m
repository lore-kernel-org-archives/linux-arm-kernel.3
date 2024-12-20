Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F26E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2MArtQqyY4LL4Ke+w35G56vZuWFzVrEUxrH+YtNy54=; b=sssK7A2E643XpCmT7AaGRFsitW
	DuWalWFzGS7WpqKMH02SZJQau8nc/F+88kkqlfCIzcu91vYCEip6O48vVX/uZKduWmbbpRBaB0rQQ
	kqHmjItRdghhyNnfvrJpPJtVUECbjunkGfqxj70RBZcG8QdyORuury2kn1KBKBSUYf5hDUg2zie3W
	3kSyEwlDwk/UjSvMIC/XaTA2obkNKYA8qVJyAUqis9/5gUnLYHdRXP7GTu3OhM05mDZxnuNqN6/Rv
	bieMKFPzdeuKlvRvw+iJ64VMD9b95KkKxVmEahYwXlumkbrrtdjki3rWUFXnII071FX7DOIZaoVll
	JtoGUpsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOayZ-00000004jyU-33GH;
	Fri, 20 Dec 2024 11:15:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOatn-00000004fpt-1hHg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 661915C6071;
	Fri, 20 Dec 2024 11:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAF2C4CECD;
	Fri, 20 Dec 2024 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734693026;
	bh=i5aQPwOsjXTcaF43Yc5gCbuob/VWuSK69DOQPOkEMP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTQrmd9QPcNFa3olWA0rG/WHiE1oqXcL2iDq9bAfpvL9QS5BAYvFGQf0IbcFkuXUF
	 peiQJ7KKpWwRyJ6LZXWrEfZpbOeIVvzgH+LFCMUQGTLGSxX16PI+2dcix9YLap84eq
	 07tRTJTn0uBFj6U0QJaASFRpxAPEZixst/Ad05Vb1TdKB9fQ4ZlRp5Orc+5eWe2fT8
	 CNW2IzujE48q/+/SBzaKyklbDJJGDoTPJTVHlrB69OE2L/Y0wJEAyFO8gvstFpK1Oo
	 gofdfIoZ+r3vY8Z9WJmUXDU2SWsWdbYk7MVDtmOEcR+zUIhE54+jIbHjrGbtYL4tiW
	 +J7FLN6mZow4A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOatj-005cKG-Lk;
	Fri, 20 Dec 2024 11:10:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Cc: Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/18] KVM: arm64: Non-protected guest stage-2 support for pKVM
Date: Fri, 20 Dec 2024 11:10:20 +0000
Message-Id: <173469300935.1371312.1616528930981043115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
References: <20241218194059.3670226-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com, tabba@google.com, vdonnefort@google.com, sebastianene@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_031027_538127_8EF4A3E3 
X-CRM114-Status: GOOD (  11.72  )
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

On Wed, 18 Dec 2024 19:40:41 +0000, Quentin Perret wrote:
> This is the v4 of the series adding support for non-protected guests
> stage-2 to pKVM. Please refer to v1 for all the context:
> 
>   https://lore.kernel.org/kvmarm/20241104133204.85208-1-qperret@google.com/
> 
> Please note that in its current form, this series has two main
> limitations that will be addressed separately:
> 
> [...]

Applied to next, thanks!

[01/18] KVM: arm64: Change the layout of enum pkvm_page_state
        commit: a1a1f1ff1f28d52deb39aa29b89663de2afefd67
[02/18] KVM: arm64: Move enum pkvm_page_state to memory.h
        commit: d4fc42a479c8e913fd61dbb432e67f35587c336a
[03/18] KVM: arm64: Make hyp_page::order a u8
        commit: b35875d466ad3cb08866eac067cca0581d4293d7
[04/18] KVM: arm64: Move host page ownership tracking to the hyp vmemmap
        commit: e94a7dea2972bd9a5ee3ed4312f7198370969407
[05/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
        commit: 5398ddc5c90bd418b90d859e9267aa39399021af
[06/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
        commit: e279c25d78d6729e39a0221c98185bd0e7aa0c99
[07/18] KVM: arm64: Make kvm_pgtable_stage2_init() a static inline function
        commit: c77e5181fed54b25d489eb7d2ccb5c1c72a1063c
[08/18] KVM: arm64: Add {get,put}_pkvm_hyp_vm() helpers
        commit: 99996d575ee69d4327bad98a0148729b73dde23a
[09/18] KVM: arm64: Introduce __pkvm_vcpu_{load,put}()
        commit: f7d03fcbf1f482069e9afac55b17de3bd323b8f6
[10/18] KVM: arm64: Introduce __pkvm_host_share_guest()
        commit: d0bd3e6570aee42766e7bd884734ae078667ea1e
[11/18] KVM: arm64: Introduce __pkvm_host_unshare_guest()
        commit: 72db3d3fbaa77ba649201c9e9f9d1a54fa76b217
[12/18] KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
        commit: 34884a0a4a53f9544f78e7e9556cb4d202e170d5
[13/18] KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
        commit: 26117e4c636c813be4fa31e9ec9410b7d02ced5c
[14/18] KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
        commit: 56ab4de37f4e13231e964cf7fa304818f791fea7
[15/18] KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
        commit: 76f0b18b3db57868fb0cabe691201aad3085b712
[16/18] KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
        commit: 0adce4d42f249b1701c136907055d9b12f8f6e1c
[17/18] KVM: arm64: Introduce the EL1 pKVM MMU
        commit: e912efed485a4c50bdc3934ae647e257ef568ef6
[18/18] KVM: arm64: Plumb the pKVM MMU in KVM
        commit: fce886a6020734d6253c2c5a3bc285e385cc5496

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



