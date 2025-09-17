Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F64CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYMecdyw/WPKhDEpbSWdpbOuHu00vT+agsN45BlBJXw=; b=uMd3tGYvCQhO25/tXj5yvrWMUd
	LoUIrnwBXpRVuEYGZNT9O27Vg23PI49y8ypVOOB0I2wxtu/RaWVcdi4H0BT0SNXqkAVfTa5FTVpiu
	MjiISIfIz+lA8NzFhcxIl8AQNRHLp36Zy1j9l6lcUJzioBZgofbYpm60gtYHU2aoMTj5/7jUQM4Wb
	gWrhbRPFV8JkkVaZu6eNvktLvkHLb/nlF8d250U61jOz6m6V/WgXcpAFYbPjG7hLki2Ix56QQZvbS
	ipyeXfJumzmEGYYVTDEqbOaeUW90AaaRpNjwMopnj/KGdJlzejnDSeTmCH5nH9qpqUHDx4sonwyZ0
	7E8BvR+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvFa-0000000DHQz-1PtS;
	Wed, 17 Sep 2025 16:43:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvFY-0000000DHQJ-3EXQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3598160239;
	Wed, 17 Sep 2025 16:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D063EC4CEE7;
	Wed, 17 Sep 2025 16:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758127399;
	bh=xEyniTA6kZCCEt9/e6UwyCJ68SzkpPAahdVtJFbmuZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RUH+jnNSUD01BZPB0ohKYtxvP/09yEgMEh5lTA2iUt1NmmNNvt3shU+MTPXf3Z3Cw
	 Zu0iNoo4177A2PBUGvmMrunTOyhPMc3gI1veZQ7AkYuWqrU2FBtme71pVPOFjNvfcf
	 34SUWY6Jz3h7Rpn6NFkj7UI4l6/EIg1MwzrRmvSoLjVIekt/8HFUe58w2h2h8e+z1f
	 7bTrDuPzjmkZYjHIuykgvmnTL9ByhQhpGUteZoYs52Uz0trbAU1Tl+fHjYWH5fSwbr
	 m0vmPvIqDPZprXjO//NCogrmte54tTjpNyH2ojcl+XIFxI/AYo2sVY8GJ4zhddT/M1
	 TVmRJjGlprPtQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyvFV-00000007AF5-2f6j;
	Wed, 17 Sep 2025 16:43:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: oliver.upton@linux.dev,
	ankita@nvidia.com,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Subject: Re: [PATCH v1] KVM: arm64: Fix page leak in user_mem_abort()
Date: Wed, 17 Sep 2025 17:43:14 +0100
Message-Id: <175812736819.1632848.17948994955088762874.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250917130737.2139403-1-tabba@google.com>
References: <20250917130737.2139403-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, oliver.upton@linux.dev, ankita@nvidia.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
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

On Wed, 17 Sep 2025 14:07:37 +0100, Fuad Tabba wrote:
> The user_mem_abort() function acquires a page reference via
> __kvm_faultin_pfn() early in its execution. However, the subsequent
> checks for mismatched attributes between stage 1 and stage 2 mappings
> would return an error code directly, bypassing the corresponding page
> release.
> 
> Fix this by storing the error and releasing the unused page before
> returning the error.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Fix page leak in user_mem_abort()
      commit: 5f9466b50c1b4253d91abf81780b90a722133162

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



