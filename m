Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7ECCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0SVCm7SEZXoICtmV5FAXZ/yD9EVAjc3rWJYlTDiVUY=; b=dZQeeL9ba0ITUpLX+aNVDF4IVY
	/2H+Jc2R/6Zhr4VhfX8edg9puX0EpAjPHULTZyppLxsJMDfgrG5Ulw2HzOEUYwNga/y+qdaO0YnWS
	1sIfRSAaNRGHvxs1C57KGzdekxM3q0cZVYPnderLEl+YDb++KMTljNb/kHlfyrRxDkP3+tBfdmfWZ
	B1P/uZFSxHmKWc7/Ym61VCVmhxIe3Hs1h+ArjNo6htjqqF0r4cOezS3qyUvlgpAhcqFdyzZcN4t/A
	rhoN4vgmx7YIv4rfKLOicEdWS0os9e8pY9PtBRZ5T5PT9rvNJ8aBP2EZPmseDHVEFMFLoYyeJSU5M
	Qm+eR3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB0r-0000000Bvmf-02px;
	Mon, 01 Jun 2026 22:21:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB0q-0000000BvmZ-0Iy4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 22:21:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06ED66001A;
	Mon,  1 Jun 2026 22:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7471F00898;
	Mon,  1 Jun 2026 22:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780352494;
	bh=B0SVCm7SEZXoICtmV5FAXZ/yD9EVAjc3rWJYlTDiVUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FO30NeW3IiycMzccgbKyF136jQbUhogNBuaYF3sSDrN1L8aFgM7xqaXwM/DfYGERH
	 k5Nfq3IdayKLJ1HYoE4Icw3uqwKIrIaJNIZtD98uIFuU48gEb658INjf7fyZvYQmgm
	 qbb8CBwtvqv87pwpPcem99exoKXwLdJqqtIHVg/2pcp2q2fOnHS9gBy1ZPNjRbEkTx
	 Fs++SCYQYGlglnQwYOQkejAFzigr3Yi95nqTwyfekLgdV3k92NNg0eWLNDysvS54rP
	 8+5c4SMx2dmxK/8vERmNjh3JoWo9InNv+S9Gb9LYvQ+IhBClQ/nHBjJ8P0AKWxHfjy
	 qExDSSvWzDAZg==
Date: Mon, 1 Jun 2026 15:21:33 -0700
From: Oliver Upton <oupton@kernel.org>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v1 10/26] KVM: arm64: Fix set_oslsr_el1 to write to
 OSLAR_EL1
Message-ID: <ah4F7dAEA7LFz5fN@kernel.org>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
 <20260529155601.2927240-11-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529155601.2927240-11-seiden@linux.ibm.com>
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

Hi,

On Fri, May 29, 2026 at 05:55:43PM +0200, Steffen Eiden wrote:
> From: Andreas Grapentin <gra@linux.ibm.com>
> 
> The set_oslsr_el1() function was incorrectly writing directly to the
> OSLSR_EL1 register, which is architecturally a read-only status register
> that reflects the state of the OS Lock.
> 
> Fix this by extracting the OSLK bit from the user-provided value and
> writing it to OSLAR_EL1 (OS Lock Access Register) instead, which is the
> proper control register for managing the OS Lock state. OSLSR_EL1 will
> then reflect this state when read.
> 
> This ensures the implementation follows the ARM architecture
> specification where OSLAR_EL1 controls the lock and OSLSR_EL1 provides
> status information.
> 
> Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

The current behavior of KVM is correct. KVM treats OSLSR_EL1 as the
stateful representation of the OS lock and is RO from the guest POV.

We keep the UAPI straightforward by making this register RW from
userspace, such that the VMM can directly write back the value returned
from KVM_GET_ONE_REG.

Do you have another reason for using OSLAR_EL1 as the canonical
representation?

Thanks,
Oliver

