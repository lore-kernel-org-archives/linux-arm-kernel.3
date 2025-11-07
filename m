Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04048CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 01:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BT9/kYaBUsvDZ6jQJB9hieiRtpkS6G2Coh0SX63cMl0=; b=PybsIdZuVmMQOhXzPR3gn9lz1P
	cJgp5dTKPnk+BKRvzDOfiGLu3RXyEjLL14zUQ8bIddJQFAMij2knR9BaJhvLP7eTt6BpEAO9YHBau
	1K8dOQluWewJ2Z6XkTyg9/koGRC2OkevX3MnZlNGU+We5MIKJG1akiVn3/4m9l/Xw1c2DTBGc6sSh
	LmEMdzVwny/yZ51rSIZcIyLrAJJ3meSTZ3y35xaWdZbtJ2kn9fWO6gwY9ilqobLbI1B4ty6Wjdgf5
	c5+/Hl3uxvv6hcuGK9eCE8VuZZB+NcA9Y7ZPSKzTJ2zeu830wkyOzXk/atkJnV9LJoz5O2y1/SbmE
	9HycMG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBNY-0000000GW9F-3ctp;
	Fri, 07 Nov 2025 01:35:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBNW-0000000GW8G-0503
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 01:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C85CC409B9;
	Fri,  7 Nov 2025 01:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DACEC116C6;
	Fri,  7 Nov 2025 01:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762479300;
	bh=RhgYGJJVIlLV+16NDohuEfj0KiMHJzVZLFlNY7wo5fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gi5srRG6NAm/xmowx3UzYgAKwRzlNNeYH3VC1F54sacFcNA6ZBwf3WlTC6Dnr+JgX
	 rnKb0LawA9+d/53TLRRfHmf7SlJvZ+4lFppGlBsauI3AOnpK6fjpX44DwNotLNUINC
	 0ND4UneIcQnZUgzO7Rc8MtTBnNkoI7wMCbaSlfM3NJXnaSU4FII/8AmTpyapKJer6+
	 L0+U4p8/Je6J5AH8ktKlfz62c+oNRpbjdo3tcCW4yU+IstiKkT1aSAm5f6lbT063Pd
	 afCaPLn+ZpuSKSHEX/h/aX5MUvER0N3J5tBlO9kXeQfMZPGsCwBNs2QBrPG0onen/M
	 7bN8YthuG0ZSg==
Date: Thu, 6 Nov 2025 17:34:59 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 0/3] KVM: arm64: Fix handling of ID_PFR1_EL1.GIC
Message-ID: <aQ1Mw-DRgBwutLG1@kernel.org>
References: <20251030122707.2033690-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030122707.2033690-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_173502_086739_9E700571 
X-CRM114-Status: GOOD (  10.83  )
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

On Thu, Oct 30, 2025 at 12:27:04PM +0000, Marc Zyngier wrote:
> Peter reported[0] that restoring a GICv2 VM fails badly, and correctly
> points out that ID_PFR1_EL1.GIC isn't writable, while its 64bit
> equivalent is. I broke that in 6.12.
> 
> The other thing is that fixing the ID regs at runtime isn't great.
> specially when we could adjust them at the point where the GIC gets
> created.
> 
> This small series aims at fixing these issues. I've only tagged the
> first one as a stable candidate. With these fixes, I can happily
> save/restore a GICv2 VM (both 32 and 64bit) on my trusty Synquacer.

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

