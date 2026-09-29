Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF9ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OfoBrmWG0bD9vaJRjd0S5rVgXGLpoNdNRXURAF0ZLk=; b=kSBBgv9PBBaveQC7gOYSwE8D+b
	GZjdjNTFKTowLlpUFOupPBu/tej8tx0XlRJW/rHEdxLFN222vM6S0M0jjmogaiSqkt3qSXsHWRczB
	YNrzWKiP/rajMOL5/x1DM7lgOgM8yXaKgdutFduNy+2w5WgmScZcEF77CrHZjqNX1Zq38ysKct0iq
	EE+Nx2teeAYEzc8KsD6E2qYdc2AbZD3mY2ut6xtr1s2axc22HNmbTIu1ODyVqpkCK0D4H8Tt8OlcP
	Ep/pnt156sRjKSBKI6wJoCVUpuQT4PEbj73//6DFSdWEE1Sgv9VbSG4EEvKW/LnDRjRNTZKP+Docz
	Rv0MGtcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdZS-00000004NSl-28aX;
	Tue, 29 Sep 2026 19:32:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdZQ-00000004NRk-3NxG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:32:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 832C942DC5;
	Tue, 29 Sep 2026 19:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329571F00893;
	Tue, 29 Sep 2026 19:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710376;
	bh=/OfoBrmWG0bD9vaJRjd0S5rVgXGLpoNdNRXURAF0ZLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PGqNQ2Ro+s162Kh1Rn4dC0vD9IhjQndkykHb5cglE2KR7qfti31OdfG9NSJIJ+WOY
	 5A3XRybO06J9BlMwuKzbXzEYXA43hz8Qx/tFVP+ADadyGBUDuT95mJyVCbxFVZAag2
	 uTMmN+lJO9NTV9z6tw0Cz/kxylAyi2+Z03tIC8PGRmumdSmIlWY6cK2Dc9bGYJ0mQA
	 KZEQAMSYM284fLzndQHYGWhYFE9ypJMYX72EctmMcHXeolykzuwHhky0D+TKTONzda
	 WPOkZPxjyu6nSSnOCsdVba7Magggv08NfiZXZNDj/mpjquXh8U7GyIrxWM1DCg62oP
	 QnGKSgp5cnwCw==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] KVM: arm64: Fix HCR_EL2 for non-protected VMs in pKVM
Date: Tue, 29 Sep 2026 12:32:52 -0700
Message-ID: <179071036893.5634.18190465958377898679.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929090031.3829185-1-fuad.tabba@linux.dev>
References: <20260929090031.3829185-1-fuad.tabba@linux.dev>
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

On Tue, 29 Sep 2026 10:00:27 +0100, Fuad Tabba wrote:
> Changes since v2 [1]:
> - Patch 1: apply the FGUs on a CPU without FEAT_FGT instead of moving
>   the check in handle_tlbi_el1() (Oliver [2]). Wei-Lin's Reviewed-by
>   dropped with the rewrite.
> 
> In pKVM, EL2 sets a non-protected VM's HCR_EL2 in pkvm_vcpu_reset_hcr(),
> which misses the RW, TID5 and TTLBOS handling of vcpu_set_hcr(), and
> takes only TWI, TWE and VSE from the host. As a result, an AArch32 VM
> can't run, a VM can read GMID_EL1 or execute a TLBI OS its ID registers
> hide, and the host's TVM, VI and VF never reach it.
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
      https://git.kernel.org/kvmarm/kvmarm/c/4bdd2b3a708c
[2/4] KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
      https://git.kernel.org/kvmarm/kvmarm/c/80ae56184b57
[3/4] KVM: arm64: Use the host's HCR_EL2 for non-protected VMs in pKVM
      https://git.kernel.org/kvmarm/kvmarm/c/04447b95c62b
[4/4] KVM: arm64: selftests: Check a feature hidden in an ID register is UNDEF
      https://git.kernel.org/kvmarm/kvmarm/c/afb4334fb52c

--
Best,
Oliver

