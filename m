Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2487C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHVh8f+CDiS52n2nqmGCKgqcZPhJmTUHAloQj6QXyZ0=; b=EzZIKm5DidqNhBFvVhpLw0rCVL
	9b1EnTOLJ9eK4vXTzMwO5T7dfxVG5VnHNsCC/LRzt8RdS8SyC6KO/RoPg3JU/mtUGc3dezr5cA1x/
	4/mOZ22kv18BBNEfLONFFQ/YcyWUu6uv028jvTU1jc9wI8zfETuQ5RHzMqrnn2k/tcDKoKdzDBxre
	4RJWsNxViWtGTq+N1vlO+x2CKLgrp6teCuJOY2iZCcDrHAf15u1cGeE2cwwjHrQECYtdEbv7O5eYi
	IjRczLZHyOBEPvE9z8RPMrcImSBHYLMNO2kryzb4bH46tmeQi/KrJFT/EbjtoBv1jLETOgC6VSL6e
	gKbitgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cPp-00000001x88-1duw;
	Mon, 21 Sep 2026 11:42:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cPl-00000001x7Z-166k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:42:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 545D3600C8;
	Mon, 21 Sep 2026 11:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D0F1F000FF;
	Mon, 21 Sep 2026 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789990948;
	bh=KHVh8f+CDiS52n2nqmGCKgqcZPhJmTUHAloQj6QXyZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YTnV8SbqTR/BakhRDkRQmybmJEwfKh9yeygyfrBF1/qxOzvFaK2suFVsN191DgMZJ
	 +X6BOChoAvJtOJyUehk26jNgxpD1uG9vLhU6eh0wEpTJkxlhVtDO1z00JMCJu6wHcE
	 TjmCy4wOAfMSN/A0wkRMY/5Md2QfRdY9QYLTpmy2IKKzRhfbUKj5w5Nf5Es3OBdV7r
	 FbSY6kdl/7qqi2ZHeSN8sNiEw6+MfLmhEA8Xoi1j3CEO4Sd4sstfAXDOtxzQd0glzP
	 XDetAxSsy0Ia54FdPWm2Qx9sHCeqAab8YVsAxP6M9D+7nQ9urPEyBqb6FNF4Mgw8YD
	 ZVe56C9QpGADg==
Date: Mon, 21 Sep 2026 12:42:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Jack Thomson <jackabt@amazon.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Restore the VM's feature bitmap when
 kvm_setup_vcpu() fails
Message-ID: <arEWo3yDYkWp55sF@gremlin>
References: <20260921063718.1604533-1-fuad.tabba@linux.dev>
 <arDYHSlFHm_XzGvN@kernel.org>
 <CA+EHjTz0-qS8RRhdT8XjAgWqKhgjjzbRsZ_jwTBVqM-8pXk7Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTz0-qS8RRhdT8XjAgWqKhgjjzbRsZ_jwTBVqM-8pXk7Vw@mail.gmail.com>
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

On Mon, Sep 21, 2026 at 08:24:56AM +0100, Fuad Tabba wrote:
> Hi Oliver,
>
> On Mon, 21 Sep 2026 00:09:17 -0700, Oliver Upton <oupton@kernel.org> wrote:
> [...]
> > > Nothing in the tree loads a vCPU whose init failed, so this is latent.
> > > The upcoming series that enables KVM_PRE_FAULT_MEMORY for arm64 exposes
> > > it: the generic kvm_vcpu_pre_fault_memory() calls vcpu_load() whether
> > > or not the vCPU has been initialised.
> >
> > That's a bug, not a feature. We should require an initialized vcpu for
> > the ioctl.
>
> That one is for Lorenzo then :) I'll reword the message so the stale
> bitmap comes first and the pre-fault crash is just how it showed up.

Let me dig into this.

--
Cheers, Lorenzo

