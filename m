Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F20CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0jXpEJR6USwKZy8AIouN/zTfh5C7mB65VDbPnHdP4o=; b=xgcwXo7mS/3jC7d7rvCqlmcM6h
	ywsQQxbrP8uYfcsCaHnY2KaM90gOry2VWS8cg1kmZdSRBxfKGFmiIESOZ8JU1q3uP17ND4xRjwZ8v
	ZhNHdJsd4xpVcKXxWVJwO+AGLY7wpQebUXBZt93Yaj+PNOvUR0g8F+4xwn44cCKV/qiGtFs9vcnIB
	0SEL+AGOPz4QP13UDBgZ8Faz6pwfcR7xJZFAoDRmiKrftBM9mxEGC/xv2d66biGtLWwXlPPDxl1+e
	gVOBrDrRrAp8RnnrWLb0+TP2c+gcsXuCF8pIPDHYYoFDJnLkOY3NpLW3eNZ0cqfsI9pBKOI4zl/C5
	JhTjJEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LqU-0000000DwgS-3fWP;
	Mon, 13 Oct 2025 16:56:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LqS-0000000DweN-13nq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:56:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66153620BE;
	Mon, 13 Oct 2025 16:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E06C4CEE7;
	Mon, 13 Oct 2025 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760374583;
	bh=NCmPsOOiO4a4VbGDcAYCyafylTmfuKIwr1PxKNmChbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U+cB7gA3KcYsB2Ux+1DHed+dbo6nF/VCFURjCDzsJa3U8yQCINcbIFxuNN64Nrf9+
	 OxV0cy8NG5M4w/ZWEgIMM+yfi+JypzDRnz7sFyRPkwKV4Xie8rKCe1wUlcfdigDPK/
	 XcZXCKP3Bwv+4uqHGsyIopDifz2PivQ7skvSW2V+kYJ3ZiXbU+5ea4aa/sLMini8hP
	 O34TM0BLzLLEBTpYiDHNoU0TYDn80ZJwlm+PAY39SU/31pT3Kxi+KrF1psbHrC37yg
	 wGfiDwbqIWLmiAb2v5MpxEbW1bhhlSW+y030YDg7zFTW80m2SkUkFVOebfs+T+MK7w
	 FWiZarKCpL6vw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8LqP-0000000DaVd-05PC;
	Mon, 13 Oct 2025 16:56:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH] KVM: arm64: selftests: Allocate vcpus with correct size
Date: Mon, 13 Oct 2025 17:56:17 +0100
Message-ID: <176037441177.969330.10756957974370732215.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008154520.54801-1-zenghui.yu@linux.dev>
References: <20251008154520.54801-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com
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

On Wed, 08 Oct 2025 23:45:20 +0800, Zenghui Yu wrote:
> vcpus array contains pointers to struct kvm_vcpu {}. It is way overkill
> to allocate the array with (nr_cpus * sizeof(struct kvm_vcpu)). Fix the
> allocation by using the correct size.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: selftests: Allocate vcpus with correct size
      commit: 2192d348c0aa0cc2e7249dc3709f21bfe0a0170c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



