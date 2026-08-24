Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3420EC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2URyPiTE9DqDInlTIyU81XWFuh1tNvRjD/s5w67S4U=; b=ZYpAVR1eLJDc+N9CBlkjNuuNlD
	hj8iTpluYn3egA+nzwK04KImXAuSlxemc5sF32SnUME/8IiGsWrEwEeZYanf6IVGtMwVPUY7qnsKZ
	z8Czei43liJAiqt5DN+HDh8JAaxO3bRBdyhh6J/9/3qcou2OYEHYRdppLUhANXVw091TBslniI2K8
	f5xq2eLlrcYE+uJHDMQ9F/idKasUn1JYq2DzQiBO+00NG+RD31rCgzg2Q0fN5NiN2vBUcVAHRH+xB
	6pVIJLDAGMUCWgx/qDriFLQa1lmzL98qzFDp6+rVnKRtmE++1BXt9xfaXab1W3YY/S+sYqGAh/1Kk
	WWNiVDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYZN-0000000HB2K-3ACx;
	Mon, 24 Aug 2026 17:34:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYZL-0000000HB1m-47yp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:34:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C0AE60120;
	Mon, 24 Aug 2026 17:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448B41F000E9;
	Mon, 24 Aug 2026 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787592887;
	bh=q2URyPiTE9DqDInlTIyU81XWFuh1tNvRjD/s5w67S4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DBpjK7Ss7t+ODnO+95kIf028bJZfCfXMED32n/xj0GiMowpHQJbS8/L6qacYck4GG
	 pK8S73t8R6VSFQEe2lMB/TiBiM2JZBiHM7jSYX5qhNBURZQ/FrVAwS87iufwaB0ZZz
	 7LXrnaomjC7G1EpDvws/cs5wDAZjhJTr255W/jZ1RcdkTod0UYqOcoFEELkLakYDY/
	 OeWUgbrSpzoukARYrnu+GZ6NC++kGFJ+yJURkT1QLXFzpTG6IWSjUe2YOklOsqalvK
	 LtIAswW9r2x0bBGzSM1W2IkTher2lgBACPGPQc8BRXAb4mBv3AdE8pgiCeJmAe3//X
	 Jb8p1fjkYXNEQ==
Date: Mon, 24 Aug 2026 18:34:42 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christoffer Dall <christoffer.dall@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] KVM: arm64: Fix spurious warn, null ptr deref on
 S2 teardown race
Message-ID: <aox6a50IKICiQ7EX@gremlin>
References: <20260822-kvm-arm-nested-virt-fix-v2-0-ac4059a0eaa6@kernel.org>
 <87tsolnuh0.wl-maz@kernel.org>
 <aoxD4omq8gKYdFKL@gremlin>
 <87ecfno6kh.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecfno6kh.wl-maz@kernel.org>
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

On Mon, Aug 24, 2026 at 04:56:46PM +0100, Marc Zyngier wrote:
> On Mon, 24 Aug 2026 14:15:29 +0100,
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> > > With the commit message for patch #1 trimmed to something that fits on
> > > a couple of standard terminal screens ;-) :
> >
> > Haha sure will put it on a diet and respin :)
>
> Oliver can probably do so when applying the series.

Even better :) though Yao raised a good point on the 1/2 so maybe better for me
to respin with that applied? Or could do as a follow-up.

>
> Thanks,
>
> 	M.
>
> --
> Jazz isn't dead. It just smells funny.

--
Cheers, Lorenzo

