Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ACDCA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSZ7qhDxfmONH8caf2Y2srBrN3d6GSLhEYO65kvAohk=; b=qhWNjCDbJ3JYF0r7UmuDjs/db9
	huqno0Aw24rVtDUETlGtspnRA4lUy98pdM3nUdzwT5Y6jnOn3LYuKXL+/mWkw4nr1u38EFLUp/Vq/
	lvs1dPQ+yKIMbP+LeviFoDSAPMoFOxsZ3T0m9o5grMqri1cIaE1m34pn1YGiFy+REOyAvsN74f8j3
	lpn6+H3+0RqX0nzTgAwRi4mqaCPxGCe0ksAnNxAH2jCt48/n/sNSAwz7n+pHNs9YOsQt/Z4bYfAcn
	hYrxR1u9vyY1MqLuyD0PVtd1JpRwbBF5OgBOgp2eAMk3teqEPEbiekb2Dc5ad9H5h3fMovczQo4tE
	hJiypJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdZd-00000004NWe-2YNp;
	Tue, 29 Sep 2026 19:33:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdZR-00000004NSM-3GMH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:32:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EDED860234;
	Tue, 29 Sep 2026 19:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EFD1F0089B;
	Tue, 29 Sep 2026 19:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710376;
	bh=JSZ7qhDxfmONH8caf2Y2srBrN3d6GSLhEYO65kvAohk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nii7bSmafSZYnedL7zMMjvXznytZR6n328KIzWlUF0gRK55KL9Z+K/2mDkIsnrfor
	 co9arAt5em4OR5Ps8X8RIaGCVoS7dnySPJanlC8swmwyijuxev/eBfJI/xlG9lmvI/
	 baro/M2dO48MZw3DvXUkvjrBfnShVYXRaHAbisCoGgFzyGJPfPxltwL4gpivreJNVS
	 nLTQ26KmX50rDqfhAH/l+GUwq7W4hpT3KPlRa4NvRe674eNl7WTUWdCFoOVS8bbFNF
	 dzusokoa44Zj3xf8h77MUuyRO/m4RfKlV3isCWGIIpN/ky7KuNIWYTt9XaAQYjaMSR
	 mHPL/a+ewzDdQ==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] KVM: arm64: vgic-v3: Make LPI disabling robust (and more)
Date: Tue, 29 Sep 2026 12:32:53 -0700
Message-ID: <179071036888.5634.9129214925102842960.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929093548.3598547-1-maz@kernel.org>
References: <20260929093548.3598547-1-maz@kernel.org>
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

On Tue, 29 Sep 2026 10:35:41 +0100, Marc Zyngier wrote:
> This is v2 of this series addressing shortcomings of LPIs being
> disabled on one CPU from another. It has now expanded into some more
> common areas.
> 
> Yuchao Zhang reported that disabling LPIs on one CPU from another
> could result in UAFs and other horrors.
> 
> [...]

Applied to fixes, thanks!

[3/7] KVM: arm64: vgic: Allow last_lr_irq to be NULL when LRs are not overflowing
      https://git.kernel.org/kvmarm/kvmarm/c/e079ef0b1c40
[4/7] KVM: arm64: vgic: Take a refcount on IRQs referenced by last_lr_irq
      https://git.kernel.org/kvmarm/kvmarm/c/19bc5d79ece6
[6/7] KVM: arm64: vgic-its: Fix MOVALL handling of source redistributor
      https://git.kernel.org/kvmarm/kvmarm/c/751f4641560b

--
Best,
Oliver

