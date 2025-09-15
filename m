Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780CDCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpT8gZlFYwdE2CCLjZRd0g6d2OYO/VqdDHhpIsFL+io=; b=mBcvVnusqMaWElu34r0HLx3Ipv
	fcy34/91kAOqwpoHwJmUq4S2JM+jLnRpHYO1eOWKlAr4EO980K3Jb4lJ7dhKMJ2Pyj6RZ0jd/4GFz
	GZuMVHZQcYlfP6CeHcJoT0cab5a/uoQsoPrdfjz0h2Mpmfek+uJ42eRw5NeKD/nT3IIZQ2JWLrRRj
	zOwIYeGh3U8yW0Y03vh217HLP8pYrQyrKJsjlbZYN6KMrs9qxAkhZYHcr9WJ7g2PlQ/y9MwamgprV
	z3tOs5UGHEPUC5P3ifocRZ9aegRG1lxtkkcEL/mAoFCofujcr2Q8fHcTesoSh+duKKj7RaCyAq3+d
	A/a+y9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5rn-00000003WyT-2osL;
	Mon, 15 Sep 2025 09:51:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5rn-00000003Wy5-0Hgv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3519260191;
	Mon, 15 Sep 2025 09:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AD5C4CEF1;
	Mon, 15 Sep 2025 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757929881;
	bh=WnvFPefftVMi57x0Cm0fT5bmITli/JYWAqUWuBi4lYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u2vgHIqFRTWF1iMBEYAe1cawXkRSaQXb66y5dTwbpcu9S3aQ6ro0/N3L9M6e5zlnT
	 xP5p/0a/gtSDrRuZ38hsR7bKZNxu7N/9JSyXNPbBgjqwif1n7MhplpMCo735Hrlj0Q
	 icL9TrZOGRA6GtCcnEzznvt9RUkg2Zi7BYY2ID2Jkg1b7EaK3MOIVt4op3hpIpkC0Z
	 DyxrhrX6oyVWWTYEs/50KhqLHiDf/m51uMQVd5dXcaL4ShZP4bumIKO6PswBpx4VOj
	 v1G/zLkFm8TjWWyyrSwUtfkMxBbnFtmfeWxwPuF59QulO6S8iDVnd6V3KDdRLjo+dM
	 iAA/ckjxuBxqg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy5rj-00000006JXG-3XXW;
	Mon, 15 Sep 2025 09:51:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com,
	tabba@google.com,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix debug checking for np-guests using huge mappings
Date: Mon, 15 Sep 2025 10:51:16 +0100
Message-Id: <175792986708.521391.13226361640238803389.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250815162655.121108-1-ben.horgan@arm.com>
References: <20250815162655.121108-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, ben.horgan@arm.com, james.morse@arm.com, tabba@google.com, vdonnefort@google.com, qperret@google.com, ryan.roberts@arm.com, stable@vger.kernel.org
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

On Fri, 15 Aug 2025 17:26:55 +0100, Ben Horgan wrote:
> When running with transparent huge pages and CONFIG_NVHE_EL2_DEBUG then
> the debug checking in assert_host_shared_guest() fails on the launch of an
> np-guest. This WARN_ON() causes a panic and generates the stack below.
> 
> In __pkvm_host_relax_perms_guest() the debug checking assumes the mapping
> is a single page but it may be a block map. Update the checking so that
> the size is not checked and just assumes the correct size.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Fix debug checking for np-guests using huge mappings
      commit: 2ba972bf71cb71d2127ec6c3db1ceb6dd0c73173

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



