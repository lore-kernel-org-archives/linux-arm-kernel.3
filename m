Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1297FC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P98ik4Rx2MSjF5gYo78AhZnZ67Wun1nVYi3wDphvkyQ=; b=uRhLZTTjxbHRAJNiC6aKAwDFzZ
	mHahWGg2W5z3ReNvhKM9N45i8tLztl0L9qz02HrWfmVdM30Z1/1t3L+skivy+yKMJQQEDMRm/cYPd
	fk3oGroPO0KQx5zo1WGIhgyw6a5EQ22m/BU8h6i80Gg3YsF0wR4ZgngfXIIgIJ5nZVabji9fFqT7k
	EAF9dMLq58mDq81KvWGGuGpibZACoufCVmptIduPU4Rv35s0AF55LZfaqR5kQsuR1kXEQDW4+KEuG
	I4ZZjCZqugUMa80843GONnOrxvZdxJWl6M+gTOUKHMuK3+KFUIweIFQ6QjFtVwLXS11fvqt30/tQ+
	gdsDsB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56TD-0000000HUgT-2qSA;
	Fri, 11 Sep 2026 18:59:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56TB-0000000HUg8-0Rbr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 18:59:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 484581477;
	Fri, 11 Sep 2026 11:59:23 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 035873F7B4;
	Fri, 11 Sep 2026 11:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789153166; bh=+8g1zYfV+MqP/XVrXDogisrA+xn3PtXe8rEowf+uAHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ik2q7jxmZUlUQgLOnijwkrlcbYbUaprkqRz02YZdoOtjfNkvAWALo7KkgbMfpfSYF
	 5khDKX9d7ji4DtxIcIXo7jGqb+zmK/Cn2IFgA1l8DEuJJZJbqZOpb2RAVCz5KxPLki
	 Lk1Kxlta61VcAk5TTWLOCcvzZSUby+04ueiTzjJ4=
Date: Fri, 11 Sep 2026 19:59:16 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, ljs@kernel.org, 
	Shen Yongchao <grayhat@foxmail.com>, Karl Mehltretter <kmehltretter@gmail.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v4 2/2] KVM: arm64: nv: Delay freeing of shadow S2
 structures until VM destruction
Message-ID: <nmzxx2xi7cgzu3aswov2h7abzytbbirw4gzove5yfm3q5x72of@dwjxd6ut24ew>
References: <20260911162203.1919330-1-maz@kernel.org>
 <20260911162203.1919330-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911162203.1919330-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_115929_182477_252B9815 
X-CRM114-Status: GOOD (  11.77  )
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

On Fri, Sep 11, 2026 at 05:22:03PM +0100, Marc Zyngier wrote:
> We free the shadow S2 structures from kvm_arch_flush_shadow_all(), which
> is a Bad Idea(tm). Freeing the page tables is fair game (this is what
> this callback is for), but freeing the container that could still be
> referenced by another part of the system is not great.
> 
> Instead, grow separate destructors that gets called when we tear the VM
> down for good. From there, we can nuke both the individual MMUs as well
> as the global array that points to them, safe in the knowledge that the
> vcpus themselves have been destroyed already.
> 
> Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>

> ---

[...]


