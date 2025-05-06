Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEBEC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hIs4kYQ/8AUEaNU9adxnPX0LUqAlUrUyVh2fA29MtE=; b=w5mUNI4izKzj16Lsufw/wrQuop
	GoZrQ/7C4/WdLImC71R9W1I+ysKIjK615ec5pDWZdhc6oxmfP3zKwTN2KjKL9tQrii6s9hSVjJEQ0
	phyTYmmblRykjiZ/NLbE667E2/vjwC3qiBhlWNj3iA/tIF9FFGuq9aXbmqNDkw0W2kS2eHuibhWTG
	Xlw6ZSf/kO1mhHv1nbIGYc6ipnUFTMn9Z924gIVbyiHvqbek1lB2hmvr9nMJa95IzwzRNmLFPEeLx
	33l49gqgDvq4m1su/2E6M/VLIgvDbvYHlaMp1f6JDV/uXdRJJflndYC5LriRnFYZC8yxGDFwz1VNl
	w4902HNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFEo-0000000BWMN-11uR;
	Tue, 06 May 2025 10:09:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEHP-0000000BHPV-3xMC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:08:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 211F06113B;
	Tue,  6 May 2025 09:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6776C4CEE4;
	Tue,  6 May 2025 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746522478;
	bh=j31e8lcl30uAslMTPj/lN5w+liDEy+pA614g2Hzy8sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JJnLKHHtHYU4BaA4zZ1CuOfgF4Wo62bsGVQG0zV6WPhIlXTOc3LfqPvVc4K5XmQyb
	 1pbV9Ul5k1OAnyepdlWtjUfq3hwyGWwIJTUYaX+EAG3VPfO6KeLX4MLjiKPOCnqZrg
	 xDwDxJq8403qq7tbu7W2/hFVzsshN+7fnHmWJmUn6bIhHWf2kyVOmrcAGpq8NzFTFS
	 ShWN0HG4FiLEp73mxWsMaF9NaiN8fC+gjhF09umy+uO6SOI10I00i5j8/XHMF07lyG
	 2oZL1EiBOMrCWcydGbrjoZ28IpPN42fH4Csim19QQjXYxzovbxdFNeSMwkIwxWfVFL
	 AvPYBOJUq8drg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCEHM-00CA0o-Kp;
	Tue, 06 May 2025 10:07:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Selftest for pKVM ownership transitions
Date: Tue,  6 May 2025 10:07:50 +0100
Message-Id: <174652245698.339986.17396989011310666690.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250416160900.3078417-1-qperret@google.com>
References: <20250416160900.3078417-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Wed, 16 Apr 2025 16:08:56 +0000, Quentin Perret wrote:
> This is the v3 of the pKVM selftest series, v2 was here [1]. This series
> depends on [2] which moves the hyp tracking to the vmemmap. A full
> stack on top of v6.15-rc2 with everything applied is available here:
> 
>     https://android-kvm.googlesource.com/linux qperret/pkvm-selftest-v3
> 
> Changes since v2:
>  - rebased on top of v2 of the hyp-state-in-vmemmap series [2];
>  - thanks to above rebase, dropped the PKVM_SELFTEST kconfig option and
>    folded the selftest under the existing NVHE_EL2_DEBUG;
>  - fixed commit message of patch 02
> 
> [...]

Applied to kvm-arm64/pkvm-selftest-6.16, thanks!

[1/4] KVM: arm64: Add .hyp.data section
      commit: 74b13d5816c9389381e937b218f49f03921f87fe
[2/4] KVM: arm64: Don't WARN from __pkvm_host_share_guest()
      commit: 845f126732a8126dee3f15855487121f4836131a
[3/4] KVM: arm64: Selftest for pKVM transitions
      commit: 6c2d4c319c7db7be883428ae1161502f3f690e60
[4/4] KVM: arm64: Extend pKVM selftest for np-guests
      commit: 48d564507293082c370a5fc1eb3d73ad3de30561

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



