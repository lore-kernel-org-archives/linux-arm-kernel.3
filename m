Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5484FC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kITGBLaEuByWDlQ4ttUZ92NcpoYq1LnLyXeZLXQ06VQ=; b=LvXBfkw3gJYUhIHH9/Eir0HKI/
	JeLdzwhpEv6AS3T3lkvgwlg1NqJlVzzTr6Va3QwgEvt7VwADowJgown1+wkyGoFie2V6xK5AX9RWT
	70/BoThmqlwWBhaAuDdQNtEKEp2CORCilb9dxDCzuxEcmWmaFC/5hauikI89WealJW5Nc2A5ZE/zl
	C85lnH/JzV7fZr94J83O4TZ5MysEuJa0zOpIu+KvygxhEiyEBqU9RRNQSUjMSjhLaGY76W3ag0F3R
	ZVUXyN5Guy3cri8oWLIC5pwVVtYHcNaWXaL1Dk4y3j+gvhslWm/aKykjQzBVfviAweXl61IwVmE1h
	1zWllbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfcH-0000000FHoR-3S8P;
	Wed, 21 May 2025 09:20:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfRr-0000000FGCO-3nuS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43D8443B67;
	Wed, 21 May 2025 09:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C42CC4CEE4;
	Wed, 21 May 2025 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818555;
	bh=rQWeD7Zv9S8lUfwgwcqjvMT3NtNYxB+ORXu2V9AzkaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xn9Uwkn6mweXruw9RicrdMOuWK+snyHBEQ9ymv6cVIFJJ/n12Qbx4bthyH8LdXujB
	 kkiNJRLevZHe2P8JflQXN0pbI1S8mbqKt8SJbEJ1yIzedDS34lS6OgA3G2zk1sQDrb
	 CtZ/+6k4E5xJq085hXQDR43k5boJ80Tgg7XjyX53C40YNpPq56Su9gXZWd6RsFv2B3
	 O+Q8jhKk5Wamqn3DTpSJ4mXu5BnzNQYXzc4XgmNs+sukudYGMaFaCMThDvufi85PR+
	 A+/Tzuup5+JsPgnXmBW2WsGkuN/FafeRJvg2pIh9x+Q7vk6i+Y/o71h959EQ7yMwku
	 pPTgfrPf0e4gw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uHfRo-00GrlR-NR;
	Wed, 21 May 2025 10:09:12 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: nv: Hold mmu_lock when invalidating VNCR SW-TLB before translating
Date: Wed, 21 May 2025 10:09:09 +0100
Message-Id: <174781853950.4059800.1864401181776978793.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250520144116.3667978-1-maz@kernel.org>
References: <20250520144116.3667978-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_020915_962494_EB26E514 
X-CRM114-Status: GOOD (  11.00  )
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

On Tue, 20 May 2025 15:41:16 +0100, Marc Zyngier wrote:
> When translating a VNCR translation fault, we start by marking the
> current SW-managed TLB as invalid, so that we can populate it
> in place. This is, however, done without the mmu_lock held.
> 
> A consequence of this is that another CPU dealing with TLBI
> emulation can observe a translation still flagged as valid, but
> with invalid walk results (such as pgshift being 0). Bad things
> can result from this, such as a BUG() in pgshift_level_to_ttl().
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: nv: Hold mmu_lock when invalidating VNCR SW-TLB before translating
      commit: d43548f422f27219eff5ce1897336af2c4f15091

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



