Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362F5CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssvjJnzGgYY6LCenFj5kMursu0y4wTQOtcvA+OHJhM0=; b=k8J1E1gRhCyj2X44YT17qgkfCr
	YlrxFI6OO9I185tfcfRitJlftxZnoE7MwglHwoJ3W/v1k43VdgqFa1cTp2CtThGquT+3/cePKZIRe
	hAf2uy2aIgogGXGsvbLK67wP38D0cn55coHz5Q6K190pfu6QZVkfYtqQ7VM2ZgqpRKlTDsDIkS9gr
	MsfmwtQHeP+cv9iMKttht8p5f/9HpRBPS3lh8I346zgO205BsGLU8vB/EEP2Sb5sOo9l0dFCyOujy
	jnut14+fefspczqg5z1Z6mZ09Nozt5xMchkPcw+gqKtm72LRBnXIBWqxuqqvMhbl7AosSK5p8tdFv
	VicHe6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAdu-00000006Nj3-3dD5;
	Fri, 09 Oct 2026 13:28:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAdt-00000006Niw-3RE6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 13:28:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3649741459;
	Fri,  9 Oct 2026 13:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A221F000FF;
	Fri,  9 Oct 2026 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791552489;
	bh=ssvjJnzGgYY6LCenFj5kMursu0y4wTQOtcvA+OHJhM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kpVVbJo8KPnVDzW8Jo0dSP0/W8OB9yaicomwY1PZNXH2uBybGHoy9EmH8CeJp/sMI
	 zrEmi24Aq0xrHX6qtGWSxbb/oer9MaJaBSv2XrtGOlvrl30/JyOqGrRUb7AWPKHHLR
	 BiMhSmX2FaqIfNVfLqU7r1JMfQkKiE8xIqAEAbPWxY8x6u7GVIAWKKa2TlSAGl+lm5
	 wsgvSRci0xHVEdOwwwaXedS8NA7RJTMpvWpLsrS0nT5BjO54PeVz4Lp5YxgGvEJ1RZ
	 PnUg9aN0jlK5a/lB+80ysB3V4iTnmOQf6HaKZpsrYqRu88lfMFtBJDljeUZOY82yOl
	 Wy8/EvMpI16hw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xFAdr-00000001179-0PYe;
	Fri, 09 Oct 2026 13:28:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	jonathan.cameron@oss.qualcomm.com,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v23 00/14] KVM: arm64: CCA: Add basic plumbing for Realms
Date: Fri,  9 Oct 2026 14:28:03 +0100
Message-ID: <179155224299.829527.1733164520192309991.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007073537.2454351-1-suzuki.poulose@arm.com>
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, suzuki.poulose@arm.com, will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com, jonathan.cameron@oss.qualcomm.com, fuad.tabba@linux.dev, sudeep.holla@kernel.org
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

On Wed, 07 Oct 2026 08:35:23 +0100, Suzuki K Poulose wrote:
> This is a trimmed down and updated version of the v22 of Arm CCA basic
> plumbing series [0]. I have dropped the CCA specific bits for the sake keeping
> them separate. This series now only contains the framework for handling
> different VM types and lay down the path for adding Realm as one of the
> protected VMs. The full support for running Realms under KVM is available as
> an integration branch at [1].
> 
> [...]

Applied to next, thanks!

[01/14] KVM: arm64: protected VM: Handle user writes to CNTVCT_EL0/CNTPCT_EL0
        commit: 3d736a339e9cbeec3841da1a821f56fb3230fd68
[03/14] KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
        commit: 22adb9c3543cc702516c18f0a28e3a8dfcdbeecc
[04/14] KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
        commit: 0c4063f89bfdf204112651f45620ef0c5a691e6b
[05/14] KVM: arm64: Track the type of VM in kvm_arch
        commit: 762ad274c03a13686192d75ef9a354b96114b503
[06/14] KVM: arm64: Don't call vcpu_set_pauth_traps for pKVM host
        commit: 42a4026b435e49af4d5eaae58afe7103ca740c30
[07/14] KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
        commit: 8252f74f9188b9148ec93438e53b8e1b865ffb7b
[08/14] KVM: arm64: Add vcpu load/put call backs for flavors
        commit: 0cb16544ccaceba4c5e8beb2e8ae896278dcf018
[09/14] KVM: arm64: Consolidate stage2 unmap range into kvm_stage2_unmap_range
        commit: fb3926af9d0d5e2e2f58a1f4b2252f529fbe23bf
[10/14] KVM: arm64: Add VM specific callback for S2 MMU operations
        commit: 68933203edddc092b30dd1039167b3262a40a326
[11/14] KVM: arm64: Use a local kvm pointer in kvm_handle_guest_abort()
        commit: 4ee1b583589781bfd47b28da3ce216b2fb51dac5
[12/14] KVM: arm64: Abstract out memory abort handling
        commit: b44a8c32f0116aba0a934c3068628bacda3cd3a3
[13/14] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
        commit: 37d7ea3f81bbe61f1e895b6c87decadbfe8799eb
[14/14] KVM: arm64: Prevent unsupported vcpu features for VM types
        commit: a467f39afc2a149f9f5efbb7238fb531ade8a86e

FWIW: I've dropped patch #2, which was a duplicate of an equivalent pKVM
change, kept patch #13 (we can simplify things down the line), and hacked
the patch #14 merge so that we don't have to describe things twice.

Of course, mmu.c is where the crap happens, so anyone with any interest
in this stuff being halfway sane, please review the conflict resolution.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



