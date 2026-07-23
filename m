Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11F9C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOr5ljlsCVeZSINefwBYhyhG9tgMsXZ5YrKDjgTEp3M=; b=CXMcWuyRlRU1u9it2YQy2PoiYK
	Hr/KzjtGpfIq1m5u0JHQ2xFEZ9jL7Rd2ayFZ0dMl3VZeN+JaTFSTPsnlBzVsn9yjNFZIdhznDNZyD
	a/QqM1ZeWJngWzz2rTAb8joZZeIKULloL/EnzOavq09RNnjAeZia5NrTfHJf/5Oifjl5qIE95TedY
	ZMThDkOL588YunTv1sEuRcIrdqSn2ZwBRKVtULD99/PSzlYuBCbmzHrXZhSuMENZwPA2C/lnfYWjF
	Sx6rh/wU4dTwxMN+Che6W5VAcj7fPnxlOlc0rkluuNq1zvh4rTWm0zipIEEdjsb3dMj71QaEelJi1
	fuHeH8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw10-0000000EgDF-0Ibb;
	Thu, 23 Jul 2026 16:11:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw0y-0000000EgCs-42iM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:11:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14DFB40D92;
	Thu, 23 Jul 2026 16:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86B71F000E9;
	Thu, 23 Jul 2026 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784823076;
	bh=qOr5ljlsCVeZSINefwBYhyhG9tgMsXZ5YrKDjgTEp3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dGZg3kF5RRE/dU4u8hgLFE7Ix1M/4LBFVq/cba/cFQn4j72rLx2A5gb0A0P5k0SaC
	 fRGweiuYPywAKiHt7Aqbz7u5Xvfcivcpl6enKOD9OukULeR/a0MeV5bGci7CggmyUz
	 ISHx49pH4Km/kElspV2HZO03ic4WS6VDHXFu6jA0lDzwtd16xLn+aXbKB1yzgZNiiU
	 gi+rBTptKCsnVjn0Hc796sZ6U7ATU6lwxJvgDwa7+WBppjbTO08txpdTPc8Qhykx2S
	 fwoTahA8SzGr2Q4XmpvPSvC/wGUiyX/HQup1twixgBUR3J5D9OOYscQwsmISAGkB0W
	 s+Lzw65QyYE0A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmw0j-0000000871w-0mTO;
	Thu, 23 Jul 2026 16:11:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: steven.price@arm.com,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v4] KVM: arm64: Reject guest_memfd memslots when the VM has MTE
Date: Thu, 23 Jul 2026 17:10:57 +0100
Message-ID: <178482303779.3351010.2125689517087655754.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722090354.94245-1-alexandru.elisei@arm.com>
References: <20260722090354.94245-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, alexandru.elisei@arm.com, steven.price@arm.com, fuad.tabba@linux.dev
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

On Wed, 22 Jul 2026 10:03:54 +0100, Alexandru Elisei wrote:
> The user cannot use MTE on VMAs created by mapping a guest_memfd file,
> as arch_calc_vm_flag_bits() does not set VM_MTE_ALLOWED.
> 
> When creating a guest_memfd backed memslot,
> kvm_arch_prepare_memory_region() rejects the memslot if MTE is enabled for
> the VM and if guest_memfd has been mapped in a VMA that intersects the
> memslot.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Reject guest_memfd memslots when the VM has MTE
      commit: 679d7201c1f09e37fa1c12ce28d84079c17fc87f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



