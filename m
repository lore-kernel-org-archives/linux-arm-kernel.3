Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7D606D838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y7rRNbxN;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvQhj2iV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gi/ch/JS08KZSEQShoG8gR4zN7dxLDnzLol7acy/5Vg=; b=Y7rRNbxNMTNl5u
	DlKjDx+sXhmUOQrBU2EC3aFZWuFj8nuGSV/Ph93iEVaX3aWjyaUWsalm5+KkjL09N8sZbHpuC83Xg
	BUUP1V+mQM1+gL/fQgkH6AvQClQJFmnQt1/WPSsyUTSvs1QAKB/xIGx0tn6NhY/iUUjStfu4xt9+m
	ZnHCUyroRxGvrJ4EaS477P5Avw6QFDIJOd1mDQmZNMX9/MF4GjyW2IEJ91Be/eFwxKHglpVH4Wmnf
	h5hAqnGxoFAtIWArfAqv2zcBK2bLm50GpJ4y0t+0g6u7bSat+PA0d+vZVDdnQoX/ZYSqoRcflH5ZW
	LmJ6aIBxaR8rmjwrezIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDc-00000002T9R-1J3M;
	Tue, 03 Nov 2026 13:06:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDW-00000002Sxb-3h40
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0E5B43FAA;
	Tue,  3 Nov 2026 13:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8642E1F00A1D;
	Tue,  3 Nov 2026 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711182;
	bh=gi/ch/JS08KZSEQShoG8gR4zN7dxLDnzLol7acy/5Vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EvQhj2iVix1aRypilF9q5+I4jRU6doXjIxnrceClJ2CCua5UejUQacIa9qU0b8P0A
	 3/HLIwKBzEuZxE6FuYx30iQXymrdxQ9PQIGsgiCT1gGiC6iJjiDfs+aQhme95KN+tp
	 hYy1w8Ym09+e8bOrwC89CmOFaEjUumLuV8MuywguvanpYsTuPSDx+/zRU/iLYn7WGK
	 /PkEf9GBLizjkkEBtYzVJTvQB9Px7wSZCNkTeei6f4rqSFxLnPRy1tkKanonEmPJ1X
	 6ARFk565Ijt5CwMNcnm2+WM4oKtAFGRz0r3ELbrLdHvYAgMbFAeam0k+2w55/yHIca
	 fjpwUu8Yn+tMw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDU-0000000ATWs-3brp;
	Tue, 03 Nov 2026 13:06:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	fuad.tabba@linux.dev
Subject: Re: [PATCH v3 0/3] KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
Date: Tue,  3 Nov 2026 13:05:43 +0000
Message-ID: <179371111274.2844725.10738351642638708821.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026163937.963087-1-vdonnefort@google.com>
References: <20261026163937.963087-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, fuad.tabba@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 16:39:34 +0000, Vincent Donnefort wrote:
> The GICv3 List Registers (LRs) are architecturally UNKNOWN when a CPU
> boots or wakes up from a low-power state. When pKVM is enabled,
> __vgic_v3_init_lrs() is currently never called on boot, CPU hotplug, or
> CPU PM resume.
> 
> Following Marc's comments on v1, instead of handling the LR reset inside
> the pKVM hypervisor, this series fixes the host CPU init, hotplug, and
> PM paths to properly reset the vGIC LRs even when pKVM is enabled. This
> removes a few calls to is_protected_kvm_enabled(), making the whole
> hypervisor init machinery more generic.
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: Make __vgic_v3_init_lrs HVC always available
      commit: a511905b3c0d6e73afcc4016b2eddc159703060e
[2/3] KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
      commit: 91e496a1e474d56e296f3997ed2a34185e9a1c0c
[3/3] KVM: arm64: pkvm: Reset GICv3 LRs in the hypervisor
      commit: 5fe9e7dbc78e3ade118a8f64952b7ed84e502afa

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



