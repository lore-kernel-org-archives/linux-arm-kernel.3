Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80E5CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 11:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgA1DgykL+BaLbXe50RwqPlxXpHwqTaPNyBnZhqCTY8=; b=u8bdRpBh/bk5bnUw1dEUg3fMFa
	5xvGQvtt2EbPI5ifeDj2vk5RTWZbFow71qkRi1OUQ71ACpEAVdzDdsemj3mCJppL4lYTaTxWVmx4A
	JE+BmDqkK7zwuz8snIioZMvyGY0OhcZ6ie2xJg2valatlHbMz6ckASu9cgxDVTvGgChios+U+U3TJ
	c2AtoXgCaKc0BDUzpYMqu49JFA2fosqg82R4g5R4qIiQMR+P+eoa6auned3hQjX+tY1K+ApYyhJO3
	A0SbpHHjLbSbeFNr9IEicgx0lLP0F1F09myjR4DrqsGBBZ3enu02jZRf1R3rKmM2wR4Z2VMnN9JAk
	cuFGiILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZonW-0000000HH16-00n4;
	Wed, 17 Jun 2026 11:51:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZonT-0000000HH0H-2cy1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 11:51:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63E6542A08;
	Wed, 17 Jun 2026 11:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4484A1F00A3A;
	Wed, 17 Jun 2026 11:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781697067;
	bh=KgA1DgykL+BaLbXe50RwqPlxXpHwqTaPNyBnZhqCTY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LxImjCxvE+lHto3qs4QaQj4Ltb4uvswB13be49XyOM1tQ0UXBgtA8nb9sY8StdBQr
	 ztYmWbcupuy5+8g4hrq9y8xRW9GiQacgluovZZdxh+Fe8/gp4S1b8+B7pDQ0O3Iqxo
	 8bAr+6m7Tddkz9kzQr8z7PX5q/3QWB6vsa14rQOlgqrKqX8N9N5rWMeHEm4OiCSUsL
	 3eoOenBhNRPyZC+5mVu9tnIV1MdmjxtPh3RiSvXx0VrbIW/kbdnDz7VIxXlU0GU6i2
	 RvLpS6SbJTOm/Q0dkZ4xVoJtQbhs44Me58IsBpD4Zslm7kl/0A4fTAHOskc2fxMnck
	 bjUUSmKLYMZIA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wZonR-0000000DfJC-16tQ;
	Wed, 17 Jun 2026 11:51:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Sascha.Bischoff@arm.com,
	jic23@kernel.org,
	timothy.hayes@arm.com,
	eric.auger@linaro.org,
	christoffer.dall@linaro.org,
	andre.przywara@arm.com,
	Hyunwoo Kim <imv4bel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: vgic: Check the interrupt is still ours before migrating it
Date: Wed, 17 Jun 2026 12:51:01 +0100
Message-ID: <178169701874.3049015.8446502456304236098.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aiHnI1mu6SGQrgnz@v4bel>
References: <aiHnI1mu6SGQrgnz@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com, jic23@kernel.org, timothy.hayes@arm.com, eric.auger@linaro.org, christoffer.dall@linaro.org, andre.przywara@arm.com, imv4bel@gmail.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
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

On Fri, 05 Jun 2026 05:59:15 +0900, Hyunwoo Kim wrote:
> vgic_prune_ap_list() drops both ap_list_lock and irq_lock while migrating
> an interrupt to another vCPU. After reacquiring the locks it only checks
> that the affinity is unchanged (target_vcpu == vgic_target_oracle(irq))
> before moving the interrupt, which assumes that an interrupt whose affinity
> is preserved is still queued on this vCPU's ap_list.
> 
> That assumption no longer holds if the interrupt is taken off the ap_list
> while the locks are dropped. vgic_flush_pending_lpis() removes the
> interrupt from the list and sets irq->vcpu to NULL, but leaves
> enabled/pending/target_vcpu untouched. As the interrupt is still enabled
> and pending, vgic_target_oracle() returns the same target_vcpu, so the
> affinity check passes and list_del() is run a second time on an entry that
> has already been removed.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic: Check the interrupt is still ours before migrating it
      commit: 0074b82cdfcb5fd13710a0ac308ade68ac6f6fbe

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



