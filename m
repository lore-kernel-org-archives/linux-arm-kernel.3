Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D551C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg4F0k6m+4+kzUXRLBavhu3U7lVZddOyXeiUGCg25js=; b=1/u2RKd8lPinq5DjgGP9UqJsOW
	cBccb2JzHST3b8qrLrN3qK+HW72f5UHGW8vxOaMdZFIDohU8IzwOx0Fx1JEhAO8tyuTpMNHbZc4RF
	gQ58+AfjfO/s284Ln0sRxg1gZPFDQ24zhTiW5iYWkOVKop+42KNY5TALs+do9tD2vJ79vhI/TxQG9
	jl96d8iPWHAvFVwAxA59ZSCoyrZxI5ptODqpbjMgzufhMV+6mniQpejk08bbjpoK1/2/GV4btMPPe
	2j1XZaDVsKkiPBo1/yzpjZee4QrEIMhXDuJnPx93K8DyUVTsMyOer+YvQntCJMsUpt1prPG81VxoR
	DGduUarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wrl-0000000GAQi-1k2l;
	Fri, 11 Sep 2026 08:44:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wrk-0000000GAQS-0k0c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:44:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BEFB940C1E;
	Fri, 11 Sep 2026 08:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493C41F000FF;
	Fri, 11 Sep 2026 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116251;
	bh=vg4F0k6m+4+kzUXRLBavhu3U7lVZddOyXeiUGCg25js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O8LgwFy42EhGdTvVn3EhBaT0y7CkuGzg0ms4nYS/vmCIFDDimi6eIzv4AkEWKgqms
	 NqGCc+KcmrlqlgNtlz+n2ZAn4mt+1d8Bp4pARgvV6UsRPlOL3iAudNnMeciIWjKC2g
	 486vaVWTK2vW3Ce1Dm30Xl8nAZ/wEBCEXjyK94T711Dc/0VHsFU/6aSgynNNqRxpf3
	 jUhoSBJLZ+TLgVKvf4VfidcqsZ5rYg5XPEDJQ+S6G75ShYzOAq41nS1ot45lnbwUV9
	 hu0hOO4mEzBDl9SIyLCAAQzW4jVsQwHfyNqVmRRU3S1ewkAB5uqLuUA2BaFjAaBLi+
	 sYgWQPd8DNDsg==
Date: Fri, 11 Sep 2026 09:44:04 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jonathan Davies <jonathan.davies@nutanix.com>
Cc: catalin.marinas@arm.com, christoffer.dall@arm.com, 
	fuad.tabba@linux.dev, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	seiden@linux.ibm.com, stable@vger.kernel.org, suzuki.poulose@arm.com, 
	weilin.chang@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 2/2] KVM: arm64: nv: Fix null ptr deref on nested
 wp/unmap, teardown race
Message-ID: <aqO_SORFOAXDyXw_@gremlin>
References: <20260901-kvm-arm-nested-virt-fix-v3-2-b154676f7e4c@kernel.org>
 <9829c704-9592-4235-b97c-dc1f5e4ea795@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9829c704-9592-4235-b97c-dc1f5e4ea795@nutanix.com>
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

On Fri, Sep 11, 2026 at 09:12:20AM +0100, Jonathan Davies wrote:
> On Tue, 01 Sep 2026, "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> > This means that stage2_apply_range() can drop the kvm->mmu_lock and
> > thus concurrent progress can be made in lockstep with
> > kvm_arch_flush_shadow_all().
> >
> > If kvm_arch_flush_shadow_all() advances ahead of stage2_apply_range()
> > and completes its operation it guarantees a NULL pointer deref.
>
> I've reproducibly hit exactly this problem when running nested guests
> with concurrent memory compaction on the L0 host. This patch fixes it
> for me perfectly (applied to a 6.18 kernel).
>
> So, for what it's worth:
>
> Tested-by: Jonathan Davies <jonathan.davies@nutanix.com>

Amazing, thanks :)

--
Cheers, Lorenzo

