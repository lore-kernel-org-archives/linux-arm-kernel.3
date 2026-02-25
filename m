Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F064FD45EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCR/+Z6wHp+tonnm7h3dc8Bvj+cgyVJRyRBDyD/55rg=; b=oObdU6zhCS17SKLPAWtbkQfbNc
	Adosua/l0cokw9hvt9UThhnXVeJtXT8QAuhmo22GK5ejy0TwBWxtJCyT6ByKyYI0pgb+4KJ03QscV
	WFpLnhCuKRcq81OS5luo75+QIQt6+6yW/FTuWi9TYulEtxzZgDQXUOO3FTFa5xbZ+EZ+CjoQqdtkN
	54rK/U3Z7NrkUyeY+95W1LV35l694aAB5kKBvng3ADCpjOyGuUSBaqq02pc9TP2/y4XiLPF9FH4tX
	af63GLZhssR1XoLQr2o+k5h1+yR+4llHmdsL+I24UBF12l7gNtyX5qXQiH9VtM9FBmFaya78bRR2+
	vSgACK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLgv-00000004sCT-3wjR;
	Wed, 25 Feb 2026 20:41:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLgq-00000004sCK-47re
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 20:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FEA160054;
	Wed, 25 Feb 2026 20:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8A2C116D0;
	Wed, 25 Feb 2026 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772052059;
	bh=z0Y3De4Uk2isfGH9NA9irLH/p0Xi9/d3jhSxem3V0qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4EsyawRbjvuMG24b6o867TcLWDVI5T2q5/PWvvSNtJ+66Jb7JwoxMEJ7wdzjR316
	 TGgEFFfHcKDpYRD4T3RL8IuT+FlFuhkzb994WOV2pDGuT4K3CXvyTvVA4pojOAXgbS
	 va4WC+kD4r+/Tw4SHhbPG9JmEGh83LaefV3Pv1oYTOG2+t4KXnrcSTy3jLodqXrNxb
	 wZgGhyZRJC5q9eNTuCDWHbHU1tdhNEW28KQyQZtdP2ImAJop1xPf/X5aQQvbc949wq
	 V+L/MtAG+K6n5z+tsA/Ls2bLsxZLYBq1aCQ6cNBFJQyC2TrfLeRVkzvZ8XFMiJqDSG
	 fI+fsCmIDNRfw==
Date: Wed, 25 Feb 2026 12:40:59 -0800
From: Kees Cook <kees@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Keir Fraser <keirf@google.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: vgic: Handle const qualifier from
 gic_kvm_info allocation type
Message-ID: <202602251238.9850FCB@keescook>
References: <20260206223022.it.052-kees@kernel.org>
 <177099499992.1792318.9934885934778681296.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177099499992.1792318.9934885934778681296.b4-ty@kernel.org>
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

On Fri, Feb 13, 2026 at 03:03:24PM +0000, Marc Zyngier wrote:
> On Fri, 06 Feb 2026 14:30:23 -0800, Kees Cook wrote:
> > In preparation for making the kmalloc family of allocators type aware,
> > we need to make sure that the returned type from the allocation matches
> > the type of the variable being assigned. (Before, the allocator would
> > always return "void *", which can be implicitly cast to any pointer type.)
> > 
> > The assigned type is "struct gic_kvm_info", but the returned type,
> > while matching, is const qualified. To get them exactly matching, just
> > use the dereferenced pointer for the sizeof().
> > 
> > [...]
> 
> Applied to fixes, thanks!
> 
> [1/1] KVM: arm64: vgic: Handle const qualifier from gic_kvm_info allocation type
>       commit: ee5c38a8d31e5dea52299c43c2ec3213351ab6e1

Just a heads-up that I ended up sending this patch to Linus for -rc1 as
it was a prerequisite for the tree-wide kmalloc_obj refactoring. Sorry
for any merge conflicts this might create for your tree! It is now
commit c732084c891d there.

-- 
Kees Cook

