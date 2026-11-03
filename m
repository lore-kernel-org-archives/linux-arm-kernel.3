Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F0F606D83C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BlyEdZca;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LbBcQE6B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lzQ3HNWhzYaDLrogyCICl28yU4XbYthw4RCyl8okdbo=; b=BlyEdZcasoir6E
	2sKN5RX8d4SUohcGuRayVsJ9CK9PaTdp6ydxFVwbCspmNUIl1xwrVYG55+ZJ/Aoe+0YfAPb5+1Rcg
	UqzaOcdKfPHhfTWBtGTu2MVV6O3K4UnrHdleYWTzhgQMIa4UuUb8YH/nMRz3VRSZl0wJT2YasR8ct
	dNpqQU2aePBLhVg5Bty+20eXyHQQ7YSbcJmi/uGVN9wwd3zZuk+pIKjbS1wmm7Ud3cRX09fDfXbqu
	T1cgEmsm3doct0/NIBUXCc9/olPy359W4f67GG7xUJQDkMk5zavIJx5S8gOpQYfCGd/E814o/r7Dl
	l4GnuKXUlHAir7MbFncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDb-00000002T5z-2L3w;
	Tue, 03 Nov 2026 13:06:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDV-00000002SxB-45cU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B805543F83;
	Tue,  3 Nov 2026 13:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929B31F00A1A;
	Tue,  3 Nov 2026 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711181;
	bh=lzQ3HNWhzYaDLrogyCICl28yU4XbYthw4RCyl8okdbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LbBcQE6BgAKqsxg1qBSJIiZSgEW/5Tqudwhnc1dBt7B6Lb1VRvFKD+WlBiC5lFha+
	 v0TXNUOp3uvqeRXT8/X39JP+Y/ruH3Ti6UqVGo7ZzzLIhAqv1PjXSVidW6dav2udBX
	 G8ATcVcx66sGahb40dX+40sFv39oZ1n9T4yNzESrkL/uznIB553wVgR6kUi8YGu9XS
	 lw1HhJog6OhVqg4QNbMABxg5uut2ohPcmbLyDEcO/Hya25ud2tqUW9U5EcCbDX8wGJ
	 m7qnHLTriWPxvJKAWIxTun2C7Oq7Ml0FXqgwmMcwEqJbqvOnl5LcKli8/Fbe3Qva3Z
	 dDLQK1tJx8VUg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDT-0000000ATWs-3npj;
	Tue, 03 Nov 2026 13:06:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jack Thomson <jackabt@amazon.com>,
	Congkai Tan <congkai@amazon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] KVM: arm64: Clear VM-wide state when kvm_setup_vcpu() fails
Date: Tue,  3 Nov 2026 13:05:39 +0000
Message-ID: <179371111283.2844725.1554269910653592811.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102075843.2556018-1-fuad.tabba@linux.dev>
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, ljs@kernel.org, jackabt@amazon.com, congkai@amazon.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, 02 Nov 2026 07:58:41 +0000, Fuad Tabba wrote:
> Changes since v3 [1]:
>   - New patch 2, clearing the default PMU left set by a failed INIT.
>   - Reworded patch 1's commit message.
>   - Rebased on 7.4-rc1.
> 
> A KVM_ARM_VCPU_INIT whose kvm_setup_vcpu() fails doesn't undo its
> changes to VM-wide state. Patch 1 clears the feature bitmap, which the
> PMU attributes read before the vCPU is initialized. Patch 2 clears the
> default PMU, which a retry with KVM_ARM_VCPU_PMU_V3_STRICT would
> otherwise inherit.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Clear the VM's feature bitmap when kvm_setup_vcpu() fails
      commit: 2c77a4a3040da8095e052849e2a0a05f598c8601
[2/2] KVM: arm64: Clear the default PMU when kvm_setup_vcpu() fails
      commit: 4d3361e4d60a46781c8697ee1ab9532f625163f1

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



